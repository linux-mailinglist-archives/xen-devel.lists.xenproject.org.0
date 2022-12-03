Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A3C641912
	for <lists+xen-devel@lfdr.de>; Sat,  3 Dec 2022 21:41:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.452797.710603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1ZJZ-00040S-Tz; Sat, 03 Dec 2022 20:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 452797.710603; Sat, 03 Dec 2022 20:40:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p1ZJZ-0003xk-Qm; Sat, 03 Dec 2022 20:40:49 +0000
Received: by outflank-mailman (input) for mailman id 452797;
 Sat, 03 Dec 2022 20:40:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p1ZJY-0003xe-Cz
 for xen-devel@lists.xenproject.org; Sat, 03 Dec 2022 20:40:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1ZJX-00036v-Ua; Sat, 03 Dec 2022 20:40:47 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p1ZJX-00030p-Oc; Sat, 03 Dec 2022 20:40:47 +0000
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
	bh=1iqqiH64fbfJz4uoN1xPNVOd24d39ael6+6GhflFMa0=; b=sX5qYzdQwePT4v3TQlU3uwlfu4
	O77fiO2la5fwMsnsp1TQeQo4YQDZtcrvjrSGky3ZjjkzaxKtpOvuudPbYq6ZZSmE0BcasVtL815nq
	EkGR8uGoD2RKyEpBZnMYFbPbQP7Fvq4aQgzvfouRgLUuLwJoCSKbfn3MT1hXZPHDg9cc=;
Message-ID: <fcb13f6a-2c84-be06-cfea-94b980c6a207@xen.org>
Date: Sat, 3 Dec 2022 20:40:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [XEN v4 11/11] xen/Arm: GICv3: Enable GICv3 for AArch32
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, michal.orzel@amd.com, jgrall@amazon.com,
 burzalodowa@gmail.com
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
 <20221128155649.31386-12-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221128155649.31386-12-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28/11/2022 15:56, Ayan Kumar Halder wrote:
> One can now use GICv3 on AArch32 systems. However, ITS is not supported.
> The reason being currently we are trying to validate GICv3 on an AArch32_v8R
> system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
> implement LPI support."
> 
> By default GICv3 is disabled on AArch32 and enabled on AArch64.
> 
> Updated SUPPORT.md to state that GICv3 on Arm32 is not security supported.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> 
> Changed from :-
> v1 - 1. Remove "ARM_64 || ARM_32" as it is always true.
> 2. Updated SUPPORT.md.
> 
> v2 - 1. GICv3 is enabled by default only on ARM_64.
> 2. Updated SUPPORT.md.
> 
> v3 - 1. GICv3 is not selected by ARM_64. Rather, it is optionally
> enabled.
> 2. GICv3 is disabled by default on ARM_32.
> 
>   SUPPORT.md                            | 7 +++++++
>   xen/arch/arm/Kconfig                  | 9 +++++----
>   xen/arch/arm/include/asm/cpufeature.h | 1 +
>   3 files changed, 13 insertions(+), 4 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index ab71464cf6..295369998e 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -76,6 +76,13 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
>       Status, ARM SMMUv3: Tech Preview
>       Status, Renesas IPMMU-VMSA: Supported, not security supported
>   
> +### ARM/GICv3
> +
> +GICv3 is an interrupt controller specification designed by Arm.
> +
> +    Status, Arm64: Security supported
> +    Status, Arm32: Supported, not security supported
> +
>   ### ARM/GICv3 ITS
>   
>   Extension to the GICv3 interrupt controller to support MSI.
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index 52a05f704d..9d0c45f892 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -41,16 +41,17 @@ config ARM_EFI
>   
>   config GICV3
>   	bool "GICv3 driver"
> -	depends on ARM_64 && !NEW_VGIC
> -	default y
> +	depends on !NEW_VGIC
> +	default n if ARM_32
> +	default y if ARM_64
>   	---help---
>   
>   	  Driver for the ARM Generic Interrupt Controller v3.
> -	  If unsure, say Y
> +	  If unsure, say N for ARM_32 and Y for ARM_64

s/ARM_32/32-bit Arm/
s/ARM_64/64-bit Arm/

Or you could use the following wording (used on x86 in similar 
circumstances):

"If unsure, use the default setting."

Cheers,

-- 
Julien Grall

