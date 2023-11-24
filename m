Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B18E7F78F7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 17:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640825.999578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4H-0002Ak-5H; Fri, 24 Nov 2023 16:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640825.999578; Fri, 24 Nov 2023 16:30:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4H-00024o-0y; Fri, 24 Nov 2023 16:30:13 +0000
Received: by outflank-mailman (input) for mailman id 640825;
 Fri, 24 Nov 2023 16:30:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB6C=HF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6Z4F-0000du-3X
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 16:30:11 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb561178-8ae6-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 17:30:08 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 003AA4EE0C8F;
 Fri, 24 Nov 2023 17:30:07 +0100 (CET)
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
X-Inumbo-ID: bb561178-8ae6-11ee-9b0e-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	maria.celeste.cesario@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 4/5] x86/atomic: address violations of MISRA C:2012 Rule 11.8
Date: Fri, 24 Nov 2023 17:29:18 +0100
Message-Id: <0224699e85baac395e47a1d5d89972d9d0284e85.1700842832.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
References: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Edit casts that unnecessarily remove const qualifiers
to comply with Rule 11.8.
The type of the provided pointer may be const qualified.
No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/arch/x86/include/asm/atomic.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/atomic.h b/xen/arch/x86/include/asm/atomic.h
index 27aad43aaa..16bd0ebfd7 100644
--- a/xen/arch/x86/include/asm/atomic.h
+++ b/xen/arch/x86/include/asm/atomic.h
@@ -51,10 +51,10 @@ void __bad_atomic_size(void);
     unsigned long x_;                                     \
     CLANG_DISABLE_WARN_GCC_COMPAT_START                   \
     switch ( sizeof(*(p)) ) {                             \
-    case 1: x_ = read_u8_atomic((uint8_t *)(p)); break;   \
-    case 2: x_ = read_u16_atomic((uint16_t *)(p)); break; \
-    case 4: x_ = read_u32_atomic((uint32_t *)(p)); break; \
-    case 8: x_ = read_u64_atomic((uint64_t *)(p)); break; \
+    case 1: x_ = read_u8_atomic((const uint8_t *)(p)); break;   \
+    case 2: x_ = read_u16_atomic((const uint16_t *)(p)); break; \
+    case 4: x_ = read_u32_atomic((const uint32_t *)(p)); break; \
+    case 8: x_ = read_u64_atomic((const uint64_t *)(p)); break; \
     default: x_ = 0; __bad_atomic_size(); break;          \
     }                                                     \
     CLANG_DISABLE_WARN_GCC_COMPAT_END                     \
-- 
2.40.0


