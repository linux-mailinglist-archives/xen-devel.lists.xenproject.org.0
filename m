Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C09288A9E6
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 17:46:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697825.1088976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ronS9-0004oj-23; Mon, 25 Mar 2024 16:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697825.1088976; Mon, 25 Mar 2024 16:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ronS8-0004lw-VR; Mon, 25 Mar 2024 16:45:40 +0000
Received: by outflank-mailman (input) for mailman id 697825;
 Mon, 25 Mar 2024 16:45:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ronS7-0004lq-Qh
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 16:45:39 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c13da5b-eac7-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 17:45:38 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56bf6418434so2689068a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 09:45:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o22-20020aa7dd56000000b0056c07b6924csm2074248edw.41.2024.03.25.09.45.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 09:45:37 -0700 (PDT)
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
X-Inumbo-ID: 1c13da5b-eac7-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711385138; x=1711989938; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ebxxSQhH4DQUrHi2mWFUfMsXFjTw2goRkbA68HaT/lA=;
        b=GEYGIv2JuDBsGnBDWxl1OEO7pSu3pCIZQ5GL6WanIhuApcvMFaPmYjvLct3Hpo6VIj
         7SzejXLqKfshevRDFDjPcnG1VBUg3ZASOCxe6S/wdBUQwKs9U87IeYKjKfSEGQB8WffE
         v2gAK4H8fFSU6ujiNKofJudw89hWpkJ3iUYsoOcZDYEWg0bdS/I1IDhWeX1mJKG05lCl
         jPh47ulgMV4CBF4JqgPHTQj5T8XsmyTsQjB5TGPjQ9Ju9wCVFEip+A8qQX+crpXB1wvp
         Qmrx21BhywbsX+/ZNBsJMtFuj+5R44YqW9Cz2moZTx/4BbeBWsn9PDZu0TWA0fG9Gd7P
         k0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711385138; x=1711989938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ebxxSQhH4DQUrHi2mWFUfMsXFjTw2goRkbA68HaT/lA=;
        b=B4EuRqb7AuT4/G1EhsOT1pR8Kkpx/fhaygsM68AtcprHtMet+Vx1P1WN4Pd05O1fQw
         KNxRCqfjj/RInNyAdhPGyB1qs94d7pQHUAk0tajyfMeU0cJxaV5ggEXMstCqPAVT66y4
         jZmKZoTjs0cMaTmg9OfffjTQT//tLshBucsqOkqVGO5iWUqujqd1HjzLiePmjarH86+n
         kOXmLYZCXNsJd23qLmr/anvco3jJcauAaLWahuRV4GlfSuQOxdhCmJwYVxZ2uoM8AxFH
         dbdcXVTFaYwBLv9V7+P4qmc4e3Ve86xiZJhvNP554TzK7Tr7qKp19/g10tdYB2lduxW/
         lSlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBE/jBCyh5/Qqtm7om8fW+0ohGUlBqmfwaaZ8iRFP8nwr9QRiq/qsASZ3A+gkH44FUPivi+qffbCQM83HAv3sbxSx+p2YVfV7hdAxov2M=
X-Gm-Message-State: AOJu0YwT8x6j3dXTF+Ep7xJafWC6RrpgLngaOTKXDC1jc+8nOry9GKvD
	qq0DBLU9RXBjNEl1IfmaYLefFmI/PkozpeiB5OlScmeMsCTf6XV+Z8kCkN7FHQ==
X-Google-Smtp-Source: AGHT+IGzhgjJLFfoafS2jGh/RAfKcRyn/OZfKqVTBfsKckThOHMeopa3ir4ic49vb97Wetgxd1eDZA==
X-Received: by 2002:a50:955a:0:b0:568:c608:8058 with SMTP id v26-20020a50955a000000b00568c6088058mr5378324eda.17.1711385138209;
        Mon, 25 Mar 2024 09:45:38 -0700 (PDT)
Message-ID: <2e7fe91e-b483-4d61-9783-0cfa3753911f@suse.com>
Date: Mon, 25 Mar 2024 17:45:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC save
 area
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-2-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240109153834.4192-2-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2024 16:38, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -288,7 +288,10 @@ void update_guest_memory_policy(struct vcpu *v,
>  static void cpu_policy_updated(struct vcpu *v)
>  {
>      if ( is_hvm_vcpu(v) )
> +    {
>          hvm_cpuid_policy_changed(v);
> +        vlapic_cpu_policy_changed(v);
> +    }
>  }

This is a layering violation imo; hvm_cpuid_policy_changed() wants
to call vlapic_cpu_policy_changed().

> @@ -1083,6 +1083,22 @@ static void set_x2apic_id(struct vlapic *vlapic)
>      vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
>  }
>  
> +void vlapic_cpu_policy_changed(struct vcpu *v)
> +{
> +    struct vlapic *vlapic = vcpu_vlapic(v);
> +    struct cpu_policy *cp = v->domain->arch.cpu_policy;

const please

> @@ -1514,6 +1530,13 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>      const struct vcpu *v = vlapic_vcpu(vlapic);
>      uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>  
> +    /*
> +     * Guest with hardcoded assumptions about x2apic_id <-> vcpu_id
> +     * mappings. Recreate the mapping it used to have in old host.
> +     */
> +    if ( !vlapic->hw.x2apic_id )
> +        vlapic->hw.x2apic_id = v->vcpu_id * 2;

This looks to depend upon it only ever being vCPU which may get a (new
style) APIC ID of 0. I think such at least wants mentioning in the
comment.

> --- a/xen/include/public/arch-x86/hvm/save.h
> +++ b/xen/include/public/arch-x86/hvm/save.h
> @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
>      uint32_t             timer_divisor;
>      uint64_t             tdt_msr;
> +    uint32_t             x2apic_id;
> +    uint32_t             rsvd_zero;
>  };

I can't spot any checking of this last field indeed being zero.

Jan

