Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F839B0530D
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 09:26:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1043577.1413550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uba3g-0006wT-Rb; Tue, 15 Jul 2025 07:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1043577.1413550; Tue, 15 Jul 2025 07:26:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uba3g-0006tu-Nu; Tue, 15 Jul 2025 07:26:36 +0000
Received: by outflank-mailman (input) for mailman id 1043577;
 Tue, 15 Jul 2025 07:26:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zwzr=Z4=intel.com=xiaoyao.li@srs-se1.protection.inumbo.net>)
 id 1uba3f-0006to-8b
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 07:26:35 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06cf2f29-614d-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 09:26:32 +0200 (CEST)
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:26:29 -0700
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1])
 ([10.124.247.1])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:26:26 -0700
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
X-Inumbo-ID: 06cf2f29-614d-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752564392; x=1784100392;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=diH2VzVtmdjEOMOU7HGCpb9Z/8LCKSPT60pSYxn/8x8=;
  b=H19PNRcWeIEx/X6ksLfYZppqHiGXEmuHNVXmCzPQXJj3cF2Kfl9tN1M9
   0JkZFuflz9MmGP9Cl7hMbp8aXXgZikV+q5ck3kfSvKjO50HIYQwAnKRO+
   F5i7rsidGmfx7DSZ3fzfKxGQnkxWYBGbyeHRHRKabt+saPXyMFHZH4A6C
   +IVdY0/gMZHyE+nJ0xCYA5X2QV7Ie9PZzeEkiunM7rAVlelMCsMjckx6f
   u0rhx37/8KcODzMfmxovDFUpL0hrILcifCdXdW4vcQ3xm67J5dgmPsVM6
   Pkg/6AWsGd4eXWaP0pysemN1qHv5VeXx/RpZ4JtkQt+1UCfIGn5rLgE/D
   g==;
X-CSE-ConnectionGUID: o1Eoyue9RPqApaT1IhwHSQ==
X-CSE-MsgGUID: NyjPwj3ETTub7FIE93Xfeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58580318"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="58580318"
X-CSE-ConnectionGUID: 5reR67JFRBiU2O9fxnj1Aw==
X-CSE-MsgGUID: 4mRwTjTTS+CQGJtBSRzGMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="194304816"
Message-ID: <0002fed1-2ba8-41f9-a4f6-bac2654333e3@intel.com>
Date: Tue, 15 Jul 2025 15:26:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hw/arm/xen-pvh: Remove unnecessary 'hw/xen/arch_hvm.h'
 header
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anthony PERARD <anthony@xenproject.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, Peter Maydell
 <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20250715071528.46196-1-philmd@linaro.org>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250715071528.46196-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/15/2025 3:15 PM, Philippe Mathieu-Daudé wrote:
> "hw/xen/arch_hvm.h" only declares the arch_handle_ioreq() and
> arch_xen_set_memory() prototypes, which are not used by xen-pvh.c.
> Remove the unnecessary header inclusion.
> 
> Cc: Xiaoyao Li <xiaoyao.li@intel.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>

> ---
> Based-on: <20250513171737.74386-1-philmd@linaro.org>
> ---
>   hw/arm/xen-pvh.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 4b26bcff7a5..1a9eeb01c8e 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -10,7 +10,6 @@
>   #include "hw/boards.h"
>   #include "system/system.h"
>   #include "hw/xen/xen-pvh-common.h"
> -#include "hw/xen/arch_hvm.h"
>   
>   #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>   


