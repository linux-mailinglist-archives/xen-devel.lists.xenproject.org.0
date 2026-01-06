Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31706CF9D85
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 18:51:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196382.1514213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdBCd-0005v2-Gc; Tue, 06 Jan 2026 17:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196382.1514213; Tue, 06 Jan 2026 17:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdBCd-0005sN-Dp; Tue, 06 Jan 2026 17:50:43 +0000
Received: by outflank-mailman (input) for mailman id 1196382;
 Tue, 06 Jan 2026 17:50:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vlIc=7L=gmail.com=nicola.vetrini@bugseng.com>)
 id 1vdBCc-0005sH-2Q
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 17:50:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 369b17ee-eb28-11f0-b15e-2bf370ae4941;
 Tue, 06 Jan 2026 18:50:40 +0100 (CET)
Received: from nico-ideapad (unknown [46.228.253.214])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 5A9D54EE3C04;
 Tue,  6 Jan 2026 18:50:36 +0100 (CET)
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
X-Inumbo-ID: 369b17ee-eb28-11f0-b15e-2bf370ae4941
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1767721838;
	b=G3abZtpGtXqYpXFEv3mZ6ALAZkKkeAFTlVjn5qS9o6xJSSgM4qchSuCMtQPTek4LVcMW
	 p0lwZ4rOblVJX1E22edYLsmNY/YebYUq5A7Nk04SK2plR+Fq01Xbcw1/Lqt2Zc8eOEBSq
	 Iv3jUkMypnmljB5uoZpfkkzcn5flBwEs70FET4yGKmxUnf6LbDtYdZAfYxf772vAeUKtE
	 jmeSM+OuXrO7uFgSwSLxFoqieE5OxTPxNp7v4S7RLU0jNiunlZEd9Hn2zhaRKSe1UeDsY
	 Ck7kuK6qVlAbakNwaCCGb2MGLCaUa85kJGzeVfM6rZbV2Wyo7y699nvfXZY/CSxgPQEVP
	 Ql/OcKrozmmDPYfu7MH+NBI26kPL31Ibpd/e07bKPpUlBKsyF+R3yMcRty3sA91ABC1HL
	 EVhBzeqsCWe411SK623lFoX0wwufibG9ypTBKthL+7E7ROjR1i1dXP7mR6foLb3zP8TVs
	 wJwLgmgX0DeBgJZ9b8rWTwPYobWmrM7guh7VkTam3aGeZNfH2bd/BWb72q54JXZ0wGwKD
	 ZN9Pl48SCyatYjh0gQGr1DGIrfLt1E5EScjXurvBLWkKbESS67wuTv2bBYbJ0vAItDJ2r
	 bbK+/RiJ9I2cR4DLt0KaHSTVS/ZmlM1Ll8VnAm222yMx7K/dcvlmCGPzJylCVRY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1767721838;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=T4UUPg4ziycQ2CZJTxKm9+cjlQl10naOxSR1r3Y4jNM=;
	b=2C8y3b1P1mIWd7u4YOzXQ/6bF8R5I43+0MYx6fiBlljJC144lZlqVXOF+mjwZ8RLLXP4
	 MfBE9OGlUKQDqTI7+NI/dBIWAOhLvURWpvpKUgSyKa7Qqgxm0kAn6UX4LQ1o+D8zTQ2ua
	 scEn8E4wcS8/+sOMWRxim/x9Fnh8wWF/RumDHwOcS/2zfUoUlvHaAXjbp0AVhOt/hwpft
	 enPKEopnUgQ6R2xiBC62LWtqcqriXAEGdXPmKm6QpN0bVtl1fhvqss9zaBT6VCCX5zB9R
	 b8gMJYqMiiCzeUB8Q4cOXIqfjEvsGfVxTmmUdIzBGfJczIC0m8fVzfPFEHaFW2hD45zdA
	 ivwuWjJduGBJ6TwSpwoM1Atqi2aO8d5GKF36Kum3WyeT/EncqMcutcx2wA89Fw+9RdUf/
	 LPMcN+Jf475FPVJkFAVtJbNRrgYmK1gdGkVm9e8q5kGIdD1EV1akf9TdNEayvv5D0vCaw
	 VoEXu440HhgPc5znmAlBs3QEJlYxKPEd0dZFXSdsycRV7VM2cYRKikzLgpQuFG+D4on27
	 ezzN0boWnlH+/zxcglSs4CJj1iz9ufkuSkQqzHf9X7/jcbHKNKkbyFeSVsKGCrSJbJAWG
	 u9cMHlIaEwu01SDiJqJrSDCrJDbFRsEjjWIafk8ZnS9dC7Jj/FUW676q9cQG1z8=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
From: Nicola Vetrini <nicola.vetrini@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] misra: allow using binary literals in c99 as an extension.
Date: Tue,  6 Jan 2026 18:50:08 +0100
Message-ID: <30bb474fbb0e9236728fad9515bca4d160d594b3.1767721635.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

There is consensus towards using more binary literals in Xen,
so they are enabled both for X86_64 and ARM64.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/toolchain.ecl | 5 +++++
 docs/misra/C-language-toolchain.rst             | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl b/automation/eclair_analysis/ECLAIR/toolchain.ecl
index 4bc88aa029..da00c2198a 100644
--- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
+++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
@@ -332,3 +332,8 @@ ext_sizeof_alignof_void_type"
 -doc_begin="See Section \"4.13 Preprocessing Directives\" of "GCC_MANUAL" and Section \"11.1 Implementation-defined behavior\" of "CPP_MANUAL"."
 -config=STD.inclexpd,behavior={c99, GCC_X86_64, "specified"}
 -doc_end
+
+-doc_begin="See Section \"6.65 Binary Constants using the '0b' Prefix\" of "GCC_MANUAL"."
+-config=STD.ltrlbin,behavior={c99, GCC_ARM64, "specified"}
+-config=STD.ltrlbin,behavior={c99, GCC_X86_64, "specified"}
+-doc_end
diff --git a/docs/misra/C-language-toolchain.rst b/docs/misra/C-language-toolchain.rst
index ec0c9953be..5d418e262a 100644
--- a/docs/misra/C-language-toolchain.rst
+++ b/docs/misra/C-language-toolchain.rst
@@ -218,6 +218,10 @@ The table columns are as follows:
      - All architectures
      - See Section "6.3 Labels as Values" of GCC_MANUAL.
 
+   * - Binary constants
+     - ARM64, X86_64
+     - See Section "6.65 Binary Constants using the '0b' Prefix"
+
 Translation Limits
 __________________
 
-- 
2.52.0


