Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119F3C8F5A5
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 16:53:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174075.1499054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIf-00045n-0r; Thu, 27 Nov 2025 15:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174075.1499054; Thu, 27 Nov 2025 15:52:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIe-000447-UO; Thu, 27 Nov 2025 15:52:52 +0000
Received: by outflank-mailman (input) for mailman id 1174075;
 Thu, 27 Nov 2025 15:52:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gQU=6D=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vOeId-0003dB-BF
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:52:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2087d7e9-cba9-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 16:52:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AB71176A;
 Thu, 27 Nov 2025 07:52:42 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A1173F73B;
 Thu, 27 Nov 2025 07:52:48 -0800 (PST)
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
X-Inumbo-ID: 2087d7e9-cba9-11f0-9d18-b5c5bf9af7f9
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 01/10] xen/arm: ffa: add FF-A v1.2 function IDs
Date: Thu, 27 Nov 2025 16:51:32 +0100
Message-ID: <2264daf90cbb25b9a60ebe8edbebb8988d95966b.1764254975.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764254975.git.bertrand.marquis@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bring the FF-A headers up to the v1.2 baseline and fix the function-number
range used for ABI discovery:

- update FFA_FNUM_MAX_VALUE so the FF-A function-number window covers the
  full v1.2 range, and derive the ABI bitmap bounds from
  FFA_FNUM_MIN_VALUE/FFA_FNUM_MAX_VALUE instead of hard-coding
  FFA_ERROR/FFA_MSG_SEND2
- define the new v1.2 function IDs; CONSOLE_LOG and
  PARTITION_INFO_GET_REGS are added for ABI discovery even though they are
  not implemented yet
- extend the firmware ABI table to probe RUN and
  MSG_SEND_DIRECT_REQ2/RESP2
- while there, fix an off-by-one in ffa_fw_supports_fid(): the computed bit
  index must be strictly smaller than FFA_ABI_BITMAP_SIZE, so use >= in the
  bounds check

Keep FFA_MY_VERSION at 1.1 for now; we only advertise v1.2 once the
implementation is fully compliant.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/include/asm/tee/ffa.h |  2 +-
 xen/arch/arm/tee/ffa.c             |  4 ++++
 xen/arch/arm/tee/ffa_private.h     | 18 +++++++++++-------
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/tee/ffa.h b/xen/arch/arm/include/asm/tee/ffa.h
index 24cd4d99c8f9..c587f76e63ca 100644
--- a/xen/arch/arm/include/asm/tee/ffa.h
+++ b/xen/arch/arm/include/asm/tee/ffa.h
@@ -16,7 +16,7 @@
 #include <asm/types.h>
 
 #define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
-#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
+#define FFA_FNUM_MAX_VALUE              _AC(0x8F,U)
 
 static inline bool is_ffa_fid(uint32_t fid)
 {
diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 1d0239cf6950..2b4e24750d52 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -11,6 +11,8 @@
  *               https://developer.arm.com/documentation/den0077/a
  * FF-A-1.1-REL0: FF-A specification version 1.1 available at
  *                https://developer.arm.com/documentation/den0077/e
+ * FF-A-1.2-REL0: FF-A specification version 1.2 available at
+ *                https://developer.arm.com/documentation/den0077/j
  * TEEC-1.0C: TEE Client API Specification version 1.0c available at
  *            https://globalplatform.org/specs-library/tee-client-api-specification/
  *
@@ -102,6 +104,8 @@ static const struct ffa_fw_abi ffa_fw_abi_needed[] = {
     FW_ABI(FFA_MSG_SEND_DIRECT_REQ_32),
     FW_ABI(FFA_MSG_SEND_DIRECT_REQ_64),
     FW_ABI(FFA_MSG_SEND2),
+    FW_ABI(FFA_MSG_SEND_DIRECT_REQ2),
+    FW_ABI(FFA_RUN),
 };
 
 /*
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 6dbdb200d840..d7e6b6f5ef45 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -15,6 +15,7 @@
 #include <xen/spinlock.h>
 #include <xen/time.h>
 #include <xen/types.h>
+#include <asm/tee/ffa.h>
 
 /* Error codes */
 #define FFA_RET_OK                      0
@@ -42,6 +43,7 @@
 
 #define FFA_VERSION_1_0         MAKE_FFA_VERSION(1, 0)
 #define FFA_VERSION_1_1         MAKE_FFA_VERSION(1, 1)
+#define FFA_VERSION_1_2         MAKE_FFA_VERSION(1, 2)
 /* The minimal FF-A version of the SPMC that can be supported */
 #define FFA_MIN_SPMC_VERSION    FFA_VERSION_1_1
 
@@ -270,6 +272,10 @@
 #define FFA_RX_ACQUIRE                  0x84000084U
 #define FFA_SPM_ID_GET                  0x84000085U
 #define FFA_MSG_SEND2                   0x84000086U
+#define FFA_CONSOLE_LOG                 0x8400008AU
+#define FFA_PARTITION_INFO_GET_REGS     0x8400008BU
+#define FFA_MSG_SEND_DIRECT_REQ2        0xC400008DU
+#define FFA_MSG_SEND_DIRECT_RESP2       0xC400008EU
 
 /**
  * Encoding of features supported or not by the fw in a bitmap:
@@ -280,11 +286,9 @@
 #define FFA_ABI_ID(id)        ((id) & ARM_SMCCC_FUNC_MASK)
 #define FFA_ABI_CONV(id)      (((id) >> ARM_SMCCC_CONV_SHIFT) & BIT(0,U))
 
-#define FFA_ABI_MIN           FFA_ABI_ID(FFA_ERROR)
-#define FFA_ABI_MAX           FFA_ABI_ID(FFA_MSG_SEND2)
-
-#define FFA_ABI_BITMAP_SIZE   (2 * (FFA_ABI_MAX - FFA_ABI_MIN + 1))
-#define FFA_ABI_BITNUM(id)    ((FFA_ABI_ID(id) - FFA_ABI_MIN) << 1 | \
+#define FFA_ABI_BITMAP_SIZE   (2 * (FFA_FNUM_MAX_VALUE - FFA_FNUM_MIN_VALUE \
+                               + 1))
+#define FFA_ABI_BITNUM(id)    ((FFA_ABI_ID(id) - FFA_FNUM_MIN_VALUE) << 1 | \
                                FFA_ABI_CONV(id))
 
 /* Constituent memory region descriptor */
@@ -549,9 +553,9 @@ static inline int32_t ffa_hyp_rx_release(void)
 
 static inline bool ffa_fw_supports_fid(uint32_t fid)
 {
-    BUILD_BUG_ON(FFA_ABI_MIN > FFA_ABI_MAX);
+    BUILD_BUG_ON(FFA_FNUM_MIN_VALUE > FFA_FNUM_MAX_VALUE);
 
-    if ( FFA_ABI_BITNUM(fid) > FFA_ABI_BITMAP_SIZE)
+    if ( FFA_ABI_BITNUM(fid) >= FFA_ABI_BITMAP_SIZE)
         return false;
     return test_bit(FFA_ABI_BITNUM(fid), ffa_fw_abi_supported);
 }
-- 
2.51.2


