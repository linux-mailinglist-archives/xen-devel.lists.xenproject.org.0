Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DC82551DE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 02:14:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBS1f-00008I-Kw; Fri, 28 Aug 2020 00:13:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgpo=CG=intel.com=megha.dey@srs-us1.protection.inumbo.net>)
 id 1kBS1e-00008D-90
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 00:13:50 +0000
X-Inumbo-ID: 857dd435-725d-4514-84b5-72989660d904
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 857dd435-725d-4514-84b5-72989660d904;
 Fri, 28 Aug 2020 00:13:48 +0000 (UTC)
IronPort-SDR: 0TwH3ex5CW9TXCjUJArxXUyQSNRZquQa/Tgeko+euQhmqz/+MzeapAAzgU5FsidpwvCVRI77AW
 tU0LXFgN3enQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="136649311"
X-IronPort-AV: E=Sophos;i="5.76,361,1592895600"; d="scan'208";a="136649311"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 17:13:46 -0700
IronPort-SDR: uAmGoMAFhGRvD5NPRLnN/ekYEL+Xjxv+g4TWsI9UNYPL5S4ZMqTmCJhNgf7wqckE0S2ryUHTLn
 7aEo94gI807g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,361,1592895600"; d="scan'208";a="295950071"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga003.jf.intel.com with ESMTP; 27 Aug 2020 17:13:46 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Aug 2020 17:12:49 -0700
Received: from orsmsx101.amr.corp.intel.com (10.22.225.128) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 27 Aug 2020 17:12:49 -0700
Received: from [10.254.177.214] (10.254.177.214) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Aug 2020 17:12:48 -0700
Subject: Re: [patch V2 15/46] x86/irq: Consolidate DMAR irq allocation
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 <iommu@lists.linux-foundation.org>, <linux-hyperv@vger.kernel.org>, "Haiyang
 Zhang" <haiyangz@microsoft.com>, Jon Derrick <jonathan.derrick@intel.com>, Lu
 Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>, "Russ
 Anderson" <rja@hpe.com>, <linux-pci@vger.kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, "Boris Ostrovsky"
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Jason
 Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>, Alex
 Williamson <alex.williamson@redhat.com>, Jacob Pan <jacob.jun.pan@intel.com>, 
 Baolu Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>, Dan
 Williams <dan.j.williams@intel.com>
References: <20200826111628.794979401@linutronix.de>
 <20200826112332.163462706@linutronix.de>
 <812d9647-ad2e-95e9-aa99-b54ff7ebc52d@intel.com>
 <878se1uulb.fsf@nanos.tec.linutronix.de>
 <87r1rtt9mi.fsf@nanos.tec.linutronix.de>
From: "Dey, Megha" <megha.dey@intel.com>
Message-ID: <f78f0b1f-3c83-2629-405c-7b25875432db@intel.com>
Date: Thu, 27 Aug 2020 17:12:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87r1rtt9mi.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.254.177.214]
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Thomas,

On 8/26/2020 1:50 PM, Thomas Gleixner wrote:
> On Wed, Aug 26 2020 at 20:32, Thomas Gleixner wrote:
>> On Wed, Aug 26 2020 at 09:50, Megha Dey wrote:
>>>> @@ -329,15 +329,15 @@ static struct irq_chip dmar_msi_controll
>>>>    static irq_hw_number_t dmar_msi_get_hwirq(struct msi_domain_info *info,
>>>>    					  msi_alloc_info_t *arg)
>>>>    {
>>>> -	return arg->dmar_id;
>>>> +	return arg->hwirq;
>>> Shouldn't this return the arg->devid which gets set in dmar_alloc_hwirq?
>> Indeed.
> But for simplicity we can set arg->hwirq to the dmar id right in the
> alloc function and then once the generic ops are enabled remove the dmar
> callback completely
True, can get rid of more code that way.

