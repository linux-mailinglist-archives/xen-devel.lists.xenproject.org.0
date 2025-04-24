Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91507A9AC9A
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 13:59:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966236.1356520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7vEN-00013l-3L; Thu, 24 Apr 2025 11:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966236.1356520; Thu, 24 Apr 2025 11:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7vEN-00010d-0S; Thu, 24 Apr 2025 11:59:03 +0000
Received: by outflank-mailman (input) for mailman id 966236;
 Thu, 24 Apr 2025 11:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KF8R=XK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7vEL-00010X-LJ
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 11:59:01 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8288971a-2103-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 13:59:00 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so520579f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 04:59:00 -0700 (PDT)
Received: from [192.168.1.23] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d4a800esm1854426f8f.3.2025.04.24.04.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 04:58:59 -0700 (PDT)
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
X-Inumbo-ID: 8288971a-2103-11f0-9eb2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745495940; x=1746100740; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fj6LGahoTYMxnRXxcI3of6d0hI/muf1rInmz5RlCZRM=;
        b=S7VyVubbhoe9nvuMIlvWcNdESMW72uiXGbz2V4oWWkIB8qrTXemGsbujPTIOrt02pI
         laPuzYun6DU/q8hr6tdXTkumYGFEb/HzSHQve5JQ2gZ1OBQMazMKZNItTzl1c5tpIFkX
         hKzgZuZo6x2U4PMU0Z0ltJL9kS91adl0HniOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745495940; x=1746100740;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fj6LGahoTYMxnRXxcI3of6d0hI/muf1rInmz5RlCZRM=;
        b=AhZzQ82ceBrDqvR1f8yf8hVyfFyrrRpaGIoEMK5aewvUX4UchGKXowVJ4SiJTRdOvb
         K48KR4xDpqwoHObYaQh3qYpQ99uLuPR8wf+5xouFqj0xmQGJsc5/Rji7CKtDQKfcutpT
         GLWgJGNINNjsgfYv9kapktg2O9jUr8mBu4PrwdsyzVVYGguMpitM1Ckc2GWD58UOq6Q4
         r7ptA5hr+V35tPR9MbloGbA9U73QSVN21jpVeH0K4TCmPW2/UyMTsFoH9ndO11HX+wRC
         wC6n6pff+5uMRgIrpvyjgmR1mwNd9OOAeMOlTl6ezJUFrhi06z2whBraPlMGbQBjf8xF
         sciQ==
X-Forwarded-Encrypted: i=1; AJvYcCWE9i1Z4EWqCMWlVnrLwrkfu3zp5IDc3ZmflxWC1uU8lWpYO+VDHpFoAkTXD4KkoUIMl/i3fY011i0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypJt5UYnfZPhhcze3p9Jg5AJathDhZNQ58/Mr5/7ZUqGuhGhJg
	wtkIJ82oV5aScjQF6JxG2hUqSOJZok8769TMfc5nocDjh0AbHn6rYgw9+5bhr67pCWkySDrhT9Q
	p
X-Gm-Gg: ASbGncsRWA0fn97zmBsGpiHw0wo8ixgGuBld6GA70igSguOcDGM/TBE3pKQB3BRqEWX
	1+hINhvbQSMPt/UWirS19KGt6KaMWx3I/lUPsciWybh7bH0IXI9aKUwMoQ9oGRu7nsC0y+rC7NN
	tUqATbbFZJCKMVDk/AcXN6z5syH/cpPDgDtpA2gtq8OquuKmWvK5F3ctHWQNUFsEBcKO0OOZlyE
	Gu2p4U9M5CCTInSk2n4+qssTQlI3wa9jwi9rj7hmVzZuD7PGX1qAOJy2456Igq9/lCm3aT15qPg
	v5wSzBDTgdwAYf2Ig9PddYWlTt4i6Dr6Ek4WXtcSRlVOmN/GlZhDnC/o6sJaBSoUVahtV0I/WO3
	5d9M9
X-Google-Smtp-Source: AGHT+IGraPvbgnvacLxk6PkCswfyv64TKXmePUtaw21/A9m3dRcFnIwG65vOmjP1Ddd6VvB+HKex3w==
X-Received: by 2002:a5d:64a4:0:b0:39f:e37:1733 with SMTP id ffacd0b85a97d-3a06cf52369mr1885352f8f.2.1745495940276;
        Thu, 24 Apr 2025 04:59:00 -0700 (PDT)
Message-ID: <76110aab-d506-4b20-9e28-1ddfd9a059f1@citrix.com>
Date: Thu, 24 Apr 2025 12:58:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] misra: add deviation of Rule 5.5
To: "Lira, Victor M" <VictorM.Lira@amd.com>, xen-devel@lists.xenproject.org
Cc: Federico Serafini <federico.serafini@bugseng.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <9e1210f2a9c794d68dcc6b897239b228b141296a.1745427770.git.victorm.lira@amd.com>
 <48c7830931a98b2bf70ef1509f309b262b9e5792.1745427770.git.victorm.lira@amd.com>
 <d81178fe-82b8-434e-8610-e0ec71df6a28@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d81178fe-82b8-434e-8610-e0ec71df6a28@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/04/2025 7:16 pm, Lira, Victor M wrote:
> Continuing a discussion from before:
>
> On 4/22/2025 11:44 PM, Jan Beulich wrote:
>> Caution: This message originated from an External Source. Use proper
>> caution when opening attachments, clicking links, or responding.
>>
>>
>> On 23.04.2025 01:43, victorm.lira@amd.com wrote:
>>>          memmove.
>>>        - Tagged as `deliberate` for ECLAIR.
>>>
>>> +   * - R5.5
>>> +     - Clashes between function-like macros and function names are
>>> +       deliberate
>> They may or may not be deliberate, depending on context. I don't
>> think it's a
>> good move to deviate this more widely than necessary. If I get the
>> expression
>> above (in deviations.ecl) right, even
>>
>> void func1(int);
>> void func2(int);
>>
>> #define func1() func2(0)
>> #define func2() func1(0)
>>
>> would be deviated, which I don't think we want. Especially when, in a
>> less
>> contrived scenario, the clash may not easily be visible.
> OK, I see the issue for different functions. Does it make sense to say
> it's deliberate when it's the same identifier?
>
>     void func1(int);
>     ...
>     #define func1() func1(0)
>
> Could this be deviated?

The issue here is we've got a load of violations, and different reasoning.

e.g. all the bitops violations are valid and need fixing.  I have a plan
for how to do so, and 0 time.  These are the overwhelming majority of
violations.

pirq_cleanup_check() is horrible.  cpu_has_amd_erraturm is even worse.

In fact, I can't see a single case where the origin code is something we
really want to keep.

I still don't understand the complaint about 'c' as an identifier.

~Andrew

