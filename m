Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57446CFEC50
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 17:05:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196870.1514580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdW1o-000510-NC; Wed, 07 Jan 2026 16:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196870.1514580; Wed, 07 Jan 2026 16:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdW1o-0004yY-K2; Wed, 07 Jan 2026 16:04:56 +0000
Received: by outflank-mailman (input) for mailman id 1196870;
 Wed, 07 Jan 2026 16:04:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdW1n-0004yS-Qj
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 16:04:55 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a56e534-ebe2-11f0-9ccf-f158ae23cfc8;
 Wed, 07 Jan 2026 17:04:53 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so20385005e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 08:04:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f4184e1sm104147965e9.4.2026.01.07.08.04.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 08:04:52 -0800 (PST)
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
X-Inumbo-ID: 9a56e534-ebe2-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767801893; x=1768406693; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tiGzRepSzXphOmw/6bi+x10Xc/ehmJ4ekTp0LoDhBgw=;
        b=GYTk66aY/7pJWzLRHBJaAn/jCYQuiIdzGWDNe/xvtphYWPSUneoAdwBVAm426ScdQr
         tq5B5cigP/cz//+EUj3B16tGVPV1ri0dzUinCwtzlywyEPUU9tr1KdgJfT2Zn9WhzxWG
         57TQ2Q4bdSzA/GOiV2BURM/czY3JZqXCf/ulTOXWTdCBBqfEOPJ7YjcPE9gLYctEeCeC
         jCG0M8Mm2BkCv9o15OQOyTm2hcYgIZKN7mg+q3ukOm7MNLF5wN/175jjQJ4PtWN0AZPm
         0Mecnsrztk123IIKfg3juf/HevIUliy0wQKCanV0NPZy6++jHIpn22FrlFBqO6bXF7o0
         Z9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767801893; x=1768406693;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiGzRepSzXphOmw/6bi+x10Xc/ehmJ4ekTp0LoDhBgw=;
        b=RoBnGPphhrnNTBAmxiVsKbI7aOdzsGI7GHCsDm8+JRKlFgVfAaqNKZSuIqI/30fmvb
         hgolOJv1AHQBEMcmMYCSxCNN/6aZqqabCc+mgt4U+sR80zQQ7MvMbHqjhXiyBs+qGcf9
         TOGSvLtGtSnW3Ij+nJAU2qKZXDP9O4DfP9mXiZLIKzYkeoBqiDk8e2aOZpaYejDuJlLk
         PwgPCrusL3YcY9pKhlG1UgDul5F+Cm5Ce5P7/pJk+AOaNvUbemIon/3uPp2VaThLSdES
         WVxFaUXiI+hKsNVOR47kojj9UpG4bMrToXln6R6aDpDojG7cWRdZsiNvrAfPCT+0Eh/m
         EMeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVOvhAw7GSus1zw7Y8ilpOQuh7Uc5Fc/pIRCtGmG5jRCXp/ZVJ59xZLJG6lTjOwiYJyaZBS3OxiSM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzysnoJHPCsSNqoYcAjd8jGqTxW/Kmxxphj2rxBk4KtvTcv2unl
	/qcWH+rC9XgkWlIWkj133DDhcLs+Tw0OVrdwUwlFzNXtiLn3bspC2aQOI7dIFYibTw==
X-Gm-Gg: AY/fxX4uxa2mMZvSk/WQ7xKWi/kEHtAIu++BpkP4PovAcXb1hs+huvbfVXSR5K9Hjx+
	3nq+Nu7I6TrEnboa2oCvCZGb02ZxWcoC46TNKINfsRNaWdXnYw/q0diCx85rN+2iyPtAjjB/U96
	SnmotAAb9jH+voeDXqCtTfYAH/uA546IpSGsNXHGo9WBWgJurNCk6xzonR9RWdBRfJ7qH0W2ETg
	mmaJQtDk01betA2RzlrgvzT+oneThLAWnCvQqfPsZr1MjNyM0d03vhFCUj7sHIK9eyR0ioTsNMl
	sUQp6gXAURfEKDV966DtL59unt3hZszz/nJ/AgbmgfMEYHBomCZnZZ90xKKRc+7MKNBvR1fZ8qP
	pBKySLXN/00R89eN94+j+a+KgffWHjUHAASZEtogZEzA6uEaqMJJ4P+5NyOC/yFzZyEGRINMcSS
	pC2C++aC1j/K0yhx5P8cyhXH/r7E5iQLPhKseioUwUA/NvPHbplFcE3HzSfriIw7GcDZDbXUf9T
	ic=
X-Google-Smtp-Source: AGHT+IH8/+zHg294Da7lJfq60VMTePYhJ0ulpPj8OJStj+ldOdQo8z/1OAiK/hqTZ6kEOimhxFydOA==
X-Received: by 2002:a05:600c:4ed1:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-47d84b54031mr37511495e9.33.1767801892843;
        Wed, 07 Jan 2026 08:04:52 -0800 (PST)
Message-ID: <98dc7b62-839a-45e3-a9a7-f8dbfa616c06@suse.com>
Date: Wed, 7 Jan 2026 17:04:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 06/15] xen/riscv: introduce vcpu_kick() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <b27b8bc4e03901b7f3184f2a041c74497eedbb02.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b27b8bc4e03901b7f3184f2a041c74497eedbb02.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> Add a RISC-V implementation of vcpu_kick(), which unblocks the target
> vCPU and sends an event check IPI if the vCPU was running on another
> processor. This mirrors the behavior of Arm and enables proper vCPU
> wakeup handling on RISC-V.
> 
> Remove the stub implementation from stubs.c, as it is now provided by
> arch/riscv/domain.c.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


