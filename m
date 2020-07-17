Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 825C6224076
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 18:19:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwT4Y-0001p3-9v; Fri, 17 Jul 2020 16:18:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/fKj=A4=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwT4W-0001oy-Ek
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 16:18:52 +0000
X-Inumbo-ID: 33574c62-c849-11ea-963e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 33574c62-c849-11ea-963e-12813bfff9fa;
 Fri, 17 Jul 2020 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=S8jfqjewAatkauV6GT2D9rqDr4BRXjpOEBtBAsaqiJc=; b=5vJyeCuaiV5NkiFElEhPVc0YiG
 PMnLH8z2ARAK1uPxxxDToSbbtCEYc8oEpBgTNjkz/SpOWFrF9+LT3u82Jl6twXn8JqR32Nq7Z37Bc
 cTDbItooEYV+1f/xXCRGyBe92DcJo4O6zYijp8fpyp/ju8zliRLxSDBg9JhzQ0ShJN74=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwT4T-0002Jr-MA; Fri, 17 Jul 2020 16:18:49 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwT4T-0008Bh-8f; Fri, 17 Jul 2020 16:18:49 +0000
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
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
From: Julien Grall <julien@xen.org>
Message-ID: <0c76b6a0-2242-3bbd-9740-75c5580e93e8@xen.org>
Date: Fri, 17 Jul 2020 17:18:46 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717160834.GA7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 17/07/2020 17:08, Roger Pau Monné wrote:
> On Fri, Jul 17, 2020 at 03:51:47PM +0000, Bertrand Marquis wrote:
>>
>>
>>> On 17 Jul 2020, at 17:30, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>
>>> On Fri, Jul 17, 2020 at 03:23:57PM +0000, Bertrand Marquis wrote:
>>>>
>>>>
>>>>> On 17 Jul 2020, at 17:05, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>>
>>>>> On Fri, Jul 17, 2020 at 02:49:20PM +0000, Bertrand Marquis wrote:
>>>>>>
>>>>>>
>>>>>>> On 17 Jul 2020, at 16:41, Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>>>>
>>>>>>> On Fri, Jul 17, 2020 at 02:34:55PM +0000, Bertrand Marquis wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>> On 17 Jul 2020, at 16:06, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>>
>>>>>>>>> On 17.07.2020 15:59, Bertrand Marquis wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> On 17 Jul 2020, at 15:19, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> On 17.07.2020 15:14, Bertrand Marquis wrote:
>>>>>>>>>>>>> On 17 Jul 2020, at 10:10, Jan Beulich <jbeulich@suse.com> wrote:
>>>>>>>>>>>>> On 16.07.2020 19:10, Rahul Singh wrote:
>>>>>>>>>>>>>> # Emulated PCI device tree node in libxl:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> Libxl is creating a virtual PCI device tree node in the device tree to enable the guest OS to discover the virtual PCI during guest boot. We introduced the new config option [vpci="pci_ecam"] for guests. When this config option is enabled in a guest configuration, a PCI device tree node will be created in the guest device tree.
>>>>>>>>>>>>>
>>>>>>>>>>>>> I support Stefano's suggestion for this to be an optional thing, i.e.
>>>>>>>>>>>>> there to be no need for it when there are PCI devices assigned to the
>>>>>>>>>>>>> guest anyway. I also wonder about the pci_ prefix here - isn't
>>>>>>>>>>>>> vpci="ecam" as unambiguous?
>>>>>>>>>>>>
>>>>>>>>>>>> This could be a problem as we need to know that this is required for a guest upfront so that PCI devices can be assigned after using xl.
>>>>>>>>>>>
>>>>>>>>>>> I'm afraid I don't understand: When there are no PCI device that get
>>>>>>>>>>> handed to a guest when it gets created, but it is supposed to be able
>>>>>>>>>>> to have some assigned while already running, then we agree the option
>>>>>>>>>>> is needed (afaict). When PCI devices get handed to the guest while it
>>>>>>>>>>> gets constructed, where's the problem to infer this option from the
>>>>>>>>>>> presence of PCI devices in the guest configuration?
>>>>>>>>>>
>>>>>>>>>> If the user wants to use xl pci-attach to attach in runtime a device to a guest, this guest must have a VPCI bus (even with no devices).
>>>>>>>>>> If we do not have the vpci parameter in the configuration this use case will not work anymore.
>>>>>>>>>
>>>>>>>>> That's what everyone looks to agree with. Yet why is the parameter needed
>>>>>>>>> when there _are_ PCI devices anyway? That's the "optional" that Stefano
>>>>>>>>> was suggesting, aiui.
>>>>>>>>
>>>>>>>> I agree in this case the parameter could be optional and only required if not PCI device is assigned directly in the guest configuration.
>>>>>>>
>>>>>>> Where will the ECAM region(s) appear on the guest physmap?
>>>>>>>
>>>>>>> Are you going to re-use the same locations as on the physical
>>>>>>> hardware, or will they appear somewhere else?
>>>>>>
>>>>>> We will add some new definitions for the ECAM regions in the guest physmap declared in xen (include/asm-arm/config.h)
>>>>>
>>>>> I think I'm confused, but that file doesn't contain anything related
>>>>> to the guest physmap, that's the Xen virtual memory layout on Arm
>>>>> AFAICT?
>>>>>
>>>>> Does this somehow relate to the physical memory map exposed to guests
>>>>> on Arm?
>>>>
>>>> Yes it does.
>>>> We will add new definitions there related to VPCI to reserve some areas for the VPCI ECAM and the IOMEM areas.
>>>
>>> Yes, that's completely fine and is what's done on x86, but again I
>>> feel like I'm lost here, this is the Xen virtual memory map, how does
>>> this relate to the guest physical memory map?
>>
>> Sorry my bad, we will add values in include/public/arch-arm.h, wrong header :-)
> 
> Oh right, now I see it :).
> 
> Do you really need to specify the ECAM and MMIO regions there?

You need to define those values somewhere :). The layout is only shared 
between the tools and the hypervisor. I think it would be better if they 
are defined at the same place as the rest of the layout, so it is easier 
to rework the layout.

Cheers,

-- 
Julien Grall

