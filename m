Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BBD2B04E0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 13:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25769.53751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdBYY-0007d4-B6; Thu, 12 Nov 2020 12:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25769.53751; Thu, 12 Nov 2020 12:18:26 +0000
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
	id 1kdBYY-0007ce-7N; Thu, 12 Nov 2020 12:18:26 +0000
Received: by outflank-mailman (input) for mailman id 25769;
 Thu, 12 Nov 2020 12:18:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kdBYW-0007cZ-6M
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 12:18:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 718c445e-2b73-43e2-b952-ce836629ad12;
 Thu, 12 Nov 2020 12:18:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F9E8AC0C;
 Thu, 12 Nov 2020 12:18:22 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=2UFB=ES=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kdBYW-0007cZ-6M
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 12:18:24 +0000
X-Inumbo-ID: 718c445e-2b73-43e2-b952-ce836629ad12
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 718c445e-2b73-43e2-b952-ce836629ad12;
	Thu, 12 Nov 2020 12:18:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605183502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dGzg1J/ExGX5i1+EK2FTdN5yOYTV85/Pz6cwQFj9vcg=;
	b=XBodNZm7a0eBsL6jMg6AU3NBsKpKtduv/lhbwGPz5HPaqLOwdKhMTU6TKl+1ty2ZzIseTL
	mfeM/LXFdss4MSitMCxW5KMVD7fzhPuOJWJdHlDSoErGmk4x/iZW6fGreNTuIhLatBMNGw
	i3VznvGbN+10majBLIDrTeu8ozknC+Y=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3F9E8AC0C;
	Thu, 12 Nov 2020 12:18:22 +0000 (UTC)
Subject: Re: [PATCH V2 16/23] xen/mm: Handle properly reference in
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
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
 <1602780274-29141-17-git-send-email-olekstysh@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e4c04492-3e99-4578-8f00-e7b35aeb26c5@suse.com>
Date: Thu, 12 Nov 2020 13:18:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.1
MIME-Version: 1.0
In-Reply-To: <1602780274-29141-17-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.10.2020 18:44, Oleksandr Tyshchenko wrote:
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1380,6 +1380,27 @@ int guest_physmap_remove_page(struct domain *d, gfn_t gfn, mfn_t mfn,
>      return p2m_remove_mapping(d, gfn, (1 << page_order), mfn);
>  }
>  
> +int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
> +                          unsigned long gfn, mfn_t mfn)
> +{
> +    struct page_info *page = mfn_to_page(mfn);
> +    int rc;
> +
> +    if ( !get_page(page, fd) )
> +        return -EINVAL;
> +
> +    /*
> +     * It is valid to always use p2m_map_foreign_rw here as if this gets
> +     * called that d != fd. A case when d == fd would be rejected by
> +     * rcu_lock_remote_domain_by_id() earlier.
> +     */

Are you describing things here on the assumption that no new
callers may surface later on? To catch such, I'd recommend
adding at least a respective ASSERT().

> +    rc = guest_physmap_add_entry(d, _gfn(gfn), mfn, 0, p2m_map_foreign_rw);
> +    if ( rc )
> +        put_page(page);
> +
> +    return 0;

I can't imagine it's correct to not signal the error to the
caller(s).

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1099,7 +1099,8 @@ static int acquire_resource(
>       *        reference counted, it is unsafe to allow mapping of
>       *        resource pages unless the caller is the hardware domain.
>       */
> -    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) )
> +    if ( paging_mode_translate(currd) && !is_hardware_domain(currd) &&
> +         !arch_refcounts_p2m() )
>          return -EACCES;

I guess the hook may want naming differently, as both prior parts of
the condition should be needed only on the x86 side, and there (for
PV) there's no p2m involved in the refcounting. Maybe
arch_acquire_resource_check()? And then the comment wants moving into
the x86 hook as well. You may want to consider leaving a more generic
one here...

Jan

