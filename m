Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500BF7FC7EA
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 22:29:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643524.1003810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85dU-0005gz-OI; Tue, 28 Nov 2023 21:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643524.1003810; Tue, 28 Nov 2023 21:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85dU-0005eI-LB; Tue, 28 Nov 2023 21:28:52 +0000
Received: by outflank-mailman (input) for mailman id 643524;
 Tue, 28 Nov 2023 21:28:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r85dS-0005WO-II
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 21:28:50 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e5870bf-8e35-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 22:28:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 49BAA8285461;
 Tue, 28 Nov 2023 15:28:48 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kaVquueqcWZq; Tue, 28 Nov 2023 15:28:47 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 47E5782855A6;
 Tue, 28 Nov 2023 15:28:47 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Nc5KXLy-ckZ1; Tue, 28 Nov 2023 15:28:47 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 9753F8285461;
 Tue, 28 Nov 2023 15:28:46 -0600 (CST)
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
X-Inumbo-ID: 1e5870bf-8e35-11ee-98e3-6d05b1d4d9a1
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 47E5782855A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701206927; bh=sqRcJdVouJOE3MNExJwnNc9doiygwMWuN+/sl61rL00=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=QiLeZNBKHuFt39gRJfc6xHTYg2deZDHq0+2yv9qX9jLd2yRlVvYX6AnVDTCjK48VW
	 MTy/ED/g1A9WGksKR7k09CTx9zuy3ingA6YTOTy8hK5Otf2BrDjc2rB6kQWc1X+Fcy
	 tZzwH3VlpZY61aJ37Azkyz5qt0gQ1gTPUaM9x40E=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <98023f51-5953-4384-918d-ae726d74ef7c@raptorengineering.com>
Date: Tue, 28 Nov 2023 15:28:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] xen/asm-generic: introduce generic device.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <67172a4fbf88833480203fcb1e2c640b6d39a556.1701093907.git.oleksii.kurochko@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <67172a4fbf88833480203fcb1e2c640b6d39a556.1701093907.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Oleksii,

On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
> diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
> index ece7fa66dd..df4c1ebb08 100644
> --- a/xen/arch/ppc/include/asm/Makefile
> +++ b/xen/arch/ppc/include/asm/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +generic-y += device.h
>  generic-y += paging.h
>  generic-y += vm_event.h
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
> diff --git a/xen/arch/ppc/include/asm/irq.h b/xen/arch/ppc/include/asm/irq.h
> index 5c37d0cf25..49193fddff 100644
> --- a/xen/arch/ppc/include/asm/irq.h
> +++ b/xen/arch/ppc/include/asm/irq.h
> @@ -3,7 +3,9 @@
>  #define __ASM_PPC_IRQ_H__
>  
>  #include <xen/lib.h>
> +#ifdef CONFIG_HAS_DEVICE_TREE

I realize that you were likely following PPC's device.h which also
checks CONFIG_HAS_DEVICE_TREE, but I'm not sure that it makes sense to
check this conditional in PPC code at all -- we will always have
HAS_DEVICE_TREE (selected by PPC) and I can't imagine a scenario where
this will ever not be the case.

Unless Jan (or someone else) disagrees, I'd rather this conditional be
dropped inside of PPC code.

>  #include <xen/device_tree.h>
> +#endif
>  #include <public/device_tree_defs.h>
>  
>  /* TODO */
> @@ -25,9 +27,11 @@ static inline void arch_move_irqs(struct vcpu *v)
>      BUG_ON("unimplemented");
>  }
>  
> +#ifdef CONFIG_HAS_DEVICE_TREE

Ditto.

>  static inline int platform_get_irq(const struct dt_device_node *device, int index)
>  {
>      BUG_ON("unimplemented");
>  }
> +#endif
>  
>  #endif /* __ASM_PPC_IRQ_H__ */

Thanks,
Shawn

