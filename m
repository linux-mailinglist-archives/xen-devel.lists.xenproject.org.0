Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A98F842857
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jan 2024 16:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673582.1047985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUqKC-0004VX-Cf; Tue, 30 Jan 2024 15:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673582.1047985; Tue, 30 Jan 2024 15:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUqKC-0004Tc-9c; Tue, 30 Jan 2024 15:47:00 +0000
Received: by outflank-mailman (input) for mailman id 673582;
 Tue, 30 Jan 2024 15:46:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5qC=JI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rUqKA-0004TW-R0
 for xen-devel@lists.xenproject.org; Tue, 30 Jan 2024 15:46:58 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb18b0f4-bf86-11ee-98f5-efadbce2ee36;
 Tue, 30 Jan 2024 16:46:55 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40ef6da20feso13427715e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jan 2024 07:46:55 -0800 (PST)
Received: from [10.80.67.30] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n6-20020a05600c500600b0040e3488f16dsm13446984wmr.12.2024.01.30.07.46.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jan 2024 07:46:54 -0800 (PST)
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
X-Inumbo-ID: cb18b0f4-bf86-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706629614; x=1707234414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4jHPpjCElDfwWmewj4NBK7BMEReCe1vgLpl7mZotfY=;
        b=mNVu8oYbuhU1WiBOpNRK88HMeF9PwR2FPrzKUYoo7JMryhURJ3R48WwBB1AZFG0F9F
         Ka/ECokSyc6YGX/GLbksYlajAMo4yMRS2/j21bpZmOarsyj/+3h3rDcG89SREMJbusEI
         x18aidyKoCzv1yI/BCHX5vkaNUB4ufheMIjlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706629614; x=1707234414;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4jHPpjCElDfwWmewj4NBK7BMEReCe1vgLpl7mZotfY=;
        b=B42PlCNm2ePxO0RMuheBM3Bd8NFBX/oF37n9HswYG4yCbG4viUIeXlEDqog74x5aMW
         WiADEhtlzAH2YaSHu59QrYcwJq82gkBhzjnjsAHI2ROWPjGZ+BfaJOww8Qn4er5VMFZP
         nqYp3t5rjsF2Uglq3QUiyGnAnbtNbmsAvYVIWY2hxjnYCgP0K9tOMY1n9OfEoassatyK
         FlorEcQYtTZJ5UutMEJ57K57WdZ7Y9osbA/HwUZD2RO3icQOvJjpL8Sq/HoPPPwXaxJ6
         LjhuvMcwusBeFCx4epURx5x8ZAKRgG+J/UwV/QGpKdtWzRoievu07ll83ErOouISpNS1
         IQhw==
X-Gm-Message-State: AOJu0YwoCanmICDp8ibrvd7extUwoEyNibRJeiSkZGM4t5wwfqPFNkGN
	eXl/E1HrA7o4UKgsHiZqP5P6BjvepvL7Zl2prTLFJ67WANohz1FRD2wx9qAN9DsaeyRNgg8pXyN
	i
X-Google-Smtp-Source: AGHT+IFazJfdusIhCpaaf8e5HYO2Ertsg+9Bj9zUZ2cHtfQFiu/R+ZInGSnKQsIhWMPBOJX/zL96jg==
X-Received: by 2002:a05:600c:4f08:b0:40f:993e:3594 with SMTP id l8-20020a05600c4f0800b0040f993e3594mr1278607wmq.7.1706629614453;
        Tue, 30 Jan 2024 07:46:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWIQL0MmF0IcfNWtas2zBzqOTgPU5xiApF8Eb0YK4WqGhMFDQrPupdGtBBHfYVqCTuAaHPSC51qUJpw5W55IHkLzxZ2JxmaV/mLA6nttM3NRVGg/26VWcnGckLUOHT+/B751/94
Message-ID: <ef0f98b2-f06a-4afc-b338-ef0c7fedcf36@citrix.com>
Date: Tue, 30 Jan 2024 15:46:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86/intel: expose IPRED_CTRL to guests
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240130091400.50622-1-roger.pau@citrix.com>
 <20240130091400.50622-2-roger.pau@citrix.com>
 <3959f556-6177-473e-a052-bec11b5a8a9b@suse.com> <ZbjmS2oLAV7Fyqdn@macbook>
 <0ad880e8-0f2b-4519-971e-c98b3411fba5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <0ad880e8-0f2b-4519-971e-c98b3411fba5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/01/2024 12:59 pm, Jan Beulich wrote:
> On 30.01.2024 13:06, Roger Pau Monné wrote:
>> On Tue, Jan 30, 2024 at 11:57:17AM +0100, Jan Beulich wrote:
>>> On 30.01.2024 10:13, Roger Pau Monne wrote:
>>>> The CPUID feature bit signals the presence of the IPRED_DIS_{U,S} controls in
>>>> SPEC_CTRL MSR.
>>>>
>>>> Note that those controls are not used by the hypervisor.
>>> Despite this, ...
>>>
>>>> --- a/xen/arch/x86/msr.c
>>>> +++ b/xen/arch/x86/msr.c
>>>> @@ -324,6 +324,9 @@ uint64_t msr_spec_ctrl_valid_bits(const struct cpu_policy *cp)
>>>>      return (SPEC_CTRL_IBRS | SPEC_CTRL_STIBP |
>>>>              (ssbd       ? SPEC_CTRL_SSBD       : 0) |
>>>>              (psfd       ? SPEC_CTRL_PSFD       : 0) |
>>>> +            (cp->feat.ipred_ctrl ? (SPEC_CTRL_IPRED_DIS_U |
>>>> +                                    SPEC_CTRL_IPRED_DIS_S)
>>>> +                                 : 0) |
>>>>              0);
>>>>  }
>>> ... if I'm not mistaken exposing SPEC_CTRL bits to guests is independent
>>> of whether we write SPEC_CTRL on entry to Xen. Therefore I think in the
>>> description it wants clarifying why it is acceptable to run Xen with the
>>> guest chosen settings for at least the DIS_S bit (assuming that it is
>>> okay to do so). Likely (didn't look there yet) also applicable to the
>>> further two patches.
>> "The added feature is made dependent on IBRSB, which ensures it will
>> only be exposed if X86_FEATURE_SC_MSR_{PV,HVM} is available, and that
>> ensures the value of SPEC_CTRL will get context switched on exit/entry
>> to guest."
>>
>> Would adding the above to the commit message clarify the intended
>> implementation?
> It would improve things, at least hinting towards there being a connection
> between exposure and updating on entry to Xen. I'd like to ask though to
> avoid "context switch" when talking about entry from guest context. While
> in a way technically correct, our normal meaning of the term is the
> process of switching vCPU-s out/in on a pCPU.

The guests can only see MSR_SPEC_CTRL when Xen knows (and is) context
switching them properly.

The logic is weird for legacy IBRS reasons, but I don't think any
further justification is necessary.

~Andrew

