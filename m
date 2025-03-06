Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDB1A54F39
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 16:34:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903772.1311734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDEE-0004WS-FH; Thu, 06 Mar 2025 15:33:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903772.1311734; Thu, 06 Mar 2025 15:33:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqDEE-0004TM-C7; Thu, 06 Mar 2025 15:33:42 +0000
Received: by outflank-mailman (input) for mailman id 903772;
 Thu, 06 Mar 2025 15:33:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qAxi=VZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tqDEC-0004TG-OV
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 15:33:40 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60537824-faa0-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 16:33:39 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43bc4b1603fso5369585e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 07:33:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bcbd27996sm44601595e9.2.2025.03.06.07.33.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 07:33:38 -0800 (PST)
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
X-Inumbo-ID: 60537824-faa0-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741275218; x=1741880018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uH2iIPv71xUZ7Kh7UsPOG12+ca9p9pw6FI3e2CBLarc=;
        b=I0UEQM7uuQTCaqLkKJXuqMv5UEeshBfWHbQ4dbKn3riD2m4pRswkqQR33tmZJJGyuI
         03Vo0IrSMG4hwsqsxcQxJesL/oymq2H3+Om2xSMbGMKIWu64w97VjZPFYoF8CdRNtwYI
         EQ60makkAXFBm8buRdiAwYhbekdPOz9/hnYjhElACfVK2mfGIDLd1dHVI9p7H+MwOkQd
         u4g+NcIyeiqY97A3A0uKrDApxeiopSDmhDwAPjVm9sxiJHn/kagAfxkFDeGoJkHdvrB5
         bzUXxWOKdyszZQDB0QFucGg6aO3ITHnNVOOoexh6CKcbzSGq7zugq04zx/k2cRLEPTje
         fG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741275218; x=1741880018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uH2iIPv71xUZ7Kh7UsPOG12+ca9p9pw6FI3e2CBLarc=;
        b=rBKsPdRO6u8OKh0bXYBlnMjdDdhzP3F95ijAd9fpBFttQf6uRhFgUWkQnanR/S9CUj
         iyqG1tdUz1t8LeDvHavt9osWkJkpKCf9YDCO5ml+nl4mcfuTYcSx/7wazo/nnRgfomcA
         JcVXv9Ep62Y/pQ0jXDPN0awR4liShZHBawcDNrj3dgdijmHha1CQPfn4ez9hqku8BzbL
         pKfwFjOfLrNpmoAb3a1Es2UV26EHBQKF7bQA8VmIJ/eK3nH5MDwucgrKDXcJyP+6UuHf
         5nH7YX8iMNJTtWRRVovlHHxuzCvO4sxRuj5C53nU7EGHuW6slh6HzDRoH6AOrKbjXcub
         pdjw==
X-Forwarded-Encrypted: i=1; AJvYcCWleHuiv1Hchc+U/IghRl3fhpsZ2MeX7wahejLh8xb/WpWbqpngulGJAHF+iTQ/XiMn1rlydlhyWrY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxuVGoauF/cNG4pgn2+Qdid56ebuqCDrI+8lNbQYE4FUeGrZyXd
	RiIl576T3LVQnSALfc2sCVBoPqadeY8Y0jfMmsMJ4f4hkvwlAvov8Yo4cdOjbw==
X-Gm-Gg: ASbGncu1MGZoyeqZ7kO/T3C88T/EmEufG+HnA1wmM6S1jw2UUfDDdudybTm5huugb4z
	8J8I2GuTTSrRxvQInKR6AiPrEvxf2v3BwTcmIcez6rOHFz7si+Tw9W46PmbU0jUK4hib85gxiL1
	JCvZ+NcZBEE5a8nZbMUVYe1OLd8r+0kEPUXO8V8DzrZ3897a1F3797LfosuJ0x4WMzBrpljkE98
	l5kSW72z8LN1wVgnD5SvCzY1M14GZQkhJWkInfdIKTa8m9r48f852pg7rQuxlgsyTWyiW5WWFJI
	fBoAHx9ITLcitLhDSHBA0lJVTYLVWOIzsXyHKiTDQrwg+sI2qUU4xzyxgPaGQzoSOuPsPOEtD8z
	c/9zgeYk4qgJa2mjwFsvN5jjglHYIwQ==
X-Google-Smtp-Source: AGHT+IESQfeHxj7EAptPkRzt6oe21kZZq+TEJi+fj23Hnu4Easc15eoLJmnxHqh4eUaxb5KsqjxGGg==
X-Received: by 2002:a05:600c:4ed3:b0:439:a155:549d with SMTP id 5b1f17b1804b1-43bd295351bmr63049695e9.12.1741275218478;
        Thu, 06 Mar 2025 07:33:38 -0800 (PST)
Message-ID: <f53539b7-ca49-465c-8aeb-205a489130ea@suse.com>
Date: Thu, 6 Mar 2025 16:33:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] x86/apic: remove delivery and destination mode
 fields from drivers
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250306145733.99927-1-roger.pau@citrix.com>
 <20250306145733.99927-2-roger.pau@citrix.com>
Content-Language: en-US
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
In-Reply-To: <20250306145733.99927-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 15:57, Roger Pau Monne wrote:
> --- a/xen/arch/x86/genapic/bigsmp.c
> +++ b/xen/arch/x86/genapic/bigsmp.c
> @@ -46,8 +46,6 @@ static int __init cf_check probe_bigsmp(void)
>  
>  const struct genapic __initconst_cf_clobber apic_bigsmp = {
>  	APIC_INIT("bigsmp", probe_bigsmp),
> -	.int_delivery_mode = dest_Fixed,
> -	.int_dest_mode = 0, /* physical delivery */
>  	.init_apic_ldr = init_apic_ldr_phys,
>  	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
>  	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> --- a/xen/arch/x86/genapic/default.c
> +++ b/xen/arch/x86/genapic/default.c
> @@ -16,8 +16,6 @@
>  /* should be called last. */
>  const struct genapic __initconst_cf_clobber apic_default = {
>  	APIC_INIT("default", NULL),
> -	.int_delivery_mode = dest_Fixed,
> -	.int_dest_mode = 0, /* physical delivery */
>  	.init_apic_ldr = init_apic_ldr_flat,
>  	.vector_allocation_cpumask = vector_allocation_cpumask_phys,
>  	.cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> --- a/xen/arch/x86/genapic/x2apic.c
> +++ b/xen/arch/x86/genapic/x2apic.c
> @@ -140,8 +140,6 @@ static void cf_check send_IPI_mask_x2apic_cluster(
>  
>  static const struct genapic __initconst_cf_clobber apic_x2apic_phys = {
>      APIC_INIT("x2apic_phys", NULL),
> -    .int_delivery_mode = dest_Fixed,
> -    .int_dest_mode = 0 /* physical delivery */,
>      .init_apic_ldr = init_apic_ldr_phys,
>      .vector_allocation_cpumask = vector_allocation_cpumask_phys,
>      .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,
> @@ -163,8 +161,6 @@ static const struct genapic __initconst_cf_clobber apic_x2apic_mixed = {
>       * The following fields are exclusively used by external interrupts and
>       * hence are set to use Physical destination mode handlers.
>       */
> -    .int_delivery_mode = dest_Fixed,
> -    .int_dest_mode = 0 /* physical delivery */,
>      .vector_allocation_cpumask = vector_allocation_cpumask_phys,
>      .cpu_mask_to_apicid = cpu_mask_to_apicid_phys,

Like we had it everywhere above, ...

> --- a/xen/arch/x86/io_apic.c
> +++ b/xen/arch/x86/io_apic.c
> @@ -1080,8 +1080,8 @@ static void __init setup_IO_APIC_irqs(void)
>               */
>              memset(&entry,0,sizeof(entry));
>  
> -            entry.delivery_mode = INT_DELIVERY_MODE;
> -            entry.dest_mode = INT_DEST_MODE;
> +            entry.delivery_mode = dest_Fixed;
> +            entry.dest_mode = 0;

... here and below these zeros would better gain a comment, or be expressed
as e.g. (untested) MASK_EXTR(APIC_DEST_PHYSICAL, APIC_DEST_MASK).

Jan

