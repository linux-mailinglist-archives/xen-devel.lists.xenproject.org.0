Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1658B38A5
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 15:39:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712806.1113652 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Lmb-0002XM-Mk; Fri, 26 Apr 2024 13:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712806.1113652; Fri, 26 Apr 2024 13:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Lmb-0002Vl-J3; Fri, 26 Apr 2024 13:38:33 +0000
Received: by outflank-mailman (input) for mailman id 712806;
 Fri, 26 Apr 2024 13:38:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFjt=L7=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1s0Lma-0002Vf-Gn
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 13:38:32 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44a635cb-03d2-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 15:38:30 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a5200afe39eso242720466b.1
 for <xen-devel@lists.xenproject.org>; Fri, 26 Apr 2024 06:38:30 -0700 (PDT)
Received: from [192.168.69.100] (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 u14-20020a170906b10e00b00a5534758ef7sm10761888ejy.148.2024.04.26.06.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Apr 2024 06:38:29 -0700 (PDT)
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
X-Inumbo-ID: 44a635cb-03d2-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714138710; x=1714743510; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KtqpQh7Tri6+vPBLqrWX47scPgjtZh6qIkOl5hEiGKA=;
        b=fNj992Wv+7HJ9p/MuFLioLIyuHBVsMc2blQA7gF/S/J+xjime4BxwT3m0ZmST3qfaj
         QdZcU9N1wsjDA/fMP6GUeCzR9RlgJaDhdo5XjbPPCC+ch4lf38dVFyXAIzs8KLUrldi0
         JHD8zUDRYqQEdLv6fOJNw30qzswT1PVzIKgdGFvraX09SO3izzCCAUMwPcP2czEybGwL
         yWqRTU19yEC5LaTbGBIezkie1W2TuRdVI/7zWV4rNTebhKUR4PKigTmP4gIFnQPvV34/
         8riIQ9R73tZviJihEnqBnfD2QXMFE8j+Iz+Lj1T55xXqOAwCZORcF1ll1OI92bGszcpa
         ps3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714138710; x=1714743510;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KtqpQh7Tri6+vPBLqrWX47scPgjtZh6qIkOl5hEiGKA=;
        b=rcmJccWlNoISV1gv7USEuPdpTee0J/wwPtDqAO4oSMmKuPKUsqZ5fFeACgp205HmT1
         UbBKV2sRFnFB2AfpTXTjhO89WkfzkmuzvaBBRQytiqB/cq2tHrx5f9t2WEyWWbsHvyMK
         nsQ/s5Li9o5s1rxCWdT0GZMmOhP4RYnlZY+zq6x8ctwPOJX8vuQUA3eYEOItuzNvsG+T
         P+U2XLqemAllRx6WT6URXIhAWizjuntcB+p3ko+an9zuvRpB/wwYUPo6D99R0WUKj3Fx
         wVwgEg6gTg47XlLRj5OrqaLpSVlfMHdzk24wIbjX58rPqDL76esHJSryZUOBIR+UNfI1
         wcrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu7UVei+0l7QAiAs04zRhl0eiiIrUcua09e1VwcsZZsXqSqD9M0XkLrXeGfHdN5Kb7ED83OyV+eM+HpoupWcK3r8jpH3JGVZ7tFIaKzyI=
X-Gm-Message-State: AOJu0YxFIE4zK+KOOWXz8E3pomnQRKs3xUhCpCMS8u9nt+XjqhiXS/Lq
	VB4hUCY5wfkL7auGyrYMQ1qgyOsIfp6M1GGlguuPac0RXVxl7NIC48J6Hyz/2Pg=
X-Google-Smtp-Source: AGHT+IErcD2rDt7Z7nFGex9tvEZYhoYxMvkKlVwxWn3wreLNR2jKgLJ53cWUCG2DV3XAm3yBzJ8gug==
X-Received: by 2002:a17:906:244d:b0:a58:8827:6765 with SMTP id a13-20020a170906244d00b00a5888276765mr2221480ejb.67.1714138709613;
        Fri, 26 Apr 2024 06:38:29 -0700 (PDT)
Message-ID: <e2fb1d51-b5a6-4c25-a9af-af1e1ed42475@linaro.org>
Date: Fri, 26 Apr 2024 15:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] net: Provide MemReentrancyGuard * to
 qemu_new_nic()
To: Akihiko Odaki <akihiko.odaki@daynix.com>, Thomas Huth
 <th.huth@posteo.de>, Prasad Pandit <pj.pandit@yahoo.in>,
 Mauro Matteo Cascella <mcascell@redhat.com>
Cc: Alexander Bulekov <alxndr@bu.edu>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>, Sriram Yagnaraman
 <sriram.yagnaraman@est.tech>, Thomas Huth <huth@tuxfamily.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Jan Kiszka <jan.kiszka@web.de>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Sven Schnelle <svens@stackframe.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Rob Herring <robh@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20230601031859.7115-1-akihiko.odaki@daynix.com>
 <20230601031859.7115-2-akihiko.odaki@daynix.com>
 <ac66952e-4281-4250-96f4-dc3d5b518d24@linaro.org>
 <1497808863.2030924.1713955286878@mail.yahoo.com>
 <088ec61c-39ab-4b58-a02f-8897a3e7ae68@posteo.de>
 <81397221-8144-47cd-bce9-b3ab7d94c626@daynix.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <81397221-8144-47cd-bce9-b3ab7d94c626@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/4/24 14:37, Akihiko Odaki wrote:
> On 2024/04/24 21:32, Thomas Huth wrote:
>> On 24/04/2024 12.41, Prasad Pandit wrote:
>>> On Wednesday, 24 April, 2024 at 03:36:01 pm IST, Philippe 
>>> Mathieu-Daudé wrote:
>>>> On 1/6/23 05:18, Akihiko Odaki wrote:
>>>>> Recently MemReentrancyGuard was added to DeviceState to record that 
>>>>> the
>>>>> device is engaging in I/O. The network device backend needs to 
>>>>> update it
>>>>> when delivering a packet to a device.
>>>>> In preparation for such a change, add MemReentrancyGuard * as a
>>>>> parameter of qemu_new_nic().
>>>>
>>>> An user on IRC asked if this patch is related/fixing CVE-2021-20255,
>>>> any clue?
>>>
>>> * CVE-2021-20255 bug: infinite recursion is pointing at a different 
>>> fix patch.
>>>    -> https://bugzilla.redhat.com/show_bug.cgi?id=CVE-2021-20255
>>>
>>> * And the this patch below has different issue tagged
>>> -> https://lists.nongnu.org/archive/html/qemu-devel/2023-05/msg08312.html
>>>    Fixes: CVE-2023-3019
>>>
>>>
>>> * They look different, former is an infinite recursion issue and the 
>>> latter is a use-after-free one.
>>
>> I assume the eepro reentrancy issue has been fixed with:
>>
>>   https://gitlab.com/qemu-project/qemu/-/issues/556
>>   i.e.:
>>   https://gitlab.com/qemu-project/qemu/-/commit/c40ca2301c7603524eaddb5308a3
> 
> I agree. Commit c40ca2301c7603524eaddb5308a3 should be what fixed 
> CVE-2021-20255, not this patch.

Thank you all for clarifying!


