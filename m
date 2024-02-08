Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05F084E596
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678351.1055533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7gt-0005tN-TA; Thu, 08 Feb 2024 16:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678351.1055533; Thu, 08 Feb 2024 16:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7gt-0005qq-Pf; Thu, 08 Feb 2024 16:55:59 +0000
Received: by outflank-mailman (input) for mailman id 678351;
 Thu, 08 Feb 2024 16:55:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m/2e=JR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rY7gt-0005q0-7M
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:55:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec934bea-c6a2-11ee-98f5-efadbce2ee36;
 Thu, 08 Feb 2024 17:55:55 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 00BB521F60;
 Thu,  8 Feb 2024 16:55:55 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B8C7A1326D;
 Thu,  8 Feb 2024 16:55:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id SfSmK5oHxWWmEwAAD6G6ig
 (envelope-from <jgross@suse.com>); Thu, 08 Feb 2024 16:55:54 +0000
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
X-Inumbo-ID: ec934bea-c6a2-11ee-98f5-efadbce2ee36
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v5 01/22] tools: add access macros for unaligned data
Date: Thu,  8 Feb 2024 17:55:25 +0100
Message-Id: <20240208165546.5715-2-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240208165546.5715-1-jgross@suse.com>
References: <20240208165546.5715-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	 REPLY(-4.00)[]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 00BB521F60
X-Spam-Flag: NO

Add the basic access macros for unaligned data to common-macros.h.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
V3:
- new patch
---
 tools/include/xen-tools/common-macros.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index e5ed603904..81fba2e9f5 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -79,6 +79,10 @@
 #define __must_check __attribute__((__warn_unused_result__))
 #endif
 
+#ifndef __packed
+#define __packed __attribute__((__packed__))
+#endif
+
 #define container_of(ptr, type, member) ({              \
     typeof(((type *)0)->member) *mptr__ = (ptr);        \
     (type *)((char *)mptr__ - offsetof(type, member));  \
@@ -87,4 +91,17 @@
 #define __AC(X, Y)   (X ## Y)
 #define _AC(X, Y)    __AC(X, Y)
 
+#define get_unaligned_t(type, ptr) ({                               \
+    const struct { type x; } __packed *ptr_ = (typeof(ptr_))(ptr);  \
+    ptr_->x;                                                        \
+})
+
+#define put_unaligned_t(type, val, ptr) do {                        \
+    struct { type x; } __packed *ptr_ = (typeof(ptr_))(ptr);        \
+    ptr_->x = val;                                                  \
+} while (0)
+
+#define get_unaligned(ptr)      get_unaligned_t(typeof(*(ptr)), ptr)
+#define put_unaligned(val, ptr) put_unaligned_t(typeof(*(ptr)), val, ptr)
+
 #endif	/* __XEN_TOOLS_COMMON_MACROS__ */
-- 
2.35.3


