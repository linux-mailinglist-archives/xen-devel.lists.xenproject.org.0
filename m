Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30306AA07AA
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 11:47:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971726.1360042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hXZ-0004xs-AT; Tue, 29 Apr 2025 09:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971726.1360042; Tue, 29 Apr 2025 09:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9hXZ-0004up-6K; Tue, 29 Apr 2025 09:46:13 +0000
Received: by outflank-mailman (input) for mailman id 971726;
 Tue, 29 Apr 2025 09:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZqH3=XP=linux.intel.com=ilpo.jarvinen@srs-se1.protection.inumbo.net>)
 id 1u9hXY-0004uj-GH
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 09:46:12 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5d2ee22-24de-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 11:46:08 +0200 (CEST)
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 02:46:06 -0700
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.205])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2025 02:45:52 -0700
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
X-Inumbo-ID: c5d2ee22-24de-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745919968; x=1777455968;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=OEmsROS2dzbLzqVvteqA+LjMNAwHbDGb3LITSHjMruA=;
  b=PFamFGETz37XcllzBS7R4osfxXK572/3+ciyYO743f3F10uFG8ukpFjd
   lRz+HmHVqW5UzbFyARbccE/xhMCSBGcxmolrZ/H/wSewVMQZu0OqI7244
   CkjSB7wJEID7+pFnqjdnUtlod49IDDDtZUd69lWdry2vdZuiGtNAhcspm
   kV3+ZYeWfWBfW6fNIZZszJPtz8iMNYAk7dzjOZV4tQQZ/CvyN/g/6Jtie
   pxRTa80p6gku9gtZbfZWxDlO02xWux626oNRyTA8LPhxF2t1qWOwTeJU8
   pNsF/syvVe1CvsIezIiOfIHWpLAdgeeQ4kgaGG45Cb/71mcBVfrAbCOp8
   w==;
X-CSE-ConnectionGUID: PtKI+hezSlGu3/+Se1yx1w==
X-CSE-MsgGUID: 8xUPTIIQQdeJkXEYOf7U7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="35143901"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="35143901"
X-CSE-ConnectionGUID: chXqGONbRG+KNhUajc2ULw==
X-CSE-MsgGUID: 8lVzqi8rRgSKGWTaNKThpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="133495412"
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 29 Apr 2025 12:45:49 +0300 (EEST)
To: "Xin Li (Intel)" <xin@zytor.com>
cc: LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org, 
    linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
    virtualization@lists.linux.dev, linux-pm@vger.kernel.org, 
    linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org, 
    linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    Netdev <netdev@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
    dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
    acme@kernel.org, jgross@suse.com, andrew.cooper3@citrix.com, 
    peterz@infradead.org, namhyung@kernel.org, mark.rutland@arm.com, 
    alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
    adrian.hunter@intel.com, kan.liang@linux.intel.com, wei.liu@kernel.org, 
    ajay.kaher@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
    tony.luck@intel.com, pbonzini@redhat.com, vkuznets@redhat.com, 
    seanjc@google.com, luto@kernel.org, boris.ostrovsky@oracle.com, 
    kys@microsoft.com, haiyangz@microsoft.com, decui@microsoft.com, 
    dapeng1.mi@linux.intel.com
Subject: Re: [PATCH v4 01/15] x86/msr: Add missing includes of <asm/msr.h>
In-Reply-To: <20250427092027.1598740-2-xin@zytor.com>
Message-ID: <a1917b37-e41e-d303-749b-4007cda01605@linux.intel.com>
References: <20250427092027.1598740-1-xin@zytor.com> <20250427092027.1598740-2-xin@zytor.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-666243473-1745919726=:938"
Content-ID: <1b5519eb-241d-dec5-af5a-fc9378cf96ec@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-666243473-1745919726=:938
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <6ad7f337-7709-3cca-3ccd-80f11d3e8d38@linux.intel.com>

On Sun, 27 Apr 2025, Xin Li (Intel) wrote:

> For some reason, there are some TSC-related functions in the MSR
> header even though there is a tsc.h header.
>=20
> To facilitate the relocation of rdtsc{,_ordered}() from <asm/msr.h>
> to <asm/tsc.h> and to eventually eliminate the inclusion of
> <asm/msr.h> in <asm/tsc.h>, add <asm/msr.h> to the source files that
> reference definitions from <asm/msr.h>.
>=20
> Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>=20
> Change in v4:
> *) Add missing includes in a different patch (Ilpo J=E4rvinen).
> *) Add all necessary direct inclusions for msr.h (Ilpo J=E4rvinen).
>=20
> Change in v3:
> * Add a problem statement to the changelog (Dave Hansen).
> ---
>  arch/x86/events/msr.c                                         | 3 +++
>  arch/x86/events/perf_event.h                                  | 1 +
>  arch/x86/events/probe.c                                       | 2 ++

Under arch/x86/events/ a few files seem to be missing the include?

>  arch/x86/hyperv/ivm.c                                         | 1 +

Also under hyperv/ not all files are covered but I'm a bit hesitant to=20
suggest a change there since I'm not sure if they (hypervisors) do=20
something special w.r.t. msr.

>  arch/x86/include/asm/fred.h                                   | 1 +
>  arch/x86/include/asm/microcode.h                              | 2 ++
>  arch/x86/include/asm/mshyperv.h                               | 1 +
>  arch/x86/include/asm/msr.h                                    | 1 +
>  arch/x86/include/asm/suspend_32.h                             | 1 +
>  arch/x86/include/asm/suspend_64.h                             | 1 +
>  arch/x86/include/asm/switch_to.h                              | 2 ++

arch/x86/kernel/acpi/ ?
acrh/x86/kernel/cet.c ?
=2E..

There seem to be quite many under arch/x86/ that still don't have it, I=20
didn't list them all as there were so many after this point.

But that's up to x86 maintainers how throughout they want you to be.

This command may be helpful to exclude the files which already have the=20
include so you can focus on the ones that may still be missing it:

git grep -l -e rdmsr -e wrmsr | grep -v -f <(git grep -l -e 'asm/msr\.h')

>  arch/x86/kernel/cpu/resctrl/pseudo_lock.c                     | 1 +
>  arch/x86/kernel/fpu/xstate.h                                  | 1 +
>  arch/x86/kernel/hpet.c                                        | 1 +
>  arch/x86/kernel/process_64.c                                  | 1 +
>  arch/x86/kernel/trace_clock.c                                 | 2 +-
>  arch/x86/kernel/tsc_sync.c                                    | 1 +
>  arch/x86/lib/kaslr.c                                          | 2 +-
>  arch/x86/mm/mem_encrypt_identity.c                            | 1 +
>  arch/x86/realmode/init.c                                      | 1 +
>  drivers/acpi/acpi_extlog.c                                    | 1 +
>  drivers/acpi/processor_perflib.c                              | 1 +
>  drivers/acpi/processor_throttling.c                           | 3 ++-
>  drivers/char/agp/nvidia-agp.c                                 | 1 +
>  drivers/cpufreq/amd-pstate-ut.c                               | 2 ++
>  drivers/crypto/ccp/sev-dev.c                                  | 1 +
>  drivers/edac/amd64_edac.c                                     | 1 +
>  drivers/edac/ie31200_edac.c                                   | 1 +
>  drivers/edac/mce_amd.c                                        | 1 +
>  drivers/hwmon/hwmon-vid.c                                     | 4 ++++
>  drivers/idle/intel_idle.c                                     | 1 +
>  drivers/misc/cs5535-mfgpt.c                                   | 1 +
>  drivers/net/vmxnet3/vmxnet3_drv.c                             | 4 ++++
>  drivers/platform/x86/intel/ifs/core.c                         | 1 +
>  drivers/platform/x86/intel/ifs/load.c                         | 1 +
>  drivers/platform/x86/intel/ifs/runtest.c                      | 1 +
>  drivers/platform/x86/intel/pmc/cnp.c                          | 1 +
>  drivers/platform/x86/intel/speed_select_if/isst_if_common.c   | 1 +
>  drivers/platform/x86/intel/speed_select_if/isst_if_mbox_msr.c | 1 +
>  drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c   | 1 +
>  drivers/platform/x86/intel/turbo_max_3.c                      | 1 +
>  .../platform/x86/intel/uncore-frequency/uncore-frequency.c    | 1 +
>  drivers/powercap/intel_rapl_common.c                          | 1 +
>  drivers/powercap/intel_rapl_msr.c                             | 1 +
>  .../thermal/intel/int340x_thermal/processor_thermal_device.c  | 1 +
>  drivers/thermal/intel/intel_tcc_cooling.c                     | 1 +
>  drivers/thermal/intel/x86_pkg_temp_thermal.c                  | 1 +
>  drivers/video/fbdev/geode/display_gx.c                        | 1 +
>  drivers/video/fbdev/geode/gxfb_core.c                         | 1 +
>  drivers/video/fbdev/geode/lxfb_ops.c                          | 1 +

Under drivers/ this looked pretty complete. Nice work.

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com> # for pdx86

I also noticed these files might not need to include msr.h:

drivers/cpufreq/elanfreq.c
drivers/cpufreq/sc520_freq.c
drivers/accel/habanalabs/common/habanalabs_ioctl.c

=2E..so if you want, you may consider optionally adding a cleanup patch to=
=20
remove the include from them.

> --- a/drivers/video/fbdev/geode/gxfb_core.c
> +++ b/drivers/video/fbdev/geode/gxfb_core.c
> @@ -30,6 +30,7 @@
>  #include <linux/cs5535.h>
> =20
>  #include <asm/olpc.h>
> +#include <asm/msr.h>

In wrong order.
> =20
>  #include "gxfb.h"

--
 i.
--8323328-666243473-1745919726=:938--

