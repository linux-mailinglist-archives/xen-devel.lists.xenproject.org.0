Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F8D308314
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77567.140545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5IOE-0001S5-Ro; Fri, 29 Jan 2021 01:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77567.140545; Fri, 29 Jan 2021 01:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5IOE-0001Rg-OR; Fri, 29 Jan 2021 01:15:58 +0000
Received: by outflank-mailman (input) for mailman id 77567;
 Fri, 29 Jan 2021 01:15:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5IOD-0001Rb-S9
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:15:57 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ba9e34a-b9a2-4bf9-862d-ef037ee19f07;
 Fri, 29 Jan 2021 01:15:56 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id b2so10254961lfq.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:15:56 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u24sm1861746lfu.81.2021.01.28.17.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:15:55 -0800 (PST)
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
X-Inumbo-ID: 6ba9e34a-b9a2-4bf9-862d-ef037ee19f07
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Xk7heXi8I3hX6lxqL3QQ+z6x40qzwwdszMNDPS2bNrs=;
        b=QXMLqk1U7DdmNLuo5bmTEarMj1U9K4z9yz8eSQMicBJlEzpIaqFiRtLZwp6IwlBq9g
         zIC4STIiUyE03VvBOAzPUORXTjuK9OrfTwxtIFo8ZyDEso6AKjVR0tNon16S4LhPvJdI
         VCCUhOrfxdb0RZ2uZ72IfEbfFh2SJNHTy56wGjksOARtScOnbcjS8fb2lOQcFS3mZBtR
         HH/9A6t4umW3mLVr2OlYuJj1N1RQxxyhPcqUgFbvpIGx/YxU+ik/Sd23xEhOACAUIo6z
         oZLbA07oDo7GBwmnGwqnU/HBrtu4/Hsg9C6WAMvpKH/5dHYtbeHH+TXh9/vJ8Ds2DhuV
         Erlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Xk7heXi8I3hX6lxqL3QQ+z6x40qzwwdszMNDPS2bNrs=;
        b=T6dpcHy1mMQpg4zmzEi2cvtkSaCxTmMeNxJ+BMYP5hnF0bn2AXx0Bx4XAFfQkm2TDj
         FAcHmGCKPJ5VdeP1LvWuyzC2oFxzI3py3QyBs6iXLcCqhi9RTZYYvhU+cUODEdv7iGpQ
         mm+vwNksahi0ObWLr2FgmUos8ZkcWXzEjrB34Oxa3n4Ah0AkHRjBk7bhc0ZkzBCvwEEa
         bTew+kHK9nti10WT3lnL6tRP6/HhL26snXkFEsLCTrbyiSICK5+bZlNfJ1Ro77mfXEaR
         xL0sPqTHD+BEGjR9D2pylMszG9K8g4DaKQuYDzxPTHUsWijlNd2h3cLrA5qk7Hgc2Y2z
         TNpQ==
X-Gm-Message-State: AOAM532Huz7yoxu4RMZR+yNJsXnFfYTDZlXdsL7+NEADcp1AEemjpObx
	HRpm4a8u0ige/Sc4h1pnS1I=
X-Google-Smtp-Source: ABdhPJzB5zPupIj+vAF11YTyE2NgWaVvlD7EuOvO2n/BRk3UfB4tZgd9POZcbHmXSt+iEoHMMEtp+g==
X-Received: by 2002:a19:8bc6:: with SMTP id n189mr813770lfd.291.1611882955674;
        Thu, 28 Jan 2021 17:15:55 -0800 (PST)
Subject: Re: [PATCH V5 00/22] IOREQ feature (+ virtio-mmio) on Arm
From: Oleksandr <olekstysh@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien.grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Kaly Xin <Kaly.Xin@arm.com>, Artem Mygaiev <joculator@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <ca1375c7-852d-fb3a-6895-5ef12ea7a01e@xen.org>
 <alpine.DEB.2.21.2101280919590.9684@sstabellini-ThinkPad-T480s>
 <1bdfda04-5954-a285-db0f-3f1633e5fd2e@xen.org>
 <5fa7024d-b259-3507-c708-676c52c13c68@citrix.com>
 <089ca38a-63e4-5418-8ff4-54cdad949340@gmail.com>
Message-ID: <90c3868d-66b4-01b2-3eb6-268566d09932@gmail.com>
Date: Fri, 29 Jan 2021 03:15:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <089ca38a-63e4-5418-8ff4-54cdad949340@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 28.01.21 21:44, Oleksandr wrote:

Hi Andrew, Julien

>
> On 28.01.21 20:10, Andrew Cooper wrote:
>
> Hi Andrew
>
>> On 28/01/2021 17:44, Julien Grall wrote:
>>>
>>> On 28/01/2021 17:24, Stefano Stabellini wrote:
>>>> On Thu, 28 Jan 2021, Julien Grall wrote:
>>>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>>>    > Patch series [8] was rebased on recent "staging branch"
>>>>>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is
>>>>>> unmapped) and
>>>>>> tested on
>>>>>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio 
>>>>>> disk
>>>>>> backend [9]
>>>>>> running in driver domain and unmodified Linux Guest running on
>>>>>> existing
>>>>>> virtio-blk driver (frontend). No issues were observed. Guest domain
>>>>>> 'reboot/destroy'
>>>>>> use-cases work properly. Patch series was only build-tested on x86.
>>>>> I have done basic testing with a Linux guest on x86 and I didn't
>>>>> spot any
>>>>> regression.
>>>>>
>>>>> Unfortunately, I don't have a Windows VM in hand, so I can't confirm
>>>>> if there
>>>>> is no regression there. Can anyone give a try?
>>>>>
>>>>> On a separate topic, Andrew expressed on IRC some concern to 
>>>>> expose the
>>>>> bufioreq interface to other arch than x86. I will let him explain
>>>>> his view
>>>>> here.
>>>>>
>>>>> Given that IOREQ will be a tech preview on Arm (this implies the
>>>>> interface is
>>>>> not stable) on Arm, I think we can defer the discussion past the
>>>>> freeze.
>>>> Yes, I agree that we can defer the discussion.
>>>>
>>>>
>>>>> For now, I would suggest to check if a Device Model is trying to
>>>>> create an
>>>>> IOREQ server with bufioreq is enabled (see ioreq_server_create()).
>>>>> This would
>>>>> not alleviate Andrew's concern, however it would at allow us to
>>>>> judge whether
>>>>> the buffering concept is going to be used on Arm (I can see some use
>>>>> for the
>>>>> Virtio doorbell).
>>>>>
>>>>> What do others think?
>>>> Difficult to say. We don't have any uses today but who knows in the
>>>> future.
>>> I have some ideas, but Andrew so far objects on using the existing
>>> bufioreq interface for good reasons. It is using guest_cmpxchg() which
>>> is really expensive.
>> Worse.  Patch 5 needs to switch cmpxchg() to guest_cmpxchg() to avoid
>> reintroducing XSA-295, but doesn't.
>>
>>>> Maybe for now the important thing is to clarify that the bufioreq
>>>> interface won't be maintain for backward compatibility on ARM, and 
>>>> could
>>>> be removed without warnings, at least as long as the whole IOREQ 
>>>> feature
>>>> is a tech preview. >
>>>> In other words, it is not like we are forced to keep bufioreq around
>>>> forever on ARM.
>>> That's correct, we are not forced to use it. But if you only document
>>> it, then there is a fair chance this will split past the "Tech 
>>> Preview".
>>>
>>> Today, there is no caller which requires to send buffered I/O in the
>>> Xen Arm hypervisor. So a Device Model should not need to say "I want
>>> to allocate a page and event channel for the buffered I/O".
>>>
>>> The check I suggested serves two purposes:
>>>    1) Catch any future upstream user of bufioreq
>>>    2) Avoid an interface to be marked supported by mistake
>> "use bufioreq" is an input to create_ioreq_server.  The easiest fix in
>> the short term is "if ( !IS_ENABLED(CONFIG_X86) && bufioreq ) return
>> -EINVAL;"
>
> OK, will take into the account for V6 as a separate patch
What I would like to say is that the easiest fix works fine, it breaks 
virtio backend PoC by rejecting xendevicemodel_create_ioreq_server() call)))
No, buffered I/O is *not* used for the communication *at run-time*, a 
device model just requests bufioreq support, gets bufioreq page and 
event channel, and that's all without future use of them.
So I have just removed that unneeded at the moment initialization, what 
it more that it doesn't match with that check we would like to get in.



>
>
>
-- 
Regards,

Oleksandr Tyshchenko


