Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE8F80F26D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 17:27:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.653308.1019747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5bH-0000ar-6Z; Tue, 12 Dec 2023 16:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 653308.1019747; Tue, 12 Dec 2023 16:27:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rD5bH-0000YB-3W; Tue, 12 Dec 2023 16:27:15 +0000
Received: by outflank-mailman (input) for mailman id 653308;
 Tue, 12 Dec 2023 16:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/k62=HX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rD5bF-0000XE-EQ
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 16:27:13 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4cd1a579-990b-11ee-9b0f-b553b5be7939;
 Tue, 12 Dec 2023 17:27:11 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 43D2A21F06;
 Tue, 12 Dec 2023 16:27:10 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 015EC139E9;
 Tue, 12 Dec 2023 16:27:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Alm3Ot2JeGUreQAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 12 Dec 2023 16:27:09 +0000
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
X-Inumbo-ID: 4cd1a579-990b-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702398430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86skB7BjO7pb6ks2XuLnugv1xzPDmhX3gUL9EVmPitE=;
	b=CP7oBF3Aypk7HX6jqMcEIdyr+6Fmtcm9VRxVnEsS5uqDwZavzScKKufVZhTlW6S5JDaDuB
	JHIQDj66YIZIbDl4B54jP4DxZUHh+yJcaEMK7yvMwaHJ6/zwF3nIw/68iB/NpZv1GAQPHp
	+wYVCa1FlbwhMGnX3ewdCepYyz8tCwg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1702398430; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=86skB7BjO7pb6ks2XuLnugv1xzPDmhX3gUL9EVmPitE=;
	b=CP7oBF3Aypk7HX6jqMcEIdyr+6Fmtcm9VRxVnEsS5uqDwZavzScKKufVZhTlW6S5JDaDuB
	JHIQDj66YIZIbDl4B54jP4DxZUHh+yJcaEMK7yvMwaHJ6/zwF3nIw/68iB/NpZv1GAQPHp
	+wYVCa1FlbwhMGnX3ewdCepYyz8tCwg=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 1/2] xen: make include/xen/unaligned.h usable on all architectures
Date: Tue, 12 Dec 2023 17:27:01 +0100
Message-Id: <20231212162702.26360-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231212162702.26360-1-jgross@suse.com>
References: <20231212162702.26360-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: ***************
X-Spam-Flag: YES
X-Spam-Score: 15.00
X-Spam-Level: 
X-Rspamd-Server: rspamd1
X-Rspamd-Queue-Id: 43D2A21F06
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=CP7oBF3A;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Spamd-Result: default: False [-3.31 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_TRACE(0.00)[suse.com:+];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 DMARC_POLICY_ALLOW(0.00)[suse.com,quarantine];
	 DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 R_SPF_FAIL(0.00)[-all];
	 R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	 SPAM_FLAG(5.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 WHITELIST_DMARC(-7.00)[suse.com:D:+];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:98:from];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -3.31

Instead of defining get_unaligned() and put_unaligned() in a way that
is only supporting architectures allowing unaligned accesses, use the
same approach as the Linux kernel and let the compiler do the
decision how to generate the code for probably unaligned data accesses.

Update include/xen/unaligned.h from include/asm-generic/unaligned.h of
the Linux kernel.

The generated code has been checked to be the same on x86.

Modify the Linux variant to not use underscore prefixed identifiers,
avoid unneeded parentheses and drop the 24-bit accessors.

Add the definition of __packed to xg_dom_decompress_unsafe_zstd.c in
libxenguest as it is using a cruel hack to reuse the hypervisor's
decompressing code for stubdom.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 803f4e1eab7a
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .../guest/xg_dom_decompress_unsafe_zstd.c     |  2 +-
 xen/include/xen/unaligned.h                   | 53 +++++++++++--------
 2 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
index 01eafaaaa6..7cd266444b 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
@@ -26,13 +26,13 @@ typedef uint64_t __be64;
 #define __force
 #define always_inline
 #define noinline
+#define __packed __attribute__((__packed__))
 
 #undef ERROR
 
 #define __BYTEORDER_HAS_U64__
 #define __TYPES_H__ /* xen/types.h guard */
 #include "../../xen/include/xen/byteorder/little_endian.h"
-#define __ASM_UNALIGNED_H__ /* asm/unaligned.h guard */
 #include "../../xen/include/xen/unaligned.h"
 #include "../../xen/include/xen/xxhash.h"
 #include "../../xen/lib/xxhash64.c"
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


