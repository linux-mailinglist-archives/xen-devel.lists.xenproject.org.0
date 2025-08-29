Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF19B3BCB1
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 15:43:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101383.1454476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzNO-0006Iq-SB; Fri, 29 Aug 2025 13:42:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101383.1454476; Fri, 29 Aug 2025 13:42:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urzNO-0006Gp-OS; Fri, 29 Aug 2025 13:42:46 +0000
Received: by outflank-mailman (input) for mailman id 1101383;
 Fri, 29 Aug 2025 13:42:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OeP6=3J=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1urzNN-0006Gj-Qa
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 13:42:45 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a3781af-84de-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 15:42:43 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3367f35d129so16516051fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 06:42:43 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336b4613b3fsm4838231fa.4.2025.08.29.06.42.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 06:42:42 -0700 (PDT)
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
X-Inumbo-ID: 0a3781af-84de-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756474963; x=1757079763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wGUhLh5SfR/wysjZTcHM9sBL1wAIwh88fS7RRAtLMSA=;
        b=XmBsIs3XbDzPaAFlhu0Vtov2d3TG6R3D/XymktVxDqPWEpn/0xpsdUu34zxRf01kkX
         G1nrAMrbr9btRua0KfhzJuuunYbJt86Peo2H1dVzLsvDt8Z3INzp/BV29tW0rnhgWDcY
         nF9x5Wynt2nt/9+cdxuaUdKn/bW9B9mfdcBBaxAhEd8fSi2V1bgwHHL42EprWySe28oM
         ttyceog5qie5yY8YkAZgk6zOJpxWN+7xC0OP3LsqZzHnbej+lQSKriDnebQODO8o517t
         GGgpK9dt4/Hy3JoySIGg+UNDvCzwemIdiF77XdUZT4YKWxvHiLUah58ZwTghBEkNL0nz
         OzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756474963; x=1757079763;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGUhLh5SfR/wysjZTcHM9sBL1wAIwh88fS7RRAtLMSA=;
        b=JJl2v0PCDA+cMLQCPLeAqaZpyq/d1WZlfSKOwEt/jGpbaHT1cY+ZNATPo/sSsW0d4n
         g+rZ+0PpMOM2P+9gr3qlM5JT+I+wObfTNinoZOvHnj/4UxasLWyrKztgwRwtaj0Hzid0
         RLgccmHHGiwNyrzs3BDPdT4nN72E9FhE2L7gytDVW2Tdih112ncHnPbA+I3RYeHdls2j
         etWCmG/CfHwBYUVOmDxdr0esUwHowDAQQEhJkV+uyAbAYJytrn54GeSeAwwlWAnRLsdt
         CfgMsP1UhKn+yoeHe5EOkrYG5RPtVtyzcEG4zY3QYbRax37tUDZ3PStCAMCu5GdjyCBm
         uunQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7wYwxhhOvJAVqShy9MGWxw4vaAOUDwISnugV5ceBwXnCuu3BCVhvix1KHozTO6kmHfund7AWxQwY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxdJSQbmqdKOtbx7b0AYEHEg9EKjPz7JypbEyfyxqk8wwX/hWkH
	0ZKPLuUVMoObzatRg5YLZumQ/pH3tGDtyPWAfzEyaGuFul+RdMq83mbH
X-Gm-Gg: ASbGnctVCLcODFuarsHrV+BIp8tJIEJIDXpUIMKYnib9J9bqmZCfVKpY6kzwB0lDVDh
	3AVocEMYTy3zWjcUBHBk4eecfQ14GZ2X9tkFZnoO1rify9r8eJvEIGBziGZ67RHjwr/oxJJ/Bwg
	7MNlMl8SYmAtnBcgLuCN3klXC7sITHJ9CY+q/Bc/3xjCpsVmoS6sfgtxlIYXE4P4tGRTTgtrjXw
	GQyB2mPPS/BwiwttMr3N0VyCdCOiq7MP4DQf/PUj8kGQjoZ9O0hnPHYNEKSB3HIHyAM9WV/ctfA
	gdhhFtQVY18RVK5tlw7iEck+gBVtPuBNlV5/Iwed3obeqfaQjBjv+QsDOfKXxv28VSPAbZ/VYp0
	c7u8BV/yzgKeQKhadGvsW1PxLXxEAfl5QrxoZ
X-Google-Smtp-Source: AGHT+IFALNpb3nC81kowaiHqEifiR/pNYJ6e7hHWPU+D057zWTnUGYKxj98hqGmWAf9X4LiBfkTBvw==
X-Received: by 2002:a05:651c:20cc:20b0:32b:78ce:be8e with SMTP id 38308e7fff4ca-33650faa9c1mr57185501fa.32.1756474962905;
        Fri, 29 Aug 2025 06:42:42 -0700 (PDT)
Message-ID: <c51b2a15-dcc2-467c-904c-ef01c37ef5de@gmail.com>
Date: Fri, 29 Aug 2025 16:42:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] xen/arm: add generic SCI subsystem
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com>
 <ffe5a45efd34d92c9f2c7307ecd0e9efc5b0d57c.1756399156.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <ffe5a45efd34d92c9f2c7307ecd0e9efc5b0d57c.1756399156.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28.08.25 19:40, Oleksii Moisieiev wrote:

Hello Oleksii


> This patch adds the basic framework for ARM SCI mediator. SCI is System
> Control Interface, which is designed to redirect requests from the Domains
> to ARM specific Firmware (for example SCMI). This will allow the devices,
> passed-through to the different Domains, to access to the System resources
> (such as clocks/resets etc) by sending requests to the firmware.
> 
> ARM SCI subsystem allows to implement different SCI drivers to handle
> specific ARM firmware interfaces (like ARM SCMI) and mediate requests
> -between the Domains and the Firmware. Also it allows SCI drivers to perform
> proper action during Domain creation/destruction which is vital for
> handling use cases like Domain reboot.
> 
> This patch introduces new DEVICE_FIRMWARE device subclass for probing SCI
> drivers basing on device tree, SCI drivers register itself with
> DT_DEVICE_START/END macro. On init - the SCI drivers should register its
> SCI ops with sci_register(). Only one SCI driver can be supported.
> 
> At run-time, the following SCI API calls are introduced:
> 
> - sci_domain_sanitise_config() called from arch_sanitise_domain_config()
> - sci_domain_init() called from arch_domain_create()
> - sci_relinquish_resources() called from domain_relinquish_resources()
> - sci_domain_destroy() called from arch_domain_destroy()
> - sci_handle_call() called from vsmccc_handle_call()
> - sci_dt_handle_node()
> - sci_dt_finalize() called from handle_node() (Dom0 DT)
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> 
> Changes in v6:
> - rebase on top of the latest master
> - fix return value of sci_dt_finalize() call
> 
> Changes in v5:
> - update Maintainers file. Set role as a Reviewer
> - rebased on the latest master branch
> - Introduce arch_handle_passthrough_prop call to handle arm specific nodes
> 
> Changes in v4:
> - fix SPDX-License
> - rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
> - move XEN_DOMCTL_assign_device code in separate patch
> - Add documentation for SCI SCMI drivers
> 
>   MAINTAINERS                             |   6 +
>   xen/arch/arm/device.c                   |   5 +
>   xen/arch/arm/dom0less-build.c           |   8 +
>   xen/arch/arm/domain.c                   |  12 +-
>   xen/arch/arm/domain_build.c             |   8 +
>   xen/arch/arm/firmware/Kconfig           |   8 +
>   xen/arch/arm/firmware/Makefile          |   1 +
>   xen/arch/arm/firmware/sci.c             | 154 ++++++++++++++++++
>   xen/arch/arm/include/asm/domain.h       |   5 +
>   xen/arch/arm/include/asm/firmware/sci.h | 200 ++++++++++++++++++++++++
>   xen/arch/arm/vsmc.c                     |   3 +
>   xen/common/device-tree/dom0less-build.c |   4 +
>   xen/include/asm-generic/device.h        |   1 +
>   xen/include/public/arch-arm.h           |   4 +
>   xen/include/xen/dom0less-build.h        |   9 ++
>   15 files changed, 427 insertions(+), 1 deletion(-)
>   create mode 100644 xen/arch/arm/firmware/sci.c
>   create mode 100644 xen/arch/arm/include/asm/firmware/sci.h

[snip]

> diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include/asm/firmware/sci.h
> new file mode 100644
> index 0000000000..1b9a5c0c07
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/firmware/sci.h
> @@ -0,0 +1,200 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Generic ARM SCI (System Control Interface) subsystem.
> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (c) 2025 EPAM Systems
> + */
> +
> +#ifndef __ASM_ARM_SCI_H
> +#define __ASM_ARM_SCI_H
> +
> +#include <xen/lib.h>
> +#include <xen/types.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/sched.h>

NIT: Looks like the headers are not alphabetically sorted

[snip]

>   
> diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-build.h
> index 408859e325..6fdd0552e0 100644
> --- a/xen/include/xen/dom0less-build.h
> +++ b/xen/include/xen/dom0less-build.h
> @@ -62,6 +62,9 @@ void set_domain_type(struct domain *d, struct kernel_info *kinfo);
>   int init_intc_phandle(struct kernel_info *kinfo, const char *name,
>                         const int node_next, const void *pfdt);
>   
> +int arch_handle_passthrough_prop(struct kernel_info *kinfo,
> +                                 struct dt_device_node *node);
> +
>   #else /* !CONFIG_DOM0LESS_BOOT */
>   
>   static inline void create_domUs(void) {}
> @@ -71,6 +74,12 @@ static inline bool is_dom0less_mode(void)
>   }
>   static inline void set_xs_domain(struct domain *d) {}
>   
> +static inline int arch_handle_passthrough_prop(struct kernel_info *kinfo,
> +                                               struct dt_device_node *node)
> +{
> +    return 0;
> +}
> +
>   #endif /* CONFIG_DOM0LESS_BOOT */
>   
>   #endif /* __ASM_GENERIC_DOM0LESS_BUILD_H__ */


If I build current patch with # CONFIG_DOM0LESS_BOOT is not set
I got the following error:

CC      arch/arm/domain_build.o
   CC      arch/arm/guestcopy.o
In file included from arch/arm/domain_build.c:5:
./include/xen/dom0less-build.h:78:55: error: 'struct dt_device_node' 
declared inside parameter list will not be visible outside of this 
definition or declaration [-Werror]
    78 |                                                struct 
dt_device_node *node)
       | 
^~~~~~~~~~~~~~
./include/xen/dom0less-build.h:77:55: error: 'struct kernel_info' 
declared inside parameter list will not be visible outside of this 
definition or declaration [-Werror]
    77 | static inline int arch_handle_passthrough_prop(struct 
kernel_info *kinfo,
       |                                                       ^~~~~~~~~~~



