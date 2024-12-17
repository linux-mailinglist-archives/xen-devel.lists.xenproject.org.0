Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392139F5032
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859379.1271501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNa35-0002EQ-US; Tue, 17 Dec 2024 16:03:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859379.1271501; Tue, 17 Dec 2024 16:03:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNa35-0002BF-Qr; Tue, 17 Dec 2024 16:03:51 +0000
Received: by outflank-mailman (input) for mailman id 859379;
 Tue, 17 Dec 2024 16:03:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q2Xm=TK=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1tNa34-0002B9-F6
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:03:50 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ef1ff0b-bc90-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 17:03:48 +0100 (CET)
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 08:03:45 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa003.fm.intel.com with ESMTP; 17 Dec 2024 08:03:43 -0800
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
X-Inumbo-ID: 7ef1ff0b-bc90-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734451428; x=1765987428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=TZgosjBYR9y1uV0i86b2LUmldcCKBeHWtXQ+IUnVzHI=;
  b=b2eOY0HGMcWuGLRTPyM2ky4lY9zNGVzDV5NbILR7VG3s+3KGhb2ZWE/Y
   tsNGpaw1T/Y6vYaNkgZug2PjCUP0k1Tg+R/ZQQttugvmnjykpAH9UjYPr
   37ABh4hnlVLcFKZJq7LcTY12llNzeUXVSJyNOGWyaPpUn0FztWlqKcHl4
   p+LnOPeVQ90XbJzMFKPwZp0FlNBKoN7aQpbr7RtTCYH03lcYIaDFYW18Z
   dwzxWlAiezV7sQz1FzlQiMw3WOP05AP4WaRc6awDZbvGwNwnPzXvKb0KC
   A9EcRSNmJx5AIrk8orI57+FG57BOCoy6e6IHj6QXkN5MOc6JyU9ess7RH
   g==;
X-CSE-ConnectionGUID: Q6AExycdStynOgtVSYqCiQ==
X-CSE-MsgGUID: 3dDzCYeWS6mS6EIhB2Reaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="35038707"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="35038707"
X-CSE-ConnectionGUID: WDSSOHGXSqyEmnqsys0ufQ==
X-CSE-MsgGUID: vriFYFVBRV2y5UsKlcv87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101715615"
Date: Wed, 18 Dec 2024 00:22:17 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>, Anton Johansson <anjo@rev.ng>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] hw/xen: Remove unnecessary 'exec/cpu-common.h' header
Message-ID: <Z2GlOSMl3+me/IHX@intel.com>
References: <20241217151305.29196-1-philmd@linaro.org>
 <20241217151305.29196-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217151305.29196-2-philmd@linaro.org>

On Tue, Dec 17, 2024 at 04:13:03PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Tue, 17 Dec 2024 16:13:03 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH 1/3] hw/xen: Remove unnecessary 'exec/cpu-common.h' header
> X-Mailer: git-send-email 2.45.2
> 
> Nothing requires definitions from "exec/cpu-common.h",
> do not include this header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/hw/xen/xen.h | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


