Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C427763D47
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 19:10:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570631.892594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi1j-0005pq-Qz; Wed, 26 Jul 2023 17:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570631.892594; Wed, 26 Jul 2023 17:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOi1j-0005nX-Nu; Wed, 26 Jul 2023 17:10:19 +0000
Received: by outflank-mailman (input) for mailman id 570631;
 Wed, 26 Jul 2023 17:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pn9P=DM=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qOi1h-0005nP-VZ
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 17:10:17 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49631b4d-2bd7-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 19:10:15 +0200 (CEST)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-63d09d886a6so397906d6.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 10:10:15 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 s17-20020a0ca611000000b0063d1aa446e2sm1248019qva.59.2023.07.26.10.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 10:10:12 -0700 (PDT)
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
X-Inumbo-ID: 49631b4d-2bd7-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690391413; x=1690996213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aqabqG54N5FkkdtDMamD9uQTj07nTP3p+qQtsWvth28=;
        b=JyQfIAC2j3WiPl0LiIb0Fa0BEyAIUQywMCa9SlTFb9mYeUJ2EaBnZde/TWtP68sUcT
         LGDTg7SL2r2T89DjbVPQPdWCfWn7OomLqmM46yWGq+GAMUTCELIwRU1xD024Tc5QqVKz
         XiuGDEHSxooK9Qx2aMF90GE6hOxLRKysJvDlJwm9dZsPKluMZbITHOJJgl5FRswxdl2f
         sKTTX1T6bKZqdttuaWj7+JmE1ggg9iPNDxPiIm06x3T80Eyh3WZZtX1s5cyg7vtlHaoQ
         MhLUr+KL/jJJx0fMlmSw4m8G/Jfe9gpvSW2C6YMGZhHAKXlNSCxNMz81wVdLWhiJ0whD
         OxXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690391413; x=1690996213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aqabqG54N5FkkdtDMamD9uQTj07nTP3p+qQtsWvth28=;
        b=BGXR21SRVhPjTIYR8v7M6CeQv6SbKIRk2HqYaUyw+Xs9nLIxKr7yjcSHYWZ+JJgkZv
         0GKPmNLwHIdKmIThJYGGixuH8NO8k0H4Z7f8+v8QEO5DJD5Efy1FOcbjBpE9etal5DTW
         uD8IlWUA2qCNgjacs5u3udl01a7b4/7ik/w9VDPR6QCgYwjOpEY68dxVaSlsRyoIxlgg
         4zXvcG1mI9jf2RB6XyxQv2KmWvllvBSHvXlRnzPZybQDhTbpbhjfvKBMoUIWm1j9YUgw
         4mDgJCmB/KrEn7UbDG9SGHqPe6j5s4qtLJ8np6h+WUWLQyf9hXuXVEr8NipTuAumfmu6
         irig==
X-Gm-Message-State: ABy/qLaRcGRUNTi8GzXozZ7eRsv/CrsnXYj/mm3NaJ9PXgsJC8bKVOgf
	2y4XGKH+XKMzs/1Wu5BtejdYC+dTGpA=
X-Google-Smtp-Source: APBJJlEB2Pk94f559fVULgNo4jMpQJDt9+JAmDKPAyvslNL0yQa6q8tQEQ5qAXdxfIBTjbe/w85Jiw==
X-Received: by 2002:a0c:b34e:0:b0:63c:f797:b0be with SMTP id a14-20020a0cb34e000000b0063cf797b0bemr1909035qvf.40.1690391413437;
        Wed, 26 Jul 2023 10:10:13 -0700 (PDT)
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
Subject: [PATCH v7 00/15] Intel Hardware P-States (HWP) support
Date: Wed, 26 Jul 2023 13:09:30 -0400
Message-ID: <20230726170945.34961-1-jandryuk@gmail.com>
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

v7:
Minor tweaks from review feedback - documented in respective patches.
Jan previously asked for a toolstack side review / ack of 
"[PATCH 04/15] xen/sysctl: Nest cpufreq scaling options"

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
 xen/arch/x86/acpi/cpufreq/hwp.c              | 658 +++++++++++++++++++
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
 20 files changed, 1432 insertions(+), 121 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

-- 
2.41.0


