Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 469AA45E825
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 07:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232301.402694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqV9K-0003zL-PX; Fri, 26 Nov 2021 06:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232301.402694; Fri, 26 Nov 2021 06:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqV9K-0003vt-JC; Fri, 26 Nov 2021 06:55:58 +0000
Received: by outflank-mailman (input) for mailman id 232301;
 Fri, 26 Nov 2021 06:55:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8kDD=QN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mqV9I-0003vn-VL
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 06:55:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4b2545f-4e85-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 07:55:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 590F21FD37;
 Fri, 26 Nov 2021 06:55:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2216B13BA3;
 Fri, 26 Nov 2021 06:55:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 59EgB/eEoGHOfQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 26 Nov 2021 06:55:51 +0000
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
X-Inumbo-ID: e4b2545f-4e85-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637909751; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=baghIJkaLpAIIpbA+c/0OfwhttNXFlvxllx3gNgHEVY=;
	b=rlZEPNyDADhyMyTHDUE1+RLgSOuAFIK0j8zw+dbMBpdeGBb88QMRqEHLvB2VgJhyEWYAEy
	RpdGC7sE5Mc4D+zo3HzhR5gDZGbIp/OUk93ejmiTrHVZeVC3momPg9DQeaLVwc0ao7PA3s
	FehOiIid/ksFfJeM6zL3lLGtCGIkEp8=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Manuel Bouyer <bouyer@antioche.eu.org>,
	Simon Kuenzer <simon.kuenzer@neclab.eu>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH] public: add RING_NR_UNCONSUMED_*() macros to ring.h
Date: Fri, 26 Nov 2021 07:55:47 +0100
Message-Id: <20211126065547.22644-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Today RING_HAS_UNCONSUMED_*() macros are returning the number of
unconsumed requests or responses instead of a boolean as the name of
the macros would imply.

As this "feature" is already being used, rename the macros to
RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
future misuse let RING_HAS_UNCONSUMED_*() really return a boolean.

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
---
 xen/include/public/io/ring.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index c486c457e0..efbc152174 100644
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
@@ -220,13 +220,16 @@ typedef struct __name##_back_ring __name##_back_ring_t
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
 
+#define RING_HAS_UNCONSUMED_RESPONSES(_r) (!!RING_NR_UNCONSUMED_RESPONSES(_r))
+#define RING_HAS_UNCONSUMED_REQUESTS(_r)  (!!RING_NR_UNCONSUMED_REQUESTS(_r))
+
 /* Direct access to individual ring elements, by index. */
 #define RING_GET_REQUEST(_r, _idx)                                      \
     (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].req))
-- 
2.26.2


