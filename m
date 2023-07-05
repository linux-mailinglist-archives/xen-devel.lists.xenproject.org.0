Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 669E47487FA
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:27:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559310.874247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Pb-0002yw-4K; Wed, 05 Jul 2023 15:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559310.874247; Wed, 05 Jul 2023 15:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Pa-0002p2-Sn; Wed, 05 Jul 2023 15:27:22 +0000
Received: by outflank-mailman (input) for mailman id 559310;
 Wed, 05 Jul 2023 15:27:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yX3c=CX=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qH4PY-0001UO-U5
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:27:20 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e568660-1b48-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 17:27:19 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.163.248.64])
 by support.bugseng.com (Postfix) with ESMTPSA id F1CB24EE0C91;
 Wed,  5 Jul 2023 17:27:18 +0200 (CEST)
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
X-Inumbo-ID: 6e568660-1b48-11ee-b237-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v2 06/13] xen/efi: fix violations of MISRA C:2012 Rule 7.2
Date: Wed,  5 Jul 2023 17:26:28 +0200
Message-Id: <9a791b84be74d7ca575eb94e070aae7294d95bbf.1688559115.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688559115.git.gianluca.luparini@bugseng.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type and also to other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
---
Changes in v2:
- minor change to commit title
- change commit message
- remove changes in 'efibind.h', 'efiapi.h', 'efidef.h' and 'efiprot.h'
---
 xen/common/efi/boot.c    | 8 ++++----
 xen/common/efi/runtime.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index c5850c26af..28a57fe434 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -34,13 +34,13 @@
 #define EFI_REVISION(major, minor) (((major) << 16) | (minor))
 
 #define SMBIOS3_TABLE_GUID \
-  { 0xf2fd1544, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
+  { 0xf2fd1544U, 0x9794U, 0x4a2cU, {0x99U, 0x2eU, 0xe5U, 0xbbU, 0xcfU, 0x20U, 0xe3U, 0x94U} }
 #define SHIM_LOCK_PROTOCOL_GUID \
-  { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
+  { 0x605dab50U, 0xe046U, 0x4300U, {0xabU, 0xb6U, 0x3dU, 0xd8U, 0x10U, 0xddU, 0x8bU, 0x23U} }
 #define APPLE_PROPERTIES_PROTOCOL_GUID \
-  { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
+  { 0x91bd12feU, 0xf6c3U, 0x44fbU, { 0xa5U, 0xb7U, 0x51U, 0x22U, 0xabU, 0x30U, 0x3aU, 0xe0U} }
 #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
-  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }
+  { 0xb122a263U, 0x3661U, 0x4f68U, {0x99U, 0x29U, 0x78U, 0xf8U, 0xb0U, 0xd6U, 0x21U, 0x80U} }
 #define EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION 1
 
 typedef struct {
diff --git a/xen/common/efi/runtime.c b/xen/common/efi/runtime.c
index 13b0975866..5cb7504c96 100644
--- a/xen/common/efi/runtime.c
+++ b/xen/common/efi/runtime.c
@@ -698,7 +698,7 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *op)
 #ifndef COMPAT
     op->status = status;
 #else
-    op->status = (status & 0x3fffffff) | ((status >> 32) & 0xc0000000);
+    op->status = (status & 0x3fffffffU) | ((status >> 32) & 0xc0000000U);
 #endif
 
     return rc;
-- 
2.41.0


