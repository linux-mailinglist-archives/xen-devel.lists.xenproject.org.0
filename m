Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB364750485
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:34:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562205.878835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXAR-0007Dz-2S; Wed, 12 Jul 2023 10:33:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562205.878835; Wed, 12 Jul 2023 10:33:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXAQ-00079N-PT; Wed, 12 Jul 2023 10:33:54 +0000
Received: by outflank-mailman (input) for mailman id 562205;
 Wed, 12 Jul 2023 10:33:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0TT=C6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qJXAP-0006Dd-Mr
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:33:53 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98cb6af0-209f-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 12:33:53 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.161.151.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 16E794EE0C8F;
 Wed, 12 Jul 2023 12:33:52 +0200 (CEST)
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
X-Inumbo-ID: 98cb6af0-209f-11ee-b239-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Luca Fancellu <luca.fancellu@arm.com>
Subject: [XEN PATCH v3 06/15] xen/efi: fix violations of MISRA C:2012 Rule 7.2
Date: Wed, 12 Jul 2023 12:32:07 +0200
Message-Id: <4e53fc8fc5c3512a521311220375ba8542ae0e5f.1689152719.git.gianluca.luparini@bugseng.com>
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
- add the 'U' suffix to all first macro's arguments in 'boot.c'
- add the 'U' suffix near '0x3fffffff' in 'runtime.c'

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- change 'Signed-off-by' ordering
- change commit message
- remove excessive suffixes in 'boot.c'

Changes in v2:
- minor change to commit title
- change commit message
- remove changes in 'efibind.h', 'efiapi.h', 'efidef.h' and 'efiprot.h'
---
 xen/common/efi/boot.c    | 8 ++++----
 xen/common/efi/runtime.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index c5850c26af..24169b7b50 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -34,13 +34,13 @@
 #define EFI_REVISION(major, minor) (((major) << 16) | (minor))
 
 #define SMBIOS3_TABLE_GUID \
-  { 0xf2fd1544, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
+  { 0xf2fd1544U, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0xe3, 0x94} }
 #define SHIM_LOCK_PROTOCOL_GUID \
-  { 0x605dab50, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
+  { 0x605dab50U, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x8b, 0x23} }
 #define APPLE_PROPERTIES_PROTOCOL_GUID \
-  { 0x91bd12fe, 0xf6c3, 0x44fb, { 0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
+  { 0x91bd12feU, 0xf6c3, 0x44fb, {0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x3a, 0xe0} }
 #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
-  { 0xb122a263, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }
+  { 0xb122a263U, 0x3661, 0x4f68, {0x99, 0x29, 0x78, 0xf8, 0xb0, 0xd6, 0x21, 0x80} }
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


