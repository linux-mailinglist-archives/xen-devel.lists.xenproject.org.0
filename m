Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 867A061F11D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:48:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439284.693322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzfT-0002ID-Oo; Mon, 07 Nov 2022 10:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439284.693322; Mon, 07 Nov 2022 10:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzfT-0002FX-LH; Mon, 07 Nov 2022 10:47:51 +0000
Received: by outflank-mailman (input) for mailman id 439284;
 Mon, 07 Nov 2022 10:47:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=or3T=3H=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1orzfS-0002FR-QH
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:47:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9e9af3d0-5e89-11ed-91b5-6bf2151ebd3b;
 Mon, 07 Nov 2022 11:47:49 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 114051FB;
 Mon,  7 Nov 2022 02:47:54 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE5773F73D;
 Mon,  7 Nov 2022 02:47:46 -0800 (PST)
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
X-Inumbo-ID: 9e9af3d0-5e89-11ed-91b5-6bf2151ebd3b
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
Subject: [RFC PATCH 0/4] Static analyser finding deviation
Date: Mon,  7 Nov 2022 10:47:35 +0000
Message-Id: <20221107104739.10404-1-luca.fancellu@arm.com>
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

The third patch is a fix for a tool used for cppcheck and the fourth patch
is an example of how a deviation can be applied for some MISRA findings.

Luca Fancellu (4):
  xen/Makefile: add analysis-coverity and analysis-eclair
  xen/Makefile: add analysis-cppcheck and analysis-cppcheck-html
  tools/misra: fix skipped rule numbers
  xen: Justify linker script defined symbols in include/xen/kernel.h

 .gitignore                                  |  10 +-
 docs/misra/cppcheck.txt                     |  47 +++--
 docs/misra/documenting-violations.rst       | 173 +++++++++++++++
 docs/misra/false-positive-coverity.json     |  12 ++
 docs/misra/false-positive-cppcheck.json     |  12 ++
 docs/misra/false-positive-eclair.json       |  12 ++
 docs/misra/safe.json                        |  20 ++
 xen/Makefile                                | 181 +++++++++++-----
 xen/include/hypercall-defs.c                |   9 +
 xen/include/xen/kernel.h                    |   4 +
 xen/tools/convert_misra_doc.py              |  32 ++-
 xen/tools/cppcheck-build-suppr-list.sh      |  81 +++++++
 xen/tools/cppcheck-cc.sh                    | 223 ++++++++++++++++++++
 xen/tools/cppcheck-html-prepare.sh          | 110 ++++++++++
 xen/tools/cppcheck-plat/arm32-wchar_t4.xml  |  17 ++
 xen/tools/cppcheck-plat/arm64-wchar_t2.xml  |  17 ++
 xen/tools/cppcheck-plat/arm64-wchar_t4.xml  |  17 ++
 xen/tools/cppcheck-plat/x86_64-wchar_t2.xml |  17 ++
 xen/tools/cppcheck-plat/x86_64-wchar_t4.xml |  17 ++
 xen/tools/cppcheck-txt-prepare.sh           |  74 +++++++
 xen/tools/xenfusa-gen-tags.py               |  81 +++++++
 21 files changed, 1089 insertions(+), 77 deletions(-)
 create mode 100644 docs/misra/documenting-violations.rst
 create mode 100644 docs/misra/false-positive-coverity.json
 create mode 100644 docs/misra/false-positive-cppcheck.json
 create mode 100644 docs/misra/false-positive-eclair.json
 create mode 100644 docs/misra/safe.json
 create mode 100755 xen/tools/cppcheck-build-suppr-list.sh
 create mode 100755 xen/tools/cppcheck-cc.sh
 create mode 100755 xen/tools/cppcheck-html-prepare.sh
 create mode 100644 xen/tools/cppcheck-plat/arm32-wchar_t4.xml
 create mode 100644 xen/tools/cppcheck-plat/arm64-wchar_t2.xml
 create mode 100644 xen/tools/cppcheck-plat/arm64-wchar_t4.xml
 create mode 100644 xen/tools/cppcheck-plat/x86_64-wchar_t2.xml
 create mode 100644 xen/tools/cppcheck-plat/x86_64-wchar_t4.xml
 create mode 100755 xen/tools/cppcheck-txt-prepare.sh
 create mode 100755 xen/tools/xenfusa-gen-tags.py

-- 
2.17.1


