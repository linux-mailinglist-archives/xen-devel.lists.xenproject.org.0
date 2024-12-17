Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E139F503B
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:05:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859384.1271511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNa4O-0002iM-7D; Tue, 17 Dec 2024 16:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859384.1271511; Tue, 17 Dec 2024 16:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNa4O-0002gC-49; Tue, 17 Dec 2024 16:05:12 +0000
Received: by outflank-mailman (input) for mailman id 859384;
 Tue, 17 Dec 2024 16:05:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q2Xm=TK=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1tNa4L-0002g4-Sg
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:05:09 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae80fa7f-bc90-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:05:07 +0100 (CET)
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 08:05:05 -0800
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa004.fm.intel.com with ESMTP; 17 Dec 2024 08:05:03 -0800
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
X-Inumbo-ID: ae80fa7f-bc90-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734451508; x=1765987508;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bo86RRfkr3shVB+cRKwVtLE8HuM1MXjOYJ7K7zRqdXU=;
  b=G7GPLR3j32QgEQOX+OJnBHpxj9dvPXvmqgoiFbjnjuR7MYnpuHFs5cY7
   qxNqr26s60qWieL11wFDN32VNm4raNQrd7LK52W7TwJaJoR/mmtqRtHMy
   K5XRzWDYBrJYF4X/9hTl5fQIgs9mB/vjFKHvZF5Wmzd9lODMAgbAt4pkP
   uxyYV20qK7FrVwBiBp73rSjzhOKwfvo5Qmtzl+ZCLu9DUBDpLFhnjdqDX
   94KK7Yqivjpl4MVEdPPfpE0HbwF+9FS+rTYe9QAbBj52eOjEW1NlgL4hN
   0aqzw8WOiY+q+wypwLigRe196J95fMpd736nmLMP9oOMLSGSdKwL8dn8Q
   g==;
X-CSE-ConnectionGUID: MoS5oWUKScCG0YU/7t3AEw==
X-CSE-MsgGUID: pybr45qUR0KJIqcSO2XRJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="52294481"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="52294481"
X-CSE-ConnectionGUID: 1pLt2+9cR3y1jBA5/W6pxw==
X-CSE-MsgGUID: qZtreTkoSoyAj1VrHL4AjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; 
   d="scan'208";a="102409761"
Date: Wed, 18 Dec 2024 00:23:42 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>, Anton Johansson <anjo@rev.ng>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/3] system/numa: Remove unnecessary 'exec/cpu-common.h'
 header
Message-ID: <Z2GljuPLP2xO3JTN@intel.com>
References: <20241217151305.29196-1-philmd@linaro.org>
 <20241217151305.29196-3-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217151305.29196-3-philmd@linaro.org>

On Tue, Dec 17, 2024 at 04:13:04PM +0100, Philippe Mathieu-Daudé wrote:
> Date: Tue, 17 Dec 2024 16:13:04 +0100
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH 2/3] system/numa: Remove unnecessary 'exec/cpu-common.h'
>  header
> X-Mailer: git-send-email 2.45.2
> 
> Nothing requires definitions from "exec/cpu-common.h",
> do not include this header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/sysemu/numa.h | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


