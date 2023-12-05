Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD77E804FD5
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 11:08:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647514.1010723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rASLc-0006LH-PP; Tue, 05 Dec 2023 10:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647514.1010723; Tue, 05 Dec 2023 10:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rASLc-0006Ie-MF; Tue, 05 Dec 2023 10:08:12 +0000
Received: by outflank-mailman (input) for mailman id 647514;
 Tue, 05 Dec 2023 10:08:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mnjk=HQ=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rASLa-0005zz-OG
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 10:08:10 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 313a06f1-9356-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 11:08:10 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9440122060;
 Tue,  5 Dec 2023 10:08:09 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 559D3138FF;
 Tue,  5 Dec 2023 10:08:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id T0yiE4n2bmUIMQAAn2gu4w
 (envelope-from <jgross@suse.com>); Tue, 05 Dec 2023 10:08:09 +0000
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
X-Inumbo-ID: 313a06f1-9356-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701770889; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lq6Aix92m1tHhsIqJbDqfDfy3efyJN8pLKRv9vH1cNQ=;
	b=pBEvvnH2FkEEI5TtKI0Dx+Q692w8oeck2k9zDaBZ2cXJy/i6X6dALwo1gCQQ71/NWJBxxj
	LNRNJpXIiq456Piw0CZupK/zz3tOMn8b6ThMWH4T3S5f2t4DuPNh7SJzR42FvfbzVpC/F/
	AJRCnLHEmH7+gK8w+1OGcER8dOcO36A=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/2] xen: remove asm/unaligned.h
Date: Tue,  5 Dec 2023 11:07:56 +0100
Message-Id: <20231205100756.18920-3-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231205100756.18920-1-jgross@suse.com>
References: <20231205100756.18920-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Score: 4.80
X-Spam-Level: ****
X-Spamd-Result: default: False [4.80 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
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
	 RCVD_TLS_ALL(0.00)[]

With include/xen/unaligned.h now dealing properly with unaligned
accesses for all architectures, asm/unaligned.h can be removed and
users can be switched to include xen/unaligned.h instead.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/arch/x86/include/asm/unaligned.h | 6 ------
 xen/common/lz4/defs.h                | 2 +-
 xen/common/lzo.c                     | 2 +-
 xen/common/unlzo.c                   | 2 +-
 xen/common/xz/private.h              | 2 +-
 xen/common/zstd/mem.h                | 2 +-
 xen/lib/xxhash32.c                   | 2 +-
 xen/lib/xxhash64.c                   | 2 +-
 8 files changed, 7 insertions(+), 13 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/unaligned.h

diff --git a/xen/arch/x86/include/asm/unaligned.h b/xen/arch/x86/include/asm/unaligned.h
deleted file mode 100644
index 6070801d4a..0000000000
--- a/xen/arch/x86/include/asm/unaligned.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef __ASM_UNALIGNED_H__
-#define __ASM_UNALIGNED_H__
-
-#include <xen/unaligned.h>
-
-#endif /* __ASM_UNALIGNED_H__ */
diff --git a/xen/common/lz4/defs.h b/xen/common/lz4/defs.h
index 10609f5a53..6d81113266 100644
--- a/xen/common/lz4/defs.h
+++ b/xen/common/lz4/defs.h
@@ -10,7 +10,7 @@
 
 #ifdef __XEN__
 #include <asm/byteorder.h>
-#include <asm/unaligned.h>
+#include <xen/unaligned.h>
 #else
 
 static inline u16 get_unaligned_le16(const void *p)
diff --git a/xen/common/lzo.c b/xen/common/lzo.c
index a87c76dded..cc03f0f554 100644
--- a/xen/common/lzo.c
+++ b/xen/common/lzo.c
@@ -97,7 +97,7 @@
 #ifdef __XEN__
 #include <xen/lib.h>
 #include <asm/byteorder.h>
-#include <asm/unaligned.h>
+#include <xen/unaligned.h>
 #else
 #define get_unaligned_le16(_p) (*(u16 *)(_p))
 #endif
diff --git a/xen/common/unlzo.c b/xen/common/unlzo.c
index 74056778eb..bdcefa95b3 100644
--- a/xen/common/unlzo.c
+++ b/xen/common/unlzo.c
@@ -34,7 +34,7 @@
 
 #ifdef __XEN__
 #include <asm/byteorder.h>
-#include <asm/unaligned.h>
+#include <xen/unaligned.h>
 #else
 
 static inline u16 get_unaligned_be16(const void *p)
diff --git a/xen/common/xz/private.h b/xen/common/xz/private.h
index e6814250e8..2299705378 100644
--- a/xen/common/xz/private.h
+++ b/xen/common/xz/private.h
@@ -13,7 +13,7 @@
 #ifdef __XEN__
 #include <xen/kernel.h>
 #include <asm/byteorder.h>
-#include <asm/unaligned.h>
+#include <xen/unaligned.h>
 #else
 
 static inline u32 get_unaligned_le32(const void *p)
diff --git a/xen/common/zstd/mem.h b/xen/common/zstd/mem.h
index 2acae6a8ed..ae1e305126 100644
--- a/xen/common/zstd/mem.h
+++ b/xen/common/zstd/mem.h
@@ -23,7 +23,7 @@
 #ifdef __XEN__
 #include <xen/string.h> /* memcpy */
 #include <xen/types.h>  /* size_t, ptrdiff_t */
-#include <asm/unaligned.h>
+#include <xen/unaligned.h>
 #endif
 
 /*-****************************************
diff --git a/xen/lib/xxhash32.c b/xen/lib/xxhash32.c
index e8d403e5ce..32efa651c5 100644
--- a/xen/lib/xxhash32.c
+++ b/xen/lib/xxhash32.c
@@ -42,7 +42,7 @@
 #include <xen/errno.h>
 #include <xen/string.h>
 #include <xen/xxhash.h>
-#include <asm/unaligned.h>
+#include <xen/unaligned.h>
 
 /*-*************************************
  * Macros
diff --git a/xen/lib/xxhash64.c b/xen/lib/xxhash64.c
index 481e76fbcf..1858e236fe 100644
--- a/xen/lib/xxhash64.c
+++ b/xen/lib/xxhash64.c
@@ -43,7 +43,7 @@
 #include <xen/errno.h>
 #include <xen/string.h>
 #include <xen/xxhash.h>
-#include <asm/unaligned.h>
+#include <xen/unaligned.h>
 #endif
 
 /*-*************************************
-- 
2.35.3


