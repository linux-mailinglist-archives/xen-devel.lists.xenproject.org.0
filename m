Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0581D9EAE8E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 11:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852067.1265979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxoO-0004Iw-Kz; Tue, 10 Dec 2024 10:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852067.1265979; Tue, 10 Dec 2024 10:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxoO-0004HP-Hp; Tue, 10 Dec 2024 10:49:52 +0000
Received: by outflank-mailman (input) for mailman id 852067;
 Tue, 10 Dec 2024 10:49:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tKxoM-0004HJ-Sk
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 10:49:50 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79ea0c1a-b6e4-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 11:49:48 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-385de9f789cso4042682f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 02:49:48 -0800 (PST)
Received: from ?IPV6:2003:ca:b746:63c:3d8c:c505:78ea:f982?
 (p200300cab746063c3d8cc50578eaf982.dip0.t-ipconnect.de.
 [2003:ca:b746:63c:3d8c:c505:78ea:f982])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-386408549b9sm5028734f8f.89.2024.12.10.02.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 02:49:46 -0800 (PST)
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
X-Inumbo-ID: 79ea0c1a-b6e4-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733827788; x=1734432588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T1+JtpJhKjuJZC0M0gDGzIMy8kIn7FafaJ7/N9niL/4=;
        b=Byh2Jf9UR8r9bEssXxP1bBDhCRkhCd6d1GWV+iK0gNAGFAb6va6uGckoQj7Xgcn7+7
         mRU3d5YVsEMAMzom499kDudX2QI+FSdW4Uo6NCquDmah4z+tl+aR6avmeK9tRstCe2pD
         YZlMgR4H3SKcRFyRP9vTOt3+qhHbT2lCSeS2fmSU6fRMseOjvDHIxX4zFZfc0PFPRSj7
         tHzl9G4+GL5hqvC8yzlHn6BxgGIEWZX2mWCYEnMxu+myEQX5n2LdL4kqgHNXdftq758z
         DK2RAV/pRVNE8kk4I1FYnQYbEEwCneXPq9nfjPguHGO84VnQ2VqxZdaredC4HZVd8TMq
         bmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733827788; x=1734432588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1+JtpJhKjuJZC0M0gDGzIMy8kIn7FafaJ7/N9niL/4=;
        b=HVAe4/UYf1FfyHpKXCCwSFyVjeeVWRlc0M0v5Ns+xZZkYE9n5LHuh0l8EAnxlMlkuz
         TB2bh2qrwC2Xey3wukoPd+DsujBTwr1QlXjlJ60mwUXTiftSjTeGQbUmfU/r+LQI/OPA
         +EWgsKw/lA4wzZKMiG96ogdOVwMIjjxACu5ZTtQZ6cohhJMy+H7gQeAgKRMyPujxFoIp
         mjXfDRJtfBcMBWIBnUO+v6JXGgYXwBb6C91eJYEVpaNLKZYDq/lzMQfB1klUjrI0tnf0
         xdbTLQ7D+hSp7M8Tx3Sm1u67LfHepeNeJFdtZDQBa9AuZ9t+xsihbXtGNQ0ZsS4/LUGM
         4rCw==
X-Forwarded-Encrypted: i=1; AJvYcCVCuDvcJyRvylNx2chJfrGZ0cRgDaBXwH50+plJZvnmMB8LK0xeikeUM1aqCfViBG5I9xP5I4Scn3c=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxN7oyoK1O8WVZj0wPWPs/6/tHqHszzn6wJCvJl7wrXoysgY0zH
	FELHZWSBTxCmIuQiFxJBi7fg90KFDrYSpAd1folVwhb4HetXP77bzXdpaF5O3w==
X-Gm-Gg: ASbGncuC+qr06Q8DE5UZlwBW3ud1W8s2Xb6Qe6yu71p0toF0kFJmQEyhJWCzsBsJUQ0
	qPdK8lDvlSVWHPYhavPPeDEmr/IifDJymg30nNpy5ekOrK3QNBr3f+fyH6te6NtOaA7kY76uTdF
	suagstFNYdPHqv/YerX0VE81LEJDr8Ljf/m9/Mzg+r3vapUCxlfKVevb3AYg0s3lij11Ikhnaz7
	NDw/5eD+tSZoWCkzQOPXY2s02/IhZhoDcleJFGPJDIkoR0o3lBPBzRRAnbfAlVP4x8jmMz5YxrQ
	jfwYZRlo/ErYcOEFC5MG3vh+t2747D9/Q8etXF2sNF7g6KCdbGGZKI2UBzVUyrYs0R8+UJzKjCv
	xYKvYgWFayw==
X-Google-Smtp-Source: AGHT+IH6BbkofEd6yAgOijFDW/kZuqjmE6GbsbnG1dpsH2I3LmNsZc9IjRK+xNQaFgQoivID+MlejQ==
X-Received: by 2002:a05:6000:1446:b0:386:42a6:21f2 with SMTP id ffacd0b85a97d-38642a624f0mr3941528f8f.10.1733827786694;
        Tue, 10 Dec 2024 02:49:46 -0800 (PST)
Message-ID: <0b990a3c-4803-4d18-a42f-bf9601e14ca1@suse.com>
Date: Tue, 10 Dec 2024 11:49:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/boot: Use external symbols from
 cmdline_parse_early
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241122093358.478774-1-frediano.ziglio@cloud.com>
 <20241122093358.478774-5-frediano.ziglio@cloud.com>
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
In-Reply-To: <20241122093358.478774-5-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.11.2024 10:33, Frediano Ziglio wrote:
> Move some assembly code to C.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/build32.lds.S         |  1 +
>  xen/arch/x86/boot/cmdline.c             | 14 ++++++++++++--
>  xen/arch/x86/boot/head.S                |  9 +--------
>  xen/arch/x86/boot/trampoline.S          |  2 +-
>  xen/arch/x86/include/asm/setup.h        |  2 ++
>  xen/arch/x86/include/boot/xen/cpumask.h |  1 +
>  xen/arch/x86/include/boot/xen/string.h  | 10 ++++++++++
>  7 files changed, 28 insertions(+), 11 deletions(-)
>  create mode 100644 xen/arch/x86/include/boot/xen/cpumask.h
>  create mode 100644 xen/arch/x86/include/boot/xen/string.h

Again the diffstat doesn't really suggest this is a win. As an upside
I can see that the argument passing to the function is somewhat ugly
when done from assembly, especially when the function needs new
parameters added or ones removed / changed. The downside is that now
you're switching to dealing with globals, which generally seems less
desirable.

> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -16,6 +16,8 @@ extern uint64_t boot_tsc_stamp;
>  extern void *stack_start;
>  extern unsigned int multiboot_ptr;
>  
> +struct domain;
> +
>  void early_cpu_init(bool verbose);
>  void early_time_init(void);
>  

While I think I can see why this would be needed, personally I think
such forward decls belong either immediately past all #include-s or
immediately ahead of where they are first needed.

> --- /dev/null
> +++ b/xen/arch/x86/include/boot/xen/cpumask.h
> @@ -0,0 +1 @@
> +/* Empty. */

Are there perhaps better ways to deal with whatever needs dealing with
(which sadly isn't obvious and also isn't mentioned anywhere)? At a
guess, asm/numa.h may be where the problem is, yet then setup.h
includes that just to get a decl of nodeid_t afaics. As we're meaning
to split headers into two or perhaps even three parts anyway (to allow
reducing dependency chains), maybe we should do so here and introduce
e.g. asm/types/numa.h?

Jan

