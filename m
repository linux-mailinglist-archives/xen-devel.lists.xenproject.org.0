Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC82A97679
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 22:04:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963541.1354518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Jqb-0005ox-6m; Tue, 22 Apr 2025 20:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963541.1354518; Tue, 22 Apr 2025 20:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7Jqb-0005mc-3v; Tue, 22 Apr 2025 20:04:01 +0000
Received: by outflank-mailman (input) for mailman id 963541;
 Tue, 22 Apr 2025 20:03:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7JqZ-0005mR-Qp
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 20:03:59 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ece7f94f-1fb4-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 22:03:57 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so41483285e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 13:03:57 -0700 (PDT)
Received: from [192.168.86.29] ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa43cb43sm16457974f8f.53.2025.04.22.13.03.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 13:03:56 -0700 (PDT)
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
X-Inumbo-ID: ece7f94f-1fb4-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745352237; x=1745957037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OD20kEYi5HUmXlUomfPs8a6f0KUDAWuvK1Lu2aSLbuI=;
        b=NLAO04u6y/BVbSazHfM24dcWIo8QIbK14akniamZt1IufRyBXIUwgnr7Y62jgLBTFg
         gpHdlofNAsWMz7tlZBXMbge/1E85xTyNrzIDM6IPZU9QwKMjPO+YcmQc/GKrjh9hO17Y
         nmB523S04PZ81QCrhIPgRg7SzMamSFw+iALU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745352237; x=1745957037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OD20kEYi5HUmXlUomfPs8a6f0KUDAWuvK1Lu2aSLbuI=;
        b=E+nv3a0LWsjYsai5UnkGHA33Z2yAYQm+9hv1SWN8kOmTH77kV5d5DE6j1vmvxTkL1g
         00s+wqWkfLVpUhuk4JkZ2xyB9t1lSwax2I7/TsbOFJ5hg5Cr7Z1lkF10/Z360DZihy9S
         SdGrYvMgBhU6UnqdtVMjpTV/U8x/VRnLBkATLWl5spGvJdSzTlWS6D11ZrhrzxeflB0A
         66ZX+w4+OreqzHgVR2/0FvvX7NYeKMxoOu71W3rB0TmXcRz6Pq0J6ZNkZ3JPbXJMaUzg
         BhujnvCo6utohm9iOVh2clabYVYr5osodfpxmk0PkOdDB5Lw0kqv1AUM3HSrrsjtqnXf
         4zaA==
X-Gm-Message-State: AOJu0YxphAmb091PzLGrZQtVHplIBhyfA4Kan7/kAqRGUqmQSApgp0V7
	FrqVrks7Ugh93c2qgEwwE6+Sw/JuKc80eGQx1BKCzzL6kd9wKkH/4lJyoT9s7v4=
X-Gm-Gg: ASbGnctS4q+V3yhd1B6Kiv7NsX0jThxiOTyVMt9WlbISS/yAay+49H0AcsQlfumSZXC
	CmkePHUE3yg+0YlHhyv9m5wU7/5DGQRNUFTy9a715BLy9KtjUadwHv8V5FHF3mbuyX67a2xe+5s
	wqEQ48mZXquMode7BzQp8n22VRniE0hFDyrPDOLmwXNG5nZUMEFhi9SOXHE1vkNk+mEMdc0ubNk
	MgLqosAM8I2KX1cAdIvcW6WEs6TzQ66EIJ0cdfRwVnb0K00Jeg0mXr234a688AJgrl7h6q3nlT5
	xs0tsZyKRsLr2zwWN2Xg1wKAVk4jntRUZxf7xV27Zr9v+7C4tfYwfQ==
X-Google-Smtp-Source: AGHT+IH7ro1peWyefsVtXm+F2nJYEzE2NwXAluo24e2jXgie7rfJgrBM6KR3qtDDU9uWg6ku1jKFRw==
X-Received: by 2002:a5d:584b:0:b0:391:412b:e23f with SMTP id ffacd0b85a97d-39efba3c819mr12797958f8f.15.1745352237267;
        Tue, 22 Apr 2025 13:03:57 -0700 (PDT)
Message-ID: <34ef06c8-cb13-4078-bd39-ad176edfaae7@citrix.com>
Date: Tue, 22 Apr 2025 21:03:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Use asm inline when available for alternatives
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20250422113957.1289290-1-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2504221244360.785180@ubuntu-linux-20-04-desktop>
 <0570b0ed-607c-49fa-b82e-29ffac60f873@citrix.com>
 <alpine.DEB.2.22.394.2504221256080.785180@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2504221256080.785180@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/04/2025 8:58 pm, Stefano Stabellini wrote:
> On Tue, 22 Apr 2025, Andrew Cooper wrote:
>> On 22/04/2025 8:46 pm, Stefano Stabellini wrote:
>>> On Tue, 22 Apr 2025, Andrew Cooper wrote:
>>>> Compilers estimate the size of an asm() block for inlining purposes.
>>>>
>>>> Constructs such as ALTERNATIVE appear large due to the metadata, depsite often
>>>> only being a handful of instructions.  asm inline() overrides the estimation
>>>> to identify the block as being small.
>>>>
>>>> This has a substantial impact on inlining decisions, expected to be for the
>>>> better given that the compiler has a more accurate picture to work with.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> Hi Andrew,
>>>
>>> If we are going to use asm_inline, please add a note to
>>> docs/misra/C-language-toolchain.rst where we keep record of all the
>>> language extensions we use.
>> It's just asm(), and that's already discussed.
>>
>> I'm not sure what else you think is warranted.
>
> If it is just asm() then there is nothing to do. We only need to
> document extensions to the language, nothing else. Many of them are
> already documented under docs/misra/C-language-toolchain.rst (see for
> instance asm and __asm__).
>
> I see the critical part of the patch for this question is:
>
>> +#if CONFIG_CC_HAS_ASM_INLINE
>> +# define asm_inline asm __inline
>> +#else
>> +# define asm_inline asm
>> +#endif
> it looks like __inline is an extension ?

That's just inline.  (It's an alternative spelling, and we discuss those
too.)

The reason it's not plain "asm inline" is because of the (deviated)
"#define inline inline __init", where an eventual "asm inline __init
(..." is a syntax error.

~Andrew

