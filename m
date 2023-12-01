Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5408009CA
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 12:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645466.1007629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r91Zi-0003jk-UZ; Fri, 01 Dec 2023 11:20:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645466.1007629; Fri, 01 Dec 2023 11:20:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r91Zi-0003gl-Qm; Fri, 01 Dec 2023 11:20:50 +0000
Received: by outflank-mailman (input) for mailman id 645466;
 Fri, 01 Dec 2023 11:20:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hHVa=HM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r91Zh-0003gZ-CS
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 11:20:49 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab1187b9-903b-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 12:20:44 +0100 (CET)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78DD921BDF;
 Fri,  1 Dec 2023 11:20:43 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 3491513928;
 Fri,  1 Dec 2023 11:20:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id cml6C4vBaWVJBwAAn2gu4w
 (envelope-from <jgross@suse.com>); Fri, 01 Dec 2023 11:20:43 +0000
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
X-Inumbo-ID: ab1187b9-903b-11ee-9b0f-b553b5be7939
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3] xen/public: fix flexible array definitions
Date: Fri,  1 Dec 2023 12:20:41 +0100
Message-Id: <20231201112041.5260-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: *******************
X-Spamd-Bar: +++++++++++++++++++
Authentication-Results: smtp-out1.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out1.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:98 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [19.10 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 RCVD_COUNT_THREE(0.00)[3];
	 BAYES_SPAM(5.10)[100.00%];
	 MX_GOOD(-0.01)[];
	 RCPT_COUNT_SEVEN(0.00)[10];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: 19.10
X-Rspamd-Queue-Id: 78DD921BDF
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
V3:
- move XENPV_FLEX_ARRAY_DIM definition to ring.h (Jan Beulich)
- fix 2 wrong XENPV_FLEX_ARRAY_DIM use cases (Julien Grall)
- add CHANGELOG.md entry (Andrew Cooper)
---
 CHANGELOG.md                     |  2 ++
 xen/include/public/io/cameraif.h |  2 +-
 xen/include/public/io/displif.h  |  2 +-
 xen/include/public/io/fsif.h     |  4 ++--
 xen/include/public/io/pvcalls.h  |  2 +-
 xen/include/public/io/ring.h     | 12 ++++++++++--
 xen/include/public/io/sndif.h    |  2 +-
 xen/include/public/xen-compat.h  |  2 +-
 8 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 4ecebb9f68..5ee5d41fc9 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -7,6 +7,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ## [4.19.0 UNRELEASED](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=staging) - TBD
 
 ### Changed
+ - Changed flexible array definitions in public I/O interface headers to not
+   use "1" as the number of array elements.
 
 ### Added
  - On x86:
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
index 230b0719e3..c8c7602470 100644
--- a/xen/include/public/io/pvcalls.h
+++ b/xen/include/public/io/pvcalls.h
@@ -30,7 +30,7 @@ struct pvcalls_data_intf {
     uint8_t pad2[52];
 
     RING_IDX ring_order;
-    grant_ref_t ref[];
+    grant_ref_t ref[XEN_FLEX_ARRAY_DIM];
 };
 DEFINE_XEN_FLEX_RING(pvcalls);
 
diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index 0cae4367be..a79d913142 100644
--- a/xen/include/public/io/ring.h
+++ b/xen/include/public/io/ring.h
@@ -25,8 +25,16 @@
  * and grant_table.h from the Xen public headers.
  */
 
+#include "../xen.h"
 #include "../xen-compat.h"
 
+/* Some PV I/O interfaces need a compatibility variant. */
+#if __XEN_INTERFACE_VERSION__ < 0x00041300
+#define XENPV_FLEX_ARRAY_DIM  1 /* variable size */
+#else
+#define XENPV_FLEX_ARRAY_DIM  XEN_FLEX_ARRAY_DIM
+#endif
+
 #if __XEN_INTERFACE_VERSION__ < 0x00030208
 #define xen_mb()  mb()
 #define xen_rmb() rmb()
@@ -110,7 +118,7 @@ struct __name##_sring {                                                 \
         uint8_t pvt_pad[4];                                             \
     } pvt;                                                              \
     uint8_t __pad[44];                                                  \
-    union __name##_sring_entry ring[1]; /* variable-length */           \
+    union __name##_sring_entry ring[XENPV_FLEX_ARRAY_DIM];              \
 };                                                                      \
                                                                         \
 /* "Front" end's private variables */                                   \
@@ -479,7 +487,7 @@ struct name##_data_intf {                                                     \
     uint8_t pad2[56];                                                         \
                                                                               \
     RING_IDX ring_order;                                                      \
-    grant_ref_t ref[];                                                        \
+    grant_ref_t ref[XEN_FLEX_ARRAY_DIM];                                      \
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
-- 
2.35.3


