Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE041D2BF0
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 11:56:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZAae-0007oh-Bi; Thu, 14 May 2020 09:55:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZAac-0007oV-Pv
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 09:55:42 +0000
X-Inumbo-ID: 125b135c-95c9-11ea-a464-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 125b135c-95c9-11ea-a464-12813bfff9fa;
 Thu, 14 May 2020 09:55:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 435C7AF8A;
 Thu, 14 May 2020 09:55:43 +0000 (UTC)
Subject: Re: [PATCH v8 04/12] xen: add basic hypervisor filesystem support
To: Juergen Gross <jgross@suse.com>
References: <20200508153421.24525-1-jgross@suse.com>
 <20200508153421.24525-5-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <479b4738-2127-998a-2d8e-c7a9af8ff0a3@suse.com>
Date: Thu, 14 May 2020 11:55:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508153421.24525-5-jgross@suse.com>
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

On 08.05.2020 17:34, Juergen Gross wrote:
> --- /dev/null
> +++ b/xen/include/xen/hypfs.h
> @@ -0,0 +1,122 @@
> +#ifndef __XEN_HYPFS_H__
> +#define __XEN_HYPFS_H__
> +
> +#ifdef CONFIG_HYPFS
> +#include <xen/list.h>
> +#include <xen/string.h>
> +#include <public/hypfs.h>
> +
> +struct hypfs_entry_leaf;
> +
> +struct hypfs_entry {
> +    unsigned short type;
> +    unsigned short encoding;
> +    unsigned int size;
> +    unsigned int max_size;

Btw with these, ...

> +    const char *name;
> +    struct list_head list;
> +    int (*read)(const struct hypfs_entry *entry,
> +                XEN_GUEST_HANDLE_PARAM(void) uaddr);
> +    int (*write)(struct hypfs_entry_leaf *leaf,
> +                 XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned long ulen);

... why unsigned long here (noticed while looking at patch 9)?

Jan

