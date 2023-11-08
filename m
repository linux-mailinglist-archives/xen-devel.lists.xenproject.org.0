Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59387E588B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 15:19:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629300.981403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0jOW-0005RH-0j; Wed, 08 Nov 2023 14:19:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629300.981403; Wed, 08 Nov 2023 14:18:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0jOV-0005Nw-T6; Wed, 08 Nov 2023 14:18:59 +0000
Received: by outflank-mailman (input) for mailman id 629300;
 Wed, 08 Nov 2023 14:18:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L2E1=GV=citrix.com=prvs=669c226bb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r0jOT-0005Nq-TW
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 14:18:57 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be959273-7e41-11ee-9b0e-b553b5be7939;
 Wed, 08 Nov 2023 15:18:54 +0100 (CET)
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
X-Inumbo-ID: be959273-7e41-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1699453134;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Na13PhDqfcELQNczwDPttncEtkyuwh/vIZZDr1gyTSk=;
  b=ZFzwDo3CUtBFWur8oFFK+U+pTw9Xw7I/f0jh8Epa8qT7EZ3vdBTgtgLW
   r++W9eVR+QxqXmqDkeOR9FBvNjONJ95NjGa1Sz7p0M8uXwb4zonTZqtuC
   QjJQncFI3lO353cecHmDM5HtnISXmBeJzjzd7knXYs/J7Zy3vroUb0+s8
   M=;
X-CSE-ConnectionGUID: ucjRHIKqRvqWExcWeSvfDg==
X-CSE-MsgGUID: YHq6jfp2TaOC0nzCAz1Kjg==
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128350426
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:xzzHLamjOPv77/C+v8S0HA/o5gwQJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJDTyHOP+JZzDxKdtzPdu1ox8GucXUzIRmSgBpq3w0RCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+e6UKicfHkpGWeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K+aVA8w5ARkPqkS5A+GzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eETKgotTzOavfyv/5+rQdZhvdotAMa+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dMlsQYj/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xxzI/
 T+eoz6nav0cHO2/0GSH/Gr2uubotnv9Sqk7BuSb9PE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JVEuY64QXLzbDG7gKxD20ICDVGbbQOusI6SCYr3
 VjPhN7zDDJutry9Q2+S7bqSonW5Pi19BWkDbigARE0b7sX5oYcyphjSQc1uFqHzhdrwcRnqx
 DqHtjQ5wb8agsgCzayT903ImD+qqd7CSQtdzh7MQmuv4wd9ZYikT4+l817W6bBHNonxZl2ct
 3FClcGY5+0KCYylnTaIBu4KGdmBx/uDKiyavldpELEo7THr8HmmFb28+xkneh0vaJxdP2a0M
 QmM4Wu9+aO/IlO3Zq1NQ6OSEv401JfNBd/aW8vKYPZBN80ZmBC8wM1+WaKB9zmzwRlwyPxnZ
 cbzndWEVyhAVfo9pNaib6JNieV1m3pWKXb7HMijl3yaPayiiGl5oFvvGHCJdOk9pJicugTT/
 M032yCikE4HD7SWjsU66+cuwbE2wZsTX8ueRzR/LLLrH+afMDhJ5wXt6b0gYZd5uK9ei/3F+
 HqwMmcBlguu3i2dcVXVNyo8AF8KYXqYhStkVRHAwH7xhiN9CWpRxPx3m2QLkUkPq7U4kK8co
 wgtcMScGPVfIgkrCBxEBaQRWLdKLUzx7SrXZnrNXdTKV8I4L+A/0oO+L1SHGehnJnbfiPbSV
 JX5jFyCH8NdGFk5ZCsUAdr2p26MUbEmsLoadyP1zhN7IS0ALKACx/TNs8IK
IronPort-HdrOrdr: A9a23:xW2Zwa6IKFxOgzBHEgPXwMbXdLJyesId70hD6qkRc3Bom6mj/P
 xG88516faZslgssRMb+exoSZPgfZq0z/cci+Qs1NyZLWrbUQWTXeRfxLqn7zr8GzDvss5xvJ
 0QF5SW0eeAb2RHsQ==
X-Talos-CUID: 9a23:0RPPu23ducqLYvSWTttOFLxfB8snSF38727qPVaHJHZid7CuV1G89/Yx
X-Talos-MUID: =?us-ascii?q?9a23=3AvEpfcQyiFmBiOGnP5bg+RdC5itWaqJWOER4Pn41?=
 =?us-ascii?q?ch8CjHnR2KRy0nm2UQIByfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.03,286,1694750400"; 
   d="scan'208";a="128350426"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Luca Fancellu <luca.fancellu@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Roberto Bagnara <roberto.bagnara@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH for-4.18] docs/misra: Add missing SPDX tags
Date: Wed, 8 Nov 2023 14:18:47 +0000
Message-ID: <20231108141847.47697-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Two files are missing SDPX tags, but are covered by the blanketing license
statement in docs/README.sources saying that RST files are CC-BY-4.0

Fixes: 3c911be55f1c ("docs/misra: document the C dialect and translation toolchain assumptions.")
Fixes: 7211904e09bd ("docs/misra: add documentation skeleton for MISRA C:2012 Dir 4.1")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Luca Fancellu <luca.fancellu@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Henry Wang <Henry.Wang@arm.com>

CC Henry as this does ideally want backporting to 4.18

To everyone else, please remember SPDX tags on new files.
---
 docs/misra/C-language-toolchain.rst | 2 ++
 docs/misra/C-runtime-failures.rst   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index 4c4942a11321..2866cb191b1a 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
 =============================================
 C Dialect and Translation Assumptions for Xen
 =============================================
diff --git a/docs/misra/C-runtime-failures.rst b/docs/misra/C-runtime-failures.rst
index 77e04a2562b8..1052b2afca13 100644
--- a/docs/misra/C-runtime-failures.rst
+++ b/docs/misra/C-runtime-failures.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
 ===================================================================
 Measures taken towards the minimization of Run-time failures in Xen
 ===================================================================

base-commit: bede1c7e3b790b63f1ff3ea3ee4e476b012fdf2c
-- 
2.30.2


