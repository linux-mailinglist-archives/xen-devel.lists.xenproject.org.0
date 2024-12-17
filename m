Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA9B9F5085
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:12:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859393.1271520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaAk-0004Za-Qk; Tue, 17 Dec 2024 16:11:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859393.1271520; Tue, 17 Dec 2024 16:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaAk-0004Xz-Np; Tue, 17 Dec 2024 16:11:46 +0000
Received: by outflank-mailman (input) for mailman id 859393;
 Tue, 17 Dec 2024 16:11:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q2Xm=TK=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1tNaAj-0004Xt-KP
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:11:45 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99e89e41-bc91-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:11:43 +0100 (CET)
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 08:06:08 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2024 08:06:06 -0800
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
X-Inumbo-ID: 99e89e41-bc91-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734451903; x=1765987903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ADb5LrrPM45Iltt7daJmxHcrLCSyT/62xcSAmOFT7SE=;
  b=ZZp/Y33jjKvjGJyAnm6NS0z2IGe7DjzmyYgYcgTyKp6NwxfxZ4XLHYP5
   aiHuN92F2f2DR7o3BNSNBH2SsTrOZP5kvNJAy1R3T0NJkg/ETfYmXY3Wx
   +VWwccB30U+IYtQQe9+/quI84bavc2864VzLDFjzWe0aCqhCAe+A62Xg8
   q8lz1S3Hxo1AdASzbyhzfoCoFZ36WWlW3lK3d5Iuj7R/2SOhczvlPOkm/
   db1ZeGemtoCyNetgCzV8WpzVopnBvhhnZe9ohDIgy06vKT7nFLPUoamKh
   rQSsu4hab73b7npeQPmu+ZEO/zhotYvLbit7jr7wCB185clNB29Ltj37w
   w==;
X-CSE-ConnectionGUID: bA3ROYJ1RwOUBtZ/IJGwpQ==
X-CSE-MsgGUID: BMuf0eVcRbCoLkpxTNRtwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34778439"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="34778439"
X-CSE-ConnectionGUID: rozFU8KBSmWf/b67cOyFeA==
X-CSE-MsgGUID: 8ivHx4rvS5SaWz8EmpyQAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="98151026"
Date: Wed, 18 Dec 2024 00:24:45 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>, Anton Johansson <anjo@rev.ng>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 3/3] system/accel-ops: Remove unnecessary
 'exec/cpu-common.h' header
Message-ID: <Z2Glzcf9pWE3BVLq@intel.com>
References: <20241217151305.29196-1-philmd@linaro.org>
 <20241217151305.29196-4-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217151305.29196-4-philmd@linaro.org>

On Tue, Dec 17, 2024 at 04:13:05PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Tue, 17 Dec 2024 16:13:05 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH 3/3] system/accel-ops: Remove unnecessary
>  'exec/cpu-common.h' header
> X-Mailer: git-send-email 2.45.2
> 
> Since commit c4b3f46c151 ("include/exec: Move vaddr defines to
> separate file") we only need to include "exec/vaddr.h" to get
> the 'vaddr' type definition, no need for "exec/cpu-common.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/sysemu/accel-ops.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


