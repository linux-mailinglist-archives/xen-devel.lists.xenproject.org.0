Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54D330626C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 18:45:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76331.137691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4osS-0000vm-Uy; Wed, 27 Jan 2021 17:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76331.137691; Wed, 27 Jan 2021 17:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4osS-0000vN-RZ; Wed, 27 Jan 2021 17:45:12 +0000
Received: by outflank-mailman (input) for mailman id 76331;
 Wed, 27 Jan 2021 17:45:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4osR-0000vH-A7
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 17:45:11 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04d9b6f0-772a-4386-84ea-b282a8e09d49;
 Wed, 27 Jan 2021 17:45:10 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id q8so3822226lfm.10
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 09:45:10 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b24sm646640lfc.160.2021.01.27.09.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 09:45:08 -0800 (PST)
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
X-Inumbo-ID: 04d9b6f0-772a-4386-84ea-b282a8e09d49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=qTsP3WfkPGgktpLutFQDJh4vUFX62Mj0EBbbOax30ks=;
        b=affuUANB2uqXSFWP9T+CZ8JmCU7WHxB3lUVswtx03lmHOaJS+SvLqnZNzKGhpGAm9J
         8Y+tvzbFTBWalGo6OGiykU0JyuT8z/jE/DFTsoJjCZ3joyAfXUkxgCFPeAcqJf31QAYO
         +7o9xnSlfmbikR0sTI43HxMea/ghv7nqpagpy1kiLOLHPnBPfaPNtTqCma7qJiEXBoJY
         6eezkhR/Z7uEWLHT0nZSog2A5LfWKgF9sKdol5KzOUAVOUp1k8jvfLn/R2X4VDxV9skj
         ZUEr4PQ3CCNmJeiQOpCnyl0aWhDO3yMwixam2CYLlBzJUbvqBRV7MOhXjRjKEd0JPpO7
         l9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=qTsP3WfkPGgktpLutFQDJh4vUFX62Mj0EBbbOax30ks=;
        b=pJ9tXsEjYKwjY0EpNLBrhcn1lHqCMv1F+7Pa8yOQ1bY/dQ+9VEfbTHiwKfSWrZGTRf
         316Ie8wnqhYMs+fZrWNtLxV/cmjRSTrTrrepWFGCC60I4QIfi7Ye0JcoG6yZFsqJ1nWc
         b6chBPSPWtVhHc/wu62aQSCO4ymiaczYtOVnb7BUUCuCQu3EmR73zJKALkBtWLpPdSdj
         dMCzZch1Extji2xekXkRSQXcvEyi8A4nm98sX887IIW3aFH2Pc+Z8T3Lnc5TO0WmYccY
         HqUbfm8PJspYOWWAa5rtgnUmqvN/D4wGeirS3N3GIcgfxslh17NK2m1PfL+iyad1MZCF
         tAIw==
X-Gm-Message-State: AOAM530oEFaIwl9ZBMN5Uo46PvQS8BSVlfbRAGR06VHrsu7gRXLel6mr
	F+BlnK91YGEqLc6Z9IsRBek=
X-Google-Smtp-Source: ABdhPJzZJt4ZN9NseTh57FFHaVyV6yfZDt244uLuZMulUCFvn4vpqPL7unT+gQL3PIRFpvE+ztxb2g==
X-Received: by 2002:ac2:44c3:: with SMTP id d3mr5786923lfm.238.1611769509213;
        Wed, 27 Jan 2021 09:45:09 -0800 (PST)
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <58677bf7-a7ba-7827-75f4-f86152954c24@gmail.com>
Date: Wed, 27 Jan 2021 19:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fb163739-fffc-b6d8-1ae4-d95a68c29e60@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 27.01.21 19:42, Julien Grall wrote:

Hi

>
>
> On 27/01/2021 17:37, Oleksandr wrote:
>>
>> On 27.01.21 19:33, Julien Grall wrote:
>>
>> Hi Julien
>>
>>>
>>>
>>> On 27/01/2021 16:50, Oleksandr wrote:
>>>>
>>>> On 27.01.21 18:43, Julien Grall wrote:
>>>>> Hi Oleksandr,
>>>>
>>>> Hi Julien
>>>>
>>>>
>>>>>
>>>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>>>> ***
>>>>>>
>>>>>> Patch series [8] was rebased on recent "staging branch"
>>>>>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is 
>>>>>> unmapped) and tested on
>>>>>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio 
>>>>>> disk backend [9]
>>>>>> running in driver domain and unmodified Linux Guest running on 
>>>>>> existing
>>>>>> virtio-blk driver (frontend). No issues were observed. Guest 
>>>>>> domain 'reboot/destroy'
>>>>>> use-cases work properly. Patch series was only build-tested on x86.
>>>>>>
>>>>>> Please note, build-test passed for the following modes:
>>>>>> 1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
>>>>>> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
>>>>>> 3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>>>>>> 4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set (default)
>>>>>> 5. Arm32: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>>>>>> 6. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set (default)
>>>>>
>>>>> I thought I woudl give a try to test the code, but I can't find a 
>>>>> way to enable CONFIG_IOREQ_SERVER from the UI.
>>>>>
>>>>> Looking at the Kconfig, it looks like CONFIG_IOREQ_SERVER doesn't 
>>>>> have a prompt and is not selected by Arm.
>>>>>
>>>>> Can you provide details how this can be built on Arm?
>>>>
>>>> Please apply the attached patch to select IOREQ on Arm.
>>>
>>> This is roughly what I wrote. I think a user should be able to 
>>> select IOREQ via the menuconfig without any additional patch on top 
>>> of your series.
>>>
>>> Can you include a patch that would enable that?
>>
>> Yes, do you prefer a separate patch or required changes could be 
>> folded in patch #14?
>
> I would do a separate patch as IOREQ only really work after the full 
> series applies.


Makes sense, I will do it for V6


-- 
Regards,

Oleksandr Tyshchenko


