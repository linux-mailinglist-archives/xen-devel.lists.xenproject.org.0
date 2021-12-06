Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9327F469ED7
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 16:41:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239296.414766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muG6t-0003ef-QW; Mon, 06 Dec 2021 15:40:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239296.414766; Mon, 06 Dec 2021 15:40:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muG6t-0003cJ-N6; Mon, 06 Dec 2021 15:40:59 +0000
Received: by outflank-mailman (input) for mailman id 239296;
 Mon, 06 Dec 2021 15:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gMFW=QX=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1muG6t-0003cD-4T
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 15:40:59 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7ebeb79-56aa-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 16:40:58 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:35444)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1muG6o-000NXy-6z (Exim 4.95) (return-path <amc96@srcf.net>);
 Mon, 06 Dec 2021 15:40:54 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id ACFE01FC17;
 Mon,  6 Dec 2021 15:40:53 +0000 (GMT)
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
X-Inumbo-ID: e7ebeb79-56aa-11ec-a5e1-b9374ead2679
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <88d03de3-587c-c5e5-3e36-975bd5994503@srcf.net>
Date: Mon, 6 Dec 2021 15:40:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm: Add Kconfig parameter for memory banks number
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20211206153730.49791-1-luca.fancellu@arm.com>
From: Andrew Cooper <amc96@srcf.net>
In-Reply-To: <20211206153730.49791-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/12/2021 15:37, Luca Fancellu wrote:
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index 95da0b7ab9cd..785a8fe81450 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -6,7 +6,7 @@
>  #define MIN_FDT_ALIGN 8
>  #define MAX_FDT_SIZE SZ_2M
>  
> -#define NR_MEM_BANKS 128
> +#define NR_MEM_BANKS CONFIG_MEM_BANKS

$ git grep -wc NR_MEM_BANKS
arch/arm/bootfdt.c:1
arch/arm/domain_build.c:5
arch/arm/efi/efi-boot.h:3
include/asm-arm/setup.h:2

For this few instances, it is probably better to use CONFIG_MEM_BANKS
everywhere, rather than add the level of indirection.

~Andrew

