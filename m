Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4BE30783D
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77090.139445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58Pz-0006hj-Ah; Thu, 28 Jan 2021 14:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77090.139445; Thu, 28 Jan 2021 14:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58Pz-0006hI-7S; Thu, 28 Jan 2021 14:37:07 +0000
Received: by outflank-mailman (input) for mailman id 77090;
 Thu, 28 Jan 2021 14:37:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l58Py-0006h7-9t
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:37:06 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b317f0a5-0e08-4e39-a5ab-be91a46fd6a4;
 Thu, 28 Jan 2021 14:37:05 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id b2so7912548lfq.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 06:37:05 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q9sm1693968lfc.61.2021.01.28.06.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 06:37:02 -0800 (PST)
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
X-Inumbo-ID: b317f0a5-0e08-4e39-a5ab-be91a46fd6a4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=CVLj2NjVL2HGixJOCeUOFHilRbZCu5M2T1O0yenjFjA=;
        b=tPfiuqMIog8qTtDYawRsnrU8r6j4q2C24Kd8BWvpM3at6Wqva2UGvMUHT+wlgpyF8y
         Tdzn4cXc1CLgdD/S9OHa1p9/tqDId1to1GUYkrHYd8K1P5oIY3oHLfTzwnUmicgAqv38
         hnQRCAx+78NkA/Le+AwrJ8cR2II74m9CmT/1DiH7p7ITUTWu9T+CwUri+q0s3EVkQDdN
         hQvqPMxRdzhKJQJ8np4D2YxykWc4HirMSUZL0vCRQtibaauRlkzm42DnSeNSOK1Zf7Qr
         lQDiWv6ByBP5MMbjhp4jlAQxri+KTXPOI0XxyLNY7/+bEfbWjiUtqolfkjkiAyUkuITh
         18ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=CVLj2NjVL2HGixJOCeUOFHilRbZCu5M2T1O0yenjFjA=;
        b=OsCiquXOB6Wv4xLGC+Jl7/OvjXgOsWMw1cJiJt4dpxalnDgfYQVjz4/kxOtzq5/b1y
         7zBHudX4uUyPc8w4lYBB5kBnBVheBzWX1zciGoi3UQeGMimP0xOAG1TrKWJeAi1TtPJQ
         XWhG+TI6GD2i7A6TyOMqXiF5Qwv4aUR11dTZmZjh2OVgZO+G7VZhe/nPXcinnpKHWpW2
         3owBE2hw9iCxqI3F1iOXE0puLZxUy7UR33LbrAWXbCvYUQGy/5K24UqY76WQvV/siN/m
         Yy4/DsP1LEoPm/lKHg19A10zmy4G6rPLapqQAEEdZA7TlDxAh1nlRg5lcVvvlPVanmOv
         w+/w==
X-Gm-Message-State: AOAM532aRM76ixeUFwSTPM+NYvF+3SfuxD078McmQ0zRP9jFM+b5sLvD
	8jquKEAPmtpvCc/94HpMy28=
X-Google-Smtp-Source: ABdhPJyMiPLCVDySA8luzS+c156vXqdegxrJJl5gCkrf05jqfnXkSpkgrRpzCo/n61pnd+0a/mmzxg==
X-Received: by 2002:a19:40b:: with SMTP id 11mr7794446lfe.265.1611844624141;
        Thu, 28 Jan 2021 06:37:04 -0800 (PST)
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
From: Oleksandr <olekstysh@gmail.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <dc7866fc-5b13-5378-2b22-6475053fd76b@xen.org>
 <a69fdf11-2445-865f-4893-b486618c29a3@gmail.com>
 <a1bde3cd-c902-1e86-dc35-6c503ebfa684@xen.org>
 <e274bb07-23e6-95cb-c614-344098f27f76@gmail.com>
 <fb163739-fffc-b6d8-1ae4-d95a68c29e60@xen.org>
 <58677bf7-a7ba-7827-75f4-f86152954c24@gmail.com>
Message-ID: <ef73fe0a-34bd-b1d2-baaa-6dc43cfeabe4@gmail.com>
Date: Thu, 28 Jan 2021 16:37:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <58677bf7-a7ba-7827-75f4-f86152954c24@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hi Julien, all


On 27.01.21 19:45, Oleksandr wrote:
>
> On 27.01.21 19:42, Julien Grall wrote:
>
> Hi
>
>>
>>
>> On 27/01/2021 17:37, Oleksandr wrote:
>>>
>>> On 27.01.21 19:33, Julien Grall wrote:
>>>
>>> Hi Julien
>>>
>>>>
>>>>
>>>> On 27/01/2021 16:50, Oleksandr wrote:
>>>>>
>>>>> On 27.01.21 18:43, Julien Grall wrote:
>>>>>> Hi Oleksandr,
>>>>>
>>>>> Hi Julien
>>>>>
>>>>>
>>>>>>
>>>>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>>>>> ***
>>>>>>>
>>>>>>> Patch series [8] was rebased on recent "staging branch"
>>>>>>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is 
>>>>>>> unmapped) and tested on
>>>>>>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio 
>>>>>>> disk backend [9]
>>>>>>> running in driver domain and unmodified Linux Guest running on 
>>>>>>> existing
>>>>>>> virtio-blk driver (frontend). No issues were observed. Guest 
>>>>>>> domain 'reboot/destroy'
>>>>>>> use-cases work properly. Patch series was only build-tested on x86.
>>>>>>>
>>>>>>> Please note, build-test passed for the following modes:
>>>>>>> 1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
>>>>>>> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
>>>>>>> 3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>>>>>>> 4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set (default)
>>>>>>> 5. Arm32: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>>>>>>> 6. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set (default)
>>>>>>
>>>>>> I thought I woudl give a try to test the code, but I can't find a 
>>>>>> way to enable CONFIG_IOREQ_SERVER from the UI.
>>>>>>
>>>>>> Looking at the Kconfig, it looks like CONFIG_IOREQ_SERVER doesn't 
>>>>>> have a prompt and is not selected by Arm.
>>>>>>
>>>>>> Can you provide details how this can be built on Arm?
>>>>>
>>>>> Please apply the attached patch to select IOREQ on Arm.
>>>>
>>>> This is roughly what I wrote. I think a user should be able to 
>>>> select IOREQ via the menuconfig without any additional patch on top 
>>>> of your series.
>>>>
>>>> Can you include a patch that would enable that?
>>>
>>> Yes, do you prefer a separate patch or required changes could be 
>>> folded in patch #14?
>>
>> I would do a separate patch as IOREQ only really work after the full 
>> series applies.
>
>
> Makes sense, I will do it for V6


Could we please negotiate *the last posting time* for me to able to 
prepare and push V6 not later than it?


>
>
>
-- 
Regards,

Oleksandr Tyshchenko


