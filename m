Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2988E75F79A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 14:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568912.889026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv9e-0003iP-Gt; Mon, 24 Jul 2023 12:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568912.889026; Mon, 24 Jul 2023 12:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNv9e-0003fx-Ci; Mon, 24 Jul 2023 12:59:14 +0000
Received: by outflank-mailman (input) for mailman id 568912;
 Mon, 24 Jul 2023 12:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymW7=DK=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qNv9c-0003BP-Mz
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 12:59:12 +0000
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [2607:f8b0:4864:20::82d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1aabc1d-2a21-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 14:59:11 +0200 (CEST)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-40551e2deebso9815681cf.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 05:59:10 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 d3-20020ac81183000000b00402364e77dcsm3273060qtj.7.2023.07.24.05.59.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 05:59:08 -0700 (PDT)
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
X-Inumbo-ID: e1aabc1d-2a21-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690203549; x=1690808349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uqF6OqLMuRcJv9J1aRyFnGvRuRaQSWG7Vrtddk2txvs=;
        b=B0HJzQYl5juuyYNQl0j+HinrUkUalScwEccd5Hr4QScJxqQxV6BldxAILndM9PszJv
         kfSO9ScV96dLPYlLGjttdSWLmrj5q1rzpw+UWPTfnzS60iU61vqH4jSQX/YORPlaz2+T
         sdJgAfvSL5LnBjMcrHE+qvw7EEwlSfDGTdgZwHBwlKiohLvu02/I7qpozMNeDTzvFRtA
         9pcnO0WAns6KHh/BLynlyVniICrCyckMfeQViyEa8/F4IElqYtaOntbo9mEj7rZtrJWy
         iipGE1hexJEkBAZykLmMdBNT2fyyjJKwaM3IGpdU23gnjAAgmZ+EwMubp46zv0rxhAm6
         7KPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690203549; x=1690808349;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uqF6OqLMuRcJv9J1aRyFnGvRuRaQSWG7Vrtddk2txvs=;
        b=Cra3opwDlm5VwTyX/LRAaOpsBgkIwaCrLvLvY/ZPMRbCWf1erU/kouPs/IDXG4WmYl
         h1fg+liSlhIs1kcw6FDNG6jiJf00NIb3MT+8cvTg4FClFsh8u5MuZIRr5WW1l6krmSgh
         l6Z/Ahiop5W2rvxy9O4l90lTEHeO1uS8SV4Xw36QgyPRxKwnezm41impG9G30bA1Vp93
         l5kChmP2sox7Fr00vRnAvh2dT9czwR0AHI1ZYakxRTK4Zg0caYxz/7Uzho/bV3tA3PSZ
         CeA0OWAIEOAzvnV72Hso4l64WfKvvN/F28vFLikWTcQ6bAhQqTSz9MsER3qvIYtmfkEX
         hx6w==
X-Gm-Message-State: ABy/qLaHn59R+XCc+kIccc0BCccECmrpWBu6ON4N4m6mEcdPztBQ+r/p
	V/zMLi7JkzNxiE8FWnx1EsA9LbOqc9s=
X-Google-Smtp-Source: APBJJlFftsEQuW1z0amxWsxbtvZrLWzpbkryxZIhf2fOEuADzNt84E+eYtTwxA35MSlQph34azMsrQ==
X-Received: by 2002:a05:622a:1191:b0:405:402b:9d61 with SMTP id m17-20020a05622a119100b00405402b9d61mr8469065qtk.42.1690203549122;
        Mon, 24 Jul 2023 05:59:09 -0700 (PDT)
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
Subject: [PATCH v6 00/15] Intel Hardware P-States (HWP) support
Date: Mon, 24 Jul 2023 08:58:42 -0400
Message-ID: <20230724125857.11133-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
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

v5:
HWP is enabled with a toplevel cpufreq=hwp option.  There is no fallback
by default, but a cpufreq=hwp;xen syntax is now supported.  That tries
hwp first.  If HWP registration is unsuccessful, then xen registration
is performed as a fallback.

More changes from Jan's feedback.  They are typically minor and
documented in individual patches.

v6:
After some discussion, the cpufreq=hwp;xen syntax is retained, with the
global applicability of "verbose" mention in docs.  Minor tweaks
elsewhere as documented in individual patches.

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

 CHANGELOG.md                                 |   2 +-
 docs/misc/xen-command-line.pandoc            |  20 +-
 tools/include/xenctrl.h                      |  28 +-
 tools/libs/ctrl/xc_pm.c                      |  42 +-
 tools/misc/xenpm.c                           | 392 ++++++++++-
 xen/arch/x86/acpi/cpufreq/Makefile           |   1 +
 xen/arch/x86/acpi/cpufreq/cpufreq.c          |  31 +-
 xen/arch/x86/acpi/cpufreq/hwp.c              | 654 +++++++++++++++++++
 xen/arch/x86/acpi/lib.c                      |   5 +
 xen/arch/x86/cpu/mcheck/mce_intel.c          |   6 +
 xen/arch/x86/include/asm/cpufeature.h        |  12 +-
 xen/arch/x86/include/asm/msr-index.h         |  16 +-
 xen/drivers/acpi/pmstat.c                    | 100 +--
 xen/drivers/cpufreq/cpufreq.c                |  60 +-
 xen/drivers/cpufreq/cpufreq_misc_governors.c |   9 +
 xen/drivers/cpufreq/cpufreq_ondemand.c       |   3 +
 xen/drivers/cpufreq/utility.c                |   1 +
 xen/include/acpi/cpufreq/cpufreq.h           |  22 +
 xen/include/acpi/pdc_intel.h                 |   1 +
 xen/include/public/sysctl.h                  | 144 +++-
 20 files changed, 1428 insertions(+), 121 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

-- 
2.41.0


