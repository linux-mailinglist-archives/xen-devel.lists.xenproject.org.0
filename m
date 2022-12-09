Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC13D64863A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 17:08:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.458072.715947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3fuz-0005WJ-DP; Fri, 09 Dec 2022 16:08:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 458072.715947; Fri, 09 Dec 2022 16:08:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3fuz-0005Tt-Ak; Fri, 09 Dec 2022 16:08:09 +0000
Received: by outflank-mailman (input) for mailman id 458072;
 Fri, 09 Dec 2022 16:08:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nv8v=4H=citrix.com=prvs=3352c5006=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1p3fux-0005Tn-TZ
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 16:08:08 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9505c5d-77db-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 17:08:06 +0100 (CET)
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
X-Inumbo-ID: a9505c5d-77db-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670602085;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BmGli1nmTWtP+prgNssGNcPwYUcGh6LI4FNlNAJTUbY=;
  b=gU4r1U121ZnfiXRKoetbYnptO2VWDDf0wx3QjBxtShmZupGLxsj9zXaP
   OsiwazA2UWtt3bfi3GFufFoDYFs0B7ksrMfW0S5x6mKvzX2KROg1w7BIj
   wqRh/KNCdevZc5r9BGksrHzg2lOUxQNTPTkDl4NvVorpYDnX2TNzmHTH6
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 86573007
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:usqSC6hYoc7yQurk3OAxNl7SX161gBAKZh0ujC45NGQN5FlHY01je
 htvDTuPb/mCZzPzctpyPIuw9E0EvJTQxtRmTgo5pCwzESgb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5gePzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tRDKWgUYE2qrN63yb/hQ8l2iZkSBvXCadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglH2dSFYr1SE47I6+WHJwCR60aT3McqTcduPLSlQthbG+
 z2dpzymav0cHOWFzyqlwEz3uuPeozPHAqdOKuSo9tc/1TV/wURMUUZLBDNXu8KRrlO1UpRxI
 kof9y4qsIA77kntRd74NzWnpFaUsxhaXMBfe8U45xuK0bH8+BuCCy4PSTspQN47sM47QxQ62
 1nPmMnmbRRxsb6PQHfb+b6OrSy7PQAcKGNEbigBJSMV7t+mrIwtgxbnStd4DLXzntDzASv3w
 T2BsG45nbp7pdUQy6yx8FTDgjStjpvEVAg44kPQRG3N0+9iTNf7PcryswGdtKseatbCJrWcg
 JQas5OftPkAULimqC2ETb8EPKumusevDBSJ1DaDAKId3ziq/neie6VZ7zd/OFplP644RNP5X
 KPAkVgPvcEOZRNGeYcyOtvsUJpykcAMAPy/Dpjpgsxyjo+dneNt1AVnfgau0m/kiyDAeolva
 M7AIa5A4Zv3YJmLLQZapc9HidfHJQhknws/oKwXKDz5uYdynFbPFd843KKmN4jVFp+srgTP6
 Mp4PMCX0RhZW+CWSnCJrtZOdwxWdSlhXsmeRylrmgmre1sOJY3cI6WJneNJl3JNwMy5adskD
 lniAxQFmTITdFXMKBmQa2ALVV8cdc8XkJ7PBgR1ZQzA8yF6Me6SAFI3K8NfkU8PqLYykpaZj
 pAtJ629Pxi4YmieoWxGN8mn9tcKmdbCrVvmAhdJqQMXJ/ZILzElMPe9Fucz3EHi1haKiPY=
IronPort-HdrOrdr: A9a23:vgX6Ya8hiLmywW0JFNluk+DeI+orL9Y04lQ7vn2ZHyYlF/Bw8P
 re+8jztCWE7gr5PUtKpTnuAsa9qB/nlaKdn7NhWYtKLTOJhILAFugLgbcKqAeAJ8SRzJ8/6U
 8dGZIOauEZRTBB5/oTqmGDfuod/A==
X-IronPort-AV: E=Sophos;i="5.96,230,1665460800"; 
   d="scan'208";a="86573007"
Date: Fri, 9 Dec 2022 16:07:49 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <Luca.Fancellu@arm.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: Re: [XEN][RFC PATCH v4 14/16] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Message-ID: <Y5NdVZZu/BYS/W6m@perard.uk.xensource.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-8-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221207061815.7404-8-vikram.garhwal@amd.com>

On Tue, Dec 06, 2022 at 10:18:13PM -0800, Vikram Garhwal wrote:
> diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> index 0c8b4c3aa7..a71bc0bb1d 100644
> --- a/tools/include/xenctrl.h
> +++ b/tools/include/xenctrl.h
> @@ -2633,6 +2633,9 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
>  int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
>                           xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
>  
> +int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
> +                  uint32_t overlay_fdt_size, uint8_t overlay_op);
> +

Since xc_dt_overlay.c is only built on CONFIG_ARM=y, could you enclose
that prototype in "#if defined(__arm__) || defined(__aarch64__)"?

>  /* Compat shims */
>  #include "xenctrl_compat.h"
>  
> diff --git a/tools/libs/ctrl/Makefile.common b/tools/libs/ctrl/Makefile.common
> index 0a09c28fd3..247afbe5f9 100644
> --- a/tools/libs/ctrl/Makefile.common
> +++ b/tools/libs/ctrl/Makefile.common
> @@ -24,6 +24,7 @@ OBJS-y       += xc_hcall_buf.o
>  OBJS-y       += xc_foreign_memory.o
>  OBJS-y       += xc_kexec.o
>  OBJS-y       += xc_resource.o
> +OBJS-$(CONFIG_ARM)  += xc_dt_overlay.o
>  OBJS-$(CONFIG_X86) += xc_psr.o
>  OBJS-$(CONFIG_X86) += xc_pagetab.o
>  OBJS-$(CONFIG_Linux) += xc_linux.o
> diff --git a/tools/libs/ctrl/xc_dt_overlay.c b/tools/libs/ctrl/xc_dt_overlay.c
> new file mode 100644
> index 0000000000..325c9ef4c0
> --- /dev/null
> +++ b/tools/libs/ctrl/xc_dt_overlay.c
> +#include "xc_bitops.h"
> +#include "xc_private.h"
> +#include <xen/hvm/hvm_op.h>
> +#include <libfdt.h>

Why all these headers? "xc_private.h" seems sufficient.
There isn't any bitmap operation, so xc_bitops.h seems unused.
The device tree isn't manipulated so libfdt.h seems unused.
hvm_op.h seems to be for HVMOP, not SYSCTL hypercall, xc_private.h might
already include the right header to do SYSCTL.

Thanks,

-- 
Anthony PERARD

