Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E058AEA5D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 17:13:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710797.1110312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpm-0007Qo-8d; Tue, 23 Apr 2024 15:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710797.1110312; Tue, 23 Apr 2024 15:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzHpm-0007Kt-4Z; Tue, 23 Apr 2024 15:13:26 +0000
Received: by outflank-mailman (input) for mailman id 710797;
 Tue, 23 Apr 2024 15:13:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5BF=L4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rzHpj-0004ry-So
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 15:13:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06c360e2-0184-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 17:13:23 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id CE74D4EE073F;
 Tue, 23 Apr 2024 17:13:20 +0200 (CEST)
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
X-Inumbo-ID: 06c360e2-0184-11ef-909a-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 07/10] x86/acpi: power: address violations of MISRA Rule 20.7
Date: Tue, 23 Apr 2024 17:12:49 +0200
Message-Id: <9f159a0c653c3fb9dd192c1f888a16052f1b026f.1713885065.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713885065.git.nicola.vetrini@bugseng.com>
References: <cover.1713885065.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/acpi/power.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index c6fa810a6b13..610937f42e95 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -422,12 +422,12 @@ static void tboot_sleep(u8 sleep_state)
 {
     uint32_t shutdown_type;
 
-#define TB_COPY_GAS(tbg, g)             \
-    tbg.space_id = g.space_id;          \
-    tbg.bit_width = g.bit_width;        \
-    tbg.bit_offset = g.bit_offset;      \
-    tbg.access_width = g.access_width;  \
-    tbg.address = g.address;
+#define TB_COPY_GAS(tbg, g)                 \
+    (tbg).space_id = (g).space_id;          \
+    (tbg).bit_width = (g).bit_width;        \
+    (tbg).bit_offset = (g).bit_offset;      \
+    (tbg).access_width = (g).access_width;  \
+    (tbg).address = (g).address;
 
     /* sizes are not same (due to packing) so copy each one */
     TB_COPY_GAS(g_tboot_shared->acpi_sinfo.pm1a_cnt_blk,
-- 
2.34.1


