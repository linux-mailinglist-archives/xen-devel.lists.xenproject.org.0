Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE546E2FB
	for <lists+xen-devel@lfdr.de>; Thu,  9 Dec 2021 08:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242702.419741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDYq-00034Q-HC; Thu, 09 Dec 2021 07:09:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242702.419741; Thu, 09 Dec 2021 07:09:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvDYq-00032F-E1; Thu, 09 Dec 2021 07:09:48 +0000
Received: by outflank-mailman (input) for mailman id 242702;
 Thu, 09 Dec 2021 07:09:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3cQP=Q2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mvDYo-000329-Ez
 for xen-devel@lists.xenproject.org; Thu, 09 Dec 2021 07:09:46 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc8f2812-58be-11ec-9d12-4777fae47e2b;
 Thu, 09 Dec 2021 08:09:45 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6139B1FD2A;
 Thu,  9 Dec 2021 07:09:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 29C3413CA2;
 Thu,  9 Dec 2021 07:09:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WJtNCLirsWHiKwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 09 Dec 2021 07:09:44 +0000
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
X-Inumbo-ID: fc8f2812-58be-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639033784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=4w2OxTiRKF8fsZOTqtPttgBYf/Bbn749xJXtOyx+d9U=;
	b=trKliYJ8P9UO8+iX0lVKnTVcOQjAzLqWUlInY0+XpcLTIbt1Qif6i/tvdzY52OIonhD4lO
	jOAygkGKB3K2siiK8zs/g6+L3tz2oC/jkvOAMq1fmxCiG11hC21A1JT5ClXCupMvOvqQzR
	/p0/kVA6WNjbSh2YzfQUT0/mYkjWl4k=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Manuel Bouyer <bouyer@antioche.eu.org>,
	Simon Kuenzer <simon.kuenzer@neclab.eu>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Date: Thu,  9 Dec 2021 08:09:42 +0100
Message-Id: <20211209070942.14469-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today RING_HAS_UNCONSUMED_*() macros are returning the number of
unconsumed requests or responses instead of a boolean as the name of
the macros would imply.

As this "feature" is already being used, rename the macros to
RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
future misuse let RING_HAS_UNCONSUMED_*() optionally really return a
boolean (can be activated by defining RING_HAS_UNCONSUMED_IS_BOOL).

Note that the known misuses need to be switched to the new
RING_NR_UNCONSUMED_*() macros when using this version of ring.h.

Cc: Roger Pau Monne <roger.pau@citrix.com>
Cc: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Simon Kuenzer <simon.kuenzer@neclab.eu>
Cc: Paul Durrant <paul@xen.org>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
I have checked Xen, Mini-OS, qemu, grub2, OVMF and Linux kernel for
misuses of the RING_HAS_UNCONSUMED_*() macros. There is currently only
one instance in the Linux kernel netback driver. The BSDs, UNIKRAFT
and Windows PV drivers should be checked for misuse, too.
V2: make RING_HAS_UNCONSUMED_*() returning a bool optional (Jan Beulich)
---
 xen/include/public/io/ring.h | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index c486c457e0..a7f492db39 100644
--- a/xen/include/public/io/ring.h
+++ b/xen/include/public/io/ring.h
@@ -208,11 +208,11 @@ typedef struct __name##_back_ring __name##_back_ring_t
     (RING_FREE_REQUESTS(_r) == 0)
 
 /* Test if there are outstanding messages to be processed on a ring. */
-#define RING_HAS_UNCONSUMED_RESPONSES(_r)                               \
+#define RING_NR_UNCONSUMED_RESPONSES(_r)                                \
     ((_r)->sring->rsp_prod - (_r)->rsp_cons)
 
 #ifdef __GNUC__
-#define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                             \
+#define RING_NR_UNCONSUMED_REQUESTS(_r) ({                              \
     unsigned int req = (_r)->sring->req_prod - (_r)->req_cons;          \
     unsigned int rsp = RING_SIZE(_r) -                                  \
         ((_r)->req_cons - (_r)->rsp_prod_pvt);                          \
@@ -220,13 +220,25 @@ typedef struct __name##_back_ring __name##_back_ring_t
 })
 #else
 /* Same as above, but without the nice GCC ({ ... }) syntax. */
-#define RING_HAS_UNCONSUMED_REQUESTS(_r)                                \
+#define RING_NR_UNCONSUMED_REQUESTS(_r)                                 \
     ((((_r)->sring->req_prod - (_r)->req_cons) <                        \
       (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt))) ?        \
      ((_r)->sring->req_prod - (_r)->req_cons) :                         \
      (RING_SIZE(_r) - ((_r)->req_cons - (_r)->rsp_prod_pvt)))
 #endif
 
+#ifdef RING_HAS_UNCONSUMED_IS_BOOL
+/*
+ * These variants should only be used in case no caller is abusing them for
+ * obtaining the number of unconsumed responses/requests.
+ */
+#define RING_HAS_UNCONSUMED_RESPONSES(_r) (!!RING_NR_UNCONSUMED_RESPONSES(_r))
+#define RING_HAS_UNCONSUMED_REQUESTS(_r)  (!!RING_NR_UNCONSUMED_REQUESTS(_r))
+#else
+#define RING_HAS_UNCONSUMED_RESPONSES(_r) RING_NR_UNCONSUMED_RESPONSES(_r)
+#define RING_HAS_UNCONSUMED_REQUESTS(_r)  RING_NR_UNCONSUMED_REQUESTS(_r)
+#endif
+
 /* Direct access to individual ring elements, by index. */
 #define RING_GET_REQUEST(_r, _idx)                                      \
     (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].req))
-- 
2.26.2


