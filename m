Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600EB4AE065
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:10:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268582.462434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwE-0003Xn-Gx; Tue, 08 Feb 2022 18:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268582.462434; Tue, 08 Feb 2022 18:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwE-0003VA-Bq; Tue, 08 Feb 2022 18:10:02 +0000
Received: by outflank-mailman (input) for mailman id 268582;
 Tue, 08 Feb 2022 18:10:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1rHF=SX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nHUwC-0003Sy-Kk
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:10:00 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5231fbd7-890a-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:09:57 +0100 (CET)
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
X-Inumbo-ID: 5231fbd7-890a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644343798;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=pViVV2hWeibhQaOV7IR6ioT+MotoxNWQ6k6CH/wQXjM=;
  b=RRI8/GZBrwavs3yKjbJ+G0FugcDWpaV3NAL5Uu8s0/e9H4UEV/1Vdhbd
   S5b3Huc5EPUEdduPbGq0icqScuHMks+8GvxNAumhx/7GUiKVMYoChZMi6
   /mwcucRChY+cfW99vXUL3kKvzhJiSSzpfZHOukErQ7t6BA+Q3T9PObg5B
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: IRLRDnSqC0pCtb6uu4IVpteITDI4nwXYX5AkdbXNQ/wuz82hdM8xq3oUVsAD9BVgslIO8LGutt
 0cClFkIFjNjenMB/YBlKqQeHU1HptXXjj6KlWeBTa1uq5srMh4wAMnv43JSuqTZ6qSjjE9zXNh
 ONdhvTrO/06qLraeHMpZzftQHXXQ6RWm28lCroRqHNBluGlc/LyjxDIZ33jbEP86QDpxeYoaNW
 RFSkYxUHqL09TjyZWucC+rLAYZ/0DthbqV7bsqxNZWBeEnaPJn4HWFfO989qiCoMFmaRjqLbpO
 gGen/8GkEUucBFznZ3O+NORD
X-SBRS: 5.1
X-MesageID: 63762669
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:iy86/K8Epf0eTHqGQ3bUDrUDo3mTJUtcMsCJ2f8bNWPcYEJGY0x3y
 2EfWjrSPa2OMDCkf4p1YNu+9xwEusCHzd4wGgJr+3s8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si9AttENlFEkvU2ybuOU5NXsZ2YhFWeIdA970Ug5w7Rh0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhQk
 tt1kK6+Zjw2L7Xps/UgWBJcQ2JhaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwKKsXxMZxZkXZn1TzDVt4tQIzZQrWM7thdtNs1rp4VQqiEO
 ZRIAdZpRD7bR0F/Nlk3NJUjuLeXu2TtSzxUkV3A8MLb5ECMlVcsgdABKuH9atGMAMlYgEucj
 mbH5HjiRAEXMsSFzjiI+W7qgfXA9R4XQ6pLSuf+rKQzxgTOmCpDU3X6SGdXv9GY0ECGfuBRB
 HcL6zILhrkP/0evHpriCkjQTGG/gjYQXN9ZEusf4Q6Ly7bJ7wvxOlXoXgKte/R96pZoGGVCO
 kuh2oqwWGcx6OH9pWe1q+/MxQ5eLxT5OoPricUsaQIeq+fur4go5v4kZoYySfXl5jEZ9NyZ/
 txrkMTcr+hJ5SLo///ilbwiv95LjsKYJjPZHi2NAgqYAvpRPeZJnbCA51nB9upnJ42EVFSHt
 3Vss5HAsLxXXMjUyn3XGb5l8FSVCxGtamy0vLKSN8N5q2TFF4CLIei8Hw2S1G82a51ZKFcFk
 WfYuB9L5Y87AZdZRfQfXm5FMOxzlfKIPY28Dpj8N4MSCrAsJF7v1Hw/Pia4gjGy+GByyvtXE
 cnALq6R4YMyVP0PIMyeHLxGj9fGB0kWmAvueHwM507/juPFOSXFEOxt3ZnnRrlR0Z5oaT79q
 753X/ZmAT0GOAEnSiWIo4MVM34QKn03WcL/p8BNL7bRKQt6AmAxTfTWxOp5KYBimq1UkMbO/
 228BRAEmAau2yWfJFXYcG1nZZPuQY178SAxMxszMAv6wHMke4uusvsSLsNlYbk9+eV/5vdoV
 P1ZKd6YC/FCR22fqTQQZJXwtqJ4cxGviV7cNiapemFnLZVhWxbI6pnveQ62rHsCCS++tM0fp
 by811yEHcpfFlo6VMuPMaCh1VK8u3QZidleZUqQL4kBYljo/ahrNzf10q09LfYTJEiR3TCdz
 QuXX0sV/LGfv48v/dDVrqmYtIP1QfBmF09XEmSHv7a7MS7WojiqzYNaCbvaeDncUCX/+bm4Z
 PUTxPb5aaVVkFFPuot6MrBq0aNhuIe/++4EllxpTCfRclCmKrJ8OX3Xj8BAu5pEyqJdpQbrC
 FmE/cNXOOnRNc7oeLLLyNHJsghXOSkopwTv
IronPort-HdrOrdr: A9a23:8s2yjqDe3thWNRDlHem655DYdb4zR+YMi2TC1yhKJyC9E/bo8P
 xG88566faZslossRIb6LS90cu7MBDhHPdOiOF7V9qftWHdyQ6VxepZjLcKrQeOJ8SHzJ8+6Z
 td
X-IronPort-AV: E=Sophos;i="5.88,353,1635220800"; 
   d="scan'208";a="63762669"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 0/6] x86: Changes for Intel Feb 2022 microcode
Date: Tue, 8 Feb 2022 18:09:36 +0000
Message-ID: <20220208180942.14871-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

Changes for two software visible changes in the Intel Feb 2022 microcode drop.
1) Deprecation of TSX on more client parts
2) Retrofitting of AMD's MSR_SPEC_CTRL.PSFD to various CPUs

These patches have been committed and backported to 4.14 and later.

Andrew Cooper (6):
  x86/spec-ctrl: Clean up MSR_MCU_OPT_CTRL handling
  x86/tsx: Move has_rtm_always_abort to an outer scope
  x86/tsx: Cope with TSX deprecation on WHL-R/CFL-R
  tests/tsx: Extend test-tsx to check MSR_MCU_OPT_CTRL
  x86/cpuid: Infrastructure for cpuid word 7:2.edx
  x86/spec-ctrl: Support Intel PSFD for guests

 docs/misc/xen-command-line.pandoc           |  25 +++++--
 tools/libs/light/libxl_cpuid.c              |   2 +
 tools/misc/xen-cpuid.c                      |   6 ++
 tools/tests/tsx/test-tsx.c                  |   9 ++-
 xen/arch/x86/acpi/power.c                   |   3 +-
 xen/arch/x86/cpu/common.c                   |   4 ++
 xen/arch/x86/cpu/intel.c                    |  32 +++++++++
 xen/arch/x86/include/asm/cpufeature.h       |   1 +
 xen/arch/x86/include/asm/msr-index.h        |   2 +
 xen/arch/x86/include/asm/processor.h        |   3 +
 xen/arch/x86/include/asm/spec_ctrl.h        |   2 -
 xen/arch/x86/msr.c                          |   2 +-
 xen/arch/x86/platform_hypercall.c           |   3 +
 xen/arch/x86/smpboot.c                      |   3 +-
 xen/arch/x86/spec_ctrl.c                    |  52 +++++++-------
 xen/arch/x86/tsx.c                          | 102 ++++++++++++++++++++++++----
 xen/include/public/arch-x86/cpufeatureset.h |   3 +
 xen/include/xen/lib/x86/cpuid.h             |  13 +++-
 xen/tools/gen-cpuid.py                      |   2 +-
 19 files changed, 211 insertions(+), 58 deletions(-)

-- 
2.11.0


