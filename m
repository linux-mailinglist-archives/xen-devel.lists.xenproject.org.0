Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22B22AB146
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 07:31:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21976.48312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc0gn-0008Sv-9V; Mon, 09 Nov 2020 06:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21976.48312; Mon, 09 Nov 2020 06:30:05 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kc0gn-0008QU-5y; Mon, 09 Nov 2020 06:30:05 +0000
Received: by outflank-mailman (input) for mailman id 21976;
 Mon, 09 Nov 2020 06:30:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1kc0gl-00086Y-2W
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 06:30:03 +0000
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef9ecb37-433d-409f-bd3e-b1ec8123681e;
 Mon, 09 Nov 2020 06:30:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s9so7155568ljo.11
 for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2020 22:30:01 -0800 (PST)
Received: from [192.168.10.4] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id h4sm1309826lfk.224.2020.11.08.22.29.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Nov 2020 22:29:59 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zl3J=EP=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
	id 1kc0gl-00086Y-2W
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 06:30:03 +0000
X-Inumbo-ID: ef9ecb37-433d-409f-bd3e-b1ec8123681e
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ef9ecb37-433d-409f-bd3e-b1ec8123681e;
	Mon, 09 Nov 2020 06:30:01 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s9so7155568ljo.11
        for <xen-devel@lists.xenproject.org>; Sun, 08 Nov 2020 22:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=VN7Jb3b91smoFXeJ7S6Fdaa2uIjAS9heaklmLDe7SnU=;
        b=S6hl7gvs67pY0aLiXZSMpQXLYhcfWb2l3S/9khGCTPqDejLWYLPfEKKfW3zpJ2+73u
         HC3ItfgIOLETc1qu+C3Se3pOOi0mkY0e8HvwvyKp4QK0gFR1Q/NoNjIbrcEok2AqBQ05
         EQgRj/yHbvMSJnVY9Cb2NAN1zQByh9EKlQoYyWQS2CRIeMuvckpzutC2oTF8UfvGW8IY
         ce4x708e28tANaIgHHY2jS3A5hcp9r0QbkKyHfFqzE4xwy4F0nhaYYLyiSEw/mRQjggh
         ozHH4chhF79TByQwQd3FI3dMZydjgg5aYBPHfC5zSQlKp/FjtV6vmsEfn+ledVCH3C6g
         6pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VN7Jb3b91smoFXeJ7S6Fdaa2uIjAS9heaklmLDe7SnU=;
        b=MWq4B2W2zR8Lho/KOTqljg4yW0+r6VLqOtETcTiv5SaLZNOQ3xLrPhj7oWYOuZft0L
         TqGbqxwzKJe2jHADM4e1+5a0P9xKqLs4OI/db0RHIVBh6OXghHtfTAiZ0blanSGX7w5q
         t5WOPviPD0k2/e9EUyH2WkLe0fCxOyGqth2TM7e6Yi8KKeV8GpZb3CmEeQpn2ExQZpe6
         t2wGn+wmPeeLicfjR1t/7Uk23T8Tr5MgBFozuhq3eJ/Iy4Zyi/uQ70v0gUHHC+SBC0ry
         updTAgosiZuS8+sD35IYPetA6BMgZFBGLvtmhoCXy3TRZpO6SyuZnNEK0FWw39DYU+ck
         gg9Q==
X-Gm-Message-State: AOAM532OAjaMYhBS3NlA9788cDijcIxNAT0qo/bQ2xa9tecsI10TtWKB
	xZzS+YvIQsetM5ifSYQF850=
X-Google-Smtp-Source: ABdhPJxiu8L9v8GxOyUGr5jM6k+sl/g/RdxlmJX7Aed0o2g5K1Ag8I30b3Fs7EQR2+jkaN0nSAYjgg==
X-Received: by 2002:a05:651c:483:: with SMTP id s3mr5070453ljc.298.1604903400417;
        Sun, 08 Nov 2020 22:30:00 -0800 (PST)
Received: from [192.168.10.4] ([185.199.97.5])
        by smtp.gmail.com with ESMTPSA id h4sm1309826lfk.224.2020.11.08.22.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2020 22:29:59 -0800 (PST)
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
To: Rahul Singh <Rahul.Singh@arm.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
 <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
 <d83f6859-6737-0da8-7c1d-a236e8313869@gmail.com>
 <B8E54A16-8FD4-48E4-82D5-2205EEEB5D2C@arm.com>
 <1001ace5-c6a2-4a81-ba3d-edabeeea9336@epam.com>
 <5F09F481-DC27-4FC3-8CE5-F4F97FDF6DF9@arm.com>
 <2f62f34b-f47d-3472-511f-a89ec1cd36c3@epam.com>
 <20FF6A26-41CF-4888-901A-0FF0ABCC6E64@arm.com>
 <d2eb2db3-7038-3850-310b-4676102e0a55@epam.com>
 <1390C05F-445F-4349-A672-4D7373C301B8@arm.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <ac5414f5-755a-b22c-c413-4b5298f057a7@gmail.com>
Date: Mon, 9 Nov 2020 08:29:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1390C05F-445F-4349-A672-4D7373C301B8@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello, Rahul!

On 11/6/20 4:41 PM, Rahul Singh wrote:
> Hello Oleksandr,
>
>> On 6 Nov 2020, at 2:22 pm, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com> wrote:
>>
>> Hi, Rahul!
>>
>> On 11/6/20 3:58 PM, Rahul Singh wrote:
>>> Hello Oleksandr,
>>>
>>>> On 6 Nov 2020, at 1:00 pm, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com> wrote:
>>>>
>>>> Hello, Rahul!
>>>>
>>>> On 11/6/20 2:48 PM, Rahul Singh wrote:
>>>>> Hello Oleksandr,
>>>>>
>>>>>> On 2 Nov 2020, at 10:12 am, Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com> wrote:
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> On 11/2/20 11:55 AM, Bertrand Marquis wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>>> On 2 Nov 2020, at 05:55, Oleksandr Andrushchenko <andr2000@gmail.com> wrote:
>>>>>>>>
>>>>>>>> Hi, Julien!
>>>>>>>>
>>>>>>>> On 10/30/20 7:18 PM, Julien Grall wrote:
>>>>>>>>> Hi Oleksandr,
>>>>>>>>>
>>>>>>>>> On 30/10/2020 10:44, Oleksandr Andrushchenko wrote:
>>>>>>>>>> On 10/20/20 6:25 PM, Rahul Singh wrote:
>>>>>>>>>>> Add support for ARM architected SMMUv3 implementations. It is based on
>>>>>>>>>>> the Linux SMMUv3 driver.
>>>>>>>>>>>
>>>>>>>>>>> Major differences between the Linux driver are as follows:
>>>>>>>>>>> 1. Only Stage-2 translation is supported as compared to the Linux driver
>>>>>>>>>>>       that supports both Stage-1 and Stage-2 translations.
>>>>>>>>>> First of all thank you for the efforts!
>>>>>>>>>>
>>>>>>>>>> I tried the patch with QEMU and would like to know if my understanding correct
>>>>>>>>>>
>>>>>>>>>> that this combination will not work as of now:
>>>>>>>>>>
>>>>>>>>>> (XEN) SMMUv3: /smmuv3@9050000: SMMUv3: DT value = eventq
>>>>>>>>>> (XEN) Data Abort Trap. Syndrome=0x1940010
>>>>>>>>>> (XEN) Walking Hypervisor VA 0x40031000 on CPU0 via TTBR 0x00000000b8469000
>>>>>>>>>> (XEN) 0TH[0x0] = 0x00000000b8468f7f
>>>>>>>>>>
>>>>>>>>>> [snip]
>>>>>>>>>>
>>>>>>>>>> If this is expected then is there any plan to make QEMU work as well?
>>>>>>>>>>
>>>>>>>>>> I see [1] says that "Only stage 1 and AArch64 PTW are supported." on QEMU side.
>>>>>>>>> Just for clarication, you are trying to boot Xen on QEMU, right?
>>>>>>>> Exactly
>>>>>>>>> You might be able to use the stage-1 page-tables to isolate each device in Xen. However, I don't think you will be able to share the P2M because the page-tables layout between stage-1 and stage-2 is different.
>>>>>>>> So, it is even more work then
>>>>>>> Overall it would make more sense to spend some time adding proper support in Qemu then trying to modify the driver to support Qemu right now.
>>>>>>>
>>>>>>>>>> We are interested in QEMU/SMMUv3 as a flexible platform for PCI passthrough
>>>>>>>>>>
>>>>>>>>>> implementation, so it could allow testing different setups and configurations with QEMU.
>>>>>>>>> I would recommend to get the SMMU supporting supporting stage-2 page-tables.
>>>>>>>> You mean in QEMU?
>>>>>>> See before.
>>>>>>>
>>>>>>>>> Regardless that, I think Xen should be able to say the SMMU is not supported rather than crashing.
>>>>>>>> Yes, that would be nice
>>>>>>> Fully agree and we will look into that.
>>>>>>>
>>>>>>> Anything you could share so that we could quickly reproduce your setup would be more then great.
>>>>>> Nothing special,
>>>>>>
>>>>>> qemu/aarch64-softmmu/qemu-system-aarch64 -machine type=virt -machine virt,gic-version=2 \
>>>>>>
>>>>>> -machine virtualization=true -cpu cortex-a57 -smp 4 -m 2048 -nic user,hostfwd=tcp:127.0.0.1:2222-:22 \
>>>>>>
>>>>>> -nographic -serial mon:stdio [..snip..]
>>>>>>
>>>>>> I also set iommu to smmuv3 in my tests, QEMU emulator version 4.2.1
>>>>> I just checked and confirmed that QEMU is booting with XEN SMMUv3 patch and XEN is able to say SMMU translation is not supported. As XEN supports Stage-2 translation and QEMU supports Stage-1 only.
>>>>>
>>>>>
>>>>> (XEN) SMMUv3: /smmuv3@9050000: SMMUv3: DT value = eventq
>>>>> (XEN) SMMUv3: /smmuv3@9050000: IDR0.COHACC overridden by FW configuration (false)
>>>>> (XEN) SMMUv3: /smmuv3@9050000: no translation support!
>>>>> (XEN) I/O virtualisation disabled
>>>>>
>>>>> Only difference I observed is that you have to add option "-machine virt,iommu=smmuv3 “ when launching the QEMU.
>>>> I do use the option
>>> I used "-machine virt,iommu=smmuv3 “  option while creating the virt-dtb and while launching the QEMU.
>>> I also observed the same error what you observed if I am not using the "-machine virt,iommu=smmuv3 “ options when launching the QEMU so I thought this might be case for you also but anyways you have use the options it might be other issue.
>> Hm, probably that was on my side as now I can see:
>>
>> (XEN) SMMUv3: /smmuv3@9050000: SMMUv3: DT value = eventq
>> (XEN) SMMUv3: /smmuv3@9050000: IDR0.COHACC overridden by FW configuration (false)
>> (XEN) SMMUv3: /smmuv3@9050000: no translation support!
>> (XEN) I/O virtualisation disabled
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 0:
>> (XEN) Couldn't configure correctly all the IOMMUs.
>> (XEN) ****************************************
>> (XEN)
>> (XEN) Manual reset required ('noreboot' specified)
>>
>> So, sorry for the noise, I might have misconfigured something it seems
>>
>> When you say "Xen is booting" do you mean you see the same panic?
> Yes I observe the same.
>
> We have to decide now if for SMMUv3 there is no translation support do we have to print the logs and move forward  or as above return error to iommu_setup that will cal panic().
I would allow Xen to boot further
>
> Regards,
> Rahul
>
>> Thank you,
>>
>> Oleksandr
>>
>>>>> Please let me know if it also works for you.
>>>> Well, I should have reported that earlier that I do not use the staging Xen at the moment,
>>>>
>>>> it is 4.14.0. So, can this be a problem with that Xen version?
>>> I don’t think so this is the problem with the XEN version.
>>>> Anyways, if it works with the staging then everything looks ok
>>>>
>>>> Thank you,
>>>>
>>>> Oleksandr
>>>>
>>>>>>> Regards
>>>>>>> Bertrand
>>>>>>>
>>>>>>>>> Cheers,
>>>>>>>>>
>>>>>>>> Thank you,
>>>>>>>>
>>>>>>>> Oleksandr
>>> Regards,
>>> Rahul

