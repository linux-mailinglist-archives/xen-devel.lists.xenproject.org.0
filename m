Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0019024D3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 17:00:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737352.1143612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgVG-0002Qb-KY; Mon, 10 Jun 2024 15:00:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737352.1143612; Mon, 10 Jun 2024 15:00:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGgVG-0002Oa-I1; Mon, 10 Jun 2024 15:00:10 +0000
Received: by outflank-mailman (input) for mailman id 737352;
 Mon, 10 Jun 2024 15:00:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGgVE-0002OK-Tg
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 15:00:08 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fc514f8-273a-11ef-b4bb-af5377834399;
 Mon, 10 Jun 2024 17:00:06 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a6f13dddf7eso184452966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 08:00:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1d8369casm168170166b.225.2024.06.10.08.00.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 08:00:05 -0700 (PDT)
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
X-Inumbo-ID: 1fc514f8-273a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718031606; x=1718636406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A60tftk2W4ZZSJmfLCRU6alxBe9/4ElxSP0dkCVeOp4=;
        b=GU3URsnMKaas9MmDUpSvqkQM1l7ZvNho3duymTunOG1m5kC6v1nt1imvrxuEP+TuPS
         mPwhVzmQjoV6ubOZXb0hTbdYvr2WEIcuag1LrYFP/cZhEfgjfFWlxTb+NgQbuZnZg077
         Dmt0bzvRiOamIqC5a18swQhWe1w1md9+s5jH86lAyrsCHWYP6Zyzb4WD4lvVaienSwHR
         SsSzvJ2F50Yf9e3RgJ4tregYpnDiVijcZDpArtBRSevqlX1tdy89DYqFCwrjk1twOjDX
         GZB4sYxKRVatQgjFMQOqEeBmh7Xk+nIGQ8ZXYojpi0fmHjuyGtbsXsEyBgTziw1y3o+A
         pRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718031606; x=1718636406;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A60tftk2W4ZZSJmfLCRU6alxBe9/4ElxSP0dkCVeOp4=;
        b=DCcYy2oCQL0FxwjGWzadpwUnhP7jD5h8qrMOGv1QcKwcoTXGBAsSYZuMXieCTuey7p
         6UWpKAyHaaIELqozGUzpK/zJhjidFkmxVT+Fc8hc2i0NsSgLNolxIjQl3RqheeWzeWxo
         dd8mpONGTnrYYGwn9uTWhQs5IeLO82bEN/LCKcYaiu07nOSzh1+RyhFfZ5py6NuUISQZ
         MnZmhB0MIXG/c8beKg7VKWyk3C4l21i4Wlc0HXxcsX/tc8N03TZSfXD7DTr84iBGZ9PO
         vZ6G4r0UVRphoeB9VSmB9SpiG7NI/9Bqa46f4a9zmUnf81MzjGO/bLzVkk4qnssVwyV0
         6pWA==
X-Gm-Message-State: AOJu0YwLIWHJx4wC0O9Z+P0NnD3cR/qXgn5t9PXJqAFDwynYiOJCbyDy
	EFsLgF0WELkr7A0vurMdu5A6dgx/HJ5Et+na4as81FFl9c/nY5d+9MdkBUT4pSrXF6lEEABYKDo
	=
X-Google-Smtp-Source: AGHT+IE4ZHN11aSHdrnEkfqOLqDlff3wmihPd1/qlTTDooB0/fZcRP5H4FKX8NpeXPurJO2X2Tfhvg==
X-Received: by 2002:a17:906:2b57:b0:a6f:1d8c:f22f with SMTP id a640c23a62f3a-a6f1d8cf68emr213049566b.26.1718031606165;
        Mon, 10 Jun 2024 08:00:06 -0700 (PDT)
Message-ID: <dcdb2217-d3be-4cfa-b698-d18bdfdd91e3@suse.com>
Date: Mon, 10 Jun 2024 17:00:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] x86/EPT: relax iPAT for "invalid" MFNs
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
Content-Language: en-US
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
In-Reply-To: <56063a8f-f569-4130-ac25-f0f064e288a1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2024 16:58, Jan Beulich wrote:
> mfn_valid() is RAM-focused; it will often return false for MMIO. Yet
> access to actual MMIO space should not generally be restricted to UC
> only; especially video frame buffer accesses are unduly affected by such
> a restriction. Permit PAT use for directly assigned MMIO as long as the
> domain is known to have been granted some level of cache control.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> Considering that we've just declared PVH Dom0 "supported", this may well
> qualify for 4.19. The issue was specifically very noticable there.

Actually - meant to Cc Oleksii for this, and then forgot.

Jan

> The conditional may be more complex than really necessary, but it's in
> line with what we do elsewhere. And imo better continue to be a little
> too restrictive, than moving to too lax.
> 
> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -503,7 +503,8 @@ int epte_get_entry_emt(struct domain *d,
>  
>      if ( !mfn_valid(mfn) )
>      {
> -        *ipat = true;
> +        *ipat = type != p2m_mmio_direct ||
> +                (!is_iommu_enabled(d) && !cache_flush_permitted(d));
>          return X86_MT_UC;
>      }
>  


