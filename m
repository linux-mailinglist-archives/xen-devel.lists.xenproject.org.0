Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A116CF4C8
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 22:52:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516352.800358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phclw-0006km-AI; Wed, 29 Mar 2023 20:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516352.800358; Wed, 29 Mar 2023 20:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phclw-0006it-4A; Wed, 29 Mar 2023 20:51:56 +0000
Received: by outflank-mailman (input) for mailman id 516352;
 Wed, 29 Mar 2023 20:51:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PU7e=7V=citrix.com=prvs=445237bd4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1phclu-0005Jv-Ib
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 20:51:54 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 876ba61f-ce73-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 22:51:52 +0200 (CEST)
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
X-Inumbo-ID: 876ba61f-ce73-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680123112;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nAB1CKgLZXI0dUASvR3vyS59U8+ZAIysWnLvIiLwXW8=;
  b=FFR79tXwrzz5hFWHHxz/adCbg2QVhOUOJ91OT2G5vy60WGPggbMojoeq
   wMjFsN0pj3QFDlmOPhP1CWNshqU8Ja1C+JkGifwi8a2+ak0nuONhWvE3t
   lQuSPFCW9vZR41tw6mdEklBHKGwjH2Oft6a+hGJjPb3kWpWwX7Md5BiTn
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 102947419
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:NJ6q0KjWlfV70ttFrjZQ4SCQX161GhAKZh0ujC45NGQN5FlHY01je
 htvXGzQa6yPZWXweowlbdzg/B9S6JTWmoNrSgJr/Hw8Rn8b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wWPzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQDOW88cjvfldm13eucb/NyvuMHCubSadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 jiXozulW0By2Nq3ljyg+yisvvHzsRilBIE1Crfl2vg7qQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O88Q5RyJy6HUyx2EHWVCRTlEAPQ5sOcmSDps0
 UWG9+4FHhQ27ufTEyjEsO7J83XrY3N9wXI+iTEsVhpa0sXI/JMIjQ+WafN5DpaSqvvaIGSlq
 9yVlxTSl4n/nOZSifrqrACX3278znTaZlVrv1uKBwpJ+is8Pdf4PNLwtDA3+N4adO6kok+9U
 G/ociR0xMQHFtmzmSOEW43h95n5tq/eYFUwbbOCdqTNFghBGFb5J+i8GBkkeC9U3j8sIFcFm
 nP7twJL/4N0N3C3d6JxaI/ZI510nfC5TIi7Ca6EMIQmjn1NmOmvpnkGiam4gQjQfLUEy/lja
 f93j+73ZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjG8vhT6pLHPCT9Ye5cYDOzghURsPvsTPP9r
 4wOaKNnCnx3DIXDX8Ug2dVNfQ1VcSBiXcmeRg4+XrfrHzeK0VoJU5f5qY7NsaQ/90iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:hjOZc6C+njLKiVPlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,301,1673931600"; 
   d="scan'208";a="102947419"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH RFC 0/9] x86: Merge cpuid and msr policy
Date: Wed, 29 Mar 2023 21:51:28 +0100
Message-ID: <20230329205137.323253-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

tl;dr to add MSR_ARCH_CAPS features sensibly, cpu_{featureset<->policy}() need
to not operate on objects of differing lifetimes, so structs
{cpuid,msr}_policy need merging and cpu_policy is the obvious name.

But this does mean that we now have

  cpu_policy->basic.$X
  cpu_policy->feat.$Y
  cpu_policy->arch_caps.$Z

and plenty of code now reads

  d->arch.cpu_policy->feat.$Y

instead of

  d->arch.cpuid->feat.$Y

The latter can be half-fixed with some union magic (see patch 9 commit
message).  The former can be fixed by putting cpuid/msr infixes in cpu_policy,
which is doable but very invasive, and would make plenty of code read

  d->arch.cpu_policy->cpuid.feat.$Y

and the two obviously shouldn't be done together.

So, RFC.  Does this code layout look ok?  If we want to make changes with
naming, now is very much the right time to get them sorted.

Patches 1-8 are pretty ready to go.  Patch 9 is the remainder to take out the
temporary hacks, and I'm still in the process of merging the system policy
derivation.

Andrew Cooper (9):
  x86: Rename struct cpu_policy to struct old_cpuid_policy
  x86: Rename {domctl,sysctl}.cpu_policy.{cpuid,msr_policy} fields
  x86: Rename struct cpuid_policy to struct cpu_policy
  x86: Merge struct msr_policy into struct cpu_policy
  x86: Merge the system {cpuid,msr} policy objects
  x86: Merge a domain's {cpuid,msr} policy objects
  x86: Merge xc_cpu_policy's cpuid and msr objects
  x86: Drop struct old_cpu_policy
  RFC: Everything else

 tools/fuzz/cpu-policy/afl-policy-fuzzer.c     |  15 +-
 .../fuzz/x86_instruction_emulator/fuzz-emul.c |   2 +-
 tools/libs/guest/xg_cpuid_x86.c               |  48 +-
 tools/libs/guest/xg_private.h                 |   5 +-
 tools/tests/cpu-policy/test-cpu-policy.c      |  50 +-
 tools/tests/tsx/test-tsx.c                    |  58 +-
 tools/tests/x86_emulator/Makefile             |   2 +-
 tools/tests/x86_emulator/test_x86_emulator.c  |   2 +-
 tools/tests/x86_emulator/x86-emulate.c        |   2 +-
 tools/tests/x86_emulator/x86-emulate.h        |   2 +-
 xen/arch/x86/Makefile                         |   1 +
 xen/arch/x86/cpu-policy.c                     |  67 +++
 xen/arch/x86/cpu/common.c                     |   4 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c           |   2 +-
 xen/arch/x86/cpu/vpmu_intel.c                 |   4 +-
 xen/arch/x86/cpuid.c                          | 101 ++--
 xen/arch/x86/domain.c                         |  18 +-
 xen/arch/x86/domctl.c                         |  51 +-
 xen/arch/x86/hvm/emulate.c                    |   2 +-
 xen/arch/x86/hvm/hvm.c                        |  38 +-
 xen/arch/x86/hvm/ioreq.c                      |   4 +-
 xen/arch/x86/hvm/mtrr.c                       |   2 +-
 xen/arch/x86/hvm/svm/svm.c                    |  18 +-
 xen/arch/x86/hvm/svm/svmdebug.c               |   2 +-
 xen/arch/x86/hvm/vlapic.c                     |   2 +-
 xen/arch/x86/hvm/vmx/vmx.c                    |  12 +-
 xen/arch/x86/hvm/vmx/vvmx.c                   |   2 +-
 xen/arch/x86/include/asm/cpu-policy.h         |  18 +
 xen/arch/x86/include/asm/cpuid.h              |  10 -
 xen/arch/x86/include/asm/domain.h             |   4 +-
 xen/arch/x86/include/asm/guest_pt.h           |   4 +-
 xen/arch/x86/include/asm/msr.h                |  13 +-
 xen/arch/x86/include/asm/paging.h             |   2 +-
 xen/arch/x86/mm/mem_sharing.c                 |   3 +-
 xen/arch/x86/mm/shadow/hvm.c                  |   2 +-
 xen/arch/x86/msr.c                            |  98 +---
 xen/arch/x86/pv/domain.c                      |   2 +-
 xen/arch/x86/pv/emul-priv-op.c                |   6 +-
 xen/arch/x86/pv/ro-page-fault.c               |   2 +-
 xen/arch/x86/sysctl.c                         |  77 +--
 xen/arch/x86/traps.c                          |   2 +-
 xen/arch/x86/x86_emulate.c                    |   2 +-
 xen/arch/x86/x86_emulate/x86_emulate.c        | 166 +++---
 xen/arch/x86/x86_emulate/x86_emulate.h        |   6 +-
 xen/arch/x86/xstate.c                         |   4 +-
 xen/include/public/domctl.h                   |   4 +-
 xen/include/public/sysctl.h                   |   4 +-
 xen/include/xen/lib/x86/cpu-policy.h          | 540 +++++++++++++++++-
 xen/include/xen/lib/x86/cpuid.h               | 475 ---------------
 xen/include/xen/lib/x86/msr.h                 | 104 ----
 xen/lib/x86/cpuid.c                           |  12 +-
 xen/lib/x86/msr.c                             |   6 +-
 xen/lib/x86/policy.c                          |   8 +-
 53 files changed, 986 insertions(+), 1104 deletions(-)
 create mode 100644 xen/arch/x86/cpu-policy.c
 create mode 100644 xen/arch/x86/include/asm/cpu-policy.h
 delete mode 100644 xen/include/xen/lib/x86/cpuid.h
 delete mode 100644 xen/include/xen/lib/x86/msr.h

-- 
2.30.2


