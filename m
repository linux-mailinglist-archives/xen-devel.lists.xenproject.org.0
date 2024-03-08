Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6912387631A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 12:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690224.1076048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHu-0007OV-Fm; Fri, 08 Mar 2024 11:21:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690224.1076048; Fri, 08 Mar 2024 11:21:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riYHu-0007LM-Ba; Fri, 08 Mar 2024 11:21:18 +0000
Received: by outflank-mailman (input) for mailman id 690224;
 Fri, 08 Mar 2024 11:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBuc=KO=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1riYHs-00067H-Fl
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 11:21:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f97d751c-dd3d-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 12:21:14 +0100 (CET)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id AB5144EE074C;
 Fri,  8 Mar 2024 12:21:13 +0100 (CET)
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
X-Inumbo-ID: f97d751c-dd3d-11ee-a1ee-f123f15fe8a2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 6/7] x86/irq: parenthesize negative constants
Date: Fri,  8 Mar 2024 12:21:03 +0100
Message-Id: <9b7e9135952e51043427e3233305917126c95659.1709896401.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709896401.git.nicola.vetrini@bugseng.com>
References: <cover.1709896401.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These constants are parenthesized to avoid them from
possibly influencing the semantics of the constructs where it is used,
especially inside macros invocations.

This also resolves some violations of MISRA C Rule 20.7
("Expressions resulting from the expansion of macro parameters shall
be enclosed in parentheses").

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- dropped the controversial GUARD(1) hunk
---
 xen/arch/x86/include/asm/irq.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/include/asm/irq.h b/xen/arch/x86/include/asm/irq.h
index 082a3d6bbc6a..7d49f3c1904a 100644
--- a/xen/arch/x86/include/asm/irq.h
+++ b/xen/arch/x86/include/asm/irq.h
@@ -172,16 +172,16 @@ void cleanup_domain_irq_mapping(struct domain *d);
     void *__ret = radix_tree_lookup(&(d)->arch.irq_pirq, irq);  \
     __ret ? radix_tree_ptr_to_int(__ret) : 0;                   \
 })
-#define PIRQ_ALLOCATED -1
+#define PIRQ_ALLOCATED (-1)
 #define domain_pirq_to_emuirq(d, pirq) pirq_field(d, pirq,              \
     arch.hvm.emuirq, IRQ_UNBOUND)
 #define domain_emuirq_to_pirq(d, emuirq) ({                             \
     void *__ret = radix_tree_lookup(&(d)->arch.hvm.emuirq_pirq, emuirq);\
     __ret ? radix_tree_ptr_to_int(__ret) : IRQ_UNBOUND;                 \
 })
-#define IRQ_UNBOUND -1
-#define IRQ_PT -2
-#define IRQ_MSI_EMU -3
+#define IRQ_UNBOUND (-1)
+#define IRQ_PT      (-2)
+#define IRQ_MSI_EMU (-3)
 
 bool cpu_has_pending_apic_eoi(void);
 
-- 
2.34.1


