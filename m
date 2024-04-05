Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7591E899925
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 11:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701163.1095380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfes-0008NV-1J; Fri, 05 Apr 2024 09:14:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701163.1095380; Fri, 05 Apr 2024 09:14:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsfer-0008GZ-TG; Fri, 05 Apr 2024 09:14:49 +0000
Received: by outflank-mailman (input) for mailman id 701163;
 Fri, 05 Apr 2024 09:14:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUTm=LK=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rsfer-0007cm-0k
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 09:14:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f283f1f3-f32c-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 11:14:47 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 3A76E4EE0745;
 Fri,  5 Apr 2024 11:14:46 +0200 (CEST)
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
X-Inumbo-ID: f283f1f3-f32c-11ee-afe6-a90da7624cb6
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 4/9] x86/efi: tidy switch statement and address MISRA violation
Date: Fri,  5 Apr 2024 11:14:32 +0200
Message-Id: <acbf40ba94a5ef7a8a429498765932b801e42a0a.1712305581.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712305581.git.nicola.vetrini@bugseng.com>
References: <cover.1712305581.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor the first clauses so that a violation of
MISRA C Rule 16.2 is resolved (a switch label, "default" in this
case, should be immediately enclosed in the compound statement
of the switch). Note that the switch clause ending with the pseudo
keyword "fallthrough" is an allowed exception to Rule 16.3.

Convert fallthrough comments in other clauses to the pseudo-keyword
while at it.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
There is some degree of duplication here between the default clause
and the others, but I don't think there is a way to avoid it.
---
 xen/arch/x86/efi/efi-boot.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
index 8ea64e31cdc2..c4d452c482be 100644
--- a/xen/arch/x86/efi/efi-boot.h
+++ b/xen/arch/x86/efi/efi-boot.h
@@ -169,20 +169,22 @@ static void __init efi_arch_process_memory_map(EFI_SYSTEM_TABLE *SystemTable,
 
         switch ( desc->Type )
         {
+        default:
+            type = E820_RESERVED;
+            break;
         case EfiBootServicesCode:
         case EfiBootServicesData:
             if ( map_bs )
             {
-        default:
                 type = E820_RESERVED;
                 break;
             }
-            /* fall through */
+            fallthrough;
         case EfiConventionalMemory:
             if ( !trampoline_phys && desc->PhysicalStart + len <= 0x100000 &&
                  len >= cfg.size && desc->PhysicalStart + len > cfg.addr )
                 cfg.addr = (desc->PhysicalStart + len - cfg.size) & PAGE_MASK;
-            /* fall through */
+            fallthrough;
         case EfiLoaderCode:
         case EfiLoaderData:
             if ( desc->Attribute & EFI_MEMORY_RUNTIME )
-- 
2.34.1


