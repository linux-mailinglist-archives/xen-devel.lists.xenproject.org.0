Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB96A55C58
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 01:57:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904447.1312326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqM1m-0007zl-Si; Fri, 07 Mar 2025 00:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904447.1312326; Fri, 07 Mar 2025 00:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqM1m-0007ww-Pt; Fri, 07 Mar 2025 00:57:26 +0000
Received: by outflank-mailman (input) for mailman id 904447;
 Fri, 07 Mar 2025 00:57:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxnO=V2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tqM1l-0007wq-Rk
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 00:57:25 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2154d29b-faef-11ef-9898-31a8f345e629;
 Fri, 07 Mar 2025 01:57:23 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso14622105e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 16:57:23 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912bfb79cfsm3610296f8f.10.2025.03.06.16.57.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Mar 2025 16:57:21 -0800 (PST)
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
X-Inumbo-ID: 2154d29b-faef-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741309043; x=1741913843; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k3kVTeo6hQ3m6R2v6h6cRhZpBdizWREPTz/VbcmNxHI=;
        b=ND0Oq9Z0H0Yz0SfDSJltDvCI8eKT6wO7R84cB9zlMsACp/S8VE3pbRMqUX/iG7i2fC
         eYsMPIqM7sjMkZ6OCikVuanmcpacbH5Tw/MSQmq2GvZgr2NLWvwDjVsgx5L3xzfX/WHy
         HP4XAVcnH/LThAGJNtL0KSBYWgJGuHgiggN2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741309043; x=1741913843;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3kVTeo6hQ3m6R2v6h6cRhZpBdizWREPTz/VbcmNxHI=;
        b=qqsD9X/iGjKar0dgQPUrMPtKokfh1tNQIM5kQ2Fq+XgXAzfus2r1S4cyEryVl7/kvN
         7+uvsUzxeiuI40E2Z16zGVidWA93OSzA5TyGAqvJNI2tgcEY3eSvJcDbR0DDJQQ285uP
         z6F1xX/CZNn9rsQKhq8PhsgrpHXjXcKhSTpvDHcxyQ67MayEAIWJC85jD4OdtAlp2Kv7
         S2H9IgIA3Yr9L1K59/an4GGqH4Vb+WPwIhg3LHD4TFAmmIoasR0Kh5gjXioKXazyTBYl
         vcBCq0bc2wyIQ3vOgMtAJ+TXjtNcRAff+2zWNbPUXPIIN8V0gJ4EGXN4dQNeL4o6fp1Y
         m1jA==
X-Forwarded-Encrypted: i=1; AJvYcCUvq8+U7WmwcVc50hpMJiIl1eVJ49CrH94sVggZF5t+G8vgkrZobP0iSWV8prqJrcpu1gZ2kTDoPCk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxPhPSJEl9RqibQsYOoViZU7Iuy0bx6gVhgU8Q8Lr0sAf45+seE
	m84q51oTmK0YS6lDiiB3T6A4F2I58pVGDz1FCTqQfn5hxpFOmeT1yDjc4Sgkwn8=
X-Gm-Gg: ASbGnctWf4A4HsO7HZWMHtYXHAuQSNhBiF7d+MT/RFF/9TAD84LwxsPi6R3QLR7b6Ui
	79d0vo55y1vUeGBVTA5mLoSYhKfpJZBj3Sw73DJmuysQvij2f11mDQxchpr03IKzWjXAS8fDCMb
	ePO7rFhcFbYkXXtwPcERfONkMvIFAyrYe7lCtba6IMMnr4pr+mm9Pa57zN1fphWMlN8eHTgT1oe
	aDR1CuZZrrXWnFzp2n6er5RvoK3T/d58b6ONGXmPAHyerhNHorP7DPJF0HC9ot+LpMIhPNA3bQi
	SIbbdsphKVrOIXNccOMGdZTcUzIrHQsIPYhldxWbsTbopxRihv8sxIsuneriDkftNvuYKLKzKqI
	l4Z8OPr0m
X-Google-Smtp-Source: AGHT+IFxyvTXnHduGBEnpxq5+0hN0V+Vr4WYJoM9O9QSDwVmO0QsElc+pSmsj1evWa2Olk7K+2GvMg==
X-Received: by 2002:a05:600c:3b1e:b0:439:9ee1:86bf with SMTP id 5b1f17b1804b1-43c5c98089bmr13949555e9.7.1741309043028;
        Thu, 06 Mar 2025 16:57:23 -0800 (PST)
Message-ID: <b5c45592-e33e-43fd-a3e9-ac691b60135a@citrix.com>
Date: Fri, 7 Mar 2025 00:57:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250303185352.86499-1-andrew.cooper3@citrix.com>
 <20250303185352.86499-2-andrew.cooper3@citrix.com>
 <042807a0-77cc-4e16-a949-116bb7cd8c94@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <042807a0-77cc-4e16-a949-116bb7cd8c94@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/03/2025 1:49 pm, Jan Beulich wrote:
> On 03.03.2025 19:53, Andrew Cooper wrote:
>> Xen currently presents APIC_ESR to guests as a simple read/write register.
>>
>> This is incorrect.  The SDM states:
>>
>>   The ESR is a write/read register. Before attempt to read from the ESR,
>>   software should first write to it. (The value written does not affect the
>>   values read subsequently; only zero may be written in x2APIC mode.) This
>>   write clears any previously logged errors and updates the ESR with any
>>   errors detected since the last write to the ESR.
>>
>> Introduce a new pending_esr field in hvm_hw_lapic.
>>
>> Update vlapic_error() to accumulate errors here, and extend vlapic_reg_write()
>> to discard the written value and transfer pending_esr into APIC_ESR.  Reads
>> are still as before.
>>
>> Importantly, this means that guests no longer destroys the ESR value it's
>> looking for in the LVTERR handler when following the SDM instructions.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> I guess there's no good Fixes: candidate?

Not that I could find.  5f32d186a8b introduced vlapic_error(), and
therefore delivery of LVTERR to guests, but the (mis)behaviour of the
APIC_ESR register goes back further.

d1bd157fbc9b "Big merge the HVM full-virtualisation abstractions" 19
years ago had a far more buggy behaviour (counted writes, and only
returned data on half the reads).

The read side (of this far more broken behaviour) was broken by
50b3cef2eecb ("[HVM] Place all APIC registers into one page in native
format.") and restored by 69f646a61b1b ("[HVM] Fix some IOAPIC and LAPIC
device model bugs").

The far more broken behaviour was dropped by f7c8af3a6476 ("[XEN] HVM:
Clean up and simplify vlapic device-model code.") in 3.0.4, leaving the
behaviour we've had until today.

~Andrew

