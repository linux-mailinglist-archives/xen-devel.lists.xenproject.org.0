Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759BDCAC8A1
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:45:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180171.1503405 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWs4-00012D-0z; Mon, 08 Dec 2025 08:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180171.1503405; Mon, 08 Dec 2025 08:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWs3-00010g-Sb; Mon, 08 Dec 2025 08:45:27 +0000
Received: by outflank-mailman (input) for mailman id 1180171;
 Mon, 08 Dec 2025 08:45:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RGh+=6O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vSWs2-00010a-34
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:45:26 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cfdaa85-d412-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 09:45:24 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-64951939e1eso270564a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 00:45:24 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b412146bsm10377115a12.23.2025.12.08.00.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:45:23 -0800 (PST)
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
X-Inumbo-ID: 3cfdaa85-d412-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765183524; x=1765788324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jo3QdWDfJ+ZnAkWGcPZCfKMq8dksu0UuN4R3qny3vzM=;
        b=mk8GgvmNgbxVCHB3YJQLeXXe0krBFMUDGQgZCzZ/EYoNi8MrPCk4LrUgzZjFfqWpRp
         Acjp98CaDtvEDLUu6McTv33OJ6E2Td9pB+sZMW5KX+Y7p8djOGtu0Koitx+FG+cOVzpi
         iJBoE+oa9XZmoBWq8aYmDoO+cv/VgwNVS8jqxzdMcZ0IXkMEdTj5QsPx3D/zGVOmhSqV
         TTuunSWxhpUdOp+yOmrf5dpWU8YFdmIl9nLf8DiF85Ic7DojvIbrPSdxJMugcxGgbyGQ
         Zs5AkYdM+v8L5lD6yYyaBShFfKRhuivCTUO7aMrTB8wYj+QddTWd0ds7ing62PGw3dCj
         KvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765183524; x=1765788324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jo3QdWDfJ+ZnAkWGcPZCfKMq8dksu0UuN4R3qny3vzM=;
        b=bF1PTE2ffzsCwEoa2pnHwZj/uoMHkuCrYOH/UXoBkH/YSr+CQOLIW7TqQOchUVz+7A
         mv74rVXfXqd73yUefUYBFJDAugcJEQfUfOgOPA4Zfpm/aNEozpOH1sm3DDOB06HtIn4e
         o16cly2jkiIKRG0m8RH4yAJ4ACY/Pp7pxTy1NSrP69rK5iWY1evRUlLFp5JtSQf0tRyj
         BdyJyKQ7EuSrrt6MUGYVlCUEvfHBiCjZu81fhleBSWebi7A9qNCWteIP2RVRBnC0HzE/
         nW+x/Q5SFnAH+K4DcPpzilGgFNSTyiH5ednJbb6pWrZDjN0VOSNGZZMjBFI1/4g4UmC7
         kM4w==
X-Forwarded-Encrypted: i=1; AJvYcCW0atOutreSLk1I4yqNiVJwfCiEQjfpOvZ2WpK/3HW0AQKWlV/TKG6YDTvS3Ty0DwjMwO6Ayn1zrUs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxze2ocOzsmrw72M9rSxOiIZB41OoPoIDB7Tz7RpSDEmuamGtI0
	+n6b2JzIu13aUV3oZ3Sd4sPtqm2sWT3nzFsdFuTijDY9WLVVIgzQTOnP
X-Gm-Gg: ASbGnct4LdRQ9pvv1DE59mucwZWSFwnhxMolmPfuoem+vD8fEyiKdlFl3VcdIBNCrZi
	XAT1ThzuqSlPHc9PXLDiEfFhYoXQAgJ4UmXN2dDj4kgrJ2QS+DHDKQVLSPljQDBhJjjWCopNZKn
	XsJbZsrGVG53ta/v2rrOT9t3We51az1FY/V9z/giL3Ba73+E1O3wHKktYAhZ43+nFiVklXz4MQd
	8Dh5mx2iHIO07EIXaimWzCbDDnc0JCSuC+I3mmIt1OTIyIEPugczyMQp/gpcDCL7zuYiGQ3tAoh
	g0gNy2aNEaDPUJNngX4rc5c6Q0CSddQDQu7aoYN8Fab5Mw8HRSbJRmUUQSnzgPKloW62H+haqRR
	JxyEGE+eu1mmk0xuw4e+l5h12n9U5UxmiydKsYDm9+fxAPDGwEDlTjh0pJsEAuTtnp1kEHfZbBz
	LIiFYHPyBIMB05fWBHpGPg9rfYwEtV/r7LSafcvbhI4abz3De5uWN7pzkQkfBv
X-Google-Smtp-Source: AGHT+IEUvDGQiVzHoDwPOxeRgMR7SroOBWgZGekwM2EQH7F+EcZLAGQKrq8DvUwPKrEUMjGUl+/Eew==
X-Received: by 2002:a05:6402:3485:b0:63b:ef0e:dfa7 with SMTP id 4fb4d7f45d1cf-64919c043dbmr5418782a12.6.1765183523813;
        Mon, 08 Dec 2025 00:45:23 -0800 (PST)
Message-ID: <4c818b01-bf97-4cae-882b-88f653f8a36d@gmail.com>
Date: Mon, 8 Dec 2025 09:45:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm/ppc/riscv: drop unused
 domain_set_alloc_bitsize() macro
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-2-grygorii_strashko@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251128152218.3886583-2-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/28/25 4:22 PM, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> The domain_set_alloc_bitsize() is x86 PV32 specific and not used by other
> arch or common code, so remove it.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: no changes, added tag
>
>   xen/arch/arm/include/asm/mm.h   | 1 -
>   xen/arch/ppc/include/asm/mm.h   | 1 -
>   xen/arch/riscv/include/asm/mm.h | 1 -
>   3 files changed, 3 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index f702f4a0d676..4c6cc64aa7ba 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -313,7 +313,6 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
>   /* Arch-specific portion of memory_op hypercall. */
>   long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
>   
> -#define domain_set_alloc_bitsize(d) ((void)0)
>   #define domain_clamp_alloc_bitsize(d, b) (b)
>   
>   unsigned long domain_get_maximum_gpfn(struct domain *d);
> diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
> index a33eeec43bd6..e478291fdf55 100644
> --- a/xen/arch/ppc/include/asm/mm.h
> +++ b/xen/arch/ppc/include/asm/mm.h
> @@ -96,7 +96,6 @@ static inline struct page_info *virt_to_page(const void *v)
>   /* TODO: implement */
>   #define mfn_valid(mfn) ({ (void) (mfn); 0; })
>   
> -#define domain_set_alloc_bitsize(d) ((void)(d))
>   #define domain_clamp_alloc_bitsize(d, b) (b)
>   
>   #define PFN_ORDER(pfn_) ((pfn_)->v.free.order)
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> index 9283616c0224..11e9f26bf0a5 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -292,7 +292,6 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>   /* TODO: implement */
>   #define mfn_valid(mfn) ({ (void)(mfn); 0; })
>   
> -#define domain_set_alloc_bitsize(d) ((void)(d))
>   #define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
>   
>   #define PFN_ORDER(pg) ((pg)->v.free.order)

LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


