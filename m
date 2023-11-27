Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC497FA11B
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 14:29:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642092.1001225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bfm-0005uR-6k; Mon, 27 Nov 2023 13:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642092.1001225; Mon, 27 Nov 2023 13:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7bfm-0005sS-47; Mon, 27 Nov 2023 13:29:14 +0000
Received: by outflank-mailman (input) for mailman id 642092;
 Mon, 27 Nov 2023 13:29:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hhMp=HI=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r7bfk-0005sM-P9
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 13:29:12 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2a8b127-8d28-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 14:29:10 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-332f90a375eso1096288f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Nov 2023 05:29:10 -0800 (PST)
Received: from [10.80.4.253] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 y14-20020adff6ce000000b0033308db2576sm148139wrp.56.2023.11.27.05.29.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Nov 2023 05:29:09 -0800 (PST)
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
X-Inumbo-ID: f2a8b127-8d28-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701091750; x=1701696550; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0LNIHfEOwDBsf8wwbpILXgkaYyvbksHHNoO7waMEB0A=;
        b=CAVuf7gS5DyOcPUg9Clg23VZV+RFF5Ips6PeNw5ZCmP+2AXZDqDJO9ei0BPMercPK3
         wsFiNUFACmXQfCD5aiRG6iZbLerOdXforxiBmyEIlM97+wlg7Q90jhiMsc01VFtYe/Rt
         8sgE1LcsIBm09ZdEHwAsjLJjKjvwioItR66jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701091750; x=1701696550;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0LNIHfEOwDBsf8wwbpILXgkaYyvbksHHNoO7waMEB0A=;
        b=ESNgC85f9eWKOn7Y4wk+Lj80Ndf/gkvEP6cIjhYdBZ6xW0SyBRZPCWtpq19BOPbsS2
         CAaU3aodBP1QAqYDJRJp9rsEC8ELocNwy3vwGjiwZnE39Y8ekq4sqcUA8I1QFA14KcbZ
         mPutEENrulw8WA7AMlLiSEInlPBdYiDCT5Thld3D33BzFtnPOlRxPFiGROEAy3N9gh7T
         +NPEISkNgdHH21VKlsdHdmChZB0X0wlo5QGgiP2sIuuAsxTZRTOP4ye3rjHPzhO2kKec
         bXRW6tuE/SLmish2lNP7SVuaUtuTO8dsuU3XcsZyjKgRWQiOOl5frXe33b4nLnORbITP
         l2EA==
X-Gm-Message-State: AOJu0Yxh/VeR5LCPykG+Y5Vs+aSqCdfGoTT6XTmvy83ElzfDfViIh1Ae
	IqubYe6d6XxV05DPnLo3+foYmw==
X-Google-Smtp-Source: AGHT+IEWugLVOsvwueuT3N0ZHByMItJT6RJk8Al5V6OyMNsZEaQmEVlIDhgm20mBPhD0NDNhoO7EwA==
X-Received: by 2002:adf:fc4f:0:b0:332:ec48:a132 with SMTP id e15-20020adffc4f000000b00332ec48a132mr6333744wrs.53.1701091750188;
        Mon, 27 Nov 2023 05:29:10 -0800 (PST)
Message-ID: <ba992154-0681-46fe-88a9-3a526fb0ca30@cloud.com>
Date: Mon, 27 Nov 2023 13:29:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/x86: On x2APIC mode, derive LDR from APIC ID
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20231123173057.1325-1-alejandro.vallejo@cloud.com>
 <2fedb7c1-5742-46d7-9882-d2ec336beece@suse.com>
 <71a22900-6167-490f-9d33-fe924bb96c5c@cloud.com>
 <699ef5f9-50c0-4c15-8874-833dda81e251@suse.com>
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <699ef5f9-50c0-4c15-8874-833dda81e251@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2023 12:24, Jan Beulich wrote:
> On 27.11.2023 13:17, Alejandro Vallejo wrote:
>> On 27/11/2023 08:40, Jan Beulich wrote:
>>> On 23.11.2023 18:30, Alejandro Vallejo wrote:
>>>> @@ -1498,27 +1511,36 @@ static int cf_check lapic_save_regs(struct vcpu *v, hvm_domain_context_t *h)
>>>>    */
>>>>   static void lapic_load_fixup(struct vlapic *vlapic)
>>>>   {
>>>> -    uint32_t id = vlapic->loaded.id;
>>>> +    uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>>>>   
>>>> -    if ( vlapic_x2apic_mode(vlapic) && id && vlapic->loaded.ldr == 1 )
>>>> -    {
>>>> +    /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
>>>> +    if ( !vlapic_x2apic_mode(vlapic) ||
>>>> +         (vlapic->loaded.ldr == good_ldr) )
>>>> +        return;
>>>> +
>>>> +    if ( vlapic->loaded.ldr == 1 )
>>>> +       /*
>>>> +        * Xen <= 4.4 may have a bug by which all the APICs configured in
>>>> +        * x2APIC mode got LDR = 1. We can't leave it as-is because it
>>>> +        * assigned the same LDR to every CPU.  We'll fix fix the bug now
>>>> +        * and assign an LDR value consistent with the APIC ID.
>>>> +        */
>>>
>>> Just one comment on top of Andrew's: Is the double "fix" really intended
>>> here? (I could see it might be, but then "fix the bug fix" would read
>>> slightly more smoothly to me as a non-native speaker.)
>>
>> It's not intended indeed. s/fix fix/fix/
>>
>>>
>>> Another aspect here is what exactly the comment states (and does not
>>> state). Original comments made explicit that LDR == 1 contradicts ID == 0.
>>> In the new comment you only emphasize that all CPUs cannot have that same
>>> LDR. But the value of 1 being bogus in the first place doesn't become clear
>>> anymore.
>>
>> 1 is bogus for id!=0, but so would be 3, 7 or 42.
> 
> Yet 3, 7, and 42 aren't interesting in the context of that older bug.
> 
>> In particular we have
>> ID==2 contradicting LDR=2, and we're allowing it. The reason why we must
>> fix this other case is because all LDRs are equal, otherwise it would
>> get the same treatment as the other bug.
> 
> I understand all that; still there's loss of information in the comments,
> from my perspective.
> 
> Jan

v2 did have a "Note that "x2apic_id == 0" has always been correct and
can't be used to discriminate these cases." and another in front of the
early exit "No need to perform fixups in non-x2apic mode, and x2apic_id
== 0 has always been correct.". They were trimmed as versions went on.

As mentioned before this is all cosmetic, so I'm happy either way. I'll
reinstate something to this effect in a v5.

Cheers,
Alejandro

