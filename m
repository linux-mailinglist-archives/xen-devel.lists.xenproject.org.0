Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E479DB705
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 12:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845407.1260829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGd9C-00012S-Pu; Thu, 28 Nov 2024 11:57:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845407.1260829; Thu, 28 Nov 2024 11:57:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGd9C-000101-Mq; Thu, 28 Nov 2024 11:57:26 +0000
Received: by outflank-mailman (input) for mailman id 845407;
 Thu, 28 Nov 2024 11:57:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=53lb=SX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tGd9B-0000zv-8K
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 11:57:25 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ebeb4451-ad7f-11ef-a0cd-8be0dac302b0;
 Thu, 28 Nov 2024 12:57:20 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5cfcb7183deso3201313a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Nov 2024 03:57:20 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa599905defsm58714166b.137.2024.11.28.03.57.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 03:57:19 -0800 (PST)
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
X-Inumbo-ID: ebeb4451-ad7f-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmEiLCJoZWxvIjoibWFpbC1lZDEteDUyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImViZWI0NDUxLWFkN2YtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNzk1MDQwLjM5Mjk0NCwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732795040; x=1733399840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EqmE+nW053InlD43iJvaDRW4jPg+ohSEaaA237Ok2YQ=;
        b=U4375S+xTe9sfGdDtM1hXoWtfR+8DCubus+QLWXAJM2y4fhVUU8ihw0iP+S5DGIafQ
         0lyHZ6Hh9lJCj9FfaxDH5cvfZe7KOUKIbgy4/mI+80CUNyAbaycl8hQS6v9BXx2qjdV1
         tPISEHfK7Wxno3RjC3jUbBmm1UHG3ttHFLkUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732795040; x=1733399840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqmE+nW053InlD43iJvaDRW4jPg+ohSEaaA237Ok2YQ=;
        b=BBhLq5pxbhP0JhB7NPRWQAN1RIDIjZEt1gilun9v3WFOjSVuBwUcZhkM0Ex8pP8Y7o
         IMlxXs/ftQI94K1BsAl+Ff3TRLsyk6gMI9TftOHVR4Eozruss7FAP0yLCoEP+z34qadh
         sw5ose2mRabTB9PEDj7zpiwMqyDeS7i9QJ4YNpwbpoib6EVWL+MU90u4ofgyQoRZTK1u
         KAigHVZRo7Fq6IEaKlEj0wQRhXhEwf2DXTN4hw/MXr/H2iVytU3PDSGqcg6nE4e5/XRS
         otrR1cfpgFpytliI7DTVrljV008hec1MzIxFe0w/La79mg3wZzoiWA4gxBK3Zr9mMp65
         sE3A==
X-Forwarded-Encrypted: i=1; AJvYcCX1lCe9E9FPi/VqPi4FVQiJWf1SjewcBgZBm/QtO9Y5tlzdP+6uM/r27yVHL1prXwe5n7mzY9voJ/w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwoL/DXZm86LDKIJojCBlOXXV1Aop+CkbiMUf60wJWNbfMFcO/I
	E5lp9FbeWu04UtdX1u8FOPQBNzES6HELQY3PMs7LeLwOB8hJqkTIRv55epairdc9fDi6LPTA2MV
	q
X-Gm-Gg: ASbGncvV5unry2F2aEKvhJdcRxYcrcbbbdn+PL7xii78sHB2DwSXsrts5O2SpYmTd5Z
	qEwrPR1aMTK4dFsr0uf/geYEHV+hWLRPyOuzJfN/dmHTcz/yeMR58WTSTxAL3SUN3N4aQ0Ytyfp
	3ayzNAgeGLAh8mvKVs1QTvoaaRBFBemEN6gu469dtbArExreSav5WDLrPH1kvja6OXY+sQufhdT
	FFnzShIzVk5W3WzwIzoxtukXX8DBpoWeV+SXuRD/ur0StFxPHNfgwQQbyMOQ8g=
X-Google-Smtp-Source: AGHT+IE+dQ35oS0zvOrkJ3Z0REIon37rJDyNKRhPPErUEHVu1JQa4TiSkyVBVJ9MRBvrjGtL2lk8Ng==
X-Received: by 2002:a17:906:329b:b0:aa5:c1b:2204 with SMTP id a640c23a62f3a-aa594573455mr315522466b.8.1732795039835;
        Thu, 28 Nov 2024 03:57:19 -0800 (PST)
Message-ID: <e8bf67fb-fc58-42cd-81dd-b11e041e82b2@citrix.com>
Date: Thu, 28 Nov 2024 11:57:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/vlapic: Fix handling of writes to APIC_ESR
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241128004737.283521-1-andrew.cooper3@citrix.com>
 <20241128004737.283521-2-andrew.cooper3@citrix.com>
 <e576e161-5054-40d2-af02-6f32ef636782@suse.com>
 <8a3a3daa-16f6-4488-ae46-224379033c54@citrix.com>
 <b97f13ad-f3d4-4e92-b3e6-5522badbad5b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <b97f13ad-f3d4-4e92-b3e6-5522badbad5b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/11/2024 11:50 am, Jan Beulich wrote:
> On 28.11.2024 12:10, Andrew Cooper wrote:
>> On 28/11/2024 10:31 am, Jan Beulich wrote:
>>> On 28.11.2024 01:47, Andrew Cooper wrote:
>>>> Xen currently presents APIC_ESR to guests as a simple read/write register.
>>>>
>>>> This is incorrect.  The SDM states:
>>>>
>>>>   The ESR is a write/read register. Before attempt to read from the ESR,
>>>>   software should first write to it. (The value written does not affect the
>>>>   values read subsequently; only zero may be written in x2APIC mode.) This
>>>>   write clears any previously logged errors and updates the ESR with any
>>>>   errors detected since the last write to the ESR. This write also rearms the
>>>>   APIC error interrupt triggering mechanism.
>>>>
>>>> Introduce a new pending_esr field in hvm_hw_lapic.  Update vlapic_error() to
>>>> accumulate errors here, and extend vlapic_reg_write() to discard the written
>>>> value, and instead transfer pending_esr into APIC_ESR.  Reads are still as
>>>> before.
>>>>
>>>> Importantly, this means that guests no longer destroys the ESR value it's
>>>> looking for in the LVTERR handler when following the SDM instructions.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> No Fixes: tag presumably because the issue had been there forever?
>> Oh, I forgot to note that.
>>
>> I can't decide between forever, or since the introduction of the ESR
>> support (so Xen 4.5 like XSA-462, and still basically forever).
>>>> ---
>>>> Slightly RFC.  This collides with Alejandro's patch which adds the apic_id
>>>> field to hvm_hw_lapic too.  However, this is a far more obvious backport
>>>> candidate.
>>>>
>>>> lapic_check_hidden() might in principle want to audit this field, but it's not
>>>> clear what to check.  While prior Xen will never have produced it in the
>>>> migration stream, Intel APIC-V will set APIC_ESR_ILLREGA above and beyond what
>>>> Xen will currently emulate.
>>> The ESR really is an 8-bit value (in a 32-bit register), so checking the
>>> upper bits may be necessary.
>> It is now, but it may not be in the future.
>>
>> My concern is that this value is generated by microcode, so we can't
>> audit based on which reserved bits we think prior versions of Xen never set.
>>
>> I don't particularly care about a toolstack deciding to feed ~0 in
>> here.  But, if any bit beyond 7 gets allocated in the future, then
>> auditing the bottom byte would lead to a migration failure of what is in
>> practice a correct value.
> If a bit beyond zero got allocated, then it being set in an incoming stream
> will, for an unaware Xen version, still be illegal. Such a guest simply can't
> be migrated to a Xen version unaware of the bit. Once Xen becomes aware, the
> auditing would (of course) also need adjustment.

That's the whole point.  It's not about Xen's awareness; it's what
APIC-V/AVIC might do *in existing configurations* on future hardware
without taking a VMExit.

If there were no APIC-V support to begin with, this would be easy and
auditing would be limited to SENDILL|RECVILL as those are the only two
bits Xen knows about.

~Andrew

