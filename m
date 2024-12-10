Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E32509EAFEA
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 12:31:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.852182.1266069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKyRd-00078I-F8; Tue, 10 Dec 2024 11:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852182.1266069; Tue, 10 Dec 2024 11:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKyRd-00075P-Bb; Tue, 10 Dec 2024 11:30:25 +0000
Received: by outflank-mailman (input) for mailman id 852182;
 Tue, 10 Dec 2024 11:30:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Xbj=TD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tKyRc-00075H-4l
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 11:30:24 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2304eded-b6ea-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 12:30:19 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so805733366b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Dec 2024 03:30:19 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa6260a3832sm822436766b.166.2024.12.10.03.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2024 03:30:17 -0800 (PST)
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
X-Inumbo-ID: 2304eded-b6ea-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1733830219; x=1734435019; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yCIIPd0459B6cAccuKf52qBHLnigjf0mgiU8nw4HT4s=;
        b=N8v/AvZiZKK7/YlVxEkaQ/9toVkxMqSGt/mEWBghqzlmwCfFMrP2/OTcPkbU9nVyLJ
         xUjA7O/XNn0eDj5A7mjYS9aJBKEXPEoRlrFm8/ol3DIN7RMUMPcqw6f5VewGFEdGRMK2
         pd9Ahou6eZ6lgJMx5rtVgivcIT60uBVYIpOOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733830219; x=1734435019;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCIIPd0459B6cAccuKf52qBHLnigjf0mgiU8nw4HT4s=;
        b=oMVtIHvX7+VP7t72QBkQ3ODkacQTAAoAg0z2iRsHYXBmauurP16gEnzt7ZSC8MhdDB
         WBBTVNSv0z9ykk6VwzY8M+D0Bpwr7jtc8fNOnMBhk60lrXHl00M/SfchbnEM2RmqvGUd
         +eMmA650XjbrZkPpXBzUTJemztQNWS3uwiPv0D9PCq/WjTmL2lrvvlhCtek4C4r07Yr5
         /TGxg/ccScK0SsH8Doo3qkMX+1a/uD8Z34jKhGWzh7kvOnRCHKp+f6XWI3nSIVdfujdT
         JMliAiUQ/L2sQ8HYylZbdyvfFgo7RfX5LtunI/JwGwUeXXsRwvuxAevbgHtxxyqkeqkx
         Q41w==
X-Gm-Message-State: AOJu0YwIQMZ/Nb2knqUVwuT8ZPeLeiWnDHh1UCYOnRJqLq08D6lagvQZ
	EOCqpY71JAB3yOREYzkhrshh+qbCBUUVqd2gnYWi4H0QUZSqR7Sq6d0CYo3U1mk=
X-Gm-Gg: ASbGncuWYPD/nPBeYWUKnSRI+sSxE0QSGgn8dh+zZxoSOi6veBE/GMxWZrmZTzUmMlA
	8gdJVihg4x4MW1iHvc2nnws0Amunfiv9xj8aFZIS7c9zk2hdmcMBussqfFAiPWzlqOW5FGkPQLp
	F9h4HTX6ypRWgAQwR1J3zfL1LAhXyz4AvLK6Jdcvbqi/43RKjYiwSyJZhdRtL+N5QQ4VsMFJCvX
	boOGYbhGAdWtwurMbAGGAbz6MZHuITrCgpIHf/9dN48lT+flsdTkZk0m0D9n/Y=
X-Google-Smtp-Source: AGHT+IGwm1ZsvGprxO0EMIRJrWjFCGFgOD23UCUwso6Vm6r3lrHKZnXhLWg1dCbfkOTixPYFYAZaMQ==
X-Received: by 2002:a05:6402:274d:b0:5d0:9054:b119 with SMTP id 4fb4d7f45d1cf-5d4185d5fb5mr9731519a12.21.1733830217787;
        Tue, 10 Dec 2024 03:30:17 -0800 (PST)
Date: Tue, 10 Dec 2024 12:30:16 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Huang Rui <ray.huang@amd.com>
Subject: Re: [PATCH v2 1/1] vpci: Add resizable bar support
Message-ID: <Z1gmSPnkBz_Ob60b@macbook.local>
References: <20241202060956.1124162-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241202060956.1124162-1-Jiqian.Chen@amd.com>

On Mon, Dec 02, 2024 at 02:09:56PM +0800, Jiqian Chen wrote:
> Some devices, like discrete GPU of amd, support resizable bar
> capability, but vpci of Xen doesn't support this feature, so
> they fail to resize bars and then cause probing failure.
> 
> According to PCIe spec, each bar that supports resizing has
> two registers, PCI_REBAR_CAP and PCI_REBAR_CTRL. So, add
> handlers for them to support resizing the size of BARs.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> Hi all,
> 
> v2->v1 changes:
> *In rebar_ctrl_write, to check if memory decoding is enabled, and added
> some checks for the type of Bar.
> *Added vpci_hw_write32 to handle PCI_REBAR_CAP's write, since there is
> no write limitation of dom0.
> *And has many other minor modifications as well.
> 
> Best regards,
> Jiqian Chen.
> ---
>  xen/drivers/vpci/Makefile  |  2 +-
>  xen/drivers/vpci/rebar.c   | 93 ++++++++++++++++++++++++++++++++++++++
>  xen/drivers/vpci/vpci.c    |  6 +++
>  xen/include/xen/pci_regs.h | 11 +++++
>  xen/include/xen/vpci.h     |  2 +
>  5 files changed, 113 insertions(+), 1 deletion(-)
>  create mode 100644 xen/drivers/vpci/rebar.c
> 
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index 1a1413b93e76..a7c8a30a8956 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1,2 +1,2 @@
> -obj-y += vpci.o header.o
> +obj-y += vpci.o header.o rebar.o
>  obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
> new file mode 100644
> index 000000000000..156e8d337426
> --- /dev/null
> +++ b/xen/drivers/vpci/rebar.c
> @@ -0,0 +1,93 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (C) 2024 Advanced Micro Devices, Inc. All Rights Reserved.
> + *
> + * Author: Jiqian Chen <Jiqian.Chen@amd.com>
> + */
> +
> +#include <xen/hypercall.h>
> +#include <xen/vpci.h>
> +
> +static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
> +                                      unsigned int reg,
> +                                      uint32_t val,
> +                                      void *data)
> +{
> +    uint64_t size;
> +    unsigned int index;
> +    struct vpci_bar *bars = data;
> +
> +    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> +        return;
> +
> +    index = pci_conf_read32(pdev->sbdf, reg) & PCI_REBAR_CTRL_BAR_IDX;
> +    if ( index >= PCI_HEADER_NORMAL_NR_BARS )
> +        return;
> +
> +    if ( bars[index].type != VPCI_BAR_MEM64_LO &&
> +         bars[index].type != VPCI_BAR_MEM32 )
> +        return;

For those early returns that don't propagate the write to the
register, we need to log a message to notice the write has been
dropped, otherwise there's no way to identify such cases.

Thanks, Roger.

