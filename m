Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D098AB3288B
	for <lists+xen-devel@lfdr.de>; Sat, 23 Aug 2025 14:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1091202.1447985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upnNq-0004VQ-Js; Sat, 23 Aug 2025 12:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1091202.1447985; Sat, 23 Aug 2025 12:30:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upnNq-0004Sh-F9; Sat, 23 Aug 2025 12:30:10 +0000
Received: by outflank-mailman (input) for mailman id 1091202;
 Sat, 23 Aug 2025 12:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOa+=3D=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1upnNp-0004Sb-0s
 for xen-devel@lists.xenproject.org; Sat, 23 Aug 2025 12:30:09 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e44c75de-801c-11f0-b898-0df219b8e170;
 Sat, 23 Aug 2025 14:30:03 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55ce52b01caso3081403e87.3
 for <xen-devel@lists.xenproject.org>; Sat, 23 Aug 2025 05:30:02 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f35c8bc67sm494109e87.80.2025.08.23.05.29.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Aug 2025 05:29:59 -0700 (PDT)
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
X-Inumbo-ID: e44c75de-801c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755952202; x=1756557002; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DFCyfN/Wm0CNWe+vsagMdd5V//03/sTzPpoKrQ6J/Q=;
        b=d5KzvdLOlZor6gUaaoMy9yxQvZ8E1AOnllKR6/Y0zNnOYj7aQ0YM5+l6KtFKQ6uPtg
         7woR52B0VZjydEY0IuPjy/SQAvG0EsibaA+MeNfHddWwKiLj0y3sIjUzfLRvPLQYPvR2
         q4gZHXhqSrAP4WADqI/X0/6wb60Cxbz91WPsHJceJq/UIzxdSyKPwmIQ/Jd/XJCjtkHP
         JA7BduaURLGZdF9UuxceNJ2lomDA2tx2qHlsnbhfd80Q1vxwQK23OO4VZEbKXGh/YiuQ
         R8Cqpv0GYQWhUAxUY9c9RqiHV8FTHlMpYhPztT+2quGoZeQunfNC5U4gaJ8/A5U8C0Q3
         b4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755952202; x=1756557002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6DFCyfN/Wm0CNWe+vsagMdd5V//03/sTzPpoKrQ6J/Q=;
        b=XK8jhBprfqUXY+x4o96eK3IV8GF6GwYrxjfikUOrVK39aZ6VpH6hS1zXPXSX5fwTiz
         7okS2L80SPbmxMVixmVOHn98Vyt0uDvxDkq3oxqEmTh7FpBw00f6pFQXBXLlPYRMiV7O
         iRhplIgHsGoH3AcCPMG57iaWhItq/ma8SFWOKu6ka4hdjYUcOL7lt8FOe/7KyhnlpPcq
         XlF8Rr68L2E60jDJ4UpsJH3K7+61Nw+FomAIFK+T7y9KhufAVgFtLvGN2rZMQiSr9W8f
         Mxib0Qi06CIyE+pAhnfAyVRrEEKRsFNsdwHswn4i4jg59v7AJ+ijdw0M4tn3ydYr8HOZ
         gesg==
X-Gm-Message-State: AOJu0Ywz6JNbpesBYnkI4e9YxJ8FNykq2fZ4MROk8sf9sjicOT3uQZhT
	rfvd4J02kAWpNl7pUaZDtSpnrgvBnJs5Rcanq/Yw2uFo10ulx7ZKLoftOiBEyA==
X-Gm-Gg: ASbGncvYX/egcMoK5elHivKMtX4wY3+5nVHwHAn/1Jr8YZoSXUNDsdDCDwO53Zh6Wz0
	1rQ46hF8JN8hnUngdSmox2ZIB1KIRMoevmje0nkltf/d0LzoRXmf86lASVa2kTqD8C11MDaCtNE
	ko/RbbnGYucOQpMeoteo8lHT+bqGomuJZaKLjK7RhAXZVl8cNWq0q6D7tQDKdgMVs8i8m6nXu9k
	OLZIDIB0+zX3WDJqhPDVN0GSq8z9IGPD5IK65y+EF8JxJvbbghfW2FY0cNKpvfoCUSnbHxm0Q4R
	aPz3HhvrjULrnroBTDRg5qfnRL5Ij5RngTebqZFHP46wuTO8EVPrhblOppB/VmLNwmcO5NKbKtB
	+N2fJ+5ShgRPaYjqG+eg4yw+5ew==
X-Google-Smtp-Source: AGHT+IHlFAKA4Ghw/3NVgWqFZ5Zw9Cx+YBDGBkznSW6w/xSCiAZg45vtgza2Zz66CxYxhjVfa61X+Q==
X-Received: by 2002:a05:6512:6284:b0:55b:8a07:7917 with SMTP id 2adb3069b0e04-55f0d370fa7mr2067891e87.30.1755952201271;
        Sat, 23 Aug 2025 05:30:01 -0700 (PDT)
Message-ID: <29d0e5ed-78b3-45ad-9543-e47731c41c3f@gmail.com>
Date: Sat, 23 Aug 2025 15:29:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/10] xen/arm: vgic: implement helper functions for
 virq checks
To: xen-devel@lists.xenproject.org,
 Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>
References: <7e6477a83ab65220ef1c5dd22f4ef3536fbbdd5c.1754568795.git.leonid_komarianskyi@epam.com>
 <f029f88411e816846d13aaf33d4ef703f95d1bb8.1754568795.git.leonid_komarianskyi@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <f029f88411e816846d13aaf33d4ef703f95d1bb8.1754568795.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.08.25 15:33, Leonid Komarianskyi wrote:

Hello Leonid


> Introduced two new helper functions for vGIC: vgic_is_valid_irq and
> vgic_is_shared_irq. The functions are similar to the newly introduced
> gic_is_valid_irq and gic_is_shared_irq, but they verify whether a vIRQ
> is available for a specific domain, while GIC-specific functions
> validate INTIDs for the real GIC hardware. For example, the GIC may
> support all 992 SPI lines, but the domain may use only some part of them
> (e.g., 640), depending on the highest IRQ number defined in the domain
> configuration. Therefore, for vGIC-related code and checks, the
> appropriate functions should be used. Also, updated the appropriate
> checks to use these new helper functions.
> 
> The purpose of introducing new helper functions for vGIC is essentially
> the same as for GIC: to avoid potential confusion with GIC-related
> checks and to consolidate similar code into separate functions, which
> can be more easily extended by additional conditions, e.g., when
> implementing extended SPI interrupts.
> 
> Only the validation change in vgic_inject_irq may affect existing
> functionality, as it currently checks whether the vIRQ is less than or
> equal to vgic_num_irqs. Since IRQ indexes start from 0 (where 32 is the
> first SPI), the check should behave consistently with similar logic in
> other places and should check if the vIRQ number is less than
> vgic_num_irqs. The remaining changes, which replace open-coded checks
> with the use of these new helper functions, do not introduce any
> functional changes, as the helper functions follow the current vIRQ
> index verification logic.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> 
> ---
> Changes in V2:
> - introduced this patch
> ---
>   xen/arch/arm/gic.c              |  3 +--
>   xen/arch/arm/include/asm/vgic.h |  7 +++++++
>   xen/arch/arm/irq.c              |  4 ++--
>   xen/arch/arm/vgic.c             | 10 ++++++++--
>   4 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index eb0346a898..47fccf21d8 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -133,8 +133,7 @@ int gic_route_irq_to_guest(struct domain *d, unsigned int virq,
>   
>       ASSERT(spin_is_locked(&desc->lock));
>       /* Caller has already checked that the IRQ is an SPI */
> -    ASSERT(virq >= 32);
> -    ASSERT(virq < vgic_num_irqs(d));
> +    ASSERT(vgic_is_shared_irq(d, virq));
>       ASSERT(!is_lpi(virq));
>   
>       ret = vgic_connect_hw_irq(d, NULL, virq, desc, true);
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 35c0c6a8b0..45201f4ca5 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -335,6 +335,13 @@ extern void vgic_check_inflight_irqs_pending(struct vcpu *v,
>   /* Default number of vGIC SPIs. 32 are substracted to cover local IRQs. */
>   #define VGIC_DEF_NR_SPIS (min(gic_number_lines(), VGIC_MAX_IRQS) - 32)
>   
> +extern bool vgic_is_valid_irq(struct domain *d, unsigned int virq);
> +
> +static inline bool vgic_is_shared_irq(struct domain *d, unsigned int virq)
> +{
> +    return (virq >= NR_LOCAL_IRQS && vgic_is_valid_irq(d, virq));
> +}
> +
>   /*
>    * Allocate a guest VIRQ
>    *  - spi == 0 => allocate a PPI. It will be the same on every vCPU
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 12c70d02cc..50e57aaea7 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -442,7 +442,7 @@ int route_irq_to_guest(struct domain *d, unsigned int virq,
>       unsigned long flags;
>       int retval = 0;
>   
> -    if ( virq >= vgic_num_irqs(d) )
> +    if ( !vgic_is_valid_irq(d, virq) )


This file is common for all VGIC implementations, so 
route_irq_to_guest() is used with CONFIG_NEW_VGIC=y as well.

If your series is built with CONFIG_NEW_VGIC=y (I know, that NEW_VGIC 
does not support GICV3 HW) I have got the following error:


aarch64-poky-linux-ld: prelink.o: in function `route_irq_to_guest':
/usr/src/debug/xen/4.18.0+gitAUTOINC+ce58f56108-r0/git/xen/arch/arm/irq.c:445: 
undefined reference to `vgic_is_valid_irq'
/usr/src/debug/xen/4.18.0+gitAUTOINC+ce58f56108-r0/git/xen/arch/arm/irq.c:445:(.text+0x5e2f8): 
relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol 
`vgic_is_valid_irq'
...

 From the quick look, vgic_is_valid_irq() needs a stub (or NEW_VGIC's 
counterpart).

[snip]

