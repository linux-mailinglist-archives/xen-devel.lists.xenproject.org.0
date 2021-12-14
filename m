Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C2F4746F2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 16:57:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246867.425751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxA9n-00067Z-2J; Tue, 14 Dec 2021 15:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246867.425751; Tue, 14 Dec 2021 15:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxA9m-000650-Vb; Tue, 14 Dec 2021 15:55:58 +0000
Received: by outflank-mailman (input) for mailman id 246867;
 Tue, 14 Dec 2021 15:55:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mxA9l-00064u-C1
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 15:55:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxA9k-0002lj-2U; Tue, 14 Dec 2021 15:55:56 +0000
Received: from [54.239.6.190] (helo=[192.168.26.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mxA9j-00035B-T2; Tue, 14 Dec 2021 15:55:56 +0000
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
	bh=bQRLehkTctN+flDSJ3RcpkVsQ+aEPcvXozrvdMCubdE=; b=0RXJvPJYN+2d0Aa2ekBDCoxEz5
	B+KVQDm2rtcGOQJTXrQEfJ8zcpkO3dY8Gp+msNSD4vD7sx1JkETUl+0Bk79HkmGY6So9cYYqstAyZ
	rnsN0bTtODiafpP1aMM21aQASCZCt7axoDsaRR0vd3bnWjlg4oruEVCYVO1P1hMuZpNo=;
Message-ID: <d41a193f-5b76-eeeb-2db8-e859136d1dc5@xen.org>
Date: Tue, 14 Dec 2021 15:55:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH] Arm: drop memguard_{,un}guard_range() stubs
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <11f9f2e5-102a-247b-368b-29021f5e7a84@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <11f9f2e5-102a-247b-368b-29021f5e7a84@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/12/2021 15:16, Jan Beulich wrote:
> These exist for no reason: The code using them is only ever built for
> Arm32. And memguard_guard_stack() has no use outside of x86-specific
> code at all.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> 
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2152,8 +2152,6 @@ void init_xenheap_pages(paddr_t ps, padd
>       if ( !is_xen_heap_mfn(maddr_to_mfn(pe)) )
>           pe -= PAGE_SIZE;
>   
> -    memguard_guard_range(maddr_to_virt(ps), pe - ps);
> -
>       init_heap_pages(maddr_to_page(ps), (pe - ps) >> PAGE_SHIFT);
>   }
>   
> @@ -2169,8 +2167,6 @@ void *alloc_xenheap_pages(unsigned int o
>       if ( unlikely(pg == NULL) )
>           return NULL;
>   
> -    memguard_unguard_range(page_to_virt(pg), 1 << (order + PAGE_SHIFT));
> -
>       return page_to_virt(pg);
>   }
>   
> @@ -2182,8 +2178,6 @@ void free_xenheap_pages(void *v, unsigne
>       if ( v == NULL )
>           return;
>   
> -    memguard_guard_range(v, 1 << (order + PAGE_SHIFT));
> -
>       free_heap_pages(virt_to_page(v), order, false);
>   }
>   
> --- a/xen/include/asm-arm/mm.h
> +++ b/xen/include/asm-arm/mm.h
> @@ -341,10 +341,6 @@ long arch_memory_op(int op, XEN_GUEST_HA
>   
>   unsigned long domain_get_maximum_gpfn(struct domain *d);
>   
> -#define memguard_guard_stack(_p)       ((void)0)
> -#define memguard_guard_range(_p,_l)    ((void)0)
> -#define memguard_unguard_range(_p,_l)  ((void)0)
> -
>   /* Release all __init and __initdata ranges to be reused */
>   void free_init_memory(void);
>   
> 

Cheers,

-- 
Julien Grall

