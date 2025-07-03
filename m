Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A76C2AF6CC2
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 10:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031810.1405540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFFd-0005IO-TB; Thu, 03 Jul 2025 08:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031810.1405540; Thu, 03 Jul 2025 08:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXFFd-0005GA-QR; Thu, 03 Jul 2025 08:25:01 +0000
Received: by outflank-mailman (input) for mailman id 1031810;
 Thu, 03 Jul 2025 08:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gZFO=ZQ=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1uXFFb-0005G4-LQ
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 08:24:59 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3045158f-57e7-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 10:24:52 +0200 (CEST)
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 01:24:50 -0700
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa005.fm.intel.com with ESMTP; 03 Jul 2025 01:24:46 -0700
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
X-Inumbo-ID: 3045158f-57e7-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751531093; x=1783067093;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=OL7YB4QqrsOIrbmMdhLO6b5EBpFpjMPIWAfHz4kxYTk=;
  b=VPSz1LOM1OtmUpjEuOU6g7/aqnHpdvSElK3QeeQkcc0mgmgIpnT7rzPY
   vXTKmIxDPveZOrC0hE+m2EZqMhTgsvbwT8QoQcb480I/kYKqrv4Iyb6rg
   NYecIKzRBU9WKG+VR6x0Y0f0eCwV890/+kZiRwE/i8/ZZTFSE995Mku+1
   p8faTwXHEyh0u12egPe7dr7RxMUmySYSubMwrl6zWoYvROshFpEx0MOrN
   6CvP37j7k+iT9SnBsXWhA1d7+7yNxddXpVwV/OvQTrz/Dc2AYKKU1kzr2
   OHWtbUdfPQvmI4YGDYBN/vL2I//pHxVCZZKuyCy1bgoFs1YuAjUUIcxel
   w==;
X-CSE-ConnectionGUID: JwHGfhu5QlG9mMwVBQELGw==
X-CSE-MsgGUID: iEZnml8TReGiuCwpG9YfrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64897788"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="64897788"
X-CSE-ConnectionGUID: K/Lh4bp/RTiD0Ygz1JEFag==
X-CSE-MsgGUID: enRRDQADQwmF7whpYfHbxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="158577105"
Date: Thu, 3 Jul 2025 16:46:12 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 57/65] accel: Always register
 AccelOpsClass::kick_vcpu_thread() handler
Message-ID: <aGZDVG3775oKYQmI@intel.com>
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-58-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250702185332.43650-58-philmd@linaro.org>

On Wed, Jul 02, 2025 at 08:53:19PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Wed,  2 Jul 2025 20:53:19 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v4 57/65] accel: Always register
>  AccelOpsClass::kick_vcpu_thread() handler
> X-Mailer: git-send-email 2.49.0
> 
> In order to dispatch over AccelOpsClass::kick_vcpu_thread(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::kick_vcpu_thread() mandatory.
> Register the default cpus_kick_thread() for each accelerator.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/system/accel-ops.h | 1 +
>  accel/kvm/kvm-accel-ops.c  | 1 +
>  accel/qtest/qtest.c        | 1 +
>  accel/xen/xen-all.c        | 1 +
>  system/cpus.c              | 7 ++-----
>  5 files changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


