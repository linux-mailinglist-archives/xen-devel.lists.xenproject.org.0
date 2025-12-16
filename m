Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65359CC3CD3
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 16:01:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188017.1509291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVWXf-000533-Kz; Tue, 16 Dec 2025 15:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188017.1509291; Tue, 16 Dec 2025 15:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVWXf-00051Z-I2; Tue, 16 Dec 2025 15:00:47 +0000
Received: by outflank-mailman (input) for mailman id 1188017;
 Tue, 16 Dec 2025 15:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QDvS=6W=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vVWXd-00051T-VD
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 15:00:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id fecab05c-da8f-11f0-b15b-2bf370ae4941;
 Tue, 16 Dec 2025 16:00:44 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 43436FEC;
 Tue, 16 Dec 2025 07:00:36 -0800 (PST)
Received: from [10.1.29.144] (unknown [10.1.29.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F9BB3F73B;
 Tue, 16 Dec 2025 07:00:42 -0800 (PST)
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
X-Inumbo-ID: fecab05c-da8f-11f0-b15b-2bf370ae4941
Message-ID: <4954f4f7-d256-4cad-914e-c828c717a9b4@arm.com>
Date: Tue, 16 Dec 2025 15:00:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] xen/dom0less: Calculate guest DTB size based on
 MAX_VIRT_CPUS
Content-Language: en-GB
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20251203185817.3722903-1-oleksandr_tyshchenko@epam.com>
 <6e83d3bc-c49c-49f4-9dbd-e994e53a62a7@xen.org>
 <44f6cb05-33c3-4937-b508-7616c36d0e4d@epam.com>
 <9FB64A3E-D05F-49B0-B979-25894D25BBD9@arm.com>
 <fc04150e-7f5e-480f-a31b-0eeaee1247b6@epam.com>
From: Harry Ramsey <harry.ramsey@arm.com>
In-Reply-To: <fc04150e-7f5e-480f-a31b-0eeaee1247b6@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/12/2025 13:37, Oleksandr Tyshchenko wrote:
> Thank you very much for offering to test this on Arm32 platforms.
>
> The primary goal of the test is to confirm that the new, calculated DTB
> buffer size of 3072 bytes is sufficient for a worst-case Arm32 dom0less
> guest. The expected result is that Xen boots successfully, and the
> regular dom0less guest is created without any panics.
>
> The ideal test configuration would be a dom0less guest with the
> following configuration:
> - The vCPU count set to the maximum for Arm32, which is 8, the vCPU
> nodes should ideally contain "clock-frequency" property.
> - Any other features that add nodes to the guest device tree enabled
> (e.g., hypervisor, reserved-memory, pl011 nodes are present, etc), to
> create the largest possible "base" FDT size.
>
> The test would involve applying the current patch, and the diff below:
>
> diff --git a/xen/common/device-tree/dom0less-build.c
> b/xen/common/device-tree/dom0less-build.c
> index 38a5830813..e95f42d1e1 100644
> --- a/xen/common/device-tree/dom0less-build.c
> +++ b/xen/common/device-tree/dom0less-build.c
> @@ -577,6 +577,9 @@ static int __init prepare_dtb_domU(struct domain *d,
> struct kernel_info *kinfo)
>        if ( ret < 0 )
>            goto err;
>
> +    printk("Final compacted FDT size is: %d bytes\n",
> fdt_totalsize(kinfo->fdt));
> +    printk("Predefined FDT size is: %d bytes\n", DOMU_DTB_SIZE);
> +
>        return 0;
>
>      err:
>
>
> Please let me know what you get. Thanks again.

I have tested this and can confirm it boots into Linux with an 8-core 
setup. Here are the values I got:
(XEN) Final compacted FDT size is: 1127 bytes
(XEN) Predefined FDT size is: 3072 bytes

Tested-by: Harry Ramsey <harry.ramsey@arm.com>

Thanks,
Harry Ramsey

