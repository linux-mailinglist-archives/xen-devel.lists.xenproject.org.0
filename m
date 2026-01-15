Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA47D239B5
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 10:37:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1204543.1519201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJnE-0003y3-Vc; Thu, 15 Jan 2026 09:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1204543.1519201; Thu, 15 Jan 2026 09:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgJnE-0003vp-Rc; Thu, 15 Jan 2026 09:37:28 +0000
Received: by outflank-mailman (input) for mailman id 1204543;
 Thu, 15 Jan 2026 09:37:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ba0k=7U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vgJgT-0007JZ-VF
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 09:30:29 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d49c5a28-f1f4-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 10:30:29 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-6505cac9879so1079101a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 15 Jan 2026 01:30:29 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-67-101.play-internet.pl.
 [109.243.67.101]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b876b6865desm369905966b.12.2026.01.15.01.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jan 2026 01:30:27 -0800 (PST)
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
X-Inumbo-ID: d49c5a28-f1f4-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768469428; x=1769074228; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T7lH+Zu9fWG8FmlF6j1ldxjuSpIosPg1695HWnwC8qg=;
        b=NaaTHTgiRKgY6EA9HxbTDNfAgIR6hHtWLmLyv0lRz6tRJJypHausRf+jq50fVZ7gHA
         P9xWXpLlEHfrc/G5Sinzp6GrqukiSpPvuJzjtt1cxDRYn5094/Xhc/Dd8hE5pTBHfATC
         /E0ueVWpcINxs4erHSpAjz1jv007He1+UwbRZsQVA5y1TEnG47YhSkQ4iUIsZcr5MEpu
         4+ghVdVeLYj6FKoEE4hvvegr3G/maNGNui++b0RHtl4MHJ7yw3BrUtjUD1wsJ94Ozk5h
         Sd9MJcrXUWxjSjkWgLrAoAvczgU7ok4QJNSfxEyfK5my3nybWHD7hBO1cg2DRVwVlfkv
         XQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768469428; x=1769074228;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7lH+Zu9fWG8FmlF6j1ldxjuSpIosPg1695HWnwC8qg=;
        b=f2WuwoaR3PStnc+PPGL0Ki5T2yMvP5O1SiBXJ3Dh4sf5lDipasxjW21Adr3TKppJAY
         +FwwfMvKHd6vg5mLZZn+vk4DnA4mL+TQm7yPQfjnkNtqcH9vNBTzZfzLUFme5mCjIzzi
         yViQ7rakaCmgz7kaQm+YBunMlBeASRsbevM+l0tbPiLAaJ+vT9wSW79Hu/zwFfHUEA8N
         v2whenZtNOsWFGYsDeTxvYPlNt3B+BiRTcKlc/1zseH/7O3HPNTwMG+QEhJlsgosODcT
         vpSTQ20DMAT7ylrgadwtoidCNsK6i/ZZSRnQkJNNvLEy3YZhvuMhLoQ0gcqzXAl60F66
         3b6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUabwvkavFN50YKOtACGaMagH6GFswf1pWPfaRYPr6a4UdMuZjFbW313wH66Q+6pASa6RI+98Iz8AI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoJefSnwbrzn1ydTDFMVXwGaT0BlMRSQ7o3JMKEyPzNaqhtRJ3
	MyjrgoybMfiZYdvLN3UaEBENgdlUU291n7/dcBQ6EX4CN3RGZoCduIbL
X-Gm-Gg: AY/fxX4tLDtpzuzvGd7RS6sToJrJHKASotxwp+M1OydxjvtlmiZU3B9OFvdso7/+H7X
	O4ih+u+wQQjGJlGqmPAZ4mQV+aM7Uak+WyDiXhXJmR/FFkDgY5QqFNwI5dIiwWxPPv/lH7TlV+M
	6/97W98hjW4b3BeDDRBWZu6SfDVy64cH5HZX1E80NdxN66Bzeovfi9svYWqTN/lzk1tBUeyflRq
	3lRKoDCqcP4L8+XxC3YrNEdyaGu1WrBq78Q17TZwfSy3BU7/zXGdbSHNEphcHvIdN45aMDlIqat
	Dr2m0uIybokDw711z0Ikd77fXP/HMn2FI3OxLIz8EXWaC0Pg0efg5ApJO68IwXPSG92Nu5smdaj
	iVxeLMdL4+hXcuvN0erS1AjYROpTA8fEp1PHPrCO8nIazcPjmY6vyMO5z1RVEB/7Pg5bYc5ZdCP
	49Op+EY6DXnluT5MpdzLmEYEB44Qt5I9yagtLhuPE98P/TqCQortxSqEPbZY/lyCM=
X-Received: by 2002:a17:907:6d27:b0:b83:3716:cd52 with SMTP id a640c23a62f3a-b87676a6a4bmr421703266b.24.1768469428162;
        Thu, 15 Jan 2026 01:30:28 -0800 (PST)
Message-ID: <477dfa23-7b64-4e2b-9896-9af389e33ceb@gmail.com>
Date: Thu, 15 Jan 2026 10:30:26 +0100
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
 <5c6eff93-0db7-4382-8365-6b32b17f5f4d@gmail.com>
 <8fa84e68-72b6-4578-9c3b-70d85d268c53@suse.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <8fa84e68-72b6-4578-9c3b-70d85d268c53@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/15/26 8:52 AM, Jan Beulich wrote:
> On 14.01.2026 16:59, Oleksii Kurochko wrote:
>> On 1/14/26 3:57 PM, Jan Beulich wrote:
>>> On 14.01.2026 13:27, Oleksii Kurochko wrote:
>>>> On 1/13/26 4:12 PM, Jan Beulich wrote:
>>>>> On 13.01.2026 15:44, Oleksii Kurochko wrote:
>>>>>> On 1/8/26 11:28 AM, Jan Beulich wrote:
>>>>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>>>>> +    {
>>>>>>>> +        stop_timer(&t->timer);
>>>>>>>> +
>>>>>>>> +        return;
>>>>>>>> +    }
>>>>>>>> +
>>>>>>>> +    set_timer(&t->timer, expires);
>>>>>>> See the handling of VCPUOP_set_singleshot_timer for what you may want to
>>>>>>> do if the expiry asked for is (perhaps just very slightly) into the past.
>>>>>> I got an idea why we want to check if "expires" already expired, but ...
>>>>>>
>>>>>>> There you'll also find a use of migrate_timer(), which you will want to
>>>>>>> at least consider using here as well.
>>>>>> ... I don't get why we want to migrate timer before set_timer() here.
>>>>>> Could you please explain that?
>>>>> Didn't I see you use migrate_timer() in other patches (making me assume
>>>>> you understand)? Having the timer tied to the pCPU where the vCPU runs
>>>>> means the signalling to that vCPU will (commonly) be cheaper.
>>>> I thought that migrate_timer() is needed only when a vCPU changes the pCPU
>>>> it is running on to ensure that it is running on correct pCPU after migrations,
>>>> hotplug events, or scheduling changes. That is why I placed it in
>>>> vtimer_restore(), as there is no guarantee that the vCPU will run on the
>>>> same pCPU it was running on previously.
>>>>
>>>> So that is why ...
>>>>
>>>>> Whether
>>>>> that actually matters depends on what vtimer_expired() will eventually
>>>>> contain. Hence why I said "consider using".
>>>> ... I didn't get why I might need vtimer_expired() in vtimer_set_timer()
>>>> before set_timer().
>>>>
>>>> vtimer_expired() will only notify the vCPU that a timer interrupt has
>>>> occurred by setting bit in irqs_pending bitmap which then will be synced
>>>> with vcpu->hvip, but I still do not understand whether migrate_timer()
>>>> is needed before calling set_timer() here.
>>> Just to repeat - it's not needed. It may be wanted.
>>>
>>>> Considering that vtimer_set_timer() is called from the vCPU while it is
>>>> running on the current pCPU, and assuming no pCPU rescheduling has
>>>> occurred for this vCPU, we are already on the correct pCPU.
>>>> If pCPU rescheduling for the vCPU did occur, then migrate_timer() would
>>>> have been called in context_switch(),
>>> Even if the timer wasn't active?
>> Yes, migrate_timer() is called unconditionally in vtimer_restore() called
>> from context_switch(). migrate_timer() will activate the timer.
> Which is wrong?

I don't know, based on the comment above migrate_timer():
   /* Migrate a timer to a different CPU. The timer may be currently active. */

it doesn't mention that it shouldn't be called if the timer wasn't active.
All around other cases where migrate_timer() is used I don't see also that
anyone checks if a timer is active or not.

~ Oleksii


