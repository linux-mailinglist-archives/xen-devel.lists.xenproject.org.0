Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72C9307A0C
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 16:51:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77196.139673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l59ZC-0007tE-8m; Thu, 28 Jan 2021 15:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77196.139673; Thu, 28 Jan 2021 15:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l59ZC-0007sp-5h; Thu, 28 Jan 2021 15:50:42 +0000
Received: by outflank-mailman (input) for mailman id 77196;
 Thu, 28 Jan 2021 15:50:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PbJ/=G7=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1l59ZA-0007si-H0
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 15:50:40 +0000
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 529c10f2-c317-45d5-a6c6-c8e3bb363ecb;
 Thu, 28 Jan 2021 15:50:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id CC7DDF91;
 Thu, 28 Jan 2021 10:50:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 28 Jan 2021 10:50:38 -0500
Received: from localhost.localdomain (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id C2857108005F;
 Thu, 28 Jan 2021 10:50:36 -0500 (EST)
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
X-Inumbo-ID: 529c10f2-c317-45d5-a6c6-c8e3bb363ecb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mMVOiB
	8bOsRcCcf5zHKBzRgltgMyypiCoQQwy5fDtAc=; b=A6ggxBDbUsxCluPUPtFMf3
	LDq+PmFcyczOCBYPBfwdr09jS3+uRy1KVUEa/CaXq+IhLR4nRIU83XRKXiB5Tqoj
	0mnPgBGf4+2ycAGl8vSV/w2Z8LlbCSp/N8dR0Hrqwj+9FSqY0QksvwgqNgCOZqmU
	Vvky+i1eLci4P8GM1j0rDpU9Hr+mU6ZQhvq9QCZxNpe+j1MiYrsleXScKNzJ9t3R
	b0ut37nBiIDhpg06mdm5fBemHDgjEsKaI3ksbegU5T3LZes1QRqvJXlLmw967Ka+
	AEFYYYNS/g7vQIR7UlugmXRgSfOZ175Srf/H+wVmccNH8uX/2W8dlDV4QzMuOs/A
	==
X-ME-Sender: <xms:Td0SYF8JtgOVKJHWBen0rrMsZUvpM_-28NziD1FUBV3icuQV-h9FnA>
    <xme:Td0SYPPtC23GtmmcBMRF5yrH6qHrZDSy5MIa00_YiHibhzazq5VES9frZ8KahSrfn
    RGCzYEgKc0DOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofggtghogfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveektdfg
    tddutdetffehheejhfduhfelhefhfffgjefgfeefvddugeeghfelgfdtnecuffhomhgrih
    hnpehgnhhurdhorhhgnecukfhppeeluddrieegrddujedtrdekleenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Td0SYCF032ZTLGhJK8KRrX3sFLsVidX6pjiaulQ2UBe-32uZCJlT0g>
    <xmx:Td0SYNwlfwVp6JAYFUHZm80Rlod1dq_iKAhXmyBI9d5EoE9TQqxZFQ>
    <xmx:Td0SYDpFYZRXhtJ3yBQxi4ye1HOB0udQ-N7IThceIgyrpDksnaH6vg>
    <xmx:Td0SYIE04R4sYN6C-dAi2xhbEF1JpMkibBkPacrUPN7KkyTpy7mY5w>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2] xen: Add RING_COPY_RESPONSE()
Date: Thu, 28 Jan 2021 16:50:30 +0100
Message-Id: <20210128155030.1831483-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Invisible Things Lab
Content-Transfer-Encoding: 8bit

Using RING_GET_RESPONSE() on a shared ring is easy to use incorrectly
(i.e., by not considering that the other end may alter the data in the
shared ring while it is being inspected). Safe usage of a response
generally requires taking a local copy.

Provide a RING_COPY_RESPONSE() macro to use instead of
RING_GET_RESPONSE() and an open-coded memcpy().  This takes care of
ensuring that the copy is done correctly regardless of any possible
compiler optimizations.

Use a volatile source to prevent the compiler from reordering or
omitting the copy.

This generalizes similar RING_COPY_REQUEST() macro added in 3f20b8def0.

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
---
Changes in v2:
 - action -> type
 - drop leading underscores from macro parameters (keep it in
   RING_GET_RESPONSE for consistency with RING_GET_REQUEST)
---
 xen/include/public/io/ring.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index d68615ae2f67..d2129ed183ab 100644
--- a/xen/include/public/io/ring.h
+++ b/xen/include/public/io/ring.h
@@ -231,22 +231,25 @@ typedef struct __name##_back_ring __name##_back_ring_t
 #define RING_GET_REQUEST(_r, _idx)                                      \
     (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].req))
 
+#define RING_GET_RESPONSE(_r, _idx)                                     \
+    (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].rsp))
+
 /*
- * Get a local copy of a request.
+ * Get a local copy of a request/response.
  *
- * Use this in preference to RING_GET_REQUEST() so all processing is
+ * Use this in preference to RING_GET_{REQUEST,RESPONSE}() so all processing is
  * done on a local copy that cannot be modified by the other end.
  *
  * Note that https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 may cause this
- * to be ineffective where _req is a struct which consists of only bitfields.
+ * to be ineffective where dest is a struct which consists of only bitfields.
  */
-#define RING_COPY_REQUEST(_r, _idx, _req) do {				\
-	/* Use volatile to force the copy into _req. */			\
-	*(_req) = *(volatile typeof(_req))RING_GET_REQUEST(_r, _idx);	\
+#define RING_COPY_(type, r, idx, dest) do {				\
+	/* Use volatile to force the copy into dest. */			\
+	*(dest) = *(volatile typeof(dest))RING_GET_##type(r, idx);	\
 } while (0)
 
-#define RING_GET_RESPONSE(_r, _idx)                                     \
-    (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].rsp))
+#define RING_COPY_REQUEST(r, idx, req)  RING_COPY_(REQUEST, r, idx, req)
+#define RING_COPY_RESPONSE(r, idx, rsp) RING_COPY_(RESPONSE, r, idx, rsp)
 
 /* Loop termination condition: Would the specified index overflow the ring? */
 #define RING_REQUEST_CONS_OVERFLOW(_r, _cons)                           \
-- 
2.25.4


