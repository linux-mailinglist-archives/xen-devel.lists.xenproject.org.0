Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB865265D95
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 12:15:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGg5F-0000Ns-Ro; Fri, 11 Sep 2020 10:15:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KiK2=CU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGg5E-0000Nn-D3
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 10:15:08 +0000
X-Inumbo-ID: 3598deb4-f4e3-4d85-83ed-4f7bfbd38144
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3598deb4-f4e3-4d85-83ed-4f7bfbd38144;
 Fri, 11 Sep 2020 10:15:07 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w3so11942851ljo.5
 for <xen-devel@lists.xenproject.org>; Fri, 11 Sep 2020 03:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=IK/x2CV2mBLwCr1F7uRXD3hXkFs/Bw2wThKT/o1m4JQ=;
 b=s9ufz8eCIEGTGiptyZsDgV6FHaBBoUCgWA7HphKUkLvAk9SBkPCr6adhmuxdL8/crT
 jhfvldVRGKIT7bPL8mtrr9TMvQYe6APFAAr9B8BvtQ3b+WOK6IlWzgZ4wLAswCjv6Loe
 KrrYJ1u9Q8t/9dHGi5rDf00z7Fo/LZj/ldz3LVW9ONsEMuwZ11SOjpZf3W5244lPSkwq
 8z+0Ej1GOnBvTj8kdYE9e3kxryFFv6IWZBaWwBt+j0FhZa1EpDfXCaHGTPngeWc+gzvZ
 hAmRvSjfvzgSIg3WUlSbD0CrY2pMkp+IENLMlJxlF8LelSvaH9FtIGO+VZo89zps5gPn
 h8+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=IK/x2CV2mBLwCr1F7uRXD3hXkFs/Bw2wThKT/o1m4JQ=;
 b=C6rWPx8QsutUjprwdJGYaZQEuOXlzP/8IZ8sjC3F58c/s4BwLCVSF0JMtNmBLxIpo9
 sGcK6VuVGc8vGEry/2f+vzL2QMGHJS9Ndus0+H6ic1FhwFz6hedWxaRdUBmbiIhvBrw6
 MZ7FRvWC6wRos/vz00ubrLh+JZOTQO2R5TJkpMatA1lZMIaz8OkhuStM8WuV+uDY1v1r
 lXc2290xbo7861mGlg2zeC4yPOp4wHsHPNlGt70hP5hVlCdiX2tAxm4VXhWaeMPCinU3
 FGOyZazienM+/05AdH9wG+WMAJW3zdODMkjg1WcZ4RFbFFeVlMPvf/Ld49hGsbt9RmxH
 nl/g==
X-Gm-Message-State: AOAM533xtLaMwksTUDtTrojNCVOB5S55la3DHF46SxLQOsEztd0PVh37
 H6xL8DmC7hmIVXimPhTEbmQ=
X-Google-Smtp-Source: ABdhPJw4x2L+6jJnE1m5Ck1QD9nBu8XgV6P6pvoeGhIfdQul07imE93Jcr2TQUvi9Z5KPmUjB1ysbQ==
X-Received: by 2002:a2e:808b:: with SMTP id i11mr623659ljg.366.1599819306205; 
 Fri, 11 Sep 2020 03:15:06 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l17sm16720lfh.284.2020.09.11.03.15.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 03:15:05 -0700 (PDT)
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
From: Oleksandr <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
Message-ID: <c98a98fd-8700-c1d2-78f6-4415e149b6b2@gmail.com>
Date: Fri, 11 Sep 2020 13:14:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


Hello all.


>   /*
> diff --git a/xen/include/asm-arm/hvm/ioreq.h b/xen/include/asm-arm/hvm/ioreq.h
> new file mode 100644
> index 0000000..1c34df0
> --- /dev/null
> +++ b/xen/include/asm-arm/hvm/ioreq.h
> @@ -0,0 +1,108 @@
> +/*
> + * hvm.h: Hardware virtual machine assist interface definitions.
> + *
> + * Copyright (c) 2016 Citrix Systems Inc.
> + * Copyright (c) 2019 Arm ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License along with
> + * this program; If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#ifndef __ASM_ARM_HVM_IOREQ_H__
> +#define __ASM_ARM_HVM_IOREQ_H__
> +
> +#include <public/hvm/ioreq.h>
> +#include <public/hvm/dm_op.h>
> +
> +#ifdef CONFIG_IOREQ_SERVER
> +enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v);
> +enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> +                             struct vcpu *v, mmio_info_t *info);
> +#else
> +static inline enum io_state handle_ioserv(struct cpu_user_regs *regs,
> +                                          struct vcpu *v)
> +{
> +    return IO_UNHANDLED;
> +}
> +
> +static inline enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
> +                                           struct vcpu *v, mmio_info_t *info)
> +{
> +    return IO_UNHANDLED;
> +}
> +#endif
> +
> +bool ioreq_handle_complete_mmio(void);
> +
> +static inline bool handle_pio(uint16_t port, unsigned int size, int dir)
> +{
> +    /*
> +     * TODO: For Arm64, the main user will be PCI. So this should be
> +     * implemented when we add support for vPCI.
> +     */
> +    BUG();
> +    return true;
> +}
> +
> +static inline int arch_hvm_destroy_ioreq_server(struct hvm_ioreq_server *s)
> +{
> +    return 0;
> +}
> +
> +static inline void msix_write_completion(struct vcpu *v)
> +{
> +}
> +
> +static inline bool arch_handle_hvm_io_completion(
> +    enum hvm_io_completion io_completion)
> +{
> +    ASSERT_UNREACHABLE();

I am sorry, but there should be return true;
to avoid "no return statement in function returning non-void 
[-Werror=return-type]"
I am a little bit puzzled why I didn't spot this build error earlier.


> +}

-- 
Regards,

Oleksandr Tyshchenko


