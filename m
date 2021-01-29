Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EAB30880C
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 12:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78013.141708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RbO-0003Zf-Ql; Fri, 29 Jan 2021 11:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78013.141708; Fri, 29 Jan 2021 11:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5RbO-0003ZG-N6; Fri, 29 Jan 2021 11:06:10 +0000
Received: by outflank-mailman (input) for mailman id 78013;
 Fri, 29 Jan 2021 11:06:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5RbM-0003ZB-Rg
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 11:06:08 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d1e9d5b6-f79f-47de-aecf-e072f3ce3e36;
 Fri, 29 Jan 2021 11:06:07 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id q12so11910626lfo.12
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 03:06:07 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n7sm1996821lfu.123.2021.01.29.03.06.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 03:06:06 -0800 (PST)
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
X-Inumbo-ID: d1e9d5b6-f79f-47de-aecf-e072f3ce3e36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=JTY14HZ52Dmj7+AqSvqOe6/RSPcpzSOnqkcpeZXFFqg=;
        b=vN9djsOw84q25nJJljO5/Ut0t6xML+GGoH9A5nxib2KPX/BqydrFu3p1meow+q+Rlc
         br6CbKfRU1aiE1atwVCFqNhYdgbVHcuUbEBmtSpVPpfXzI4KoPQDJHC0oe9izogyu59k
         v9ThTanzUUjORcSQ/tad/SO84t3PbBDERjUahJDWsl1u/FDFB6pFkkTvbI3h/rmeX/c2
         2wyBc6dcfHtJg4ZvMmAMivkZBq9FV0fiyE6lZjrucFvcB8+eW2ulqCP79acL2r6xTR2G
         KSnJ/oN1i7xmh55gAuJzB/f8ChLHuw5ua1LlWCyCR9D0eIxmghqW4Y6xPzAmeoxlZvZb
         WewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=JTY14HZ52Dmj7+AqSvqOe6/RSPcpzSOnqkcpeZXFFqg=;
        b=qR36x6S7W1q/AmpSxiihRzLnxnY1i4+odHcY0Zeux4qr2x9a05kRfmh4w8gyk2MPn0
         Zhurp1efkRoJuwr3e6+5SJXLVRoFmYUggh0jwwDjz/p0fve/Dt2UTm2PN5kawtn+OvET
         Q9xPeDDG09rQ4DZ4j4m/m+VGPi9BJY94GCzNfpwNLY33C7qrKrcqOLHfE95kNvb72P/X
         iL9zSZ4gQ+l1Cv2ea4xcuwBy5z8QyaslfgGR/WRv8LtblJ2wESaNtTc8aI/nGOuPVBpO
         0OUbgolmUJQb21vZkhx8c741sVrkvvOsdk04lXCUpHz3HDzZHtCPQWOUq1H4h1eNGBsn
         YxAg==
X-Gm-Message-State: AOAM5324AM1l8v1S1nCc12z0jgyJi+Kaj08vTw9SjDeq1s9Z8IOlQTCh
	/b/XZBPP2Qi/6cIwe6zpyfk=
X-Google-Smtp-Source: ABdhPJxShKUTz4KXIRr6pgRKqCUr03lyEgnQjW/V/uzVgbpu9T0L+VUOY4FOLAKiRPtxcYvD5WdHAg==
X-Received: by 2002:ac2:5639:: with SMTP id b25mr1863391lff.370.1611918366709;
        Fri, 29 Jan 2021 03:06:06 -0800 (PST)
Subject: Re: [PATCH V6 00/24] IOREQ feature (+ virtio-mmio) on Arm
From: Oleksandr <olekstysh@gmail.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Chen <Wei.Chen@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <Julien.Grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tim Deegan <tim@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 Artem Mygaiev <joculator@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <DB7PR08MB3753D1F61623C538FCEF77059EB99@DB7PR08MB3753.eurprd08.prod.outlook.com>
 <9b21efce-42c9-1bdd-e97b-342dd6130620@suse.com>
 <e096c7ad-f206-2773-c4f4-ed3071251cbc@gmail.com>
Message-ID: <f2888729-d135-ac10-96e9-02bfd11b104e@gmail.com>
Date: Fri, 29 Jan 2021 13:06:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e096c7ad-f206-2773-c4f4-ed3071251cbc@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


Hi Ian.

On 29.01.21 12:51, Oleksandr wrote:
>
> On 29.01.21 10:49, Jan Beulich wrote:
>
> Hi Jan
>
>> On 29.01.2021 09:13, Wei Chen wrote:
>>> I just tested the v6 and the latest backend service with the latest 
>>> staging branch.
>>> They work well.
>>>
>>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>> An faod this was again Arm-only testing?
> Yes, unfortunately I don't have a possibility to test on x86, if I had 
> I would definitely perform testing.
> I performed code analysis (the diff between V5 and V6 is small enough 
> and these changes unlikely will add regression, so I was thinking that 
> if basic x86 test passed on V5 (thanks to Julien) than it would likely 
> pass on V6 as well),
> but please don't get me wrong, I *completely* agree that even an 
> obvious single patch must be tested.
>
>
What worries me the most is:

 >>> Unfortunately, I don't have a Windows VM in hand, so I can't confirm if
 >>> there is no regression there. Can anyone give a try?

I am sorry, but would it be possible to make sure that current series 
doesn't break that use-case? Or this could be tested (and fixed if there 
is a need) after the feature freeze?


-- 
Regards,

Oleksandr Tyshchenko


