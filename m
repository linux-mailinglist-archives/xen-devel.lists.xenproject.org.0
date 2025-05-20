Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4D0ABDBF3
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990790.1374708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNnE-00031K-F1; Tue, 20 May 2025 14:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990790.1374708; Tue, 20 May 2025 14:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHNnE-0002zf-CI; Tue, 20 May 2025 14:18:08 +0000
Received: by outflank-mailman (input) for mailman id 990790;
 Tue, 20 May 2025 14:18:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHNnD-0002zZ-S0
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:18:07 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f1f7dae-3585-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 16:18:05 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso10100274a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:18:05 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005ae3aed4sm7151768a12.75.2025.05.20.07.18.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:18:04 -0700 (PDT)
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
X-Inumbo-ID: 3f1f7dae-3585-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747750685; x=1748355485; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYxShCMmBaRvXeqwnmM4X/3Bq0aOg/BKzo7yFlkyXjw=;
        b=esdDdwJ+s9BzYu5Pxq1WME72/Zc885SY5twj/IUTkuJPgF0WKyw8je2VezCU9eSA0B
         fhdWNB3b2Jssv9xfrMTRiLcmsxkapUrKxW4eCdHPx1337UhKq1FYQIGMK5MOvuYf7M6i
         557smT+U7pw4vQXV9Lw3XAWnJ0C4VigbvC0evuHWkr9PcvcstGDyMa3CjU9wwXsvI296
         qFXRbcBRaVuc2wF6ABKRJoC8FQjSq6U4ImqBn2prupul3Bpo5aYQGUK6yV81MbWfo8QD
         lAKrcGArcpHg2WqoTSe2ln8SQC1OI5pQMKoe5JnFoCIpdcNUtX+s5+dL4fE8Td4w9jOb
         awxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747750685; x=1748355485;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SYxShCMmBaRvXeqwnmM4X/3Bq0aOg/BKzo7yFlkyXjw=;
        b=fDMgnP84WpIPYTy8k8sa4jUedknDe524iPt9TOkjmeyK5vEKU5qarY8kg4FgVL5WaJ
         aVhem/4nkGKurdGxVkPKaFSI/rC5rR9+7DHNxNUvQ78E00U14vajOdhdrkI5u0Kuoaoa
         aiFvlrIGg1G1sIginATY0RFDyU1Fda5onTaa3eC2P2cAp46c2koMqo4VR5Mq9np2GmKf
         aW01R/s5tDJA/uma92jO/u+mbAdSVAbORsMmdSP1wBKvgFEV7/u/1bovwR5d4M5yELiX
         NmtUOSF5esoNZgzqDSJC6IKBR4gc00X+Qk1uDAcyfVTdw6F179j2ys+RBzHbxBsCuLkY
         ZyUg==
X-Forwarded-Encrypted: i=1; AJvYcCVQxTU+OYk/4Lu/0lo4Ac4PME0mFJeL5UOeooppbl5w2amrV4sJUqW1hJCal5FBIBeA1cJgp9ufJNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxMviCOX82PMaY3UioPqb766C/jHkafwhV1tplc0TM74q2vvrLY
	62y+hUcVJgif9Y9B5mHtpvF1K2GePzvgbbLgc8DLsygnkdTdaIaMKOtUNGeojmmfBg==
X-Gm-Gg: ASbGncsXe/TSJG4B1K+WPAGAarByaaWkvjttzm3TZbBurgulKl2zIGy9F6903yJTBB4
	dH7zT6exBPiV6CZl4MMf4D2pibjJq5NFSk6t1a9vBtnwEh7ncPQkUYJMW3h+ivvAykI+rMTzPXG
	DICb3LFteePd8KVPS30QfHBEDiEeSRNaqmrdDtrJqx2JIARMmp2E6WTNOhcLML4USoFRovVKjDs
	9Cq17G/qgcjzI9fJAQDy6V2eXhT2ExftpHCjpuwOSuEeURaY2gjUJlv9zNfn6fKYoHHyVzbN1t8
	13TyuZx3if4zA2mvTfKQW21e+Z2YjVDC8/2NXg1M8CUoPM2+5vo+7Y0qD4d8rA==
X-Google-Smtp-Source: AGHT+IEKNvknPL/jZJ3zF9ccByw3phB/gPen/2hOsA1eaQqRpmd7dh4B+2gYSniGd3T/Lu9jWTNkJw==
X-Received: by 2002:a05:6402:2549:b0:600:7c6:eb28 with SMTP id 4fb4d7f45d1cf-6011407df9emr15550480a12.3.1747750684888;
        Tue, 20 May 2025 07:18:04 -0700 (PDT)
Message-ID: <4fc9832c-394c-4fd5-84a2-e898aae41884@suse.com>
Date: Tue, 20 May 2025 16:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] xen/riscv: introduce register_intc_ops() and
 intc_hw_ops.
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <7cd7d3780bb6db45b92c971ff8bcf2634570431f.1746530883.git.oleksii.kurochko@gmail.com>
 <2436be2e-28d4-4e48-a391-84b21651b339@suse.com>
 <9c202b56-ad59-481b-924a-addefcea84cd@gmail.com>
 <0c167d88-798c-46df-a912-60c4252a8e26@suse.com>
 <35f6a84a-7dbf-410a-9634-a6edec1b2717@gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <35f6a84a-7dbf-410a-9634-a6edec1b2717@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.05.2025 16:04, Oleksii Kurochko wrote:
> On 5/19/25 3:16 PM, Jan Beulich wrote:
>> On 19.05.2025 11:16, Oleksii Kurochko wrote:
>>> On 5/15/25 10:06 AM, Jan Beulich wrote:
>>>> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>>>>> --- a/xen/arch/riscv/include/asm/intc.h
>>>>> +++ b/xen/arch/riscv/include/asm/intc.h
>>>>> @@ -8,6 +8,8 @@
>>>>>    #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
>>>>>    #define ASM__RISCV__INTERRUPT_CONTOLLER_H
>>>>>    
>>>>> +#include <xen/irq.h>
>>>> If you need this include anyway, why ...
>>>>
>>>>> @@ -17,6 +19,26 @@ struct intc_info {
>>>>>        const struct dt_device_node *node;
>>>>>    };
>>>>>    
>>>>> +struct irq_desc;
>>>> ... this "forward" decl for something that's then already fully defined?
>>>> I can't, however, spot why xen/irq.h would be needed for anything ...
>>> forward decl for irq_desc could be really dropped.
>>>
>>> Inclusion of xen/irq.h was added because of hw_irq_controller which is defined as:
>>>     typedef const struct hw_interrupt_type hw_irq_controller;
>>>
>>> And I'm not sure how to do forward declaration properly in this case. Just use
>>> an explicit definition of hw_irq_controller for host_irq_type member of struct
>>> intc_hw_operations seems as not the best one option:
>>>     struct hw_interrupt_type;
>> This isn't needed for the use below.
> 
> Shouldn't I tell the compiler that definition of hw_interrupt_type struct exist
> somewhere else?

The above decl merely introduces the type into (global) scope. The same is
achieved by ...

>>>     struct intc_hw_operations {
>>>         ...
>>>         // const hw_irq_controller *host_irq_type;
>>>         const struct hw_interrupt_type *host_irq_type;

... this. The case where the earlier decl matters is when a type is used
as a function parameter in a prototype. There, if not previously introduced
into global scope, the scope would be limited to that of the function decl
(and hence a type conflict would result when later the same type is
introduced into global scope).

>>>>> --- a/xen/arch/riscv/intc.c
>>>>> +++ b/xen/arch/riscv/intc.c
>>>>> @@ -5,6 +5,15 @@
>>>>>    #include <xen/init.h>
>>>>>    #include <xen/lib.h>
>>>>>    
>>>>> +#include <asm/intc.h>
>>>>> +
>>>>> +static struct __ro_after_init intc_hw_operations *intc_hw_ops;
>>>> Nit: Attributes between type and identifier please. Also shouldn't both
>>>> this and ...
>>>>
>>>>> +void __init register_intc_ops(struct intc_hw_operations *ops)
>>>> ... the parameter here be pointer-to-const?
>>> Then|intc_hw_ops| should also be marked as|const| (with the removal of|__ro_after_init|),
>> Why remove the attribute?
> 
> My understanding is that if it is marked as 'const' then it automatically mean that it is read-only
> always before and after init, so '__ro_after_init' is useless.

You need to separate properties of the (pointer type) variable, and what
that pointer points to. __ro_after_init applies to the variable, whereas
the const asked for is to apply to the pointed-to type. (This is more
obvious when you place the attribute as requested. Hence why we want that
particular placement.)

Jan

