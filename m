Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D86F989B62
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 09:25:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807060.1218245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAmU-0004ff-GR; Mon, 30 Sep 2024 07:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807060.1218245; Mon, 30 Sep 2024 07:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svAmU-0004dU-DI; Mon, 30 Sep 2024 07:25:18 +0000
Received: by outflank-mailman (input) for mailman id 807060;
 Mon, 30 Sep 2024 07:25:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1QIX=Q4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svAmS-0004dO-Cr
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 07:25:16 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2359a3ca-7efd-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 09:25:15 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d51a7d6f5so537894166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 00:25:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93d4bd51f3sm353605066b.92.2024.09.30.00.25.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 00:25:14 -0700 (PDT)
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
X-Inumbo-ID: 2359a3ca-7efd-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727681115; x=1728285915; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ICiNjIx0yrRRvrVmCtM9+OIZ7DbJQF77phagiTd4XNs=;
        b=N6VUxA4ds9E+Vt08umvSWDfX0/tBx2ahdtJdx63ROjNkATCDxSzQy039HZz8hTYVBQ
         CtcmjQbq27IBWSJDnnLrcX2Bhpws/NO7h53ngmpEYF6o/xUdYIeE9dOkWUTDrr46Lmwt
         EL6RVDQqeFhjZT9VNBi5IpBQwAMvKRTPfpduhAawCSAxMiVHuKOqGUAJeXyv0uFNm7QJ
         HTDQQx9ZkO/4zX5n5DttNyBoW9BxBBQlctuvMV+s1e5AW9q4xdX0U84qFPEn/SCdWj3e
         U8feQzwRc7kZO/byvTb5q6Bsq7f7mk+PLlgB4abTrv6xttXsbBRul8q+6L3FcNrWC+b7
         3ddA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681115; x=1728285915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICiNjIx0yrRRvrVmCtM9+OIZ7DbJQF77phagiTd4XNs=;
        b=vQUNR82qcHFmsY3H1tBrSL3yyS0Y8qfdkW4p12dUt8j86sWPfSE1lLW9mrq7PG35v0
         kRmN77hJ7DqVUIxOiTv/yyyZDX7MFNckufYMEpKwuhCtzJtP/gVU1AYKILwdMFf0lF3J
         DRw4aPMAyMKPA2WDEuh1h9L9myBKJosOdKve3EjUBqOZSMAwSkBpSsKaLe4QHf2DRBIL
         7JkXMw9SH+a2MnJqi55BaoxgSeuHbn8jWAPl00eIGtkk1KbxhAWPfcv9jwQSkNydDAhh
         zmx0WqykwHw9uMNxJMtBFMi7HHLnFrp3BlOCKFSUphyjv5779yagZ9o308AS58B10XE8
         PE/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfGYa+dBuuqRqteXxcT8YoyV1NaDxDRmrePHZs4CTt/dUF1XYJHgzrBzs4PbxDnwvpNUyocnnex5w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz8JRLSwZYqj/lXevF4X0qiZ8CQ/VZ7IY3shFHD9fzOhJ4sOYnN
	aPA/Vk6wyPBOOYoB22FhAsmWT8Aa2LF3Ami1swcIwyNu4Z1igpBWJge/Qg3cow==
X-Google-Smtp-Source: AGHT+IEnZP4SbR9qSwQsfFitrT5J1uCo6PznfL+q9huvRVCx8Fi0fJy6xOgCstqIHD1KOW6/eHN5uQ==
X-Received: by 2002:a17:907:96a9:b0:a8a:7f08:97a6 with SMTP id a640c23a62f3a-a93c4919aaemr1341722166b.24.1727681115037;
        Mon, 30 Sep 2024 00:25:15 -0700 (PDT)
Message-ID: <4a82adf0-28ee-4d2e-ad94-66d3224b66e5@suse.com>
Date: Mon, 30 Sep 2024 09:25:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/7] xen/riscv: introduce functionality to work with
 CPU info
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1727449154.git.oleksii.kurochko@gmail.com>
 <3ffb3ffd38b2e0d3568bfd3f9ef974d61b0d2508.1727449154.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3ffb3ffd38b2e0d3568bfd3f9ef974d61b0d2508.1727449154.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.09.2024 18:33, Oleksii Kurochko wrote:
> Introduce struct pcpu_info to store pCPU-related information.
> Initially, it includes only processor_id and hart id, but it
> will be extended to include guest CPU information and
> temporary variables for saving/restoring vCPU registers.
> 
> Add set_processor_id() function to set processor_id stored in
> pcpu_info.
> 
> Define smp_processor_id() to provide accurate information,
> replacing the previous "dummy" value of 0.
> 
> Initialize tp registers to point to pcpu_info[0].
> Set processor_id to 0 for logical CPU 0 and store the physical
> CPU ID in pcpu_info[0].
> 
> Introduce helpers for getting/setting hart_id ( physical CPU id
> in RISC-V terms ) from Xen CPU id.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



