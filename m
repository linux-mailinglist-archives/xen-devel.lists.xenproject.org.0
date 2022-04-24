Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9024650D2FC
	for <lists+xen-devel@lfdr.de>; Sun, 24 Apr 2022 17:53:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.312157.529344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nieXo-0004US-JF; Sun, 24 Apr 2022 15:53:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 312157.529344; Sun, 24 Apr 2022 15:53:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nieXo-0004SO-GA; Sun, 24 Apr 2022 15:53:04 +0000
Received: by outflank-mailman (input) for mailman id 312157;
 Sun, 24 Apr 2022 15:53:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nieXm-0004SI-Qf
 for xen-devel@lists.xenproject.org; Sun, 24 Apr 2022 15:53:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nieXl-000524-OO; Sun, 24 Apr 2022 15:53:01 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nieXl-0002j8-IA; Sun, 24 Apr 2022 15:53:01 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=fCdHlP4JUGdOgK2VuJATBo5jPRLuWs+P2JtGnZ35zJw=; b=r7Qo3aakDorTGjzYql4DP8DX8I
	8T11xZUdjMo5Dm2RDUiVKss3FrlAF9gBDLS4gBxr9rAYtAZsx1K95whzBoB3EgNR0sQfpa6FHtXlu
	lxbDomtmbdfzo7e/fo0Tt7jM7OPhi6pDpufLfQ99Cskb7O0TvcS3m7bnJGtYvJhMAwYI=;
Message-ID: <c15c5faa-ba5d-4407-e9e8-341f41200d77@xen.org>
Date: Sun, 24 Apr 2022 16:52:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
To: David Vrabel <dvrabel@cantab.net>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>
References: <20220422153601.967318-1-dvrabel@cantab.net>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3] page_alloc: assert IRQs are enabled in heap alloc/free
In-Reply-To: <20220422153601.967318-1-dvrabel@cantab.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi David,

On 22/04/2022 16:36, David Vrabel wrote:
> From: David Vrabel <dvrabel@amazon.co.uk>
> 
> Heap pages can only be safely allocated and freed with interuupts

typo: s/interuupts/interrupts/

> enabled as they may require a TLB flush which will send IPIs.

We don't have such requirements on Arm. Given this is common code, I 
think we should write "which may send IPIs on some architectures (such 
as x86).

That said, I think the change is still a good move on Arm because I 
don't think it is sane to do allocation with interrupts disabled.

> 
> Normally spinlock debugging would catch calls from the incorrect
> context, but not from stop_machine_run() action functions as these are
> called with spin lock debugging disabled.
> 
> Enhance the assertions in alloc_xenheap_pages() and
> alloc_domheap_pages() to check interrupts are enabled. For consistency
> the same asserts are used when freeing heap pages.
> 
> As an exception, when only 1 PCPU is online, allocations are permitted
> with interrupts disabled as any TLB flushes would be local only. This
> is necessary during early boot.
> 
> Signed-off-by: David Vrabel <dvrabel@amazon.co.uk>
> ---
> Changes in v3:
> - Use num_online_cpus() in assert.
> 
> Changes in v2:
> - Set SYS_STATE_smp_boot on arm.
> ---
>   xen/common/page_alloc.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 319029140f..516ffa2a97 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -162,6 +162,13 @@
>   static char __initdata opt_badpage[100] = "";
>   string_param("badpage", opt_badpage);
>   
> +/*
> + * Heap allocations may need TLB flushes which require IRQs to be
> + * enabled (except during early boot when only 1 PCPU is online).

Same remark as above. Also, I think there are other cases where 
num_online_cpus() == 1:
   - Xen is only using one core (it will not be a useful system but 
technically supported)
   - During suspend/resume

So I think we should either relax the comment or restrict the assert 
below. I don't have any preference.

> + */ > +#define ASSERT_ALLOC_CONTEXT() \
> +    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() == 1))
> +
>   /*
>    * no-bootscrub -> Free pages are not zeroed during boot.
>    */
> @@ -2160,7 +2167,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>   {
>       struct page_info *pg;
>   
> -    ASSERT(!in_irq());
> +    ASSERT_ALLOC_CONTEXT();
>   
>       pg = alloc_heap_pages(MEMZONE_XEN, MEMZONE_XEN,
>                             order, memflags | MEMF_no_scrub, NULL);
> @@ -2173,7 +2180,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>   
>   void free_xenheap_pages(void *v, unsigned int order)
>   {
> -    ASSERT(!in_irq());
> +    ASSERT_ALLOC_CONTEXT();
>   
>       if ( v == NULL )
>           return;
> @@ -2202,7 +2209,7 @@ void *alloc_xenheap_pages(unsigned int order, unsigned int memflags)
>       struct page_info *pg;
>       unsigned int i;
>   
> -    ASSERT(!in_irq());
> +    ASSERT_ALLOC_CONTEXT();
>   
>       if ( xenheap_bits && (memflags >> _MEMF_bits) > xenheap_bits )
>           memflags &= ~MEMF_bits(~0U);
> @@ -2224,7 +2231,7 @@ void free_xenheap_pages(void *v, unsigned int order)
>       struct page_info *pg;
>       unsigned int i;
>   
> -    ASSERT(!in_irq());
> +    ASSERT_ALLOC_CONTEXT();
>   
>       if ( v == NULL )
>           return;
> @@ -2249,7 +2256,7 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
>   {
>       mfn_t smfn, emfn;
>   
> -    ASSERT(!in_irq());
> +    ASSERT_ALLOC_CONTEXT();
>   
>       smfn = maddr_to_mfn(round_pgup(ps));
>       emfn = maddr_to_mfn(round_pgdown(pe));
> @@ -2369,7 +2376,7 @@ struct page_info *alloc_domheap_pages(
>       unsigned int bits = memflags >> _MEMF_bits, zone_hi = NR_ZONES - 1;
>       unsigned int dma_zone;
>   
> -    ASSERT(!in_irq());
> +    ASSERT_ALLOC_CONTEXT();
>   
>       bits = domain_clamp_alloc_bitsize(memflags & MEMF_no_owner ? NULL : d,
>                                         bits ? : (BITS_PER_LONG+PAGE_SHIFT));
> @@ -2419,7 +2426,7 @@ void free_domheap_pages(struct page_info *pg, unsigned int order)
>       unsigned int i;
>       bool drop_dom_ref;
>   
> -    ASSERT(!in_irq());
> +    ASSERT_ALLOC_CONTEXT();
>   
>       if ( unlikely(is_xen_heap_page(pg)) )
>       {
> @@ -2738,7 +2745,7 @@ int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
>   {
>       struct page_info *pg;
>   
> -    ASSERT(!in_irq());
> +    ASSERT_ALLOC_CONTEXT();
>   
>       pg = acquire_staticmem_pages(smfn, nr_mfns, memflags);
>       if ( !pg )

Cheers,

-- 
Julien Grall

