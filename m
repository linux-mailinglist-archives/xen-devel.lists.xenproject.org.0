Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBE1804FD6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 11:08:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647513.1010712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rASLY-00062Z-Gv; Tue, 05 Dec 2023 10:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647513.1010712; Tue, 05 Dec 2023 10:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rASLY-00060i-Dk; Tue, 05 Dec 2023 10:08:08 +0000
Received: by outflank-mailman (input) for mailman id 647513;
 Tue, 05 Dec 2023 10:08:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mnjk=HQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rASLW-0005zz-Le
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 10:08:06 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e91f1bd-9356-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 11:08:05 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0121122060;
 Tue,  5 Dec 2023 10:08:04 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B7DD3138FF;
 Tue,  5 Dec 2023 10:08:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id ArWzK4P2bmX6MAAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 05 Dec 2023 10:08:03 +0000
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
X-Inumbo-ID: 2e91f1bd-9356-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701770884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2fYQv/39LJ/pI8k7gLnqlsK8l/cey3HS0JyD9skuDbw=;
	b=px9YmtebgyHlc7a5wrtMn8qltRRRoBjVOspgyMydzA1AQvl3txfWWUPkmgs7arLdbA5l3P
	zGPza2ljlKaI2LIoPT3HjEP+7Y1Q2h5YS7mkn+9rtHjO+2/D8HdtBlbo2f3RFO3ZfWlCmn
	pj7BictQ/LKTnzHgMMjdupkqtG4Fx3A=
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
Subject: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all architectures
Date: Tue,  5 Dec 2023 11:07:55 +0100
Message-Id: <20231205100756.18920-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231205100756.18920-1-jgross@suse.com>
References: <20231205100756.18920-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
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
	 DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-3.00)[99.99%]
X-Spam-Score: -3.30

Instead of defining get_unaligned() and put_unaligned() in a way that
is only supporting architectures allowing unaligned accesses, use the
same approach as the Linux kernel and let the compiler do the
decision how to generate the code for probably unaligned data accesses.

Update include/xen/unaligned.h from include/asm-generic/unaligned.h of
the Linux kernel.

The generated code has been checked to be the same on x86.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 803f4e1eab7a
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/xen/unaligned.h | 121 +++++++++++++++++++++++++-----------
 1 file changed, 86 insertions(+), 35 deletions(-)

diff --git a/xen/include/xen/unaligned.h b/xen/include/xen/unaligned.h
index 0a2b16d05d..325d9f875f 100644
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
 
@@ -15,67 +7,126 @@
 #include <asm/byteorder.h>
 #endif
 
-#define get_unaligned(p) (*(p))
-#define put_unaligned(val, p) (*(p) = (val))
+/*
+ * This is the most generic implementation of unaligned accesses
+ * and should work almost anywhere.
+ */
+
+#define __get_unaligned_t(type, ptr) ({						\
+	const struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);	\
+	__pptr->x;								\
+})
+
+#define __put_unaligned_t(type, val, ptr) do {					\
+	struct { type x; } __packed *__pptr = (typeof(__pptr))(ptr);		\
+	__pptr->x = (val);							\
+} while (0)
+
+#define get_unaligned(ptr)	__get_unaligned_t(typeof(*(ptr)), (ptr))
+#define put_unaligned(val, ptr) __put_unaligned_t(typeof(*(ptr)), (val), (ptr))
+
+static inline u16 get_unaligned_le16(const void *p)
+{
+	return le16_to_cpu(__get_unaligned_t(__le16, p));
+}
+
+static inline u32 get_unaligned_le32(const void *p)
+{
+	return le32_to_cpu(__get_unaligned_t(__le32, p));
+}
+
+static inline u64 get_unaligned_le64(const void *p)
+{
+	return le64_to_cpu(__get_unaligned_t(__le64, p));
+}
+
+static inline void put_unaligned_le16(u16 val, void *p)
+{
+	__put_unaligned_t(__le16, cpu_to_le16(val), p);
+}
+
+static inline void put_unaligned_le32(u32 val, void *p)
+{
+	__put_unaligned_t(__le32, cpu_to_le32(val), p);
+}
+
+static inline void put_unaligned_le64(u64 val, void *p)
+{
+	__put_unaligned_t(__le64, cpu_to_le64(val), p);
+}
+
+static inline u16 get_unaligned_be16(const void *p)
+{
+	return be16_to_cpu(__get_unaligned_t(__be16, p));
+}
+
+static inline u32 get_unaligned_be32(const void *p)
+{
+	return be32_to_cpu(__get_unaligned_t(__be32, p));
+}
 
-static inline uint16_t get_unaligned_be16(const void *p)
+static inline u64 get_unaligned_be64(const void *p)
 {
-	return be16_to_cpup(p);
+	return be64_to_cpu(__get_unaligned_t(__be64, p));
 }
 
-static inline void put_unaligned_be16(uint16_t val, void *p)
+static inline void put_unaligned_be16(u16 val, void *p)
 {
-	*(__force __be16*)p = cpu_to_be16(val);
+	__put_unaligned_t(__be16, cpu_to_be16(val), p);
 }
 
-static inline uint32_t get_unaligned_be32(const void *p)
+static inline void put_unaligned_be32(u32 val, void *p)
 {
-	return be32_to_cpup(p);
+	__put_unaligned_t(__be32, cpu_to_be32(val), p);
 }
 
-static inline void put_unaligned_be32(uint32_t val, void *p)
+static inline void put_unaligned_be64(u64 val, void *p)
 {
-	*(__force __be32*)p = cpu_to_be32(val);
+	__put_unaligned_t(__be64, cpu_to_be64(val), p);
 }
 
-static inline uint64_t get_unaligned_be64(const void *p)
+static inline u32 __get_unaligned_be24(const u8 *p)
 {
-	return be64_to_cpup(p);
+	return p[0] << 16 | p[1] << 8 | p[2];
 }
 
-static inline void put_unaligned_be64(uint64_t val, void *p)
+static inline u32 get_unaligned_be24(const void *p)
 {
-	*(__force __be64*)p = cpu_to_be64(val);
+	return __get_unaligned_be24(p);
 }
 
-static inline uint16_t get_unaligned_le16(const void *p)
+static inline u32 __get_unaligned_le24(const u8 *p)
 {
-	return le16_to_cpup(p);
+	return p[0] | p[1] << 8 | p[2] << 16;
 }
 
-static inline void put_unaligned_le16(uint16_t val, void *p)
+static inline u32 get_unaligned_le24(const void *p)
 {
-	*(__force __le16*)p = cpu_to_le16(val);
+	return __get_unaligned_le24(p);
 }
 
-static inline uint32_t get_unaligned_le32(const void *p)
+static inline void __put_unaligned_be24(const u32 val, u8 *p)
 {
-	return le32_to_cpup(p);
+	*p++ = val >> 16;
+	*p++ = val >> 8;
+	*p++ = val;
 }
 
-static inline void put_unaligned_le32(uint32_t val, void *p)
+static inline void put_unaligned_be24(const u32 val, void *p)
 {
-	*(__force __le32*)p = cpu_to_le32(val);
+	__put_unaligned_be24(val, p);
 }
 
-static inline uint64_t get_unaligned_le64(const void *p)
+static inline void __put_unaligned_le24(const u32 val, u8 *p)
 {
-	return le64_to_cpup(p);
+	*p++ = val;
+	*p++ = val >> 8;
+	*p++ = val >> 16;
 }
 
-static inline void put_unaligned_le64(uint64_t val, void *p)
+static inline void put_unaligned_le24(const u32 val, void *p)
 {
-	*(__force __le64*)p = cpu_to_le64(val);
+	__put_unaligned_le24(val, p);
 }
 
 #endif /* __XEN_UNALIGNED_H__ */
-- 
2.35.3


