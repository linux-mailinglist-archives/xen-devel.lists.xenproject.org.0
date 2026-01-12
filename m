Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCD0D135ED
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 15:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200478.1516376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJO1-0000GG-0R; Mon, 12 Jan 2026 14:59:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200478.1516376; Mon, 12 Jan 2026 14:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJO0-0000Em-Tt; Mon, 12 Jan 2026 14:59:16 +0000
Received: by outflank-mailman (input) for mailman id 1200478;
 Mon, 12 Jan 2026 14:59:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfJO0-0000Ee-9k
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 14:59:16 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42371117-efc7-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 15:59:13 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-432da746749so1559116f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 06:59:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5dfa07sm38910472f8f.25.2026.01.12.06.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 06:59:12 -0800 (PST)
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
X-Inumbo-ID: 42371117-efc7-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768229953; x=1768834753; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MvRS3OvQ+3rJa8qQEn+n7UgtFCNgDPAlLqo6ioakeyo=;
        b=NxQsAZI5R/06/KyKR7v4EBh8f2pmzULHlMKAxJFvOeoobg1wvWyvvXQ2OBRdSiEh1w
         XJvKrDG7RAMkdxN4q7SW9ZJt33yoI4a5ZzxYdzCKWa18RnUr4uRJt8SoixxJc5OjAG1N
         7At8OIHBDvcyzc//6AKRWksbyGRMBJLtOHIRfcJ6tUnP55XiD1J+CsE+flj3uFWKLzS3
         MD+9o2npGKA5BM/ImfYwGT1oMk9oQAzbb6LYjN9RyTnMrRhrWfrJ0jgFyheKIyqTrGFk
         aukHBwTBQSGL7X1aCqNRXtxZaU0VLyNyDt8NbtbnnfxywJglQvTgq4w/eu8/30u2g9xG
         UgBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768229953; x=1768834753;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvRS3OvQ+3rJa8qQEn+n7UgtFCNgDPAlLqo6ioakeyo=;
        b=Cylsy+6vCMBCMoLnqeVzURT8QmAknWCGyHnUD0nWm1zJ4dS+Dmy3LqwmHf0Zee747f
         Q3AErU+3UT+/gFjHGf9hTbkw32nNqEZPINefIXJ9+nNc1IRCE7hyQflzs5s3E2Gqm9VZ
         AaILwTwvgF1UZPXoaYHGeAy3kL3xU7Drd/s/ms1YJtjrwEw7fqF+NhjbFEmlMre5qFWV
         aUnjpKXHR9zvIGHVCII88mhzlS2MKpWgMdZzVGSrfASMQcZdtwm+vY+EWxp2Z335/EUf
         JJmatBS9FATzKGkk3dV9DAZngHPwxv+l6pjiP67iaiwDmZ4XbuHqaSZbWo02bAWJGwCQ
         /IRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVieNeuITS6eLSChDxqOAtiQb3WATNl0RgquwK6sBqFitPKUC6CjhH64seUi6CuhxPa+9niDVelrE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZMsZqMWoRiz4fcjJ+12Cd1nVYpuwGdrrwbcjqO6NWadOpTGdj
	bNq33tDxsOsQ0ZKbmHIaI3JmS5O3jhwEX/CnodoFWNtIAhmul+sFH1y0GspgBZsKJw==
X-Gm-Gg: AY/fxX4baZNlnH6/HRUO791Y7NppAYU4zuHWFPGiBG0Huepimd0tgXCCOgzQKWNph/C
	ul454x/+nsFInZYTH3hv1oiw2kVcsA79nyYa4kvPzd4Z+hpcWKmBiahcw+w7JWZn4wg0U7+YJEI
	l4JjrN+YLMJKin0K9RVNqjCY0fugOtTTVNQW5txlbSdLxooGQlhbGJSfODHNYJTfnmvPucNCfBW
	WKqweXX0u9BYhIn5g/72Tb0JDRjT0WrJ37wfFNE6FX+Sfr8o/IJujpIOEnCP3d4DGzl7jfCiBgE
	jO4gI+luEuxg68P7iNKFI6P4bVqPsEEa+9nCJA0mqR3LhPWblPAVQEvB8QuUEeZy+eKwMWJvbtu
	SN2sMRd7p8oWNP/LLOEDNTwp8W3IT3Vi3BFpCJIya23gH6OwxI+0LuLninsqMk+aw+d2pXisdCW
	XfGVMAXjZl0CDW5e6FEUG0tZ/v9UQ8FB5ClRx5bA2HxO8D4DpS/cQICzG3oI+j8ikITwdh960Tg
	VA=
X-Google-Smtp-Source: AGHT+IFJkv2Kuc6iR2VEHgae0KujIBE4UcurYZNruOj8OAowsLQpqhvT+fFCRTd/HgZYjLfeI7FIng==
X-Received: by 2002:a05:6000:2dc2:b0:42f:bb08:d1ef with SMTP id ffacd0b85a97d-432c363281cmr22142987f8f.17.1768229953150;
        Mon, 12 Jan 2026 06:59:13 -0800 (PST)
Message-ID: <369eb1d7-864e-4432-9729-57786d0c191f@suse.com>
Date: Mon, 12 Jan 2026 15:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [Arm] Re: [PATCH v1 11/15] xen/riscv: introduce ns_to_ticks()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <e4e36ed2d02b760c925014db986041b82fd9b943.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e4e36ed2d02b760c925014db986041b82fd9b943.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
>  xen/arch/riscv/include/asm/time.h | 5 +++++
>  1 file changed, 5 insertions(+)

Looks okay and read to go in as is (no dependencies on earlier patches afaics),
but:

> --- a/xen/arch/riscv/include/asm/time.h
> +++ b/xen/arch/riscv/include/asm/time.h
> @@ -29,6 +29,11 @@ static inline s_time_t ticks_to_ns(uint64_t ticks)
>      return muldiv64(ticks, MILLISECS(1), cpu_khz);
>  }
>  
> +static inline uint64_t ns_to_ticks(s_time_t ns)
> +{
> +    return muldiv64(ns, cpu_khz, MILLISECS(1));
> +}

It's hard to see what's arch-dependent about this or ticks_to_ns(). They're
similar but not identical to Arm's version, and I actually wonder why that
difference exists. Questions to Arm people:
1) Why are they out-of-line functions there?
2) Why the involvement of the constant 1000 there? 1000 * cpu_khz can
   actually overflow in 32 bits. The forms above aren't prone to such an
   issue.
If the delta isn't justified, I think we'd better put RISC-V's functions in
common code (xen/time.h). They're not presently needed by x86, but as
inline functions they also shouldn't do any harm.

Jan

