Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C6E3318FA
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 22:03:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95080.179356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1D-0006PX-U0; Mon, 08 Mar 2021 21:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95080.179356; Mon, 08 Mar 2021 21:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJN1D-0006P8-Qw; Mon, 08 Mar 2021 21:02:23 +0000
Received: by outflank-mailman (input) for mailman id 95080;
 Mon, 08 Mar 2021 21:02:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=odrr=IG=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lJN1C-0006P0-Ny
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 21:02:22 +0000
Received: from mail-qk1-x72c.google.com (unknown [2607:f8b0:4864:20::72c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d53b4a58-ed75-4043-8493-911df4ec5784;
 Mon, 08 Mar 2021 21:02:21 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id l4so10890240qkl.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Mar 2021 13:02:21 -0800 (PST)
Received: from pm2-ws13.praxislan02.com ([2001:470:8:67e:a33e:daa7:46a1:a7eb])
 by smtp.gmail.com with ESMTPSA id
 r2sm8514070qti.4.2021.03.08.13.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 13:02:20 -0800 (PST)
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
X-Inumbo-ID: d53b4a58-ed75-4043-8493-911df4ec5784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=znTAiOKI7hH9toOOOb0ZhwcwnjUZNrFUq91UZZdA8eI=;
        b=GouNeEM9WadDINh0HMdquJEmpriO+7ccetKXcKXHWbHwqR/UrEFTIAwOTxzHyfD7oQ
         pPUD9CXy44uAUpBYgnYIzHMlw1ZYnw+bm9SBUVUlgak6S9D8zmyLIRyBrpcB935tgHj/
         O/gymI+4v5qalQ9pPqcIrhtjG2sPZfVTeTO55TmeF7xyN+69IPqKQ5QvNKMOMdy26H+w
         CqYM849ZWdaS2p14EcKq6VFayvow6Oz7uIuO1i4IZpYkQCqgqM3ZNuy1BTZURUxDFDJq
         XiAOjbKy8jSK16ajuU6Xh8qWgunX2bgbdZbLp6jvINiCz63oS4FED2jrADWK+JOab7DO
         nm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=znTAiOKI7hH9toOOOb0ZhwcwnjUZNrFUq91UZZdA8eI=;
        b=PM6vbo1vke8/4o0m2isOZDvPB1I8gFPZ3bJdasnBH6JXvWnCAkvh0sbYboxo56cnlp
         C6h+571F0PWwVfsmbx40a2wXSB7gmvUKDB15nJp9RWpXevl0xcn31jxtcuDf1YAxz79y
         2YlBWACStuGj5XjU5BIqDv4JRlv015DixZuLIPfXow4CB+/p07iA0/a1j/B8bKRp5sXn
         Ol+hppi/Trt+FLQvOp307KR1/Hj6iWaeRBuMaq0lPssTez3bwkhN4lZEHwNQpTt1wT+L
         /P7+jflWbtoWHvQ5pruLYd8uFZKjdWuYMxwQFWssZmJskXR/py5+jSaC3eeLjo4TUQrx
         CfeQ==
X-Gm-Message-State: AOAM531ge49cpccZGN+Yu1rY9wUGz7YouAHUuhhdSIBIRMgVRRYhobnQ
	1c5WPKUVtEm+bUQrq8GitbU1KfhyrTQ=
X-Google-Smtp-Source: ABdhPJzIjtNE5yvXLkm2nX+CexccDl4+5PBaUEXp1IS5ch+yS9bIntQMXoTKOF/RfxBGXjdfs99Q/Q==
X-Received: by 2002:a37:ef18:: with SMTP id j24mr23155160qkk.96.1615237341018;
        Mon, 08 Mar 2021 13:02:21 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: pawel@invisiblethingslab.com,
	marmarek@invisiblethingslab.com,
	Jason Andryuk <jandryuk@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [RFC 00/12] Intel Hardware P-States (HWP) support
Date: Mon,  8 Mar 2021 16:01:58 -0500
Message-Id: <20210308210210.116278-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch series adds Hardware-Controlled Performance States (HWP) for
Intel processors to Xen.

With HWP, the processor makes its own determinations for frequency
selection depending, though users can set some parameters and
preferences.  There is also Turbo Boost which pushes the max frequency
if possible.

The existing governors don't work with HWP since they select frequencies
and HWP doesn't expose those.  Therefore a dummy hwp-interal governor is
used that doesn't do anything.

xenpm get-cpufreq-para is extended to show HWP parameters, and
set-cpufreq-hwp is added to set them.

A lightly loaded OpenXT laptop showed ~1W power savings according to
powertop.  A mostly idle Fedora system (dom0 only) showed a more modest
power savings.

This fir for a 10th gen 6-core 1600 MHz base 4900 MHZ max cpu.  In the
default balance mode, Turbo Boost doesn't exceed 4GHz.  Tweaking the
energy_perf preference with `xenpm set-cpufreq-hwp balance ene:64`,
I've seen the CPU hit 4.7GHz before throttling down and bouncing around
between 4.3 and 4.5 GHz.  Curiously the other cores read ~4GHz when
turbo boost takes affect.  This was done after pinning all dom0 cores,
and using taskset to pin to vCPU/pCPU 11 and running a bash tightloop.

RFC since there are a few open questions:

hwp defaults to enabled and running in balanced mode.  Maybe this wants
changing?

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

Jason Andryuk (12):
  cpufreq: Allow restricting to internal governors only
  cpufreq: Add perf_freq to cpuinfo
  cpufreq: Export intel_feature_detect
  cpufreq: Add Hardware P-State (HWP) driver
  xenpm: Change get-cpufreq-para output for internal
  cpufreq: Export HWP parameters to userspace
  libxc: Include hwp_para in definitions
  xenpm: Print HWP parameters
  xenpm: Factor out a non-fatal cpuid_parse variant
  xen: Add SET_CPUFREQ_HWP xen_sysctl_pm_op
  libxc: Add xc_set_cpufreq_hwp
  xenpm: Add set-cpufreq-hwp subcommand

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
 xen/include/asm-x86/msr-index.h           |  21 +
 xen/include/public/sysctl.h               |  52 +-
 15 files changed, 1199 insertions(+), 29 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

-- 
2.29.2


