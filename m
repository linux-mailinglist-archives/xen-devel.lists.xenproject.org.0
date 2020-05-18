Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BBA1D7B37
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 16:27:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jagjo-0005XY-VC; Mon, 18 May 2020 14:27:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVld=7A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jagjn-0005XR-Rw
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 14:27:27 +0000
X-Inumbo-ID: b291ff14-9913-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b291ff14-9913-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 14:27:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8F06FAFBF;
 Mon, 18 May 2020 14:27:28 +0000 (UTC)
Subject: Re: [PATCH v9 04/12] xen: add basic hypervisor filesystem support
To: Juergen Gross <jgross@suse.com>
References: <20200515115856.11965-1-jgross@suse.com>
 <20200515115856.11965-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d991fb07-5e86-f5b3-b8df-6726f5b0030d@suse.com>
Date: Mon, 18 May 2020 16:27:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515115856.11965-5-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.05.2020 13:58, Juergen Gross wrote:
> --- /dev/null
> +++ b/xen/common/hypfs.c
> @@ -0,0 +1,418 @@
> +/******************************************************************************
> + *
> + * hypfs.c
> + *
> + * Simple sysfs-like file system for the hypervisor.
> + */
> +
> +#include <xen/err.h>
> +#include <xen/guest_access.h>
> +#include <xen/hypercall.h>
> +#include <xen/hypfs.h>
> +#include <xen/lib.h>
> +#include <xen/rwlock.h>
> +#include <public/hypfs.h>
> +
> +#ifdef CONFIG_COMPAT
> +#include <compat/hypfs.h>
> +CHECK_hypfs_dirlistentry;
> +#endif
> +
> +#define DIRENTRY_NAME_OFF offsetof(struct xen_hypfs_dirlistentry, name)
> +#define DIRENTRY_SIZE(name_len) \
> +    (DIRENTRY_NAME_OFF +        \
> +     ROUNDUP((name_len) + 1, alignof(struct xen_hypfs_direntry)))
> +
> +static DEFINE_RWLOCK(hypfs_lock);
> +enum hypfs_lock_state {
> +    hypfs_unlocked,
> +    hypfs_read_locked,
> +    hypfs_write_locked
> +};
> +static DEFINE_PER_CPU(enum hypfs_lock_state, hypfs_locked);
> +
> +HYPFS_DIR_INIT(hypfs_root, "");
> +
> +static void hypfs_read_lock(void)
> +{
> +    read_lock(&hypfs_lock);
> +    this_cpu(hypfs_locked) = hypfs_read_locked;
> +}

Perhaps at least

    ASSERT(this_cpu(hypfs_locked) != hypfs_write_locked);

first thing in the function?

> +static void hypfs_write_lock(void)
> +{
> +    write_lock(&hypfs_lock);
> +    this_cpu(hypfs_locked) = hypfs_write_locked;
> +}

If so,

    ASSERT(this_cpu(hypfs_locked) == hypfs_unlocked);

here then.

> +static struct hypfs_entry *hypfs_get_entry_rel(struct hypfs_entry_dir *dir,
> +                                               const char *path)
> +{
> +    const char *end;
> +    struct hypfs_entry *entry;
> +    unsigned int name_len;
> +    bool again = true;
> +
> +    while ( again )
> +    {
> +        if ( dir->e.type != XEN_HYPFS_TYPE_DIR )
> +            return NULL;
> +
> +        if ( !*path )
> +            return &dir->e;
> +
> +        end = strchr(path, '/');
> +        if ( !end )
> +            end = strchr(path, '\0');
> +        name_len = end - path;
> +
> +	again = false;

Hard tab slipped in.

With at least the latter taken care of, non-XSM pieces
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

