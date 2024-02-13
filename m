Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E68853981
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 19:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.680128.1058020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZxDl-00053T-Da; Tue, 13 Feb 2024 18:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 680128.1058020; Tue, 13 Feb 2024 18:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZxDl-00051D-Ar; Tue, 13 Feb 2024 18:09:29 +0000
Received: by outflank-mailman (input) for mailman id 680128;
 Tue, 13 Feb 2024 18:09:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rZxDj-000517-VA
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 18:09:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZxDj-00057P-B5; Tue, 13 Feb 2024 18:09:27 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZxDi-0002nI-W2; Tue, 13 Feb 2024 18:09:27 +0000
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
	bh=WH4dDpmR8qnYftqOLkvo3sWofuuVs8eP8PxR39ySo/w=; b=j8ySydJOi/m1UjolBaJNPA5Yd5
	CBBZ0CG+ECESxpRmWjbWoVGn7OQfQnfz+gKuG9Guo6l+WrernBS1lTY/ARhYGQ1+ijGVMclFeHtWD
	Zf8nsGq7CGlLEowwh7/450L3lBYAngA4nvvbIvTwd+2u9jg05pP7KPcFdyfrHN3I64dI=;
Message-ID: <319dcf7a-88cd-488e-ae51-6c20c19d8f22@xen.org>
Date: Tue, 13 Feb 2024 18:09:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/7] xen/asm-generic: introduce generic device.h
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1707499278.git.oleksii.kurochko@gmail.com>
 <4ecb5e5f4a1dbf585ac7a9ebe40b5fd8e4709182.1707499278.git.oleksii.kurochko@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4ecb5e5f4a1dbf585ac7a9ebe40b5fd8e4709182.1707499278.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 09/02/2024 18:00, Oleksii Kurochko wrote:
> diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
> new file mode 100644
> index 0000000000..6e56658271
> --- /dev/null
> +++ b/xen/include/asm-generic/device.h
> @@ -0,0 +1,149 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_DEVICE_H__
> +#define __ASM_GENERIC_DEVICE_H__
> +
> +#include <xen/stdbool.h>
> +
> +enum device_type
> +{
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    DEV_DT,
> +#endif
> +    DEV_PCI
> +};
> +
> +enum device_class
> +{
> +    DEVICE_SERIAL,
> +    DEVICE_IOMMU,
> +    DEVICE_INTERRUPT_CONTROLLER,
> +    DEVICE_PCI_HOSTBRIDGE,
> +    /* Use for error */
> +    DEVICE_UNKNOWN,
> +};
> +
> +struct dev_archdata {
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +    void *iommu;    /* IOMMU private data */
> +#endif > +};

It is a bit too late to change, but I thought I would point it if 
someone wants to send a follow-up. It is a bit odd to have a structure 
dev_archdata that, if I am not mistaken, is only used ...

> +
> +/* struct device - The basic device structure */
> +struct device
> +{
> +    enum device_type type;
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +    struct dt_device_node *of_node; /* Used by drivers imported from Linux */
> +#endif
> +    struct dev_archdata archdata;

... in struct device. Looking at the use, I believe this was only 
introduced to try to keep that SMMU code close to Linux. I would 
consider to fold the other structure and update dev_archdata() in 
drivers/passthrough/arm/smmu.c.

> +#ifdef CONFIG_HAS_PASSTHROUGH
> +    struct iommu_fwspec *iommu_fwspec; /* per-device IOMMU instance data */
> +#endif
> +};
> +
> +typedef struct device device_t;
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +
> +#include <xen/device_tree.h>
> +
> +#define dev_is_dt(dev)  ((dev)->type == DEV_DT)
> +
> +/**
> + *  device_init - Initialize a device
> + *  @dev: device to initialize
> + *  @class: class of the device (serial, network...)
> + *  @data: specific data for initializing the device
> + *
> + *  Return 0 on success.
> + */
> +int device_init(struct dt_device_node *dev, enum device_class class,
> +                const void *data);
> +
> +/**
> + * device_get_type - Get the type of the device
> + * @dev: device to match
> + *
> + * Return the device type on success or DEVICE_ANY on failure
> + */
> +enum device_class device_get_class(const struct dt_device_node *dev);
> +
> +#define DT_DEVICE_START(name_, namestr_, class_)            \
> +static const struct device_desc __dev_desc_##name_ __used   \
> +__section(".dev.info") = {                                  \
> +    .name = namestr_,                                       \
> +    .class = class_,
> +
> +#define DT_DEVICE_END                                       \
> +};
> +
> +#else /* !CONFIG_HAS_DEVICE_TREE */
> +#define dev_is_dt(dev) ((void)(dev), false)
> +#endif /* CONFIG_HAS_DEVICE_TREE */
> +
> +#define dev_is_pci(dev) ((dev)->type == DEV_PCI)
> +
> +struct device_desc {
> +    /* Device name */
> +    const char *name;
> +    /* Device class */
> +    enum device_class class;
> +
> +#ifdef CONFIG_HAS_DEVICE_TREE
> +
> +    /* List of devices supported by this driver */
> +    const struct dt_device_match *dt_match;
> +    /*
> +     * Device initialization.
> +     *
> +     * -EAGAIN is used to indicate that device probing is deferred.
> +     */
> +    int (*init)(struct dt_device_node *dev, const void *data);
> +
> +#endif
> +};
I am not sure I fully understand why "device_desc" is not protected by 
CONFIG_HAS_DEVICE_TREE. The structure doesn't mean much when the config 
is disabled. Can you clarify?

Cheers,

-- 
Julien Grall

