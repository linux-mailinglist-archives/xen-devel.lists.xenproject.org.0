Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4E224415
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 21:18:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwVry-0000dt-Js; Fri, 17 Jul 2020 19:18:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z3hM=A4=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1jwVrx-0000do-PX
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 19:18:05 +0000
X-Inumbo-ID: 3cd7848c-c862-11ea-bb8b-bc764e2007e4
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3cd7848c-c862-11ea-bb8b-bc764e2007e4;
 Fri, 17 Jul 2020 19:18:04 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q7so13948045ljm.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2020 12:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tek3JAtI4UfaW/A2eL59/Ptyl2onTOkEiF9Ywg80Zuo=;
 b=VKwjNyfAi9uBgj3CUaizKB5JJUx2tcZN1Fk+0zawzZus3yOGgg0tbi/nKQqrz2hAkv
 in0kvuki4yIlgO7p/A+NcZg1pwQnbha0oisoRDpzb/QfHdQtu/vBWvduaU9ASEbaAUqd
 aBnEm6AgNwzftUgUARKUDBd5XuXj4nJ9cUCCbOTcZ278Q1G//15XwI0MGdzAXoBJy2aS
 DBxsHpc23POsRihyDXJktwJByJHBqwe0KmwEGvXTYgpt/uox9flmHXYpMl+R55eX/LFY
 gaeLwzbAOwM0V5CnvhugCxTCVcTUr5GNRRJ0LKvkeOvKqcevmvdBLAz/0IfZ2abqqSFg
 VIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=tek3JAtI4UfaW/A2eL59/Ptyl2onTOkEiF9Ywg80Zuo=;
 b=d3eRQtE1J/AWOQUpy3MpTNh3MG54tZQw6rPy88EOiFNoJBI9GopElEafMqZYxRmBMo
 YpT8piiIjEoEscBor8NZKSM3EYQ0ctk0oK5i8ievjwUl3YpOmqEH0jxAEQ3DVWKrmFb0
 MYPtBYPWnTsG1iJmWFdd+vrVSfEa00PzAlOgrGD1WzFAtG/yDmcx0gLi2GQELGxxmGY9
 2H96/k6WZRpA78Exg4gn6UzgJfnW5ABumAXo4y2k7t5T73fnd52lRT+zZbu7ROHEunaN
 I6p3UNNNGPv480SEoEcTSo0PWJeXTpUdIsHLvU4eBvBU7M/P5ErKT/DMyk/HEr+LzXQy
 /UXA==
X-Gm-Message-State: AOAM533BpTuRh/KPDT15jYmTgJbNRyNHQusSxiklkNYPjXsbEfe1I66f
 DYQMqoyWAHMFG4v6FnaMrSc=
X-Google-Smtp-Source: ABdhPJxv5hxAar917ot786jMFqi3vH3DEBw69x47qqM4IJaaFSbuBrXC/nqtm+C2o3fhFffPWoBd6w==
X-Received: by 2002:a2e:8047:: with SMTP id p7mr5353973ljg.414.1595013483480; 
 Fri, 17 Jul 2020 12:18:03 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y22sm1801557ljn.2.2020.07.17.12.18.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 12:18:02 -0700 (PDT)
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <1dd5db2d-98c7-7738-c3d4-d3f098dfe674@suse.com>
 <F09F9354-EC9B-4D76-809B-A25AF4F7D863@arm.com>
 <a5007a6c-bdfe-04d4-8107-53cb222b95e8@suse.com>
 <DA19A9EC-A828-4EBC-BCAA-D1D9E4F222BB@arm.com>
 <20200717144139.GU7191@Air-de-Roger>
 <90AE8DAB-2223-46DC-A263-D78365E5435E@arm.com>
 <20200717150507.GW7191@Air-de-Roger>
 <FBE040A9-D088-43D6-8929-FFEDE9DDDE34@arm.com>
 <20200717153043.GX7191@Air-de-Roger>
 <C5B2BDD5-E504-4871-8542-5BA8C051F699@arm.com>
 <20200717160834.GA7191@Air-de-Roger>
 <0c76b6a0-2242-3bbd-9740-75c5580e93e8@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <1dea1217-f884-0fe1-d339-95c5b473ae23@gmail.com>
Date: Fri, 17 Jul 2020 22:17:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0c76b6a0-2242-3bbd-9740-75c5580e93e8@xen.org>
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
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Julien Grall <julien.grall.oss@gmail.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 17.07.20 19:18, Julien Grall wrote:

Hello Bertrand

[two threads with the same name are shown in my mail client, so not 
completely sure I am asking in the correct one]

>
>
> On 17/07/2020 17:08, Roger Pau Monné wrote:
>> On Fri, Jul 17, 2020 at 03:51:47PM +0000, Bertrand Marquis wrote:
>>>
>>>
>>>> On 17 Jul 2020, at 17:30, Roger Pau Monné <roger.pau@citrix.com> 
>>>> wrote:
>>>>
>>>> On Fri, Jul 17, 2020 at 03:23:57PM +0000, Bertrand Marquis wrote:
>>>>>
>>>>>
>>>>>> On 17 Jul 2020, at 17:05, Roger Pau Monné <roger.pau@citrix.com> 
>>>>>> wrote:
>>>>>>
>>>>>> On Fri, Jul 17, 2020 at 02:49:20PM +0000, Bertrand Marquis wrote:
>>>>>>>
>>>>>>>
>>>>>>>> On 17 Jul 2020, at 16:41, Roger Pau Monné 
>>>>>>>> <roger.pau@citrix.com> wrote:
>>>>>>>>
>>>>>>>> On Fri, Jul 17, 2020 at 02:34:55PM +0000, Bertrand Marquis wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>> On 17 Jul 2020, at 16:06, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>>>
>>>>>>>>>> On 17.07.2020 15:59, Bertrand Marquis wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> On 17 Jul 2020, at 15:19, Jan Beulich <jbeulich@suse.com> 
>>>>>>>>>>>> wrote:
>>>>>>>>>>>>
>>>>>>>>>>>> On 17.07.2020 15:14, Bertrand Marquis wrote:
>>>>>>>>>>>>>> On 17 Jul 2020, at 10:10, Jan Beulich <jbeulich@suse.com> 
>>>>>>>>>>>>>> wrote:
>>>>>>>>>>>>>> On 16.07.2020 19:10, Rahul Singh wrote:
>>>>>>>>>>>>>>> # Emulated PCI device tree node in libxl:
>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> Libxl is creating a virtual PCI device tree node in the 
>>>>>>>>>>>>>>> device tree to enable the guest OS to discover the 
>>>>>>>>>>>>>>> virtual PCI during guest boot. We introduced the new 
>>>>>>>>>>>>>>> config option [vpci="pci_ecam"] for guests. When this 
>>>>>>>>>>>>>>> config option is enabled in a guest configuration, a PCI 
>>>>>>>>>>>>>>> device tree node will be created in the guest device tree.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> I support Stefano's suggestion for this to be an optional 
>>>>>>>>>>>>>> thing, i.e.
>>>>>>>>>>>>>> there to be no need for it when there are PCI devices 
>>>>>>>>>>>>>> assigned to the
>>>>>>>>>>>>>> guest anyway. I also wonder about the pci_ prefix here - 
>>>>>>>>>>>>>> isn't
>>>>>>>>>>>>>> vpci="ecam" as unambiguous?
>>>>>>>>>>>>>
>>>>>>>>>>>>> This could be a problem as we need to know that this is 
>>>>>>>>>>>>> required for a guest upfront so that PCI devices can be 
>>>>>>>>>>>>> assigned after using xl.
>>>>>>>>>>>>
>>>>>>>>>>>> I'm afraid I don't understand: When there are no PCI device 
>>>>>>>>>>>> that get
>>>>>>>>>>>> handed to a guest when it gets created, but it is supposed 
>>>>>>>>>>>> to be able
>>>>>>>>>>>> to have some assigned while already running, then we agree 
>>>>>>>>>>>> the option
>>>>>>>>>>>> is needed (afaict). When PCI devices get handed to the 
>>>>>>>>>>>> guest while it
>>>>>>>>>>>> gets constructed, where's the problem to infer this option 
>>>>>>>>>>>> from the
>>>>>>>>>>>> presence of PCI devices in the guest configuration?
>>>>>>>>>>>
>>>>>>>>>>> If the user wants to use xl pci-attach to attach in runtime 
>>>>>>>>>>> a device to a guest, this guest must have a VPCI bus (even 
>>>>>>>>>>> with no devices).
>>>>>>>>>>> If we do not have the vpci parameter in the configuration 
>>>>>>>>>>> this use case will not work anymore.
>>>>>>>>>>
>>>>>>>>>> That's what everyone looks to agree with. Yet why is the 
>>>>>>>>>> parameter needed
>>>>>>>>>> when there _are_ PCI devices anyway? That's the "optional" 
>>>>>>>>>> that Stefano
>>>>>>>>>> was suggesting, aiui.
>>>>>>>>>
>>>>>>>>> I agree in this case the parameter could be optional and only 
>>>>>>>>> required if not PCI device is assigned directly in the guest 
>>>>>>>>> configuration.
>>>>>>>>
>>>>>>>> Where will the ECAM region(s) appear on the guest physmap?
>>>>>>>>
>>>>>>>> Are you going to re-use the same locations as on the physical
>>>>>>>> hardware, or will they appear somewhere else?
>>>>>>>
>>>>>>> We will add some new definitions for the ECAM regions in the 
>>>>>>> guest physmap declared in xen (include/asm-arm/config.h)
>>>>>>
>>>>>> I think I'm confused, but that file doesn't contain anything related
>>>>>> to the guest physmap, that's the Xen virtual memory layout on Arm
>>>>>> AFAICT?
>>>>>>
>>>>>> Does this somehow relate to the physical memory map exposed to 
>>>>>> guests
>>>>>> on Arm?
>>>>>
>>>>> Yes it does.
>>>>> We will add new definitions there related to VPCI to reserve some 
>>>>> areas for the VPCI ECAM and the IOMEM areas.
>>>>
>>>> Yes, that's completely fine and is what's done on x86, but again I
>>>> feel like I'm lost here, this is the Xen virtual memory map, how does
>>>> this relate to the guest physical memory map?
>>>
>>> Sorry my bad, we will add values in include/public/arch-arm.h, wrong 
>>> header :-)
>>
>> Oh right, now I see it :).
>>
>> Do you really need to specify the ECAM and MMIO regions there?
>
> You need to define those values somewhere :). The layout is only 
> shared between the tools and the hypervisor. I think it would be 
> better if they are defined at the same place as the rest of the 
> layout, so it is easier to rework the layout.
>
> Cheers,


I would like to clarify regarding an IOMMU driver changes which should 
be done to support PCI pass-through properly.

Design document mentions about SMMU, but Xen also supports IPMMU-VMSA 
(under tech preview now). It would be really nice if the required 
support is extended to that kind of IOMMU as well.

May I clarify what should be implemented in the Xen driver in order to 
support PCI pass-through feature on Arm? Should the IOMMU H/W be 
"PCI-aware" for that purpose?


-- 
Regards,

Oleksandr Tyshchenko


