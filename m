Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AFB46657C
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 15:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236628.410491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnFW-0005hl-UF; Thu, 02 Dec 2021 14:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236628.410491; Thu, 02 Dec 2021 14:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msnFW-0005ew-QG; Thu, 02 Dec 2021 14:39:50 +0000
Received: by outflank-mailman (input) for mailman id 236628;
 Thu, 02 Dec 2021 14:39:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w6ez=QT=gmail.com=wei.liu.linux@srs-se1.protection.inumbo.net>)
 id 1msnFV-0005ep-Io
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 14:39:49 +0000
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b33f68c9-537d-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 15:39:48 +0100 (CET)
Received: by mail-wr1-f49.google.com with SMTP id c4so60109840wrd.9
 for <xen-devel@lists.xenproject.org>; Thu, 02 Dec 2021 06:39:48 -0800 (PST)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id z5sm2876037wmp.26.2021.12.02.06.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 06:39:47 -0800 (PST)
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
X-Inumbo-ID: b33f68c9-537d-11ec-b1df-f38ee3fbfdf7
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=72a6A507OnldVCWrhDSc/GY7lKjxc4B5WRBxEFXAJ3U=;
        b=j29VSA2nzfxWr/3i4tutxcCgbxCipuNnqH5nzUF0LNptmlDTLmthQmiMXIfAXKUASa
         1KajBlgOHnA2mSB4dcJNmOZad8n3FwZ/PXB+aXITs2jzCgFemWvOI+pJqRdoFP7yX/r5
         JQTibtGVMJYkLhbQRihY7RqMHvnxkFqJHdvHSFxWT+e9aM0Y0GCmrg+61UNRokJECdez
         tMEndJwszy+oyWCHdE7IYeNp9V3m8oTFAPra/JUl5t536OJf0BHOHkvq3Z2Pag98/m44
         JfhZLmQBtlO8iP8zFO0ttAzsE0DioWxzjDmkfTJFOKlvrVjBEIs6ctIovKso+bfcOOk1
         +wdQ==
X-Gm-Message-State: AOAM532HiH76ptzhSg4deWWZRsOjnX2tKfsHlR6ZSfarcwYi8f8REP2+
	TpZWwRvP1ucNO66pDtJjkcY=
X-Google-Smtp-Source: ABdhPJxPzdtd3RdqIbFdq4J+qJfyoes2s3XiUvAs4cyVDgX4hcthvPCvHGkt6Ry5P/1NlIy3ec+13w==
X-Received: by 2002:adf:d4c2:: with SMTP id w2mr14815368wrk.225.1638455988303;
        Thu, 02 Dec 2021 06:39:48 -0800 (PST)
Date: Thu, 2 Dec 2021 14:39:46 +0000
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
Subject: Re: [PATCH V3 2/5] x86/hyper-v: Add hyperv Isolation VM check in the
 cc_platform_has()
Message-ID: <20211202143946.7o7ncwcjq3t6xcrq@liuwe-devbox-debian-v2>
References: <20211201160257.1003912-1-ltykernel@gmail.com>
 <20211201160257.1003912-3-ltykernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201160257.1003912-3-ltykernel@gmail.com>

On Wed, Dec 01, 2021 at 11:02:53AM -0500, Tianyu Lan wrote:
> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> Hyper-V provides Isolation VM which has memory encrypt support. Add
> hyperv_cc_platform_has() and return true for check of GUEST_MEM_ENCRYPT
> attribute.
> 
> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
> ---
>  arch/x86/kernel/cc_platform.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/x86/kernel/cc_platform.c b/arch/x86/kernel/cc_platform.c
> index 03bb2f343ddb..f3bb0431f5c5 100644
> --- a/arch/x86/kernel/cc_platform.c
> +++ b/arch/x86/kernel/cc_platform.c
> @@ -11,6 +11,7 @@
>  #include <linux/cc_platform.h>
>  #include <linux/mem_encrypt.h>
>  
> +#include <asm/mshyperv.h>
>  #include <asm/processor.h>
>  
>  static bool __maybe_unused intel_cc_platform_has(enum cc_attr attr)
> @@ -58,9 +59,23 @@ static bool amd_cc_platform_has(enum cc_attr attr)
>  #endif
>  }
>  
> +static bool hyperv_cc_platform_has(enum cc_attr attr)
> +{
> +#ifdef CONFIG_HYPERV
> +	if (attr == CC_ATTR_GUEST_MEM_ENCRYPT)
> +		return true;
> +	else
> +		return false;

This can be simplified as

	return attr == CC_ATTR_GUEST_MEM_ENCRYPT;


Wei.

