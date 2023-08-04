Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0387704A5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 17:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577193.904184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwiu-0000Yy-A9; Fri, 04 Aug 2023 15:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577193.904184; Fri, 04 Aug 2023 15:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwiu-0000WF-2x; Fri, 04 Aug 2023 15:28:16 +0000
Received: by outflank-mailman (input) for mailman id 577193;
 Fri, 04 Aug 2023 15:28:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRwis-00080a-36
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 15:28:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86b2be7b-32db-11ee-b26d-6b7b168915f2;
 Fri, 04 Aug 2023 17:28:13 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A877E4EE0744;
 Fri,  4 Aug 2023 17:28:12 +0200 (CEST)
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
X-Inumbo-ID: 86b2be7b-32db-11ee-b26d-6b7b168915f2
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
Subject: [XEN PATCH 5/6] x86/xstate: address MISRA C:2012 Rule 5.3
Date: Fri,  4 Aug 2023 17:27:48 +0200
Message-Id: <1ea70e5f8293fdca2bb69ec75f532722136e52a5.1691162261.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691162261.git.nicola.vetrini@bugseng.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the local variables to avoid clashing with function 'xstate'
defined below, but declared in the corresponding header file.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/xstate.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 3d566252ea..180455b26d 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -174,10 +174,10 @@ static void setup_xstate_comp(uint16_t *comp_offsets,
  */
 void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
 {
-    const struct xsave_struct *xsave = v->arch.xsave_area;
+    const struct xsave_struct *xsave_area = v->arch.xsave_area;
     const void *src;
     uint16_t comp_offsets[sizeof(xfeature_mask)*8];
-    u64 xstate_bv = xsave->xsave_hdr.xstate_bv;
+    u64 xstate_bv = xsave_area->xsave_hdr.xstate_bv;
     u64 valid;
 
     /* Check there is state to serialise (i.e. at least an XSAVE_HDR) */
@@ -185,19 +185,19 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
     /* Check there is the correct room to decompress into. */
     BUG_ON(size != xstate_ctxt_size(v->arch.xcr0_accum));
 
-    if ( !(xsave->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED) )
+    if ( !(xsave_area->xsave_hdr.xcomp_bv & XSTATE_COMPACTION_ENABLED) )
     {
-        memcpy(dest, xsave, size);
+        memcpy(dest, xsave_area, size);
         return;
     }
 
-    ASSERT(xsave_area_compressed(xsave));
-    setup_xstate_comp(comp_offsets, xsave->xsave_hdr.xcomp_bv);
+    ASSERT(xsave_area_compressed(xsave_area));
+    setup_xstate_comp(comp_offsets, xsave_area->xsave_hdr.xcomp_bv);
 
     /*
      * Copy legacy XSAVE area and XSAVE hdr area.
      */
-    memcpy(dest, xsave, XSTATE_AREA_MIN_SIZE);
+    memcpy(dest, xsave_area, XSTATE_AREA_MIN_SIZE);
     memset(dest + XSTATE_AREA_MIN_SIZE, 0, size - XSTATE_AREA_MIN_SIZE);
 
     ((struct xsave_struct *)dest)->xsave_hdr.xcomp_bv =  0;
@@ -206,7 +206,7 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
      * Copy each region from the possibly compacted offset to the
      * non-compacted offset.
      */
-    src = xsave;
+    src = xsave_area;
     valid = xstate_bv & ~XSTATE_FP_SSE;
     while ( valid )
     {
@@ -239,7 +239,7 @@ void expand_xsave_states(const struct vcpu *v, void *dest, unsigned int size)
  */
 void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
 {
-    struct xsave_struct *xsave = v->arch.xsave_area;
+    struct xsave_struct *xsave_area = v->arch.xsave_area;
     void *dest;
     uint16_t comp_offsets[sizeof(xfeature_mask)*8];
     u64 xstate_bv, valid;
@@ -252,7 +252,7 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
 
     if ( !(v->arch.xcr0_accum & XSTATE_XSAVES_ONLY) )
     {
-        memcpy(xsave, src, size);
+        memcpy(xsave_area, src, size);
         return;
     }
 
@@ -260,19 +260,19 @@ void compress_xsave_states(struct vcpu *v, const void *src, unsigned int size)
      * Copy legacy XSAVE area, to avoid complications with CPUID
      * leaves 0 and 1 in the loop below.
      */
-    memcpy(xsave, src, FXSAVE_SIZE);
+    memcpy(xsave_area, src, FXSAVE_SIZE);
 
     /* Set XSTATE_BV and XCOMP_BV.  */
-    xsave->xsave_hdr.xstate_bv = xstate_bv;
-    xsave->xsave_hdr.xcomp_bv = v->arch.xcr0_accum | XSTATE_COMPACTION_ENABLED;
+    xsave_area->xsave_hdr.xstate_bv = xstate_bv;
+    xsave_area->xsave_hdr.xcomp_bv = v->arch.xcr0_accum | XSTATE_COMPACTION_ENABLED;
 
-    setup_xstate_comp(comp_offsets, xsave->xsave_hdr.xcomp_bv);
+    setup_xstate_comp(comp_offsets, xsave_area->xsave_hdr.xcomp_bv);
 
     /*
      * Copy each region from the non-compacted offset to the
      * possibly compacted offset.
      */
-    dest = xsave;
+    dest = xsave_area;
     valid = xstate_bv & ~XSTATE_FP_SSE;
     while ( valid )
     {
-- 
2.34.1


