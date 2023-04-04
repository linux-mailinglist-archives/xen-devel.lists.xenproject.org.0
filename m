Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7306D5C5B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 11:52:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517709.803452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLH-00058Z-HE; Tue, 04 Apr 2023 09:52:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517709.803452; Tue, 04 Apr 2023 09:52:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjdLH-00056s-EN; Tue, 04 Apr 2023 09:52:43 +0000
Received: by outflank-mailman (input) for mailman id 517709;
 Tue, 04 Apr 2023 09:52:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Oy2y=73=citrix.com=prvs=4518c43dc=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pjdLF-00056d-Oj
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 09:52:41 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6de41a44-d2ce-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 11:52:38 +0200 (CEST)
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
X-Inumbo-ID: 6de41a44-d2ce-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680601958;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yusP9sqEdAZaFQzY4EzOz4zVJrPEbY9vi/S0gYtOA9g=;
  b=B5JQhePuqD6Lt87DrutIo4qUR9ovRVw5Nq4j3mOFPi86L18IR5qTK7yb
   bG6pWaYepYhUKVcPC+kjBXYbw4hTOTBtC4UBmENXgO/JZpXA/B8+2+AoU
   uUPWn2Q46ABlHzDQjWFJMRDjmskZ5XCWlszrNey/ujeIHHjbnJY0GbuXr
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104656504
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:UXTOm601L5VneFYFKPbD5axxkn2cJEfYwER7XKvMYLTBsI5bp2MOn
 zZKUG7QPfeJYDH8KNslboSw9k4E7cCGz9dmTwJkpC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gBmOagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHT5o3
 /AiIQw3MB2Fht6S55KDVeAymZF2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ0JwBvG+
 zqal4j/Kj8Vbv+w6Be7y2mHo9TTnw7Ae7w/KLLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbr+3Pxd+vBcQLBXNdQwUIdwI52YfupoAPqjXvdslqTrHg27UZBgrML
 yC2QDkW3utD1ZNUif/kpDgrkBr3+MGXE1ddChH/Gzv8s1gnPNPNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83oJrW7FF4aLJ9w43d2HDB4B3jw4UTHoe
 lTPngha+YVeOnCnBYcuPdLpVph0nPK7T4q1PhwxUjapSsEpHDJrAQk0PRLAt4wTuBNEfV4D1
 WezLp/3UCdy5VVPxzuqXeYNuYIWKtQF7TqLH/jTlk33uYdykVbJEd/pxnPSNLFmhE5FyS2Jm
 +ti2zyikEoADLenPnaOoeb+7zkidBAGOHw/kOQPHsbrH+asMDhJ5yP5qV/5R7FYog==
IronPort-HdrOrdr: A9a23:GRI8zauwCmGdDUojUt+TfATN7skDstV00zEX/kB9WHVpm6yj+v
 xG/c5rsCMc7Qx6ZJhOo7+90cW7L080lqQFg7X5X43DYOCOggLBQL2KhbGI/9SKIVycygcy78
 Zdm6gVMqyLMbB55/yKnTVRxbwbsaW6GKPDv5ag8590JzsaD52Jd21Ce36m+ksdfnggObMJUK
 Cyy+BgvDSadXEefq2AdwI4t7iqnaysqHr+CyR2fiIa1A==
X-IronPort-AV: E=Sophos;i="5.98,317,1673931600"; 
   d="scan'208";a="104656504"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 00/15]  x86: Merge cpuid and msr policy objects
Date: Tue, 4 Apr 2023 10:52:07 +0100
Message-ID: <20230404095222.1373721-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is in order to be able to put MSR_ARCH_CAPS in a featureset.  In
hindsight it was a mistake separating CPUID and read-only MSR data into
separate structs.

Patches 1-8 were posted previously and have had the feedback addressed.
Patches 9-15 are the result of splitting the older RFC patch 9 apart, with the
discussed adjustment to aliases accounted for.

Gitlab run showing the series to be buildable at each changeset:

  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/4053607867

P.S. I'm not sure I believe the net diffstat below.  I think the cpuid.c =>
cpu-policy.c rename is confusing it.

Andrew Cooper (15):
  x86: Rename struct cpu_policy to struct old_cpuid_policy
  x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr}_policy fields
  x86: Rename struct cpuid_policy to struct cpu_policy
  x86: Merge struct msr_policy into struct cpu_policy
  x86: Merge the system {cpuid,msr} policy objects
  x86: Merge a domain's {cpuid,msr} policy objects
  x86: Merge xc_cpu_policy's cpuid and msr objects
  x86: Drop struct old_cpu_policy
  x86: Out-of-inline the policy<->featureset convertors
  x86/boot: Move MSR policy initialisation logic into cpu-policy.c
  x86/boot: Merge CPUID policy initialisation logic into cpu-policy.c
  x86/emul: Switch x86_emulate_ctxt to cpu_policy
  tools/fuzz: Rework afl-policy-fuzzer
  libx86: Update library API for cpu_policy
  x86: Remove temporary {cpuid,msr}_policy defines

 tools/fuzz/cpu-policy/afl-policy-fuzzer.c     |  64 +-
 .../fuzz/x86_instruction_emulator/fuzz-emul.c |   2 +-
 tools/libs/guest/xg_cpuid_x86.c               |  50 +-
 tools/libs/guest/xg_private.h                 |   5 +-
 tools/tests/cpu-policy/test-cpu-policy.c      |  54 +-
 tools/tests/tsx/test-tsx.c                    |  71 +-
 tools/tests/x86_emulator/Makefile             |   2 +-
 tools/tests/x86_emulator/test_x86_emulator.c  |   2 +-
 tools/tests/x86_emulator/x86-emulate.c        |   4 +-
 tools/tests/x86_emulator/x86-emulate.h        |   2 +-
 xen/arch/x86/Makefile                         |   1 +
 xen/arch/x86/{cpuid.c => cpu-policy.c}        | 692 ++++----------
 xen/arch/x86/cpu/common.c                     |   4 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c           |   2 +-
 xen/arch/x86/cpuid.c                          | 856 +-----------------
 xen/arch/x86/domain.c                         |  17 +-
 xen/arch/x86/domctl.c                         |  51 +-
 xen/arch/x86/hvm/emulate.c                    |   4 +-
 xen/arch/x86/hvm/hvm.c                        |   5 +-
 xen/arch/x86/hvm/svm/svm.c                    |   2 +-
 xen/arch/x86/hvm/vlapic.c                     |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c                    |   8 +-
 xen/arch/x86/include/asm/cpu-policy.h         |  27 +
 xen/arch/x86/include/asm/cpuid.h              |  21 +-
 xen/arch/x86/include/asm/domain.h             |  13 +-
 xen/arch/x86/include/asm/msr.h                |  14 +-
 xen/arch/x86/mm/mem_sharing.c                 |   3 +-
 xen/arch/x86/mm/shadow/hvm.c                  |   2 +-
 xen/arch/x86/msr.c                            | 160 +---
 xen/arch/x86/pv/domain.c                      |   3 +-
 xen/arch/x86/pv/emul-priv-op.c                |   6 +-
 xen/arch/x86/pv/ro-page-fault.c               |   2 +-
 xen/arch/x86/setup.c                          |   5 +-
 xen/arch/x86/sysctl.c                         |  79 +-
 xen/arch/x86/traps.c                          |   2 +-
 xen/arch/x86/x86_emulate/private.h            |   4 +-
 xen/arch/x86/x86_emulate/x86_emulate.c        |   2 +-
 xen/arch/x86/x86_emulate/x86_emulate.h        |   9 +-
 xen/arch/x86/xstate.c                         |   4 +-
 xen/include/public/domctl.h                   |   4 +-
 xen/include/public/sysctl.h                   |   4 +-
 xen/include/xen/lib/x86/cpu-policy.h          | 510 ++++++++++-
 xen/include/xen/lib/x86/cpuid.h               | 475 ----------
 xen/include/xen/lib/x86/msr.h                 | 104 ---
 xen/lib/x86/cpuid.c                           |  68 +-
 xen/lib/x86/msr.c                             |   6 +-
 xen/lib/x86/policy.c                          |   8 +-
 47 files changed, 1005 insertions(+), 2430 deletions(-)
 copy xen/arch/x86/{cpuid.c => cpu-policy.c} (52%)
 create mode 100644 xen/arch/x86/include/asm/cpu-policy.h
 delete mode 100644 xen/include/xen/lib/x86/cpuid.h
 delete mode 100644 xen/include/xen/lib/x86/msr.h

-- 
2.30.2


