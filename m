Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D2A10AFF
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 16:38:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871492.1282483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXizX-0000sc-4O; Tue, 14 Jan 2025 15:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871492.1282483; Tue, 14 Jan 2025 15:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXizX-0000q0-1n; Tue, 14 Jan 2025 15:38:07 +0000
Received: by outflank-mailman (input) for mailman id 871492;
 Tue, 14 Jan 2025 15:38:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wcbX=UG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tXizV-0000pu-LX
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 15:38:05 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b024ff0-d28d-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 16:38:03 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso54242061fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 07:38:03 -0800 (PST)
Received: from [192.168.219.191] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1ec5f1sm18095691fa.114.2025.01.14.07.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 07:38:02 -0800 (PST)
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
X-Inumbo-ID: 8b024ff0-d28d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736869083; x=1737473883; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4b34nAxZ7CFnodXRCrt9g3A/ALUH9rexvcutaqZqTM=;
        b=HuN4yiLQTFpLQdh5yC6zRtMQY63zBydRT7e4FO4WmW29w5D5tEFuENhlDFaEXONL25
         P6lCJYwLEHPl0zYYU400Obw5z0d/l5cE6iPKKjS0nJcLKSZpAFSGlg/3fhfX+FNEi4Bb
         BmA0CEJCpzWZWK8sDqcrgF+9G3fyUZ+mlcllEFu0KWWZK6yQ1RZ4Tb1ZRG/Sq/IYd/u4
         2m+VK+xPPshj6yWQEFGlfoA8ZVeeDQGSCe/uTbqSPiNYcx1lO6cenYGNoHdTsAU67Xk/
         4V5/15fEbC6AnoSbARVQjwzQBnBRBKHROGDeXHb7QHyJjNCfX9dCnHAZ9BCAYDnxVn25
         wRxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736869083; x=1737473883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4b34nAxZ7CFnodXRCrt9g3A/ALUH9rexvcutaqZqTM=;
        b=ftTtuuZgLJAHKAgQ6UFLRuOOk0TaNyAxWOqSwoNpp4Ku1cdwEO7c+aqwTG7GeVJxhH
         MsKbg3xWuJBsGw+C0eQY4vU8IwDMJJyr1irS/MTSx6fjrAx+2OfvHNjjCwAsTDtXKH5O
         AhaDCh36fDrSfOCAH2ECvP1Kd2O+tX74xac+qt7B44UlpdixdYOdYYhVb3TvTtA1WUpg
         5+a27VNBf3T/aGNfUCcfrQhHsQCi4YJoQMzniGcJPbVHippeAwT/At6WLBBTYyfSGMuc
         ysXkLjw6aEC8hV7sWSGVIYCRBBdHo87xO27rkTsuuMfIGYMKtXFmLP81JFfQ5/mrccMF
         ChSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAlugDFZ2fKry+tlgPLorBeMEQae6TOAsIPC0C53ZrmsNWgIQtqUChk068JgiqGWmsHwz53sRoYBI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTCl443/afqNgLbVcWLclFFb0X9UEhcXJE+x2HcXuRpYa5B12T
	ENp0KGqHrsT1wIrT0V/B7kP41wQsk/xpGYWPTvkXHZ5hv1WHwpgz
X-Gm-Gg: ASbGncu0vDsSX2gM8WZFSqFyQe6KxXUZOqq//T0x0sMRKwHQH33hL0re/zrKWl8vImQ
	SSJQAjkkQ+ERETMj2KK1A01dr8IWx9+UkR1de9NbmQaaYOnGsnB7FfQvFnE5S+5heLHVznQ+f1Y
	ybfIZPovzkJAJTUY+BN1E7MJ93op4Sklr2QsHdA10Wy1SkwlZVO9QC588kVmCpT9h3tE8fjTHQh
	oXZy85daFPS6S1LkXKR7Jyd4tRDcbE3kvFjp+g1bIcfChOKGvkoUQ+Eecu8AOnIdStU8w==
X-Google-Smtp-Source: AGHT+IGdowyEZWIdX6u1oX4/ugzTZwG6SnWifIv9qoxq5GLrBjjUjBEkpRf1y0F+sf/eZhKFB91VcQ==
X-Received: by 2002:a05:651c:1a0c:b0:302:1cdd:73c6 with SMTP id 38308e7fff4ca-305f456851fmr82909581fa.20.1736869082748;
        Tue, 14 Jan 2025 07:38:02 -0800 (PST)
Message-ID: <3822fa19-5b28-44a7-a3ef-af13aca34830@gmail.com>
Date: Tue, 14 Jan 2025 16:38:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com> <Z4U6WxtmaqGkqOqe@mail-itl>
 <Z4VS88REbzn5uasy@macbook.local>
 <49a2404f-0c45-4397-9094-a4189131832f@gmail.com>
 <Z4ZKINmJXw5T2dsM@macbook.local>
 <78e09ccb-65b7-4022-b9fc-7874e34c1a99@gmail.com>
 <9288f0de-945f-4056-9934-16b2b1704fb1@gmail.com>
 <Z4ZU_uvCe5lu0aMv@macbook.local>
 <481e1955-783a-48d0-8604-ec8554f50fc5@gmail.com>
 <Z4Z7njl5RBznoaxM@macbook.local>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <Z4Z7njl5RBznoaxM@macbook.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/14/25 3:58 PM, Roger Pau Monné wrote:
> On Tue, Jan 14, 2025 at 03:23:21PM +0100, Oleksii Kurochko wrote:
>> On 1/14/25 1:13 PM, Roger Pau Monné wrote:
>>> On Tue, Jan 14, 2025 at 12:44:39PM +0100, Oleksii Kurochko wrote:
>>>> On 1/14/25 12:40 PM, Oleksii Kurochko wrote:
>>>>> On 1/14/25 12:27 PM, Roger Pau Monné wrote:
>>>>>> On Tue, Jan 14, 2025 at 12:12:03PM +0100, Oleksii Kurochko wrote:
>>>>>>> On 1/13/25 6:52 PM, Roger Pau Monné wrote:
>>>>>>>> On Mon, Jan 13, 2025 at 05:07:55PM +0100, Marek Marczykowski-Górecki wrote:
>>>>>>>>> On Fri, Sep 13, 2024 at 09:59:06AM +0200, Roger Pau Monne wrote:
>>>>>>>>>> Allow setting the used wallclock from the command line.  When the option is set
>>>>>>>>>> to a value different than `auto` the probing is bypassed and the selected
>>>>>>>>>> implementation is used (as long as it's available).
>>>>>>>>>>
>>>>>>>>>> The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
>>>>>>>>>> supported built-in) or from UEFI firmware respectively.
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Roger Pau Monné<roger.pau@citrix.com>
>>>>>>>>> Reviewed-by: Marek Marczykowski-Górecki<marmarek@invisiblethingslab.com>
>>>>>>>> Thanks for the review.
>>>>>>>>
>>>>>>>> Oleksii, can I get your opinion as Release Manager about whether this
>>>>>>>> (and the following patch) would be suitable for committing to staging
>>>>>>>> given the current release state?
>>>>>>>>
>>>>>>>> It's a workaround for broken EFI implementations that many downstreams
>>>>>>>> carry on their patch queue.
>>>>>>> Based on your commit message, I understand this as addressing a bug ( but not very critical
>>>>>>> as IIUC downstreams have the similar patch on their side ). Therefore, if it has been properly
>>>>>>> reviewed and tested, we should consider including it in the current release.
>>>>>> IIRC at least Qubes, XenServer and XCP-ng have a patch that achieves
>>>>>> the same behavior as proposed here.
>>>>>>
>>>>>>> IIUC, setting the wallclock to EFI should align with the behavior Xen had previously.
>>>>>>> It might be preferable to use that argument as the default for a while, allowing others to verify the "auto"
>>>>>>> value over time. After that, we could consider making "auto" the default.
>>>>>>> That said, I am not particularly strict about following this approach.
>>>>>> We cannot really set efi as the default, as it would break when
>>>>>> booting on legacy BIOS systems.
>>>>>>
>>>>>> We could take only patch 1 and leave patch 2 after Xen 4.20 has
>>>>>> branched, but at that point I would see little benefit in having just
>>>>>> patch 1.
>>>>> I don't see a lot of benefit of comitting only the one patch either.
>>>>>
>>>>>
>>>>>> I don't have a strong opinion, but downstreams have been complaining
>>>>>> about Xen behavior regarding the usage of EFI_GET_TIME, so it might be
>>>>>> good to not ship yet another release with such allegedly broken
>>>>>> behavior.
>>>>> Agree with that. As  I mentioned above I consider it as a bug and based on
>>>>> that several mentioned above downstreams have the similar patch I could consider
>>>>> that as tested approach so ..
>>>>>> Let me know what you think, as I would need a formal Release-Ack if
>>>>>> this is to be committed.
>>>>> ... R-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>.
>>>> Sorry for the noise.
>>>>
>>>> I missed to add that it would also be nice to mention IMO ( that now we have wallclock parameter )
>>>> in CHANGELOG so downstreams will receive "notification" that Xen provides a workaround for the mentioned
>>>> issue in the patch series.
>>> Indeed.  Would you be OK with adding the following chunk to patch 2?
>>>
>>> diff --git a/CHANGELOG.md b/CHANGELOG.md
>>> index 8507e6556a56..1de1d1eca17f 100644
>>> --- a/CHANGELOG.md
>>> +++ b/CHANGELOG.md
>>> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>       leaving this to the guest kernel to do in guest context.
>>>     - On x86:
>>>       - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
>>> +   - Prefer CMOS over EFI_GET_TIME as time source.
>>>       - Switched the xAPIC flat driver to use physical destination mode for external
>>>         interrupts instead of logical destination mode.
>>> @@ -24,6 +25,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>       - Support for LLC (Last Level Cache) coloring.
>>>     - On x86:
>>>       - xl suspend/resume subcommands.
>>> +   - `wallclock` command line option to select time source.
>> What about of adding word 'Add' before `wallclock`?
> It's in the "Added" section, so I thought it would be redundant.
>
>> Other LGTM: Acked-By: Oleksii Kurochko<oleksii.kurochko@gmail.com>
> Let me know if you would still like me to prepend "Add" to the above
> item.

Oh, then it makes sense. We can go without "Add" then.


~ Oleksii

>
> Thanks, Roger.

