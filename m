Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DFCA0A15B
	for <lists+xen-devel@lfdr.de>; Sat, 11 Jan 2025 07:50:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.870085.1281538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWVJE-0007gG-1k; Sat, 11 Jan 2025 06:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 870085.1281538; Sat, 11 Jan 2025 06:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWVJD-0007e4-Tu; Sat, 11 Jan 2025 06:49:23 +0000
Received: by outflank-mailman (input) for mailman id 870085;
 Sat, 11 Jan 2025 05:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ctmA=UD=linux.dev=jonathan.derrick@srs-se1.protection.inumbo.net>)
 id 1tWTdY-0003X1-NA
 for xen-devel@lists.xenproject.org; Sat, 11 Jan 2025 05:02:22 +0000
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com
 [91.218.175.185]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 377372e2-cfd9-11ef-99a4-01e77a169b0f;
 Sat, 11 Jan 2025 06:02:14 +0100 (CET)
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
X-Inumbo-ID: 377372e2-cfd9-11ef-99a4-01e77a169b0f
Message-ID: <bcb30b80-0902-4561-94f9-a6e451702138@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736571726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87PFbocV5iG/YEPJ261ZyupRxofHWTgUBw6ylFg04/A=;
	b=C0zezy5PH3NjJJ3rja00SNNPSHRoK8WteCqC6PRIpIiAhISp3YUvWQ6F/rB5uExooUh/5q
	P2EgIwDrZfl5AnTomUIUOUbdH0GAEdogAHNXGVJotDgyAgAaSj8KKZ/4nFsHh5KpBP06Dd
	B4MOur/ybskGrVPM4vzws7U/dGEGsbw=
Date: Fri, 10 Jan 2025 22:02:00 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] vmd: disable MSI remapping bypass under Xen
To: Bjorn Helgaas <helgaas@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-pci@vger.kernel.org, Nirmal Patel <nirmal.patel@linux.intel.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
References: <20250110222525.GA318386@bhelgaas>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Jonathan Derrick <jonathan.derrick@linux.dev>
In-Reply-To: <20250110222525.GA318386@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Bjorn,

On 1/10/25 3:25 PM, Bjorn Helgaas wrote:
> Match historical subject line style for prefix and capitalization:
> 
>    PCI: vmd: Set devices to D0 before enabling PM L1 Substates
>    PCI: vmd: Add DID 8086:B06F and 8086:B60B for Intel client SKUs
>    PCI: vmd: Fix indentation issue in vmd_shutdown()
> 
> On Fri, Jan 10, 2025 at 03:01:49PM +0100, Roger Pau Monne wrote:
>> MSI remapping bypass (directly configuring MSI entries for devices on the VMD
>> bus) won't work under Xen, as Xen is not aware of devices in such bus, and
>> hence cannot configure the entries using the pIRQ interface in the PV case, and
>> in the PVH case traps won't be setup for MSI entries for such devices.
>>
>> Until Xen is aware of devices in the VMD bus prevent the
>> VMD_FEAT_CAN_BYPASS_MSI_REMAP capability from being used when running as any
>> kind of Xen guest.
> 
> Wrap to fit in 75 columns.
> 
> Can you include a hint about *why* Xen is not aware of devices below
> VMD?  That will help to know whether it's a permanent unfixable
> situation or something that could be done eventually.
> 
I wasn't aware of the Xen issue with VMD but if I had to guess it's 
probably due to the special handling of the downstream device into the 
dmar table.

[1] 4fda230ecddc2
[2] 9b4a824b889e1


>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>   drivers/pci/controller/vmd.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
>> diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
>> index 264a180403a0..d9b7510ace29 100644
>> --- a/drivers/pci/controller/vmd.c
>> +++ b/drivers/pci/controller/vmd.c
>> @@ -965,6 +965,15 @@ static int vmd_probe(struct pci_dev *dev, const struct pci_device_id *id)
>>   	struct vmd_dev *vmd;
>>   	int err;
>>   
>> +	if (xen_domain())
>> +		/*
>> +		 * Xen doesn't have knowledge about devices in the VMD bus.
> 
> Also here.
> 
>> +		 * Bypass of MSI remapping won't work in that case as direct
>> +		 * write to the MSI entries won't result in functional
>> +		 * interrupts.
>> +		 */
>> +		features &= ~VMD_FEAT_CAN_BYPASS_MSI_REMAP;
>> +
>>   	if (resource_size(&dev->resource[VMD_CFGBAR]) < (1 << 20))
>>   		return -ENOMEM;
>>   
>> -- 
>> 2.46.0
>>


