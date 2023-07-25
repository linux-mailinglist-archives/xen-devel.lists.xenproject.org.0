Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B430D761AC2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 15:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569712.890697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOIW9-0007t8-Ma; Tue, 25 Jul 2023 13:56:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569712.890697; Tue, 25 Jul 2023 13:56:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOIW9-0007qv-Jz; Tue, 25 Jul 2023 13:56:01 +0000
Received: by outflank-mailman (input) for mailman id 569712;
 Tue, 25 Jul 2023 13:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aw78=DL=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qOIW8-0007qp-TP
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 13:56:00 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc1eaa03-2af2-11ee-b23f-6b7b168915f2;
 Tue, 25 Jul 2023 15:55:59 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 519E91FD65;
 Tue, 25 Jul 2023 13:55:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2CB8E13487;
 Tue, 25 Jul 2023 13:55:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c+IrCW/Uv2SEcAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 25 Jul 2023 13:55:59 +0000
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
X-Inumbo-ID: fc1eaa03-2af2-11ee-b23f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1690293359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=jUKVQwiBVg5c8tP4oa1JbpgaUtbxTHSXSrceFPdKKlw=;
	b=jVIMgYDPsjOyxMn6nWgvP+3TMO5OlLo8fH/xCaqM8yAViIKje2rwb9jJz6gSJU2uxTIRTN
	kxMs6w8VnrqIR1QOSk9uGbseucZ+KaW8dBXXIekVi9LYa2r43c+AAgWzF8BWvR1OMSuH0s
	1moEONLCpGBGDYzJQKTdPvwDD8zdpq0=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen/public: fix flexible array definitions
Date: Tue, 25 Jul 2023 15:55:57 +0200
Message-Id: <20230725135557.20518-1-jgross@suse.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Flexible arrays in public headers can be problematic with some
compilers.

Replace them with arr[XEN_FLEX_ARRAY_DIM] in order to avoid compilation
errors.

This includes arrays defined as "arr[1]", as seen with a recent Linux
kernel [1].

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217693

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/include/public/io/cameraif.h | 2 +-
 xen/include/public/io/displif.h  | 2 +-
 xen/include/public/io/fsif.h     | 4 ++--
 xen/include/public/io/pvcalls.h  | 2 +-
 xen/include/public/io/ring.h     | 4 ++--
 xen/include/public/io/sndif.h    | 2 +-
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/include/public/io/cameraif.h b/xen/include/public/io/cameraif.h
index 13763abef9..d6c69d6e1c 100644
--- a/xen/include/public/io/cameraif.h
+++ b/xen/include/public/io/cameraif.h
@@ -763,7 +763,7 @@ struct xencamera_buf_create_req {
  */
 struct xencamera_page_directory {
     grant_ref_t gref_dir_next_page;
-    grant_ref_t gref[1]; /* Variable length */
+    grant_ref_t gref[XEN_FLEX_ARRAY_DIM];
 };
 
 /*
diff --git a/xen/include/public/io/displif.h b/xen/include/public/io/displif.h
index 73d0cbdf15..4b9a27e960 100644
--- a/xen/include/public/io/displif.h
+++ b/xen/include/public/io/displif.h
@@ -537,7 +537,7 @@ struct xendispl_dbuf_create_req {
 
 struct xendispl_page_directory {
     grant_ref_t gref_dir_next_page;
-    grant_ref_t gref[1]; /* Variable length */
+    grant_ref_t gref[XEN_FLEX_ARRAY_DIM];
 };
 
 /*
diff --git a/xen/include/public/io/fsif.h b/xen/include/public/io/fsif.h
index ec57850233..0e1fba994a 100644
--- a/xen/include/public/io/fsif.h
+++ b/xen/include/public/io/fsif.h
@@ -40,7 +40,7 @@ struct fsif_read_request {
     int32_t pad;
     uint64_t len;
     uint64_t offset;
-    grant_ref_t grefs[1];  /* Variable length */
+    grant_ref_t grefs[XEN_FLEX_ARRAY_DIM];
 };
 
 struct fsif_write_request {
@@ -48,7 +48,7 @@ struct fsif_write_request {
     int32_t pad;
     uint64_t len;
     uint64_t offset;
-    grant_ref_t grefs[1];  /* Variable length */
+    grant_ref_t grefs[XEN_FLEX_ARRAY_DIM];
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
index 0cae4367be..fa43396318 100644
--- a/xen/include/public/io/ring.h
+++ b/xen/include/public/io/ring.h
@@ -110,7 +110,7 @@ struct __name##_sring {                                                 \
         uint8_t pvt_pad[4];                                             \
     } pvt;                                                              \
     uint8_t __pad[44];                                                  \
-    union __name##_sring_entry ring[1]; /* variable-length */           \
+    union __name##_sring_entry ring[XEN_FLEX_ARRAY_DIM];                \
 };                                                                      \
                                                                         \
 /* "Front" end's private variables */                                   \
@@ -479,7 +479,7 @@ struct name##_data_intf {                                                     \
     uint8_t pad2[56];                                                         \
                                                                               \
     RING_IDX ring_order;                                                      \
-    grant_ref_t ref[];                                                        \
+    grant_ref_t ref[XEN_FLEX_ARRAY_DIM];                                      \
 };                                                                            \
 DEFINE_XEN_FLEX_RING(name)
 
diff --git a/xen/include/public/io/sndif.h b/xen/include/public/io/sndif.h
index 4234a47c87..32f1fde4d6 100644
--- a/xen/include/public/io/sndif.h
+++ b/xen/include/public/io/sndif.h
@@ -659,7 +659,7 @@ struct xensnd_open_req {
 
 struct xensnd_page_directory {
     grant_ref_t gref_dir_next_page;
-    grant_ref_t gref[1]; /* Variable length */
+    grant_ref_t gref[XEN_FLEX_ARRAY_DIM];
 };
 
 /*
-- 
2.35.3


