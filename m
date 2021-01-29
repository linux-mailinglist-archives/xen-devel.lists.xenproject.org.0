Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D2B308A2D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 17:23:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.78300.142391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WY5-00085x-Jw; Fri, 29 Jan 2021 16:23:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 78300.142391; Fri, 29 Jan 2021 16:23:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5WY5-00085Y-Gm; Fri, 29 Jan 2021 16:23:05 +0000
Received: by outflank-mailman (input) for mailman id 78300;
 Fri, 29 Jan 2021 16:23:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5WY4-00085T-Du
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 16:23:04 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab7dc910-4ff8-44d9-a21b-6d711b305157;
 Fri, 29 Jan 2021 16:23:03 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id h12so13258660lfp.9
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jan 2021 08:23:03 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id p14sm2494254ljg.103.2021.01.29.08.23.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 08:23:01 -0800 (PST)
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
X-Inumbo-ID: ab7dc910-4ff8-44d9-a21b-6d711b305157
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=soHMFF/pzSD+A2GyENndI+cRWIDy9KhiRUvC+k7mVvk=;
        b=atFcnkTxvEcIgOjOzgXHkTxS2bTSHgkLNk1zQI8VUwjM73n6ap64pZLR4jw42EwwaC
         bGQyqVS1GB+zWoHp4opU9316DJpVZi5kmIauJ+Ha4+tAEqwKtspT1rtmRx3lDboM4XUz
         df9cgur8FvcEXPa+8+nYHEsA025hIa9m9/jegPPeYWMtD3dbu2DK6zpl8RrIgEZvEpCE
         CnD8WAZn1LgErxBQpy1zoPq9MIuwpcsWW0FnlTYt2Gnqgs7LYaLF3c+NvQFSZF9pwmMn
         5uVIxPvnGEHYRrLaqyW2dgRFl33EwpLuUHnmjZTW1q9No/+PsOjQ9itbGefz7ucPKhD6
         F5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=soHMFF/pzSD+A2GyENndI+cRWIDy9KhiRUvC+k7mVvk=;
        b=EoBjXAfoYqpi6lUo0H42HN1YdIU29pUj5mn6WUzK2HlrotQfjZ1L0VYqc1f/Mjc0VK
         Q0L2djo3MPXIG+GXofW6GAwuk/hzVDi4q2yaKntzde5o7JJNuCMg7vZ2QRfXDlFix3gq
         uC9Jt6XQHj7OUdY7giozhEPhjKsUesxW7imWdK0/MHjHlRYCOpGj8RLqwM3wr8cgU6w5
         9WhXPO8+nB0HjDMRRoDdY/CC9lSAgRz01X4C3z9sFYLb1K4HkskHYPATHnK6zgmq5Ar8
         s62HwRvSjSXBom1EVystDV1vG7qxMC4kQVu6asulHENB3oneKUwuPVMBv4yvYBx2ccUt
         ncQQ==
X-Gm-Message-State: AOAM530o7jO1HL0bj7h7CCsosiUqzTa6MI7RbzuXQWZkY3c0JDEV6H7g
	udXsDybpRA4nKTdk3xUqqdA=
X-Google-Smtp-Source: ABdhPJxggoYvC/yQC/o5TngaH6RVydy7fgDc8i80Z7a/QyYhIOULczSsAMf1HCHGKtJv4gOkXcHdXg==
X-Received: by 2002:ac2:544c:: with SMTP id d12mr2413167lfn.585.1611937382434;
        Fri, 29 Jan 2021 08:23:02 -0800 (PST)
Subject: Re: [PATCH V6 00/24] IOREQ feature (+ virtio-mmio) on Arm
To: Julien Grall <julien@xen.org>, Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Chen <Wei.Chen@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <Julien.Grall@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
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
 <f2888729-d135-ac10-96e9-02bfd11b104e@gmail.com>
 <fd7f1289-04a1-0f50-fdaa-841ef1fcbbcf@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <7ce25846-63c2-4326-dc96-3c9e7f295781@gmail.com>
Date: Fri, 29 Jan 2021 18:22:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fd7f1289-04a1-0f50-fdaa-841ef1fcbbcf@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 29.01.21 18:06, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien, Ian



>
> On 29/01/2021 11:06, Oleksandr wrote:
>> On 29.01.21 12:51, Oleksandr wrote:
>>>
>>> On 29.01.21 10:49, Jan Beulich wrote:
>>>
>>> Hi Jan
>>>
>>>> On 29.01.2021 09:13, Wei Chen wrote:
>>>>> I just tested the v6 and the latest backend service with the 
>>>>> latest staging branch.
>>>>> They work well.
>>>>>
>>>>> Tested-by: Wei Chen <Wei.Chen@arm.com>
>>>> An faod this was again Arm-only testing?
>>> Yes, unfortunately I don't have a possibility to test on x86, if I 
>>> had I would definitely perform testing.
>>> I performed code analysis (the diff between V5 and V6 is small 
>>> enough and these changes unlikely will add regression, so I was 
>>> thinking that if basic x86 test passed on V5 (thanks to Julien) than 
>>> it would likely pass on V6 as well),
>>> but please don't get me wrong, I *completely* agree that even an 
>>> obvious single patch must be tested.
>>>
>>>
>> What worries me the most is:
>>
>>  >>> Unfortunately, I don't have a Windows VM in hand, so I can't 
>> confirm if
>>  >>> there is no regression there. Can anyone give a try?
>>
>> I am sorry, but would it be possible to make sure that current series 
>> doesn't break that use-case? Or this could be tested (and fixed if 
>> there is a need) after the feature freeze?
> With Ian's help, I used Osstest to run a Windows job with your branch 
> (see [1]).
>
> The branch used is rebase version because there was a building issue 
> with Mini-OS on your baseline (it is already fixed upstream).
>
> The result are the same as the latest run with staging (see [2]). So 
> there is no regression with your series applied!

Sounds great, thank you, I really appreciate your help!


>
> I will go through the series one last time and then commit it.

Thank you!


>
> Cheers,
>
> [1] http://logs.test-lab.xenproject.org/osstest/logs/158785/
> [2] 
> http://logs.test-lab.xenproject.org/osstest/logs/158719/test-amd64-amd64-xl-qemuu-win7-amd64/info.html
>
>
>>
>>
>
-- 
Regards,

Oleksandr Tyshchenko


