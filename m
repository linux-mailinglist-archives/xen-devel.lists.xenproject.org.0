Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80398AF8BA3
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 10:31:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033014.1406437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbp3-0003vq-0c; Fri, 04 Jul 2025 08:31:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033014.1406437; Fri, 04 Jul 2025 08:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbp2-0003u2-U4; Fri, 04 Jul 2025 08:31:04 +0000
Received: by outflank-mailman (input) for mailman id 1033014;
 Fri, 04 Jul 2025 08:31:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3u94=ZR=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1uXbp0-0003tw-Oo
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 08:31:03 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 358d3071-58b1-11f0-a315-13f23c93f187;
 Fri, 04 Jul 2025 10:30:59 +0200 (CEST)
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 01:30:57 -0700
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa007.fm.intel.com with ESMTP; 04 Jul 2025 01:30:52 -0700
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
X-Inumbo-ID: 358d3071-58b1-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751617860; x=1783153860;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qSKFJqr0Qywi0iAlGlIkKfjQJIEPf0LTXkikDjrW5KU=;
  b=D6QX5DEAJ8RbSg8lfVAqkQXViGs9GTfsLyXxh+ghCErJcQYJ3u9ds5xp
   e1JbhfoEUddj/Fu6lwrgcFrKQrydq1FT4Gp4hp0PljS6NKuolKluxb+kY
   6iO2l3nHKvKSMW8HdrnnsR7qaKTYCRc21rGFzT0CzQpFO5riNrx4jsryA
   B8rpPUvnd5AYa0F//flafXaE+4VUpNWfkON3BdrbclhaacUjCpwbtsGTw
   pFy1Nnxp3k5W6NYKFKzmn/amR9J4UIRTJif0UOmECUqxQQvba9T/if3fh
   j1rm2unSC8yUkiV4K12T4j3XROyttBu4FhY9BahvBu+gGJ/8/qdIFsPDY
   g==;
X-CSE-ConnectionGUID: 28F1j1AaTjaD6JwvqDWsnw==
X-CSE-MsgGUID: vRkH2GeZQQS08AaVkPP7qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53671785"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53671785"
X-CSE-ConnectionGUID: GBBpck5FRFWey8H+f0UU4g==
X-CSE-MsgGUID: 7U0brTSvSf+E4dFTzF06GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154233853"
Date: Fri, 4 Jul 2025 16:52:18 +0800
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
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 37/39] accel: Rename 'system/accel-ops.h' ->
 'accel/accel-cpu-ops.h'
Message-ID: <aGeWQu8iYlzuPYQ+@intel.com>
References: <20250703173248.44995-1-philmd@linaro.org>
 <20250703173248.44995-38-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703173248.44995-38-philmd@linaro.org>

On Thu, Jul 03, 2025 at 07:32:43PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  3 Jul 2025 19:32:43 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v6 37/39] accel: Rename 'system/accel-ops.h' ->
>  'accel/accel-cpu-ops.h'
> X-Mailer: git-send-email 2.49.0
> 
> Unfortunately "system/accel-ops.h" handlers are not only
> system-specific. For example, the cpu_reset_hold() hook
> is part of the vCPU creation, after it is realized.
> 
> Mechanical rename to drop 'system' using:
> 
>   $ sed -i -e s_system/accel-ops.h_accel/accel-cpu-ops.h_g \
>               $(git grep -l system/accel-ops.h)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/{system/accel-ops.h => accel/accel-cpu-ops.h} | 8 ++++----
>  accel/accel-common.c                                  | 2 +-
>  accel/accel-system.c                                  | 2 +-
>  accel/hvf/hvf-accel-ops.c                             | 2 +-
>  accel/kvm/kvm-accel-ops.c                             | 2 +-
>  accel/qtest/qtest.c                                   | 2 +-
>  accel/tcg/tcg-accel-ops.c                             | 2 +-
>  accel/xen/xen-all.c                                   | 2 +-
>  cpu-target.c                                          | 2 +-
>  gdbstub/system.c                                      | 2 +-
>  system/cpus.c                                         | 2 +-
>  target/i386/nvmm/nvmm-accel-ops.c                     | 2 +-
>  target/i386/whpx/whpx-accel-ops.c                     | 2 +-
>  13 files changed, 16 insertions(+), 16 deletions(-)
>  rename include/{system/accel-ops.h => accel/accel-cpu-ops.h} (96%)

...

> -#ifndef ACCEL_OPS_H
> -#define ACCEL_OPS_H
> +#ifndef ACCEL_CPU_OPS_H
> +#define ACCEL_CPU_OPS_H

Daniel mentioned "QEMU_" prefix is "best practice":

https://lore.kernel.org/qemu-devel/aAdSMExEAy45NIeB@redhat.com/

But I also think there's no need to change anything here for now. If
you agree, we can move in this direction in the future. So

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


