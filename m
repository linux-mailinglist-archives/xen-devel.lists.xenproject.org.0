Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848FDD20017
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jan 2026 16:59:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203413.1518623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3HA-0004BC-8Z; Wed, 14 Jan 2026 15:59:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203413.1518623; Wed, 14 Jan 2026 15:59:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vg3HA-00049V-5I; Wed, 14 Jan 2026 15:59:16 +0000
Received: by outflank-mailman (input) for mailman id 1203413;
 Wed, 14 Jan 2026 15:59:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=16zh=7T=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vg3H9-00049P-9W
 for xen-devel@lists.xenproject.org; Wed, 14 Jan 2026 15:59:15 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8e9e92c-f161-11f0-b15e-2bf370ae4941;
 Wed, 14 Jan 2026 16:59:14 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-64b9230f564so12180845a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jan 2026 07:59:14 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a4d1c61sm2469987666b.35.2026.01.14.07.59.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 07:59:12 -0800 (PST)
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
X-Inumbo-ID: f8e9e92c-f161-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768406353; x=1769011153; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qKbThPh0tf72AZBKPTHvdSbHsKetHCjfioS2zydJe/k=;
        b=a7IDoZ6kD95ehFMLUTlKaQSlsu447n8T4uuN8CkHWAacm+xZId6Xt0ytymZK1Ob80t
         ZssPiGIEftNKL0bbyr3mscpvw4eJxOjAs0pZGlBk3cx/cACIA13eoxv6N2AjnFfDozj1
         SqC4uKB/iUqAzPzV1TQzpZh3/vB7mI3UwLROQOAGEokrA5xnJ3bRSZFcd2/KAscvWygK
         NhxvL3K0N5EwEiX9K7GaxLf2JqpEwaalk39m2Ush50uRIx3C0eUKoloVLJtF9PDFuESX
         XjVFsiVmO7C0qwV1sYwvz0cqsqxvjSt6bPZf2PkH5ilL4N06u6N+EEzKsKb0L279PrnJ
         mvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406353; x=1769011153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKbThPh0tf72AZBKPTHvdSbHsKetHCjfioS2zydJe/k=;
        b=Y87rdoFiFd2Lj+eS3WpAQX17et5i41l00FlLcdoWFGsNk3UF1ueaMau6mTDYHuoOoM
         Of4jBwkxsrw0OnXQUbklj/gUC0vSYDpif70V7x6Gid/PSQFqaGQCvE5agioOVU1+dbRS
         9XXrEw+nwzlKGg6PWHmLnmQFH0XftxtLwZcdAQN931Wq3eULlIwuLV53Lk9EVH+A1qsU
         fF0epIPn1Ny7+ldgWbL46dgWzKXGiQRMShRRt+d2rR8MTjGWgUrhVWmjDpGalIAIfcAP
         JdRKzNEIo79JHuJd43II363EGIooYfTlvVWRN1Dt4aR26Zt52ZnSNk3VlCeysVac/AVs
         e6Nw==
X-Forwarded-Encrypted: i=1; AJvYcCWqbZf63Grnjq6Mls7Kk8n8lsZu7WENWCdXOVT2VegAxAweUWfbwXH01bksIIveQDlHhmyKD8bK0WA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzUcd1fc7dYddonTLdzhrSPRbnXMrw5oP7KM5vkzF5QW1VLP2q9
	MAcp+uH7ML9TMk2pNQTuas54a/yklo629vsE8ZhsgJbsa94MQHs2cNsN
X-Gm-Gg: AY/fxX4xeiSECI+Cu2YrZW3ApwD9ig66AzsiPR4mzl9/P5eer3PqSLmz6Mm+WgdCmGy
	6XXpvrRvWy4uHVaGXGZ7Ap0yyObkr1QrPJwphjQD8uYWao1i515Prs/UOQp9PZMk3CzJqoRIVTb
	TKbxVcYQ5YNl9+hm7vWkWvKS0eAfZx0LL5aVfxX+2jGm7GGwJFUJ2BeQXjB4HXgkTEEQRDX7LE7
	P4vX3/cGrlFgppkUwgMYNAt6pfhrHgUqHWl4MR3t8lT4hh/IHlTuJqq6RmQMqttgbTrziEeny4p
	LDK1ktPsj7DJKMtfbSL2c8TbS5phogvAPfPEwFwC9TeRN76sAiiuWxbZVutmRdQ+dISOh96B5Cc
	gQK6qkinBUc+R5SHUeQ0wjKX7ZEINmA8WhM9zs6FU9S5EkJAH3+sERonIm4Va+GtTg5e96vl0Ky
	Ji3HQyEjO8VG79cwaSEWFpiQJMMqrR+LjvcPgH3zRdC9vzUmj9JPPpQ8UkBAxdrXU=
X-Received: by 2002:a17:907:6e8c:b0:b70:ac7a:2a93 with SMTP id a640c23a62f3a-b87612dbe47mr269653566b.43.1768406353205;
        Wed, 14 Jan 2026 07:59:13 -0800 (PST)
Message-ID: <5c6eff93-0db7-4382-8365-6b32b17f5f4d@gmail.com>
Date: Wed, 14 Jan 2026 16:59:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/15] xen/riscv: introduce vtimer_set_timer() and
 vtimer_expired()
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <8cd3efa488b3da2a6751c92d20bbfeb87b3ba39a.1766595589.git.oleksii.kurochko@gmail.com>
 <f8808dd1-d571-49ea-8739-ed06dd6c79d1@suse.com>
 <4e18e4fc-de62-44fc-8ea0-517f6c7ef47f@gmail.com>
 <f7a47af4-6523-4d92-9beb-0daf639f2f36@suse.com>
 <b0131e35-3c1b-4e42-9f80-07d246a5df69@gmail.com>
 <62c22b34-cbad-40f2-a367-ba5fd8d11b51@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <62c22b34-cbad-40f2-a367-ba5fd8d11b51@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/14/26 3:57 PM, Jan Beulich wrote:
> On 14.01.2026 13:27, Oleksii Kurochko wrote:
>> On 1/13/26 4:12 PM, Jan Beulich wrote:
>>> On 13.01.2026 15:44, Oleksii Kurochko wrote:
>>>> On 1/8/26 11:28 AM, Jan Beulich wrote:
>>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>>> +    {
>>>>>> +        stop_timer(&t->timer);
>>>>>> +
>>>>>> +        return;
>>>>>> +    }
>>>>>> +
>>>>>> +    set_timer(&t->timer, expires);
>>>>> See the handling of VCPUOP_set_singleshot_timer for what you may want to
>>>>> do if the expiry asked for is (perhaps just very slightly) into the past.
>>>> I got an idea why we want to check if "expires" already expired, but ...
>>>>
>>>>> There you'll also find a use of migrate_timer(), which you will want to
>>>>> at least consider using here as well.
>>>> ... I don't get why we want to migrate timer before set_timer() here.
>>>> Could you please explain that?
>>> Didn't I see you use migrate_timer() in other patches (making me assume
>>> you understand)? Having the timer tied to the pCPU where the vCPU runs
>>> means the signalling to that vCPU will (commonly) be cheaper.
>> I thought that migrate_timer() is needed only when a vCPU changes the pCPU
>> it is running on to ensure that it is running on correct pCPU after migrations,
>> hotplug events, or scheduling changes. That is why I placed it in
>> vtimer_restore(), as there is no guarantee that the vCPU will run on the
>> same pCPU it was running on previously.
>>
>> So that is why ...
>>
>>> Whether
>>> that actually matters depends on what vtimer_expired() will eventually
>>> contain. Hence why I said "consider using".
>> ... I didn't get why I might need vtimer_expired() in vtimer_set_timer()
>> before set_timer().
>>
>> vtimer_expired() will only notify the vCPU that a timer interrupt has
>> occurred by setting bit in irqs_pending bitmap which then will be synced
>> with vcpu->hvip, but I still do not understand whether migrate_timer()
>> is needed before calling set_timer() here.
> Just to repeat - it's not needed. It may be wanted.
>
>> Considering that vtimer_set_timer() is called from the vCPU while it is
>> running on the current pCPU, and assuming no pCPU rescheduling has
>> occurred for this vCPU, we are already on the correct pCPU.
>> If pCPU rescheduling for the vCPU did occur, then migrate_timer() would
>> have been called in context_switch(),
> Even if the timer wasn't active?

Yes, migrate_timer() is called unconditionally in vtimer_restore() called
from context_switch(). migrate_timer() will activate the timer.

~ Oleksii

>> and at the point where
>> vtimer_set_timer() is invoked, we would already be running on the
>> correct pCPU.
>>
>> ~ Oleksii
>>

