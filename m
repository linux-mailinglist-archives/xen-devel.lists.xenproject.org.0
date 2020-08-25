Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35D2251066
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 06:22:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAQSJ-00035s-7w; Tue, 25 Aug 2020 04:21:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h2I2=CD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kAQSH-00035n-Du
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 04:21:05 +0000
X-Inumbo-ID: c6d75fce-decc-41f5-a2c9-cde8d12839c6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6d75fce-decc-41f5-a2c9-cde8d12839c6;
 Tue, 25 Aug 2020 04:21:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 43412B78E;
 Tue, 25 Aug 2020 04:21:34 +0000 (UTC)
Subject: Re: [patch RFC 24/38] x86/xen: Consolidate XEN-MSI init
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>, Lu Baolu
 <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Steve Wahl <steve.wahl@hpe.com>,
 Dimitri Sivanich <sivanich@hpe.com>, Russ Anderson <rja@hpe.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
References: <20200821002424.119492231@linutronix.de>
 <20200821002947.667887608@linutronix.de>
 <5caec213-8f56-9f12-34db-a29de8326f95@suse.com>
 <87tuwr68q8.fsf@nanos.tec.linutronix.de>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <fb4e3d13-18c8-a425-19a8-975fda80d411@suse.com>
Date: Tue, 25 Aug 2020 06:21:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <87tuwr68q8.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.08.20 23:21, Thomas Gleixner wrote:
> On Mon, Aug 24 2020 at 06:59, Jürgen Groß wrote:
>> On 21.08.20 02:24, Thomas Gleixner wrote:
>>> +static __init void xen_setup_pci_msi(void)
>>> +{
>>> +	if (xen_initial_domain()) {
>>> +		x86_msi.setup_msi_irqs = xen_initdom_setup_msi_irqs;
>>> +		x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
>>> +		x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
>>> +		pci_msi_ignore_mask = 1;
>>
>> This is wrong, as a PVH initial domain shouldn't do the pv settings.
>>
>> The "if (xen_initial_domain())" should be inside the pv case, like:
>>
>> if (xen_pv_domain()) {
>> 	if (xen_initial_domain()) {
>> 		...
>> 	} else {
>> 		...
>> 	}
>> } else if (xen_hvm_domain()) {
>> 	...
> 
> I still think it does the right thing depending on the place it is
> called from, but even if so, it's completely unreadable gunk. I'll fix
> that proper.

The main issue is that xen_initial_domain() and xen_pv_domain() are
orthogonal to each other. So xen_initial_domain() can either be true
for xen_pv_domain() (the "classic" pv dom0) or for xen_hvm_domain()
(the new PVH dom0).


Juergen

