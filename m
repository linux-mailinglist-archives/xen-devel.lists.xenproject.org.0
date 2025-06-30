Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14214AEE309
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jun 2025 17:49:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029232.1403003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGk8-0005yh-Ur; Mon, 30 Jun 2025 15:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029232.1403003; Mon, 30 Jun 2025 15:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWGk8-0005wK-SG; Mon, 30 Jun 2025 15:48:28 +0000
Received: by outflank-mailman (input) for mailman id 1029232;
 Mon, 30 Jun 2025 15:48:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=erj2=ZN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWGk7-0005wE-On
 for xen-devel@lists.xenproject.org; Mon, 30 Jun 2025 15:48:27 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a3fa46c9-55c9-11f0-b894-0df219b8e170;
 Mon, 30 Jun 2025 17:48:17 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3a6e2d85705so2594412f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Jun 2025 08:48:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b34e31da5fdsm7480783a12.59.2025.06.30.08.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jun 2025 08:48:16 -0700 (PDT)
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
X-Inumbo-ID: a3fa46c9-55c9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751298497; x=1751903297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SO5ZkYq1SHhBddypoKqOAIP98UT5iKIrEFeM/tOKYIs=;
        b=Cir/w+nu8qCxkvet21rxjjL1XwKUajR6TxonFfmW9HTF+FahGLzsW23PkHobzy4rU/
         ihqCyASQ6g8AQuYo9wh0H+8Qtu4W/vwuUUArfmXsYvcDP3fVFPYQKAdasGRa+Y0EMAJo
         jv3xcMDFVTNrufmjQbYDLpWIzY4TQV+hO3ps2e8BhldWHn4GEZiVawoSnf3jEqCCUDG5
         PTxiJZddBxjYdNMW3n1vZQrBJzeR6IYXL8ucB31wtsTPqoTq18GjoiAzaBN32VsLknCF
         6F+asLW4OTEJFdLM+m4o8ifASUmN4wndgCgH48Wr2krIaJas84NL7/SdL/hmy4YQdgLw
         e9gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751298497; x=1751903297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SO5ZkYq1SHhBddypoKqOAIP98UT5iKIrEFeM/tOKYIs=;
        b=EyEKNMNhRJKNAE9Bsh9qkIM7IiHoGsdRTxQ7CQ0GtbGwotxdmL9cZXBHEywc/cUI2t
         EcDTbZwJxPtuG18AzwkPHJYV/J4OHlqr2zI5Kzji1bn1ueRqxu/WQPEjJd9pMfYCb63b
         bCXsQxiJlyl2zWQqslehoNWa2pcpIKR+g4WAsFDrLiCQurX+OZz5nQIytpvD4OdwALiC
         isu+vlM5gQ0WsyTGCoYzA33EqanIfez2DMdGbucne9HD+Kk/1HFXm2jQYJ0wJ6DIbsiZ
         vG6A/IJ0IYC1Bcfehn4O4y8bpdPV2Bbo2Pn5zG4ZQZ1PplhNcn3Aks+JslwmE+nDbDCz
         H8xw==
X-Forwarded-Encrypted: i=1; AJvYcCX7Oh5tW2TlXLGDWqWLJdJje2Dm6UqpAvmaksTRb8fZwMeGhStZuy3Al89CfzwGoWZP0eXjht8WsRo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf9OEf/83LxOnjNggXztqAJDwEQarkXkvxwHydiUWLzVvuyP0l
	gfGPXG9yiv0RLJt+7l/21ghxzguFmKPT1UlzwmfcJVFaK5U5HBMkbTz5fxZEqqpxkQ==
X-Gm-Gg: ASbGncvMwjQ2UIaKyuq01d/pbb16FfJesdOgJJLctm/MPPeojbH5PDqYMh2xlO2SNSQ
	FDFfGOCP19nJNf5I64GijlymwlnDHr5SYqI6TpsQbryp66WePKMH3h16rlSFwjlk2V5eZzwDPGA
	crFBKzDSGkeqXG5NLoUmlJLMomD2rmQgMVIcmU4AYyLGbdCarw7q4wp36WUb/5ajds2AZ/sSW1V
	Ts93VwGpjEoozcW3ecF6q6ic2W+xhNxFD+POu9dhQLDG3H2T1oTz8x4tonpXIx7gi6tAWJgWFUA
	ud+ltyIUV7s9kmkmWLcMLRJW9tbRKmNyVqybgKIsKsdOKnpCssPh2whvyB5w0xRc84vCiZEg0sD
	c6IJ6Qkfklsl+TB5SRHUAhft5PhqB7LbadubV0syiTyKBjEU=
X-Google-Smtp-Source: AGHT+IFn4Pryq0BPKrnvk5mfvtMKvkKnUx+y5EqFQNjSa9FQZso6HtIcCuAtttpHipf18zxfiErB1Q==
X-Received: by 2002:adf:a150:0:b0:3a6:f2da:7fe5 with SMTP id ffacd0b85a97d-3a90b6df1c7mr9291157f8f.55.1751298497042;
        Mon, 30 Jun 2025 08:48:17 -0700 (PDT)
Message-ID: <b06c564f-7cf8-4c9c-9392-892ddc6d5ef4@suse.com>
Date: Mon, 30 Jun 2025 17:48:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/17] xen/riscv: introduce page_set_xenheap_gfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <186e4a778a6dfab205428dfb4d0c59584a162a9f.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <186e4a778a6dfab205428dfb4d0c59584a162a9f.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> Introduce page_set_xenheap_gfn() helper to encode the GFN associated with
> a Xen heap page directly into the type_info field of struct page_info.
> 
> Introduce a GFN field in the type_info of a Xen heap page by reserving 10
> bits (sufficient for both Sv32 and Sv39+ modes), and define PGT_gfn_mask
> and PGT_gfn_width accordingly.

This reads as if you wanted to encode the GFN in 10 bits.

What would also help is if you said why you actually need this. x86, after
all, gets away without anything like this. (But I understand you're more
Arm-like here.)

> @@ -229,9 +230,21 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>  #define PGT_writable_page PG_mask(1, 1)  /* has writable mappings?         */
>  #define PGT_type_mask     PG_mask(1, 1)  /* Bits 31 or 63.                 */
>  
> -/* Count of uses of this frame as its current type. */
> -#define PGT_count_width   PG_shift(2)
> -#define PGT_count_mask    ((1UL << PGT_count_width) - 1)
> + /* 9-bit count of uses of this frame as its current type. */
> +#define PGT_count_mask    PG_mask(0x3FF, 10)
> +
> +/*
> + * Sv32 has 22-bit GFN. Sv{39, 48, 57} have 44-bit GFN.
> + * Thereby we can use for `type_info` 10 bits for all modes, having the same
> + * amount of bits for `type_info` for all MMU modes let us avoid introducing
> + * an extra #ifdef to that header:
> + *   if we go with maximum possible bits for count on each configuration
> + *   we would need to have a set of PGT_count_* and PGT_gfn_*).
> + */
> +#define PGT_gfn_width     PG_shift(10)
> +#define PGT_gfn_mask      (BIT(PGT_gfn_width, UL) - 1)
> +
> +#define PGT_INVALID_XENHEAP_GFN   _gfn(PGT_gfn_mask)

Commentary here would imo be preferable to be much closer to Arm's. I don't
see the point of the extra verbosity (part of which may be fine to have in
the description, except you already say something along these lines there).
While in turn the comment talks of fewer bits than are actually being used
in the RV64 case.

> @@ -283,6 +296,19 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
>  
>  #define PFN_ORDER(pg) ((pg)->v.free.order)
>  
> +static inline void page_set_xenheap_gfn(struct page_info *p, gfn_t gfn)
> +{
> +    gfn_t gfn_ = gfn_eq(gfn, INVALID_GFN) ? PGT_INVALID_XENHEAP_GFN : gfn;
> +    unsigned long x, nx, y = p->u.inuse.type_info;
> +
> +    ASSERT(is_xen_heap_page(p));
> +
> +    do {
> +        x = y;
> +        nx = (x & ~PGT_gfn_mask) | gfn_x(gfn_);
> +    } while ( (y = cmpxchg(&p->u.inuse.type_info, x, nx)) != x );
> +}
> +
>  extern unsigned char cpu0_boot_stack[];
>  
>  void setup_initial_pagetables(void);

What about the "get" counterpart?

Jan

