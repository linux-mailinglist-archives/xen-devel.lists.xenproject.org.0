Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B212ABBEEB
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 15:16:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.989800.1373753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0MI-00025E-MI; Mon, 19 May 2025 13:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 989800.1373753; Mon, 19 May 2025 13:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH0MI-000230-J2; Mon, 19 May 2025 13:16:46 +0000
Received: by outflank-mailman (input) for mailman id 989800;
 Mon, 19 May 2025 13:16:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cAbn=YD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uH0MH-00022p-51
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 13:16:45 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8266f2e6-34b3-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 15:16:44 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-6020053cbd5so365932a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 May 2025 06:16:44 -0700 (PDT)
Received: from [10.1.250.198] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6005a6e746csm5914744a12.47.2025.05.19.06.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 May 2025 06:16:43 -0700 (PDT)
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
X-Inumbo-ID: 8266f2e6-34b3-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747660603; x=1748265403; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WD8V0FqycuvaqmNySlstSxhbQi/5XV6hGxtYY5KusOE=;
        b=fdnV8OeV/BDpPhH3wk/1ukGTV/GY9G+odZGQwDA9uQm2VQwsSG+AwGRi7Nr4a/EOnK
         JXPH+ewNh8spmV52riONWZQhaD85IaRDZ59U5HSBM0IMWPtwhjfF2x2h9Y8fUxkPuM6Q
         KwURdwUN5isa9Pevt+qnVebt8FDIQC1JnIkIjic3Kb9OjqXl7Ebug+ZH8F1R1qIBmHZp
         AFbuxQ+j8ahd/c0f9Q1bRemNJ40XbLLInWKOlTwrFKguRTMLhB65c+c4WtKkIIZICXDT
         PTMUQyEq0BVPcPiEJJdngx7qSVR98rFZc9BVyHi9CsEbVLRL4OK0LNynfh2i22tvHCPO
         kQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747660603; x=1748265403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WD8V0FqycuvaqmNySlstSxhbQi/5XV6hGxtYY5KusOE=;
        b=C8PFvGBe5i5eNUavARGDBrhuHBwtzpBMXH6rkQ7H2/nvljgLCoH5v+7NvYZ5ybVaEO
         FUhSe3NvIm3wA5xiZWSg2KZUvZeFEIM/wNWigQJrHXo1LYgRlBauH6sdtDmUsCM2CDOq
         O3LmjHL81qyoL9l/T6oatIk1pF7mrLpr2pBZm2Z4nzpGD5yXsEQXT1OJQ338DtxW7AK7
         bGOf1MnLu4M0wK469fA6l6zj/i6GltAFWLSnjE3N/moKU2yT+OldKhGxsQOup1ou4mL6
         3QJd0aytNm2hzRpMExUwKGkflc7o+o9/vhKG0Zx7foCb66JaBaP8bP0+Rt+dDzwFjzr1
         pV7g==
X-Forwarded-Encrypted: i=1; AJvYcCXf95x7olLU18kiMnHun1P9x1oa9omEg6Z7MJdnglijDml8vdUrEum/6XOAMAdtuHt3aDEbsPCd7F8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUD9V0FGlLdb8SaRKrHUBaAuSY5ntPCFZE47i5eKV6flvsrqy+
	9dqvLA7tjgfVhF3+lDKr4FFuVrv8YxHdQrCVe+NcuVc7r5fFmHh5xp6ZPoZuV3uOGw==
X-Gm-Gg: ASbGncsSvXjV0bjCIHurS0ywyCnecYpwBE9F7c4TpYSCwMySl/rwWDhu6EVH3O/Naat
	nY/cj7eg9hWqa1u/w1+TsezlQYAQB/ccA4y/GpB1zK6ARQsrLvvvpJ41LKus3652QhpB3YNfbwM
	zLrDokqDVM6jcZJDSix185jOKtf4bU7vcLPOdfcT9ytK4IcRUBTD/PsAHUaykFmGqsZCuEh/yri
	76yVSzPIKVlLrz9UGcFhxAtw+YMhAGWk5oRnAqNBrYCH81TcuEFPPBH912M0seLL00B4D15xhMU
	La/y5uUkTJ4GprNUmqhwW+I8hHqzdd0DlPEoR0MmnSZm7LEdL1YqoLAxXsk6YTs7DPMeVaG7
X-Google-Smtp-Source: AGHT+IHgXCOMh5m04LxzlKxcWSn8SZr41xZhUdqsVxheOpW75MnMHhY6kihnRo2GLQd3bZj01dFwUw==
X-Received: by 2002:a05:6402:50c9:b0:601:a681:4d5c with SMTP id 4fb4d7f45d1cf-601a6814f05mr6213982a12.32.1747660603609;
        Mon, 19 May 2025 06:16:43 -0700 (PDT)
Message-ID: <0c167d88-798c-46df-a912-60c4252a8e26@suse.com>
Date: Mon, 19 May 2025 15:16:41 +0200
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
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9c202b56-ad59-481b-924a-addefcea84cd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.05.2025 11:16, Oleksii Kurochko wrote:
> 
> On 5/15/25 10:06 AM, Jan Beulich wrote:
>> On 06.05.2025 18:51, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/intc.h
>>> +++ b/xen/arch/riscv/include/asm/intc.h
>>> @@ -8,6 +8,8 @@
>>>   #ifndef ASM__RISCV__INTERRUPT_CONTOLLER_H
>>>   #define ASM__RISCV__INTERRUPT_CONTOLLER_H
>>>   
>>> +#include <xen/irq.h>
>> If you need this include anyway, why ...
>>
>>> @@ -17,6 +19,26 @@ struct intc_info {
>>>       const struct dt_device_node *node;
>>>   };
>>>   
>>> +struct irq_desc;
>> ... this "forward" decl for something that's then already fully defined?
>> I can't, however, spot why xen/irq.h would be needed for anything ...
> 
> forward decl for irq_desc could be really dropped.
> 
> Inclusion of xen/irq.h was added because of hw_irq_controller which is defined as:
>    typedef const struct hw_interrupt_type hw_irq_controller;
> 
> And I'm not sure how to do forward declaration properly in this case. Just use
> an explicit definition of hw_irq_controller for host_irq_type member of struct
> intc_hw_operations seems as not the best one option:
>    struct hw_interrupt_type;

This isn't needed for the use below.

>    struct intc_hw_operations {
>        ...
>        // const hw_irq_controller *host_irq_type;
>        const struct hw_interrupt_type *host_irq_type;

It might be that something like this is already done elsewhere in the tree,
so not really an issue imo if a 2nd instance appeared.

> It seems like the best one option is to do the following:
>    typedef const struct hw_interrupt_type hw_irq_controller; in asm/intc.h.
> I will follow it then.

Misra may dislike this.

>>> --- a/xen/arch/riscv/intc.c
>>> +++ b/xen/arch/riscv/intc.c
>>> @@ -5,6 +5,15 @@
>>>   #include <xen/init.h>
>>>   #include <xen/lib.h>
>>>   
>>> +#include <asm/intc.h>
>>> +
>>> +static struct __ro_after_init intc_hw_operations *intc_hw_ops;
>> Nit: Attributes between type and identifier please. Also shouldn't both
>> this and ...
>>
>>> +void __init register_intc_ops(struct intc_hw_operations *ops)
>> ... the parameter here be pointer-to-const?
> 
> Then|intc_hw_ops| should also be marked as|const| (with the removal of|__ro_after_init|),

Why remove the attribute?

> otherwise a compilation error will occur (something like/"assignment discards 'const' qualifier"/).
> 
> Additionally,|__ro_after_init| should be replaced with|const| for|aplic_ops| in future
> patches.

Same question here then.

Jan

