Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C43BB79E7F0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 14:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601259.937237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgP00-0007zB-56; Wed, 13 Sep 2023 12:29:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601259.937237; Wed, 13 Sep 2023 12:29:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgP00-0007wW-2W; Wed, 13 Sep 2023 12:29:40 +0000
Received: by outflank-mailman (input) for mailman id 601259;
 Wed, 13 Sep 2023 12:29:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHSA=E5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qgOzy-0007wP-Nw
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 12:29:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3262f47b-5231-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 14:29:35 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-87-19-206-190.retail.telecomitalia.it [87.19.206.190])
 by support.bugseng.com (Postfix) with ESMTPSA id 120754EE074D;
 Wed, 13 Sep 2023 14:29:34 +0200 (CEST)
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
X-Inumbo-ID: 3262f47b-5231-11ee-9b0d-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/libelf: address violations of MISRA C:2012 RUles 8.2 and 8.3
Date: Wed, 13 Sep 2023 14:29:24 +0200
Message-Id: <e4d28b9b78e84260feea6bdbcb4ecdd815af5db3.1694591513.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names and make function declarations and
definitions consistent. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/include/xen/libelf.h | 38 +++++++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/xen/include/xen/libelf.h b/xen/include/xen/libelf.h
index be47b0cc36..1c77e3df31 100644
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -260,8 +260,8 @@ struct elf_binary {
    * str should be a HANDLE.
    */
 
-uint64_t elf_access_unsigned(struct elf_binary *elf, elf_ptrval ptr,
-                             uint64_t offset, size_t size);
+uint64_t elf_access_unsigned(struct elf_binary *elf, elf_ptrval base,
+                             uint64_t moreoffset, size_t size);
   /* Reads a field at arbitrary offset and alignemnt */
 
 uint64_t elf_round_up(struct elf_binary *elf, uint64_t addr);
@@ -272,8 +272,10 @@ const char *elf_strval(struct elf_binary *elf, elf_ptrval start);
 const char *elf_strfmt(struct elf_binary *elf, elf_ptrval start);
   /* like elf_strval but returns "(invalid)" instead of NULL */
 
-void elf_memcpy_safe(struct elf_binary*, elf_ptrval dst, elf_ptrval src, size_t);
-void elf_memset_safe(struct elf_binary*, elf_ptrval dst, int c, size_t);
+void elf_memcpy_safe(struct elf_binary *elf, elf_ptrval dst, elf_ptrval src,
+                     size_t size);
+void elf_memset_safe(struct elf_binary *elf, elf_ptrval dst, int c,
+                     size_t size);
   /*
    * Versions of memcpy and memset which arrange never to write
    * outside permitted areas.
@@ -324,7 +326,8 @@ ELF_HANDLE_DECL(elf_sym) elf_sym_by_index(struct elf_binary *elf, unsigned index
 const char *elf_note_name(struct elf_binary *elf, ELF_HANDLE_DECL(elf_note) note); /* may return NULL */
 elf_ptrval elf_note_desc(struct elf_binary *elf, ELF_HANDLE_DECL(elf_note) note);
 uint64_t elf_note_numeric(struct elf_binary *elf, ELF_HANDLE_DECL(elf_note) note);
-uint64_t elf_note_numeric_array(struct elf_binary *, ELF_HANDLE_DECL(elf_note),
+uint64_t elf_note_numeric_array(struct elf_binary *elf,
+                                ELF_HANDLE_DECL(elf_note) note,
                                 unsigned int unitsz, unsigned int idx);
 
 /*
@@ -346,9 +349,10 @@ bool elf_phdr_is_loadable(struct elf_binary *elf, ELF_HANDLE_DECL(elf_phdr) phdr
 /* ------------------------------------------------------------------------ */
 /* xc_libelf_loader.c                                                       */
 
-elf_errorstatus elf_init(struct elf_binary *elf, const char *image, size_t size);
+elf_errorstatus elf_init(struct elf_binary *elf, const char *image_input,
+                         size_t size);
   /*
-   * image and size must be correct.  They will be recorded in
+   * image_input and size must be correct.  They will be recorded in
    * *elf, and must remain valid while the elf is in use.
    */
 #ifdef __XEN__
@@ -445,16 +449,16 @@ static inline int elf_xen_feature_get(int nr, uint32_t * addr)
     return !!(addr[nr >> 5] & (1 << (nr & 31)));
 }
 
-int elf_xen_parse_features(const char *features,
-                           uint32_t *supported,
-                           uint32_t *required);
-int elf_xen_parse_note(struct elf_binary *elf,
-                       struct elf_dom_parms *parms,
-                       ELF_HANDLE_DECL(elf_note) note);
-int elf_xen_parse_guest_info(struct elf_binary *elf,
-                             struct elf_dom_parms *parms);
-int elf_xen_parse(struct elf_binary *elf,
-                  struct elf_dom_parms *parms, bool hvm);
+elf_errorstatus elf_xen_parse_features(const char *features,
+                                       uint32_t *supported,
+                                       uint32_t *required);
+elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
+                                   struct elf_dom_parms *parms,
+                                   ELF_HANDLE_DECL(elf_note) note);
+elf_errorstatus elf_xen_parse_guest_info(struct elf_binary *elf,
+                                         struct elf_dom_parms *parms);
+elf_errorstatus elf_xen_parse(struct elf_binary *elf,
+                              struct elf_dom_parms *parms, bool hvm);
 
 static inline void *elf_memcpy_unchecked(void *dest, const void *src, size_t n)
     { return memcpy(dest, src, n); }
-- 
2.34.1


