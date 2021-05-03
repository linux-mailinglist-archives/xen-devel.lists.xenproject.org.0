Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD8637206C
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 21:28:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121804.229722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeEx-0005iZ-VV; Mon, 03 May 2021 19:28:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121804.229722; Mon, 03 May 2021 19:28:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldeEx-0005iA-SN; Mon, 03 May 2021 19:28:23 +0000
Received: by outflank-mailman (input) for mailman id 121804;
 Mon, 03 May 2021 19:28:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1Q=J6=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1ldeEw-0005i5-Pi
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 19:28:22 +0000
Received: from mail-qk1-x731.google.com (unknown [2607:f8b0:4864:20::731])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78dc73cc-d9a8-4c3d-babd-04d9718dfc6c;
 Mon, 03 May 2021 19:28:21 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id i67so3146422qkc.4
 for <xen-devel@lists.xenproject.org>; Mon, 03 May 2021 12:28:21 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:8710:5560:a711:776f])
 by smtp.gmail.com with ESMTPSA id
 g18sm9225209qke.21.2021.05.03.12.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 12:28:20 -0700 (PDT)
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
X-Inumbo-ID: 78dc73cc-d9a8-4c3d-babd-04d9718dfc6c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Co+6Hp6qlbhWNQZqHSxOLclZUpg0DuM7toVdpgmloKc=;
        b=efhDfL/Tbgue8tsD8zGB9Qt7U5UwRRapOgACRafC86iyyJ2/uG4FXq0e0fUbZLOnCk
         yg4/79gQTUI1oKLPU7Ys80rjjdQoNeJsF0EPj9TtM1zPsN+yIjA91Wnkq9sxA8h9aNe4
         4sqk3J434LukpT10bH4M6m5dga/KAfb3vGNgkgfgtv+NeD7xpMV5HQnKnhViJHllMoS1
         pJNdoaxaDTHtyzDKSbXA5czgV/Go3CPDge6XZ63BW13IhxQnyHDXqnqBBMz6RT2EnlNu
         YYGhK8h1UTyNOOYhiKF+imQ0c6oG8rVS/MNEjQ+mwjXbI+nYUYaXglEI72kUJM6HQIs+
         H2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Co+6Hp6qlbhWNQZqHSxOLclZUpg0DuM7toVdpgmloKc=;
        b=WLh3ytkrETI6m4IVWn2NAWcxyVvejUs2etVhAzhwqT4EJUqg1qVWv0h1oj68VcWbwP
         z5mMxSlBfavRVH8YRBY1XnbbfEnQcu67aPHcuy+VXbtdMWJxMWUGcQOqAu8HpFcxxYaQ
         TF+b+PxViQN1ntKr5fkMfuhhBRWD5tpKZjCbSmaCajnRMqb2N/WmGPrrwvEjCApCCGNW
         wxBtIkj3p2rtBF+amAC/RTq7epECELT0Qw/B6P2kPQcu6RhvnlmHrZ2rV+8DLBCJmeug
         z3qvqDiLXE2++NgGHoiSFilrYDC6hXP+9f05Wp/MBe3S5y2aGQyveI5ITrDE7NVbZiCu
         aqRw==
X-Gm-Message-State: AOAM532xxld6mPKQAL8WSMt/1VII2rjW4Jp4NhMpJJzU7s7hRP4gF5QH
	Av0jwU5U6n/azcBrVAsvStxswLmIcIY=
X-Google-Smtp-Source: ABdhPJzNZvZL9DqzsyfXhcULxXw/9tnBoSkZ3w0E+/iO7GgnuycshsMnWxaMqexReotRX5hbeMxtOA==
X-Received: by 2002:ae9:e897:: with SMTP id a145mr18232749qkg.334.1620070100810;
        Mon, 03 May 2021 12:28:20 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH 00/13] Intel Hardware P-States (HWP) support
Date: Mon,  3 May 2021 15:27:57 -0400
Message-Id: <20210503192810.36084-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series adds Hardware-Controlled Performance States (HWP) for
Intel processors to Xen.

With HWP, the processor makes its own determinations for frequency
selection depending, though users can set some parameters and
preferences.  There is also Turbo Boost which dynamically pushes the max
frequency if possible.

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

There are only minor changes since the RFC posting.  Typo fixes and a
few hunks have been folded into earlier patches.  I reordered "xenpm:
Factor out a non-fatal cpuid_parse variant" immediately before "xenpm:
Add set-cpufreq-hwp subcommand" where it is used.

Open questions:

HWP defaults to enabled and running in balanced mode.  This is useful
for testing, but should the old ACPI cpufreq driver remain the default?

This series unilaterally enables Hardware Duty Cycling (HDC) which is
another feature to autonomously powerdown things.  That is enabled if
HWP is enabled.  Maybe that want to be configurable?

I've only tested on an 8th gen and a 10th gen systems.  The don't have
fast MSR support, and they do have activity window and energy_perf
support.  So the respective other modes are untested.

This changes the systcl_pm_op hypercall, so that wants review.

I wanted to get this out since I know Qubes is also interested.

Regards,
Jason

Jason Andryuk (13):
  cpufreq: Allow restricting to internal governors only
  cpufreq: Add perf_freq to cpuinfo
  cpufreq: Export intel_feature_detect
  cpufreq: Add Hardware P-State (HWP) driver
  xenpm: Change get-cpufreq-para output for internal
  cpufreq: Export HWP parameters to userspace
  libxc: Include hwp_para in definitions
  xenpm: Print HWP parameters
  xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
  libxc: Add xc_set_cpufreq_hwp
  xenpm: Factor out a non-fatal cpuid_parse variant
  xenpm: Add set-cpufreq-hwp subcommand
  CHANGELOG: Add Intel HWP entry

 CHANGELOG.md                              |   2 +
 docs/misc/xen-command-line.pandoc         |   9 +
 tools/include/xenctrl.h                   |   6 +
 tools/libs/ctrl/xc_pm.c                   |  18 +
 tools/misc/xenpm.c                        | 375 +++++++++++-
 xen/arch/x86/acpi/cpufreq/Makefile        |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c       |  15 +-
 xen/arch/x86/acpi/cpufreq/hwp.c           | 671 ++++++++++++++++++++++
 xen/drivers/acpi/pmstat.c                 |  30 +
 xen/drivers/cpufreq/cpufreq.c             |   4 +
 xen/drivers/cpufreq/utility.c             |   1 +
 xen/include/acpi/cpufreq/cpufreq.h        |   9 +
 xen/include/acpi/cpufreq/processor_perf.h |   5 +
 xen/include/asm-x86/cpufeature.h          |  11 +-
 xen/include/asm-x86/msr-index.h           |  17 +
 xen/include/public/sysctl.h               |  52 +-
 16 files changed, 1197 insertions(+), 29 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

-- 
2.30.2


