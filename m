Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6232227F07E
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 19:27:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.842.2883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNfrK-0002jQ-FJ; Wed, 30 Sep 2020 17:25:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842.2883; Wed, 30 Sep 2020 17:25:42 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNfrK-0002j1-BK; Wed, 30 Sep 2020 17:25:42 +0000
Received: by outflank-mailman (input) for mailman id 842;
 Wed, 30 Sep 2020 17:25:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QbLX=DH=intel.com=megha.dey@srs-us1.protection.inumbo.net>)
 id 1kNfrJ-0002iw-DU
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:25:41 +0000
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e13bcb49-81d4-446f-9066-8d40b0b0a597;
 Wed, 30 Sep 2020 17:25:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 10:25:37 -0700
Received: from meghadey-mobl1.amr.corp.intel.com (HELO [10.255.88.197])
 ([10.255.88.197])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 10:25:34 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=QbLX=DH=intel.com=megha.dey@srs-us1.protection.inumbo.net>)
	id 1kNfrJ-0002iw-DU
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:25:41 +0000
X-Inumbo-ID: e13bcb49-81d4-446f-9066-8d40b0b0a597
Received: from mga07.intel.com (unknown [134.134.136.100])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id e13bcb49-81d4-446f-9066-8d40b0b0a597;
	Wed, 30 Sep 2020 17:25:38 +0000 (UTC)
IronPort-SDR: HPyi72M7AG96ZjFiovG6yatAXWEv8uIjuKYeVkSvFajUvSQHV6lsnJJFxqGz5/dY6ify+uH4vN
 BKu6t/dVgAfw==
X-IronPort-AV: E=McAfee;i="6000,8403,9760"; a="226643451"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="226643451"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 10:25:37 -0700
IronPort-SDR: FK7/wIJBisXTMuj6iqUnpiUpF0sHZmEXgWujctvoBj/uFfZp+PCakKD8gDd4Smm5TFBZfQyr6i
 CR1IGgnmqLIQ==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="308240091"
Received: from meghadey-mobl1.amr.corp.intel.com (HELO [10.255.88.197]) ([10.255.88.197])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 10:25:34 -0700
Subject: Re: [patch V2 00/46] x86, PCI, XEN, genirq ...: Prepare for device
 MSI
To: Thomas Gleixner <tglx@linutronix.de>, Jason Gunthorpe <jgg@nvidia.com>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Lu Baolu
 <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 ravi.v.shankar@intel.com
References: <20200826111628.794979401@linutronix.de>
 <10b5d933-f104-7699-341a-0afb16640d54@intel.com>
 <87v9fvix5f.fsf@nanos.tec.linutronix.de> <20200930114301.GD816047@nvidia.com>
 <87k0wbi94b.fsf@nanos.tec.linutronix.de>
From: "Dey, Megha" <megha.dey@intel.com>
Message-ID: <e07aa723-12cd-7eb7-392a-642f96b98f79@intel.com>
Date: Wed, 30 Sep 2020 10:25:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87k0wbi94b.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Thomas/Jason,

On 9/30/2020 8:20 AM, Thomas Gleixner wrote:
> On Wed, Sep 30 2020 at 08:43, Jason Gunthorpe wrote:
>> On Wed, Sep 30, 2020 at 08:41:48AM +0200, Thomas Gleixner wrote:
>>> On Tue, Sep 29 2020 at 16:03, Megha Dey wrote:
>>>> On 8/26/2020 4:16 AM, Thomas Gleixner wrote:
>>>>> #9	is obviously just for the folks interested in IMS
>>>>>
>>>> I see that the tip tree (as of 9/29) has most of these patches but
>>>> notice that the DEV_MSI related patches
>>>>
>>>> haven't made it. I have tested the tip tree(x86/irq branch) with your
>>>> DEV_MSI infra patches and our IMS patches with the IDXD driver and was
>>> Your IMS patches? Why do you need something special again?

By IMS patches, I meant your IMS driver patch that was updated (as it 
was untested, it had some compile

errors and we removed the IMS_QUEUE parts) :

https://lore.kernel.org/lkml/160021246221.67751.16280230469654363209.stgit@djiang5-desk3.ch.intel.com/

and some iommu related changes required by IMS.

https://lore.kernel.org/lkml/160021246905.67751.1674517279122764758.stgit@djiang5-desk3.ch.intel.com/

The whole patchset can be found here:

https://lore.kernel.org/lkml/f4a085f1-f6de-2539-12fe-c7308d243a4a@intel.com/

It would be great if you could review the IMS patches :)

>>>
>>>> wondering if we should push out those patches as part of our patchset?
>>> As I don't have any hardware to test that, I was waiting for you and
>>> Jason to confirm that this actually works for the two different IMS
>>> implementations.
>> How urgently do you need this? The code looked good from what I
>> understood. It will be a while before we have all the parts to send an
>> actual patch though.
> I personally do not need it at all :) Megha might have different
> thoughts...

I have tested these patches and it works fine (I had to add a couple of 
EXPORT_SYMBOLS).

We were hoping to get IMS in the 5.10 merge window :)

>
>> We might be able to put together a mockup just to prove it
> If that makes Megha's stuff going that would of course be appreciated,
> but we can defer the IMS_QUEUE part for later. It's orthogonal to the
> IMS_ARRAY stuff.

In our patch series, we have removed the IMS_QUEUE stuff and retained 
only the IMS_ARRAY parts

as that was sufficient for us.

>
> Thanks,
>
>          tglx

