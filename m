Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43483A46FBF
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 00:56:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.897304.1305997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnRFm-0002Ix-86; Wed, 26 Feb 2025 23:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 897304.1305997; Wed, 26 Feb 2025 23:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnRFm-0002Gu-5V; Wed, 26 Feb 2025 23:55:50 +0000
Received: by outflank-mailman (input) for mailman id 897304;
 Wed, 26 Feb 2025 23:55:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GPjD=VR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tnRFk-0002Go-4p
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 23:55:48 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31e5fd0a-f49d-11ef-9897-31a8f345e629;
 Thu, 27 Feb 2025 00:55:45 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so9416575e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 15:55:45 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b7a27ab2asm4460035e9.32.2025.02.26.15.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 15:55:43 -0800 (PST)
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
X-Inumbo-ID: 31e5fd0a-f49d-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740614145; x=1741218945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zBB27sS1ONpB3Axog98rPbBYWzFb91ipmx5Xt7wfKng=;
        b=sqNnbW1dT4RjaNAKRVv25A1sPsZ7+gyJeC8KyOxm2dEQn9vdPbFJ9nUqeP6WlUbXzl
         ThAIfd3OTCHLPBwf+FV8YOFqpHQ7etkRz857IeMvUChzMM9sm/O9T6yR1DHS1QaP2K0v
         xsJY+qko/A0ZACYyFpiIxVgpvkVyxG+1EGo6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740614145; x=1741218945;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zBB27sS1ONpB3Axog98rPbBYWzFb91ipmx5Xt7wfKng=;
        b=blGjQeMQYsxEdl/yX17EonA843c98Ak3jFwbnW+zPPFVyIg2GNWkaeZOY/Wn98M9T4
         WmpAxNt70E4eI8nsqEqP5PvdwUgU33uYVsPcFk2GMxs/KpqT3NivEMFmLX1aKVHmPKEs
         LH56dWGwKwuIl/4sD1ReJeBQIfBrrPMdcGyY0rw9ezbTD8zZ0iWpKpYhGtRygpPsKqCG
         R/kwqIQw32yiSH1CKs4QaYQCb7jTqbJZaZgPDvsAm1bl88BWXlD+dsPfaYmWNVoCEKDO
         fI1eB3XN0o+qUeynFKLc9j6Tq1vZ1xpQpl1RnTiIyWbvQIao14Lp6EnRtwwwGaN37Qii
         jV3A==
X-Forwarded-Encrypted: i=1; AJvYcCVV5WE+Sxpb76AD4ghfuTn5v+Mfvzkg2uJPxwBMKIH4LeDectx3N+oaWRMoQ86Bp1bTSWqm4ZtkbB4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzFk7VRACc8GLykOVUVzHB0X/jiBOsWKz9PK9AJEFg6yOLqaOzD
	wGI/pRJCOooz3owwSGtTcZw9QxeoDWKoMGMvAQ0AM9fRhDCFK6H7o+Lx33zNkg2AnD/JI2dwJZ/
	V
X-Gm-Gg: ASbGnctsWZl8oTDFVBhaRRKSvbnYPe9835QTU5zLvwbvXIUwATKit2R3cegf5Sk6Aeq
	A7mrleqtPUPH2WLIYljlkpmudIwfllLdiFdjt0x3vASw4yzcgZIeZYWSPK5Q/OEUh/UelCUCA9u
	CUEQT9lQbCF4R0UNFxSLRvN7iL39mK7xkrvwfICS/NABN4kDZyHCJCz7k4gAaiUxJultOjUGVTi
	p1/FRuxsC+5ICIiOvb5SheRnv4xTDbSOXrzXKH8hok3OLUH89IioyfodgfLGQ3a0ZvQ2LoYGhnn
	w7Ho7sVd1EdmJm0TE1yIjWhiBRF33NvIl4RL8kf9Q5Eu82w1spEG2qy6/7TJWyoYJQ==
X-Google-Smtp-Source: AGHT+IHQtKRUgXrPB6t/OjZpYQJwz3MLU3D0PiWpDDRSpMJAdnLh6ZU+9tiwitbLFhrt2oz6PsnETg==
X-Received: by 2002:a05:600c:3586:b0:439:98fd:a4b6 with SMTP id 5b1f17b1804b1-43ba133ca60mr32025e9.15.1740614145156;
        Wed, 26 Feb 2025 15:55:45 -0800 (PST)
Message-ID: <6c19be7d-eb79-41e6-a86e-97b9f1e5b97b@citrix.com>
Date: Wed, 26 Feb 2025 23:55:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RISCV/bitops: Use Zbb to provide arch-optimised bitops
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250226172050.1300771-1-andrew.cooper3@citrix.com>
 <f22e1d84-45a4-4d9d-a2e0-3b880b8d7704@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f22e1d84-45a4-4d9d-a2e0-3b880b8d7704@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/02/2025 9:01 pm, Oleksii Kurochko wrote:
>
>
> On 2/26/25 6:20 PM, Andrew Cooper wrote:
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Depends on "xen/riscv: make zbb as mandatory"
>> ---
>>  xen/arch/riscv/include/asm/bitops.h | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
>> index d22eec1e87c7..df3df93520c5 100644
>> --- a/xen/arch/riscv/include/asm/bitops.h
>> +++ b/xen/arch/riscv/include/asm/bitops.h
>> @@ -125,6 +125,13 @@ static inline void clear_bit(int nr, volatile void *p)
>>  #undef NOT
>>  #undef __AMO
>>  
>> +#define arch_ffs(x)     ((x) ? 1 + __builtin_ctz(x) : 0)
>> +#define arch_ffsl(x)    ((x) ? 1 + __builtin_ctzl(x) : 0)
>> +#define arch_fls(x)     ((x) ? 32 - __builtin_clz(x) : 0)
>> +#define arch_flsl(x)    ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
>> +
>> +#define arch_heightl(x) __builtin_popcountl(x)
>> +
>>  #endif /* ASM__RISCV__BITOPS_H */
>>  
>>  /*
> LGRM: Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Thanks.  This form is much easier than making alternatives for it.

> Thanks.
>> base-commit: 7cf163879c5add0a4f7f9c987b61f04f8f7051b1
>> prerequisite-patch-id: 9ee1f7ebf5d34b1c565ee2d3d4fb319164bb8bcd
>> prerequisite-patch-id: 8a05c87c8d051a3ac0820887f676bbd318e4ae88
>> prerequisite-patch-id: 6b56e42d130d8b5ee39457b6760b05cc6e16b049
>> prerequisite-patch-id: c139f1f5741d695cd5e5aa6be904edcb61b73885
>> prerequisite-patch-id: 99f8b701000e9ee11060934e627a988ddf9aaaa7
> Could you please tell me how do you generate this one?

In gitconfig,

[format]
        useAutoBase = "whenAble"

or --base=auto on a git format-patch command.

This is a poor example.  Those prereq ids are:

* 307e136282d8 - (HEAD -> riscv-isa) RISCV/bitops: Use Zbb to provide
arch-optimised bitops (7 hours ago) <Andrew Cooper>
* 519dcd50e4cd - xen/riscv: make zbb as mandatory (12 hours ago)
<Oleksii Kurochko>
* c9bf2a9ac22c - xen/riscv: identify specific ISA supported by cpu (12
hours ago) <Oleksii Kurochko>
* 9014de63aa14 - automation: drop debian:11-riscv64 container (12 hours
ago) <Oleksii Kurochko>
* 5febb98d11f3 - xen/riscv: drop CONFIG_RISCV_ISA_RV64G (12 hours ago)
<Oleksii Kurochko>
* 5a7c9fd746af - xen/README: add compiler and binutils versions for
RISCV-64 (12 hours ago) <Oleksii Kurochko>
* 7cf163879c5a - (xenbits/staging, xenbits/master, upstream/staging,
upstream/master, origin/staging, origin/master, origin/HEAD, staging,
pending, master) PPC: Activate UBSAN in testing (12 hours ago) <Andrew
Cooper>

as I pulled your series in locally.

~Andrew

