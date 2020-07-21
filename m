Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A2822802B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 14:43:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxrcO-0002HV-N8; Tue, 21 Jul 2020 12:43:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FhFK=BA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jxrcM-0002HN-PB
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 12:43:34 +0000
X-Inumbo-ID: c89278a3-cb4f-11ea-850b-bc764e2007e4
Received: from mail-lf1-x12e.google.com (unknown [2a00:1450:4864:20::12e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c89278a3-cb4f-11ea-850b-bc764e2007e4;
 Tue, 21 Jul 2020 12:43:33 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id 140so1196643lfi.5
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 05:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3mR0ctUuSSRgosKIoD17ZxqHuQMrC4nwz7Ef6VXJ+nQ=;
 b=rdXf+svpvwuEI/CuJCw3nI6LayiudL8PqiyAzywoyvWk7gFlJ7v1EfZjvL601y+X3Z
 0wwpVilMMry5KWmNrav1utFP0DPO9kDoSk2ETYe0DpN85HYO1F1LGKsRPAJ5w5c4kbTF
 8AID2hZykKOBl/UlHAotkH5jqkiAHnM0lFGPnCpVeh3bTmoeuA0NkHLbmbpL/rOHOtIm
 n40BIxe8UmVWoyC0CREq532tUc/a7Pe7sK50b2yLwz7kfvei+FwDSfJtQc5qmAK1rKk3
 frgalfpVtXWMelLRds4J0IZFdoDJIh/XGboeQtvWP5dyib2FdA0T2/hSkpWKv5EeDdg5
 yCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=3mR0ctUuSSRgosKIoD17ZxqHuQMrC4nwz7Ef6VXJ+nQ=;
 b=N1q0ZSgA3LqNkqq1Z87gIijxIdsJdRw13yA3oZj8sC8iwuyCWWXCdZKXeCfg2L3yW3
 H9z1nJ8ATFFuERxOSQl0UNLQQgG9fTeU67vXjXWKsyDtZ12s5IjPKcn+pT2clO6ndsH5
 lRdf9ZAC8qlkJiMt+TRFjB86hWTYTEDUSF7ibcgK/LF8m7hUMj/TtWMt/at+dQhc+sb7
 KZwNyXYX0jd+ah//05sImi8oFR2bUfgoTMQUzfajFFc90p5cY4vd3Yw8LhMX0V+3gDnp
 GUf3iXc2lJ5L2UZSNl3WtLJ9/3LfcC+yux0rLvB5yARZMTlOBxoFZv+SBMJGOi2Lfb1I
 SGQw==
X-Gm-Message-State: AOAM533z3e/Ec1LA3DIOyPXE+4YyMmoxaXDIDTLvEdFZ0K18OYi9ezUl
 oDidILxP6U7jfpuESc0/hGE=
X-Google-Smtp-Source: ABdhPJw6gLy02g+vtXhYCE9nq1p1RuFoMhPZvd+pKzSKLl1LuveCY5q0ATbhB5AaQfAMeQcHZdDOhA==
X-Received: by 2002:a19:7404:: with SMTP id v4mr13412036lfe.93.1595335412068; 
 Tue, 21 Jul 2020 05:43:32 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id q3sm4382632ljm.22.2020.07.21.05.43.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jul 2020 05:43:31 -0700 (PDT)
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
To: Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <20200720091722.GF7191@Air-de-Roger>
 <be3fc8de-5582-8fd0-52cd-0cbfbfa96859@gmail.com>
 <20200720110950.GJ7191@Air-de-Roger>
 <alpine.DEB.2.21.2007201330070.32544@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7f3a558f-e539-17bb-c8da-2d95d5578221@gmail.com>
Date: Tue, 21 Jul 2020 15:43:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007201330070.32544@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 20.07.20 23:40, Stefano Stabellini wrote:

Hello Stefano

> On Mon, 20 Jul 2020, Roger Pau Monné wrote:
>> On Mon, Jul 20, 2020 at 01:56:51PM +0300, Oleksandr wrote:
>>> On 20.07.20 12:17, Roger Pau Monné wrote:
>>>> On Fri, Jul 17, 2020 at 09:34:14PM +0300, Oleksandr wrote:
>>>>> On 17.07.20 18:00, Roger Pau Monné wrote:
>>>>>> On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrote:
>>>>> The other reasons are:
>>>>>
>>>>> 1. Automation. With current backend implementation we don't need to pause
>>>>> guest right after creating it, then go to the driver domain and spawn
>>>>> backend and
>>>>>
>>>>> after that go back to the dom0 and unpause the guest.
>>>> xl devd should be capable of handling this for you on the driver
>>>> domain.
>>>>
>>>>> 2. Ability to detect when guest with involved frontend has gone away and
>>>>> properly release resource (guest destroy/reboot).
>>>>>
>>>>> 3. Ability to (re)connect to the newly created guest with involved frontend
>>>>> (guest create/reboot).
>>>>>
>>>>> 4. What is more that having Xenstore support the backend is able to detect
>>>>> the dom_id it runs into and the guest dom_id, there is no need pass them via
>>>>> command line.
>>>>>
>>>>>
>>>>> I will be happy to explain in details after publishing backend code).
>>>> As I'm not the one doing the work I certainly won't stop you from
>>>> using xenstore on the backend. I would certainly prefer if the backend
>>>> gets all the information it needs from the command line so that the
>>>> configuration data is completely agnostic to the transport layer used
>>>> to convey it.
>>>>
>>>> Thanks, Roger.
>>> Thank you for pointing another possible way. I feel I need to investigate
>>> what is the "xl devd" (+ Argo?) and how it works. If it is able to provide
>>> backend with
>> That's what x86 at least uses to manage backends on driver domains: xl
>> devd will for example launch the QEMU instance required to handle a
>> Xen PV disk backend in user-space.
>>
>> Note that there's currently no support for Argo or any communication
>> channel different than xenstore, but I think it would be cleaner to
>> place the fetching of data from xenstore in xl devd and just pass
>> those as command line arguments to the VirtIO backend if possible. I
>> would prefer the VirtIO backend to be fully decoupled from xenstore.
>>
>> Note that for a backend running on dom0 there would be no need to
>> pass any data on xenstore, as the backend would be launched directly
>> from xl with the appropriate command line arguments.
> If I can paraphrase Roger's point, I think we all agree that xenstore is
> very convenient to use and great to get something up and running
> quickly. But it has several limitations, so it would be fantastic if we
> could kill two birds with one stone and find a way to deploy the system
> without xenstore, given that with virtio it is not actually needed if not
> for very limited initial configurations. It would certainly be a big
> win. However, it is fair to say that the xenstore alternative, whatever
> that might be, needs work.

Well, why actually not?

For example, the idea "to place the fetching of data from xenstore in xl 
devd and just pass
those as command line arguments to the VirtIO backend if possible" 
sounds fine to me. But this needs an additional investigation.

-- 
Regards,

Oleksandr Tyshchenko


