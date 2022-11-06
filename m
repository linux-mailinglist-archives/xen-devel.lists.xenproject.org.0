Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0804461E557
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 19:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438660.692727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkYE-0001aE-ON; Sun, 06 Nov 2022 18:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438660.692727; Sun, 06 Nov 2022 18:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orkYE-0001XX-Lc; Sun, 06 Nov 2022 18:39:22 +0000
Received: by outflank-mailman (input) for mailman id 438660;
 Sun, 06 Nov 2022 18:39:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orkYC-0001XR-Kp
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 18:39:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkYC-0005th-6B; Sun, 06 Nov 2022 18:39:20 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orkYB-0001bx-Vi; Sun, 06 Nov 2022 18:39:20 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=0mxbgWIAniKxmsThdt6OWxpJce11XvY+K2v2HJcCBH0=; b=NStZLIikDnFX1bG4NMKwTuPzFK
	tbD6PSUIGJ3OTY9cwNYCTj25z+e+afAtQX9GsoMEeGJcuqThhExZX+GJbvMZweBIF1/lr4lQ+3GLZ
	v8jTJ5zikPkTGzwybzEi9EuGdUI65ZNFgrk/ZBXQIhivM9J/oJpbnU1X89DbkFKYh/LI=;
Message-ID: <231f67e1-5524-c698-aa53-7c90e0fe0f43@xen.org>
Date: Sun, 6 Nov 2022 18:39:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, burzalodowa@gmail.com
References: <20221031151326.22634-1-ayankuma@amd.com>
 <20221031151326.22634-13-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v2 12/12] xen/Arm: GICv3: Enable GICv3 for AArch32
In-Reply-To: <20221031151326.22634-13-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 31/10/2022 15:13, Ayan Kumar Halder wrote:
> Refer ARM DDI 0487G.b ID072021,
> D13.2.86 -
> ID_PFR1_EL1, AArch32 Processor Feature Register 1
> 
> GIC, bits[31:28] == 0b0001 for GIC3.0 on Aarch32
> 
> One can now enable GICv3 on AArch32 systems. However, ITS is not supported.

s/enable/use/

> The reason being currently we are trying to validate GICv3 on an AArch32_v8R
> system. Refer ARM DDI 0568A.c ID110520, B1.3.1,
> "A Generic Interrupt Controller (GIC) implemented with an Armv8-R PE must not
> implement LPI support."
> 
> Updated SUPPORT.md.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
> 
> Changed from :-
> v1 - 1. Remove "ARM_64 || ARM_32" as it is always true.
> 2. Updated SUPPORT.md.
> 
>   SUPPORT.md                            | 6 ++++++
>   xen/arch/arm/Kconfig                  | 4 ++--
>   xen/arch/arm/include/asm/cpufeature.h | 1 +
>   3 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index cf2ddfacaf..0137855c66 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -82,6 +82,12 @@ Extension to the GICv3 interrupt controller to support MSI.
>   
>       Status: Experimental
>   
> +### ARM/GICv3 + AArch32 ARM v8

The general apprpoach in SUPPORT.MD is to name the feature and then 
describe per arch the exact support. For this case it would be:

## ARM/GICv3

GICv3 is an interrupt controller specification designed by Arm.

Status, Arm64: Security supported
Status, Arm32: Supported, not security supported

Cheers,

-- 
Julien Grall

