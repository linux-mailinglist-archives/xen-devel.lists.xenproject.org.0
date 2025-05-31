Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57605AC98B5
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001780.1381904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAZX-0001Lv-O5; Sat, 31 May 2025 00:59:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001780.1381904; Sat, 31 May 2025 00:59:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAZX-0001KX-LK; Sat, 31 May 2025 00:59:39 +0000
Received: by outflank-mailman (input) for mailman id 1001780;
 Sat, 31 May 2025 00:59:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLAZW-0001KR-Fl
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:59:38 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85d4370c-3dba-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 02:59:37 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 05E61629C1;
 Sat, 31 May 2025 00:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C48D6C4CEEB;
 Sat, 31 May 2025 00:59:34 +0000 (UTC)
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
X-Inumbo-ID: 85d4370c-3dba-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748653175;
	bh=0ZpLi4Pxse9sFpSqfvx2+Meg7GBM6i54hR/f9Rq7yhw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YCLEWvTxRDu/LUH3zdw9Vrrg/50JZJcZsImpzPiyiv6tkbsp6PmThNyXtakMsXgdw
	 4dYs1MnJNW8GgLHG22us1COvQBWdqa7GSNRKvCVxnNZ66UQeFK4qxIaHVlVYapc5tl
	 Odq29w0ZvgiM13z836w7GppIiwtT+QAK1NCMU4YTRHvYIoiOkv4MtwtpG2EfSS+8v2
	 /RlZX3MTjJOTtx2jXNKQl1Qf4EV+mrE34Sq+6bLFDbmmVHAaVdC6613rklDrnR5E/m
	 03Db4EccwrDlw/yiyKNr4w9pFUEHbKDcCDmjOH2GHt/DsmTYeQo8BzjoSWURmE0zF6
	 cQ2UMG/95HcuQ==
Date: Fri, 30 May 2025 17:59:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 08/19] xen/dt: Add BOOTMOD_MICROCODE
In-Reply-To: <20250530120242.39398-9-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301759260.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-9-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> In preparation for x86 to start using bootmodule instead of boot_module
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/device-tree/bootinfo.c | 1 +
>  xen/include/xen/bootfdt.h         | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/xen/common/device-tree/bootinfo.c b/xen/common/device-tree/bootinfo.c
> index 76d652c0de..717cfa0962 100644
> --- a/xen/common/device-tree/bootinfo.c
> +++ b/xen/common/device-tree/bootinfo.c
> @@ -31,6 +31,7 @@ const char * __init boot_module_kind_as_string(bootmodule_kind kind)
>      case BOOTMOD_RAMDISK: return "Ramdisk";
>      case BOOTMOD_XSM:     return "XSM";
>      case BOOTMOD_GUEST_DTB:     return "DTB";
> +    case BOOTMOD_MICROCODE:     return "Microcode";
>      case BOOTMOD_UNKNOWN: return "Unknown";
>      default: BUG();
>      }
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 847f019559..d503d1bd4b 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -21,6 +21,7 @@ typedef enum {
>      BOOTMOD_RAMDISK,
>      BOOTMOD_XSM,
>      BOOTMOD_GUEST_DTB,
> +    BOOTMOD_MICROCODE,
>      BOOTMOD_UNKNOWN
>  }  bootmodule_kind;
>  
> -- 
> 2.43.0
> 

