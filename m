Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ABFA0998B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2025 19:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.869878.1281381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWJt6-0005Nm-Ns; Fri, 10 Jan 2025 18:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 869878.1281381; Fri, 10 Jan 2025 18:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tWJt6-0005LQ-Hm; Fri, 10 Jan 2025 18:37:40 +0000
Received: by outflank-mailman (input) for mailman id 869878;
 Fri, 10 Jan 2025 17:14:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xnyy=UC=intel.com=ashutosh.dixit@srs-se1.protection.inumbo.net>)
 id 1tWIaC-0000KG-1a
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2025 17:14:04 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47c8f5bd-cf76-11ef-99a4-01e77a169b0f;
 Fri, 10 Jan 2025 18:14:00 +0100 (CET)
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 09:13:58 -0800
Received: from orsosgc001.jf.intel.com (HELO orsosgc001.intel.com)
 ([10.165.21.142])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 09:13:57 -0800
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
X-Inumbo-ID: 47c8f5bd-cf76-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736529240; x=1768065240;
  h=date:message-id:from:to:cc:subject:in-reply-to:
   references:mime-version;
  bh=zCD9wMt7oj+kJBhlIcsVVTGT43QE2wPIyfO0mHZuo3E=;
  b=hWvPm9S9gyyWflhxezAJQ0/Zw5EZKsCuAkNL9pt9ibrxvKhfx8igBLau
   BqAxt/w+4WkhB7JJeGhd2XKu7BTEUI/u+ZCjJZLax3klENzioM0Ogu8lV
   PfZO/Ur9FgiISKQAktuwXDv+fKDWBBLhsHE3nTEvd7HEfk5ILPMEy+C+i
   v7E/Bn3dcZExGuv+WXwcKSpdB8KGwD5qn3eKJp4zYHR+m82wlFlpFSVej
   Zj+F+2HJbkF1YqnKygWuQDJ/VUu15h2UnCLWYzcjwzwNjZ/0bri7MxpqP
   ws6x4YtpsaSIYSiiMKXJNlfXHbNtrSTP7okJPY7QFGY+mFzAY/yI1B5Pm
   Q==;
X-CSE-ConnectionGUID: Oxcoox4ZRIip59qh+Arovg==
X-CSE-MsgGUID: nRtBEkHYQuuOyF8IO0ne4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36712478"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36712478"
X-CSE-ConnectionGUID: d+N1H3FPQryemumCSoERgQ==
X-CSE-MsgGUID: skCK+1HISZSgobnkHZdoJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="127073384"
Date: Fri, 10 Jan 2025 09:13:56 -0800
Message-ID: <8534hqvbfv.wl-ashutosh.dixit@intel.com>
From: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?ISO-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,	Kees Cook
 <kees@kernel.org>,	Luis Chamberlain <mcgrof@kernel.org>,
	linux-arm-kernel@lists.infradead.org,	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,	linux-crypto@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,	intel-xe@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,	linux-rdma@vger.kernel.org,
	linux-raid@vger.kernel.org,	linux-scsi@vger.kernel.org,
	linux-serial@vger.kernel.org,	xen-devel@lists.xenproject.org,
	linux-aio@kvack.org,	linux-fsdevel@vger.kernel.org,	netfs@lists.linux.dev,
	codalist@coda.cs.cmu.edu,	linux-mm@kvack.org,	linux-nfs@vger.kernel.org,
	ocfs2-devel@lists.linux.dev,	fsverity@lists.linux.dev,
	linux-xfs@vger.kernel.org,	io-uring@vger.kernel.org,	bpf@vger.kernel.org,
	kexec@lists.infradead.org,	linux-trace-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,	apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,	keyrings@vger.kernel.org
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?ISO-8859-4?Q?Goj=F2?=) APEL-LB/10.8 EasyPG/1.0.0
 Emacs/28.2 (x86_64-redhat-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII

On Thu, 09 Jan 2025 05:16:39 -0800, Joel Granados wrote:
>
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 2406cda75b7b..5384d1bb4923 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4802,7 +4802,7 @@ int i915_perf_remove_config_ioctl(struct drm_device *dev, void *data,
>	return ret;
>  }
>
> -static struct ctl_table oa_table[] = {
> +static const struct ctl_table oa_table[] = {
>	{
>	 .procname = "perf_stream_paranoid",
>	 .data = &i915_perf_stream_paranoid,
> diff --git a/drivers/gpu/drm/xe/xe_observation.c b/drivers/gpu/drm/xe/xe_observation.c
> index 8ec1b84cbb9e..57cf01efc07f 100644
> --- a/drivers/gpu/drm/xe/xe_observation.c
> +++ b/drivers/gpu/drm/xe/xe_observation.c
> @@ -56,7 +56,7 @@ int xe_observation_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>	}
>  }
>
> -static struct ctl_table observation_ctl_table[] = {
> +static const struct ctl_table observation_ctl_table[] = {
>	{
>	 .procname = "observation_paranoid",
>	 .data = &xe_observation_paranoid,

For i915 and xe:

Acked-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

