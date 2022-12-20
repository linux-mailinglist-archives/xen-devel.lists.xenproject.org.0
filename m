Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF1F651C9D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 09:51:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.466592.725496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLE-0001nr-Ju; Tue, 20 Dec 2022 08:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 466592.725496; Tue, 20 Dec 2022 08:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7YLE-0001kc-Gh; Tue, 20 Dec 2022 08:51:16 +0000
Received: by outflank-mailman (input) for mailman id 466592;
 Tue, 20 Dec 2022 08:51:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TAHQ=4S=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p7YLD-0001kP-3g
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 08:51:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 74dad16e-8043-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 09:51:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E4E22F4;
 Tue, 20 Dec 2022 00:51:53 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 117D43F71A;
 Tue, 20 Dec 2022 00:51:10 -0800 (PST)
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
X-Inumbo-ID: 74dad16e-8043-11ed-8fd4-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 00/18] cppcheck rule 20.7 fixes
Date: Tue, 20 Dec 2022 08:50:42 +0000
Message-Id: <20221220085100.22848-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

In this serie there are some fixes for the rule 20.7, mainly violation found by
cppcheck, most of them are false positive but some of them can be fixed.

The analysed build is arm64, to reproduce the reports here the command:

./xen/scripts/xen-analysis.py --cppcheck-misra --run-cppcheck -- CROSS_COMPILE="aarch64-linux-gnu-" XEN_TARGET_ARCH="arm64" O=/path/to/artifacts_folder

Luca Fancellu (18):
  arm: cppcheck: misra rule 20.7 deviations for alternative.h
  arm: cppcheck: misra rule 20.7 deviation on processor.h
  arm: cppcheck: misra rule 20.7 deviation on asm_defns.h
  arm: cppcheck: misra rule 20.7 deviation on config.h
  arm: cppcheck: fix misra rule 20.7 on arm/include/asm/string.h
  public: cppcheck: misra rule 20.7 on public/arch-arm.h
  xen: cppcheck: misra rule 20.7 deviation on compiler.h
  xen: cppcheck: misra rule 20.7 deviation on init.h
  xen: cppcheck: misra rule 20.7 deviation on kconfig.h
  xen: cppcheck: misra rule 20.7 deviation on types.h
  xen: cppcheck: misra rule 20.7 deviation on xmalloc.h
  arm: cppcheck: misra rule 20.7 deviation on asm/arm64/sysregs.h
  public/x86: cppcheck: misra rule 20.7 deviation on hvm/save.h
  public/x86: cppcheck: misra rule 20.7 deviation on xen-x86_32.h
  public/x86: cppcheck: misra rule 20.7 deviation on xen-x86_64.h
  public/x86: cppcheck: misra rule 20.7 deviation on arch-x86/xen.h
  public: misra rule 20.7 deviation on errno.h
  public: misra rule 20.7 deviation on memory.h

 docs/misra/false-positive-cppcheck.json    | 21 +++++++++++++++++++++
 xen/arch/arm/include/asm/alternative.h     |  2 ++
 xen/arch/arm/include/asm/arm64/processor.h |  2 +-
 xen/arch/arm/include/asm/arm64/sysregs.h   |  2 +-
 xen/arch/arm/include/asm/asm_defns.h       |  2 ++
 xen/arch/arm/include/asm/config.h          |  4 ++++
 xen/arch/arm/include/asm/string.h          |  2 +-
 xen/include/public/arch-arm.h              |  4 +++-
 xen/include/public/arch-x86/hvm/save.h     |  1 +
 xen/include/public/arch-x86/xen-x86_32.h   |  5 ++++-
 xen/include/public/arch-x86/xen-x86_64.h   |  3 +++
 xen/include/public/arch-x86/xen.h          |  3 ++-
 xen/include/public/errno.h                 |  2 +-
 xen/include/public/memory.h                |  2 +-
 xen/include/xen/compiler.h                 |  1 +
 xen/include/xen/init.h                     |  7 ++++---
 xen/include/xen/kconfig.h                  |  1 +
 xen/include/xen/types.h                    |  1 +
 xen/include/xen/xmalloc.h                  |  6 ++++++
 19 files changed, 60 insertions(+), 11 deletions(-)

-- 
2.17.1


