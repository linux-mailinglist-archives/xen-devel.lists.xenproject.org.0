Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B358CDCFD
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 00:48:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728907.1133990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAHEC-0000k8-GW; Thu, 23 May 2024 22:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728907.1133990; Thu, 23 May 2024 22:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAHEC-0000he-Du; Thu, 23 May 2024 22:48:04 +0000
Received: by outflank-mailman (input) for mailman id 728907;
 Thu, 23 May 2024 22:48:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sAHEA-0000hY-Uu
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 22:48:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAHEA-0007so-Li; Thu, 23 May 2024 22:48:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sAHEA-0000KJ-GL; Thu, 23 May 2024 22:48:02 +0000
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
	bh=GbNAxB2Q9Ar/rzjRdCeKi29r70K4caa/qZut9mqrfH0=; b=6wTEN93yl53ro01RSmQ71iOjvO
	JScXd25bGkZLqJj28vULfGrehFMVruPgn8odqwsqODqFAJt3PhHjIZSbLpADEqlhJpAt5rXbEDx15
	0QvSHBXDFoHb6S7UZ8dlEQpg6XilFiRXah2Xg2Y7KzLotilr3BWZsjrYweLh9fmzVpB0=;
Message-ID: <a437fe4c-bb21-456f-acf3-53ae8916f4f6@xen.org>
Date: Thu, 23 May 2024 23:48:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 9/9] docs: Add device tree overlay documentation
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
 <20240523074040.1611264-10-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240523074040.1611264-10-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 23/05/2024 08:40, Henry Wang wrote:
> From: Vikram Garhwal <fnu.vikram@xilinx.com>
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v4:
> - No change.
> v3:
> - No change.
> v2:
> - Update the content based on the changes in this version.
> ---
>   docs/misc/arm/overlay.txt | 99 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
>   create mode 100644 docs/misc/arm/overlay.txt
> 
> diff --git a/docs/misc/arm/overlay.txt b/docs/misc/arm/overlay.txt
> new file mode 100644
> index 0000000000..811a6de369
> --- /dev/null
> +++ b/docs/misc/arm/overlay.txt
> @@ -0,0 +1,99 @@
> +# Device Tree Overlays support in Xen
> +
> +Xen now supports dynamic device assignment to running domains,

This reads as we "support" the feature. I would prefer if we write "Xen 
expirementally supports..." or similar.

> +i.e. adding/removing nodes (using .dtbo) to/from Xen device tree, and
> +attaching/detaching them to/from a running domain with given $domid.
> +
> +Dynamic node assignment works in two steps:
> +
> +## Add/Remove device tree overlay to/from Xen device tree
> +
> +1. Xen tools check the dtbo given and parse all other user provided arguments
> +2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
> +3. Xen hypervisor applies/removes the dtbo to/from Xen device tree.
> +
> +## Attach/Detach device from the DT overlay to/from domain
> +
> +1. Xen tools check the dtbo given and parse all other user provided arguments
> +2. Xen tools pass the dtbo to Xen hypervisor via hypercall.
> +3. Xen hypervisor attach/detach the device to/from the user-provided $domid by
> +   mapping/unmapping node resources in the DT overlay.
> +
> +# Examples
> +
> +Here are a few examples on how to use it.
> +
> +## Dom0 device add
> +
> +For assigning a device tree overlay to Dom0, user should firstly properly
> +prepare the DT overlay. More information about device tree overlays can be
> +found in [1]. Then, in Dom0, enter the following:
> +
> +    (dom0) xl dt-overlay add overlay.dtbo
> +
> +This will allocate the devices mentioned in overlay.dtbo to Xen device tree.
> +
> +To assign the newly added device from the dtbo to Dom0:
> +
> +    (dom0) xl dt-overlay attach overlay.dtbo 0
> +
> +Next, if the user wants to add the same device tree overlay to dom0
> +Linux, execute the following:
> +
> +    (dom0) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
> +    (dom0) cat overlay.dtbo > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
> +
> +Finally if needed, the relevant Linux kernel drive can be loaded using:
> +
> +    (dom0) modprobe module_name.ko
> +
> +## Dom0 device remove
> +
> +For removing the device from Dom0, first detach the device from Dom0:
> +
> +    (dom0) xl dt-overlay detach overlay.dtbo 0
> +
> +NOTE: The user is expected to unload any Linux kernel modules which
> +might be accessing the devices in overlay.dtbo before detach the device.
> +Detaching devices without unloading the modules might result in a crash.
> +
> +Then remove the overlay from Xen device tree:
> +
> +    (dom0) xl dt-overlay remove overlay.dtbo
> +
> +## DomU device add/remove
> +
> +All the nodes in dtbo will be assigned to a domain; the user will need
> +to prepare the dtb for the domU. For example, the `interrupt-parent` property
> +of the DomU overlay should be changed to the Xen hardcoded value `0xfde8`.
> +Below assumes the properly written DomU dtbo is `overlay_domu.dtbo`.
> +
> +User will need to create the DomU with below properties properly configured
> +in the xl config file:
> +- `iomem`

I don't quite understand how the user can specify the MMIO region if the 
device is attached after the domain is created.

> +- `passthrough` (if IOMMU is needed)
> +
> +User will also need to modprobe the relevant drivers.
> +
> +Example for domU device add:
> +
> +    (dom0) xl dt-overlay add overlay.dtbo            # If not executed before
> +    (dom0) xl dt-overlay attach overlay.dtbo $domid

Can how clarify how the MMIO will be mapped? Is it direct mapped? If so, 
couldn't this result to clash with other part of the address space (e.g. 
RAM?).

> +    (dom0) xl console $domid                         # To access $domid console
> +
> +Next, if the user needs to modify/prepare the overlay.dtbo suitable for
> +the domU:
> +
> +    (domU) mkdir -p /sys/kernel/config/device-tree/overlays/new_overlay
> +    (domU) cat overlay_domu.dtbo > /sys/kernel/config/device-tree/overlays/new_overlay/dtbo
> +
> +Finally, if needed, the relevant Linux kernel drive can be probed:
> +
> +    (domU) modprobe module_name.ko
> +
> +Example for domU overlay remove:
> +
> +    (dom0) xl dt-overlay detach overlay.dtbo $domid
> +    (dom0) xl dt-overlay remove overlay.dtbo

I assume we have safety check in place to ensure we can't remove the 
device if it is already attached. Is that correct?

Cheers,

-- 
Julien Grall

