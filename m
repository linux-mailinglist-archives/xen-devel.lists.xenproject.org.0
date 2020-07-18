Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F363224AE2
	for <lists+xen-devel@lfdr.de>; Sat, 18 Jul 2020 13:09:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwkhV-0007Rl-MF; Sat, 18 Jul 2020 11:08:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BrZA=A5=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jwkhU-0007Rg-2T
 for xen-devel@lists.xenproject.org; Sat, 18 Jul 2020 11:08:16 +0000
X-Inumbo-ID: f9fb42cc-c8e6-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9fb42cc-c8e6-11ea-bca7-bc764e2007e4;
 Sat, 18 Jul 2020 11:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gxAXvakRWmFJPHfNrjY/xVHbrDJHm/doqu61Vdar1Pc=; b=v0gHPfXZqNuUwp5/m5u+a7U/e2
 j/KScSJhXDjIepDbsgDMKyn12gPQwLcOThDLzR32yz1UX/l2wkNqH47UJC1SVZPQP3L6oyO1V85wA
 z6zfmLxNrD80nu4y3lr20E/B9zYPboe0Qf/6huCYnIDIlYdWRb5jccFOKdrqFNT0vzG8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwkhR-0003Z6-FG; Sat, 18 Jul 2020 11:08:13 +0000
Received: from cpc91186-cmbg18-2-0-cust22.5-4.cable.virginm.net ([80.1.50.23]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jwkhR-0005P6-8R; Sat, 18 Jul 2020 11:08:13 +0000
Subject: Re: PCI devices passthrough on Arm design proposal
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <8ac91a1b-e6b3-0f2b-0f23-d7aff100936d@xen.org>
 <c7d5a084-8111-9f43-57e1-bcf2bd822f5b@xen.org>
 <865D5A77-85D4-4A88-A228-DDB70BDB3691@arm.com>
 <972c0c81-6595-7c41-baa5-8882f5d1c0ff@xen.org>
 <4E6B793C-2E0A-4999-9842-24CDCDE43903@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <22df2406-c4d3-1d06-0736-51ebea5581ea@xen.org>
Date: Sat, 18 Jul 2020 12:08:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4E6B793C-2E0A-4999-9842-24CDCDE43903@arm.com>
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 17/07/2020 16:47, Bertrand Marquis wrote:
>> On 17 Jul 2020, at 17:26, Julien Grall <julien@xen.org> wrote:
>> On 17/07/2020 15:47, Bertrand Marquis wrote:
>>>>>>      pci=[ "PCI_SPEC_STRING", "PCI_SPEC_STRING", ...]
>>>>>>
>>>>>> Guest will be only able to access the assigned devices and see the bridges. Guest will not be able to access or see the devices that are no assigned to him.
>>>>>>
>>>>>> Limitation:
>>>>>> * As of now all the bridges in the PCI bus are seen by the guest on the VPCI bus.
>>>>> Why do you want to expose all the bridges to a guest? Does this mean that the BDF should always match between the host and the guest?
>>> That’s not really something that we wanted but this was the easiest way to go.
>>> As said in a previous mail we could build a VPCI bus with a completely different topology but I am not sure of the advantages this would have.
>>> Do you see some reason to do this ?
>>
>> Yes :):
>>   1) If a platform has two host controllers (IIRC Thunder-X has it) then you would need to expose two host controllers to your guest. I think this is undesirable if your guest is only using a couple of PCI devices on each host controllers.
>>   2) In the case of migration (live or not), you may want to use a difference PCI card on the target platform. So your BDF and bridges may be different.
>>
>> Therefore I think the virtual topology can be beneficial.
> 
> I would see a big advantage definitely to have only one VPCI bus per guest and put all devices in their independently of the hardware domain the device is on.
> But this will probably make the VPCI BARs value computation a bit more complex as we might end up with no space on the guest physical map for it.
> This might make the implementation a lot more complex.

I am not sure to understand your argument about the space... You should 
be able to find out the size of each BARs, so you can size the MMIO 
window correctly. This shouldn't add a lot of complexity.

I am not asking any implementation for this, but we need to make sure 
the design can easily be extended for other use cases. In the case of 
server, we will likely want to expose a single vPCI to the guest.

>>
>>>>>     - Is there any memory access that can bypassed the IOMMU (e.g doorbell)?
>>> This is still something to be investigated as part of the MSI implementation.
>>> If you have any idea here, feel free to tell us.
>>
>> My memory is a bit fuzzy here. I am sure that the doorbell can bypass the IOMMU on some platform, but I also vaguely remember that accesses to the PCI host controller memory window may also bypass the IOMMU. A good reading might be [2].
>>
>> IIRC, I came to the conclusion that we may want to use the host memory map in the guest when using the PCI passthrough. But maybe not on all the platforms.
> 
> Definitely a lot of this would be easier if could use 1:1 mapping.
> We will keep that in mind when we will start to investigate on the MSI part.

Hmmm... Maybe I wasn't clear enough but the problem is not only 
happening with MSIs doorbells. It is also with the P2P transactions.

Again, I am not asking to implement it at the beginning. However, it 
would be good to outline the potential limitations of the approach in 
your design.

Cheers,


-- 
Julien Grall

