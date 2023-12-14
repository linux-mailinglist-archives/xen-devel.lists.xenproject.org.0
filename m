Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 329CC812FC1
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 13:09:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654524.1021521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWJ-0001zF-VU; Thu, 14 Dec 2023 12:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654524.1021521; Thu, 14 Dec 2023 12:08:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWJ-0001pJ-ON; Thu, 14 Dec 2023 12:08:51 +0000
Received: by outflank-mailman (input) for mailman id 654524;
 Thu, 14 Dec 2023 12:08:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWU9=HZ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rDkWH-0000tI-KV
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 12:08:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8880a984-9a79-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 13:08:46 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 3360D4EE0747;
 Thu, 14 Dec 2023 13:08:46 +0100 (CET)
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
X-Inumbo-ID: 8880a984-9a79-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 3/9] xen/efi: address violations of MISRA C:2012 Rule 11.8
Date: Thu, 14 Dec 2023 13:07:45 +0100
Message-Id: <4540a3850dae951dd6bc4f9b001c9816bde2e49e.1702555387.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
headline states:
"A conversion shall not remove any const, volatile or _Atomic qualification
from the type pointed to by a pointer".

Add missing const qualifiers in casts.
The variables are originally const-qualified.
There's no reason to drop the qualifiers.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/common/efi/boot.c | 6 +++---
 xen/common/version.c  | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
index 6110819918..efbec00af9 100644
--- a/xen/common/efi/boot.c
+++ b/xen/common/efi/boot.c
@@ -1248,10 +1248,10 @@ static void __init efi_exit_boot(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *Syste
 #endif
 
     /* Adjust pointers into EFI. */
-    efi_ct = (void *)efi_ct + DIRECTMAP_VIRT_START;
-    efi_rs = (void *)efi_rs + DIRECTMAP_VIRT_START;
+    efi_ct = (const void *)efi_ct + DIRECTMAP_VIRT_START;
+    efi_rs = (const void *)efi_rs + DIRECTMAP_VIRT_START;
     efi_memmap = (void *)efi_memmap + DIRECTMAP_VIRT_START;
-    efi_fw_vendor = (void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
+    efi_fw_vendor = (const void *)efi_fw_vendor + DIRECTMAP_VIRT_START;
 }
 
 /* SAF-1-safe */
diff --git a/xen/common/version.c b/xen/common/version.c
index d320135208..6ac5a52700 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -178,7 +178,7 @@ void __init xen_build_init(void)
     if ( &n[1] >= __note_gnu_build_id_end )
         return;
 
-    sz = (void *)__note_gnu_build_id_end - (void *)n;
+    sz = (const void *)__note_gnu_build_id_end - (const void *)n;
 
     rc = xen_build_id_check(n, sz, &build_id_p, &build_id_len);
 
-- 
2.40.0


