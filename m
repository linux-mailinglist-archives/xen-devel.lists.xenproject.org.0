Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5DB8A93B1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 09:05:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707971.1106448 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLom-0000oc-1d; Thu, 18 Apr 2024 07:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707971.1106448; Thu, 18 Apr 2024 07:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxLol-0000mH-V7; Thu, 18 Apr 2024 07:04:23 +0000
Received: by outflank-mailman (input) for mailman id 707971;
 Thu, 18 Apr 2024 07:04:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxLok-0000mB-Vw
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 07:04:22 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e1cd9b75-fd51-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 09:04:21 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-418ee51e280so549645e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 00:04:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j19-20020a05600c1c1300b004161bffa48csm1569340wms.40.2024.04.18.00.04.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 00:04:21 -0700 (PDT)
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
X-Inumbo-ID: e1cd9b75-fd51-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713423861; x=1714028661; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nyqzj46Ls/gyNcGF8lNk479KunhyCUDrMeAawEpVSy4=;
        b=H6wT95uxWFUixBvDplAgEusDGyrHnGYLYQtK2ogQXNVyMS729Q3tQXOijKgiObl5EL
         ttpNKekIw+Q0MiTkFse96YSSH0VLjVDQ/KqrQdBqsrqJINLK9qveGhHD11f7UNv3F7Ob
         cxFjqDu3zgR7zghDIj00hNX8DFSbUnJ5dMbsySvA3Xx0G+0hLeXPCHxNH31n5A2BNYdL
         eYjmL+ulFoSUOMfR7HEZ6rJg6VNEw+X/Bx/gjedN5tT34GqH7OUjHE0LjkQ347Nmdfki
         u/j13nwtXaqPnkGZmubXaKS2awXQShr7c9a4XHE0yJHgM7mOMRPnCIPCXiqfN1UMYmMQ
         64Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713423861; x=1714028661;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nyqzj46Ls/gyNcGF8lNk479KunhyCUDrMeAawEpVSy4=;
        b=CKnTrewvHhPFXZp5mHl4heeGtf79pJQ2UhxxJA9iYV/0iKjgU1OTwkfeFybX3uA+1s
         SsKNms2StrdfOKKbdr52p7WCwQkfXFI5Hu9ofGNqFaNEE3DPqc58c1JSRcRJC3Gu2+JE
         p9nUq6fn1BN5ryJbPKGGDTtqMx/+2j6GzqJXd29abTtgN8x95DEE18qznl+U2OJtaE6L
         p7eG5THyJDklNhgmyHQ2rSzbVDA7ZZe1UmVsZKv5ryn8YLnSlEHAWHJl2fW+u9+uJ7Ou
         +1JU/u9rTyfAxqyByx3UX1AZXnJnBvHu1jL+om5zfPTaS3Xh+zgv5JDV873PRybZrVNn
         pvpA==
X-Forwarded-Encrypted: i=1; AJvYcCXkgo6GzidJ86RmCNmQGA5k/XkV3qh6wsZuviJmPorJNIfoLXJPbngWxn+r0ZDSaSZokAg75cn1vEV/ysIE9FXdpRQKxBNLtLZgpjA6tpA=
X-Gm-Message-State: AOJu0Yz80eT/e2UvlrNvIBXyJiYrXR25uk9ODgRlnFADuwbXE2omX9VD
	WnUrebG8c6V92pR7GuqNkGLyLiof7K8YN6NMOMjOL0U8Y4TVPyI2gpJbBn/OwA==
X-Google-Smtp-Source: AGHT+IEiKmj9MI/w81wjCP0w4mpKyDWvVOES2R0K/SMCx/gwOAnTOB0ki4+cCPQ8krJ0mk2znBLzcw==
X-Received: by 2002:a05:600c:524a:b0:416:3db7:74b4 with SMTP id fc10-20020a05600c524a00b004163db774b4mr1120095wmb.24.1713423861233;
        Thu, 18 Apr 2024 00:04:21 -0700 (PDT)
Message-ID: <4eb232fe-c5ca-4bda-a9dc-a041a55122d3@suse.com>
Date: Thu, 18 Apr 2024 09:04:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/public: replace remaining int and long
Content-Language: en-US
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com,
 bertrand.marquis@arm.com, george.dunlap@citrix.com, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2404101644130.976094@ubuntu-linux-20-04-desktop>
 <20240410234740.994001-4-stefano.stabellini@amd.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20240410234740.994001-4-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.04.2024 01:47, Stefano Stabellini wrote:
> --- a/xen/include/public/arch-x86/hvm/save.h
> +++ b/xen/include/public/arch-x86/hvm/save.h
> @@ -415,7 +415,7 @@ struct hvm_hw_pci_irqs {
>       * Indexed by: device*4 + INTx#.
>       */
>      union {
> -        unsigned long i[16 / sizeof (unsigned long)]; /* DECLARE_BITMAP(i, 32*4); */
> +        xen_ulong_t i[16 / sizeof (xen_ulong_t)]; /* DECLARE_BITMAP(i, 32*4); */
>          uint64_t pad[2];
>      };
>  };
> @@ -428,7 +428,7 @@ struct hvm_hw_isa_irqs {
>       * Indexed by ISA IRQ (assumes no ISA-device IRQ sharing).
>       */
>      union {
> -        unsigned long i[1];  /* DECLARE_BITMAP(i, 16); */
> +        xen_ulong_t i[1];  /* DECLARE_BITMAP(i, 16); */
>          uint64_t pad[1];
>      };
>  };

Taking just this as example: Why is this not part of patch 3? If there was
"x86" somewhere in the title, I could probably see a reason for such
separation.

> --- a/xen/include/public/arch-x86/xen-x86_32.h
> +++ b/xen/include/public/arch-x86/xen-x86_32.h
> @@ -68,7 +68,7 @@
>  #define MACH2PHYS_VIRT_END    xen_mk_ulong(__MACH2PHYS_VIRT_END)
>  #define MACH2PHYS_NR_ENTRIES  ((MACH2PHYS_VIRT_END-MACH2PHYS_VIRT_START)>>2)
>  #ifndef machine_to_phys_mapping
> -#define machine_to_phys_mapping ((unsigned long *)MACH2PHYS_VIRT_START)
> +#define machine_to_phys_mapping ((xen_ulong_t *)MACH2PHYS_VIRT_START)

While making this (and the corresponding 64-bit) adjustment, we ought to
at least consider to also add const. The overall change is at risk of being
disruptive to consumers anyway, in case they use less lax compilers than
e.g. gcc and Clang are: "unsigned int" and "uint32_t", even if both 32 bits
wide, don't necessarily need to be treated as the same type by the compiler.
In fact portability of code would be increased if compilers insisted on
clearly distinguishing the two.

In fact because of this it may want considering to split the conversions of
"long" from those of "int", just to cover the remote possibility of the
latter needing reverting from some reason.

> --- a/xen/include/public/arch-x86/xen.h
> +++ b/xen/include/public/arch-x86/xen.h
> @@ -141,7 +141,7 @@ struct trap_info {
>      uint8_t       vector;  /* exception vector                              */
>      uint8_t       flags;   /* 0-3: privilege level; 4: clear event enable?  */
>      uint16_t      cs;      /* code selector                                 */
> -    unsigned long address; /* code offset                                   */
> +    xen_ulong_t address;   /* code offset                                   */
>  };

Nit: Please add two padding blanks to retain columnar arrangement of field
names.

> @@ -174,36 +174,36 @@ struct vcpu_guest_context {
>  #define VGCF_syscall_disables_events   (1<<_VGCF_syscall_disables_events)
>  #define _VGCF_online                   5
>  #define VGCF_online                    (1<<_VGCF_online)
> -    unsigned long flags;                    /* VGCF_* flags                 */
> -    struct cpu_user_regs user_regs;         /* User-level CPU registers     */
> -    struct trap_info trap_ctxt[256];        /* Virtual IDT                  */
> -    unsigned long ldt_base, ldt_ents;       /* LDT (linear address, # ents) */
> -    unsigned long gdt_frames[16], gdt_ents; /* GDT (machine frames, # ents) */
> -    unsigned long kernel_ss, kernel_sp;     /* Virtual TSS (only SS1/SP1)   */
> +    xen_ulong_t flags;                    /* VGCF_* flags                 */
> +    struct cpu_user_regs user_regs;       /* User-level CPU registers     */
> +    struct trap_info trap_ctxt[256];      /* Virtual IDT                  */

Please can these two lines remain untouched, and other lines instead have
padding blanks added to keep comments aligned?

> @@ -228,7 +228,7 @@ struct arch_shared_info {
>       * is to be used.
>       */
>      xen_pfn_t     pfn_to_mfn_frame_list_list;
> -    unsigned long nmi_reason;
> +    xen_ulong_t nmi_reason;

Nit: Here there again want to be two padding blanks.

Jan

