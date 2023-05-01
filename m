Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D85D46F369D
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:21:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528061.820610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZ4w-0002qF-4q; Mon, 01 May 2023 19:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528061.820610; Mon, 01 May 2023 19:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZ4w-0002nv-1U; Mon, 01 May 2023 19:20:54 +0000
Received: by outflank-mailman (input) for mailman id 528061;
 Mon, 01 May 2023 19:20:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lARM=AW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1ptZ4u-0002np-SC
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:20:52 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48818f38-e855-11ed-b225-6b7b168915f2;
 Mon, 01 May 2023 21:20:51 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-61aecee26feso6514226d6.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:20:51 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 x20-20020a0ce0d4000000b0061927ddb043sm2012307qvk.80.2023.05.01.12.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:20:48 -0700 (PDT)
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
X-Inumbo-ID: 48818f38-e855-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682968850; x=1685560850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LIDXD1rjydJmaXqYe1USNeTaj7ndwcTzSDSXNcX5Wmw=;
        b=fCxjw0fDJEhIoYwSMnKGFnxE1HSttRshqhiOS3w37Ymm5azocp8ZcNWwc4m2a3q4lA
         7G5/PEesUyxFiNELjSeaoGBP+tpUMFV+R3oKoHxgqjPWHfaN3f7AN4VmtQEeDBvF5JZ3
         utMi/4V7/QqXcOsIpxj76V7gfchy0TGcr1G1pWO/sqatWzSXU36Bwad+npRXA2nVrLEH
         cDC+f9NFhQxXhjc+lXNI8wyFVbeVP7T3deuGAQzvSuNsnlIWiUazz6k0IEff0E/BHTiG
         X7Ff0yXKJhE4WMWBXeKHfnVLSExxKK34N1Jja+pgktNUbBwbu/ZeuJXYvCoBKuzJpl1C
         xTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682968850; x=1685560850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LIDXD1rjydJmaXqYe1USNeTaj7ndwcTzSDSXNcX5Wmw=;
        b=dXxGQmp/0mkLuiTFFqNBAhjJ8fUKeyEKJgV+LSpodgMs7doKmYNOXcrtZQlas4uNsA
         TXjP5RXgeoGYixHKnkMKq1Qwm2P69H8ocYkUn4qFnuL3yk+R2/rwgSNgcQsGM2v8niwc
         CZjati7jLT8YpIWYHDSxiErlLrjhuD4vqAH0VeJhNwxDXyGT80dFkPPGpqOsO4t+Uz+Y
         ZmrnRA7JR9Arlmy+9GqyuZU6+VRQI2UXQXjV7lRRWvtP6zUXJNbzc+E+dwzpaakTmLEn
         oQs9T9ZjkX53BZZPhOQRUXkgNpBbkw4SKKdI+oeTGhHpSsBI10qtY/j/PANfjW+EHnAC
         iuPA==
X-Gm-Message-State: AC+VfDwsGGLY3iRf5lf81Tl4nWZBiweOKgB8mBKR9HU+53wdw+JcU8QT
	3ZbD5Bl2oCX1vhMefxqRowQ=
X-Google-Smtp-Source: ACHHUZ6KZb0pidqm5YN+GDCFc/grr88J90LhZQaVORRfrc+BGNPLFyX2X74VvD2xoxTzjJ5RzX3NkQ==
X-Received: by 2002:ad4:5e8d:0:b0:56f:52ba:cce6 with SMTP id jl13-20020ad45e8d000000b0056f52bacce6mr1779909qvb.19.1682968849783;
        Mon, 01 May 2023 12:20:49 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproj,
	xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v3 00/14] Intel Hardware P-States (HWP) support
Date: Mon,  1 May 2023 15:20:31 -0400
Message-Id: <20230501192045.87377-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.40.0
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

Previous cover letter:

With HWP, the processor makes its own determinations for frequency
selection, though users can set some parameters and preferences.  There
is also Turbo Boost which dynamically pushes the max frequency if
possible.

The existing governors don't work with HWP since they select frequencies
and HWP doesn't expose those.  Therefore a dummy hwp-interal governor is
used that doesn't do anything.

xenpm get-cpufreq-para is extended to show HWP parameters, and
set-cpufreq-hwp is added to set them.

A lightly loaded OpenXT laptop showed ~1W power savings according to
powertop.  A mostly idle Fedora system (dom0 only) showed a more modest
power savings.

This for for a 10th gen 6-core 1600 MHz base 4900 MHZ max cpu.  In the
default balance mode, Turbo Boost doesn't exceed 4GHz.  Tweaking the
energy_perf preference with `xenpm set-cpufreq-hwp balance ene:64`,
I've seen the CPU hit 4.7GHz before throttling down and bouncing around
between 4.3 and 4.5 GHz.  Curiously the other cores read ~4GHz when
turbo boost takes affect.  This was done after pinning all dom0 cores,
and using taskset to pin to vCPU/pCPU 11 and running a bash tightloop.

HWP defaults to disabled and running with the existing HWP configuration
- it doesn't reconfigure by default.  It can be enabled with
cpufreq=xen:hwp.

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

Jason Andryuk (14):
  cpufreq: Allow restricting to internal governors only
  cpufreq: Add perf_freq to cpuinfo
  cpufreq: Export intel_feature_detect
  cpufreq: Add Hardware P-State (HWP) driver
  xenpm: Change get-cpufreq-para output for internal
  xen/x86: Tweak PDC bits when using HWP
  cpufreq: Export HWP parameters to userspace
  libxc: Include hwp_para in definitions
  xenpm: Print HWP parameters
  xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
  libxc: Add xc_set_cpufreq_hwp
  xenpm: Factor out a non-fatal cpuid_parse variant
  xenpm: Add set-cpufreq-hwp subcommand
  CHANGELOG: Add Intel HWP entry

 CHANGELOG.md                              |   1 +
 docs/misc/xen-command-line.pandoc         |   8 +-
 tools/include/xenctrl.h                   |   6 +
 tools/libs/ctrl/xc_pm.c                   |  18 +
 tools/misc/xenpm.c                        | 355 +++++++++++-
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |  15 +-
 xen/arch/x86/acpi/cpufreq/hwp.c           | 633 ++++++++++++++++++++++
 xen/arch/x86/acpi/lib.c                   |   5 +
 xen/arch/x86/cpu/mcheck/mce_intel.c       |   6 +
 xen/arch/x86/include/asm/cpufeature.h     |  13 +-
 xen/arch/x86/include/asm/msr-index.h      |  14 +
 xen/drivers/acpi/pmstat.c                 |  23 +
 xen/drivers/cpufreq/cpufreq.c             |  40 ++
 xen/drivers/cpufreq/utility.c             |   1 +
 xen/include/acpi/cpufreq/cpufreq.h        |  14 +
 xen/include/acpi/cpufreq/processor_perf.h |   4 +
 xen/include/acpi/pdc_intel.h              |   1 +
 xen/include/public/sysctl.h               |  57 ++
 19 files changed, 1187 insertions(+), 28 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

-- 
2.40.0


