Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16495A29877
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2025 19:12:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882292.1292451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfjrc-0006eP-JT; Wed, 05 Feb 2025 18:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882292.1292451; Wed, 05 Feb 2025 18:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfjrc-0006c7-Gr; Wed, 05 Feb 2025 18:11:04 +0000
Received: by outflank-mailman (input) for mailman id 882292;
 Wed, 05 Feb 2025 18:11:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KjPr=U4=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tfjrb-0006bx-3p
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2025 18:11:03 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e2e11e5-e3ec-11ef-99a4-01e77a169b0f;
 Wed, 05 Feb 2025 19:11:01 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43618283dedso532865e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Feb 2025 10:11:01 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b57a8sm19737179f8f.61.2025.02.05.10.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 10:10:59 -0800 (PST)
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
X-Inumbo-ID: 8e2e11e5-e3ec-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738779060; x=1739383860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6wtcydVQZupMutRL0JRwISF7OXd17oMzRlS5uxaleE=;
        b=Y1jrL5GF9cM+UcQ3l1Lp+d9gGzSTJmcQwBBzHzjQwGN6wGDQCZlaUufPILu2e7tme1
         2/F9HL9ibM0AkHUATzoSeKeWTBxA4JUCbCpRA8DBgdxL0RdTYoVr7xjNV5AVh4ujmHdn
         aMIGV/KEE3Ij2SN35+mLw05NvzJTT0f9/wmAoBxzJM6aylugQnpiyrGXRohahsFz8y/x
         zkMGDwjWvKl1tnPr5GgydjW5DfNN4RbYrEb9qbPqolx+YG61nOlz1rLf7up9pBGta3Nh
         Xzhke+wQWB2M0oQZqhcaz3e+LBkLb8yhJ1cRjZaY7v1I3JTENs7iSo44sdekshwN/W3k
         8TMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738779060; x=1739383860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6wtcydVQZupMutRL0JRwISF7OXd17oMzRlS5uxaleE=;
        b=eDPwbHfggmjPM1nh1LG6CQJVrBRyg/RYPobhpAcp+3t70qJT3OIUT0d8hFqksAoU3L
         c0KTww57yDtDi4NYj2Gpbx0/FkUfURkRqVe6XDAHadhyJ7mQ7r/zk92x7HgNkKoRNn+X
         5K51btiHb9HZXq8JMZsMJqVSrpNfvXDEeWI5oVtz+KBBH5IyK9yQfZStrJ9sNidBzWws
         MSs7qFwIVqjrLg3qTBnxCk5LDXylAuScv1WBbEZlmMmVgy5vxwySyOSGMOAtTGJ+FGu+
         S7yOOJvJKx9fBnR0z8bOonMDvHOwWxegT6v8cw1lPoUAH5lSPihPt65K8o6XQ+y52THs
         fShA==
X-Forwarded-Encrypted: i=1; AJvYcCU1rPMvb7m/cwtsBgdhb3mQeSGIljgSbvs69JPOM7+ycQvbwHFxvMnLr+3OVDQ7nC7aUYxbW0EYXO8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx1+Mp948L1kwDSDv+XjBfS3bW8vr5LiX0PDXzDh4PKqqlqjXl3
	Nq8hpxFTIx8u4eXJWnR9Xb/lQcmccR/xqIQdo7Um7627RxQb9iJgG1vhnIGPoZQ=
X-Gm-Gg: ASbGncuypayVnlhvml029LiNI5ow88BM+7N+iNUZ2jSkDBxPTJ/hu95WiqDn88tBevm
	6mv7Oj6r/j7Xiw+LkhwYi55p5EKhmwxsk7oiaUwtmaJzOCL3XF30uL3L3O7AZ52VUqOcjtVLHia
	+uXE50xys1h0zB1i0ml3k60ok8Ob9Wht/Sequbh2Mc3nmZf1KiavT3Or5jwIiZ9hJAeAX7KeD0c
	cdMJE/cF6nXK3Mfu5/QW5dMtRvYCsbSbKasIkS84RnBJ4sShMwYKf2//h9ZIxR5NXB3eS2BSgyr
	ugkIdHnC97Jt8uNBAUXuYpZevkkcSVNKVt5GAKYIsSPCUZBOysb4WRJP/Bg=
X-Google-Smtp-Source: AGHT+IFnv0aQDAroYKHV0WlbZak+DYoyNJhn9GfH4RpXovF9yXI8P57n/XQBgNdq18r4PamglUQdNQ==
X-Received: by 2002:a05:600c:1f83:b0:435:d22:9c9e with SMTP id 5b1f17b1804b1-4390d55fda2mr27471935e9.19.1738779060330;
        Wed, 05 Feb 2025 10:11:00 -0800 (PST)
Message-ID: <cc846f3c-ca84-4acf-a4f6-bb1685e91b6c@linaro.org>
Date: Wed, 5 Feb 2025 19:10:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 9/9] hw/xen: Have legacy Xen backend inherit from
 DYNAMIC_SYS_BUS_DEVICE
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Yi Liu <yi.l.liu@intel.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Anthony PERARD <anthony@xenproject.org>,
 Gustavo Romero <gustavo.romero@linaro.org>, Jason Wang
 <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Graf <graf@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alex Williamson <alex.williamson@redhat.com>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
References: <20250125181343.59151-1-philmd@linaro.org>
 <20250125181343.59151-10-philmd@linaro.org>
 <9A2B297A-6270-4482-B1B6-81F518C07C1E@gmail.com>
 <02ea4b41-3594-4ead-90d3-0ab06f2be7fa@linaro.org>
 <685742EB-EDAA-488F-852C-C0AA24BD4721@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <685742EB-EDAA-488F-852C-C0AA24BD4721@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/2/25 00:12, Bernhard Beschow wrote:
> 
> 
> Am 4. Februar 2025 21:25:46 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>> Hi Bernhard,
>>
>> On 27/1/25 10:46, Bernhard Beschow wrote:
>>> Am 25. Januar 2025 18:13:43 UTC schrieb "Philippe Mathieu-Daudé" <philmd@linaro.org>:
>>>> Because the legacy Xen backend devices can optionally be plugged on the
>>>> TYPE_PLATFORM_BUS_DEVICE, have it inherit TYPE_DYNAMIC_SYS_BUS_DEVICE.
>>>> Remove the implicit TYPE_XENSYSDEV instance_size.
>>>>
>>>> Untested, but I'm surprised the legacy devices work because they
>>>> had a broken instance size (QDev instead of Sysbus...), so accesses
>>>> of XenLegacyDevice fields were overwritting sysbus ones.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>>> ---
>>>> include/hw/xen/xen_pvdev.h  | 3 ++-
>>>> hw/xen/xen-legacy-backend.c | 7 ++-----
>>>> 2 files changed, 4 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
>>>> index 0c984440476..48950dc2b57 100644
>>>> --- a/include/hw/xen/xen_pvdev.h
>>>> +++ b/include/hw/xen/xen_pvdev.h
>>>> @@ -32,7 +32,8 @@ struct XenDevOps {
>>>> };
>>>>
>>>> struct XenLegacyDevice {
>>>> -    DeviceState        qdev;
>>>> +    SysBusDevice parent_obj;
>>>
>>> This then needs sysbus.h rather than qdev-core.h include.
>>>
>>> Moreover, the patch in the reply needs to be inserted into the series before this patch.
>>>
>>> Both are needed for the patch to compile.
>>
>> Per your reply on patch #7, might I include your
>>
>> Tested-by: Bernhard Beschow <shentey@gmail.com>
>> Acked-by: Bernhard Beschow <shentey@gmail.com>
>> (or R-b)
> 
> I only did a compile test and I'm not a Xen maintainer, so I guess above tags don't apply. Right?

Indeed, A-b is preferable for maintainers, but its meaning depends.

Xen maintainers have been Cc'ed for 2 weeks. If they report a problem,
we can still revert.


> 
> 
>>
>> squashing:
>>
>> -- >8 --
>> diff --git a/include/hw/xen/xen_pvdev.h b/include/hw/xen/xen_pvdev.h
>> index 48950dc2b57..629bec90d09 100644
>> --- a/include/hw/xen/xen_pvdev.h
>> +++ b/include/hw/xen/xen_pvdev.h
>> @@ -1,7 +1,7 @@
>> #ifndef QEMU_HW_XEN_PVDEV_H
>> #define QEMU_HW_XEN_PVDEV_H
>>
>> -#include "hw/qdev-core.h"
>> +#include "hw/sysbus.h"
>> #include "hw/xen/xen_backend_ops.h"
>>
>> /* ------------------------------------------------------------- */
>> ---
>>
>> ?
> 
> With the squash applied:
> Reviewed-by: Bernhard Beschow <shentey@gmail.com>

Thanks!

