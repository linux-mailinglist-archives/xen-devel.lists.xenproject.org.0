Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3867FEBBF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 10:21:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644498.1005577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dEX-0003ad-Fl; Thu, 30 Nov 2023 09:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644498.1005577; Thu, 30 Nov 2023 09:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8dEX-0003Yj-Ct; Thu, 30 Nov 2023 09:21:21 +0000
Received: by outflank-mailman (input) for mailman id 644498;
 Thu, 30 Nov 2023 09:21:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XJ9b=HL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r8dEW-0003Yb-33
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 09:21:20 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d10203cc-8f61-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 10:21:18 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9D9B01FBF2;
 Thu, 30 Nov 2023 09:21:16 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 60A7D138E5;
 Thu, 30 Nov 2023 09:21:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id Z9z0FQxUaGVrJAAAn2gu4w
 (envelope-from <jgross@suse.com>); Thu, 30 Nov 2023 09:21:16 +0000
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
X-Inumbo-ID: d10203cc-8f61-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1701336076; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=1OMKkY8bQ2/LZ8aJZbHy9ZvWT+Sx/rf3KpaWrf6x2LI=;
	b=FGNNzA2RzuOEN0y1pf9RAd5dUQWxp0hu3e69ckOV1DtnEnolUM8lmuYt2rp+YJoViMEyie
	g8KNiXGoGxPANJR29tGnVwwO/IEbOrr9sznTVfKqrhO7jrzVJNYjqctoaTXRZcX/E2tQ4M
	VsnQjIQ1QAVG9Asc32O7ktAiNG6Efqo=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/public: fix flexible array definitions
Date: Thu, 30 Nov 2023 10:21:12 +0100
Message-Id: <20231130092112.18118-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: *********
X-Spam-Score: 9.00
X-Spamd-Result: default: False [9.00 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 BAYES_SPAM(5.10)[100.00%];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.com:s=susede1];
	 RCPT_COUNT_SEVEN(0.00)[8];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO

Flexible arrays in public headers can be problematic with some
compilers.

With XEN_FLEX_ARRAY_DIM there is a mechanism available to deal with
this issue, but care must be taken to not change the affected structs
in an incompatible way.

So bump __XEN_LATEST_INTERFACE_VERSION__ and introduce a new macro
XENPV_FLEX_ARRAY_DIM which will be XENPV_FLEX_ARRAY_DIM with the
interface version being new enough and "1" (the value used today in
the affected headers) when the interface version is an old one.

Replace the arr[1] instances (this includes the ones seen to be
problematic in recent Linux kernels [1]) with arr[XENPV_FLEX_ARRAY_DIM]
in order to avoid compilation errors.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217693

Signed-off-by: Juergen Gross <jgross@suse.com>
---
V2:
- bump interface version and make change only for new version
  (Jan Beulich)
---
 xen/include/public/io/cameraif.h | 2 +-
 xen/include/public/io/displif.h  | 2 +-
 xen/include/public/io/fsif.h     | 4 ++--
 xen/include/public/io/pvcalls.h  | 2 +-
 xen/include/public/io/ring.h     | 5 +++--
 xen/include/public/io/sndif.h    | 2 +-
 xen/include/public/xen-compat.h  | 2 +-
 xen/include/public/xen.h         | 6 ++++++
 8 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/xen/include/public/io/cameraif.h b/xen/include/public/io/cameraif.h
index 13763abef9..a389443769 100644
--- a/xen/include/public/io/cameraif.h
+++ b/xen/include/public/io/cameraif.h
@@ -763,7 +763,7 @@ struct xencamera_buf_create_req {
  */
 struct xencamera_page_directory {
     grant_ref_t gref_dir_next_page;
-    grant_ref_t gref[1]; /* Variable length */
+    grant_ref_t gref[XENPV_FLEX_ARRAY_DIM];
 };
 
 /*
diff --git a/xen/include/public/io/displif.h b/xen/include/public/io/displif.h
index 73d0cbdf15..132c96fa5c 100644
--- a/xen/include/public/io/displif.h
+++ b/xen/include/public/io/displif.h
@@ -537,7 +537,7 @@ struct xendispl_dbuf_create_req {
 
 struct xendispl_page_directory {
     grant_ref_t gref_dir_next_page;
-    grant_ref_t gref[1]; /* Variable length */
+    grant_ref_t gref[XENPV_FLEX_ARRAY_DIM];
 };
 
 /*
diff --git a/xen/include/public/io/fsif.h b/xen/include/public/io/fsif.h
index ec57850233..dcade1c698 100644
--- a/xen/include/public/io/fsif.h
+++ b/xen/include/public/io/fsif.h
@@ -40,7 +40,7 @@ struct fsif_read_request {
     int32_t pad;
     uint64_t len;
     uint64_t offset;
-    grant_ref_t grefs[1];  /* Variable length */
+    grant_ref_t grefs[XENPV_FLEX_ARRAY_DIM];
 };
 
 struct fsif_write_request {
@@ -48,7 +48,7 @@ struct fsif_write_request {
     int32_t pad;
     uint64_t len;
     uint64_t offset;
-    grant_ref_t grefs[1];  /* Variable length */
+    grant_ref_t grefs[XENPV_FLEX_ARRAY_DIM];
 };
 
 struct fsif_stat_request {
diff --git a/xen/include/public/io/pvcalls.h b/xen/include/public/io/pvcalls.h
index 230b0719e3..af0e9abd13 100644
--- a/xen/include/public/io/pvcalls.h
+++ b/xen/include/public/io/pvcalls.h
@@ -30,7 +30,7 @@ struct pvcalls_data_intf {
     uint8_t pad2[52];
 
     RING_IDX ring_order;
-    grant_ref_t ref[];
+    grant_ref_t ref[XENPV_FLEX_ARRAY_DIM];
 };
 DEFINE_XEN_FLEX_RING(pvcalls);
 
diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index 0cae4367be..955fe5a1fc 100644
--- a/xen/include/public/io/ring.h
+++ b/xen/include/public/io/ring.h
@@ -25,6 +25,7 @@
  * and grant_table.h from the Xen public headers.
  */
 
+#include "../xen.h"
 #include "../xen-compat.h"
 
 #if __XEN_INTERFACE_VERSION__ < 0x00030208
@@ -110,7 +111,7 @@ struct __name##_sring {                                                 \
         uint8_t pvt_pad[4];                                             \
     } pvt;                                                              \
     uint8_t __pad[44];                                                  \
-    union __name##_sring_entry ring[1]; /* variable-length */           \
+    union __name##_sring_entry ring[XENPV_FLEX_ARRAY_DIM];              \
 };                                                                      \
                                                                         \
 /* "Front" end's private variables */                                   \
@@ -479,7 +480,7 @@ struct name##_data_intf {                                                     \
     uint8_t pad2[56];                                                         \
                                                                               \
     RING_IDX ring_order;                                                      \
-    grant_ref_t ref[];                                                        \
+    grant_ref_t ref[XENPV_FLEX_ARRAY_DIM];                                    \
 };                                                                            \
 DEFINE_XEN_FLEX_RING(name)
 
diff --git a/xen/include/public/io/sndif.h b/xen/include/public/io/sndif.h
index 4234a47c87..cce1459b7b 100644
--- a/xen/include/public/io/sndif.h
+++ b/xen/include/public/io/sndif.h
@@ -659,7 +659,7 @@ struct xensnd_open_req {
 
 struct xensnd_page_directory {
     grant_ref_t gref_dir_next_page;
-    grant_ref_t gref[1]; /* Variable length */
+    grant_ref_t gref[XENPV_FLEX_ARRAY_DIM];
 };
 
 /*
diff --git a/xen/include/public/xen-compat.h b/xen/include/public/xen-compat.h
index 97fe698498..078b796664 100644
--- a/xen/include/public/xen-compat.h
+++ b/xen/include/public/xen-compat.h
@@ -10,7 +10,7 @@
 #ifndef __XEN_PUBLIC_XEN_COMPAT_H__
 #define __XEN_PUBLIC_XEN_COMPAT_H__
 
-#define __XEN_LATEST_INTERFACE_VERSION__ 0x00040e00
+#define __XEN_LATEST_INTERFACE_VERSION__ 0x00041300
 
 #if defined(__XEN__) || defined(__XEN_TOOLS__)
 /* Xen is built with matching headers and implements the latest interface. */
diff --git a/xen/include/public/xen.h b/xen/include/public/xen.h
index b812a0a324..62c4b04fa2 100644
--- a/xen/include/public/xen.h
+++ b/xen/include/public/xen.h
@@ -46,6 +46,12 @@ DEFINE_XEN_GUEST_HANDLE(xen_ulong_t);
 #else
 #define XEN_FLEX_ARRAY_DIM  1 /* variable size */
 #endif
+/* Some PV I/O interfaces need a compatibility variant. */
+#if __XEN_INTERFACE_VERSION__ < 0x00041300
+#define XENPV_FLEX_ARRAY_DIM  1 /* variable size */
+#else
+#define XENPV_FLEX_ARRAY_DIM  XEN_FLEX_ARRAY_DIM
+#endif
 
 /* Turn a plain number into a C unsigned (long (long)) constant. */
 #define __xen_mk_uint(x)  x ## U
-- 
2.35.3


