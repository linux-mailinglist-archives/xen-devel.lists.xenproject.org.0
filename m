Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E981E4CE5
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 20:14:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je0Zf-0007HN-As; Wed, 27 May 2020 18:14:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ARaW=7J=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1je0Ze-0007HI-15
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 18:14:42 +0000
X-Inumbo-ID: eee6dd0c-a045-11ea-a771-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eee6dd0c-a045-11ea-a771-12813bfff9fa;
 Wed, 27 May 2020 18:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=+hLus+pX/7H3a22ZBroR+aLqB4dL12CGzDLFgeud9xk=; b=CWIEmF0bhY7CTfTc3wJAdOJxZT
 pqME1DQ3IB6RT4JgwD4b31a9hNxZYmB3hCLXbBQ8xfiUQBXAuOSug9tB7fzo+Iie2PV6FPTjtObDx
 1L9nEFGjQFZ+0vij5kjPThmyCAo44sFD9EvqT62sWoYx903jNpDV9oAh8fflcnTaY/e8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1je0Zb-00022w-Hg; Wed, 27 May 2020 18:14:39 +0000
Received: from [93.176.191.173] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1je0Zb-0006A4-7C; Wed, 27 May 2020 18:14:39 +0000
Date: Wed, 27 May 2020 20:14:31 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: Re: [PATCH v2] x86/svm: retry after unhandled NPT fault if gfn was
 marked for recalculation
Message-ID: <20200527181414.GD1195@Air-de-Roger>
References: <1590541308-11317-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1590541308-11317-1-git-send-email-igor.druzhinin@citrix.com>
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
Cc: kevin.tian@intel.com, jbeulich@suse.com, wl@xen.org,
 andrew.cooper3@citrix.com, jun.nakajima@intel.com,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, May 27, 2020 at 02:01:48AM +0100, Igor Druzhinin wrote:
> If a recalculation NPT fault hasn't been handled explicitly in
> hvm_hap_nested_page_fault() then it's potentially safe to retry -
> US bit has been re-instated in PTE and any real fault would be correctly
> re-raised next time. Do it by allowing hvm_hap_nested_page_fault to
> fall through in that case.
> 
> This covers a specific case of migration with vGPU assigned on AMD:
> global log-dirty is enabled and causes immediate recalculation NPT
> fault in MMIO area upon access. This type of fault isn't described
> explicitly in hvm_hap_nested_page_fault (this isn't called on
> EPT misconfig exit on Intel) which results in domain crash.
> 
> Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> ---
> Changes in v2:
> - don't gamble with retrying every recal fault and instead let
>   hvm_hap_nested_page_fault know it's allowed to fall through in default case
> ---
>  xen/arch/x86/hvm/hvm.c        | 6 +++---
>  xen/arch/x86/hvm/svm/svm.c    | 7 ++++++-
>  xen/arch/x86/hvm/vmx/vmx.c    | 2 +-
>  xen/include/asm-x86/hvm/hvm.h | 2 +-
>  4 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 74c9f84..42bd720 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1731,7 +1731,7 @@ void hvm_inject_event(const struct x86_event *event)
>  }
>  
>  int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
> -                              struct npfec npfec)
> +                              struct npfec npfec, bool fall_through)
>  {
>      unsigned long gfn = gpa >> PAGE_SHIFT;
>      p2m_type_t p2mt;
> @@ -1740,7 +1740,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>      struct vcpu *curr = current;
>      struct domain *currd = curr->domain;
>      struct p2m_domain *p2m, *hostp2m;
> -    int rc, fall_through = 0, paged = 0;
> +    int rc, paged = 0;
>      bool sharing_enomem = false;
>      vm_event_request_t *req_ptr = NULL;
>      bool sync = false;

I would assert that the parameter is never set when running on Intel,
since those code path is not supposed to use it.

I also wonder whether it would be possible to avoid passing a
parameter, and instead check whether the guest is in logdirty mode on
AMD and the fault is actually a logdirty triggered one. That would IMO
make it more robust since the caller doesn't need to care about
whether it's a recalc fault or not.

> @@ -1905,7 +1905,7 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>              sync = p2m_mem_access_check(gpa, gla, npfec, &req_ptr);
>  
>              if ( !sync )
> -                fall_through = 1;
> +                fall_through = true;
>              else
>              {
>                  /* Rights not promoted (aka. sync event), work here is done */
> diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
> index 46a1aac..8ef3fed 100644
> --- a/xen/arch/x86/hvm/svm/svm.c
> +++ b/xen/arch/x86/hvm/svm/svm.c
> @@ -1695,7 +1695,12 @@ static void svm_do_nested_pgfault(struct vcpu *v,
>      else if ( pfec & NPT_PFEC_in_gpt )
>          npfec.kind = npfec_kind_in_gpt;
>  
> -    ret = hvm_hap_nested_page_fault(gpa, ~0ul, npfec);
> +    /*
> +     * US bit being set in error code indicates P2M type recalculation has
> +     * just been done meaning that it's possible there is nothing else to handle
> +     * and we can just fall through and retry.
> +     */
> +    ret = hvm_hap_nested_page_fault(gpa, ~0ul, npfec, !!(pfec & PFEC_user_mode));
>  
>      if ( tb_init_done )
>      {
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index 11a4dd9..10f1eeb 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -3398,7 +3398,7 @@ static void ept_handle_violation(ept_qual_t q, paddr_t gpa)
>      else
>          gla = ~0ull;
>  
> -    ret = hvm_hap_nested_page_fault(gpa, gla, npfec);
> +    ret = hvm_hap_nested_page_fault(gpa, gla, npfec, false);
>      switch ( ret )
>      {
>      case 0:         // Unhandled L1 EPT violation
> diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
> index 1eb377d..03e5f1d 100644
> --- a/xen/include/asm-x86/hvm/hvm.h
> +++ b/xen/include/asm-x86/hvm/hvm.h
> @@ -329,7 +329,7 @@ void hvm_fast_singlestep(struct vcpu *v, uint16_t p2midx);
>  
>  struct npfec;
>  int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
> -                              struct npfec npfec);
> +                              struct npfec npfec, bool fall_through);

I would rename fall_through to recalc, recalculate or misconfig. It's
not easy to understand the meaning of the parameter when looking at
the function prototype.

Thanks, Roger.

