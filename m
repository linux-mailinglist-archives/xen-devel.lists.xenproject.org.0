Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356289C3A94
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 10:10:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833386.1248525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQRN-00052O-0g; Mon, 11 Nov 2024 09:10:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833386.1248525; Mon, 11 Nov 2024 09:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQRM-00050p-U8; Mon, 11 Nov 2024 09:10:32 +0000
Received: by outflank-mailman (input) for mailman id 833386;
 Mon, 11 Nov 2024 09:10:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAQRL-00050j-Uj
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 09:10:31 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca3f260f-a00c-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 10:10:26 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d5689eea8so2449513f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 01:10:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed9ea647sm12183404f8f.68.2024.11.11.01.10.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 01:10:25 -0800 (PST)
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
X-Inumbo-ID: ca3f260f-a00c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmQiLCJoZWxvIjoibWFpbC13cjEteDQyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNhM2YyNjBmLWEwMGMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzE2MjI2LjcxNzUxLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731316226; x=1731921026; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ4yCUVMm/mFhC6+X7KyN5yjQABfyWgc/HHwk88sUWE=;
        b=MtmgBqEXIBe/COksknOc4C/LG3i6nfTpkrXDcSJGDlbwXWKX9nW5/lsL6xtlxm21ew
         ZvJErikUCDLVJ88cKTsMJIfqS710T2lE+35OY/Y+rSw0V2pqqLm1377i3YlNgHWvq7kc
         6Ougl/r94n8B5+tLe+cjSdmpEPswvxsb5EcS1fjb05IIsP3RoUSbO8MGE5EHE8bLIe71
         17bXt/GlnQdbjy31PmPZ6J5bCjE5M+7aYPij/MZEpq1BIC2zCF8altPf3ztQsADIWE+V
         /62FIrJNTuUm+jIOHmild0y5lijLDb33Bu+pc277g6eK4z43jh8hDywuKMkfh9/6vqGH
         Gxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731316226; x=1731921026;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ4yCUVMm/mFhC6+X7KyN5yjQABfyWgc/HHwk88sUWE=;
        b=Jnsj93gtgXgj4AnO6bAk0NKHDQKsAVZOtu26puYqKgbPR8wPeaJ7keNdTHZFutRLfy
         Jar00DJFbU0YeAjfnf9ctBX7goweH1fCDwvEBrff/Rdwm4YJgN8ZlMqBr5fIuHeLNuiN
         oXiTom5maAZDIya/ANGXXWmZUp7ANjReSUlei6w5bsWpNUGnKbNOVeezoCTNj2pdTx1/
         GqFr1kGgj3VZxuANO5Rnt1cq1f4rb8zGoLxXf/FuYmyYFnx8UTXqJ7Ig9TC5IgXozf+/
         NVnm7pYSe5q+6ygPUOBxWI1MRx9zDDdf3xDflCTe8e6LK3vNpMPxvMG7Vxk01rmI1j70
         r7UA==
X-Forwarded-Encrypted: i=1; AJvYcCW9eeIrsw5/nUfhBZIkcKdiay8Nh0a3nSnNLaQmc4WSTOYme4p5EQvcOgV55H58tiMK7Y16QKJutOA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy3AbNkuAIoBygx0uedMIIak6Ffnng72W3hfnorPPlxsxVQ+t6T
	aQzPRn6FYUQL8yZspl2RPPx44bkx1lxHNa7DKuiKKw/YfWjMxCM9+/cxIlArIg==
X-Google-Smtp-Source: AGHT+IHxWeL1J1ePvS2SVh2hkSwR/8120mnVZs0k4od/VAnHDS8jqEijrWFAcRhxkVyQ9zes1ylkYw==
X-Received: by 2002:a5d:6d85:0:b0:37d:4e9d:233f with SMTP id ffacd0b85a97d-381f186b5eemr10836413f8f.24.1731316226068;
        Mon, 11 Nov 2024 01:10:26 -0800 (PST)
Message-ID: <5bc0af87-b80b-4770-985d-083b7e8b564f@suse.com>
Date: Mon, 11 Nov 2024 10:10:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/10] Untangle mach-generic/
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241108195820.789716-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2024 20:58, Andrew Cooper wrote:
> There's only one header file left.  More than half of it is totally useless,
> and the rest has better places to live in the tree.
> 
> This lets us drop a compiler include path.
> 
> Andrew Cooper (10):
>   VT-d: Drop includes of mach_apic.h
>   x86: Drop includes of mach_apic.h
>   x86/mach-apic: Move generic_*_probe() declarations into genapic.h
>   x86/mach-apic: Drop apic_id_registered()
>   x86/mach-apic: Drop ioapic_phys_id_map()
>   x86/mach-apic: Drop check_apicid_used()
>   x86/mach-apic: Drop check_apicid_present()
>   x86/mach-apic: Drop set_apicid()
>   x86/mach-apic: Move the genapic wrappers to genapic.h

Up to here:
Acked-by: Jan Beulich <jbeulich@suse.com>

>   x86: Delete mach_apic.h

I'll comment on this one separately.

Jan

