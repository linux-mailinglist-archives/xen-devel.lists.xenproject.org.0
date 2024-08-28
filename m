Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB19096310A
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2024 21:37:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785118.1194539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjOTM-00065C-5V; Wed, 28 Aug 2024 19:36:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785118.1194539; Wed, 28 Aug 2024 19:36:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjOTM-00063h-2F; Wed, 28 Aug 2024 19:36:52 +0000
Received: by outflank-mailman (input) for mailman id 785118;
 Wed, 28 Aug 2024 19:36:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjOTK-00063b-Bk
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 19:36:50 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dda76536-6574-11ef-99a0-01e77a169b0f;
 Wed, 28 Aug 2024 21:36:48 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5bebd3b7c22so1765784a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 12:36:48 -0700 (PDT)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e549ce94sm280117966b.78.2024.08.28.12.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Aug 2024 12:36:46 -0700 (PDT)
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
X-Inumbo-ID: dda76536-6574-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724873808; x=1725478608; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SMeaRe1grcnleZp5PTuI+x0gNgH883nGOFfW3RpRT14=;
        b=GqK66z2qZwfv9CRqBZCpUStB4qOj/rfhhUZvRKAVIvekIhzQOV8xbR7FrNzPflLJvF
         VvDSRQhx7+WvDC/YDHUVbr8hrxgu2Um4dRmTqxH0M9FzbseLbxPl+AouWIyT+yoNJ/zS
         wkFhmflVZq2SAz0jJINOVPWEKRgcPYYxHwQus=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724873808; x=1725478608;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMeaRe1grcnleZp5PTuI+x0gNgH883nGOFfW3RpRT14=;
        b=gVXpbczrmpUUzbgpXNrAGeng2b53V68vAI8urBbXT4Wg6Oh4alEQn13gcwCF+7MI39
         o/5sla9ikhnctCSg8sYmC7fZojtQg2LLMgAoS54OvEPO71PTinLfV1SUEyr0oGfBaXiM
         6s73HsfKG1gA23MA0o7NBjMfuU79xj0Z99p2iL3nMkE4K3E05wp7wIstpUqjkcUW27Oc
         3l1htVAbJOAjnZOehd0Sv5aHevrboucgZfHUsPFFGiqAi3ZfJ94ZF2ioBetUmZa8MysP
         rTvwy8QW0esCSF7bP/AHnc2bsbi2Jt8TNLoW4bO36hzn7PPAvMqfxBSjm8ouMD1LmGrG
         LIAA==
X-Forwarded-Encrypted: i=1; AJvYcCVeHlMja7jMiawBFoJA5UNWH/Q3cjGKzy0cEf2lCAN/a0LhGUEYLPRtWQdRDWSQ+dbFRodr3cZhbfQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxgSoDRYGwvNu0CyBe9zNssseqMq2wCgGUuEMwlJ4LJf72CbsPn
	UPEFXdnyd5Irl8bnHNy0OguNvvLQ1pFRlicQyixn5CET3SlT9anvilQLHwZyHPo=
X-Google-Smtp-Source: AGHT+IEWOMt1xcAHcG4qSWhLp3pcsOo5Cg/J4mibco6PthfI5HeKPFzIbd9S56NJ814PojsmBE8UQA==
X-Received: by 2002:a17:907:1c1e:b0:a7d:a453:dba1 with SMTP id a640c23a62f3a-a89825f8407mr19451366b.20.1724873807407;
        Wed, 28 Aug 2024 12:36:47 -0700 (PDT)
Message-ID: <2049e310-53ff-47b1-8f8e-9ad8c08cec3c@citrix.com>
Date: Wed, 28 Aug 2024 20:36:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] x86/vmx: Rewrite vmx_sync_pir_to_irr() to be more
 efficient
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240827135746.1908070-1-andrew.cooper3@citrix.com>
 <20240827135746.1908070-5-andrew.cooper3@citrix.com>
 <d022a5b1-c0ca-4399-b972-b01d834a95ec@suse.com>
 <cb2609f0-ed06-40ab-9983-9dad59c589d9@citrix.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <cb2609f0-ed06-40ab-9983-9dad59c589d9@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/08/2024 7:08 pm, Andrew Cooper wrote:
> On 28/08/2024 10:19 am, Jan Beulich wrote:
>> On 27.08.2024 15:57, Andrew Cooper wrote:
>>> +     * get it back again.
>>> +     */
>>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._64); ++i )
>>> +        vec._64[i] = xchg(&desc->pir[i], 0);
>>> +
>>> +    /*
>>> +     * Finally, merge the pending vectors into IRR.  The IRR register is
>>> +     * scattered in memory, so we have to do this 32 bits at a time.
>>> +     */
>>> +    irr = (uint32_t *)&vcpu_vlapic(v)->regs->data[APIC_IRR];
>>> +    for ( unsigned int i = 0; i < ARRAY_SIZE(vec._32); ++i )
>>> +    {
>>> +        if ( !vec._32[i] )
>>> +            continue;
>>>  
>>> -    bitmap_for_each ( i, pending_intr, X86_NR_VECTORS )
>>> -        vlapic_set_vector(i, &vlapic->regs->data[APIC_IRR]);
>>> +        asm ( "lock or %[val], %[irr]"
>>> +              : [irr] "+m" (irr[i * 0x10])
>> This wants to be irr * 4 only, to account for sizeof(*irr) == 4.
> Ah, that will be where the AlderLake interrupts are disappearing to.

Indeed.  It's much happier now.

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1431047447

~Andrew

