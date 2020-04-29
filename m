Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 001A91BDB03
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 13:48:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTlBU-00068E-2z; Wed, 29 Apr 2020 11:47:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UoNI=6N=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1jTlBS-000689-RE
 for xen-devel@lists.xenproject.org; Wed, 29 Apr 2020 11:47:22 +0000
X-Inumbo-ID: 2f90ed68-8a0f-11ea-b9cf-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2f90ed68-8a0f-11ea-b9cf-bc764e2007e4;
 Wed, 29 Apr 2020 11:47:22 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id x18so2151042wrq.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 Apr 2020 04:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sSZEYL8vziV8hz9ASR5iV4i9EF1ovhAMH5rPsBEzMD8=;
 b=ZgmigyJc3qsrLrBKHMMxEBsmWGl7a5BsI01I6S7/yVEP3Vy8C0z9hMSSAfgrW8LuoZ
 +jPO7UtcuAXzXZZW2njRiKtNoQEdStm6Ky0VLOGFRDKV+Ul++8Dkw83otluO2h1TETaJ
 EWg+HzDcPYa4aym+5kMM5FD0IBu25OOWXrC5j14GLF9uiciR8kJZoMVw1Aja47HFI+tv
 pGrIuDfA/tydfjxoF0aJvZtu7bshR35NDOX9nsuaDnCvIOUmRtHI9XKNyodW1nz3SCjG
 h83mY3zh3ylCOZrDzwZGYYoF6QXk3eOdkAR2MBS+mOxyGTq09ByZ2d9pVNvjAJB1rZeO
 QYRg==
X-Gm-Message-State: AGi0Pua9PdUzcTOl81d07YnCCdyqRaHjUf0GmliJgTD9/46GTNGWi1bB
 7oaFb0s+YgxpOVefohetSgc7T08S
X-Google-Smtp-Source: APiQypIn/09EinWnIz8JP1RZZ7lAR7qt45/pc9qtUkVeWe9FOrP+4dFRupvBVMQuvlmwmNVv8sWHcg==
X-Received: by 2002:adf:afdf:: with SMTP id y31mr38389936wrd.120.1588160840962; 
 Wed, 29 Apr 2020 04:47:20 -0700 (PDT)
Received: from
 liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id h2sm7754246wmf.34.2020.04.29.04.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 04:47:20 -0700 (PDT)
Date: Wed, 29 Apr 2020 11:47:18 +0000
From: Wei Liu <wl@xen.org>
To: Xen Development List <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] x86/hyperv: stash and use the configured max VP index
Message-ID: <20200429114718.zclpy6r6sbxuo6ph@liuwe-devbox-debian-v2.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20200429104144.17816-1-liuwe@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200429104144.17816-1-liuwe@microsoft.com>
User-Agent: NeoMutt/20180716
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Apr 29, 2020 at 11:41:44AM +0100, Wei Liu wrote:
> The value returned from CPUID is the maximum number for virtual
> processors supported by Hyper-V. It could be larger than the maximum
> number of virtual processors configured.
> 
> Stash the configured number into a variable and use it in calculations.
> 
> Signed-off-by: Wei Liu <liuwe@microsoft.com>
> ---
>  xen/arch/x86/guest/hyperv/hyperv.c  | 4 ++++
>  xen/arch/x86/guest/hyperv/private.h | 1 +
>  xen/arch/x86/guest/hyperv/tlb.c     | 2 +-
>  xen/arch/x86/guest/hyperv/util.c    | 2 +-
>  4 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
> index 91a6782cd986..84221b751453 100644
> --- a/xen/arch/x86/guest/hyperv/hyperv.c
> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> @@ -33,6 +33,7 @@ DEFINE_PER_CPU_READ_MOSTLY(void *, hv_input_page);
>  DEFINE_PER_CPU_READ_MOSTLY(void *, hv_vp_assist);
>  DEFINE_PER_CPU_READ_MOSTLY(unsigned int, hv_vp_index);
>  
> +unsigned int __read_mostly hv_max_vp_index;
>  static bool __read_mostly hcall_page_ready;
>  
>  static uint64_t generate_guest_id(void)
> @@ -143,6 +144,9 @@ static int setup_hypercall_pcpu_arg(void)
>      rdmsrl(HV_X64_MSR_VP_INDEX, vp_index_msr);
>      this_cpu(hv_vp_index) = vp_index_msr;
>  
> +    if ( vp_index_msr > hv_max_vp_index )
> +        hv_max_vp_index = vp_index_msr;
> +
>      return 0;
>  }
>  
> diff --git a/xen/arch/x86/guest/hyperv/private.h b/xen/arch/x86/guest/hyperv/private.h
> index 354fc7f685a7..fea3e291e944 100644
> --- a/xen/arch/x86/guest/hyperv/private.h
> +++ b/xen/arch/x86/guest/hyperv/private.h
> @@ -28,6 +28,7 @@
>  DECLARE_PER_CPU(void *, hv_input_page);
>  DECLARE_PER_CPU(void *, hv_vp_assist);
>  DECLARE_PER_CPU(unsigned int, hv_vp_index);
> +extern unsigned int hv_max_vp_index;
>  
>  static inline unsigned int hv_vp_index(unsigned int cpu)
>  {
> diff --git a/xen/arch/x86/guest/hyperv/tlb.c b/xen/arch/x86/guest/hyperv/tlb.c
> index 1d723d6ee679..0a44071481bd 100644
> --- a/xen/arch/x86/guest/hyperv/tlb.c
> +++ b/xen/arch/x86/guest/hyperv/tlb.c
> @@ -166,7 +166,7 @@ int hyperv_flush_tlb(const cpumask_t *mask, const void *va,
>          {
>              unsigned int vpid = hv_vp_index(cpu);
>  
> -            if ( vpid >= ms_hyperv.max_vp_index )
> +            if ( vpid >= hv_max_vp_index )

I think the >= should be changed to > here.

Wei.

>              {
>                  local_irq_restore(irq_flags);
>                  return -ENXIO;
> diff --git a/xen/arch/x86/guest/hyperv/util.c b/xen/arch/x86/guest/hyperv/util.c
> index bec61c2afd87..2c5f421b7bd9 100644
> --- a/xen/arch/x86/guest/hyperv/util.c
> +++ b/xen/arch/x86/guest/hyperv/util.c
> @@ -33,7 +33,7 @@ int cpumask_to_vpset(struct hv_vpset *vpset,
>  {
>      int nr = 1;
>      unsigned int cpu, vcpu_bank, vcpu_offset;
> -    unsigned int max_banks = ms_hyperv.max_vp_index / 64;
> +    unsigned int max_banks = hv_max_vp_index / 64;
>  
>      /* Up to 64 banks can be represented by valid_bank_mask */
>      if ( max_banks > 64 )
> -- 
> 2.20.1
> 

