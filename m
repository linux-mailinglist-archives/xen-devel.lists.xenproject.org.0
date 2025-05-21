Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A28ABF443
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 14:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991804.1375641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiSh-0002FQ-Jx; Wed, 21 May 2025 12:22:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991804.1375641; Wed, 21 May 2025 12:22:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHiSh-0002C4-GT; Wed, 21 May 2025 12:22:19 +0000
Received: by outflank-mailman (input) for mailman id 991804;
 Wed, 21 May 2025 12:22:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uHiSf-0002AS-RS
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 12:22:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uHiSb-005xgv-25;
 Wed, 21 May 2025 12:22:13 +0000
Received: from [15.248.2.235] (helo=[10.24.67.107])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uHiSb-004sVd-0j;
 Wed, 21 May 2025 12:22:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Q6gBuWcqa8fMdyDHTqMr15KjwjEp6whhjX4rOKLYeY0=; b=3FjVJM9W1UUZKnCXfslOOzQEn/
	dGWtk8DbylqSCjFJTSu7Drp4gfizlA1v2dMAJ6HmZUSKy4nylnOb+Bg8KJDcvXkojdntMvCMDKHIK
	If4WvqJ3T7jrMzT9s/ojkmOa8/d/LuugDXWHFxnE6qY9kJhgV0J+oOdvJkbpD8vrPA8A=;
Message-ID: <ad31707f-4558-4ebb-89ef-da9ef4083d7a@xen.org>
Date: Wed, 21 May 2025 13:22:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen/arm: Virtio-PCI for dom0less on ARM
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <aCw3ddB2CZUeEtyF@zapote>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aCw3ddB2CZUeEtyF@zapote>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Edgar,

Thanks for the write-up.

On 20/05/2025 09:04, Edgar E. Iglesias wrote:
> Hi all,
> 
> Following up on the ARM virtio-pci series I posted a while back ago.
> 
> There have been some concerns around the delayed and silent apperance of
> devices on the ECAM area. The spec is not super clear wether this is OK or
> not but I'm providing some references to the PCI specs and to some real cases
> where this is used for FPGAs.
> 
> There are two options how to implement virtio-pci that we've discussed:
> 1. VPCI + IOREQ
> 2. IOREQ only
> 
> There are pros and cons with both. For example with #1, has the benefit that
> we would only have a single PCIe RC (in Xen) and we could emulate a hotplug
> capable expansion port with a standard way to notify when PCI devices plug in.
> Approach #2 has the benefit that there is (almost) no additional complexity
> or code added to Xen, almost everything lives outside.
> IMO, both options have merit and both could co-exist.
 > > For dynamic xl flows, options #2 already works without 
modifications to Xen.
> Users need to pass the correct command-line options to QEMU and a device-tree
> fragment with the pci-generic-ecam-host device.

IIUC, in approach #2, QEMU will emulate the host controller. In Xen, we 
also support multiple IOREQ servers. For instance IOREQ A may emulate a 
GPU device, whereas IOREQ B could emulate a disk. This is usuful in case 
where one may want a separate domain to handle GPUs.

With the approach #2, it sounds like you will end up to have one host 
controller per IOREQ server. The user will also need to know them in 
advance. Is my understanding correct? If so, then it feels like this is 
defeating the purpose of IOREQ.

This is the first reason why I feel approach #1 is more suitable.

> 
> For static dom0less flows, we can do the same as for xl flows but we have the
> additional problem of domU's PCI bus enumeration racing with QEMU.
> On x86, when domU's access a memory range that has not yet got IOREQ's
> connected to it, the accesses succeeds with reads returning 0xFFFFFFFF and
> writes ignored. This makes it easy for guests to wait for IOREQ devices to
> pop up since guests will find an empty bus and can initiate a rescan later
> when QEMU attaches. On ARM, we trap on these accesses.
> > If we on ARM add support for MMIO background regions with a default 
read value,
> i.e mmio handlers that have lower priority than IOREQs and that are
> read-const + writes-ignored, we could support the same flow on ARM.
> This may be generally useful for other devices as well (e.g virtio-mmio or
> something else). We could also use this to defer PCI enumeration.

Regardless what I wrote above, if we are going down the route of 
returning 0xFFFFFFFF, I would just do it for every IOs rather than the 
one specify in the device-tree. This could still behind a per-domain 
option, but it would at least make simpler to setup the system (AFAIU, 
in your current proposal, we would need to specify the range in multiple 
places).

> 
> So the next versions of this series I was thinking to remove the PCI specifics
> and instead add FDT bindings to ARM dom0less enabling setup of user
> configurable (by address-range and read-value) background mmio regions.
> Xen would then support option #2 without any PCI specifics added.
> 
> Thoughts?
> 
> Cheers,
> Edgar
> 
> # References to spec
> 
> PCI express base specification:
> 7.5.1.1.1 Vendor ID Register (Offset 00h)
> The Vendor ID register is HwInit and the value in this register identifies the manufacturer of the Function. In keeping with
> PCI-SIG procedures, valid vendor identifiers must be allocated by the PCI-SIG to ensure uniqueness. Each vendor must
> have at least one Vendor ID. It is recommended that software read the Vendor ID register to determine if a Function is
> present, where a value of FFFFh indicates that no Function is present.
> 
> PCI Firmware Specification:
> 3.5 Device State at Firmware/Operating System Handoff
> Page 34:
> The operating system is required to configure PCI subsystems:
>  During hotplug
>  For devices that take too long to come out of reset
>  PCI-to-PCI bridges that are at levels below what firmware is designed to configure
> 
> Page 36:
> Note: The operating system does not have to walk all buses during boot. The kernel can
> automatically configure devices on request; i.e., an event can cause a scan of I/O on demand.

I am not sure why you quote this. To me it reads like this is up to the 
OS to decide when to access the PCI bus. As we don't control the OS, 
this doesn't seem a behavior Xen can rely on.

> 
> FPGA's can be programmed at runtime and appear on the ECAM bus silently.
> An PCI rescan needs to be triggered for the OS to discover the device:
> Intel FPGAs:
> https://www.intel.com/content/www/us/en/docs/programmable/683190/1-3-1/how-to-rescan-bus-and-re-enable-aer.html

To clarify, you are saying the ECAM bus may be completely empty (e.g. 
everything is reading as ~0) and some part of the ECAM will return a non 
~0 value when the FPGA run.

That said, the FPGA behavior is IMHO slightly different. I would expect 
for FPGA, one would now when the device is present because they would 
have programmed the FPGA. In our case, we are trying to solve a race 
introduce by Xen (not the user itself). So it feels wrong to ask the 
user to "probe in a loop until it works".

This is the other reason why the approach #1 looks more appealing to me.

Cheers,

-- 
Julien Grall


