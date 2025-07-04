Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F53AF9115
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 13:12:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033325.1406767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXeKs-0002uw-DV; Fri, 04 Jul 2025 11:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033325.1406767; Fri, 04 Jul 2025 11:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXeKs-0002t4-AX; Fri, 04 Jul 2025 11:12:06 +0000
Received: by outflank-mailman (input) for mailman id 1033325;
 Fri, 04 Jul 2025 11:12:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3u94=ZR=intel.com=zhao1.liu@srs-se1.protection.inumbo.net>)
 id 1uXeKr-0002sy-As
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 11:12:05 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae39376d-58c7-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 13:11:51 +0200 (CEST)
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 04:11:48 -0700
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by orviesa007.jf.intel.com with ESMTP; 04 Jul 2025 04:11:44 -0700
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
X-Inumbo-ID: ae39376d-58c7-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751627511; x=1783163511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=o1Nrk5RUp6fY1bkTBtN3Hp9y0X6x3rmoyVhWTfb40es=;
  b=iJj2Cxihn7V39UzZWa18HSQoCtP/J/+/sIM96UH3DfPYhK9V3LauK1DE
   OzIruerWzFm77mDWEHx4X63KvKs9Q55b+9DsdYH/cXDa0dldBhixDc3jV
   9k95T/oCYgU3s4s5hZcVd9pYasm0m1qjakJwEqVk0a71nFQKeMOO6nZWH
   /Zn0AFZbEqadb6L19im/dm8JM//U22pv+Qi+so+dCTa0xCrbOGyWhKSPb
   YxONjRq79rsevFHabENCkb7z4g4Csmq9n+61/Elq7PnQhxUQ/H8SAq2Qa
   OZkKC9tfBreHLGUqaiFAtsCg+THMvP33Ty2l7ynhH41yPpyWzhL8l3Qyo
   Q==;
X-CSE-ConnectionGUID: s7C8ktdbTbC4vBmu9IY58g==
X-CSE-MsgGUID: lqyINbxmSnm6XcH/UndSrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54104345"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="54104345"
X-CSE-ConnectionGUID: 9GV3W5YtQfabXlm8uFAwUA==
X-CSE-MsgGUID: Rb2p5PN2TDWcFZtsdBilyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154746779"
Date: Fri, 4 Jul 2025 19:33:09 +0800
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
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 30/39] accel: Propagate AccelState to
 AccelClass::init_machine()
Message-ID: <aGe79U/acV51nQM9@intel.com>
References: <20250703173248.44995-1-philmd@linaro.org>
 <20250703173248.44995-31-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703173248.44995-31-philmd@linaro.org>

On Thu, Jul 03, 2025 at 07:32:36PM +0200, Philippe Mathieu-Daudé wrote:
> Date: Thu,  3 Jul 2025 19:32:36 +0200
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> Subject: [PATCH v6 30/39] accel: Propagate AccelState to
>  AccelClass::init_machine()
> X-Mailer: git-send-email 2.49.0
> 
> In order to avoid init_machine() to call current_accel(),
> pass AccelState along.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/qemu/accel.h        | 2 +-
>  accel/accel-system.c        | 2 +-
>  accel/hvf/hvf-all.c         | 2 +-
>  accel/kvm/kvm-all.c         | 2 +-
>  accel/qtest/qtest.c         | 2 +-
>  accel/tcg/tcg-all.c         | 2 +-
>  accel/xen/xen-all.c         | 2 +-
>  bsd-user/main.c             | 2 +-
>  linux-user/main.c           | 2 +-
>  target/i386/nvmm/nvmm-all.c | 2 +-
>  target/i386/whpx/whpx-all.c | 2 +-
>  11 files changed, 11 insertions(+), 11 deletions(-)

...

> diff --git a/accel/accel-system.c b/accel/accel-system.c
> index b5b368c6a9c..fb8abe38594 100644
> --- a/accel/accel-system.c
> +++ b/accel/accel-system.c
> @@ -37,7 +37,7 @@ int accel_init_machine(AccelState *accel, MachineState *ms)
>      int ret;
>      ms->accelerator = accel;
>      *(acc->allowed) = true;
> -    ret = acc->init_machine(ms);
> +    ret = acc->init_machine(accel, ms);

Now we've already set "ms->accelerator", so that we could get @accel
by ms->accelerator.

But considerring the user emulation, where the @ms is NULL, and for
these cases, it needs to bring current_accel() back in patch 32.

Anyway, this solution is also fine for me, so,

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


...But there're still more comments/questions about user emulation:

> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -474,7 +474,7 @@ int main(int argc, char **argv)
>                                   opt_one_insn_per_tb, &error_abort);
>          object_property_set_int(OBJECT(accel), "tb-size",
>                                  opt_tb_size, &error_abort);
> -        ac->init_machine(NULL);
> +        ac->init_machine(accel, NULL);

Not the issue about this patch though,

it seems user emulation doesn't set acc->allowed. At least TCG enabled
is necessary, I guess?

>      }
>  
>      /*
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 5ac5b55dc65..a9142ee7268 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -820,7 +820,7 @@ int main(int argc, char **argv, char **envp)
>                                   opt_one_insn_per_tb, &error_abort);
>          object_property_set_int(OBJECT(accel), "tb-size",
>                                  opt_tb_size, &error_abort);
> -        ac->init_machine(NULL);
> +        ac->init_machine(accel, NULL);

Ditto.

>      }
>  
>      /*

Thanks,
Zhao


