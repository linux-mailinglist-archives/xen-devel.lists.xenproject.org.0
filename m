Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6B7772E27
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 20:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578786.906459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5KW-0004J0-Uo; Mon, 07 Aug 2023 18:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578786.906459; Mon, 07 Aug 2023 18:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT5KW-0004GZ-Rb; Mon, 07 Aug 2023 18:51:48 +0000
Received: by outflank-mailman (input) for mailman id 578786;
 Mon, 07 Aug 2023 18:51:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qk11=DY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qT5KW-0004GT-1A
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 18:51:48 +0000
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [2607:f8b0:4864:20::f32])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 74b5f192-3553-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 20:51:45 +0200 (CEST)
Received: by mail-qv1-xf32.google.com with SMTP id
 6a1803df08f44-63cfd6e3835so27471146d6.3
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 11:51:45 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 l3-20020a0ce503000000b00635fcd30ff9sm3077278qvm.40.2023.08.07.11.51.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 11:51:43 -0700 (PDT)
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
X-Inumbo-ID: 74b5f192-3553-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691434304; x=1692039104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LeiJiP8hRzb2BMnxYpkNxhm2nxMuiEBd9IMbb+dk1EY=;
        b=Li2JKYXOKgdOwj6nwLZr4m+V0su0AzIBIYrLiwreewD2SiUSElEi4koPgw13/r80gk
         sXo3ki1XAn2RiKBIS+TpgzcYiFxGqUWlzvMlS8ABT02mLyv3TSlpmzOLeAr5KdGFFXHq
         jeClxZNHZ/nLmcd3gfVn0jpCYNwvweFRw63LFEiPJ7B/5eff9uFDFJn6oCTL1r2FPkTE
         hi2TFRxpJew+ykSF2wUJrgdh1OZwcyHttYCxafjMDL88UZxLjCRg2FmcFX+DhCeANhaE
         WnTDBRP2sCIhab7sT7LYaPsfzZlzhMdPAx8pnFAfz0/he9RRKCjSfFn3MA89RLGwXwZa
         FsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691434304; x=1692039104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LeiJiP8hRzb2BMnxYpkNxhm2nxMuiEBd9IMbb+dk1EY=;
        b=c8eT1vrDoVLvGMUCKHIo8T1vrL2rsunp9Bd4sBp5aXIKkAnj2kWmJ+9KrCOZUXAS0N
         tBICeMarUG133MMClAlEp1Op3Qy9kCWUJcaVj4JIx5FygdykemSEBeXwwVuVjiyPcHxB
         gDAyxz5Oc2jBCXxbor1EBxCyjBFgZ5ILn0dLPYShuPO8aPd1/Pw2P4vlCw1YVaUJLSeC
         +2rr5nQ79ZWt0GZIAfhsdMEC89kcX8MegCIHck7uiOU4gEm6MUPgpuVxSrjH8GXtyx0t
         9/sclBRczpDirrYvULsoClbM1fVfVHdtg/pSb6ocguW0yIFRrbWZlvfc1rNk8xmr5oGI
         +EVA==
X-Gm-Message-State: AOJu0Yz3wdn/tqQ7bHdkkuK0RMUkjciY6XurhlNDJaQSGQofemJ8lTha
	EbMLfRgYeRu+oUn9TmBYlYq92au/dpE=
X-Google-Smtp-Source: AGHT+IEDzb0gJ28gI32PY4ftFsSxYdJDCegQ1fHYd3fNQpbRN7Vxi/nCqmQyNKHvL1YDoPaBFRwk+A==
X-Received: by 2002:a05:6214:807:b0:63c:f8d2:8b3f with SMTP id df7-20020a056214080700b0063cf8d28b3fmr9138970qvb.44.1691434304071;
        Mon, 07 Aug 2023 11:51:44 -0700 (PDT)
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
Subject: [PATCH v8 00/15] Intel Hardware P-States (HWP) support
Date: Mon,  7 Aug 2023 14:51:04 -0400
Message-ID: <20230807185119.98333-1-jandryuk@gmail.com>
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

v8:
Minor tweaks from review feedback - documented in respective patches.

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

 CHANGELOG.md                                 |   1 +
 docs/misc/xen-command-line.pandoc            |  20 +-
 tools/include/xenctrl.h                      |  28 +-
 tools/libs/ctrl/xc_pm.c                      |  81 ++-
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
 20 files changed, 1471 insertions(+), 120 deletions(-)
 create mode 100644 xen/arch/x86/acpi/cpufreq/hwp.c

-- 
2.41.0


