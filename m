Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C476819C4
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 20:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487178.754710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMZO3-0002nF-85; Mon, 30 Jan 2023 19:00:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487178.754710; Mon, 30 Jan 2023 19:00:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMZO3-0002l9-4c; Mon, 30 Jan 2023 19:00:15 +0000
Received: by outflank-mailman (input) for mailman id 487178;
 Mon, 30 Jan 2023 19:00:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMZO1-0002l3-9c
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 19:00:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMZO0-0001Ri-E8; Mon, 30 Jan 2023 19:00:12 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMZO0-0005iH-8C; Mon, 30 Jan 2023 19:00:12 +0000
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
	bh=i4UteikAAiy/qR9ogw3voYDumzbXr6mpYdSZf/5RnbU=; b=NHukpuSq32Y3ROVxH8I/yz5mEi
	5fUYf4o5ZCavtNV4RcbvewWUJDzTjPEv7BR3/p+3O3sybyYds0Gd6FWOsTONKw6awX0MJOV8eBBnj
	7EHcJQp/1NYuYtrv1H0uBcCmOlm9ejrbPcbkdhE74TOqKGGv9RhbHmIilEHKKMlXimBM=;
Message-ID: <2edca838-2616-7434-62d7-a69dd9e00797@xen.org>
Date: Mon, 30 Jan 2023 19:00:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] x86: idle domains don't have a domain-page mapcache
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <139bab3a-fd3e-fec2-b7b4-f63dd9f9439a@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <139bab3a-fd3e-fec2-b7b4-f63dd9f9439a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/01/2023 11:09, Jan Beulich wrote:
> First and foremost correct a comment implying the opposite. Then, to
> make things more clear PV-vs-HVM-wise, move the PV check earlier in the
> function, making it unnecessary for both callers to perform the check
> individually. Finally return NULL from the function when using the idle
> domain's page tables, allowing a dcache->inuse check to also become an
> assertion.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -28,8 +28,11 @@ static inline struct vcpu *mapcache_curr
>       /*
>        * When current isn't properly set up yet, this is equivalent to
>        * running in an idle vCPU (callers must check for NULL).
> +     *
> +     * Non-PV domains don't have any mapcache.  For idle domains (which
> +     * appear to be PV but also have no mapcache) see below.
>        */
> -    if ( !v )
> +    if ( !v || !is_pv_vcpu(v) )
>           return NULL;

I am trying to figure out the implication on this change with my patch 
[1]. Is this expected to go before hand?

If so, is this expectation that I will remove !is_pv_vcpu() and replace 
with a new check...

>   
>       /*
> @@ -41,19 +44,22 @@ static inline struct vcpu *mapcache_curr
>           return NULL;

... right here?

if ( !is_pv_vcpu(v) )
   return v;


>   
>       /*
> -     * If guest_table is NULL, and we are running a paravirtualised guest,
> -     * then it means we are running on the idle domain's page table and must
> -     * therefore use its mapcache.
> +     * If guest_table is NULL for a PV domain (which includes IDLE), then it
> +     * means we are running on the idle domain's page tables and therefore
> +     * must not use any mapcache.
>        */
> -    if ( unlikely(pagetable_is_null(v->arch.guest_table)) && is_pv_vcpu(v) )
> +    if ( unlikely(pagetable_is_null(v->arch.guest_table)) )
>       {
>           /* If we really are idling, perform lazy context switch now. */
> -        if ( (v = idle_vcpu[smp_processor_id()]) == current )
> +        if ( idle_vcpu[smp_processor_id()] == current )
>               sync_local_execstate();
>           /* We must now be running on the idle page table. */
>           ASSERT(cr3_pa(read_cr3()) == __pa(idle_pg_table));
> +        return NULL;
>       }
>   
> +    ASSERT(!is_idle_vcpu(v));
> +
>       return v;
>   }
>   
> @@ -82,13 +88,12 @@ void *map_domain_page(mfn_t mfn)
>   #endif
>   
>       v = mapcache_current_vcpu();
> -    if ( !v || !is_pv_vcpu(v) )
> +    if ( !v )
>           return mfn_to_virt(mfn_x(mfn));
>   
>       dcache = &v->domain->arch.pv.mapcache;
>       vcache = &v->arch.pv.mapcache;
> -    if ( !dcache->inuse )
> -        return mfn_to_virt(mfn_x(mfn));
> +    ASSERT(dcache->inuse);
>   
>       perfc_incr(map_domain_page_count);
>   
> @@ -187,7 +192,7 @@ void unmap_domain_page(const void *ptr)
>       ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
>   
>       v = mapcache_current_vcpu();
> -    ASSERT(v && is_pv_vcpu(v));
> +    ASSERT(v);
>   
>       dcache = &v->domain->arch.pv.mapcache;
>       ASSERT(dcache->inuse);

Cheers,

[1] https://lore.kernel.org/xen-devel/20221216114853.8227-15-julien@xen.org

-- 
Julien Grall

