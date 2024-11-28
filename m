Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5920D9DB56D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 11:11:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845209.1260668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbTy-0002rs-SL; Thu, 28 Nov 2024 10:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845209.1260668; Thu, 28 Nov 2024 10:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGbTy-0002qP-Pn; Thu, 28 Nov 2024 10:10:46 +0000
Received: by outflank-mailman (input) for mailman id 845209;
 Thu, 28 Nov 2024 10:10:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53lb=SX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGbTy-0002qJ-3g
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 10:10:46 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 05d358cb-ad71-11ef-99a3-01e77a169b0f;
 Thu, 28 Nov 2024 11:10:41 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3824a089b2cso417627f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 02:10:41 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd92a52sm1225267f8f.109.2024.11.28.02.10.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 02:10:40 -0800 (PST)
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
X-Inumbo-ID: 05d358cb-ad71-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzMiLCJoZWxvIjoibWFpbC13cjEteDQzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA1ZDM1OGNiLWFkNzEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzg4NjQxLjQ2OTg5MSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732788641; x=1733393441; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IjlOX+olG5uAs8XcejPPUjLYY43wi6D/+ZwKCQcC6gY=;
        b=MCK9NtrdjWmPESzr4hGgDk6xeGiYmshTBoMYOHjThOupeBgEJ7Sj1+DX7ITt10Dm+X
         1uY8mZ54+ttljU/GABGyiHgkSjFXz5N18SkygT2LqdA2LG4WwE/puCfQwGiHbr7npSEu
         AlC1F/H5moPPlM4QxC1s3hBpexv8q43b0NfKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732788641; x=1733393441;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjlOX+olG5uAs8XcejPPUjLYY43wi6D/+ZwKCQcC6gY=;
        b=A8FVzHbggzF7BSy0o3rW7UzkFHH/EIcMCViuk3wnbVrpWUxg9n7PDztnKWDIlH7ja/
         GwTavoEluXTDg9RWaLR4EEJz6VooavYZ9GtNdsxeTXFmWtVafZ5FIHA5wafBqtAf2UXV
         FQrLxfnBOa/9/s6mSKi1wmqedU+hhf3EF1frE8p4RZx723lnuiQTn0PQemo9WXeQkamL
         A66IaHZEC55WXGpnDsaBnZbmD2IOqCm33iljxZ54N9dDllNFe16PYXAllH0SmgwgYs0S
         6zK/kHUkGW16hgJKEZXts186pCL2UM5aCt2qq9T+1w2ejUM9XPx3P3oVozFrm+nku4Rn
         afOg==
X-Gm-Message-State: AOJu0Yw2VX4zGXhQLW377l1AAkjY9hETfs70bvYZZLoiVmW1+bCsBYWe
	qR8J/tgZ6apmp0KxiO32v4yxUgBCl6j+lpQ5HDxxMOkL64E1jQefMYcxxnx3lsckKyKJUSvbhcU
	9
X-Gm-Gg: ASbGnctPe70jpO0/wBqIAsTfYSuDWSX1IBEsunxrUliFqvYGgJty/MfKWswsaQqSPK2
	ETzbn34AOeeqfilbQHoSHLCYB+sQ5zZPhFzHHtDu2WeetgRl1fI9DR7xXIAcC8cXiWVeWYYJ0Hm
	gZtQs6c7Ri3uLiWQFAFZQ/Qnowmy609aQA2ZqfKTbAmj197xfiKkToAIHVXYVkPr3vw6PKmutV4
	DNmorT/aWH7cB37bpTg4UI2yz0gcABwFh9h3d4N8yHW4f15NQIP0z/mZTRk6JnYiAStUGDoTvo3
	umvjAt+r28jQeQ==
X-Google-Smtp-Source: AGHT+IFkl/HpRXBgntU3ecsWoKRm6Gook/+NWSETqTRnceWaK+e8CNBuxbzH96VxePajfTb5vruUSw==
X-Received: by 2002:a5d:6d0b:0:b0:382:1cff:2e6f with SMTP id ffacd0b85a97d-385c6edd784mr4760330f8f.37.1732788640750;
        Thu, 28 Nov 2024 02:10:40 -0800 (PST)
Message-ID: <33f3dbbf-217d-45a7-bb9f-fac7e1a36584@citrix.com>
Date: Thu, 28 Nov 2024 10:10:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/vlapic: Drop vlapic->esr_lock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
 <20241128004737.283521-3-andrew.cooper3@citrix.com>
 <Z0g3LBzM-8ox5dAW@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <Z0g3LBzM-8ox5dAW@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/11/2024 9:26 am, Roger Pau Monné wrote:
> On Thu, Nov 28, 2024 at 12:47:37AM +0000, Andrew Cooper wrote:
>> With vlapic->hw.pending_esr held outside of the main regs page, it's much
>> easier to use atomic operations.
>>
>> Use xchg() in vlapic_reg_write(), and *set_bit() in vlapic_error().
>>
>> The only interesting change is that vlapic_error() now needs to take an
>> err_bit rather than an errmask, but thats fine for all current callers and
>> forseable changes.
>>
>> No practical change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>
>> It turns out that XSA-462 had an indentation bug in it.
>>
>> Our spinlock infrastructure is obscenely large.  Bloat-o-meter reports:
>>
>>   add/remove: 0/0 grow/shrink: 0/3 up/down: 0/-111 (-111)
>>   Function                                     old     new   delta
>>   vlapic_init                                  208     190     -18
>>   vlapic_error                                 112      67     -45
>>   vlapic_reg_write                            1145    1097     -48
>>
>> In principle we could revert the XSA-462 patch now, and remove the LVTERR
>> vector handling special case.  MISRA is going to complain either way, because
>> it will see the cycle through vlapic_set_irq() without considering the
>> surrounding logic.
>> ---
>>  xen/arch/x86/hvm/vlapic.c             | 32 ++++++---------------------
>>  xen/arch/x86/include/asm/hvm/vlapic.h |  1 -
>>  2 files changed, 7 insertions(+), 26 deletions(-)
>>
>> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
>> index 98394ed26a52..f41a5d4619bb 100644
>> --- a/xen/arch/x86/hvm/vlapic.c
>> +++ b/xen/arch/x86/hvm/vlapic.c
>> @@ -102,14 +102,9 @@ static int vlapic_find_highest_irr(struct vlapic *vlapic)
>>      return vlapic_find_highest_vector(&vlapic->regs->data[APIC_IRR]);
>>  }
>>  
>> -static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
>> +static void vlapic_error(struct vlapic *vlapic, unsigned int err_bit)
> Having to use ilog2() in the callers is kind of ugly.  I would rather
> keep the same function parameter (a mask), and then either assert that
> it only has one bit set, or iterate over all possible set bits on the
> mask.

It can't stay as a mask, or we can't convert the logic to be lockless. 
There's no such thing as test_and_set_mask()  (until we get into next
years processors).

If you really don't like ilog2(), then we need a parallel set of
APIC_ESR_*_BIT constants, but I considered ilog2() to be the lesser of
these two evils.

> I assume you had a preference for doing it at the caller because it
> would then be done by the preprocessor as the passed values are
> macros.  Maybe we could add a wrapper about it:
>
> static void vlapic_set_error_bit(struct vlapic *vlapic, unsigned int bit)
> { ... }
>
> #define vlapic_error(v, m) ({         \
>     BUILD_BUG_ON((m) & ((m) - 1));    \
>     vlapic_set_error_bit(v, ilog2(m));\
> })

This is overkill IMO.  There are 3 callers and they're all local to
apic.c (hopefully soon to gain a 4th, but still).
>>  {
>> -    unsigned long flags;
>> -    uint32_t esr;
>> -
>> -    spin_lock_irqsave(&vlapic->esr_lock, flags);
>> -    esr = vlapic->hw.pending_esr;
>> -    if ( (esr & errmask) != errmask )
>> +    if ( !test_and_set_bit(err_bit, &vlapic->hw.pending_esr) )
>>      {
>>          uint32_t lvterr = vlapic_get_reg(vlapic, APIC_LVTERR);
>>          bool inj = false;
>> @@ -124,15 +119,12 @@ static void vlapic_error(struct vlapic *vlapic, unsigned int errmask)
>>              if ( (lvterr & APIC_VECTOR_MASK) >= 16 )
>>                   inj = true;
> The line above also has bogus indentation.

Yes, that was mentioned.

~Andrew

