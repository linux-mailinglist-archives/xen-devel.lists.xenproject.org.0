Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C169307449
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 12:02:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76898.138971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l553a-0007rL-Bl; Thu, 28 Jan 2021 11:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76898.138971; Thu, 28 Jan 2021 11:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l553a-0007qw-8p; Thu, 28 Jan 2021 11:01:46 +0000
Received: by outflank-mailman (input) for mailman id 76898;
 Thu, 28 Jan 2021 11:01:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tEu6=G7=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l553Y-0007qr-Ne
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 11:01:44 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d9df124-b6a0-4bbb-92d1-028002a44024;
 Thu, 28 Jan 2021 11:01:43 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p21so7006451lfu.11
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 03:01:43 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z21sm1836198ljn.65.2021.01.28.03.01.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Jan 2021 03:01:40 -0800 (PST)
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
X-Inumbo-ID: 7d9df124-b6a0-4bbb-92d1-028002a44024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=sPWi61Gg5LvOhNjo1su5Hr7AyMIXklG8wwCOrENhB7o=;
        b=H1iJhUl0zdIW40DAFgNLPQ7ZW05fGXtbT/rcNpUQEM9YBLuxTIy1QC5H+qujpyDb4t
         rNO3rdZtmNmcxx+0dxlq8pWtrk56NHCE7H81cTiLvwhP9jcfqUXX7jIfikUPh/YojXxB
         aB73+2wTuoedIrLLfoiPoSKtXwUJZytc+T4EGyFhUcRZSFkevsk1KFUP0miPWtPmI/a5
         /iHcqMjO9E1wZ0QV+139Nx9HTX5agEzqJ0aW8jaRcVKOWflPG9KSVq7hMKTZH9bjt5vj
         WOthHWiWFlXmET8W+NqRo0bl6nZu4aNIh8scNvAVWHKVvd/kDxffqZ+JNvt2bUBEG3bK
         byKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=sPWi61Gg5LvOhNjo1su5Hr7AyMIXklG8wwCOrENhB7o=;
        b=EyR2SqhwWqU6HkRz1wrTBMn4fJWDBanK0kKc7WhzHOQ6M9nS6aAy5hjy3rZ9tANPd/
         APMYRR8E3s6eUHR8EZtH03EW1VBCY5KQMnVWmXN4yoyTQ0KcuAVAmehIEEkc/+O5eHMw
         xA+iuBJjHiu6cXwCQh09bxthmlemRojsHpW8M42/NO5tkG/a7KHS/8dNwEgAhRnY4JcV
         tUK204s3YlwciEhBzUTOYwaqNGPy9s7+6eXlba1/o1VZD1eeMSc5SgwIdR1gYFYARy1W
         8xYPZDTHTUUoGPEFlppesHeGhk9tUDlDQ3UD7ZtrE1YcNpaJhzuI37hiF1k4hoSfoQZ/
         AAvQ==
X-Gm-Message-State: AOAM5300VpZmuHMbqxbchj2XzVwrVxEOFcfPGnMzdL2YoK4+RROOROM2
	QanzJ3WQJgc5FgxTxk4ysUY=
X-Google-Smtp-Source: ABdhPJwjoiY6J6ANpwBSy75TU+tgIpxVE90C3WqGma2Ig2bIkETZ6Kieba3xJAPxUl90k/b359abCg==
X-Received: by 2002:ac2:5450:: with SMTP id d16mr7273203lfn.241.1611831702514;
        Thu, 28 Jan 2021 03:01:42 -0800 (PST)
Subject: Re: [PATCH V5 04/22] xen/ioreq: Make x86's IOREQ feature common
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien.grall.oss@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-5-git-send-email-olekstysh@gmail.com>
 <CAJ=z9a1c+obN3KW_cMr7OH0112_gHSxnAoEJb9qW6R1J38QgQQ@mail.gmail.com>
 <20270711-36bc-6d7d-16cb-4572cace47ed@gmail.com>
 <eb03f366-9405-c193-07be-fbeca29fca4c@xen.org>
 <1156e356-5762-a196-ec16-bb6614912394@gmail.com>
 <alpine.DEB.2.21.2101271235410.9684@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <dd9a1bf6-5afb-158a-6456-a5ded15580bf@gmail.com>
Date: Thu, 28 Jan 2021 13:01:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101271235410.9684@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 27.01.21 22:46, Stefano Stabellini wrote:

Hi Stefano, all

> On Wed, 27 Jan 2021, Oleksandr wrote:
>>>>> On Mon, 25 Jan 2021 at 19:09, Oleksandr Tyshchenko <olekstysh@gmail.com>
>>>>> wrote:
>>>>>> ***
>>>>>> Please note, this patch depends on the following which is
>>>>>> on review:
>>>>>> https://patchwork.kernel.org/patch/11816689/
>>>>>> The effort (to get it upstreamed) was paused because of
>>>>>> the security issue around that code (XSA-348).
>>>>>> ***
>>>>> I read this comment as "This series should be applied on top the patch
>>>>> X". However, looking at your branch, I can't see the patch. What did I
>>>>> miss?
>>>> You didn't miss anything. Patch series doesn't contain it. I mentioned
>>>> about this patch in order not to forget about it
>>>> and draw reviewer's attention. Looks like, the activity (to get it
>>>> upstreamed) hasn't been resumed yet and I don't know what we should do
>>>> with that dependency
>>>> in the context of this series...
>>> I will reply what I wrote on IRC privately :). I think this fine to defer it
>>> to after Xen 4.15 because IOREQ will be in tech preview.
>> Thank you. I got a request to make a possibility for user to select IOREQ via
>> the menuconfig on Arm. Saying tech preview do you mean that I also need to put
>> it under CONFIG_EXPERT on Arm?
> Normally I would say that unless it actually takes an expert to enable
> the feature, it is better to make it depend on CONFIG_UNSUPPORTED [1].
>
> However, in this case, it might actually take an expert :-)
> Additional patches are still required to enable the feature at the
> toolstack level, and also the user needs to build a userspace ioreq
> server. So in this case I am fine either way. I'll leave it up to you
> and Julien to pick the best one.
>
> Either way, please add "(EXPERT)" or "(UNSUPPORTED)" in the one-line
> kconfig description for ARM if possible.
>
>
> [1] https://marc.info/?l=xen-devel&m=161168780401884

Thank you for the explanation, personally I would prefer EXPERT, but...

It would be really nice if we could agreed regarding that *common* 
Kconfig option before I submit V6 (which would probably avoid me to send 
V7 I hope).

Now I see it as following (please note, it is a subject for new patch in 
this series, which should come last):

+++ b/xen/common/Kconfig
@@ -137,7 +137,13 @@ config HYPFS_CONFIG
           want to hide the .config contents from dom0.

  config IOREQ_SERVER
-       bool
+       bool "IOREQ support" if EXPERT || X86
+       default X86
+       depends on HVM
+       ---help---
+         Enables generic mechanism for providing emulated devices to 
the guests.
+
+         If unsure, say Y.

  config KEXEC
         bool "kexec support"


Looks like, it works this way for both archs, but for me it looks a bit ugly

I would appreciate your input on that.


-- 
Regards,

Oleksandr Tyshchenko


