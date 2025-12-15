Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5649CBDBC6
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 13:14:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186945.1508357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV7TA-0008S1-JF; Mon, 15 Dec 2025 12:14:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186945.1508357; Mon, 15 Dec 2025 12:14:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV7TA-0008QW-FR; Mon, 15 Dec 2025 12:14:28 +0000
Received: by outflank-mailman (input) for mailman id 1186945;
 Mon, 15 Dec 2025 12:14:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vV7T9-0008QP-7r
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 12:14:27 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9845c305-d9af-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 13:14:24 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-42fb3801f7eso1631505f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 04:14:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fa8b8a97esm34375300f8f.31.2025.12.15.04.14.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Dec 2025 04:14:23 -0800 (PST)
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
X-Inumbo-ID: 9845c305-d9af-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765800864; x=1766405664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZB1WBJ6vDK63my/LFq96eNx+2B218Aztxa04KQZUL5Y=;
        b=GcreQUqXLmdiNxcH8ACmmQ47IZU/0b5y5zq1vrav/1ybssCuQSdEipcRXhy9jxJnYh
         M076/BbfLb2BuUIM0cp+09669Le1FrHWMyaMXAhYdY8UYenhF0Dx95r0UyXg1a01yCfl
         dm4U0e8XzcMNEJBasSJ2nm/HaqplW5er2JPICSVnKySPuMtcZf/0Gk2x/f6bj+9bge/E
         HyRQYpcEogkkqq7AwFYUgIZUUY6DQMpR1hkuXzcW1OHooARdXgHSGhWJdcz/eH/Cu0lE
         B1n0GwXbUaSGhaBQW5ujPb7F4I/loaSX6ghMOG7I9rQ2LosaJi8Y6dvkzUpHNxotkJU9
         fPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765800864; x=1766405664;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZB1WBJ6vDK63my/LFq96eNx+2B218Aztxa04KQZUL5Y=;
        b=AOc2yNSz15Yuortj+SH6RWZVoGYwKzzv+feiKslrgPQKStkdFoSQMTAcelyMtmFrgI
         PmF/8nMB9aGJJLyHOJAgaNW9NoYeCiXA9W4MA4NW9xST5lf4jtvUmXTlDS3THxYRKo4u
         iNi+HaLxwDWtS+GgecKZj9XTEKTXYAgxMdo71h2P35vH5rffJTWRUy9AKYbjuVrL8J9P
         1ZQ1zMr8IMuuUOAwiELPg8e/uGckKqIVYWvNr9lY7jBDMETqQ+YleoTe25aZNTtCz25g
         Bs+zP2Pl+WDBz9pbYCrVK3XVI0XcXwXfd1/IXGXNXb/B+wHt23aKv6+HsL8Dc3lwod55
         U5hA==
X-Forwarded-Encrypted: i=1; AJvYcCWi9clXMPn4DGUWQRHZawcjOSTPVVQ9oga66v8CxYpc/GaDkii3Do7B7usy7sH6XEiN8bvkU2lfLCU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqG82V17+azzuJGkoMgd6Nxb7xgQcx056wz7hJoq1Qya2WwauK
	3fqpxrDhpTT4ESsKvHmLYwjjRvSLS0/kb34sEp9Tr7IN01EvwbzzaH1nrvIXGk9sxA==
X-Gm-Gg: AY/fxX5+Qt9rWLfFJmfMi9mjvfIp6TYwitab7wIT4qpMTxgXydL0YIUO8//9i3wqlOo
	11gtu47Jt+P7wSJcnPdzWwP53l+9K25RnXpVa8BixO5c3yCUGv+aX2+WyMseLR6DwYQWCNX9glH
	7XZWMbz2A+8ElhGomNO7jIVCJxsSikmewGkN/fWCs+rVM/gMx+brNypPZ7HQh2HIpbLrJFoxTZR
	2vo+3JMvUsBfU8GNGCr/n0FkKKASoQ+smvuLU1lAAE0rHJfq8nrhQAS2KijeqJEm3p8vwKTMdKD
	doWTlTMcYXuypvm1/ZShYZMQzuVbuyoMyDirpJBrEWKI3RjHSoqY3LICeP3DoFP/0UL0g9fGQ69
	ld0uGSblmTGllvCack6MwWXT/zUuugVgfPhyzwUoMJe2JAUMPq4IXCEqtEwA2x0oLmAk4KBo/QG
	DfEFGx2AYM4GuRT63lwfvUIK7hn0hkbIo39dJkra4jEhAu4idpCDXnFuWJBe+FAlY+c+Iu5uQs2
	HnvGED/3MYoOw==
X-Google-Smtp-Source: AGHT+IEacf+dUgs31kkUmRiOeY74zlLEC2GenZ4gBnfTgsMeNTJsPYfTExy8+VOJ3B0lEZpW7815nQ==
X-Received: by 2002:a05:6000:4202:b0:431:1ae:a3be with SMTP id ffacd0b85a97d-43101aeac36mr1343285f8f.3.1765800864092;
        Mon, 15 Dec 2025 04:14:24 -0800 (PST)
Message-ID: <e09ed373-47a4-4afc-84df-b66184ea424a@suse.com>
Date: Mon, 15 Dec 2025 13:14:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/24] xen/x86: library-fy cpuid-releated functions
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, grygorii_strashko@epam.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20251212040209.1970553-1-Penny.Zheng@amd.com>
 <20251212040209.1970553-3-Penny.Zheng@amd.com>
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
In-Reply-To: <20251212040209.1970553-3-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.12.2025 05:01, Penny Zheng wrote:
> There are some cpuid library functions only referenced in
> XEN_DOMCTL-case, and shall be wrapped with CONFIG_MGMT_HYPERCALLS later,
> otherwise they will become unreachable when MGMT_HYPERCALLS=n, and hence
> violate Misra 2.1

At this point of the series there's no MGMT_HYPERCALLS yet (see also my reply
to the cover letter).

> For file cpupolicy-clr.c to contain cpupolicy clearing library function:
> - x86_cpu_policy_clear_out_of_range_leaves
>   - zero_leaves
> For file cpuid-cp2buf.c to contain cpuid copy-to-buffer library function:
> - x86_cpuid_copy_to_buffer
>   - copy_leaf_to_buffer
> For file cpuid-cpfrbuf.c to contain cpuid copy-from-buffer library function:
> - x86_cpuid_copy_from_buffer
> Sunmmerize all needed cpuid-library object file under a new variable
> CPUID_OBJS in Makefile.
> 
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> ---
> v4 -> v5:
> - library-fy cpuid-releated functions
> ---
>  tools/fuzz/cpu-policy/Makefile               |   4 +-
>  tools/fuzz/x86_instruction_emulator/Makefile |  11 +-
>  tools/libs/guest/Makefile.common             |   4 +-
>  tools/tests/cpu-policy/Makefile              |   3 +-
>  tools/tests/x86_emulator/Makefile            |   3 +-
>  xen/lib/Makefile                             |   5 +
>  xen/lib/x86/cpuid-cp2buf.c                   | 123 ++++++++
>  xen/lib/x86/cpuid-cpfrbuf.c                  | 129 +++++++++
>  xen/lib/x86/cpuid.c                          | 286 -------------------
>  xen/lib/x86/cpupolicy-clr.c                  |  73 +++++
>  10 files changed, 346 insertions(+), 295 deletions(-)
>  create mode 100644 xen/lib/x86/cpuid-cp2buf.c
>  create mode 100644 xen/lib/x86/cpuid-cpfrbuf.c
>  create mode 100644 xen/lib/x86/cpupolicy-clr.c

This looks to be doing at least three things in one go. If all of them would be
simple (including them being a reasonably small diff), that may be fine. But
the diffstat above says otherwise, so I may I ask that this be split in three,
maybe even four pieces (one per function moving to a new file, and maybe one
doing prep work in the Makefile-s touched)?

The filenames also aren't very descriptive. cp-from-buffer.c, cp-to-buffer.c,
and cp-clear.c maybe? Albeit the last one is where I'm the least convinced
that splitting out and making a library function is actually a good idea. Note
how I also didn't mention that function as a possible candidate for library-
fying. I'll try to not forget to bring this up with the x86 maintainers later
in the day.

> --- a/tools/libs/guest/Makefile.common
> +++ b/tools/libs/guest/Makefile.common
> @@ -35,7 +35,9 @@ OBJS-y += $(LIBELF_OBJS)
>  ifeq ($(CONFIG_X86),y) # Add libx86 to the build
>  vpath %.c ../../../xen/lib/x86
>  
> -OBJS-y                 += cpuid.o msr.o policy.o
> +CPUID_OBJS := cpuid.o cpuid-cp2buf.o cpuid-cpfrbuf.o cpupolicy-clr.o
> +OBJS-y                 += $(CPUID_OBJS)
> +OBJS-y                 += msr.o policy.o
>  endif

Why the mismatched padding on the := line?

> --- a/xen/lib/Makefile
> +++ b/xen/lib/Makefile
> @@ -45,3 +45,8 @@ lib-$(CONFIG_X86) += xxhash64.o
>  lib32-y := divmod.o
>  lib32-$(CONFIG_64BIT) :=
>  lib-y += $(lib32-y)
> +
> +libx86-y := x86/cpuid-cp2buf.o
> +libx86-y += x86/cpuid-cpfrbuf.o
> +libx86-y += x86/cpupolicy-clr.o
> +lib-$(CONFIG_X86) += $(libx86-y)

Why the intermediate libx86-y? And why is this not being done in xen/lib/x86/Makefile
anyway?

Jan

