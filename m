Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DCACD9206
	for <lists+xen-devel@lfdr.de>; Tue, 23 Dec 2025 12:34:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192529.1511699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY0eF-00055m-W2; Tue, 23 Dec 2025 11:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192529.1511699; Tue, 23 Dec 2025 11:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vY0eF-00054j-SE; Tue, 23 Dec 2025 11:33:51 +0000
Received: by outflank-mailman (input) for mailman id 1192529;
 Tue, 23 Dec 2025 11:33:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vY0eD-00054b-So
 for xen-devel@lists.xenproject.org; Tue, 23 Dec 2025 11:33:49 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fa38bbc-dff3-11f0-b15b-2bf370ae4941;
 Tue, 23 Dec 2025 12:33:48 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-42e33956e76so1780032f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Dec 2025 03:33:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324e9ba877sm26972766f8f.0.2025.12.23.03.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Dec 2025 03:33:47 -0800 (PST)
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
X-Inumbo-ID: 3fa38bbc-dff3-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766489628; x=1767094428; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7S/OdtmbnZynf5E9VAnvbeY0eCh5d/c0KyeNLJGHb6s=;
        b=UowFJ76iBrdyd9GGV9Nri6BCSTiTD57yJ+6loTebFkc1XkFTjq0vUqx0rOV047cIkj
         f2/m1s30re054wE3i83RikgD+Sh6mWptZ0gWERxMfHTtCExmWbWo2DW0nB8YRE7GoVQ+
         BvULACEL/h+moedtJRWEvl0wtE3oDzon0Vb0N/USoI5KOQWUnDSsTBUpm08T1nCBZVWf
         yHF6O+lQy9c+zidWqVao13fBd2uU/HRdZi/fhvIod5i1DdAgCx6xDUDQAiUmhVXBCmjV
         XlRjh0+2C5XmFAS0HLdHiGo9G5hhaxE8IQK81XpO98RB91+SM3h39UqRSGczuceQJoSw
         mkcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766489628; x=1767094428;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7S/OdtmbnZynf5E9VAnvbeY0eCh5d/c0KyeNLJGHb6s=;
        b=gyqE0dOFQyDsF0ObGrU0vnZQaVcu9BUEYRaxjmZEm/IntMVAO4E+TidV3s01r7tsbX
         8zN/z038NXEv7vYIvvuSueGx1IoWsNJJJ7eTceu+unQpTpBtzcV59HKTko0kMM3U0WW6
         WtxkBhKLcNQKKslqKmMuG7aqjN4OYdzxOiwCSkKVKwTYH1QpMsY2JtycBorDN/bfd4/8
         51YdocVxzWkyBEipNaHIQMSyZVINAz8YaOjVJebbPuEV9aaRGtzNrWyVozOFKnx0C8u6
         zJx9eYPZRMu1Z85Nt3YDrE1053rfoKof7F3ukKjtLNi/ihIoB7HzDDQDZpcDgwHp0c8r
         liZA==
X-Forwarded-Encrypted: i=1; AJvYcCUfulaykUMuDNqwomRUpz6U6YV4ijz0FCIuQ0WXu4++xbwG3lxdjRd64zewG3bQHirt78UdkGLTa30=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBxrxlb+gv70U4CSGZtppeYr1jKMyJWCL/U0UWxA0FX5QF2sjD
	okuMDbGa2bknlnv6FEJd/TU7Kw4QYZI3DZnsH3lgzAz9neSraPsHuvpnI7nby5/I5w==
X-Gm-Gg: AY/fxX54c4r5HYs9kQkuzP+Adb3BAez52dakAF1BcqK61fbdMcnckCEK8kb1S9UCUzW
	4AaHcfwBuHvisz1h3xf/3yj+7Zozth6Vmq5NBA20uR1bzPeymJDrLU3Zr3duLllaAgubfwOeBkB
	zHIcl4OAOPmxBUAKdYIvngDbLHmx7eXsDFZdqtx0u0MdYBoWabgtbQfO1Zx8HKDdKT0zJjzY4Qy
	LfY1adH5v7au+CPhv31oTScSK2Lhv+L9Wla7M+eWQqgRxizyz9t482iGNT442b4iQpcqybjQQHP
	VDpNRj8CgyirQIPL14V09BnyQB5Qsg8BLtWY/DSPejuDaip1RG+AG3BjMYZBZnrYpk+HoBqFwTF
	zql2fiwWjt9soii/J4YHerKXCrPT49kZTz/wFnLmZt46dEaGV6Sx/wugMbMwcDMPBnXUv8dZeSX
	bqm2sDSswM0SAD2WfB3eBND7MfFS5CBpuIUqfsbAw1byli6G6D80xN6qg5RR8d9Ltbuc4TU8xRS
	yU=
X-Google-Smtp-Source: AGHT+IEJ6kO9eCrVwjAhhA8inZv4aX9RWd94/z+m5P+05UwbJbaBqXlhebM5RzjvhdYL+Q68kgxVUg==
X-Received: by 2002:a5d:64c7:0:b0:430:f985:a7b2 with SMTP id ffacd0b85a97d-4324e50bf0emr15172247f8f.51.1766489628167;
        Tue, 23 Dec 2025 03:33:48 -0800 (PST)
Message-ID: <27e79807-a86f-4782-bcba-43856bd6960e@suse.com>
Date: Tue, 23 Dec 2025 12:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] xen: move alloc/free_vcpu_struct() to common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1766404618.git.oleksii.kurochko@gmail.com>
 <31208135cc61a8c8e593a286d450c2ec7757d118.1766404618.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <31208135cc61a8c8e593a286d450c2ec7757d118.1766404618.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2025 17:40, Oleksii Kurochko wrote:
> alloc_vcpu_struct() and free_vcpu_struct() contain little
> architecture-specific logic and are suitable for sharing across
> architectures. Move both helpers to common code.
> 
> To support the remaining architectural differences, introduce
> arch_vcpu_struct_memflags(), allowing architectures to override the
> memory flags passed to alloc_xenheap_pages(). This is currently needed
> by x86, which may require MEMF_bits(32) for HVM guests using shadow
> paging.
> 
> The ARM implementation of alloc/free_vcpu_struct() is removed and
> replaced by the common version. Stub implementations are also dropped
> from PPC and RISC-V.
> 
> Now that the size of struct vcpu for Arm64 is smaller than PAGE_SIZE,
> MAX_PAGES_PER_VCPU is no longer needed and is removed.
> 
> Finally, make alloc_vcpu_struct() and free_vcpu_struct() static to
> common/domain.c, as they are no longer used outside common code.
> 
> No functional changes.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

With the functions moved a little further up as indicated in the reply
to patch 4:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

