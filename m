Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6890D612C85
	for <lists+xen-devel@lfdr.de>; Sun, 30 Oct 2022 20:58:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.432606.685290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opEQi-0007cl-DI; Sun, 30 Oct 2022 19:57:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432606.685290; Sun, 30 Oct 2022 19:57:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opEQi-0007aV-Ac; Sun, 30 Oct 2022 19:57:12 +0000
Received: by outflank-mailman (input) for mailman id 432606;
 Sun, 30 Oct 2022 19:57:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1opEQg-0007aP-RX
 for xen-devel@lists.xenproject.org; Sun, 30 Oct 2022 19:57:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1opEQg-0000Sy-58; Sun, 30 Oct 2022 19:57:10 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1opEQf-0004En-SE; Sun, 30 Oct 2022 19:57:10 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=LrfQUR1ESsIiExLE9T71EUICjGNZbStHapp0Prm9lKA=; b=qSIV31L3tZZfhyy/5ReNuiXwrs
	w9FMq75V627PzdXT99j2d29JTTZ97rc1TOZJ2CbTtqBjHUo1ACCLpfQjsOqL7huZhFcGDkpwsoMTQ
	/JOayCVUfuP+XxvIqryCpB58ziN0w+2NIdA2hyjsWJAyhlbaa3v2r0exzHcSPKpVwdqk=;
Message-ID: <82c45bc1-6052-502b-3007-8a16fbd1d433@xen.org>
Date: Sun, 30 Oct 2022 19:57:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Michal Orzel <Michal.Orzel@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
 <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org>
 <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org>
 <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
 <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
 <34B31FA6-72D8-4F03-AC94-3DC795D0FF55@arm.com>
 <222ed837-594d-6301-edec-6f9d26e1fadf@xen.org>
 <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
In-Reply-To: <alpine.DEB.2.22.394.2210301523450.3408@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 30/10/2022 14:23, Stefano Stabellini wrote:
> On Fri, 28 Oct 2022, Julien Grall wrote:
>> On 28/10/2022 14:13, Bertrand Marquis wrote:
>>>> On 28 Oct 2022, at 14:06, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi Rahul,
>>>>
>>>> On 28/10/2022 13:54, Rahul Singh wrote:
>>>>>>>>>> For ACPI, I would have expected the information to be found in
>>>>>>>>>> the IOREQ.
>>>>>>>>>>
>>>>>>>>>> So can you add more context why this is necessary for
>>>>>>>>>> everyone?
>>>>>>>>> We have information for IOMMU and Master-ID but we don’t have
>>>>>>>>> information for linking vMaster-ID to pMaster-ID.
>>>>>>>>
>>>>>>>> I am confused. Below, you are making the virtual master ID
>>>>>>>> optional. So shouldn't this be mandatory if you really need the
>>>>>>>> mapping with the virtual ID?
>>>>>>> vMasterID is optional if user knows pMasterID is unique on the
>>>>>>> system. But if pMasterId is not unique then user needs to provide
>>>>>>> the vMasterID.
>>>>>>
>>>>>> So the expectation is the user will be able to know that the pMasterID
>>>>>> is uniq. This may be easy with a couple of SMMUs, but if you have 50+
>>>>>> (as suggested above). This will become a pain on larger system.
>>>>>>
>>>>>> IHMO, it would be much better if we can detect that in libxl (see
>>>>>> below).
>>>>> We can make the vMasterID compulsory to avoid complexity in libxl to
>>>>> solve this
>>>>
>>>> In general, complexity in libxl is not too much of problem.
> 
> I agree with this and also I agree with Julien's other statement:
> 
> "I am strongly in favor of libxl to modify it if it greatly improves the
> user experience."
> 
> I am always in favor of reducing complexity for the user as they
> typically can't deal with tricky details such as MasterIDs. In general,
> I think we need more automation with our tooling.
> 
> However, it might not be as simple as adding support for automatically
> generating IDs in libxl because we have 2 additional cases to support:
> 1) dom0less
> 2) statically built guests
> 
> For 1) we would need the same support also in Xen? Which means more
> complexity in Xen.
Xen will need to parse the device-tree to find the mapping. So I am not 
entirely convinced there will be more complexity needed other than 
requiring a bitmap to know which vMasterID has been allocated.

That said, you would still need one to validate the input provided by 
the user. So overall maybe there will be no added complexity?

> 
> 2) are guests like Zephyr that consume a device tree at
> build time instead of runtime. These guests are built specifically for a
> given environment and it is not a problem to rebuild them for every Xen
> release.
> 
> However I think it is going to be a problem if we have to run libxl to
> get the device tree needed for the Zephyr build. That is because it
> means that the Zephyr build system would have to learn how to compile
> (or crosscompile) libxl in order to retrieve the data needed for its
> input. Even for systems based on Yocto (Yocto already knows how to build
> libxl) would cause issues because of internal dependencies this would
> introduce.

That would not be very different to how this works today for Zephyr. 
They need libxl to generate the guest DT.

That said, I agree this is a bit of a pain...

> 
> So I think the automatic generation might be best done in another tool.
It sounds like what you want is creating something similar to libacpi 
but for Device-Tree. That should work with some caveats.

> 
> I think we need something like a script that takes a partial device tree
> as input and provides a more detailed partial device tree as output with
> the generated IDs.

AFAICT, having the partial device-tree is not enough. You also need the 
real DT to figure out the pMaster-ID.

> 
> If we did it that way, we could call the script from libxl, but also we
> could call it separately from ImageBuilder for dom0less and Zephyr/Yocto
> could also call it.
> 
> Basically we make it easier for everyone to use it. The only price to
> pay is that it will be a bit less efficient for xl guests (one more
> script to fork and exec) but I think is a good compromise.

We would need an hypercall to retrieve the host Device-Tree. But that 
would not be too difficult to add.

[...]

> 
> I think this is a great idea, I only suggest that we move the automatic
> generation out of libxl (a separate stand-alone script), in another
> place that can be more easily reused by multiple projects and different
> use-cases.

If we use the concept of libacpi, we may not need a to have a 
stand-alone script. It could directly linked in libxl or any other tools.

Cheers,

-- 
Julien Grall

