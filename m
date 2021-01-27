Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2491030622D
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 18:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76313.137655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4ol7-00088g-LG; Wed, 27 Jan 2021 17:37:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76313.137655; Wed, 27 Jan 2021 17:37:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4ol7-00088H-Hi; Wed, 27 Jan 2021 17:37:37 +0000
Received: by outflank-mailman (input) for mailman id 76313;
 Wed, 27 Jan 2021 17:37:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kelV=G6=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l4ol5-00088C-GL
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 17:37:35 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8dde484d-24be-452f-b614-8953932189b7;
 Wed, 27 Jan 2021 17:37:34 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id a25so3097805ljn.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Jan 2021 09:37:34 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id t198sm631543lff.138.2021.01.27.09.37.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jan 2021 09:37:32 -0800 (PST)
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
X-Inumbo-ID: 8dde484d-24be-452f-b614-8953932189b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uYh3G9eISfau9q6J1nwt0OTt73Pa4xytrj9n5QD8jhQ=;
        b=BzOmZBC/UJi/bgjTMAyjMqkFSO4pDk4ffcFlo7zjwQGTIBzfUY4xAaW9wzXVMPJEiP
         iqwO+BZyy1Ak4hQU9Hf7sD/toFBsTYi0ObxsC4mpjw6Zcte6plEv98zQlVzYMctxBdSl
         BwvfjAR5X/tVrtHE1xsaoDhjIIom5CVIL583+KB5vZ0cuOmWcMv/BIlkBwsKIMnHUW9b
         59r7AiAIZYugyl3S/hOqJ6hbA8ItAvPKwJYnmcBskRiC+WEyu2nWkLdikLk0jNG+EKYV
         5YBNlwpQVpf0YntA30yzGyZWcLbrPKDLe0x7l19SGW/++1PgkZzfCeMj//XUxbsRHIDO
         lBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uYh3G9eISfau9q6J1nwt0OTt73Pa4xytrj9n5QD8jhQ=;
        b=aFro2ZU9N960lmswG3HwhbtuiTt86wedkNA7MUXeLELjOo+tWId14Jgl4/z/9+aSvI
         5wIBlNeyWO6Qyh92sW4ZdNbP7gDBECFgZdVHnBaZHsCk7rF4joTlFE6FGWCvkknJmGD8
         7FymsQn9+ot8gFmmu+0+mglhFM/BrFRiQrKD3BZt44ZuUXNGKAoQs5njuuhiJvX/hnPr
         qwLZc8Lo8r9Y9Z1Ar9Sd2yylysguaPxMPgexaZe40ihqSeehQcwiOQn2gwUQzY+YUPXF
         sRMhq1FFDECMGIz1egGy2jU3w1eJc9gJt/MTuh9/zIqSh8Rq2avte7E6e27oOlZ0KnQf
         rH5g==
X-Gm-Message-State: AOAM530iLLBGKI/AHjDfq/ti/G32RFva+1OW/WeNTA+eEEdiiTXEOsHK
	p9z93hyfQF41ORlzdQvGx2M=
X-Google-Smtp-Source: ABdhPJy0NJFzOmRA/DCTvLxTo8xcI9FxSIpCcT3Bf1eCVhb1WzHo7XPUVamfi7oxkgG580SXds9hYw==
X-Received: by 2002:a05:651c:1130:: with SMTP id e16mr2049247ljo.149.1611769053413;
        Wed, 27 Jan 2021 09:37:33 -0800 (PST)
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
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <e274bb07-23e6-95cb-c614-344098f27f76@gmail.com>
Date: Wed, 27 Jan 2021 19:37:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a1bde3cd-c902-1e86-dc35-6c503ebfa684@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 27.01.21 19:33, Julien Grall wrote:

Hi Julien

>
>
> On 27/01/2021 16:50, Oleksandr wrote:
>>
>> On 27.01.21 18:43, Julien Grall wrote:
>>> Hi Oleksandr,
>>
>> Hi Julien
>>
>>
>>>
>>> On 25/01/2021 19:08, Oleksandr Tyshchenko wrote:
>>>> ***
>>>>
>>>> Patch series [8] was rebased on recent "staging branch"
>>>> (5e31789 tools/ocaml/libs/xb: Do not crash after xenbus is 
>>>> unmapped) and tested on
>>>> Renesas Salvator-X board + H3 ES3.0 SoC (Arm64) with virtio-mmio 
>>>> disk backend [9]
>>>> running in driver domain and unmodified Linux Guest running on 
>>>> existing
>>>> virtio-blk driver (frontend). No issues were observed. Guest domain 
>>>> 'reboot/destroy'
>>>> use-cases work properly. Patch series was only build-tested on x86.
>>>>
>>>> Please note, build-test passed for the following modes:
>>>> 1. x86: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y (default)
>>>> 2. x86: #CONFIG_HVM is not set / #CONFIG_IOREQ_SERVER is not set
>>>> 3. Arm64: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>>>> 4. Arm64: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set (default)
>>>> 5. Arm32: CONFIG_HVM=y / CONFIG_IOREQ_SERVER=y
>>>> 6. Arm32: CONFIG_HVM=y / #CONFIG_IOREQ_SERVER is not set (default)
>>>
>>> I thought I woudl give a try to test the code, but I can't find a 
>>> way to enable CONFIG_IOREQ_SERVER from the UI.
>>>
>>> Looking at the Kconfig, it looks like CONFIG_IOREQ_SERVER doesn't 
>>> have a prompt and is not selected by Arm.
>>>
>>> Can you provide details how this can be built on Arm?
>>
>> Please apply the attached patch to select IOREQ on Arm.
>
> This is roughly what I wrote. I think a user should be able to select 
> IOREQ via the menuconfig without any additional patch on top of your 
> series.
>
> Can you include a patch that would enable that?

Yes, do you prefer a separate patch or required changes could be folded 
in patch #14?


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


