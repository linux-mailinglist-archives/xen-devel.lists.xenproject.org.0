Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185FC46659E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 15:44:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236668.410545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnJF-0000xh-At; Thu, 02 Dec 2021 14:43:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236668.410545; Thu, 02 Dec 2021 14:43:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnJF-0000ux-7C; Thu, 02 Dec 2021 14:43:41 +0000
Received: by outflank-mailman (input) for mailman id 236668;
 Thu, 02 Dec 2021 14:43:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w6ez=QT=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1msnJE-0000t3-Dd
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 14:43:40 +0000
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cce049c-537e-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 15:43:39 +0100 (CET)
Received: by mail-wm1-f49.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so3775418wmb.0
 for <xen-devel@lists.xenproject.org>; Thu, 02 Dec 2021 06:43:39 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id b15sm3831942wri.62.2021.12.02.06.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 06:43:38 -0800 (PST)
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
X-Inumbo-ID: 3cce049c-537e-11ec-b1df-f38ee3fbfdf7
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ngfxfU8cMx05IJ2GEXLujweygC6BKjS+/TEJnexPuyU=;
        b=wn3pWrpHgyaKMDcCD1+lUt5MhetWnEo7gl6WsjkzOuiL/YxUvV2hu7ff/Uixgt/N8k
         xer8Jy+FmVUDA12MO/NiHDEO+5sHOMntiDnVfCUgW7D4B3h6SakVfJh8mMq+LJJ2Y7mb
         udjT5QwnO98CXBMJRComHn7RNksXWI2Fj1MalWEcBlBEYAurQgosqEUCULBWh2nWyuG+
         PGAQcZateUgvjWRpAEMF8SfOSJIqhXMVTeL9DO7bMMhyJQCKrBFZWBDxbVvHtSvbu3WV
         1UJ0TIjAAtl6lf1r+/dWDSBEbpQ/nzqveowAjlFvVnpHjsA4tY4LNhyMSM5uWIelFH4v
         UiPQ==
X-Gm-Message-State: AOAM532ov/ixCe7DXTqcCO2cOfF5+NCHcN4KgvcPdsUwJns6V3Fq3v9U
	URF11tX1bxRoH/ZQhcs1dHs=
X-Google-Smtp-Source: ABdhPJzcC/sLI+YXsme26UERQHG8ONsijhz0w3mw0YtYq520oHvctN0qsFmSNBM5FNo5EKfA2KQfgA==
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr7167526wmh.99.1638456219030;
        Thu, 02 Dec 2021 06:43:39 -0800 (PST)
Date: Thu, 2 Dec 2021 14:43:36 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Tianyu Lan <ltykernel@gmail.com>
Cc: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
	wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, jgross@suse.com,
	sstabellini@kernel.org, boris.ostrovsky@oracle.com, joro@8bytes.org,
	will@kernel.org, davem@davemloft.net, kuba@kernel.org,
	jejb@linux.ibm.com, martin.petersen@oracle.com, arnd@arndb.de,
	hch@infradead.org, m.szyprowski@samsung.com, robin.murphy@arm.com,
	Tianyu.Lan@microsoft.com, thomas.lendacky@amd.com,
	xen-devel@lists.xenproject.org, michael.h.kelley@microsoft.com,
	iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
	vkuznets@redhat.com, brijesh.singh@amd.com, konrad.wilk@oracle.com,
	hch@lst.de, parri.andrea@gmail.com, dave.hansen@intel.com
Subject: Re: [PATCH V3 3/5] hyperv/IOMMU: Enable swiotlb bounce buffer for
 Isolation VM
Message-ID: <20211202144336.z2sfs6kw5kdsfqgv@liuwe-devbox-debian-v2>
References: <20211201160257.1003912-1-ltykernel@gmail.com>
 <20211201160257.1003912-4-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201160257.1003912-4-ltykernel@gmail.com>

On Wed, Dec 01, 2021 at 11:02:54AM -0500, Tianyu Lan wrote:
[...]
> diff --git a/arch/x86/xen/pci-swiotlb-xen.c b/arch/x86/xen/pci-swiotlb-xen.c
> index 46df59aeaa06..30fd0600b008 100644
> --- a/arch/x86/xen/pci-swiotlb-xen.c
> +++ b/arch/x86/xen/pci-swiotlb-xen.c
> @@ -4,6 +4,7 @@
>  
>  #include <linux/dma-map-ops.h>
>  #include <linux/pci.h>
> +#include <linux/hyperv.h>
>  #include <xen/swiotlb-xen.h>
>  
>  #include <asm/xen/hypervisor.h>
> @@ -91,6 +92,6 @@ int pci_xen_swiotlb_init_late(void)
>  EXPORT_SYMBOL_GPL(pci_xen_swiotlb_init_late);
>  
>  IOMMU_INIT_FINISH(pci_xen_swiotlb_detect,
> -		  NULL,
> +		  hyperv_swiotlb_detect,

It is not immediately obvious why this is needed just by reading the
code. Please consider copying some of the text in the commit message to
a comment here.

Thanks,
Wei.

