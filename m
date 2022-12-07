Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD35645A6A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 14:07:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456298.714061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2u8r-0004Em-MB; Wed, 07 Dec 2022 13:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456298.714061; Wed, 07 Dec 2022 13:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2u8r-0004Ce-JU; Wed, 07 Dec 2022 13:07:17 +0000
Received: by outflank-mailman (input) for mailman id 456298;
 Wed, 07 Dec 2022 13:07:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xbZ5=4F=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1p2u8q-0004CY-6a
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 13:07:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 11131a73-7630-11ed-8fd2-01056ac49cbb;
 Wed, 07 Dec 2022 14:07:14 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBD2E23A;
 Wed,  7 Dec 2022 05:07:19 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7A4B3F73D;
 Wed,  7 Dec 2022 05:07:11 -0800 (PST)
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
X-Inumbo-ID: 11131a73-7630-11ed-8fd2-01056ac49cbb
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 0/5] Static analyser finding deviation
Date: Wed,  7 Dec 2022 13:06:59 +0000
Message-Id: <20221207130704.20573-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1

This serie introduces a way to suppress a static analyser finding providing a
proper justification for it.
The process is explained in the docs/misra/documenting-violations.rst document
that this serie will provide.
The tools currently supported are eclair, coverity and cppcheck, but the design
is open to support many other static analysis tool.

The changes are split between the first two patches to reduce the review effort,
the first patch is introducing the deviation process for the eclair and coverity
tools, this is because their analysis system is similar.

The second patch is introducing the same deviation process for cppcheck,
modifying the current way it is called from the makefile and improving its
analysis.

The third is reverting cppcheck in the makefile.

The fourth patch is a fix for a tool used for cppcheck and the fifth patch
is an example of how a deviation can be applied for some MISRA findings.

---
This serie was pushed as RFC and collected many feedbacks, thank you for the
review.
In this serie to analyse the codebase, a script is used instead of integrating
the process into the makefile.
---

Luca Fancellu (5):
  xen/scripts: add xen-analysis.py for coverity and eclair analysis
  xen/scripts: add cppcheck tool to the xen-analysis.py script
  xen/Makefile: remove Cppcheck invocation from the Makefile
  tools/misra: fix skipped rule numbers
  xen: Justify linker script defined symbols in include/xen/kernel.h

 .gitignore                                    |   9 +-
 docs/misra/cppcheck.txt                       |  27 +-
 docs/misra/documenting-violations.rst         | 212 ++++++++++++++
 docs/misra/false-positive-coverity.json       |  12 +
 docs/misra/false-positive-cppcheck.json       |  12 +
 docs/misra/false-positive-eclair.json         |  12 +
 docs/misra/safe.json                          |  20 ++
 docs/misra/xen-static-analysis.rst            |  90 ++++++
 xen/Makefile                                  | 116 +-------
 xen/include/hypercall-defs.c                  |   9 +
 xen/include/xen/kernel.h                      |   4 +
 xen/scripts/xen-analysis.py                   |  45 +++
 xen/scripts/xen_analysis/__init__.py          |   0
 xen/scripts/xen_analysis/cppcheck_analysis.py | 273 ++++++++++++++++++
 .../xen_analysis/cppcheck_report_utils.py     | 130 +++++++++
 xen/scripts/xen_analysis/generic_analysis.py  |  88 ++++++
 xen/scripts/xen_analysis/settings.py          | 169 +++++++++++
 xen/scripts/xen_analysis/tag_database.py      | 109 +++++++
 xen/scripts/xen_analysis/utils.py             |  56 ++++
 xen/tools/convert_misra_doc.py                |  32 +-
 xen/tools/cppcheck-cc.sh                      | 223 ++++++++++++++
 xen/tools/cppcheck-plat/arm32-wchar_t4.xml    |  17 ++
 xen/tools/cppcheck-plat/arm64-wchar_t2.xml    |  17 ++
 xen/tools/cppcheck-plat/x86_64-wchar_t2.xml   |  17 ++
 xen/tools/merge_cppcheck_reports.py           |  86 ------
 25 files changed, 1561 insertions(+), 224 deletions(-)
 create mode 100644 docs/misra/documenting-violations.rst
 create mode 100644 docs/misra/false-positive-coverity.json
 create mode 100644 docs/misra/false-positive-cppcheck.json
 create mode 100644 docs/misra/false-positive-eclair.json
 create mode 100644 docs/misra/safe.json
 create mode 100644 docs/misra/xen-static-analysis.rst
 create mode 100755 xen/scripts/xen-analysis.py
 create mode 100644 xen/scripts/xen_analysis/__init__.py
 create mode 100644 xen/scripts/xen_analysis/cppcheck_analysis.py
 create mode 100644 xen/scripts/xen_analysis/cppcheck_report_utils.py
 create mode 100644 xen/scripts/xen_analysis/generic_analysis.py
 create mode 100644 xen/scripts/xen_analysis/settings.py
 create mode 100644 xen/scripts/xen_analysis/tag_database.py
 create mode 100644 xen/scripts/xen_analysis/utils.py
 create mode 100755 xen/tools/cppcheck-cc.sh
 create mode 100644 xen/tools/cppcheck-plat/arm32-wchar_t4.xml
 create mode 100644 xen/tools/cppcheck-plat/arm64-wchar_t2.xml
 create mode 100644 xen/tools/cppcheck-plat/x86_64-wchar_t2.xml
 delete mode 100755 xen/tools/merge_cppcheck_reports.py

-- 
2.17.1


