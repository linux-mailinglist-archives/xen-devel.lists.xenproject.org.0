Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BCE7739DF
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 13:08:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579643.907747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKZy-0006oP-G1; Tue, 08 Aug 2023 11:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579643.907747; Tue, 08 Aug 2023 11:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTKZy-0006jn-98; Tue, 08 Aug 2023 11:08:46 +0000
Received: by outflank-mailman (input) for mailman id 579643;
 Tue, 08 Aug 2023 11:08:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aYul=DZ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qTKZw-00068O-LO
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 11:08:44 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f022ab89-35db-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 13:08:44 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 1193B4EE0743;
 Tue,  8 Aug 2023 13:08:43 +0200 (CEST)
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
X-Inumbo-ID: f022ab89-35db-11ee-b280-6b7b168915f2
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
Subject: [XEN PATCH v2 5/5] x86: refactor macros in 'xen-mca.h'
Date: Tue,  8 Aug 2023 13:08:07 +0200
Message-Id: <8df1af6384606d8176525fbffb364ec814d48db1.1691492441.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691492441.git.nicola.vetrini@bugseng.com>
References: <cover.1691492441.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macros defined 'xen/include/public/arch-x86/xen-mca.h' are revised
to address the following concerns:
- needless underscore prefixes for parameter names;
- the variable 'i' in function 'mce_action' that is shadowed
  by the local variable in the macro.

Therefore, the refactoring aims to resolve present shadowing
issues, which violate MISRA C:2012 Rule 5.3, and lessen the
probability of future ones with some renames.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Added missing parentheses.
- Clarified commit message.
---
 xen/include/public/arch-x86/xen-mca.h | 38 +++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/xen/include/public/arch-x86/xen-mca.h b/xen/include/public/arch-x86/xen-mca.h
index b897536ec5..bb1b12f14f 100644
--- a/xen/include/public/arch-x86/xen-mca.h
+++ b/xen/include/public/arch-x86/xen-mca.h
@@ -280,39 +280,39 @@ DEFINE_XEN_GUEST_HANDLE(xen_mc_logical_cpu_t);
 /* Prototype:
  *    uint32_t x86_mcinfo_nentries(struct mc_info *mi);
  */
-#define x86_mcinfo_nentries(_mi)    \
-    (_mi)->mi_nentries
+#define x86_mcinfo_nentries(mi)    \
+    (mi)->mi_nentries
 /* Prototype:
  *    struct mcinfo_common *x86_mcinfo_first(struct mc_info *mi);
  */
-#define x86_mcinfo_first(_mi)       \
-    ((struct mcinfo_common *)(_mi)->mi_data)
+#define x86_mcinfo_first(mi)       \
+    ((struct mcinfo_common *)(mi)->mi_data)
 /* Prototype:
  *    struct mcinfo_common *x86_mcinfo_next(struct mcinfo_common *mic);
  */
-#define x86_mcinfo_next(_mic)       \
-    ((struct mcinfo_common *)((uint8_t *)(_mic) + (_mic)->size))
+#define x86_mcinfo_next(mic)       \
+    ((struct mcinfo_common *)((uint8_t *)(mic) + (mic)->size))
 
 /* Prototype:
- *    void x86_mcinfo_lookup(void *ret, struct mc_info *mi, uint16_t type);
+ *    void x86_mcinfo_lookup(void *ret, struct mc_info *mi, uint16_t mc_type);
  */
-#define x86_mcinfo_lookup(_ret, _mi, _type)    \
+#define x86_mcinfo_lookup(ret, mi, mc_type)                     \
     do {                                                        \
-        uint32_t found, i;                                      \
-        struct mcinfo_common *_mic;                             \
+        uint32_t found_, i_;                                    \
+        struct mcinfo_common *mic_;                             \
                                                                 \
-        found = 0;                                              \
-        (_ret) = NULL;                                          \
-        if (_mi == NULL) break;                                 \
-        _mic = x86_mcinfo_first(_mi);                           \
-        for (i = 0; i < x86_mcinfo_nentries(_mi); i++) {        \
-            if (_mic->type == (_type)) {                        \
-                found = 1;                                      \
+        found_ = 0;                                             \
+        (ret) = NULL;                                           \
+        if ((mi) == NULL) break;                                \
+        mic_ = x86_mcinfo_first(mi);                            \
+        for (i_ = 0; i_ < x86_mcinfo_nentries(mi); i_++) {      \
+            if (mic_->type == (mc_type)) {                      \
+                found_ = 1;                                     \
                 break;                                          \
             }                                                   \
-            _mic = x86_mcinfo_next(_mic);                       \
+            mic_ = x86_mcinfo_next(mic_);                       \
         }                                                       \
-        (_ret) = found ? _mic : NULL;                           \
+        (ret) = found_ ? mic_ : NULL;                           \
     } while (0)
 
 
-- 
2.34.1


