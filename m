Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D46896F55
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 14:51:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700532.1093832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs05B-00035s-48; Wed, 03 Apr 2024 12:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700532.1093832; Wed, 03 Apr 2024 12:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs05B-000300-1E; Wed, 03 Apr 2024 12:51:13 +0000
Received: by outflank-mailman (input) for mailman id 700532;
 Wed, 03 Apr 2024 12:51:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rs05A-0002yG-3l
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 12:51:12 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d85ba635-f1b8-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 14:51:10 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a4715991c32so822382066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 05:51:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 zh11-20020a170906880b00b00a4e48e52ecbsm5474318ejb.198.2024.04.03.05.51.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 05:51:09 -0700 (PDT)
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
X-Inumbo-ID: d85ba635-f1b8-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712148670; x=1712753470; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUH9yNa4cQm5NHvZ1ozQEBsidr2IAZzn9EATZUwM5fo=;
        b=c/1eJGeFqS3T2b1+hUkAzlDcGw8q5Rli/TWAcaiI10uGCbMSEt/j4s6XyD1eVpCHkm
         dIuuerdk1LyeiSFaduTrOxOOQRe1az+B8QhDMbxEXziC93bsTm6zBSLVSx8VM+NhWi8U
         VUpLtq53Wn9zwMYsqJSLIWh8ChYhMbFDZUaGnCo2lg/XUBwnuw5uMRILpMOY6xcFLcy/
         SvTbXZXQXCeSl67q6Gffd+/iUVRuIL3XWJZUIetchD+JnZ1YBvBnNTl1a7DjhtwGIJps
         yJGykaUMEPWaKDLaG4H7IJHB1itOwEj9IQt9f+N7WLHPrYLhWKLCzgADvJME4km+UBE0
         xgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712148670; x=1712753470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUH9yNa4cQm5NHvZ1ozQEBsidr2IAZzn9EATZUwM5fo=;
        b=dyo2DRqqVk71CBhIvlXGKqDGVWKLo06AuSRnPGBVSbDkmPJoU1enMDjljisSkDbDnx
         fJNAPAw3OrKmgy4sEKD6W8Y7eW/CRN0hCsikLIJ3Sgdtcug8O5pwWPaUAT4PZH8eYaqV
         zcGt+uYgdTs+fT2ENW2A0/vGBkE7+WxzXMd/iq3pQ+uEBRsaHtUyoJohw6wNiRYsMRYE
         5IJvDKLafeOkMvTi9D0G5u1PWbqAPd6Wt9AA4R/eQJH3dM258QNP+Sk9jHjjSexnbrcr
         5TGOI1W0DNCWJYtyxU+7i/SPu7yyt91mqwlOWWddm9IuPPFUGvRtUtoyYHpZaLoWiu3J
         O0Ng==
X-Forwarded-Encrypted: i=1; AJvYcCUq3tBybeUOnKZ8GVbTPpZfZLF0EQ98Tu5yHRJBnyVdHlEUFVBB0gCA2kygfR8L74d1XtqGSX2LREEW+R3OlIKVOAf35IbGmOF6AwYCSi8=
X-Gm-Message-State: AOJu0Yx7U3c9nJ8t3bhub4PpbJbN5WjCmU9qDCPYFnmu9/grIeqSJOdZ
	iRdwS5Y2yXkWL9EQyimS3+46oNxB+QZEI7LtXFjVJTl7ab7vCIs6/WWsHdEWAA==
X-Google-Smtp-Source: AGHT+IHzFGlIv9tCw5svXFKY+i4CtNpZX/S/mYhLRyOqCw83vRLT3tmFj+mZ4s+Myh6fWrVwGTQXGA==
X-Received: by 2002:a17:907:3ea2:b0:a4e:5672:440 with SMTP id hs34-20020a1709073ea200b00a4e56720440mr8789543ejc.21.1712148669765;
        Wed, 03 Apr 2024 05:51:09 -0700 (PDT)
Message-ID: <e401ffe1-de4b-4548-8eba-feb7e85c9971@suse.com>
Date: Wed, 3 Apr 2024 14:51:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/include: move definition of ASM_INT() to
 xen/linkage.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240403120323.18433-1-jgross@suse.com>
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
In-Reply-To: <20240403120323.18433-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 14:03, Juergen Gross wrote:
> ASM_INT() is defined in arch/[arm|x86]/include/asm/asm_defns.h in
> exactly the same way. Instead of replicating this definition for riscv
> and ppc, move it to include/xen/linkage.h, where other arch agnostic
> definitions for assembler code are living already.

And this is why I didn't make a change right away, back when noticing the
duplication: Arch-agnostic really means ...

> --- a/xen/include/xen/linkage.h
> +++ b/xen/include/xen/linkage.h
> @@ -60,6 +60,8 @@
>  #define DATA_LOCAL(name, align...) \
>          SYM(name, DATA, LOCAL, LASTARG(DATA_ALIGN, ## align), DATA_FILL)
>  
> +#define ASM_INT(label, val)    DATA(label, 4) .long (val); END(label)

... to avoid .long [1]. There's no arch-independent aspect guaranteeing
that what .long emits matches "unsigned int" as used e.g. in the
declaration of xen_config_data_size. The arch-agnostic directives are
.dc.l and friends. Sadly Clang looks to support this only starting with
version 4.

Nevertheless, seeing that Andrew ack-ed the change already, it's perhaps
good enough for the moment. If an obscure port appeared, the further
abstraction could be taken care of by them.

Jan

[1] Note how in gas doc .long refers to .int, .int says "32-bit", just
to then have a special case of H8/300 emitting 16-bit values. Things
must have been confusing enough for someone to come and add .dc.?.

