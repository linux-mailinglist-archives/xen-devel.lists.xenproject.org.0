Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E19A9845EA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 14:30:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802756.1213054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st4gS-0003gl-Sd; Tue, 24 Sep 2024 12:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802756.1213054; Tue, 24 Sep 2024 12:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st4gS-0003fE-PV; Tue, 24 Sep 2024 12:30:24 +0000
Received: by outflank-mailman (input) for mailman id 802756;
 Tue, 24 Sep 2024 12:30:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZSf=QW=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1st4gR-0003f8-Ra
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 12:30:23 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3af27ae-7a70-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 14:30:21 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-42cae6bb895so54651715e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 05:30:21 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2c212csm1474715f8f.40.2024.09.24.05.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 05:30:20 -0700 (PDT)
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
X-Inumbo-ID: c3af27ae-7a70-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727181020; x=1727785820; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vjE/U0lw2S206qOJTTT3wDStmaFU2kSR6svOl/r9ico=;
        b=uTWFpMvfnCouRMO73YA0odtC1OaCYQ8wvKfE317foMbVfe2ykbkL9701UEqIMbeCLo
         nMlgainACqFOC4q2H441Qd6c+wil5+qTWX8KiePrFzngD94dyTpO+ZLbwr15oos+Lf9M
         bx6HHGQ/ymk/09iq2Sa6k+ein+9swBtJYOQqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727181020; x=1727785820;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vjE/U0lw2S206qOJTTT3wDStmaFU2kSR6svOl/r9ico=;
        b=u/u4f76BaqrY45duFpekHDLFlmUjqU+sOEVzi9SC9ei3baiNTYbxPv+vfnijjqXjJ8
         D+vgksB+TNVSfs0HaC7VX5pCexszXwmA0L3SUniG3IM6SIbhbLmHBjWs8lZTITvzSPmb
         ThX8ykBhUUlZkz+NPhwlruSHpi9RF+iC4tL0ZwQGBmDwRL9PZfGzBhTM687RVpEQ/rU5
         FXkfEGu3Fk0Br98SJUTP4igeNEARFJJftSwLpPqa6Er3/YL9sAtQWK3Y2+QOKu97b3Ko
         weCWC1PnH0KUHLj7Ifl41hMZGSKAURomTq7QnsjELw/egCNn/FLKPk7XsQrtbivdVJr1
         Dbiw==
X-Gm-Message-State: AOJu0Yx13jEh7gR/daex3MbOOvtb4pPflqFxdtgBYTfhuNjcHHkmpBc3
	igdRkcpAq7+6tqjNU4yrzmhrj0XNfo5BOKWzFwe0WAhfqfLHdC1WkX3Wf8Sv/JoZlCcr/7xSAzZ
	x
X-Google-Smtp-Source: AGHT+IFxvAkEsKM+axnPyGSMqxmISEAh1Uequj3W2lUFqb6UFaUiv6e70ri+VcSmXZFc5VBD2FgqCA==
X-Received: by 2002:a5d:61c2:0:b0:374:cea0:7d3d with SMTP id ffacd0b85a97d-37a431be8afmr7861382f8f.53.1727181020462;
        Tue, 24 Sep 2024 05:30:20 -0700 (PDT)
Date: Tue, 24 Sep 2024 14:30:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>
Subject: Re: [PATCH] x86/boot: Further simplify CR4 handling in
 dom0_construct_pv()
Message-ID: <ZvKw25fHecADv9NT@macbook.local>
References: <20240924112343.193506-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240924112343.193506-1-andrew.cooper3@citrix.com>

On Tue, Sep 24, 2024 at 12:23:43PM +0100, Andrew Cooper wrote:
> The logic would be more robust disabling SMAP based on its precense in CR4,
> rather than on certain features.
> 
> A forthcoming feature, LASS, needs the same treatment here.  Introduce minimum
> enumeration information, although it will take a bit more work to get LASS
> fully usable in guests.

Reading the ISA, doesn't LASS require SMAP to be enabled in %cr4, and
hence disabling SMAP already disables LASS? (without having to toggle
the LASS %cr4 bit)

"A supervisor-mode data access causes a LASS violation only if
supervisor-mode access protection is enabled (because CR4.SMAP = 1)
and either RFLAGS.AC = 0 or the access implicitly accesses a system
data structure."

We can consider also disabling it, but I think it would need to be
noted that such disabling is not strictly necessary, as disabling SMAP
already disables LASS.

> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> I know LASS can't be used with traditional PV guests, but I have some PV-lite
> plans.  The problem is the PV kernel, in CPL3, accessing addresses in the high
> canonincal half.
> ---
>  xen/arch/x86/include/asm/x86-defns.h        |  1 +
>  xen/arch/x86/pv/dom0_build.c                | 18 ++++++++++--------
>  xen/include/public/arch-x86/cpufeatureset.h |  1 +
>  3 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/x86-defns.h b/xen/arch/x86/include/asm/x86-defns.h
> index caa92829eaa9..8f97fb1e6a12 100644
> --- a/xen/arch/x86/include/asm/x86-defns.h
> +++ b/xen/arch/x86/include/asm/x86-defns.h
> @@ -75,6 +75,7 @@
>  #define X86_CR4_PKE        0x00400000 /* enable PKE */
>  #define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
>  #define X86_CR4_PKS        0x01000000 /* Protection Key Supervisor */
> +#define X86_CR4_LASS       0x08000000 /* Linear Address Space Separation */
>  
>  /*
>   * XSTATE component flags in XCR0 | MSR_XSS
> diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
> index 262edb6bf2f0..f5c868df384f 100644
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -1057,29 +1057,31 @@ int __init dom0_construct_pv(struct domain *d,
>                               module_t *initrd,
>                               const char *cmdline)
>  {
> +    unsigned long cr4 = read_cr4();
> +    unsigned long mask = X86_CR4_SMAP | X86_CR4_LASS;

const maybe?  Seeing as it is read-only.

Thanks, Roger.

