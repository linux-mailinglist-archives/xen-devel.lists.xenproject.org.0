Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEB27BB4D0
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 12:08:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613472.953992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohkj-0004iC-R0; Fri, 06 Oct 2023 10:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613472.953992; Fri, 06 Oct 2023 10:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qohkj-0004fV-Mb; Fri, 06 Oct 2023 10:08:13 +0000
Received: by outflank-mailman (input) for mailman id 613472;
 Fri, 06 Oct 2023 10:08:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qohki-0004fP-72
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 10:08:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qohkh-0002we-1U; Fri, 06 Oct 2023 10:08:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qohkg-0006FO-Pf; Fri, 06 Oct 2023 10:08:10 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=O7HRV5tEZilDlCcLT9m+UxgRAYcNiS/Zg5AwRdXqy9Y=; b=Zi9oiIUxi6ZTHMDVDZKbIfbugL
	PcjfhDWBO6vLFT/vJCXrk5H7kuQnrAk0fnc6R9CDc7iPfTRGDWXKQs7Noc4LTMaN0ju0vUo7otLRO
	tnZDUctYK+ORctR2nzzmXt9o7ZwV0SjF3imOizXOr4fAZnBymNrPEsbSqw6QSC0LzaSY=;
Message-ID: <3880a214-ece2-4654-a94e-04f2e1d02353@xen.org>
Date: Fri, 6 Oct 2023 11:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] domain: fix misaligned unmap address in
 unmap_guest_area()
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20231006091353.96367-1-roger.pau@citrix.com>
 <20231006091353.96367-2-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231006091353.96367-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 06/10/2023 10:13, Roger Pau Monne wrote:
> unmap_domain_page_global() expects the provided address to be page aligned, or
> else some of the called functions will trigger assertions, like
> modify_xen_mappings() on x86 or destroy_xen_mappings() on Arm.
> 
> The following assert has been reported by osstest arm 32bit tests:
> 
> (XEN) Assertion 'IS_ALIGNED(s, PAGE_SIZE)' failed at arch/arm/mm.c:1243
> (XEN) ----[ Xen-4.18-rc  arm32  debug=y  Not tainted ]----
> (XEN) CPU:    0
> (XEN) PC:     00271a38 destroy_xen_mappings+0x50/0x5c
> [...]
> (XEN) Xen call trace:
> (XEN)    [<00271a38>] destroy_xen_mappings+0x50/0x5c (PC)
> (XEN)    [<00235aa8>] vunmap+0x30/0x1a0 (LR)
> (XEN)    [<0026ad88>] unmap_domain_page_global+0x10/0x20
> (XEN)    [<00208e38>] unmap_guest_area+0x90/0xec
> (XEN)    [<00208f98>] domain_kill+0x104/0x180
> (XEN)    [<00239e3c>] do_domctl+0x8ac/0x14fc
> (XEN)    [<0027ae34>] do_trap_guest_sync+0x570/0x66c
> (XEN)    [<002019f0>] arch/arm/arm32/entry.o#return_from_trap+0/0x4
> 
> Fixes: eadc288cbb0d ('domain: map/unmap GADDR based shared guest areas')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> unmap_domain_page_global() and vunmap() should likely have the same alignment
> asserts, as not all paths lead to detecting the misalignment of the provided
> linear address.  Will do a separate patch.

unmap_domain_page() seems to be able to deal with unaligned pointer. And 
supporting unaligned pointer in vunmap()/unmap_domain_page_global() 
would simplifyy call to those functions.

So I would consider to deal with the alignment rather than adding 
ASSERT() in the two functions. destroy_xen_mappings() and 
modify_xen_mappings() should stay as-is though.

Anyway, I don't think this is a 4.18 material.

> ---
>   xen/common/domain.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index b8281d7cff9d..2dcc64e659cc 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1634,7 +1634,7 @@ void unmap_guest_area(struct vcpu *v, struct guest_area *area)
>   
>       if ( pg )
>       {
> -        unmap_domain_page_global(map);
> +        unmap_domain_page_global((void *)((unsigned long)map & PAGE_MASK));

Looking at the code, I can't find where 'map' may have become unaligned. 
Do you have a pointer?

Depending on the answer, the call in map_guest_area() may also need some 
adjustment.

Cheers,

-- 
Julien Grall

