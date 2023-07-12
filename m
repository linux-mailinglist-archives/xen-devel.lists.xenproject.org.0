Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DF07504D2
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:37:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562258.878916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXDo-0004Lz-A3; Wed, 12 Jul 2023 10:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562258.878916; Wed, 12 Jul 2023 10:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXDo-0004Bl-2Z; Wed, 12 Jul 2023 10:37:24 +0000
Received: by outflank-mailman (input) for mailman id 562258;
 Wed, 12 Jul 2023 10:37:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0TT=C6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qJXAc-00061z-BS
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:34:06 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9edd3c6f-209f-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 12:34:03 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.161.151.90])
 by support.bugseng.com (Postfix) with ESMTPSA id F15154EE0C8F;
 Wed, 12 Jul 2023 12:34:01 +0200 (CEST)
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
X-Inumbo-ID: 9edd3c6f-209f-11ee-8611-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v3 14/15] ACPI/APEI: fix violations of MISRA C:2012 Rule 7.2
Date: Wed, 12 Jul 2023 12:32:15 +0200
Message-Id: <9fa7f3b467b7efbe1c9f80269c4af942fbebea8d.1689152719.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689152719.git.gianluca.luparini@bugseng.com>
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type.

For the sake of uniformity, the following changes are made:
- add the 'U' suffix to all first macro's arguments in 'cper.h'

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
Changes in v3:
- create this commit for 'cper.h'
---
 xen/include/xen/cper.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/include/xen/cper.h b/xen/include/xen/cper.h
index f8e5272bc1..7c6a4c45ce 100644
--- a/xen/include/xen/cper.h
+++ b/xen/include/xen/cper.h
@@ -56,7 +56,7 @@ static inline uint64_t cper_next_record_id(void)
 #define CPER_SIG_RECORD				"CPER"
 #define CPER_SIG_SIZE				4
 /* Used in signature_end field in struct cper_record_header */
-#define CPER_SIG_END				0xffffffff
+#define CPER_SIG_END				0xffffffffU
 
 /*
  * CPER record header revision, used in revision field in struct
@@ -80,35 +80,35 @@ static inline uint64_t cper_next_record_id(void)
  * Corrected Machine Check
  */
 #define CPER_NOTIFY_CMC							\
-	UUID_LE(0x2DCE8BB1, 0xBDD7, 0x450e, 0xB9, 0xAD, 0x9C, 0xF4,	\
+	UUID_LE(0x2DCE8BB1U, 0xBDD7, 0x450e, 0xB9, 0xAD, 0x9C, 0xF4,	\
 		0xEB, 0xD4, 0xF8, 0x90)
 /* Corrected Platform Error */
 #define CPER_NOTIFY_CPE							\
-	UUID_LE(0x4E292F96, 0xD843, 0x4a55, 0xA8, 0xC2, 0xD4, 0x81,	\
+	UUID_LE(0x4E292F96U, 0xD843, 0x4a55, 0xA8, 0xC2, 0xD4, 0x81,	\
 		0xF2, 0x7E, 0xBE, 0xEE)
 /* Machine Check Exception */
 #define CPER_NOTIFY_MCE							\
-	UUID_LE(0xE8F56FFE, 0x919C, 0x4cc5, 0xBA, 0x88, 0x65, 0xAB,	\
+	UUID_LE(0xE8F56FFEU, 0x919C, 0x4cc5, 0xBA, 0x88, 0x65, 0xAB,	\
 		0xE1, 0x49, 0x13, 0xBB)
 /* PCI Express Error */
 #define CPER_NOTIFY_PCIE						\
-	UUID_LE(0xCF93C01F, 0x1A16, 0x4dfc, 0xB8, 0xBC, 0x9C, 0x4D,	\
+	UUID_LE(0xCF93C01FU, 0x1A16, 0x4dfc, 0xB8, 0xBC, 0x9C, 0x4D,	\
 		0xAF, 0x67, 0xC1, 0x04)
 /* INIT Record (for IPF) */
 #define CPER_NOTIFY_INIT						\
-	UUID_LE(0xCC5263E8, 0x9308, 0x454a, 0x89, 0xD0, 0x34, 0x0B,	\
+	UUID_LE(0xCC5263E8U, 0x9308, 0x454a, 0x89, 0xD0, 0x34, 0x0B,	\
 		0xD3, 0x9B, 0xC9, 0x8E)
 /* Non-Maskable Interrupt */
 #define CPER_NOTIFY_NMI							\
-	UUID_LE(0x5BAD89FF, 0xB7E6, 0x42c9, 0x81, 0x4A, 0xCF, 0x24,	\
+	UUID_LE(0x5BAD89FFU, 0xB7E6, 0x42c9, 0x81, 0x4A, 0xCF, 0x24,	\
 		0x85, 0xD6, 0xE9, 0x8A)
 /* BOOT Error Record */
 #define CPER_NOTIFY_BOOT						\
-	UUID_LE(0x3D61A466, 0xAB40, 0x409a, 0xA6, 0x98, 0xF3, 0x62,	\
+	UUID_LE(0x3D61A466U, 0xAB40, 0x409a, 0xA6, 0x98, 0xF3, 0x62,	\
 		0xD4, 0x64, 0xB3, 0x8F)
 /* DMA Remapping Error */
 #define CPER_NOTIFY_DMAR						\
-	UUID_LE(0x667DD791, 0xC6B3, 0x4c27, 0x8A, 0x6B, 0x0F, 0x8E,	\
+	UUID_LE(0x667DD791U, 0xC6B3, 0x4c27, 0x8A, 0x6B, 0x0F, 0x8E,	\
 		0x72, 0x2D, 0xEB, 0x41)
 
 /*
-- 
2.41.0


