Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143D2A079EC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 15:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.868496.1279993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtzK-00053R-Hj; Thu, 09 Jan 2025 14:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 868496.1279993; Thu, 09 Jan 2025 14:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVtzK-00051y-F7; Thu, 09 Jan 2025 14:58:22 +0000
Received: by outflank-mailman (input) for mailman id 868496;
 Thu, 09 Jan 2025 14:58:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d+9W=UB=intel.com=jani.nikula@srs-se1.protection.inumbo.net>)
 id 1tVtzI-00051s-Ry
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 14:58:21 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2793ecac-ce9a-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 15:58:17 +0100 (CET)
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 06:58:14 -0800
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 06:58:04 -0800
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
X-Inumbo-ID: 2793ecac-ce9a-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736434698; x=1767970698;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=vefbR+WxUsl6W1mxf4BqpYTUFUuz57yEjCw3Nj1MESk=;
  b=T55DTNZSP0PmVh7ZjmvknBInnW1GGzkSwgYaVMeQz2ocZF5jNg4LE9rt
   0F6FCSsTmjcXv/UDVA+0a9Zj1QDeqYohrXNKc5fZYcmehM2Bt8zjv2Iuz
   3dLMf18TGY+JJABAZl5fEEVnfpiuxlqmIzTBkEqluV9bYuHec6Ol50D46
   UKO9bopCJRhgBmpORCCJEBbmYwhDdPRDluv06bi7fcohLSJV8udXpt0Ns
   XH6bz4RzCUc3CipWpP0jcBFaTokSSI0kfpFDTaCHczryTr5awQxjvj43M
   U5H1wjxRxHnoUPs8hRxe2xAn28rYtl2th+UhcQ4XN12l0r5PcfNPV/UBW
   g==;
X-CSE-ConnectionGUID: 5hzTow8ZTJSVzKy4ukQdoQ==
X-CSE-MsgGUID: cgUSS4zXSheBkkeF6IvaEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="48110948"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="48110948"
X-CSE-ConnectionGUID: aAxGFyBISeOF2fi1TGSFDw==
X-CSE-MsgGUID: hUbAKolZSWC8NTenKubm+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108527826"
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joel Granados <joel.granados@kernel.org>, Thomas =?utf-8?Q?Wei=C3=9Fsc?=
 =?utf-8?Q?huh?=
 <linux@weissschuh.net>, Kees Cook <kees@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, Joel
 Granados <joel.granados@kernel.org>
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
Date: Thu, 09 Jan 2025 16:58:01 +0200
Message-ID: <87frlsjapy.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, 09 Jan 2025, Joel Granados <joel.granados@kernel.org> wrote:
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 2406cda75b7b..5384d1bb4923 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4802,7 +4802,7 @@ int i915_perf_remove_config_ioctl(struct drm_device *dev, void *data,
>  	return ret;
>  }
>  
> -static struct ctl_table oa_table[] = {
> +static const struct ctl_table oa_table[] = {
>  	{
>  	 .procname = "perf_stream_paranoid",
>  	 .data = &i915_perf_stream_paranoid,

For i915,

Acked-by: Jani Nikula <jani.nikula@intel.com>


-- 
Jani Nikula, Intel

