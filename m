Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F83307D14
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 18:55:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77368.140094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5BVh-000724-LI; Thu, 28 Jan 2021 17:55:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77368.140094; Thu, 28 Jan 2021 17:55:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5BVh-00071f-Hl; Thu, 28 Jan 2021 17:55:13 +0000
Received: by outflank-mailman (input) for mailman id 77368;
 Thu, 28 Jan 2021 17:55:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5BVg-00071a-Aq
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 17:55:12 +0000
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4aca6bb-fbe4-4d42-9fb2-348e9e3c8662;
 Thu, 28 Jan 2021 17:55:11 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id l12so7413719ljc.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 09:55:11 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a81sm1738423lfd.211.2021.01.28.09.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 09:55:09 -0800 (PST)
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
X-Inumbo-ID: e4aca6bb-fbe4-4d42-9fb2-348e9e3c8662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=oblNj6I6SSnrqFKhdhptJGY38gnZTBwSLi9+q5Zdwl4=;
        b=n5RP2RDlbde7Ys5Vpvg9sAfBeLDRnliXqXZwFb6k6MMtp+QNmOlc3HIWBo/ND2jfdF
         mWSAQC9VZ6UgvR55kc06JhL7rvAjSxbxOMBgg+i8bE0U939TxqH+LmFz7ajgVoMTa/OG
         lcp/Fgrzt86G7HYYmqSca+51tOZFiNcpsdD8Gsy7psybPjm6AzBnlYFJyDC56tlsjuEA
         cK0vCMP6p6BuE6chkN2p39xt0yZVw1VJeHYJy4uKuuZ6ZxS4nxa7OBODOAx7AXbRM26I
         2BdYZsrebX1Zivgj6CK/onA2X8g2s90yFKA7vR5Z5oUUk1BAlcLpPrjJnUGHPSS5uUN7
         o9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=oblNj6I6SSnrqFKhdhptJGY38gnZTBwSLi9+q5Zdwl4=;
        b=ZdvHSZ9uuxjVEO3FwFaxOt+ZVPTi5JnGn5EtzPRrG5DJ7todImBiGg1YTFqFRb/Fr1
         vy59PtOZu9CchQTZL9AYDt9d+6iGT929UeIajYTTx3zSz+BIuQTMuK23r5185KPALU5v
         Br9O6nFeGTZlGQcSiLurXVRiTHeaJtt8SSnf15I3Rxy+0d+RXOVsLcgwCAWEr32aUKj7
         kdIu3yZyrNXBSI+DNQCQf2Ih/49acjQUj2ZV0p6bWNrK/0IwjXkKr9BTWvPofDEG7TAt
         11Q+EoAqQoa/+RXTBNUMCbxcJaeSAJVn5qfHJlEWaSQY4+gVm+h0Hf+2YHfewBI7IqG6
         NKzQ==
X-Gm-Message-State: AOAM531G5/JDSDzjPZVRAs8Sv7avKPWcS3ZpiNDqHA6uVQWhB7AWYuak
	IqWZ34uQwmPn0V+Zkj0N3/k=
X-Google-Smtp-Source: ABdhPJxEM7cHH93Nm+RoKQmpLa3GS0q/TiOIR0tPNrjP8W2W6t7lWlI2191pBb3OC/crJYP/Sgk0tg==
X-Received: by 2002:a2e:b00a:: with SMTP id y10mr269038ljk.94.1611856510318;
        Thu, 28 Jan 2021 09:55:10 -0800 (PST)
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
 <58677bf7-a7ba-7827-75f4-f86152954c24@gmail.com>
 <ef73fe0a-34bd-b1d2-baaa-6dc43cfeabe4@gmail.com>
 <4960d39d-1b9f-8769-fea1-8a91bfed7fb1@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <d5990b0c-7d98-8e4d-79a7-49ffbcb9d4c4@gmail.com>
Date: Thu, 28 Jan 2021 19:55:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4960d39d-1b9f-8769-fea1-8a91bfed7fb1@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 28.01.21 17:14, Julien Grall wrote:

Hi Julien

> Hi,
>
> On 28/01/2021 14:37, Oleksandr wrote:
>> On 27.01.21 19:45, Oleksandr wrote:
>>>
>>> On 27.01.21 19:42, Julien Grall wrote:
>>>
>>> Hi
>>>
>>>>
>>>>
>>>> On 27/01/2021 17:37, Oleksandr wrote:
>>>>>
>>>>> On 27.01.21 19:33, Julien Grall wrote:
>>>>>
>>>>> Hi Julien
>>>>>
>>>>>>
>>>>>>
>>>>>> On 27/01/2021 16:50, Oleksandr wrote:
>>>>>>>
>>>>>>> On 27.01.21 18:43, Julien Grall wrote:
>>>>>>>> Hi Oleksandr,
>>>>>>>
>>>>>>> Hi Julien
>>>>>>>
>>>>>>>
>>>>>>>>
>>>>>>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>>>>>>> ***
>>>>>>>>>
>>>>>>>>> Patch series [8] was rebased on recent "staging branch"
>>>>>>>>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is 
>>>>>>>>> unmapped) and tested on
>>>>>>>>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with 
>>>>>>>>> virtio-mmio disk backend [9]
>>>>>>>>> running in driver domain and unmodified Linux Guest running on 
>>>>>>>>> existing
>>>>>>>>> virtio-blk driver (frontend). No issues were observed. Guest 
>>>>>>>>> domain 'reboot/destroy'
>>>>>>>>> use-cases work properly. Patch series was only build-tested on 
>>>>>>>>> x86.
>>>>>>>>>
>>>>>>>>> Please note, build-test passed for the following modes:
>>>>>>>>> 1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
>>>>>>>>> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
>>>>>>>>> 3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>>>>>>>>> 4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set 
>>>>>>>>> (default)
>>>>>>>>> 5. Arm32: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>>>>>>>>> 6. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set 
>>>>>>>>> (default)
>>>>>>>>
>>>>>>>> I thought I woudl give a try to test the code, but I can't find 
>>>>>>>> a way to enable CONFIG_IOREQ_SERVER from the UI.
>>>>>>>>
>>>>>>>> Looking at the Kconfig, it looks like CONFIG_IOREQ_SERVER 
>>>>>>>> doesn't have a prompt and is not selected by Arm.
>>>>>>>>
>>>>>>>> Can you provide details how this can be built on Arm?
>>>>>>>
>>>>>>> Please apply the attached patch to select IOREQ on Arm.
>>>>>>
>>>>>> This is roughly what I wrote. I think a user should be able to 
>>>>>> select IOREQ via the menuconfig without any additional patch on 
>>>>>> top of your series.
>>>>>>
>>>>>> Can you include a patch that would enable that?
>>>>>
>>>>> Yes, do you prefer a separate patch or required changes could be 
>>>>> folded in patch #14?
>>>>
>>>> I would do a separate patch as IOREQ only really work after the 
>>>> full series applies.
>>>
>>>
>>> Makes sense, I will do it for V6
>>
>>
>> Could we please negotiate *the last posting time* for me to able to 
>> prepare and push V6 not later than it?
>
> The feature freeze is going to be happen tomorrow evening. I can't 
> give you as specific time, but it is probably best if you respin v6 by 
> tomorrow morning. This should give us some slack for any last minutes 
> issues (if any).

I got it, will try


-- 
Regards,

Oleksandr Tyshchenko


