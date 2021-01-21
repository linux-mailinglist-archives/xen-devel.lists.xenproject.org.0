Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D842FEC7C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 14:59:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72045.129456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2aTA-00032J-Bh; Thu, 21 Jan 2021 13:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72045.129456; Thu, 21 Jan 2021 13:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2aTA-00031w-8Q; Thu, 21 Jan 2021 13:57:52 +0000
Received: by outflank-mailman (input) for mailman id 72045;
 Thu, 21 Jan 2021 13:57:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2aT9-00031r-GA
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 13:57:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9232e66-7fdb-4f1b-a91b-06811c7364a0;
 Thu, 21 Jan 2021 13:57:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25FF3ABD6;
 Thu, 21 Jan 2021 13:57:49 +0000 (UTC)
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
X-Inumbo-ID: a9232e66-7fdb-4f1b-a91b-06811c7364a0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611237469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uPtE8loEaa7vbXLL7rycEljVo4EhvGoxVZmS7eQrimQ=;
	b=s/E7Ffl0asSXSj15ByehDbysvLiTA/Fsz0rhM17wUPkxG+26Qb2E9Bl1MjeScvCkF5XtcK
	Vn9+cQ8SDJSu7r5awrGo88vj1ddn/PWgpnKvES3vD7HLMAJ6L8/SrVpx0Hw1kgy2M4oIU1
	WpxzQ8eVUrKpDNcLWjuXupkxpJp10O4=
Subject: Re: [PATCH V4 16/24] xen/mm: Handle properly reference in
 set_foreign_p2m_entry() on Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
References: <1610488352-18494-1-git-send-email-olekstysh@gmail.com>
 <1610488352-18494-17-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a706a1c-baed-b323-d772-dc35286bb4d2@suse.com>
Date: Thu, 21 Jan 2021 14:57:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610488352-18494-17-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.01.2021 22:52, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch implements reference counting of foreign entries in
> in set_foreign_p2m_entry() on Arm. This is a mandatory action if
> we want to run emulator (IOREQ server) in other than dom0 domain,
> as we can't trust it to do the right thing if it is not running
> in dom0. So we need to grab a reference on the page to avoid it
> disappearing.
> 
> It is valid to always pass "p2m_map_foreign_rw" type to
> guest_physmap_add_entry() since the current and foreign domains
> would be always different. A case when they are equal would be
> rejected by rcu_lock_remote_domain_by_id(). Besides the similar
> comment in the code put a respective ASSERT() to catch incorrect
> usage in future.
> 
> It was tested with IOREQ feature to confirm that all the pages given
> to this function belong to a domain, so we can use the same approach
> as for XENMAPSPACE_gmfn_foreign handling in xenmem_add_to_physmap_one().
> 
> This involves adding an extra parameter for the foreign domain to
> set_foreign_p2m_entry() and a helper to indicate whether the arch
> supports the reference counting of foreign entries and the restriction
> for the hardware domain in the common code can be skipped for it.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> CC: Julien Grall <julien.grall@arm.com>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

In principle x86 parts
Reviewed-by: Jan Beulich <jbeulich@suse.com>
However, being a maintainer of ...

> --- a/xen/include/asm-x86/p2m.h
> +++ b/xen/include/asm-x86/p2m.h
> @@ -382,6 +382,22 @@ struct p2m_domain {
>  #endif
>  #include <xen/p2m-common.h>
>  
> +static inline bool arch_acquire_resource_check(struct domain *d)
> +{
> +    /*
> +     * The reference counting of foreign entries in set_foreign_p2m_entry()
> +     * is not supported for translated domains on x86.
> +     *
> +     * FIXME: Until foreign pages inserted into the P2M are properly
> +     * reference counted, it is unsafe to allow mapping of
> +     * resource pages unless the caller is the hardware domain.
> +     */
> +    if ( paging_mode_translate(d) && !is_hardware_domain(d) )
> +        return false;
> +
> +    return true;
> +}


... this code, I'd like to ask that such constructs be avoided
and this be a single return statement:

    return !paging_mode_translate(d) || is_hardware_domain(d);

I also think you may want to consider dropping the initial
"The" from the comment. I'm further unconvinced "foreign
entries" needs saying when set_foreign_p2m_entry() deals with
exclusively such. In the end the original comment moved here
would probably suffice, no need for any more additions than
perhaps a simple "(see set_foreign_p2m_entry())".

Jan

