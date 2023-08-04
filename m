Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5537704AA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 17:28:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577195.904204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwiv-00016I-Si; Fri, 04 Aug 2023 15:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577195.904204; Fri, 04 Aug 2023 15:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwiv-00010p-Oy; Fri, 04 Aug 2023 15:28:17 +0000
Received: by outflank-mailman (input) for mailman id 577195;
 Fri, 04 Aug 2023 15:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRwit-00080Z-Vc
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 15:28:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 872664d2-32db-11ee-8613-37d641c3527e;
 Fri, 04 Aug 2023 17:28:14 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 7446F4EE0745;
 Fri,  4 Aug 2023 17:28:13 +0200 (CEST)
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
X-Inumbo-ID: 872664d2-32db-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH 6/6] x86: refactor macros in 'xen-mca.h' to address MISRA C:2012 Rule 5.3
Date: Fri,  4 Aug 2023 17:27:49 +0200
Message-Id: <9d89a58ef016d96da7c3f329fb367f99d169cae6.1691162261.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691162261.git.nicola.vetrini@bugseng.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macros defined 'xen/include/public/arch-x86/xen-mca.h' have needless
underscore prefixes for parameter names and variable names that cause
shadowing with e.g. the variable 'i' in function 'mce_action'.
Therefore, the renaming aims to resolve present shadowing issues and
lessen the probability of future ones.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
The spirit of this patch is similar to this one [1] made by Jan that arose from
a violation of this rule.

[1] https://gitlab.com/xen-project/xen/-/commit/c0579c65f6bef794cd449fbc946feacccf485f2e
---
 xen/include/public/arch-x86/xen-mca.h | 38 +++++++++++++--------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/xen/include/public/arch-x86/xen-mca.h b/xen/include/public/arch-x86/xen-mca.h
index b897536ec5..55b999ab21 100644
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
+        if (mi == NULL) break;                                  \
+        mic_ = x86_mcinfo_first(mi);                            \
+        for (i_ = 0; i_ < x86_mcinfo_nentries(mi); i_++) {      \
+            if (mic_->type == (mc_type)) {                      \
+                found_ = 1;                                     \
                 break;                                          \
             }                                                   \
-            _mic = x86_mcinfo_next(_mic);                       \
+            mic_ = x86_mcinfo_next(mic_);                         \
         }                                                       \
-        (_ret) = found ? _mic : NULL;                           \
+        (ret) = found_ ? mic_ : NULL;                            \
     } while (0)


--
2.34.1

