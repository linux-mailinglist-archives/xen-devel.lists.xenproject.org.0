Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E8CB6179
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 14:51:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1184123.1506653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTh4O-0007NV-92; Thu, 11 Dec 2025 13:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1184123.1506653; Thu, 11 Dec 2025 13:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTh4O-0007M3-5m; Thu, 11 Dec 2025 13:51:00 +0000
Received: by outflank-mailman (input) for mailman id 1184123;
 Thu, 11 Dec 2025 13:50:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTh4M-0007Lv-Ci
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 13:50:58 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69e11cb7-d698-11f0-9cce-f158ae23cfc8;
 Thu, 11 Dec 2025 14:50:55 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477a219dbcaso926855e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 05:50:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89f74284sm38766635e9.9.2025.12.11.05.50.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 05:50:54 -0800 (PST)
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
X-Inumbo-ID: 69e11cb7-d698-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765461054; x=1766065854; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yqbuyMls0lEn6TGe32WmWYNn6RV6dK4qWWIuaZcgfPo=;
        b=aql1S+zzYKQ5uaP9n8trpn1DPb7j/R5/QE51jmBAvuqi7yKIRcGUB8ApfjkccipYVM
         A0ffU2dftu75uFlM2BKAmi+I3j5OwW333g0pbNbVDYUlaXLz/bl7GLdxsCn+efvG1cqm
         MSFP6FRLDIv55pv2HIOxvFEgIuI80na1Fr9OPE2Z+efW5Iy2pFiAsv/oTqFw6E5mEN9V
         snZN5F4WmaH8MopSezX6NH2EMmgH7gMuKTQ5lAepsMduZwbJs+Ew05n/WJKw/o9wURHZ
         xY59/aJdDeICeJ9I7J31CEF/VniVtHbb7sCzOqlHTy2Z9IdD7KbYwixoA2JG9tDLIOEp
         AxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461054; x=1766065854;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqbuyMls0lEn6TGe32WmWYNn6RV6dK4qWWIuaZcgfPo=;
        b=Pf9FGO5+gHC2xoQhczS171KQrQLCdUZf23SXnFXKuBI9Aoi1SSofB8ZwgD4fZFq1SA
         fUULErkE0Ry1VDol0AeAl5P/f9LbyIfaie51iepktIPvspjsb1TMf7hJmGxq5V/4VpVb
         DWCPDbiI8flw0ea+pYGdnms0r8XoZqY0Kx+i4AqEC8Ri7TfVPzhalMgd0DVemHd/eiGQ
         NEo2sptdTopcQE3fYPUT0baF2BN/iYnID+IKUX0qTzm0dL2fWBC0yxWPzeAkOzBEds56
         tvgmU8oLU29D5waGPfLLD7ZgIp17gAZmTYdsoUt1QpHNQYm4obRlfMG0lm2R+INRWJE5
         KdqA==
X-Forwarded-Encrypted: i=1; AJvYcCXCl5PFvYBhnVLKVHE+rNCKs2AIafAomkMqtsA+BjDHjVUNzIKTKD/gHnXaxjpuTQXrMv7QI2eohC8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYFxwOBC0U37pD3qx0e+JNfSRwvsjj1vNN3U3xFpaV/b7U3+BW
	7uz0H2GODkBSmbE7zk3b4tE1uXqwyvR1qNTpzW3gKkxQcxRsWitPQLMwNGB+WpW4zA==
X-Gm-Gg: AY/fxX6aQV/tx7jmVg3kRKvYBG0QTVjRzLq+QFRr87m+OKup5KhuPa8nBGYihxju2R3
	pVMXzPcgs5GRX4lhqlEM7gUZBcJrGx6L9ZcMqvFE6VRdsxTGHxbcAaJCMITe50r4RLtXeLG//Y2
	u5X9Z7JlKRvDfFdVZ40/3H+0h2MkrZVXrn5RQV+S3+KefBA1axCiqCsYq+YDQBXYDdis/Qh5ywK
	fEyrZ0eEOm1iEEMIHV8Y84t4Zvfl/xF1UQXCvqmL4RZPleeMinU5sH7NDi1TQLNRbZeZKywHhDF
	dB+YOFU1L/7gV87PyRFyu1KtaH2N0AL/T+cucoiDokOEkTwETOeDYR2F3ppHStd01KKKuKjR8s2
	vXenKtDE3SrsEHZCcmB9m3RKj4mtUxe1W64kIqTM9IeyoCxkveaMQz5cfPRfkH8F9o/SjZcUUiS
	G95k8vIdQaR/FzWQWs31vte9ClfPhqhdZCTbdArFjQGk/A8M8JAMBcNUhkXBF2syJkZBgN3nL0G
	ug=
X-Google-Smtp-Source: AGHT+IEQ9Y9lObP7Dp6rCH5kOGQvXhWGCKIw2XZ6tvHEidq6/9J+oQ6dv/0hAY664RaiwN4zk/XXgw==
X-Received: by 2002:a05:600c:4e02:b0:471:1717:411 with SMTP id 5b1f17b1804b1-47a8384be88mr67694205e9.24.1765461054331;
        Thu, 11 Dec 2025 05:50:54 -0800 (PST)
Message-ID: <a9428da3-590b-4ca4-a3fe-8eeed5b0969a@suse.com>
Date: Thu, 11 Dec 2025 14:50:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/arm64: Add support Clang build on arm64
To: Saman Dehghan <samaan.dehghan@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <bb575726fe0ac783121e563b1c92f81f51e41f75.1765420376.git.samaan.dehghan@gmail.com>
 <fbb12a9b0aede6dcb398a76018c274a5c76ba1fa.1765456914.git.samaan.dehghan@gmail.com>
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
In-Reply-To: <fbb12a9b0aede6dcb398a76018c274a5c76ba1fa.1765456914.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.12.2025 13:57, Saman Dehghan wrote:
> --- a/xen/arch/arm/arm64/vfp.c
> +++ b/xen/arch/arm/arm64/vfp.c
> @@ -6,7 +6,8 @@
>  
>  static inline void save_state(uint64_t *fpregs)
>  {
> -    asm volatile("stp q0, q1, [%1, #16 * 0]\n\t"
> +    asm volatile(".arch_extension fp\n\t"

This will take effect for the rest of the (generated) assembler file, which aiui
isn't what you want.

Jan

