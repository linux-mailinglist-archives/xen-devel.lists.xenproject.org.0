Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C7E7DCDBA
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 14:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625719.975327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiO-0005Rt-DX; Tue, 31 Oct 2023 13:23:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625719.975327; Tue, 31 Oct 2023 13:23:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxoiO-0005Nf-7P; Tue, 31 Oct 2023 13:23:28 +0000
Received: by outflank-mailman (input) for mailman id 625719;
 Tue, 31 Oct 2023 13:23:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1/u=GN=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qxoiM-0003uy-5o
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 13:23:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ab9b930d-77f0-11ee-98d6-6d05b1d4d9a1;
 Tue, 31 Oct 2023 14:23:25 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7958A139F;
 Tue, 31 Oct 2023 06:24:06 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF1343F738;
 Tue, 31 Oct 2023 06:23:23 -0700 (PDT)
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
X-Inumbo-ID: ab9b930d-77f0-11ee-98d6-6d05b1d4d9a1
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC PATCH v2 6/8] [WIP]x86/exclude-list: protect mm_type_tbl in mtrr from being formatted
Date: Tue, 31 Oct 2023 13:23:02 +0000
Message-Id: <20231031132304.2573924-7-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031132304.2573924-1-luca.fancellu@arm.com>
References: <20231031132304.2573924-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The array mm_type_tbl initialization is formatted in a way that
the formatting tool can't keep, so disable the formatting on that
array initialization.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/misra/exclude-list.json | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-list.json
index d48dcf3ac971..b8976bc671a4 100644
--- a/docs/misra/exclude-list.json
+++ b/docs/misra/exclude-list.json
@@ -99,6 +99,19 @@
             "rel_path": "arch/x86/cpu/mwait-idle.c",
             "comment": "Imported from Linux, ignore for now"
         },
+        {
+            "rel_path": "arch/x86/hvm/mtrr.c",
+            "comment": "Contains structure formatted in a particular way",
+            "checkers": "codestyle",
+            "codestyle": {
+                "protect": [
+                    {
+                        "syntax_opening": "static const uint8_t mm_type_tbl",
+                        "syntax_closing": "};"
+                    }
+                ]
+            }
+        },
         {
             "rel_path": "arch/x86/include/asm/alternative-asm.h",
             "comment": "Includes mostly assembly macro and it's meant to be included only in assembly code",
-- 
2.34.1


