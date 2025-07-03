Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17278AF6CCC
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 10:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031818.1405550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFHJ-0005r1-B2; Thu, 03 Jul 2025 08:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031818.1405550; Thu, 03 Jul 2025 08:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFHJ-0005p9-8M; Thu, 03 Jul 2025 08:26:45 +0000
Received: by outflank-mailman (input) for mailman id 1031818;
 Thu, 03 Jul 2025 08:26:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZFO=ZQ=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1uXFHH-0005p3-DV
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 08:26:43 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71cb55f5-57e7-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 10:26:42 +0200 (CEST)
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 01:26:40 -0700
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa001.fm.intel.com with ESMTP; 03 Jul 2025 01:26:35 -0700
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
X-Inumbo-ID: 71cb55f5-57e7-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751531202; x=1783067202;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ZmG4X3Jhxv8Gv5+e4UWaPy0CAvjKsc9isQvzNVKdnmE=;
  b=EXpway/xZvBgmU/cTvIGWCDaHV3xHSv+R7th4HVBbcGkYmh84kKYe2Ee
   ftC5qZ6EiTmjLOKM/wL1TqfXPkwk+E8XVTtZr/zXmbmfCDEzp56mZKFrE
   wWn7DxbM2E+zatZNdEXcn/LIOUXGiKq8qWm0vNZeVP1LRcVKiEXEFXsvY
   ymSRMqGlSvEDs+T5bm/UrLB+v38LjEP7k9b+3voMEgWTKTEOu15DGacF5
   WjwnHCPCyxoOZHrjPIxSAFE4/FJEwX93cDmOW+W7YjOGLw7dqmzt+A4cP
   CWntkIHpBUpXchBC1TtcF8VCQWsUf69bjYshvDERSCOu1NSwavOWAh8Ud
   A==;
X-CSE-ConnectionGUID: FasmmDSfT3KbdRDtrs4R/Q==
X-CSE-MsgGUID: ra5jKWJSSFywHm2cAhZgUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="79280743"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="79280743"
X-CSE-ConnectionGUID: z/7Ky3ApTN2kD35uOXuQkQ==
X-CSE-MsgGUID: ag0q8rMPT1GDBYZQiY2pWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="185245908"
Date: Thu, 3 Jul 2025 16:48:01 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>, Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 58/65] accel: Always register
 AccelOpsClass::get_elapsed_ticks() handler
Message-ID: <aGZDwZaXu1TAfsJY@intel.com>
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-59-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702185332.43650-59-philmd@linaro.org>

On Wed, Jul 02, 2025 at 08:53:20PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Wed,  2 Jul 2025 20:53:20 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 58/65] accel: Always register
>  AccelOpsClass::get_elapsed_ticks() handler
> X-Mailer: git-send-email 2.49.0
> 
> In order to dispatch over AccelOpsClass::get_elapsed_ticks(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::get_elapsed_ticks() mandatory.
> Register the default cpus_kick_thread() for each accelerator.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/system/accel-ops.h        | 1 +
>  accel/hvf/hvf-accel-ops.c         | 2 ++
>  accel/kvm/kvm-accel-ops.c         | 3 +++
>  accel/qtest/qtest.c               | 2 ++
>  accel/tcg/tcg-accel-ops.c         | 3 +++
>  accel/xen/xen-all.c               | 2 ++
>  system/cpus.c                     | 6 ++----
>  target/i386/nvmm/nvmm-accel-ops.c | 3 +++
>  target/i386/whpx/whpx-accel-ops.c | 3 +++
>  9 files changed, 21 insertions(+), 4 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


