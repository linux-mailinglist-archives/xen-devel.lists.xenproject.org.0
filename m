Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20002AF8C23
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 10:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033056.1406468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbz2-0006yd-GG; Fri, 04 Jul 2025 08:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033056.1406468; Fri, 04 Jul 2025 08:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbz2-0006wa-Cl; Fri, 04 Jul 2025 08:41:24 +0000
Received: by outflank-mailman (input) for mailman id 1033056;
 Fri, 04 Jul 2025 08:41:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3u94=ZR=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1uXbz0-0006wU-VY
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 08:41:22 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7842e96-58b2-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 10:41:20 +0200 (CEST)
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:41:18 -0700
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa008.jf.intel.com with ESMTP; 04 Jul 2025 01:41:12 -0700
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
X-Inumbo-ID: a7842e96-58b2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751618480; x=1783154480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=1QuT+XRSxAhtUr7hKsZ7yJkGE89o5ONGpKD2gpcV/QU=;
  b=AO4qkgzLNIuDYLiyXT272hIEEyEVQ7mcYxDEIT3AqYHymhvRLtemTrSg
   mu66HjPSMGh6q6/CGsIoxDL3nEs1wGSdbl/f0xpC0j52kJihi1TnmGIW5
   GxzSe/P4tA304fC1sOBJkv9JRltIsqsZTMaRovNtDOR5o4maZh91T/4sK
   znBa0m9pNHyt3BHunh96s/88U6MSh7MOcfu10h3H8fs46N/L5why6FkM6
   qsdCtBpFrAfg646ZzwDCGVm3LQsgzpSpbHxrFXT8WDik3NacoFdIbibZd
   Kb30MUlJV/wZS2geakeIig1nY+5g+7ixJ3xYUpx2gJ+5BDnyRHZNfo4Xv
   w==;
X-CSE-ConnectionGUID: UMu6h/3+S1+v4er3xP6XPQ==
X-CSE-MsgGUID: 9c1qiHUvSIu5Jru2Oli/wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="79390528"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="79390528"
X-CSE-ConnectionGUID: Rmee1NI+T9S45FFL65lxYA==
X-CSE-MsgGUID: YJNNdulXQM+t6scSwQBLJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="155086915"
Date: Fri, 4 Jul 2025 17:02:38 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>, Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 38/39] accel: Extract AccelClass definition to
 'accel/accel-ops.h'
Message-ID: <aGeYrngC+7RX8kEa@intel.com>
References: <20250703173248.44995-1-philmd@linaro.org>
 <20250703173248.44995-39-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703173248.44995-39-philmd@linaro.org>

On Thu, Jul 03, 2025 at 07:32:44PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  3 Jul 2025 19:32:44 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v6 38/39] accel: Extract AccelClass definition to
>  'accel/accel-ops.h'
> X-Mailer: git-send-email 2.49.0
> 
> Only accelerator implementations (and the common accelator
> code) need to know about AccelClass internals. Move the
> definition out but forward declare AccelState and AccelClass.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  MAINTAINERS                 |  2 +-
>  include/accel/accel-ops.h   | 50 +++++++++++++++++++++++++++++++++++++
>  include/qemu/accel.h        | 40 ++---------------------------
>  include/system/hvf_int.h    |  3 ++-
>  include/system/kvm_int.h    |  1 +
>  accel/accel-common.c        |  1 +
>  accel/accel-system.c        |  1 +
>  accel/hvf/hvf-all.c         |  1 +
>  accel/kvm/kvm-all.c         |  1 +
>  accel/qtest/qtest.c         |  1 +
>  accel/tcg/tcg-accel-ops.c   |  1 +
>  accel/tcg/tcg-all.c         |  1 +
>  accel/xen/xen-all.c         |  1 +
>  bsd-user/main.c             |  1 +
>  gdbstub/system.c            |  1 +
>  linux-user/main.c           |  1 +
>  system/memory.c             |  1 +
>  target/i386/nvmm/nvmm-all.c |  1 +
>  target/i386/whpx/whpx-all.c |  1 +
>  19 files changed, 70 insertions(+), 40 deletions(-)
>  create mode 100644 include/accel/accel-ops.h

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


