Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7CE3E7DED
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 19:03:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165448.302334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDVA5-0006rI-Bh; Tue, 10 Aug 2021 17:03:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165448.302334; Tue, 10 Aug 2021 17:03:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDVA5-0006oM-5z; Tue, 10 Aug 2021 17:03:33 +0000
Received: by outflank-mailman (input) for mailman id 165448;
 Tue, 10 Aug 2021 17:03:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oQPR=NB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mDVA3-0006oG-HP
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 17:03:31 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bfdc5560-719f-4237-8d79-84ef8fea4f1c;
 Tue, 10 Aug 2021 17:03:30 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id w20so16280711lfu.7
 for <xen-devel@lists.xenproject.org>; Tue, 10 Aug 2021 10:03:30 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id x81sm1743220lff.245.2021.08.10.10.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 10:03:28 -0700 (PDT)
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
X-Inumbo-ID: bfdc5560-719f-4237-8d79-84ef8fea4f1c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=faRUuIPg9Z4Z8piSBNv3ntJpdkHk7f4Mg/8pbIgP6wg=;
        b=N1vN04Sy+gzr9bk4qppOwFq/dIK9/sP5oqEWDztJmmRNUVGJt+KyA/lKgsdiDMrWxH
         XUFkN70nqinKdAPTnIsVdLJLTgEa4q7IWjvPwY/t0NqRct3/kfEaSTDINL+ErWUYC1Zv
         ecpFbzkTiJWlkt4b9c+EfB4iZgmdwArJKCxCh8CXrYyptrHsWRq/+cETfZZMa35CmZQF
         FtWvQPjaIa0A85zzjeuChkAY0K6UxPqc1rkA00uR864ZOke//lHB/6bQib54qGVk1NKj
         eUn1rYelOemY6bABU6c5gUk+MRGQt4fJ4Q28Ko1zUjBUNEIdM55EdX3hldZAehp4ISFB
         jqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=faRUuIPg9Z4Z8piSBNv3ntJpdkHk7f4Mg/8pbIgP6wg=;
        b=tOO5eM2Cj+z3xa4DJ39HQTpTTKaXYbRkFLkiCwx48raQYmapKnOi4snHw7U2YHDMmx
         /P+khu4dKNFqrW7RNXROvxAj5ztoT4X1FuCY0lfhlWofX8yNEZ0l7nKEgx4kVr8M620d
         ipJmN9iDjmW2uiCAakEQtM8Fy4iRHaVidxMbb73ObVgupXYjyHzJ7B+nGh63MILS2EyQ
         WhesAO3pH2Ae76X3V+MBgt8BLMCYsDQF2B73vJrOHAIdBEhqWAoRcG5IcWORV4LWwYJR
         +XZ0hgXI0jZboCBpirQLom1mcDmD88M/Y5KX6shOkD3TRwhv9A4Qn6+8NO4Zu3n7uc0G
         L6EQ==
X-Gm-Message-State: AOAM532bfNEAvwk9pPs0z8Y6zPoNnXfueNPtOkG8F7v5VSVaLhpMEGuH
	uVRP2OapkW5gg5aS3tXZ2bY=
X-Google-Smtp-Source: ABdhPJzp2wJLRW+bPUUAi93mZPsoGkhA3N0a8Tb7wiT7/ggkph9qpm8Ufl4ORuIvnu4sDs55i4GoNQ==
X-Received: by 2002:ac2:4569:: with SMTP id k9mr1705227lfm.178.1628615009445;
        Tue, 10 Aug 2021 10:03:29 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
 <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com>
 <5643d414-0b76-74a4-2c37-c7a99338d547@gmail.com>
 <c83378af-4d3b-9256-0e0d-f88c43c6de2f@xen.org>
 <alpine.DEB.2.21.2108051720210.18743@sstabellini-ThinkPad-T480s>
 <6596ad08-8398-64dd-ef62-cd7bc6f7333e@gmail.com>
 <bc576a23-d107-c67d-8dca-62691e5eea1a@xen.org>
 <1d0ea55d-2e5a-daa7-9c60-c7a1c4b48fa1@gmail.com>
 <6947db7a-44d3-eb5f-c93e-1c1b88c62f29@xen.org>
 <736c38b3-0dfa-ccbf-6a6a-6da871f8aca0@gmail.com>
 <4f5be55d-062b-06d2-1e41-bac3ade0cc3a@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f046eaba-d073-7fbb-4f4d-405f34d8ee9c@gmail.com>
Date: Tue, 10 Aug 2021 20:03:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4f5be55d-062b-06d2-1e41-bac3ade0cc3a@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 10.08.21 19:28, Julien Grall wrote:

Hi Julien.

>
>
> On 09/08/2021 22:18, Oleksandr wrote:
>>
>> On 09.08.21 23:45, Julien Grall wrote:
>>
>>
>> Hi Julien
>
>
> Hi Oleksandr,
>
>>> On 09/08/2021 19:24, Oleksandr wrote:
>>>>
>>>> On 09.08.21 18:42, Julien Grall wrote:
>>>> 1. If IOMMU is enabled for Dom0 -> provide holes found in Host DT 
>>>> as safe ranges
>>>>
>>>> I would take into the account holes >= 1MB.
>>>
>>> May I ask why 1MB?
>>
>> Nothing special, just thinking to not bother with small regions which 
>> would not be too useful overall, but could bloat resulting reg property.
>>
>> Anyway, I would be ok with any sizes.
>
> I was more interesting with the reasoning behind your choice rather 
> than saying we want more.
>
> I agree that we may want to skip smaller region. I am guess that an 
> high number of small regions will also increase the bookeeping in Linux.
>
> But I would probably suggest to align the safe region to a 2MB 
> (superpage for 4KB page granularity) just because the backend (or even 
> Xen) may be able to do some optimization there.

OK, agree regarding the alignment. But, what about the size? I assume, 
it should be a multiple of 2MB.


>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


