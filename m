Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4C724247F
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 06:12:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5i67-0003UR-Gq; Wed, 12 Aug 2020 04:10:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rFKC=BV=intel.com=megha.dey@srs-us1.protection.inumbo.net>)
 id 1k5ZHv-0000xS-Uz
 for xen-devel@lists.xenproject.org; Tue, 11 Aug 2020 18:46:19 +0000
X-Inumbo-ID: b0432122-8552-470b-a3f4-81e3f974885c
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0432122-8552-470b-a3f4-81e3f974885c;
 Tue, 11 Aug 2020 18:46:14 +0000 (UTC)
IronPort-SDR: anMB1Y/+kAq5EeelEG5REw7u/Wgj16OIMWVVyADcvqBSOlqf3ozdGYQf1MPaBGMxGSh4sbM1o4
 7HeBAGS/XcXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="154933342"
X-IronPort-AV: E=Sophos;i="5.76,301,1592895600"; d="scan'208";a="154933342"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 11:46:13 -0700
IronPort-SDR: 5aAcR8S72zxamrk1GkqcpkTcLHD6X+V0Qd8VhcPMwxe6NQm/ajJO1T7QBs6tN6/S8h9BEKMK9n
 htpZpANtoRxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,301,1592895600"; d="scan'208";a="294806955"
Received: from orsmsx602-2.jf.intel.com (HELO ORSMSX602.amr.corp.intel.com)
 ([10.22.229.82])
 by orsmga006.jf.intel.com with ESMTP; 11 Aug 2020 11:46:13 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 11 Aug 2020 11:46:13 -0700
Received: from orsmsx101.amr.corp.intel.com (10.22.225.128) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 11 Aug 2020 11:46:13 -0700
Received: from [10.212.86.9] (10.212.86.9) by ORSMSX101.amr.corp.intel.com
 (10.22.225.128) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 11 Aug
 2020 11:46:12 -0700
Subject: Re: [PATCH RFC v2 02/18] irq/dev-msi: Add support for a new DEV_MSI
 irq domain
To: Thomas Gleixner <tglx@linutronix.de>, Jason Gunthorpe <jgg@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
References: <87h7tcgbs2.fsf@nanos.tec.linutronix.de> <87ft8uxjga.fsf@nanos>
 <87d03x5x0k.fsf@nanos.tec.linutronix.de>
From: "Dey, Megha" <megha.dey@intel.com>
Message-ID: <8a8a853c-cbe6-b19c-f6ba-c8cdeda84a36@intel.com>
Date: Tue, 11 Aug 2020 11:46:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87d03x5x0k.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.212.86.9]
X-Mailman-Approved-At: Wed, 12 Aug 2020 04:10:41 +0000
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Kumar, 
 Sanjay K" <sanjay.k.kumar@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hansen,
 Dave" <dave.hansen@intel.com>, "kwankhede@nvidia.com" <kwankhede@nvidia.com>,
 "hpa@zytor.com" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "Liu, Yi L" <yi.l.liu@intel.com>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, "netanelg@mellanox.com" <netanelg@mellanox.com>,
 Marc Zyngier <maz@kernel.org>, "Lin, Jing" <jing.lin@intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "Ortiz, Samuel" <samuel.ortiz@intel.com>,
 "yan.y.zhao@linux.intel.com" <yan.y.zhao@linux.intel.com>,
 xen-devel@lists.xenproject.org, "shahafs@mellanox.com" <shahafs@mellanox.com>,
 "Tian, Kevin" <kevin.tian@intel.com>,
 "parav@mellanox.com" <parav@mellanox.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>, "Lu, 
 Baolu" <baolu.lu@intel.com>, Juergen Gross <jgross@suse.com>, "Luck,
 Tony" <tony.luck@intel.com>, "Hossain, Mona" <mona.hossain@intel.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "Pan,
 Jacob jun" <jacob.jun.pan@intel.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Thomas,

On 8/11/2020 2:53 AM, Thomas Gleixner wrote:
> Thomas Gleixner <tglx@linutronix.de> writes:
>
> CC+: XEN folks
>
>> Thomas Gleixner <tglx@linutronix.de> writes:
>>> The infrastructure itself is not more than a thin wrapper around the
>>> existing msi domain infrastructure and might even share code with
>>> platform-msi.
>> And the annoying fact that you need XEN support which opens another can
>> of worms...

hmm I am not sure why we need Xen support... are you referring to idxd 
using xen?

> which needs some real cleanup first.
>
> x86 still does not associate the irq domain to devices at device
> discovery time, i.e. the device::msi_domain pointer is never populated.
>
> So to support this new fangled device MSI stuff we'd need yet more
> x86/xen specific arch_*msi_irqs() indirection and hackery, which is not
> going to happen.
>
> The right thing to do is to convert XEN MSI support over to proper irq
> domains. This allows to populate device::msi_domain which makes a lot of
> things simpler and also more consistent.

do you think this cleanup is to be a precursor to my patches? I could 
look into it but I am not familiar with the background of Xen

and this stuff. Can you please provide further guidance on where to look?

> Thanks,
>
>          tglx

