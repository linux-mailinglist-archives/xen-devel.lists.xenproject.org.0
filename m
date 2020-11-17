Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 721842B672B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 15:14:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29014.58181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf1k0-0007BQ-73; Tue, 17 Nov 2020 14:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29014.58181; Tue, 17 Nov 2020 14:13:52 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kf1k0-0007B1-3y; Tue, 17 Nov 2020 14:13:52 +0000
Received: by outflank-mailman (input) for mailman id 29014;
 Tue, 17 Nov 2020 14:13:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kf1jy-0007Aw-PG
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:13:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 643ef3da-e864-44e7-b168-0691a12c2a37;
 Tue, 17 Nov 2020 14:13:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1159CADCF;
 Tue, 17 Nov 2020 14:13:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=+6JM=EX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kf1jy-0007Aw-PG
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 14:13:50 +0000
X-Inumbo-ID: 643ef3da-e864-44e7-b168-0691a12c2a37
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 643ef3da-e864-44e7-b168-0691a12c2a37;
	Tue, 17 Nov 2020 14:13:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605622428; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DN93mxkfRlJGtt4PZwPWnTGvGvL74z0+Nib5KrFXMn0=;
	b=NcFJgKNu9UxW9qxtviuuE1jLe7sLTTdk9GRUhzywDdeSmxwPKxaUZgdVbcBDCz4DkKBJvm
	JyMatCifVIY/NIsEdjO1S+T4R/SuaGMyOo5zrUKkj2oo7snBcrKedRdxflMCqrGKOaTD1x
	aGwIW4ZjMqrhehGE3LQk4Onlt2HStOQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1159CADCF;
	Tue, 17 Nov 2020 14:13:48 +0000 (UTC)
Subject: Re: [PATCH 10/12] xen/hypfs: add cpupool directories
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-11-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c199e96-c686-2045-8972-036e69600873@suse.com>
Date: Tue, 17 Nov 2020 15:13:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201026091316.25680-11-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.10.2020 10:13, Juergen Gross wrote:
> @@ -992,6 +994,78 @@ static struct notifier_block cpu_nfb = {
>      .notifier_call = cpu_callback
>  };
>  
> +#ifdef CONFIG_HYPFS
> +static HYPFS_DIR_INIT(cpupool_pooldir, "id");

This "id" string won't appear anywhere, will it? I would have
expected this to act as the format string used when generating
names of the dynamic entries. This would e.g. allow CPU pools
to have decimal numbered names, but other entries also hex
ones, and then if so desired also e.g. with leading zeros.

> +static int cpupool_dir_read(const struct hypfs_entry *entry,
> +                            XEN_GUEST_HANDLE_PARAM(void) uaddr)
> +{
> +    int ret = 0;
> +    struct cpupool **q;

I was going to ask for const here, but the way for_each_cpupool()
works looks to prohibit this. Nevertheless I wonder whether the
extra level of indirection there wouldn't better be dropped. Of
the users, only cpupool_destroy() looks to need it, so open-
coding the loop there (or introducing an auxiliary variable)
would allow improvements here and elsewhere. (Actually I notice
there's also a similar use in cpupool_create(), but the general
consideration remains.)

> +    spin_lock(&cpupool_lock);
> +
> +    for_each_cpupool(q)
> +    {
> +        ret = hypfs_read_dyndir_id_entry(&cpupool_pooldir, (*q)->cpupool_id,
> +                                         !(*q)->next, &uaddr);
> +        if ( ret )
> +            break;
> +    }
> +
> +    spin_unlock(&cpupool_lock);
> +
> +    return ret;
> +}
> +
> +static unsigned int cpupool_dir_getsize(const struct hypfs_entry *entry)
> +{
> +    struct cpupool **q;
> +    unsigned int size = 0;
> +
> +    spin_lock(&cpupool_lock);
> +
> +    for_each_cpupool(q)
> +        size += HYPFS_DIRENTRY_SIZE(snprintf(NULL, 0, "%d", (*q)->cpupool_id));

Beyond the remark above I consider this problematic: If the pool
ID was negative, the use of %d here would get things out of sync
with the %u uses in hypfs.c. I guess exposing
HYPFS_DIRENTRY_SIZE() isn't the right approach, and you instead
need another hypfs library function.

> +static struct hypfs_entry *cpupool_dir_findentry(struct hypfs_entry_dir *dir,
> +                                                 const char *name,
> +                                                 unsigned int name_len)
> +{
> +    unsigned long id;
> +    const char *end;
> +    struct cpupool *cpupool;
> +
> +    id = simple_strtoul(name, &end, 10);
> +    if ( id > INT_MAX || end != name + name_len )

What does this INT_MAX match up with? Afaics
XEN_SYSCTL_CPUPOOL_OP_CREATE is fine to have an effectively
negative pool ID passed in (the public interface struct uses
uint32_t, but this gets converted to plain int first thing in
the sysctl handler).

> +        return ERR_PTR(-ENOENT);
> +
> +    spin_lock(&cpupool_lock);
> +
> +    cpupool = __cpupool_find_by_id(id, true);
> +
> +    spin_unlock(&cpupool_lock);
> +
> +    if ( !cpupool )
> +        return ERR_PTR(-ENOENT);
> +
> +    return hypfs_gen_dyndir_entry_id(&cpupool_pooldir, id);

The latest this one makes clear that cpupool_lock nests inside
the hypfs one. I think this wants spelling out next to the
definition of the former, as it implies that there are
restrictions on what can be done from inside cpupool-locked
regions. hypfs_read_dyndir_id_entry(), for example, has to
remain lock free for this reason.

Jan

