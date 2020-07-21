Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A332281AB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 16:10:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxsxX-0001ZS-A0; Tue, 21 Jul 2020 14:09:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GCg/=BA=linaro.org=alex.bennee@srs-us1.protection.inumbo.net>)
 id 1jxsxW-0001ZN-8f
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 14:09:30 +0000
X-Inumbo-ID: ca0fee43-cb5b-11ea-8527-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca0fee43-cb5b-11ea-8527-bc764e2007e4;
 Tue, 21 Jul 2020 14:09:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y3so4001615wrl.4
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 07:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=r0HmWCt4nxblC25GgHh9UAjjMnHc5Kaa2vfETZQ0jtY=;
 b=ZiPQdq0NiKf4KpFSUl36kX1FqYOz9aKk5UACfGo2BMMjG+UsCczan7gvWlr5pV4kHC
 94rxAbUqsyRUgFwoL3iO4C3zgH3wLB+asOliu434CI4qug3w64LMQlfpTitPHHrhKvU/
 sgnpfLJAS2H/HLGZyoDy9GNQs0S8k+Im9zoT9if5xU5i8jP5BNIOENPugA42YWrQJ1Bg
 4pCRW4B4nmDu2oOmHmq30kOkkTh3o6U3svDVULV4Lo6F2F7lnWgbYwcH8h4gHvAvY4BI
 l+PzIyYy2Vq4gDC+D3I1fJvWewq0Cy4I/22NrHTJLjtIhm7CHb3e/KSG+yqkexrtZYbv
 8i4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=r0HmWCt4nxblC25GgHh9UAjjMnHc5Kaa2vfETZQ0jtY=;
 b=MIfnLB2lNrATYppJOd+6rhrVjMT23RLjcHCrFUTwpPq9Bs/P5CJw6sp+w0mrPJITJm
 kUtlVWzQNkcT7himwxFNCQOAZyTU/qthOwhBsQQkaU33YrAZIp/qbS4gqLP/rcpG0k/I
 qGuIbmSJ3VcvF1fbojRfP8SMxL+Iv+mzG7M1M5UTP8j89w7Kza9KESHsmtiUuoQX1VBo
 cXcxAprX3p79YIt+xgEeqQ0AZfhOSaNY1vrRY8m2vO5/Wpcbu7Y6YyIwoFLbgQjRo25R
 gxQbv0bi7jgshPPGq/Vs6nUtlU1MxkUnLZ/+ctsH3f5xrxgN7uv+QgUpgxEikKQY64DY
 /WiQ==
X-Gm-Message-State: AOAM530Yn0BfhtydPX85a6F8P7+0I+JVR03ch2RwyDKaFKrbHuguhEHZ
 m6BH8g6M1BEWeoOHQ8j8vrGYTQ==
X-Google-Smtp-Source: ABdhPJz5RN1uk8UtJcFycycR+/K00IxcTYZ65Bwe7K/G0ZOQka56MWGo8j8bvWCDGNuzincfUXDw7w==
X-Received: by 2002:adf:bb14:: with SMTP id r20mr12296049wrg.366.1595340568432; 
 Tue, 21 Jul 2020 07:09:28 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c24sm12681373wrb.11.2020.07.21.07.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 07:09:27 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 07C161FF7E;
 Tue, 21 Jul 2020 15:09:25 +0100 (BST)
References: <CAPD2p-nthLq5NaU32u8pVaa-ub=a9-LOPenupntTYdS-cu31jQ@mail.gmail.com>
 <20200717150039.GV7191@Air-de-Roger>
 <8f4e0c0d-b3d4-9dd3-ce20-639539321968@gmail.com>
 <20200720091722.GF7191@Air-de-Roger>
 <10eaec62-2c48-52ae-d113-1681c87e3d59@xen.org>
 <20200720102023.GH7191@Air-de-Roger>
 <alpine.DEB.2.21.2007201322060.32544@sstabellini-ThinkPad-T480s>
 <390f3a67-5ca5-d9bd-f13a-2c5920bad45a@xen.org>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Grall <julien@xen.org>
Subject: Re: Virtio in Xen on Arm (based on IOREQ concept)
In-reply-to: <390f3a67-5ca5-d9bd-f13a-2c5920bad45a@xen.org>
Date: Tue, 21 Jul 2020 15:09:24 +0100
Message-ID: <87mu3tufhn.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr <olekstysh@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?Q?Monn?= =?utf-8?Q?=C3=A9?= <roger.pau@citrix.com>,
 Artem Mygaiev <joculator@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


Julien Grall <julien@xen.org> writes:

> Hi Stefano,
>
> On 20/07/2020 21:37, Stefano Stabellini wrote:
>> On Mon, 20 Jul 2020, Roger Pau Monn=C3=A9 wrote:
>>> On Mon, Jul 20, 2020 at 10:40:40AM +0100, Julien Grall wrote:
>>>>
>>>>
>>>> On 20/07/2020 10:17, Roger Pau Monn=C3=A9 wrote:
>>>>> On Fri, Jul 17, 2020 at 09:34:14PM +0300, Oleksandr wrote:
>>>>>> On 17.07.20 18:00, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Fri, Jul 17, 2020 at 05:11:02PM +0300, Oleksandr Tyshchenko wrot=
e:
>>>>>>> Do you have any plans to try to upstream a modification to the Virt=
IO
>>>>>>> spec so that grants (ie: abstract references to memory addresses) c=
an
>>>>>>> be used on the VirtIO ring?
>>>>>>
>>>>>> But VirtIO spec hasn't been modified as well as VirtIO infrastructur=
e in the
>>>>>> guest. Nothing to upsteam)
>>>>>
>>>>> OK, so there's no intention to add grants (or a similar interface) to
>>>>> the spec?
>>>>>
>>>>> I understand that you want to support unmodified VirtIO frontends, but
>>>>> I also think that long term frontends could negotiate with backends on
>>>>> the usage of grants in the shared ring, like any other VirtIO feature
>>>>> negotiated between the frontend and the backend.
>>>>>
>>>>> This of course needs to be on the spec first before we can start
>>>>> implementing it, and hence my question whether a modification to the
>>>>> spec in order to add grants has been considered.
>>>> The problem is not really the specification but the adoption in the
>>>> ecosystem. A protocol based on grant-tables would mostly only be used =
by Xen
>>>> therefore:
>>>>     - It may be difficult to convince a proprietary OS vendor to invest
>>>> resource on implementing the protocol
>>>>     - It would be more difficult to move in/out of Xen ecosystem.
>>>>
>>>> Both, may slow the adoption of Xen in some areas.
>>>
>>> Right, just to be clear my suggestion wasn't to force the usage of
>>> grants, but whether adding something along this lines was in the
>>> roadmap, see below.
>>>
>>>> If one is interested in security, then it would be better to work with=
 the
>>>> other interested parties. I think it would be possible to use a virtual
>>>> IOMMU for this purpose.
>>>
>>> Yes, I've also heard rumors about using the (I assume VirtIO) IOMMU in
>>> order to protect what backends can map. This seems like a fine idea,
>>> and would allow us to gain the lost security without having to do the
>>> whole work ourselves.
>>>
>>> Do you know if there's anything published about this? I'm curious
>>> about how and where in the system the VirtIO IOMMU is/should be
>>> implemented.
>>=20
>> Not yet (as far as I know), but we have just started some discussons on
>> this topic within Linaro.
>>=20
>>=20
>> You should also be aware that there is another proposal based on
>> pre-shared-memory and memcpys to solve the virtio security issue:
>>=20
>> https://marc.info/?l=3Dlinux-kernel&m=3D158807398403549
>>=20
>> It would be certainly slower than the "virtio IOMMU" solution but it
>> would take far less time to develop and could work as a short-term
>> stop-gap.
>
> I don't think I agree with this blank statement. In the case of "virtio=20
> IOMMU", you would need to potentially map/unmap pages every request=20
> which would result to a lot of back and forth to the hypervisor.

Can a virtio-iommu just set bounds when a device is initialised as to
where memory will be in the kernel address space?

> So it may turn out that pre-shared-memory may be faster on some setup.

Certainly having to update the page permissions every transaction is
going to be to slow for soemthing that wants to avoid the performance
penalty of a bounce buffer.

--=20
Alex Benn=C3=A9e

