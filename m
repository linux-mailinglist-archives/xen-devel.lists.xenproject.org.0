Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC707F724E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 12:02:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640545.998936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Twg-0006B4-Hr; Fri, 24 Nov 2023 11:02:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640545.998936; Fri, 24 Nov 2023 11:02:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Twg-00068A-Em; Fri, 24 Nov 2023 11:02:02 +0000
Received: by outflank-mailman (input) for mailman id 640545;
 Fri, 24 Nov 2023 11:02:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r6Twe-00067w-Ti
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 11:02:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6Twd-0002GF-Lb; Fri, 24 Nov 2023 11:01:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6Twd-0007MQ-Ea; Fri, 24 Nov 2023 11:01:59 +0000
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
	bh=vsKocXb8eGJkslmuFJDRiyja14xzd13/xbKMLSGUooc=; b=E3AjMioPeztRAlvQxeNGBFQaNV
	e4ro2SXMVAZXGDdtiM0YtVpDHoy8S8NmN7/AWlZOgLpxgpDPGXtbX3Xstdv7w89/LmJsLDKJu71i+
	sp/KghCfFs4XpsFPtYgL8X6vV31Zt5sSdPlq5Tq+nBLuMxpgG1ruBEiDNFrbzWe5aIcU=;
Message-ID: <35978886-0f5e-4906-a64b-a4da0e875fc8@xen.org>
Date: Fri, 24 Nov 2023 11:01:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] xen/asm-generic: introduce generic device.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <65b267137539704df7f22b37e3b0a9b372a82b33.1700221559.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <65b267137539704df7f22b37e3b0a9b372a82b33.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 17/11/2023 12:24, Oleksii Kurochko wrote:
> Arm, PPC and RISC-V use the same device.h thereby device.h
> was moved to asm-generic. 

I read "was moved" as the patch should also contain some deleted lines. 
But below, I only see the file introduced. Did you intend to also remove 
the version in arm/include/asm?

> Arm's device.h was taken as a base with
> the following changes:
>   - #ifdef PCI related things.
>   - #ifdef ACPI related things.
>   - Rename #ifdef guards.
>   - Add SPDX tag.
>   - #ifdef CONFIG_HAS_DEVICE_TREE related things.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> It is still open question if device.h should be in asm-generic. Need more opinions.

I still think it should. But I guess you want others to answer? If so it 
would be worth to point out from who you seek opinions.

> ---
> Changes in V3:
>   - ifdef device tree related things.
>   - update the commit message
> ---
> Changes in V2:
> 	- take ( as common ) device.h from Arm as PPC and RISC-V use it as a base.
> 	- #ifdef PCI related things.
> 	- #ifdef ACPI related things.
> 	- rename DEVICE_GIC to DEVIC_IC.
> 	- rename #ifdef guards.
> 	- switch Arm and PPC to generic device.h
> 	- add SPDX tag
> 	- update the commit message
> 
> ---
>   xen/include/asm-generic/device.h | 147 +++++++++++++++++++++++++++++++
>   1 file changed, 147 insertions(+)
>   create mode 100644 xen/include/asm-generic/device.h
> 
> diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
> new file mode 100644
> index 0000000000..7ef5aa955a
> --- /dev/null
> +++ b/xen/include/asm-generic/device.h
> @@ -0,0 +1,147 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_DEVICE_H__
> +#define __ASM_GENERIC_DEVICE_H__
> +
> +enum device_type
> +{
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    DEV_DT,
> +#endif
> +
> +#ifdef HAS_PCI
> +    DEV_PCI,
> +#endif
> +};
> +
> +struct dev_archdata {
> +    void *iommu;    /* IOMMU private data */
> +};
> +
> +/* struct device - The basic device structure */
> +struct device
> +{
> +    enum device_type type;
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
> +#endif
> +    struct dev_archdata archdata;
> +    struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
> +};
> +
> +typedef struct device device_t;
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +#include <xen/device_tree.h>
> +#endif

NIT: Could we try to rationalize the number of #ifdef CONFIG_HAS_*? For 
example ...

> +
> +#ifdef HAS_PCI
> +#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
> +#endif
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
> +#endif

... this is another definition for Device-Tree only. It could be easily 
moved above the definitnion of dev_is_pci(). The others would be the 
DT_DEVICE_*() helpers.

> +
> +enum device_class
> +{
> +    DEVICE_SERIAL,
> +    DEVICE_IOMMU,
> +    DEVICE_IC,

I guess you mean INTERRUPT_CONTROLLER? If so, can this be spelt out? (I 
don't think shorthand version is worth it here)

Cheers,

-- 
Julien Grall

