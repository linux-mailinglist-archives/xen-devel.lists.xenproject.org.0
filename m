Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EFD9716DB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 13:29:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794340.1203173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncaI-0007UI-GM; Mon, 09 Sep 2024 11:29:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794340.1203173; Mon, 09 Sep 2024 11:29:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sncaI-0007RS-D2; Mon, 09 Sep 2024 11:29:30 +0000
Received: by outflank-mailman (input) for mailman id 794340;
 Mon, 09 Sep 2024 11:29:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qOm0=QH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sncaH-0007RK-Nt
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 11:29:29 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c672e44e-6e9e-11ef-a0b5-8be0dac302b0;
 Mon, 09 Sep 2024 13:29:28 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5c255e3c327so4440518a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 09 Sep 2024 04:29:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d5dd8csm324107166b.205.2024.09.09.04.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 04:29:27 -0700 (PDT)
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
X-Inumbo-ID: c672e44e-6e9e-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725881368; x=1726486168; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CAErcaGyu3tlK7kzjsXAuaRR3kVvlUeOMvt0CH2/3bA=;
        b=F9GIoagI8JVLn4JSTeHrruCG+POLMNNIbzEQptu05hqwJWpPmKY0j//zcnOKcWpZO0
         G0wnXOMK5SZf+ow5DRCt3aaAJcGs22w4IjujH9K2cKpI1lVSbp7FTy1s043BQmKVd4kv
         ETsX92isMPL61QWpXWvvWnYf27ewrYij+UCvUKxMfOfimXAPl+Hlndbtz2znJbDdjXRO
         m2SXYHIRmnDZiTvfnxT9gOIvr8wJ5QkQ2E9aPoqlyvy3BTH5ab2w2/Ve7WuQ6WgbERGb
         gzOT6YKu5UTyljNzxbpSW9CQDbizsg8azY9lUjSQzOnB6RaprWGkN+oI4M2w5Np7rmDm
         Y/Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725881368; x=1726486168;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAErcaGyu3tlK7kzjsXAuaRR3kVvlUeOMvt0CH2/3bA=;
        b=rLeTn/2UkLs0ksrU1aPN5yHKvk8ox/e6aHACVNjNGoDS14SNvLSwZGJVCaY153yP1D
         DQ8llDF3aVR4zIYowVBD1PnhdU5rmy8yqR0N6O8JSn5KmvJv0C25JN5UVEE5hNP8VTlX
         4qxqRcnARbBMZavhlaUzxfHq18Exr2zEKJLdffiTFWddflfQ18+st2c9YTWELFyRnQbq
         p3rw1U3deoP6xAfO4ioDCfshjPOsyQWqvM5pfByq83vKLROwuUuiYaca3FLNLVJ/hHRR
         dQgGJnzlbxcRw95j5g7gcfh2+QICrxYeZCBS8nlgNw6pJ3ma/tZFN3l4yGn/8lxtBDRz
         mT+w==
X-Forwarded-Encrypted: i=1; AJvYcCVqDYuoweTMWARpSUtV6QEtYJdCL6m34ylxwbAgbNtDoaSdkPOwIHTBVxE+c6yrdqpTBVfHEohUgOg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw042FhE0LsKQegajw4lNw1yq5ouDT95j6Dbvha4GCbJKyVUi6j
	xaYo5LI1Zo5ZK46ADsUf7Sh2gqG7U6wPemWzLqYGqWeyqk3l+qHweK2sl74CkA==
X-Google-Smtp-Source: AGHT+IHeGekWVWNBGz05OS8ttOacdTCm2AXwjR0rh1baXiEJJBWzrbs6KpYHQE5X2WyX0jYdT/U2Vg==
X-Received: by 2002:a17:907:782:b0:a7a:acae:3415 with SMTP id a640c23a62f3a-a8a885c3a7bmr826577766b.10.1725881368062;
        Mon, 09 Sep 2024 04:29:28 -0700 (PDT)
Message-ID: <4e04f7ba-933e-41f7-a800-558935fcc5fa@suse.com>
Date: Mon, 9 Sep 2024 13:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: fix type mismatch in read_atomic_size()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240909112815.37921-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20240909112815.37921-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2024 13:28, Oleksii Kurochko wrote:
> Correct a typo in read_atomic_size() where a 64-bit result
> was incorrectly cast to a `uint32_t` instead of `uint64_t`
> in the case of 8-byte reads.
> 
> Fixes: 3cd46d4ec8b9 ("xen/riscv: introduce atomic.h")
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


