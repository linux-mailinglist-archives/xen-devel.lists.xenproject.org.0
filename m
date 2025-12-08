Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DA4CADCB2
	for <lists+xen-devel@lfdr.de>; Mon, 08 Dec 2025 17:56:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181020.1504104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSeXL-00052a-3b; Mon, 08 Dec 2025 16:56:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181020.1504104; Mon, 08 Dec 2025 16:56:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSeXL-000514-10; Mon, 08 Dec 2025 16:56:35 +0000
Received: by outflank-mailman (input) for mailman id 1181020;
 Mon, 08 Dec 2025 16:56:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSeXJ-00050y-LO
 for xen-devel@lists.xenproject.org; Mon, 08 Dec 2025 16:56:33 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d899c249-d456-11f0-9cce-f158ae23cfc8;
 Mon, 08 Dec 2025 17:56:31 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-477a1c28778so60863725e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 08:56:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479311e712fsm257413065e9.9.2025.12.08.08.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 08:56:30 -0800 (PST)
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
X-Inumbo-ID: d899c249-d456-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765212991; x=1765817791; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=z5kLCWIjE5Ygv+/+tcW6CuQnS8yltNq71yYUnM1+D0E=;
        b=HwJUndf0z7RKmtqM3/robNKUfcvZcbD72cGlXlZaQrPTTT32fsv431Kdbbg/0d3fMq
         xhNndHKPeKc80xmo19TX055pdEqj/ueUZMJzS0NHN2ZDrLt9DWkkpmkUUC3frVqJhEsY
         ZxYfFGf9Gf7Wdoj3urIUjs/jx7KAqjzbMfY+aEL+R2NHCoJqFJcVGfLPPRYJHuAAPWyw
         bDPNTy5jNRFwzug18h9ILzE8pnKa3NIAa4h2VNM/P7OogWB4nmhi/anxe2sARHmO/NA0
         q7e3BWxiiKLOsRon1JGOcGk5GyvKDAdeH/xway+AuumVzDTT7I3ds1KEXgnkYr2jpuOl
         J+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765212991; x=1765817791;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5kLCWIjE5Ygv+/+tcW6CuQnS8yltNq71yYUnM1+D0E=;
        b=sgyvYrscUHGvaJwLe/SgpJ/jxA+run5rKYpdcD8d21dEyNPb7t2HWjHrXNlgR518nE
         XO4Wmrf5IGyKd7ZvKSsF7HidfKVzt4kbpxfMUzPo0fG9zs/KrlgYgpCGGaIDGxx3DPdZ
         J1TuVxtH30E6ZuwmNi5VJurZkgOQSqbfp5fohD8CFeVITxCesmZXKtVECkb8UmscSeOI
         LXTBtGmieUYtmidQGm9UD4pZ6zXySNasK4JxUtTpsm6XMqYUWZvkLUCaScnu9l9Iq/jZ
         X1RyVcJdOhzNOeg35T7NSsPo0D7futPTVU8uSaCAsRIVwRw3gZdPJUHCBLOvsus6jEy1
         ZNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2C402tCyUVLfo6AvLq3hpkrNcpZUL89VYd+vPdxNOBxBXyPLQc2Lh+e9FQ7MPODf2ztlpzbaWILk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnaArV2VEQiR7LE2NN84EuRIm5nu+TBoqRnvkw46Vs2J/I5r3Y
	BwvpEWjXG77PtMPLjD3EanRcpGPjtzUkrW41PC4sxm2OuO0VcPjXFelm4XynJxCgtw==
X-Gm-Gg: ASbGncsFFUVvbC2EBca9E+YLxrgwYOa3lQdjuM8LDkV7z/q9f4mdZPMq8RqSXdfA1zE
	Ky9pd89g0onHmIDtKSuQ6ZLsHdnMM6eDAU22AHmJlhYPtMdeH2fUqpigbds0dnPQoK7itoqN0XC
	wVrqvcQs3f4p5A2xxEYCrUgBiO9uYJO1lqjlFYcXiplF+x5suliNgQugnrDCrD+GuQ3grfY122j
	AV1ns2V789iR8yCSn0887ptfZTjggMG6gLpbypQ+VeM2ri+6u4tL1UtfPIv/NeOpQzz6fsJE9gG
	G09OpZpH+595D7PvDbwvu71w+l9WObY4SLnRLS3F8m4LpjM+8QZCKR0U9JPXkWCey99hMprEOOw
	Xa1KE3NzMzBvqSnWfp0eypzqj83HalFO8UWqJCNWGnmGMp3hgCsVG+ZSSGUpn2683GtOMYVSBdw
	nT5Af/pyTvYHhAUuqcRFZw6jPb8AitKDEi8ptmebrwZ6ucN/P9ijIfBe5P4sXOSxZjIvJ4/HKMX
	2Q=
X-Google-Smtp-Source: AGHT+IE39RttlhAdRe/g2DiQtcrI5mjBv5P/br9Q/3bFhwBuInsKf8Fxtuh3/DdzWaMyjPfVdPLOtw==
X-Received: by 2002:a05:600c:1e28:b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47939e35d35mr87322445e9.28.1765212991023;
        Mon, 08 Dec 2025 08:56:31 -0800 (PST)
Message-ID: <405e6e30-4de2-428b-930a-fdfbba8e33c5@suse.com>
Date: Mon, 8 Dec 2025 17:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/19] xen/riscv: Implement p2m_free_subtree() and
 related helpers
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1763986955.git.oleksii.kurochko@gmail.com>
 <a01f603f77d88e28b4c1ca291f8e6011c30fbb04.1763986955.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a01f603f77d88e28b4c1ca291f8e6011c30fbb04.1763986955.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 13:33, Oleksii Kurochko wrote:
> This patch introduces a working implementation of p2m_free_subtree() for RISC-V
> based on ARM's implementation of p2m_free_entry(), enabling proper cleanup
> of page table entries in the P2M (physical-to-machine) mapping.
> 
> Only few things are changed:
> - Introduce and use p2m_get_type() to get a type of p2m entry as
>   RISC-V's PTE doesn't have enough space to store all necessary types so
>   a type is stored outside PTE. But, at the moment, handle only types
>   which fit into PTE's bits.
> 
> Key additions include:
> - p2m_free_subtree(): Recursively frees page table entries at all levels. It
>   handles both regular and superpage mappings and ensures that TLB entries
>   are flushed before freeing intermediate tables.
> - p2m_put_page() and helpers:
>   - p2m_put_4k_page(): Clears GFN from xenheap pages if applicable.
>   - p2m_put_2m_superpage(): Releases foreign page references in a 2MB
>     superpage.
>   - p2m_get_type(): Extracts the stored p2m_type from the PTE bits.
> - p2m_free_page(): Returns a page to a domain's freelist.
> - Introduce p2m_is_foreign() and connected to it things.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


