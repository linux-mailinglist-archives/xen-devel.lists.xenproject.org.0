Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E881BF2E
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 20:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659139.1028609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGOsL-0005dA-Pf; Thu, 21 Dec 2023 19:38:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659139.1028609; Thu, 21 Dec 2023 19:38:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGOsL-0005at-N2; Thu, 21 Dec 2023 19:38:33 +0000
Received: by outflank-mailman (input) for mailman id 659139;
 Thu, 21 Dec 2023 19:38:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rGOsK-0005an-FS
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 19:38:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGOsJ-0008Fk-3l; Thu, 21 Dec 2023 19:38:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGOsI-0007gP-T7; Thu, 21 Dec 2023 19:38:31 +0000
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
	bh=Pnv9DdOjrCBweaguwfyYYdgGnQ3NMsrhFVdslJlEWWY=; b=s2b/O1w2SFwGXYz3598mRYtOPr
	sZuF7Vs8+qBK4zdDExY9NkWBgPf6fruaJs0XObXpk+TNQT+WZ/ISmPxLg3ffwmVjypsOH58Go4hFY
	dDFqo2RH7kgQjcSwdRZzGdKGRAD56w7ME7lem3R+a+X+Op4nh7vjHrwO5neJSf3ehDNA=;
Message-ID: <f41894c6-b061-4aef-9d4a-18effd917043@xen.org>
Date: Thu, 21 Dec 2023 19:38:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 9/9] xen/asm-generic: introduce generic device.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Shawn Anastasio <sanastasio@raptorengineering.com>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <55d6810e2f8b0f54261c504354bf879c5b887c40.1703072575.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <55d6810e2f8b0f54261c504354bf879c5b887c40.1703072575.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/12/2023 14:08, Oleksii Kurochko wrote:
> Arm, PPC and RISC-V use the same device.h thereby device.h
> was moved to asm-generic. Arm's device.h was taken as a base with
> the following changes:
>   - #ifdef PCI related things.
>   - #ifdef ACPI related things.
>   - Rename #ifdef guards.
>   - Add SPDX tag.
>   - #ifdef CONFIG_HAS_DEVICE_TREE related things.
>   - #ifdef-ing iommu related things with CONFIG_HAS_PASSTHROUGH.
> 
> Also Arm and PPC are switched to asm-generic version of device.h
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> 
>       Jan wrote the following:
>         Overall I think there are too many changes done all in one go here.
>         But it's mostly Arm which is affected, so I'll leave judging about that
>         to the Arm maintainers.
>       
>       Arm maintainers, will it be fine for you to not split the patch?

So in general I agree with Jan, patches should be kept small so they are 
easy to review.

Given the discussion has been on-going for a while (we are at v6),  I 
will give an attempt to review the patch as-is. But in the future, 
please try to split. The smaller it is, the easier to review. For code 
movement and refactoring, I tend to first have a few refactoring patches 
and then move the code in a separate patch. So it is easier to spot the 
differences.

> ---
> Changes in V6:
>   - Rebase only.
> ---
> Changes in V5:
>    - Removed generated file: xen/include/headers++.chk.new
>    - Removed pointless #ifdef CONFIG_HAS_DEVICE_TREE ... #endif for PPC as
>      CONFIG_HAS_DEVICE_TREE will be always used for PPC.
> ---
> Changes in V4:
>   - Updated the commit message
>   - Switched Arm and PPC to asm-generic version of device.h
>   - Replaced HAS_PCI with CONFIG_HAS_PCI
>   - ifdef-ing iommu filed of dev_archdata struct with CONFIG_HAS_PASSTHROUGH
>   - ifdef-ing iommu_fwspec of device struct with CONFIG_HAS_PASSTHROUGH
>   - ifdef-ing DT related things with CONFIG_HAS_DEVICE_TREE
>   - Updated the commit message ( remove a note with question about
>     if device.h should be in asm-generic or not )
>   - Replaced DEVICE_IC with DEVICE_INTERRUPT_CONTROLLER
>   - Rationalized usage of CONFIG_HAS_* in device.h
>   - Fixed indents for ACPI_DEVICE_START and ACPI_DEVICE_END
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
>   xen/arch/arm/device.c                         |  15 ++-
>   xen/arch/arm/domain_build.c                   |   2 +-
>   xen/arch/arm/gic-v2.c                         |   4 +-
>   xen/arch/arm/gic-v3.c                         |   6 +-
>   xen/arch/arm/gic.c                            |   4 +-
>   xen/arch/arm/include/asm/Makefile             |   1 +
>   xen/arch/ppc/include/asm/Makefile             |   1 +
>   xen/arch/ppc/include/asm/device.h             |  53 --------
>   .../asm => include/asm-generic}/device.h      | 125 +++++++++++-------
>   9 files changed, 102 insertions(+), 109 deletions(-)
>   delete mode 100644 xen/arch/ppc/include/asm/device.h
>   rename xen/{arch/arm/include/asm => include/asm-generic}/device.h (79%)
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 1f631d3274..affbe79f9a 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -16,7 +16,10 @@
>   #include <xen/lib.h>
>   
>   extern const struct device_desc _sdevice[], _edevice[];
> +
> +#ifdef CONFIG_ACPI
>   extern const struct acpi_device_desc _asdevice[], _aedevice[];
> +#endif
>   
>   int __init device_init(struct dt_device_node *dev, enum device_class class,
>                          const void *data)
> @@ -45,6 +48,7 @@ int __init device_init(struct dt_device_node *dev, enum device_class class,
>       return -EBADF;
>   }
>   
> +#ifdef CONFIG_ACPI
>   int __init acpi_device_init(enum device_class class, const void *data, int class_type)
>   {
>       const struct acpi_device_desc *desc;
> @@ -61,6 +65,7 @@ int __init acpi_device_init(enum device_class class, const void *data, int class
>   
>       return -EBADF;
>   }
> +#endif
>   
>   enum device_class device_get_class(const struct dt_device_node *dev)
>   {
> @@ -329,9 +334,13 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>       struct map_range_data mr_data = {
>           .d = d,
>           .p2mt = p2mt,
> -        .skip_mapping = !own_device ||
> -                        (is_pci_passthrough_enabled() &&
> -                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
> +        .skip_mapping =
> +                        !own_device
> +#ifdef CONFIG_HAS_PCI
> +                        || (is_pci_passthrough_enabled() &&
> +                        (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE))
> +#endif

So the #ifdef is only here because DEVICE_PCI_HOSTBRIDGE is not defined. 
It is not clear what's the actual problem of keeping 
DEVICE_PCI_HOSTBRIDGE available for every build.

In fact, we have tried to get away from #ifdef in order to make ensure 
we can catch any build failure without a randconfig (see use of 
IS_ENABLED() which would not apply work here).

[...]

> diff --git a/xen/arch/ppc/include/asm/device.h b/xen/arch/ppc/include/asm/device.h
> deleted file mode 100644
> index 8253e61d51..0000000000
> --- a/xen/arch/ppc/include/asm/device.h
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -#ifndef __ASM_PPC_DEVICE_H__
> -#define __ASM_PPC_DEVICE_H__
> -
> -enum device_type
> -{
> -    DEV_DT,
> -    DEV_PCI,
> -};
> -
> -struct device {
> -    enum device_type type;
> -#ifdef CONFIG_HAS_DEVICE_TREE
> -    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
> -#endif
> -};
> -
> -enum device_class
> -{
> -    DEVICE_SERIAL,
> -    DEVICE_IOMMU,
> -    DEVICE_PCI_HOSTBRIDGE,
> -    /* Use for error */
> -    DEVICE_UNKNOWN,
> -};
> -
> -struct device_desc {
> -    /* Device name */
> -    const char *name;
> -    /* Device class */
> -    enum device_class class;
> -    /* List of devices supported by this driver */
> -    const struct dt_device_match *dt_match;
> -    /*
> -     * Device initialization.
> -     *
> -     * -EAGAIN is used to indicate that device probing is deferred.
> -     */
> -    int (*init)(struct dt_device_node *dev, const void *data);
> -};
> -
> -typedef struct device device_t;
> -
> -#define DT_DEVICE_START(name_, namestr_, class_)                    \
> -static const struct device_desc __dev_desc_##name_ __used           \
> -__section(".dev.info") = {                                          \
> -    .name = namestr_,                                               \
> -    .class = class_,                                                \
> -
> -#define DT_DEVICE_END                                               \
> -};
> -
> -#endif /* __ASM_PPC_DEVICE_H__ */
> diff --git a/xen/arch/arm/include/asm/device.h b/xen/include/asm-generic/device.h
> similarity index 79%
> rename from xen/arch/arm/include/asm/device.h
> rename to xen/include/asm-generic/device.h
> index b5d451e087..063c448c4e 100644
> --- a/xen/arch/arm/include/asm/device.h
> +++ b/xen/include/asm-generic/device.h
> @@ -1,14 +1,37 @@
> -#ifndef __ASM_ARM_DEVICE_H
> -#define __ASM_ARM_DEVICE_H
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_DEVICE_H__
> +#define __ASM_GENERIC_DEVICE_H__
> +
> +#include <xen/stdbool.h>
>   
>   enum device_type
>   {
> +#ifdef CONFIG_HAS_DEVICE_TREE
>       DEV_DT,
> +#endif
> +
> +#ifdef CONFIG_HAS_PCI
>       DEV_PCI,
> +#endif
> +    DEV_TYPE_MAX,
Nobody is using it. AFAICT, this was introduced because enum may be 
empty if !HAS_DEVICE_TREE and !HAS_PCI. If so, can you add a comment 
explaining it on top?

The rest LGTM.

Cheers,

-- 
Julien Grall

