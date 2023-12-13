Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CD2810C68
	for <lists+xen-devel@lfdr.de>; Wed, 13 Dec 2023 09:27:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653754.1020251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDKa3-0003v0-HF; Wed, 13 Dec 2023 08:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653754.1020251; Wed, 13 Dec 2023 08:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDKa3-0003s8-EU; Wed, 13 Dec 2023 08:26:59 +0000
Received: by outflank-mailman (input) for mailman id 653754;
 Wed, 13 Dec 2023 08:26:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6bXc=HY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDKa2-0003ru-O0
 for xen-devel@lists.xenproject.org; Wed, 13 Dec 2023 08:26:58 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60ed3847-9991-11ee-98e9-6d05b1d4d9a1;
 Wed, 13 Dec 2023 09:26:57 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a22f59c6aeaso74995966b.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Dec 2023 00:26:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ts4-20020a170907c5c400b00a1cc1be1158sm7357427ejc.165.2023.12.13.00.26.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 00:26:56 -0800 (PST)
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
X-Inumbo-ID: 60ed3847-9991-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702456016; x=1703060816; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xcvnI3gr77gLnsWSVXJXZmpqY64EySOREAcD6XFYIxk=;
        b=GLMLesJjQONW8f5pIQIe48jOalmddXVuHA43EOQKStPbLVVKEGcm5cNMDtLiAcUNwS
         D8kjrslQsPwPVV5s4vyxhZbf7EOcwZKZVO2z/7Ue3PXVLlUrrcKW+pP/kFtIrgeTvk0S
         JCq43o3twouYWTdd91hb3vJY9ZBxooe0vbLPKUt0tY847HUaJQYyT0w4Zx7KRdy6QxZp
         6OpFlzpYS2WP6B7sMSdEACl5ri/Y+B1OPUraZe7pPWZoktIqiRGQo0s5RtjvaCgS5w2k
         f3SJkbKs9yQ6Qg+hvb38RKqKhmwRgQLxV/A+ytGC3TWfXvFZSvot3rFsgXoSxq/MhovL
         g0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702456016; x=1703060816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xcvnI3gr77gLnsWSVXJXZmpqY64EySOREAcD6XFYIxk=;
        b=PoFfW/z2gjaK3IT1Piu1ud9RF02YH6KOamLCVUvTWI6DhS3l/wLYBGlqxy3mNctWaX
         Ni1UjG5Cjl4qJeZ98A8H9FDh02VDvrIMdKRnsrK2xKCziYDGk94Ur28vkBZolGKIcnEy
         eWBz3WVsfsoPg4/M5PJEuCuWj2rqOf+YSJFvd98qxehnxN5rK5vu7mmj6RMcfnFv0trw
         dp/iLfob4R3Rb1tKoaXrK5OEUyBfdrVm/jrmnYqP8RZP0hi8eOB1tTdSHnirOFaA5sif
         cMGxRH55vzWnAXOR1nAFTZtEAhEDFMu+ATh21QjuhRFUkHPXrG2PNHSeh0YuT+02Axqj
         CN1A==
X-Gm-Message-State: AOJu0YyHNDiCwSQ/KC+y9VH0/sBPRAcQQrtB5TENH9CNmI9Y0NIOqkVn
	Cza/RuuDmnDuCV/ficZd+tMl
X-Google-Smtp-Source: AGHT+IFX5/B2c7BQUI38CTiF5CxdbzSNES/BIwOVW+PbrcCvGuEZktLWmv29CulcEcMlhjsZd2UczQ==
X-Received: by 2002:a17:907:7e94:b0:a19:a19b:55f3 with SMTP id qb20-20020a1709077e9400b00a19a19b55f3mr5021804ejc.131.1702456016695;
        Wed, 13 Dec 2023 00:26:56 -0800 (PST)
Message-ID: <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com>
Date: Wed, 13 Dec 2023 09:26:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
 <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2023 10:14, Nicola Vetrini wrote:
> --- a/xen/arch/arm/include/asm/numa.h
> +++ b/xen/arch/arm/include/asm/numa.h
> @@ -2,8 +2,9 @@
>  #define __ARCH_ARM_NUMA_H
>  
>  #include <xen/mm.h>

With this, ...

> +#include <xen/types.h>
>  
> -typedef u8 nodeid_t;
> +typedef uint8_t nodeid_t;
>  
>  #ifndef CONFIG_NUMA
>  
> @@ -12,10 +13,9 @@ typedef u8 nodeid_t;
>  #define node_to_cpumask(node)   (cpu_online_map)
>  
>  /*
> - * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
> - * is required because the dummy helpers are using it.
> + * TODO: define here first_valid_mfn as static when NUMA is supported on Arm,
> + * this is required because the dummy helpers are using it.
>   */
> -extern mfn_t first_valid_mfn;

... and this declaration moved to xen/mm.h, how is it going to be possible
to do as the adjusted comment says? The compiler will choke on the static
after having seen the extern.

I also firmly disagree with the entirely unrelated u8 -> uint8_t change
above. Such tidying can be done when somewhat related to what a patch is
doing anyway, but here there's (imo) not even a vague connection.

Jan

