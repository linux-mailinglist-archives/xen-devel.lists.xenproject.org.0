Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F3E9903A1
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 15:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810409.1223114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swi6a-0001yf-FM; Fri, 04 Oct 2024 13:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810409.1223114; Fri, 04 Oct 2024 13:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swi6a-0001vU-BK; Fri, 04 Oct 2024 13:12:24 +0000
Received: by outflank-mailman (input) for mailman id 810409;
 Fri, 04 Oct 2024 13:12:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiC3=RA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1swi6Z-0001vO-Df
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 13:12:23 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a1e145f-8252-11ef-99a2-01e77a169b0f;
 Fri, 04 Oct 2024 15:12:21 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8d4093722bso300829966b.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 06:12:21 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104d2863sm224965166b.220.2024.10.04.06.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 06:12:20 -0700 (PDT)
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
X-Inumbo-ID: 4a1e145f-8252-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1728047541; x=1728652341; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=31pbGcuVKUAQlzIx47SLtuFd7ZC5OYZQS0OpixDG3pE=;
        b=LnwVS5j+XQME1yZssdELppM6VSYC645aEcIRhUj4AjkIUmYNuF0dUQJU+U37Bx1mxD
         9djrLpJJ7z+4a39uAvUfA7WdpS0B02zrsBy/DypR93DCeWZiyjAYEmOA+vwvczdB2AUZ
         QTs6+kZCoDX1MgmcJBF+BFxubDnPCL1BZf4Ac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728047541; x=1728652341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31pbGcuVKUAQlzIx47SLtuFd7ZC5OYZQS0OpixDG3pE=;
        b=KNBbgTo+fWMPJBnDvUshM/ZNI9ueAFUmF8BO2QPbE7NzkWy0CxBC5Ntkjkii/3xtDx
         WCr/i5kHrZRNx/aKJaWYTotQ5uC44KexzLh7Q5IQk1pu4gorp5reyI1Dl12m5AmsqGpQ
         Y/q/bdqQMp8PNO9zlVCqBwinQLz6JJJqVO65H89+BKczDpwgVQpoT8l9cfE6tHfSepbD
         SPbgbtFe98j2ZT0dQAZIj/s+fClWPy4hMbbmEG/a1XdqmY08l6B5PFqXz+3qYzBPM/j0
         000ozWomQIwhVegH03d5HzRV+H2kN6zkussnGg5Gf/qpWxCAuVOG9/g3VOEbOBIWu+IL
         MLlQ==
X-Gm-Message-State: AOJu0Yw0ZIZB9rFmAqLPrWo2uA7ZTKdrhnmHlefd/t7K8PJbmw5T/RKN
	a09LGTHy5tSK6jWeetYjWXY1hwrTVCcxDXI9womxO5gwPcI3heyNqLII7gpRErA=
X-Google-Smtp-Source: AGHT+IGRX9KcuuOuwVIK7p3oMhoABnKdkR4r7wsVJX70etxuunE9gUiolwMI02FV5f15ZoBjlIoNXQ==
X-Received: by 2002:a17:907:3e9c:b0:a8b:2604:1da3 with SMTP id a640c23a62f3a-a991bd3f988mr278797966b.17.1728047540853;
        Fri, 04 Oct 2024 06:12:20 -0700 (PDT)
Date: Fri, 4 Oct 2024 15:12:19 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH v1 2/3] x86/hvm: introduce config option for stdvga
 emulation
Message-ID: <Zv_pszkRrPXstXFW@macbook.local>
References: <cover.1728032664.git.Sergiy_Kibrik@epam.com>
 <05a027b7021ce6deb5b48078034e560a38ca8d23.1728032664.git.Sergiy_Kibrik@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <05a027b7021ce6deb5b48078034e560a38ca8d23.1728032664.git.Sergiy_Kibrik@epam.com>

On Fri, Oct 04, 2024 at 12:33:53PM +0300, Sergiy Kibrik wrote:
> Introduce config option X86_STDVGA so that stdvga emulation driver can later be
> made configurable and be disabled on systems that don't need it.
> 
> As a first step the option is hidden from user. No functional changes intended.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> CC: Jan Beulich <jbeulich@suse.com>
> ---
>  xen/arch/x86/Kconfig              | 3 +++
>  xen/arch/x86/hvm/Makefile         | 2 +-
>  xen/arch/x86/include/asm/domain.h | 3 ++-
>  xen/arch/x86/include/asm/hvm/io.h | 4 ++++
>  4 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 95275dc17e..89c42ff6da 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -147,6 +147,9 @@ config INTEL_VMX
>  config X86_PMTIMER
>  	def_bool HVM
>  
> +config X86_STDVGA
> +	def_bool HVM

Same as previous patch, the content of patch 3 needs to be moved here.

> +
>  config XEN_SHSTK
>  	bool "Supervisor Shadow Stacks"
>  	depends on HAS_AS_CET_SS
> diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
> index 321241f0bf..b7741b0f60 100644
> --- a/xen/arch/x86/hvm/Makefile
> +++ b/xen/arch/x86/hvm/Makefile
> @@ -22,7 +22,7 @@ obj-$(CONFIG_X86_PMTIMER) += pmtimer.o
>  obj-y += quirks.o
>  obj-y += rtc.o
>  obj-y += save.o
> -obj-y += stdvga.o
> +obj-$(CONFIG_X86_STDVGA) += stdvga.o
>  obj-y += vioapic.o
>  obj-y += vlapic.o
>  obj-y += vm_event.o
> diff --git a/xen/arch/x86/include/asm/domain.h b/xen/arch/x86/include/asm/domain.h
> index 3f65bfd190..675a13d917 100644
> --- a/xen/arch/x86/include/asm/domain.h
> +++ b/xen/arch/x86/include/asm/domain.h
> @@ -501,7 +501,8 @@ struct arch_domain
>  #define has_vrtc(d)        (!!((d)->arch.emulation_flags & X86_EMU_RTC))
>  #define has_vioapic(d)     (!!((d)->arch.emulation_flags & X86_EMU_IOAPIC))
>  #define has_vpic(d)        (!!((d)->arch.emulation_flags & X86_EMU_PIC))
> -#define has_vvga(d)        (!!((d)->arch.emulation_flags & X86_EMU_VGA))
> +#define has_vvga(d)        (IS_ENABLED(CONFIG_X86_STDVGA) && \

You don't need the IS_ENABLED() if emulation_flags_ok() is adjusted
accordingly.

Thanks, Roger.

