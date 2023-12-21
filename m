Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E10181B458
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 11:50:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658810.1028192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGdF-0007Wu-SJ; Thu, 21 Dec 2023 10:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658810.1028192; Thu, 21 Dec 2023 10:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGGdF-0007Tk-P2; Thu, 21 Dec 2023 10:50:25 +0000
Received: by outflank-mailman (input) for mailman id 658810;
 Thu, 21 Dec 2023 10:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxSo=IA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rGGdE-0007TV-1u
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 10:50:24 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd11e2d6-9fee-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 11:50:22 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3368c5c077fso152326f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 02:50:22 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 k4-20020a5d66c4000000b00336755f15b0sm1749980wrw.68.2023.12.21.02.50.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 02:50:21 -0800 (PST)
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
X-Inumbo-ID: bd11e2d6-9fee-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1703155821; x=1703760621; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URBm3EixPXVe0EQlnCIijpoE7+MYm7JICIjdfh4XrZA=;
        b=MJPkjmK/LdD8m+sWoaqx7waVZamjgHHjn4/dFJQweukAt3bE0ebYZBcQinGVrmw+0/
         6xGwYNImRtBzJ54SitEbBcXQAkLocGIIBDinwb2HlOen0xgi8WuRS2jiLTDlzhn+eZ8H
         js6T0jE4vBmQzdDbQuOUFSjuIDW6bX9SYE8dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703155821; x=1703760621;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URBm3EixPXVe0EQlnCIijpoE7+MYm7JICIjdfh4XrZA=;
        b=b5jFeq99A5XWcW/GoHZlegKffi15WdpdJcNGIgHJQHuIp7q8e/lZOhd0VUjvBsZAk+
         57XqgOgLxo47BVPHYCn8kNcPZ3m7BSDOyKwqHyu/Y6xBPUmjaLqd/hF/wcp3EpCOxUNZ
         MO8WPgYMS4M05VXPoBfOI8xuyCmYz/P2Zt8mFYozejQ9pFXUcMzJteincTLcc1qd0IR/
         A3UjoqZRyM9Pf7Yv030YZCbB7T11+HK4YJp1KypUqrZW3tv1pBe+JpFEB8Kx7MYAk/SP
         YqzhR+CWOMUvm7gswiLWTcdkbLJtcHRzCTv4PlK7m5Xr0ukplokOiCAxa51C/qtLaBNJ
         16SA==
X-Gm-Message-State: AOJu0YxcqGakmS9eW9OrSf9KnY5xW2R0FhYnZQEkc90Lvwj3e3LoQ5bG
	i+K+GEY40kaBQ+Aqh1UTHowocjDp7JgIzl3cl9U=
X-Google-Smtp-Source: AGHT+IFS8UEzYM/BKWw24e+oC/tOKUx6mLxbI/MMfDT/4E1bbP1hTY0AbWHs4I8oA0xqJJtRx9yiYQ==
X-Received: by 2002:a5d:4c41:0:b0:336:6294:f2a2 with SMTP id n1-20020a5d4c41000000b003366294f2a2mr318421wrt.189.1703155821665;
        Thu, 21 Dec 2023 02:50:21 -0800 (PST)
Message-ID: <97c3de46-b9cc-42d9-8a03-3552962b59fe@citrix.com>
Date: Thu, 21 Dec 2023 10:50:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 0/7] xen/arm: address violations of MISRA C:2012 Rule
 16.3
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <d847830f-7071-4141-bab7-8b8c55ec3ae8@citrix.com>
 <5810703d-7ade-4b85-961c-e0c50f9aab34@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5810703d-7ade-4b85-961c-e0c50f9aab34@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/12/2023 8:08 am, Jan Beulich wrote:
> On 20.12.2023 22:35, Andrew Cooper wrote:
>> On 20/12/2023 11:03 am, Federico Serafini wrote:
>>> This patch series addresses violations of MISRA C:2012 Rule 16.3 on the Arm
>>> code. No fucntional changes are introduced.
>>>
>>> Federico Serafini (7):
>>>   xen/arm: gic-v3: address violations of MISRA C:2012 Rule 16.3
>>>   xen/arm: traps: address violations of MISRA C:2012 Rule 16.3
>>>   xen/arm: guest_walk: address violations of MISRA C:2012 Rule 16.3
>>>   xen/arm: mem_access: address violations of MISRA C:2012 Rule 16.3
>>>   xen/arm: v{cp,sys}reg: address violations of MISRA C:2012 Rule 16.3
>>>   xen/arm: mmu: address a violations of MISRA C:2012 Rule 16.3
>>>   xen/arm: smmu-v3: address violations of MISRA C:2012 Rule 16.3
>>>
>>>  xen/arch/arm/arm64/vsysreg.c          |  4 ++--
>>>  xen/arch/arm/gic-v3.c                 | 30 +++++++++++++++++++++++++++
>>>  xen/arch/arm/guest_walk.c             |  4 ++++
>>>  xen/arch/arm/mem_access.c             | 12 +++++------
>>>  xen/arch/arm/mmu/p2m.c                |  1 +
>>>  xen/arch/arm/traps.c                  | 18 ++++++++++++----
>>>  xen/arch/arm/vcpreg.c                 |  4 ++--
>>>  xen/drivers/passthrough/arm/smmu-v3.c |  2 ++
>>>  8 files changed, 61 insertions(+), 14 deletions(-)
>>>
>> Just a couple of notes on style.  This isn't a request to change
>> anything in this series, particularly as most is already committed, but
>> bear it in mind for what I expect will be similar patches in other areas.
>>
>> We explicitly permit tabulation when it aids readibility, so patch 2
>> could have been written:
>>
>>         switch ( hypercall_args[*nr] ) {
>>         case 5: HYPERCALL_ARG5(regs) = 0xDEADBEEFU; fallthrough;
>>         case 4: HYPERCALL_ARG4(regs) = 0xDEADBEEFU; fallthrough;
>>         case 3: HYPERCALL_ARG3(regs) = 0xDEADBEEFU; fallthrough;
>>         case 2: HYPERCALL_ARG2(regs) = 0xDEADBEEFU; fallthrough;
>>         case 1: /* Don't clobber x0/r0 -- it's the return value */
>>         case 0: /* -ENOSYS case */
>>             break;
>>         default: BUG();
>>         }
>>
>> (give or take the brace placement other style issue)  We also have cases
>> where a break before a new case statement is preferred, i.e.:
> Did you mean "blank line" here, seeing ...
>
>>         ...
>>         break;
>>
>>     case ...:
>>
>> This is to prevent larger switch statements from being a straight wall
>> of text.
> ... this as the further explanation?

Urgh yes - I did mean blank line.  Hopefully the intent was clear.

~Andrew

