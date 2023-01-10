Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA847664740
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 18:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474877.736313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH4-0004Eg-Ae; Tue, 10 Jan 2023 17:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474877.736313; Tue, 10 Jan 2023 17:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFIH4-0004AN-7A; Tue, 10 Jan 2023 17:18:58 +0000
Received: by outflank-mailman (input) for mailman id 474877;
 Tue, 10 Jan 2023 17:18:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dQxz=5H=citrix.com=prvs=367c7493a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pFIH2-0003S0-Pd
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 17:18:56 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc0f24b7-910a-11ed-91b6-6bf2151ebd3b;
 Tue, 10 Jan 2023 18:18:54 +0100 (CET)
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
X-Inumbo-ID: dc0f24b7-910a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673371134;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=mz05xHRr3qRTB02QoQaO+mfrlV8+T4q/+0C/A1xaNc4=;
  b=WCMh4zFl/PlKETTmaZaTzzCqqUISfUDIWTgdYv6Wc3UHoVjC2MZrlF2X
   OKwuN+6zoErEtRoWe+73iGe6L7KJzQWjLwcakiwXyTUYMni30IKi8Yrrx
   gi/HAdNQm1+ULJ1P6VpXvlhxxHo/Sg8CfHialbIaCedQioL1BJABR6zUT
   Q=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 90908185
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:28nkk6wk8XHfTO+NWwV6t+cexirEfRIJ4+MujC+fZmUNrF6WrkUAm
 zcZWm2AMv2IZzDxedF/bYyx/EoD7MTXztdiHgZoqCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5QRnPKgT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KV5F1
 P0feC8rUhvAxOCI/ZWgFKppq+12eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiFJ0ExhbB9
 j+uE2LRJywELsyD8zi5+VWegeTAwAnGep9PLejtnhJtqALKnTFCYPEMbnOkpdGph0j4XMhQQ
 2QX9zQvq+4u9UWtZtj7QxC85nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 nertd70AT1ksJWOVGmQsLyTqFuP1TM9dDFYI3VeFE1cvoel8NpbYg/zoshLL6WUj9qlBhfMy
 HPJrhYDoK5Nzssm/vDulbzYuA6Eqp/MRw8zwwzYWGO58w90DLKYi5yUBUvztqgZctvAJrWVl
 D1dwpXFsrhSZX2YvHbVKNjhCo1F8Bps3Nf0pVd0V6cs+D22k5JIVdABuWouTKuF3yttRNMIX
 KMxkVkKjHOwFCHwBUOSX25WI5pC8EQYPY65Ps04l/IXCnSLSCeJ/Tt1eWmb1H33nU4nnMkXY
 MnEKpz8XC5FVPk+llJaotvxN5dxnkjSIkuKG/jGI+mPi+LCNBZ5t59ZWLdxUgzJxPzd+1iEm
 zquH8CL1w9eQIXDjtr/qOYuwaQxBSFjX/je8pUHHtNv1yI6QAnN/deNm+J+E2Gk9owJ/tr1E
 oaVARMEmQuu2CCZcm1nqBlLMdvSYHq2llpjVQREALpi8yRLjVqHhEvHS6YKQA==
IronPort-HdrOrdr: A9a23:Ts+48qvM/T/hIseqttiTepL+7skDeNV00zEX/kB9WHVpm62j+/
 xG+c5x6faaslkssR0b9+xoWpPhfZqsz/9ICOAqVN/JMTUO01HYT72Kg7GSpgHIKmnT8fNcyL
 clU4UWMqyVMbGit7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.96,315,1665460800"; 
   d="scan'208";a="90908185"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH v2 0/8] x86: Protection Key Supervisor support
Date: Tue, 10 Jan 2023 17:18:37 +0000
Message-ID: <20230110171845.20542-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Only 14 months after v1...  This time with testing on real hardware (not that
any bugs were found) and against an updated XTF comprehensive pagewalk test.

  # time ./xtf-runner hvm64 pagetable-emulation~hap
  --- Xen Test Framework ---
  Environment: HVM 64bit (Long mode 4 levels)
  Test pagetable-emulation
    Info: Intel, Fam 6, Model 143, Stepping 3, paddr 46, vaddr 48
    Features: PSE PAE PGE PAT PSE36 PCID NX PAGE1G SMEP SMAP PKU PKS
    Paging mode heuristic: Hap
    Using physical addresses 0000000040000000 and 0000200000000000
  Test L1e
  Test L2e
  Test L2e Superpage
  Test L3e
  Test L3e Superpage
  Test L4e
  Test L4e Superpage
  Completed 28835840 tests
  Test result: SUCCESS

  Combined test results:
  test-hvm64-pagetable-emulation~hap       SUCCESS

  real                                     1m26.315s
  user                                     0m0.039s
  sys                                      0m0.086s

This test is going to get even more silly when CET-SS becomes supported.

Andrew Cooper (8):
  x86/boot: Sanitise PKRU on boot
  x86/prot-key: Enumeration for Protection Key Supervisor
  x86/prot-key: Split PKRU infrastructure out of asm/processor.h
  x86: Initial support for WRMSRNS
  x86/hvm: Context switch MSR_PKRS
  x86/hvm: Enable guest access to MSR_PKRS
  x86/pagewalk: Support PKS
  x86/hvm: Support PKS for HAP guests

 tools/libs/light/libxl_cpuid.c              |  2 +
 tools/misc/xen-cpuid.c                      |  3 +-
 xen/arch/x86/cpu/common.c                   |  6 ++
 xen/arch/x86/cpuid.c                        |  9 +++
 xen/arch/x86/hvm/hvm.c                      |  5 +-
 xen/arch/x86/hvm/vmx/vmx.c                  | 26 +++++++++
 xen/arch/x86/include/asm/cpufeature.h       |  2 +
 xen/arch/x86/include/asm/guest_pt.h         |  5 ++
 xen/arch/x86/include/asm/hvm/hvm.h          |  3 +
 xen/arch/x86/include/asm/msr-index.h        |  2 +
 xen/arch/x86/include/asm/msr.h              | 21 +++++++
 xen/arch/x86/include/asm/processor.h        | 38 -------------
 xen/arch/x86/include/asm/prot-key.h         | 85 +++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/x86-defns.h        |  1 +
 xen/arch/x86/mm/guest_walk.c                | 16 ++++--
 xen/arch/x86/msr.c                          | 10 ++++
 xen/arch/x86/setup.c                        |  6 +-
 xen/arch/x86/smpboot.c                      |  4 ++
 xen/arch/x86/x86_emulate.c                  |  2 +
 xen/include/public/arch-x86/cpufeatureset.h |  2 +
 20 files changed, 201 insertions(+), 47 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/prot-key.h

-- 
2.11.0


