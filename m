Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BCC84DAF6
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 09:06:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678024.1055044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXzQ0-0004db-GI; Thu, 08 Feb 2024 08:06:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678024.1055044; Thu, 08 Feb 2024 08:06:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXzQ0-0004c2-DQ; Thu, 08 Feb 2024 08:06:00 +0000
Received: by outflank-mailman (input) for mailman id 678024;
 Thu, 08 Feb 2024 08:05:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXzPy-0004bk-Ri
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 08:05:58 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3de74ac-c658-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 09:05:57 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33b436dbdcfso1133089f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 00:05:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e3-20020a5d5003000000b0033b524e54d1sm1881204wrt.113.2024.02.08.00.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 00:05:57 -0800 (PST)
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
X-Inumbo-ID: e3de74ac-c658-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707379557; x=1707984357; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SJ2b+YIn4mMFi8rKTUVQ8lugGtyEfUAbFbXwWFmHkp0=;
        b=Z57msbG74UU7ll2gnCccBLCzxwUIeTMqTc/m/tb8z6G7qTgjCTTDTrSbDoIyQeeF7O
         /GBZpkgNXXNE7dUBUWHpT1DVDyIahWpuqGexk0qujJP00B0N8z7HARbFRqZ9uMEeqwaW
         ckpQ8URpGcJTFUpZ+Ff4ddKW7XDYcOrxMcYzYFljcc4i8RaYdEIqwjUc4tZkL9k17my/
         d94bRBHxKffq95F7mLRzbrGhanz499NvQdHglSelPzmN1VSXt4IMGdAMLIbgR2gjbjzp
         WEa1ZwyPU/wnhBJZve7votmIDGZlJWB73L8FfP/Jl+STcC1lodb2Xjiutzbal1xq9vFh
         WWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707379557; x=1707984357;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SJ2b+YIn4mMFi8rKTUVQ8lugGtyEfUAbFbXwWFmHkp0=;
        b=XYFCQKnIe3FXJg4WmOR2S8JkLwUpVTpjNXQyW64ipyb2ok0plr0f5vk9R4lerQNhCa
         cFPYV1UJWL919jZxMi57iRBHYsXD5nHgZ+UujdpyHs9bWESb5b6oV46Q1nWpUWiVNt8z
         AbPJnM8glChiOBd/y6+zOJoIhxWwVh8Yl8nZMWVgtsSOC2vPhXmRMhPV7FuSarX0PNTl
         73KcmW0BzETjwy8dzhsoz5CNftg0QdWM3ZA9mrhVuy+OUvuY7PnVb3nUcsFm3DxPbwZn
         7Du/gMiFBiHAjFHDojiPMxGlCMSw0HjnvDb2s2Mv+WrBWgAXDRpAtaFLtMucOfNXb17e
         VtIA==
X-Gm-Message-State: AOJu0YzycV/auuCXTL7aXe3y/zFlnIwCA+n0ymwIN6sBQvVOaFvyTyVk
	bwUrMcIYsSEAO6gq+HGem5MsFNIjCZBUr+GeVqIEWh7FJJUFVXppSgBT6g8vsA==
X-Google-Smtp-Source: AGHT+IFTy/rBUUqPyky62p9LP9uKd62XnUWEUWLDj5VPqSSlu1No8GXhCYFFqMTaitsyi3cthrnKLA==
X-Received: by 2002:a5d:6651:0:b0:33b:39d5:553d with SMTP id f17-20020a5d6651000000b0033b39d5553dmr5248295wrw.60.1707379557343;
        Thu, 08 Feb 2024 00:05:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVF2gfnpHFwWxg6D/cbPwBpYORLt3qhOipvRvoj7S66MTa/I3yTkx24JagdtrMQDe6PwfBL4dCOlgp+NXLEq9lidAO6jCklzLiSo5k3hJFwcJ1s2zrcfvn3SfcZdseEKbA3JZeJTraRhkhwioS5J5D8z6X/h342dGdb9AtUm84/OksABfmFTwTTNgDUHB9xfNQPkfwsZ39m082+xSdSZpw6KtZXT1Bg705gtRiCCUleIxmNPgORhnfpD7XhJ2MFF55zPnUbsuA4O9AABJAU3W6SN6JErFhgYI4BfepSOOumrLHXA8AGNPZyxRBFzSZhXpDfsu1dBBDbLt+ra4Y0Xm+IL3CzOofPM5wHNnBKjZSJjnSWRLISrX4BDKeEQNMCQDD/S+rHHImPXx+mDzGJMveEdCk=
Message-ID: <9b9c128f-f143-4c2c-9ee2-67a240d216d5@suse.com>
Date: Thu, 8 Feb 2024 09:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] docs/misra: add x86_64 and arm64 asm-offset.c to
 exclude-list
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <b0c855581eed247a32b745906f84d352bf812091.1707324479.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <b0c855581eed247a32b745906f84d352bf812091.1707324479.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.02.2024 08:55, Nicola Vetrini wrote:
> These two files contain several deliberate violations of MISRA C rules and
> they are not linked in the final Xen binary, therefore they can be exempted
> from MISRA compliance.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Since the exclude list only contains arm64 and x86 files I reasoned that
> introducing an entry that would match all architectures would not be desirable
> (e.g., arm32). I'm happy to change that, though.

Just wanted to ask - if globs are permitted, I'd favor covering all possible
architectures. It is certainly expected that they all follow suit. Just that
in the absence of sub-architectures the path would be xen/arch/*/asm-offsets.c
(and it's quite possible that we may, over time, morph x86 to a sub-arch-less
form).

Jan

> ---
>  docs/misra/exclude-list.json | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
> index 7971d0e70f5b..bd05478e03e9 100644
> --- a/docs/misra/exclude-list.json
> +++ b/docs/misra/exclude-list.json
> @@ -17,6 +17,10 @@
>              "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
>              "comment": "Imported from Linux, ignore for now"
>          },
> +        {
> +          "rel_path": "arch/arm/arm64/asm-offsets.c",
> +          "comment": "The resulting code is not included in the final Xen binary, ignore for now"
> +        },
>          {
>              "rel_path": "arch/x86/acpi/boot.c",
>              "comment": "Imported from Linux, ignore for now"
> @@ -97,6 +101,10 @@
>              "rel_path": "arch/x86/x86_64/mmconf-fam10h.c",
>              "comment": "Imported from Linux, ignore for now"
>          },
> +        {
> +          "rel_path": "arch/x86/x86_64/asm-offsets.c",
> +          "comment": "The resulting code is not included in the final Xen binary, ignore for now"
> +        },
>          {
>              "rel_path": "arch/x86/efi/check.c",
>              "comment": "The resulting code is not included in the final Xen binary, ignore for now"


