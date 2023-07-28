Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99630766692
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 10:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571375.895075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPIZy-00055R-0g; Fri, 28 Jul 2023 08:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571375.895075; Fri, 28 Jul 2023 08:12:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPIZx-00050C-Qx; Fri, 28 Jul 2023 08:12:05 +0000
Received: by outflank-mailman (input) for mailman id 571375;
 Fri, 28 Jul 2023 08:12:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B1pf=DO=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qPIZw-0004AY-1R
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 08:12:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6f271b89-2d1e-11ee-b24d-6b7b168915f2;
 Fri, 28 Jul 2023 10:12:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F36AF2F4;
 Fri, 28 Jul 2023 01:12:45 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4D073F67D;
 Fri, 28 Jul 2023 01:12:01 -0700 (PDT)
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
X-Inumbo-ID: 6f271b89-2d1e-11ee-b24d-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH 4/5] x86/HVM: protect mm_type_tbl format from clang-format
Date: Fri, 28 Jul 2023 09:11:43 +0100
Message-Id: <20230728081144.4124309-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230728081144.4124309-1-luca.fancellu@arm.com>
References: <20230728081144.4124309-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The array mm_type_tbl initialization is formatted in a way that
clang-format can't keep, so disable clang-format on that array
initialization.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/x86/hvm/mtrr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 29f3fb160776..f32ce3162ae2 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -18,6 +18,7 @@
 /* Get page attribute fields (PAn) from PAT MSR. */
 #define pat_cr_2_paf(pat_cr,n)  ((((uint64_t)pat_cr) >> ((n)<<3)) & 0xff)
 
+/* clang-format off */
 /* Effective mm type lookup table, according to MTRR and PAT. */
 static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][X86_NUM_MT] = {
 #define RS MEMORY_NUM_TYPES
@@ -43,6 +44,7 @@ static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][X86_NUM_MT] = {
 #undef WB
 #undef RS
 };
+/* clang-format on */
 
 /*
  * Reverse lookup table, to find a pat type according to MTRR and effective
-- 
2.34.1


