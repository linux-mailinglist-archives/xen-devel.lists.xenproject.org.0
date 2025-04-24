Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A03A9B08D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 16:21:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966404.1356620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xRt-0005gg-6o; Thu, 24 Apr 2025 14:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966404.1356620; Thu, 24 Apr 2025 14:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7xRt-0005db-3P; Thu, 24 Apr 2025 14:21:09 +0000
Received: by outflank-mailman (input) for mailman id 966404;
 Thu, 24 Apr 2025 14:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KF8R=XK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7xRs-0005dV-GD
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 14:21:08 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ccab634-2117-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 16:21:07 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39c266c2dd5so1189724f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 07:21:07 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d569c1bsm2224364f8f.101.2025.04.24.07.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 07:21:06 -0700 (PDT)
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
X-Inumbo-ID: 5ccab634-2117-11f0-9eb2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745504467; x=1746109267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rQsmCZqY8/07IK58Yhov3m/dZRx9yuC+jvu9Ks8P95I=;
        b=odhRKKyENMiWrOE0UXPt01v7jUhs+Nr1UN1r4NszlXB9kFmDdb1KtqeeZwd7PGP+mt
         N0W0rhfKVWxsXZPNt3SCndElRF0u+RJxDUZmkMxiQUQJpqQwzidl9o5hxYgvXpfXaYk7
         1pYhggo6pJp404yoB9+voyzWiQwAy3nIzlalA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504467; x=1746109267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQsmCZqY8/07IK58Yhov3m/dZRx9yuC+jvu9Ks8P95I=;
        b=uLJe39/gwDBVmWo3+t7KtfxHwElaopbEwSa8gWPd0WuUbYZFtDnxGVaMyvMnsRXiee
         d5kGr5VFoe/LDQMyEKHDK74wy7I3uKjVNWGaqRmmnTKLWbPDSAf1YZ9GcaYZzJIUFLl1
         HVOEpEpHVtkdyW9/Y0g4UEcoDXyDDVWWv7GaasUqwAnyz5EioS6aLEkvpbzEietcn1a1
         O3tV6O7Q5S/744Jf22as1byaZilhrxTVHJdbkcdLs504xCgTuy8BpcRgJ+BsZ1K3sjde
         ROfCwZgdKTthsDSB1X6y0K/WbcUgv8QgwrKQQNp579uUeqA7KdhudcGBv1Kb4OsbKu2F
         H1rw==
X-Forwarded-Encrypted: i=1; AJvYcCVeN1RnLusmu34gK4D8fHyrcEEplO9qE0e9YZoitqg3YEQxlMjf058NtSsTS8C0iS0f6EloRxPb89s=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwceHre8De9qfMTN59RMzlq4QKkTaV6AKB42W5WRekJf70esPZm
	/htPo4JG5VbLtOmNTWHk4EWKWNoAo3g00A7SokJON0YcZz3xLTzq8JWn7bPJl5M=
X-Gm-Gg: ASbGnctmNqzsP2ybvGgTQshTyVr74XZ4Bbz1zuU39Y8AeAP3cyqc5gHaHeYv18fCtFH
	Ajn1Cah1HGC7QJvwiRga3osJeuf7OK7CtxaVVscAz9BW23TqlUAWO7KfsidBynDpax8Wmz2BrUH
	2JcSGkhOZaTxd1/zPI9/+t3azXNSbyuF2fzJq9l93WwZ7aiYEIXjERPq+2vtCN2DR+/IXVWI+YZ
	CiTsXE4KNe6nG2gfEcFm8a8k8cyuEj0QKAL0/pib8laJYqixks2z1MStK4ctkcnyJR72n3PhXWA
	r9E6tf+v4iwTmMCq0OJlVH2p4SlliShfqBZgFtMfUiyi+Z77YT+QEYBG7zSnUNzM1njKTGpL+H3
	Az7yh6g==
X-Google-Smtp-Source: AGHT+IG1/ruNtDJEQTHhLEGTSXPFXy8WkWfPunwbK53osK5vOc7z4eLCu26r6e/keGqanAkeuPl6Vg==
X-Received: by 2002:a05:6000:1789:b0:399:7f43:b3a4 with SMTP id ffacd0b85a97d-3a06cf5ef02mr2320169f8f.24.1745504466818;
        Thu, 24 Apr 2025 07:21:06 -0700 (PDT)
Message-ID: <72b6e9b8-8f6a-4495-ac1c-9df5822067a8@citrix.com>
Date: Thu, 24 Apr 2025 15:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvmloader: fix usage of NULL with cpuid_count()
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20250424125813.96449-1-roger.pau@citrix.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250424125813.96449-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2025 1:58 pm, Roger Pau Monne wrote:
> The commit that added support for retrieving the APIC IDs from the APs
> introduced several usages of cpuid() with NULL parameters, which is not
> handled by the underlying implementation.  For GCC I expect this results in
> writes to the physical address at 0, however for Clang the generated code
> in smp.o is:

Oh lovely.  I guess we need full VM testing for the Clang builds too.

> tools/firmware/hvmloader/smp.o: file format elf32-i386
>
> Disassembly of section .text:
>
> 00000000 <smp_initialise>:
>        0: 55                            pushl   %ebp
>        1: 89 e5                         movl    %esp, %ebp
>        3: 53                            pushl   %ebx
>        4: 31 c0                         xorl    %eax, %eax
>        6: 31 c9                         xorl    %ecx, %ecx
>        8: 0f a2                         cpuid

I get the hint that this is the whole file?  But you don't say that
explicitly.

> Showing the usage of a NULL pointer results in undefined behavior, and
> clang refusing to generate further code after it.
>
> Fix by using a temporary variable in cpuid_count() in place for any NULL
> parameter.
>
> Fixes: 9ad0db58c7e2 ('tools/hvmloader: Retrieve APIC IDs from the APs themselves')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Could also be fixed by using the temporary variable in the call sites,
> however that's more code in the call sites at the expense of less checking.
> I don't think the extra NULL check logic in cpuid_count() is that bad.
>
> Overall the solution proposed in this patch is safer going forward, as it
> prevent issues like this from being introduced in the first place.
> ---
>  tools/firmware/hvmloader/util.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
> index 644450c51ceb..765a013ddd9e 100644
> --- a/tools/firmware/hvmloader/util.h
> +++ b/tools/firmware/hvmloader/util.h
> @@ -190,6 +190,17 @@ static inline void cpuid_count(
>      uint32_t *ecx,
>      uint32_t *edx)
>  {
> +    uint32_t tmp;
> +
> +    if ( !eax )
> +        eax = &tmp;
> +    if ( !ebx )
> +        ebx = &tmp;
> +    if ( !ecx )
> +        ecx = &tmp;
> +    if ( !edx )
> +        edx = &tmp;
> +

Personally I dislike this pattern, and some of that is definitely PTSD
from Xen's original hvm_cpuid() function.

hvmloader is a small enough codebase that I don't think it matters
either way.

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>, preferably with
clarity over the disassembly.

>      asm volatile ( "cpuid"
>                     : "=a" (*eax), "=b" (*ebx), "=c" (*ecx), "=d" (*edx)
>                     : "a" (leaf), "c" (subleaf) );


