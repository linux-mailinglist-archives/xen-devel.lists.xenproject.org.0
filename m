Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D980FC74930
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 15:32:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167502.1493812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5iH-0001cW-CL; Thu, 20 Nov 2025 14:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167502.1493812; Thu, 20 Nov 2025 14:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM5iH-0001aG-8O; Thu, 20 Nov 2025 14:32:45 +0000
Received: by outflank-mailman (input) for mailman id 1167502;
 Thu, 20 Nov 2025 14:32:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hThX=54=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1vM5iF-0001JR-NN
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 14:32:43 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c48ad1a4-c61d-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 15:32:41 +0100 (CET)
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 06:32:40 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 06:32:32 -0800
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
X-Inumbo-ID: c48ad1a4-c61d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763649162; x=1795185162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8p5BU/PNBU0Ifp6tqvnI7Xm0gUktsLgYRPE5lSj1HzQ=;
  b=UrJvwdQOgi675MgGqyJL5VvKFHiD2y2fEmu6YtWsd1DnW4d3/6FesonE
   ak2Rx7gDznMVLVW+WEsw8VZ5R/birjQVjJW1og4vLQ98+LuwDcs1UWsL+
   PBfpLev5ssOzvqwV26NBXzN4o2NebC1Kuen/jxzkkgYXTcZXGqN1+9vK2
   iIXVwWMjA/YSHg12gA5ipDu6tKGTsgXA7mb/m6SnBc1OcmXJXJ/gCNTps
   75x5GC1XcLDwprns9p+YVrpwUp90L0fRsrziS4VJyeqIXPaa/CLVcrKOz
   7AtOaIPNjmBvtQtvZklM7wPSIpm2qdpLewVhJAd5hUTc7pZ06DfiNJHci
   w==;
X-CSE-ConnectionGUID: AzEovlsdQ4O0t7SNPsyyuA==
X-CSE-MsgGUID: 5Ke+OSKZRS+LbFbs1WzOyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69335892"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="69335892"
X-CSE-ConnectionGUID: zqy/H3FmTvG0yY2xg8n9SA==
X-CSE-MsgGUID: 2boN41jpSnqTQwUO/BTgeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="222027958"
Date: Thu, 20 Nov 2025 22:54:51 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
	mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com,
	gengdongjiu1@gmail.com, peter.maydell@linaro.org,
	alistair@alistair23.me, edgar.iglesias@gmail.com, npiggin@gmail.com,
	harshpb@linux.ibm.com, palmer@dabbelt.com, liwei1518@gmail.com,
	dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
	sstabellini@kernel.org, anthony@xenproject.org, paul@xen.org,
	berrange@redhat.com, peterx@redhat.com, farosas@suse.de,
	eblake@redhat.com, vsementsov@yandex-team.ru, eduardo@habkost.net,
	marcel.apfelbaum@gmail.com, philmd@linaro.org,
	wangyanan55@huawei.com, qemu-block@nongnu.org, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/5] hw/nvram/xlnx-bbram: More idiomatic and simpler
 error reporting
Message-ID: <aR8ruxdVFa/XdQo7@intel.com>
References: <20251119130855.105479-1-armbru@redhat.com>
 <20251119130855.105479-3-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119130855.105479-3-armbru@redhat.com>

On Wed, Nov 19, 2025 at 02:08:52PM +0100, Markus Armbruster wrote:
> Date: Wed, 19 Nov 2025 14:08:52 +0100
> From: Markus Armbruster <armbru@redhat.com>
> Subject: [PATCH 2/5] hw/nvram/xlnx-bbram: More idiomatic and simpler error
>  reporting
> 
> bbram_bdrv_error() interpolates a "detail" string into a template with
> error_setg_errno(), then reports the result with error_report().
> Produces error messages with an unwanted '.':
> 
>     BLK-NAME: BBRAM backstore DETAIL failed.: STERROR
> 
> Replace both calls of bbram_bdrv_error() by straightforward
> error_report(), and drop the function.  This is less code, easier to
> read, and the error message is more greppable.
> 
> Also delete the unwanted '.'.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/nvram/xlnx-bbram.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


