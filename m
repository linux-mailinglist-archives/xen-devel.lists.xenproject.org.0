Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840AFCAC8BF
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 09:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1180194.1503425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWwV-0002fj-Pu; Mon, 08 Dec 2025 08:50:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1180194.1503425; Mon, 08 Dec 2025 08:50:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSWwV-0002cq-Mu; Mon, 08 Dec 2025 08:50:03 +0000
Received: by outflank-mailman (input) for mailman id 1180194;
 Mon, 08 Dec 2025 08:50:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RGh+=6O=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vSWwV-0002UY-9b
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 08:50:03 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e22f0ad9-d412-11f0-9d1b-b5c5bf9af7f9;
 Mon, 08 Dec 2025 09:50:02 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-b7277324204so724938466b.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 00:50:01 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647b2ec319csm10558210a12.3.2025.12.08.00.49.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 00:50:00 -0800 (PST)
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
X-Inumbo-ID: e22f0ad9-d412-11f0-9d1b-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765183801; x=1765788601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PfV4JDQgRi+PrR/x1et4RbYjWBQ+L+bm7WIdnbZnoGk=;
        b=FCikUu6H7K0/pCBL9SfwR6RykC3zXEvSUky46t9uXwrn1ARQkkOG2DelWH9nccK0h9
         NfHnf61bc4/xV/njc8dVRD9RX//ChVtG53SF5Z/oc+USLjZgSUI0rgR27JhBVdXphY32
         phxYYGS/3j5pyzZVFTUrRxqBhd6uKs6innpeBxsa8pPgOeJApljvTjHvwt/9xRvLXi+W
         E+jkOEzy4yJhXu3DCmV8dnG0tB9a//ttaFvwrDkIMuvt3kHg6bhbmSF7I1TGVHkOZ49y
         Yh+UvwarzmiPjOEM7O0aX6A8PZ8mz4ibkzUsBMDxo+m5SS8qT5eM3TKnbhqxxisamJ6x
         zS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765183801; x=1765788601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PfV4JDQgRi+PrR/x1et4RbYjWBQ+L+bm7WIdnbZnoGk=;
        b=wlcVxK7zqiyX2VMPgEkgjBT8QhZF1rvnvik4LIoMZROSnBhKQbTdk6jVcpvw7DtoC9
         EiKsf16LCp/nryPIWI148OSavASTyljeXw1i1Q9rCGXokIJFMnkDyn/0SRbNKiRY1EW1
         4mnHdHyMrYFm7rC4THoPGgdv5+4aIxtxnm7+Px89h5eHVACNWH6ydVHSgQd69HAquZ/5
         gEdxRM0ofFoUM8q9Xe6BXneZP5TluCkgRfBBvTr/daKhX1whjbegPnPUJcpiTnbI6R0s
         lruCoI3SOyFo/RDzcaOwF/G+HY0gOPl8WjWk+w54+aZ3z+1gQU8Hh2SrZo2fPykxq5Qw
         y/oA==
X-Forwarded-Encrypted: i=1; AJvYcCW28+ky87xr6aGE0gOBDsSWpH48rzQFgPasxR+EpBI1m6WWYeuLPS/vh6MjEIYXVRBCS2AMhAcQ/HE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzv5FWqSDwyA/WcYBW0djjzIpvYOb2KJAbZ6WgnExuby3rCjy0C
	j8z5zxSaa4vuZlFvcLygtHa+aplMMHrFGkLhgVbbIk6+D1eNtBW5hMN77eauevnd
X-Gm-Gg: ASbGncupSAIK4MZ0/UIecy8G0BRU99zY4L8Lf0Bsf7aGndI+31tbVy8Iqu63OK6pF8g
	MSYuEtJlKgkxb4yP+VBKAaIfBdkzChnWBh1E44Xb2WrbQkdu2UrQRlUcpcEBCReCAItgbE0iKSu
	yozV5138fMl1xQWN45KnmBQ6sgYjLVbzaHzQl5MV3esXkwrwDCibAnQa7CS8hbykIc/D+3rFsU0
	yYsB3RVHr1hYyMr/FxKDBZg9qYEIciqe/AbK0jTtryoLZHohfAWSiquY3ANJTlg9htPQRgpTYA4
	XtTA2st8sDo63WfpFnPJGwFN6hmhhSwWJCwLs3+bryha/MhF9RBlFqS5nudzRJmFBpcbhflhQMq
	ZosIA96bvp8fM0o3Rqr2N7R1uSMmF1uCZgvPRus3df3YyCq8F5bTHZY3kBWZEoEdh2CXAmAJ8mT
	iQCfikOHrC+hHsSi21JyVR19QL9p/i27dZqLrk5yguOvCIwOt+CVQcZXp2w7mt
X-Google-Smtp-Source: AGHT+IFJk7EWQFaE9kwr3zU0XKerfv3lE4YseN94fK2q5KPi739KzAMAWqmx1R7MhCVpDTBFeV94zw==
X-Received: by 2002:a17:907:3ccc:b0:b7a:1bdd:3311 with SMTP id a640c23a62f3a-b7a24758811mr743688066b.62.1765183800945;
        Mon, 08 Dec 2025 00:50:00 -0800 (PST)
Message-ID: <8b321818-5ca9-4de1-8621-c74a6a88e0fe@gmail.com>
Date: Mon, 8 Dec 2025 09:49:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] xen/mm: add generic domain_clamp_alloc_bitsize()
 macro
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>
References: <20251128152218.3886583-1-grygorii_strashko@epam.com>
 <20251128152218.3886583-3-grygorii_strashko@epam.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <20251128152218.3886583-3-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/28/25 4:22 PM, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
>
> Add generic domain_clamp_alloc_bitsize() macro and clean up arch specific
> defines.
>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: no changes, added tag
>
>   xen/arch/arm/include/asm/mm.h   | 2 --
>   xen/arch/ppc/include/asm/mm.h   | 2 --
>   xen/arch/riscv/include/asm/mm.h | 2 --
>   xen/arch/x86/include/asm/mm.h   | 1 +
>   xen/include/xen/mm.h            | 4 ++++
>   5 files changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index 4c6cc64aa7ba..ec2d2dc5372a 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -313,8 +313,6 @@ struct page_info *get_page_from_gva(struct vcpu *v, vaddr_t va,
>   /* Arch-specific portion of memory_op hypercall. */
>   long arch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
>   
> -#define domain_clamp_alloc_bitsize(d, b) (b)
> -
>   unsigned long domain_get_maximum_gpfn(struct domain *d);
>   
>   /* Release all __init and __initdata ranges to be reused */
> diff --git a/xen/arch/ppc/include/asm/mm.h b/xen/arch/ppc/include/asm/mm.h
> index e478291fdf55..91c405876bd0 100644
> --- a/xen/arch/ppc/include/asm/mm.h
> +++ b/xen/arch/ppc/include/asm/mm.h
> @@ -96,8 +96,6 @@ static inline struct page_info *virt_to_page(const void *v)
>   /* TODO: implement */
>   #define mfn_valid(mfn) ({ (void) (mfn); 0; })
>   
> -#define domain_clamp_alloc_bitsize(d, b) (b)
> -
>   #define PFN_ORDER(pfn_) ((pfn_)->v.free.order)
>   
>   struct page_info
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> index 11e9f26bf0a5..e5ea91fa4d0c 100644
> --- a/xen/arch/riscv/include/asm/mm.h
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -292,8 +292,6 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>   /* TODO: implement */
>   #define mfn_valid(mfn) ({ (void)(mfn); 0; })
>   
> -#define domain_clamp_alloc_bitsize(d, b) ((void)(d), (b))
> -
>   #define PFN_ORDER(pg) ((pg)->v.free.order)
>   
>   extern unsigned char cpu0_boot_stack[];
> diff --git a/xen/arch/x86/include/asm/mm.h b/xen/arch/x86/include/asm/mm.h
> index 08153e6d6fa2..17ca6666a34e 100644
> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -621,6 +621,7 @@ extern int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm);
>   
>   void domain_set_alloc_bitsize(struct domain *d);
>   unsigned int domain_clamp_alloc_bitsize(struct domain *d, unsigned int bits);
> +#define domain_clamp_alloc_bitsize(d, bits) domain_clamp_alloc_bitsize(d, bits)
>   
>   unsigned long domain_get_maximum_gpfn(struct domain *d);
>   
> diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
> index b968f47b87e0..426362adb2f4 100644
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -641,4 +641,8 @@ static inline void put_page_alloc_ref(struct page_info *page)
>       }
>   }
>   
> +#ifndef domain_clamp_alloc_bitsize
> +#define domain_clamp_alloc_bitsize(d, bits) ((void)(d), (bits))
> +#endif
> +
>   #endif /* __XEN_MM_H__ */

LGTM:
  Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.

~ Oleksii


