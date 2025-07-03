Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 613F6AF6CF4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 10:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031830.1405570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFMK-00087z-3M; Thu, 03 Jul 2025 08:31:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031830.1405570; Thu, 03 Jul 2025 08:31:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFMK-00086D-0Z; Thu, 03 Jul 2025 08:31:56 +0000
Received: by outflank-mailman (input) for mailman id 1031830;
 Thu, 03 Jul 2025 08:31:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZFO=ZQ=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1uXFMI-000864-Vm
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 08:31:54 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2aacbdc8-57e8-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 10:31:52 +0200 (CEST)
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 01:31:44 -0700
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa008.jf.intel.com with ESMTP; 03 Jul 2025 01:31:39 -0700
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
X-Inumbo-ID: 2aacbdc8-57e8-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751531513; x=1783067513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ByU4hpYzsvjOd9VZE1TBCs8POchjSwZa0YYeiaUeNw0=;
  b=mud+gSAR9HbCc+Ue3ayOTNIxUv8QLhlFflNPbInxFmiLfSUlUiM+1ksm
   Hzwy8TtulCMGdo/zPOhBln9kBuuwEGcn+MmhGnRBzv/s8CzUbeYn8kSv9
   VmGboBlSDWNE4AQKgBingrPIa6kNAV1dlqpnMsgAizR2bqYH0LWHytlHc
   MkJaprZ9pwMGH6kRWGHPUIgbQB2+0rxNcjYtte26HvBVhmUmOVzksyrXe
   zMuiVvYzrOeZq2t597kvUSJcqpr/Tm1CsafBAzGxwXx8QBJGODlU4lWqF
   J/W8Sd6+NPL2lOEMvIIEl4BHZDefHnYUf7cAnpDzdxr1wKjJ3NsEn0Zeh
   w==;
X-CSE-ConnectionGUID: cBC6ACTTQHqW0Uv6nzMJCA==
X-CSE-MsgGUID: JihyGXNOTleEZjbK/MxmFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53960995"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="53960995"
X-CSE-ConnectionGUID: AuvEBSWtSWyGr0z8bLAlKw==
X-CSE-MsgGUID: HlkdXOsfS96ROan7iqiTJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154797421"
Date: Thu, 3 Jul 2025 16:53:04 +0800
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
Subject: Re: [PATCH v4 56/65] accel: Expose and register
 generic_handle_interrupt()
Message-ID: <aGZE8PkdEEVxU+Gm@intel.com>
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-57-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702185332.43650-57-philmd@linaro.org>

On Wed, Jul 02, 2025 at 08:53:18PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Wed,  2 Jul 2025 20:53:18 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 56/65] accel: Expose and register
>  generic_handle_interrupt()
> X-Mailer: git-send-email 2.49.0
> 
> In order to dispatch over AccelOpsClass::handle_interrupt(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::handle_interrupt() mandatory.
> Expose generic_handle_interrupt() prototype and register it
> for each accelerator.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/system/accel-ops.h        | 3 +++
>  accel/hvf/hvf-accel-ops.c         | 1 +
>  accel/kvm/kvm-accel-ops.c         | 1 +
>  accel/qtest/qtest.c               | 1 +
>  accel/xen/xen-all.c               | 1 +
>  system/cpus.c                     | 9 +++------
>  target/i386/nvmm/nvmm-accel-ops.c | 1 +
>  target/i386/whpx/whpx-accel-ops.c | 1 +
>  8 files changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


