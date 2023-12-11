Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E4B80CA9F
	for <lists+xen-devel@lfdr.de>; Mon, 11 Dec 2023 14:16:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.651786.1017628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCg9B-00060N-Ep; Mon, 11 Dec 2023 13:16:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 651786.1017628; Mon, 11 Dec 2023 13:16:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCg9B-0005xI-By; Mon, 11 Dec 2023 13:16:33 +0000
Received: by outflank-mailman (input) for mailman id 651786;
 Mon, 11 Dec 2023 13:16:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g7EY=HW=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rCg99-0005vq-RO
 for xen-devel@lists.xenproject.org; Mon, 11 Dec 2023 13:16:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [2a07:de40:b251:101:10:150:64:1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f8548d9-9827-11ee-98e8-6d05b1d4d9a1;
 Mon, 11 Dec 2023 14:16:30 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 531D4223CE;
 Mon, 11 Dec 2023 13:16:30 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 14DE5134B0;
 Mon, 11 Dec 2023 13:16:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id OM/RA64Ld2XMUgAAn2gu4w
 (envelope-from <jgross@suse.com>); Mon, 11 Dec 2023 13:16:30 +0000
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
X-Inumbo-ID: 7f8548d9-9827-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702300590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HcRuni7yfSoZg5Lwx25GUDWH7ewqyMT8SLWLauip6Wo=;
	b=uJKrHbD0SDRzdM/CkOOSccwKIRhu9iF0eINhYWuYNXPcCGPVC4I6EEoTzElmZFHRUMu4vc
	IGnbcG7SYuT2/8MSeXm5CIV7nXOKmb1k/kNuah5uJ6g7z5pNMuSNmRvdEr/yLtaaisVapS
	FjC9uQtPCM4dbx23Vkbp9Vv8CCv4/og=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702300590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HcRuni7yfSoZg5Lwx25GUDWH7ewqyMT8SLWLauip6Wo=;
	b=uJKrHbD0SDRzdM/CkOOSccwKIRhu9iF0eINhYWuYNXPcCGPVC4I6EEoTzElmZFHRUMu4vc
	IGnbcG7SYuT2/8MSeXm5CIV7nXOKmb1k/kNuah5uJ6g7z5pNMuSNmRvdEr/yLtaaisVapS
	FjC9uQtPCM4dbx23Vkbp9Vv8CCv4/og=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v3 2/3] xen: make include/xen/unaligned.h usable on all architectures
Date: Mon, 11 Dec 2023 14:16:15 +0100
Message-Id: <20231211131616.1839-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231211131616.1839-1-jgross@suse.com>
References: <20231211131616.1839-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spam-Score: -3.27
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 REPLY(-4.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 RCPT_COUNT_SEVEN(0.00)[9];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[100.00%]
X-Spam-Flag: NO

Instead of defining get_unaligned() and put_unaligned() in a way that
is only supporting architectures allowing unaligned accesses, use the
same approach as the Linux kernel and let the compiler do the
decision how to generate the code for probably unaligned data accesses.

Update include/xen/unaligned.h from include/asm-generic/unaligned.h of
the Linux kernel.

The generated code has been checked to be the same on x86.

Modify the Linux variant to not use underscore prefixed identifiers,
avoid unneeded parentheses and drop the 24-bit accessors.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 803f4e1eab7a
Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
V2:
- drop 24-bit accessors (Jan Beulich)
- avoid underscore prefixed identifiers (Jan Beulich)
- drop unneeded parentheses (Jan Beulich)
V3:
- drop trailing underscores in names (Andrew Cooper)
- keep existing function sequence and types (Andrew Cooper)
---
 xen/include/xen/unaligned.h | 53 +++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 23 deletions(-)

diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
index 0a2b16d05d..3eda0ece11 100644
--- a/xen/include/xen/unaligned.h
+++ b/xen/include/xen/unaligned.h
@@ -1,12 +1,4 @@
-/*
- * This header can be used by architectures where unaligned accesses work
- * without faulting, and at least reasonably efficiently.  Other architectures
- * will need to have a custom asm/unaligned.h.
- */
-#ifndef __ASM_UNALIGNED_H__
-#error "xen/unaligned.h should not be included directly - include asm/unaligned.h instead"
-#endif
-
+/* SPDX-License-Identifier: GPL-2.0 */
 #ifndef __XEN_UNALIGNED_H__
 #define __XEN_UNALIGNED_H__
 
@@ -15,67 +7,82 @@
 #include <asm/byteorder.h>
 #endif
 
-#define get_unaligned(p) (*(p))
-#define put_unaligned(val, p) (*(p) = (val))
+/*
+ * This is the most generic implementation of unaligned accesses
+ * and should work almost anywhere.
+ */
+
+#define get_unaligned_t(type, ptr) ({					\
+	const struct { type x; } __packed *ptr_ = (typeof(ptr_))(ptr);	\
+	ptr_->x;							\
+})
+
+#define put_unaligned_t(type, val, ptr) do {				\
+	struct { type x; } __packed *ptr_ = (typeof(ptr_))(ptr);	\
+	ptr_->x = val;							\
+} while (0)
+
+#define get_unaligned(ptr)	get_unaligned_t(typeof(*(ptr)), ptr)
+#define put_unaligned(val, ptr) put_unaligned_t(typeof(*(ptr)), val, ptr)
 
 static inline uint16_t get_unaligned_be16(const void *p)
 {
-	return be16_to_cpup(p);
+	return be16_to_cpu(get_unaligned_t(__be16, p));
 }
 
 static inline void put_unaligned_be16(uint16_t val, void *p)
 {
-	*(__force __be16*)p = cpu_to_be16(val);
+	put_unaligned_t(__be16, cpu_to_be16(val), p);
 }
 
 static inline uint32_t get_unaligned_be32(const void *p)
 {
-	return be32_to_cpup(p);
+	return be32_to_cpu(get_unaligned_t(__be32, p));
 }
 
 static inline void put_unaligned_be32(uint32_t val, void *p)
 {
-	*(__force __be32*)p = cpu_to_be32(val);
+	put_unaligned_t(__be32, cpu_to_be32(val), p);
 }
 
 static inline uint64_t get_unaligned_be64(const void *p)
 {
-	return be64_to_cpup(p);
+	return be64_to_cpu(get_unaligned_t(__be64, p));
 }
 
 static inline void put_unaligned_be64(uint64_t val, void *p)
 {
-	*(__force __be64*)p = cpu_to_be64(val);
+	put_unaligned_t(__be64, cpu_to_be64(val), p);
 }
 
 static inline uint16_t get_unaligned_le16(const void *p)
 {
-	return le16_to_cpup(p);
+	return le16_to_cpu(get_unaligned_t(__le16, p));
 }
 
 static inline void put_unaligned_le16(uint16_t val, void *p)
 {
-	*(__force __le16*)p = cpu_to_le16(val);
+	put_unaligned_t(__le16, cpu_to_le16(val), p);
 }
 
 static inline uint32_t get_unaligned_le32(const void *p)
 {
-	return le32_to_cpup(p);
+	return le32_to_cpu(get_unaligned_t(__le32, p));
 }
 
 static inline void put_unaligned_le32(uint32_t val, void *p)
 {
-	*(__force __le32*)p = cpu_to_le32(val);
+	put_unaligned_t(__le32, cpu_to_le32(val), p);
 }
 
 static inline uint64_t get_unaligned_le64(const void *p)
 {
-	return le64_to_cpup(p);
+	return le64_to_cpu(get_unaligned_t(__le64, p));
 }
 
 static inline void put_unaligned_le64(uint64_t val, void *p)
 {
-	*(__force __le64*)p = cpu_to_le64(val);
+	put_unaligned_t(__le64, cpu_to_le64(val), p);
 }
 
 #endif /* __XEN_UNALIGNED_H__ */
-- 
2.35.3


