Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEA673068C
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 20:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549113.857466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqH-0005Pk-DR; Wed, 14 Jun 2023 18:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549113.857466; Wed, 14 Jun 2023 18:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9UqH-0005N1-6l; Wed, 14 Jun 2023 18:03:37 +0000
Received: by outflank-mailman (input) for mailman id 549113;
 Wed, 14 Jun 2023 18:03:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nA9c=CC=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1q9UqG-0005L9-7U
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 18:03:36 +0000
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [2607:f8b0:4864:20::733])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5849e62-0add-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 20:03:32 +0200 (CEST)
Received: by mail-qk1-x733.google.com with SMTP id
 af79cd13be357-75b14216386so225919585a.0
 for <xen-devel@lists.xenproject.org>; Wed, 14 Jun 2023 11:03:31 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:ba27:ebff:fee8:ce27])
 by smtp.gmail.com with ESMTPSA id
 s5-20020a05621412c500b006262de12a8csm4851613qvv.65.2023.06.14.11.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jun 2023 11:03:29 -0700 (PDT)
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
X-Inumbo-ID: c5849e62-0add-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686765810; x=1689357810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IehyjnpBVsuzAr3QEOZb66rWyHW0327m7BV3mw01hZU=;
        b=Yw8L4cETW2xuTRK94N4/pI7BVlhTIY/oRHudaSN3wQsPIZSoiGpxj7htQR4tU8keFH
         wcv6a/s480ybLrj4fvkWYrizFumTxrYfm2w6O8kvQuAER0JHOYN+1MbihH5HncjVJ4ky
         7MyWU5q73BWhaKhsCMFaSmXWgGBEeapfC1GJTVxe7Ze7tnQusdrDN+YtZWapc9h52V80
         RMq3laooK0HhZGn7YzQaLZp13RWMMcd8RE8e8Emj33w4kqZ73JWr2yYwVy5WnvadZ7CX
         scDW6zDOi//Oc7ftKtlFmk/OOBHSeeQ9sy6M2F838bfUspw2o6BdtSwDYU4zQPKIgZqT
         RPaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686765810; x=1689357810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IehyjnpBVsuzAr3QEOZb66rWyHW0327m7BV3mw01hZU=;
        b=ARJz92hjZ5vMLAnLjoSc/PnUBQjF2Zzb2pFwfDbUnub5mIXSkkxGMRrM2ANcBTl0zw
         zrkgQ8rHAsG6SyLbbLmRPiFRX4a4p/10lyPcDXvSgnJIkdVEfT/NGK64uND1M4OMLhOr
         LjFBFQEfIm691gMG92PcOhdeF72NsSmVXYAlaTiWwNavw+cYKc5G9XLYx8jHRSgU7Ugw
         xLOGH959UmFAfYwsaj8ecImLwcvjQGBlVxqJoVD07C8ymDvXaWZowIZ0Uub2bwMbFaEY
         wyc3i16hd6iGPgxFcIPTI0iaBpr3L/ahKGmj6z3eWl9T2dwjt5sxN24JpVouHu6z3oAf
         XuUQ==
X-Gm-Message-State: AC+VfDw3n+ft4lZhlSDcGc4BdwktFt8ORxXXxKAd/koBCQAdPUoAbMtR
	r74uRKc6adFDycY6kC04LOd7dRi7XXY=
X-Google-Smtp-Source: ACHHUZ4P0b3rIxVAt3mCcejgI4oxHEOyt747uxjtKfWj8VCA1GVfTUbdsWnKNengRfQtIJHABLNn0g==
X-Received: by 2002:a05:6214:20ee:b0:62b:42e4:bc2 with SMTP id 14-20020a05621420ee00b0062b42e40bc2mr17465539qvk.29.1686765810251;
        Wed, 14 Jun 2023 11:03:30 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v4 00/15] Intel Hardware P-States (HWP) support
Date: Wed, 14 Jun 2023 14:02:38 -0400
Message-Id: <20230614180253.89958-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series adds Hardware-Controlled Performance States (HWP) for
Intel processors to Xen.

v2 was only partially reviewed, so v3 is mostly a reposting of v2.  In v2 &
v3, I think I addressed all comments for v1.  I kept patch 11 "xenpm:
Factor out a non-fatal cpuid_parse variant", with a v2 comment
explaining why I keep it.

v3 adds "xen/x86: Tweak PDC bits when using HWP".  Qubes testing revealed
an issue where enabling HWP can crash firwmare code (maybe SMM).  This
requires a Linux change to get the PDC bits from Xen and pass them to
ACPI.  Roger has a patch [0] to set the PDC bits.  Roger's 3 patch
series was tested with "xen/x86: Tweak PDC bits when using HWP" on
affected hardware and allowed proper operation.

v4:
There is a large amount or renaming from HWP/hwp to CPPC/cppc in the series.
The driver remains hwp_ prefixed since it is dealing with the hardware
interface.  The sysctl, xc and xenpm interfaces were renamed to cppc to
be the generic ACPI CPPC (Collaborative Processor Performance Control)
interface.

struct xen_get_cpufreq_para was re-organized in a binary compatible
fashion to nest scaling governor options.  This allows the cppc support
to use uint32_t's for its parameters.

HWP is now enabled with a top-level cpufreq=hwp option.  It will
fallback to cpufreq=xen if hwp is unavailable.  This seems like the most
user-friendly option.  Since the user was trying to specify *some*
cpufreq, we should give them the best that we can instead of disabling
the functionality.

"xenpm: Factor out a non-fatal cpuid_parse variant" was dropped.
set-cpufreq-cppc expects either a cpu number or none specified, which
implies all.

Some patches were re-arrange - "xen/x86: Tweak PDC bits when using HWP"
now comes immediately after "cpufreq: Add Hardware P-State (HWP) driver"

The implementation of "cpufreq: Allow restricting to internal governors
only " changed, so I removed Jan's Ack.

Previous cover letter:

With HWP, the processor makes its own determinations for frequency
selection, though users can set some parameters and preferences.  There
is also Turbo Boost which dynamically pushes the max frequency if
possible.

The existing governors don't work with HWP since they select frequencies
and HWP doesn't expose those.  Therefore a dummy hwp-interal governor is
used that doesn't do anything.

xenpm get-cpufreq-para is extended to show HWP parameters, and
set-cpufreq-cppc is added to set them.

A lightly loaded OpenXT laptop showed ~1W power savings according to
powertop.  A mostly idle Fedora system (dom0 only) showed a more modest
power savings.

This is for a 10th gen 6-core 1600 MHz base 4900 MHZ max cpu.  In the
default balance mode, Turbo Boost doesn't exceed 4GHz.  Tweaking the
energy_perf preference with `xenpm set-cpufreq-para balance ene:64`,
I've seen the CPU hit 4.7GHz before throttling down and bouncing around
between 4.3 and 4.5 GHz.  Curiously the other cores read ~4GHz when
turbo boost takes affect.  This was done after pinning all dom0 cores,
and using taskset to pin to vCPU/pCPU 11 and running a bash tightloop.

HWP defaults to disabled and running with the existing HWP configuration
- it doesn't reconfigure by default.  It can be enabled with
cpufreq=hwp.

Hardware Duty Cycling (HDC) is another feature to autonomously powerdown
things.  It defaults to enabled when HWP is enabled, but HDC can be
disabled on the command line.  cpufreq=xen:hwp,no-hdc

I've only tested on 8th gen and 10th gen systems with activity window
and energy_perf support.  So the pathes for CPUs lacking those features
are untested.

Fast MSR support was removed in v2.  The model specific checking was not
done properly, and I don't have hardware to test with.  Since writes are
expected to be infrequent, I just removed the code.

This changes the systcl_pm_op hypercall, so that wants review.

Regards,
Jason

[0] https://lore.kernel.org/xen-devel/20221121102113.41893-3-roger.pau@citrix.com/

Jason Andryuk (15):
  cpufreq: Allow restricting to internal governors only
  cpufreq: Add perf_freq to cpuinfo
  cpufreq: Export intel_feature_detect
  xen/sysctl: Nest cpufreq scaling options
  pmstat&xenpm: Re-arrage for cpufreq union
  cpufreq: Add Hardware P-State (HWP) driver
  xen/x86: Tweak PDC bits when using HWP
  xenpm: Change get-cpufreq-para output for hwp
  cpufreq: Export HWP parameters to userspace as CPPC
  libxc: Include cppc_para in definitions
  xenpm: Print HWP/CPPC parameters
  xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
  libxc: Add xc_set_cpufreq_cppc
  xenpm: Add set-cpufreq-cppc subcommand
  CHANGELOG: Add Intel HWP entry

 CHANGELOG.md                              |   2 +-
 docs/misc/xen-command-line.pandoc         |   9 +-
 tools/include/xenctrl.h                   |  28 +-
 tools/libs/ctrl/xc_pm.c                   |  35 +-
 tools/misc/xenpm.c                        | 385 +++++++++++--
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |  15 +-
 xen/arch/x86/acpi/cpufreq/hwp.c           | 664 ++++++++++++++++++++++
 xen/arch/x86/acpi/lib.c                   |   5 +
 xen/arch/x86/cpu/mcheck/mce_intel.c       |   6 +
 xen/arch/x86/include/asm/cpufeature.h     |  12 +-
 xen/arch/x86/include/asm/msr-index.h      |  14 +
 xen/drivers/acpi/pmstat.c                 | 102 ++--
 xen/drivers/cpufreq/cpufreq.c             |  16 +
 xen/drivers/cpufreq/utility.c             |   1 +
 xen/include/acpi/cpufreq/cpufreq.h        |  15 +
 xen/include/acpi/cpufreq/processor_perf.h |   4 +
 xen/include/acpi/pdc_intel.h              |   1 +
 xen/include/public/sysctl.h               | 137 ++++-
 19 files changed, 1343 insertions(+), 109 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

-- 
2.40.1


