Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DE1AF6CD3
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 10:28:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031824.1405560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFIM-0006N3-L9; Thu, 03 Jul 2025 08:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031824.1405560; Thu, 03 Jul 2025 08:27:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFIM-0006KY-Ho; Thu, 03 Jul 2025 08:27:50 +0000
Received: by outflank-mailman (input) for mailman id 1031824;
 Thu, 03 Jul 2025 08:27:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZFO=ZQ=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1uXFIL-0006KQ-B9
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 08:27:49 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97b28ff2-57e7-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 10:27:46 +0200 (CEST)
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 01:27:44 -0700
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa006.jf.intel.com with ESMTP; 03 Jul 2025 01:27:39 -0700
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
X-Inumbo-ID: 97b28ff2-57e7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751531267; x=1783067267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kk77vUBEkSjmsCyANUUqBAMo+dxlEAVvzPvouifbixc=;
  b=n3KXJVUlLdqxorAdPOPQpbGpor2PpQH98Ki6xF2uiy7J+eJeY+JUSypJ
   ytRbt7NGUML9YjNPh1Ue1YW3RjE0E+1kO7YiNaagIjRyXa3e6fNBf0vpn
   L5r4dyKOpdh5YM798040v+DICTaXF1+1ZaYJrq7FRklHtWIyGnLmaG3Wf
   YPcKPTPijB6DU9v09YxT8xMfOdVty+0hLor0rn1CUYTkyvoRn9Zm3X0Sc
   Wt8MJqVWKtKc6SGTj1GJ8VmEaaj/Gi05Ynfvd6vNGvvV5jzMlEMpalyiH
   VHIlp3yU/8dXROEc8rSficPUBQB+AovTJoRV5oGXpKZCKz1Msz4DLLZmP
   Q==;
X-CSE-ConnectionGUID: MLSpuaUPQT6oQEXpDQ66qw==
X-CSE-MsgGUID: 9xKTE6ApQu+xhIgT6Rh+AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53816280"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="53816280"
X-CSE-ConnectionGUID: Hyj8XmZIREGYlp0Fp6jlOQ==
X-CSE-MsgGUID: oA/EviQmTmWFP/GcZLUptQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="153737688"
Date: Thu, 3 Jul 2025 16:49:03 +0800
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
	Mads Ynddal <mads@ynddal.dk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 59/65] accel: Always register
 AccelOpsClass::get_virtual_clock() handler
Message-ID: <aGZD/1EXudZKwJXB@intel.com>
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-60-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702185332.43650-60-philmd@linaro.org>

On Wed, Jul 02, 2025 at 08:53:21PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Wed,  2 Jul 2025 20:53:21 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 59/65] accel: Always register
>  AccelOpsClass::get_virtual_clock() handler
> X-Mailer: git-send-email 2.49.0
> 
> In order to dispatch over AccelOpsClass::get_virtual_clock(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::get_virtual_clock() mandatory.
> Register the default cpus_kick_thread() for each accelerator.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/system/accel-ops.h        | 2 ++
>  accel/hvf/hvf-accel-ops.c         | 1 +
>  accel/kvm/kvm-accel-ops.c         | 1 +
>  accel/tcg/tcg-accel-ops.c         | 2 ++
>  accel/xen/xen-all.c               | 1 +
>  system/cpus.c                     | 7 ++++---
>  target/i386/nvmm/nvmm-accel-ops.c | 1 +
>  target/i386/whpx/whpx-accel-ops.c | 1 +
>  8 files changed, 13 insertions(+), 3 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


