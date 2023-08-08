Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E900773A1F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 14:23:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579749.907869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLk3-0005QL-Ah; Tue, 08 Aug 2023 12:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579749.907869; Tue, 08 Aug 2023 12:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTLk3-0005Mt-7L; Tue, 08 Aug 2023 12:23:15 +0000
Received: by outflank-mailman (input) for mailman id 579749;
 Tue, 08 Aug 2023 12:23:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYul=DZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTLk1-0004sp-HW
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 12:23:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56e016a6-35e6-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 14:23:11 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 649EF4EE0741;
 Tue,  8 Aug 2023 14:23:10 +0200 (CEST)
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
X-Inumbo-ID: 56e016a6-35e6-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 2/2] x86/setup: address MISRA C:2012 Rule 5.3 and 8.3
Date: Tue,  8 Aug 2023 14:22:51 +0200
Message-Id: <05ff36ef9e1838ac782201998f49f6f56f78332a.1691488505.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691488505.git.nicola.vetrini@bugseng.com>
References: <cover.1691488505.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameters in the function declaration 'construct_dom0' violate
Rule 8.3:
"All declarations of an object or function shall use the same names
and type qualifiers", but also cause shadowing inside the declaration
scope with the variable "static struct file __initdata kernel;" in
'xen/common/efi/boot.c'. Renaming the parameters in the declaration
resolves both issues

The local variable 'mask' is removed because it shadows the homonymous
variable defined in an outer scope. There's no change to the semantics since
the last use of this variable is in the scope touched by this commit.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- Clarified commit message

As mentioned in the preivious iteration's thread:
the declaration itself is a scope and shadowing can happen, as in:

int x;
void f(int x, int arr[x]);

Now, the example is a bit contrived, but the fact that the rule does not list any
exception motivates the declaration of 'construct_dom0' being considered a
violation.
---
 xen/arch/x86/include/asm/setup.h | 2 +-
 xen/arch/x86/setup.c             | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 51fce66607..b0e6a39e23 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -33,7 +33,7 @@ static inline void vesa_init(void) {};
 
 int construct_dom0(
     struct domain *d,
-    const module_t *kernel, unsigned long kernel_headroom,
+    const module_t *image, unsigned long image_headroom,
     module_t *initrd,
     const char *cmdline);
 void setup_io_bitmap(struct domain *d);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 2dbe9857aa..80ae973d64 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1577,8 +1577,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         s = map_s;
         if ( s < map_e )
         {
-            uint64_t mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
-
+            mask = (1UL << L2_PAGETABLE_SHIFT) - 1;
             map_s = (s + mask) & ~mask;
             map_e &= ~mask;
             init_boot_pages(map_s, map_e);
-- 
2.34.1


