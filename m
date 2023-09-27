Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DF57B04D4
	for <lists+xen-devel@lfdr.de>; Wed, 27 Sep 2023 14:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608928.947748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlU8E-0002js-OU; Wed, 27 Sep 2023 12:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608928.947748; Wed, 27 Sep 2023 12:59:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlU8E-0002hN-Lh; Wed, 27 Sep 2023 12:59:10 +0000
Received: by outflank-mailman (input) for mailman id 608928;
 Wed, 27 Sep 2023 12:59:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qlU8D-0002hH-2H
 for xen-devel@lists.xenproject.org; Wed, 27 Sep 2023 12:59:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlU8C-00038I-Eq; Wed, 27 Sep 2023 12:59:08 +0000
Received: from [15.248.2.159] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qlU8C-0003Z0-80; Wed, 27 Sep 2023 12:59:08 +0000
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
	bh=EKvD41HcYz4afrz/n+zLMTKRa2w+zuYP82K+RFIBBlM=; b=AOojjtx4U1z2RGF0HwZkAzW87D
	jdjNcZfi0bc3J6ZXOiX75fygdpK8TojoSBMX0WrTHDkQ8U+5rSOZWh3OoGmhVOsGbKGhDbG+D+WiL
	+2OBgvCyaU7zB0u3h74UbUas4YHdb7F3oWtWjXe2usSVPvybsPMuDg0ZQ4zp+5ZlQU0U=;
Message-ID: <ed3ea203-4244-4bbe-a9e0-ac8882ecc83c@xen.org>
Date: Wed, 27 Sep 2023 13:59:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen on AWS EC2 Graviton 2 metal instances (c6g.metal)
Content-Language: en-GB
To: "Driscoll, Dan" <dan.driscoll@siemens.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "arvind.raghuraman@siemens.com" <arvind.raghuraman@siemens.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "rahul.singh@arm.com" <rahul.singh@arm.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
References: <DM6PR07MB43168B0D4DEA80BF2474B9D89AC3A@DM6PR07MB4316.namprd07.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DM6PR07MB43168B0D4DEA80BF2474B9D89AC3A@DM6PR07MB4316.namprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dan,

Thanks for the report.

On 26/09/2023 20:41, Driscoll, Dan wrote:
> 	First off - sorry for the very long email, but there are a lot of details related to this topic and I figured more details might be better than less but I could be wrong here....
> 
> 	Within Siemens Embedded, we have been doing some prototyping using Xen for some upcoming customer related work - this email thread attempts to explain what has been done here and our analysis of the problems we are having.
> 
> 	We have done some initial prototyping to get Xen running on an AWS Graviton 2 instance using an EC2 Arm64 "metal" instance (c6g.metal - no AWS hypervisor) and ran into some problems during this prototyping.
> 
> 	Since the Edge Workload Abstraction and Orchestration Layer (EWAOL) that is part of SOAFEE already has some enablement of Xen in various environments (including an Arm64 server environment), we used this as a starting point.
> 
> 	We were able to successfully bring up Xen and a Yocto dom0 and multiple domu Yocto guests on an Arm AVA server (AVA Developer Platform - 32 core Neoverse N1 server) following documented steps with some minimal configuration changes (we simply extended the configuration to include 3 Linux guests): https://ewaol.docs.arm.com/en/kirkstone-dev/manual/build_system.html#build-system
> 
> 	So, this specific EWAOL support has all the proper bitbake layers to generate images for both bare-metal (Linux running natively) and a virtualization build (using Xen) for AVA and also a Neoverse N1 System Development Platform (N1SDP), but we only verified this on AVA.
> c6g.medium
> 	AWS also has support for EWAOL on Graviton 2, but the only supported configuration is a bare-metal configuration (Linux running natively) and the virtualization build hasn't been implemented in the bitbake layers in their repo - here is the URL for information / instructions on this support: https://github.com/aws4embeddedlinux/meta-aws-ewaol
> https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/grub.html
> 	As part of our effort to bring this up, we did a VERY minimal patch to the repo used for the AWS EWAOL to generate a virtualization build (attached meta-aws-ewaol.patch).  The resultant build of the AWS EWAOL support with this patch applied does result in Xen being built as well as a dom0 Yocto kernel, but there is definitely missing support to properly build everything for this virtualization layer.  Following the instructions for meta-aws-ewaol,  we generated an AMI and started an EC2 instance with this AMI (c6g.metal type).  The resultant image does boot, but it boots into the dom0 Linux kernel with problems recorded in the boot log related to Xen (see dom0-linux-boot.txt).
> 
>         Looking more closely at the EFI partition, it was clear that systemd-boot was being used and it was set-up to boot the dom0 Linux kernel and not boot into Xen - the Xen EFI images were not present in the EFI partition and obviously no launch entries existed for Xen.  To rectify this, the Xen EFI image that were built as part of the AWS EWAOL build mentioned above where placed in the EFI partition, along with a Xen config file that provided the dom0 Linux kernel image details.  A new entry was added into the EFI image for Xen and the launch conf file was updated to boot Xen instead of dom0 Linux.  This resulted in the EC2 instance becoming "bricked" and no longer accessible.
>         
>         Details on the EFI related content and changes we made are captured in the meta-aws-ewaol-efi-boot-changes.txt file attached above.
>         
>         The next step was comparing the AVA Xen output that was working and we noticed a few differences - the AVA build did enable ACPI and UNSUPPORTED kconfig settings whereas the AWS Xen build did not.  So, we tried again to bring up another EC2 metal instance using the same AMI as before and utilized the AVA Xen EFI image instead and same Xen config file.  The result was the same - a "bricked" instance.
>         
>         We will likely try to use the entire AVA flow on AWS Graviton next as it is using GRUB 2 instead of systemd-boot and we hope to maybe extend or enable some of the debug output during boot.  The AWS EC2 instances have a "serial console", but we have yet to see any output on this console prior to Linux boot logs - no success in getting EC2 serial output during EFI booting.

That's interesting. The documentation for AWS [1] suggests that the logs 
from boot should be seen. They even have a page for troubleshooting 
using GRUB [2].

I just launched a c6g.metal and I could access the serial console but 
then it didn't work across reboot.

I have tried a c6g.medium and the serial was working across reboot (I 
could see some logs). So I wonder whether the serial console is there is 
a missing configuration for baremetal?

>         
>         We have had a call and some email exchanges with AWS on this topic (Luke Harvey, Jeremy Dahan, Robert DeOliveira, and Azim Siddique) and they said there have been multiple virtualization solutions successfully booted on Graviton 2 metal instances, so they felt that Xen should be useable once we figured out configuration / boot details.  The provided some guidance how we might go about some more exploration here, but nothing really specific to supporting Xen.

To be honest, without a properly working serial console, it is going to 
be very difficult to debug any issue in Xen.

Right now, it is unclear whether Xen has output anything. If we can 
confirm the serial console has intended and then are still no logs, then 
I would suggest to enable earlyprintk in Xen. For your Graviton2, I 
think the following lines in xen/.config should do the trick:

CONFIG_DEBUG=y
CONFIG_EARLY_UART_CHOICE_PL011=y
CONFIG_EARLY_UART_PL011=y
CONFIG_EARLY_PRINTK=y
CONFIG_EARLY_UART_BASE_ADDRESS=0x83e00000
CONFIG_EARLY_UART_PL011_BAUD_RATE=115200

>         
>         I have attached the following files for reference:
>         
> 	* meta-aws-ewaol.patch - patch to AWS EWAOL repo found at https://github.com/aws4embeddedlinux/meta-aws-ewaol
> 	* meta-aws-ewaol-efi-boot-changes.txt - Description of EFI related changes made to AWS EWAOL EFI partition in attempt to boot Xen
> 	* ava.xen.config - config file for Xen build for AVA using EWAOL virtualization build
> 	* aws.xen.config - config file for Xen build for AWS using EWAOL virtualization build
> 	* xen-4.16.1.cfg - Xen config file placed in root of EFI boot partition alongside xen-4.16.1.efi image

May I ask why you are using 4.16.1 rather than 4.17? In general I would 
recommend to use the latest stable version or even a staging (the 
on-going development branch) for bring-up because we don't always 
backport everything to stable branch. So a bug may have been fixed in 
newer revision.

That said, skimming through the logs, I couldn't spot any patches that 
may help on Graviton 2.

Best regards,

[1] 
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-serial-console.html
[2] https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/grub.html

> 
> Dan Driscoll
> Distinguished Engineer
> Siemens DISW - Embedded Platform Solutions

-- 
Julien Grall

