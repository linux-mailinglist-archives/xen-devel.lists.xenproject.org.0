Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A579BB3DAB
	for <lists+xen-devel@lfdr.de>; Thu, 02 Oct 2025 14:10:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1135753.1472742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4I7k-0007Vm-W6; Thu, 02 Oct 2025 12:09:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1135753.1472742; Thu, 02 Oct 2025 12:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4I7k-0007Sc-T5; Thu, 02 Oct 2025 12:09:28 +0000
Received: by outflank-mailman (input) for mailman id 1135753;
 Thu, 02 Oct 2025 12:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wm6k=4L=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4I7j-0007SP-DA
 for xen-devel@lists.xenproject.org; Thu, 02 Oct 2025 12:09:27 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a3df95f9-9f88-11f0-9d14-b5c5bf9af7f9;
 Thu, 02 Oct 2025 14:09:26 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e47cca387so10146815e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Oct 2025 05:09:26 -0700 (PDT)
Received: from [192.168.1.183] (host-92-22-57-86.as13285.net. [92.22.57.86])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8f01a0sm3408774f8f.48.2025.10.02.05.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Oct 2025 05:09:25 -0700 (PDT)
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
X-Inumbo-ID: a3df95f9-9f88-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759406966; x=1760011766; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ca+Z2DEAM7Y6ezT4gyaN65jx4m6sggDzqgZ3u05cgo4=;
        b=TBj7pt9z7hK3UhTcWyhAK2rXtSAXxWvQqph4xwCIjlkVaYezhVjGQ9W2pJHK8y1XYC
         9+0G5/1Jc6nq5otzkybThIcRap78t69/Xh9phMrS3gAzORV4tHGHULSw+4lHMT0eewXC
         lUP8irRb2KPXIgrPHuXV3bbt8a1FPTbJieK9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759406966; x=1760011766;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ca+Z2DEAM7Y6ezT4gyaN65jx4m6sggDzqgZ3u05cgo4=;
        b=xRMysj6IvYgXTlpn3ZsSWYdZ3Ld1C9Bn3NoA9GJi3RpahhCX1FnfN7z7wJncy/cbt0
         xAeQRoJkzTJi0bSykIOCkH6kf/8ztvb1syr/50Ji3GK2SlzPz+R6f4Acmv8nIoBVLChY
         CdcnWjSQ8i1v+oBDt7b0EZJ48HZTGUcVUtpP+0EkDz7tXg0UJuXWFTL63loBC88Yx28I
         w9ULIpqWzNWdXAgv+cBT7PvR6MynfbutM0ug5gepvE4VkYsiK3aaMLcrE5J5bDwxd+oQ
         Mni9+ZZN2Nbt7ybaC4CvUZ5B01YgRnc2CejjT5v/WwIQsN/LzlKW1nGmHorElyzgF6Ps
         DOaA==
X-Forwarded-Encrypted: i=1; AJvYcCV0Yn027EO3os31n6x4Q2AfgcEdG0AW3PWJHm1FPdIF/P8xW2JHMC1L+MEzNA9QpniOivAAzAQNS6A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyNorjcG11jqqBVO5fMQGZ5h+sPqGEzac51vHrsGQwdYbuMFY6/
	osKgq6r/YPPcX29sbdaZG3i3sPvrdyq6mMHIcWyw7gqw+jdfnrAxGlhkajoNIIfCuBI=
X-Gm-Gg: ASbGncv3Rw/z3Kha/RkPTQbgOMOU+whCr+nkxA5NK4zIG9ePSi5VwzITTAOkHJNZ+t5
	ffdfn78htaVQRABZI4dQr+BgR1hhoNBwmOh/LQdKHrfB0dvJtiIxEcgSzby5oY0f10dTAZPYGrA
	qHNdlvRo7a+aqVE4AswNocZF2pMw3ydnjPKP9pUON2aMC2pToTikwwFoPEryMza0RUynQ7oIzDb
	6INKHw1TIkmF3+QjdQbD/DSqY5pT14TbCzsNicgNR/DogqQIwnxnYHpjvmveW9dFqB83HEr5jkC
	nEfv/twPieW/vtdHMZoNGEWU7sjW30OxfULC13c7ebk0l7s8rVCqBm+Dk7Vu20EHNfh1Qjrx0ki
	NOHg324R9Hm/qDUmyua+rYvzWgjZURAwTBFhKaEEAeNl6HS3Ew4CI5iiN1Esb5Ew6vUpLiv9AmH
	lBpg6pdIVPwMfoGOBnivHhKSM=
X-Google-Smtp-Source: AGHT+IH6NxV+rYpDgPZmDCyw4woLYzmiUlt0Vhoep2ZMeNYOQCrkE0qNW1MjCvfhKBDTrduyn/Zwew==
X-Received: by 2002:a05:600c:3505:b0:46d:5189:3583 with SMTP id 5b1f17b1804b1-46e611e12a7mr57865085e9.0.1759406965646;
        Thu, 02 Oct 2025 05:09:25 -0700 (PDT)
Message-ID: <f855a5bc-4e09-4e48-b6f0-273c39ada551@citrix.com>
Date: Thu, 2 Oct 2025 13:09:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XTF PATCH] x86: Remove Xen as a hard requirement to run XTF.
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250930085412.1643-1-alejandro.garciavallejo@amd.com>
 <97b1a3cc-6e8b-4207-b467-4ab39396482e@citrix.com>
 <DD7RU7OHCZ83.QERYHBDKV7FR@amd.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <DD7RU7OHCZ83.QERYHBDKV7FR@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/10/2025 11:41 am, Alejandro Vallejo wrote:
> On Wed Oct 1, 2025 at 7:10 PM CEST, Andrew Cooper wrote:
>> On 30/09/2025 9:54 am, Alejandro Vallejo wrote:
>>> If Xen isn't detected on CPUID, then:
>>>
>>>  * Skip setting up Xenbus/PV-console/shared_info/hypercalls/qemu-debug.
>>>  * Register COM1 as an output callback.
>>>
>>> This patch enables running XTF on QEMU-TCG/KVM out of the box.
>> When I did a KVM branch for amluto,
>> https://xenbits.xen.org/gitweb/?p=people/andrewcoop/xen-test-framework.git;a=shortlog;h=refs/heads/kvm
>> was what was necessary to get tests to pass.
>>
>> I can see the need for MB1 going away now that KVM uses the PVH
>> entrypoint, but is the rest really unnecessary?
> I do run it, as-is and it works.
>
> Depends what you're after. As-is the commit spins at the end for a lack of the
> code knowing how to turn off QEMU. 0xF4 isn't the default qemu-debug-exit PIO,
> (that'd be 0x501), but I assume that was the intent and you (or someone else)
> got it from the TCG unit tests, that have a non-default PIO.
>
> I didn't include something like that because it relies on the user having set
> up " -device isa-debug-exit" in their QEMU cmdline. Thinking about it, the worst
> case scenario is that the PIO write is ignored, so I'll just go with that.
>
> Also, I'm not sure QEMU implements PIO 0xE9? I've only seen it in Xen. This
> patch writes directly to COM1, and that seems like the better option.

I can't remember exactly where I got that -device isa-debug-exit
invocation from, but it was some example documentation from QEMU itself.

If there's a better way then I'm all ears, but spinning is no use for
non-interactive tasks such as using ./xtf-runner for all tests.

>
>>> diff --git a/arch/x86/setup.c b/arch/x86/setup.c
>>> index 2ac212e..6172c7e 100644
>>> --- a/arch/x86/setup.c
>>> +++ b/arch/x86/setup.c
>>> @@ -243,11 +245,19 @@ static void map_shared_info(void)
>>>          panic("Failed to map shared_info: %d\n", rc);
>>>  }
>>>  
>>> +static void pio_write(uint16_t port, const char *buf, size_t len)
>>> +{
>>> +    asm volatile("rep; outsb" : "+S" (buf), "+c" (len) : "d" (port));
>>> +}
>> I've factored out rep_movsb() in the proper place for library functions,
>> and without the rebasing issue reinserting the erroneous ;.
> You meant rep_outsb(). Too much ERMS is bad for you ;).

Urgh I thought I fixed all of those typos.  Oh well.

>  It's just the commit
> title that's wrong, the patch is still good. So I'll resend with using that
> helper.
>
> I'm a bit triggered by the port being the last argument rather than the first,
> but I'll get over it.

For better or worse, that's how outb() and friends are defined (which
itself is a side effect of AT&T syntax).

~Andrew

