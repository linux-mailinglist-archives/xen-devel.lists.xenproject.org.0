Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D65A306B7E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 04:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76532.138147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4xnt-0005s2-As; Thu, 28 Jan 2021 03:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76532.138147; Thu, 28 Jan 2021 03:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4xnt-0005rd-7h; Thu, 28 Jan 2021 03:17:05 +0000
Received: by outflank-mailman (input) for mailman id 76532;
 Thu, 28 Jan 2021 03:17:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PbJ/=G7=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1l4xnr-0005rY-T2
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 03:17:04 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98ee03ab-5e59-4af9-9a67-9851a0144fa8;
 Thu, 28 Jan 2021 03:17:01 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 92566A58;
 Wed, 27 Jan 2021 22:16:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 27 Jan 2021 22:16:59 -0500
Received: from localhost.localdomain (unknown [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 515BA24005A;
 Wed, 27 Jan 2021 22:16:58 -0500 (EST)
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
X-Inumbo-ID: 98ee03ab-5e59-4af9-9a67-9851a0144fa8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:message-id:mime-version:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=y0T1Vc
	1V0Ig+kuARWaAkRDwv3MeY9+FY4c0Gnmg3u2Q=; b=Stny4ZHZcVWIqndMZuzKxB
	RbhTDIOtLDX4f2xrTXtNDpMebVNq0glArwUuYs3l0c07500tbcqsclcYJ697osJe
	d4XSbE4wzrbnsh9TGBERzQ6nyfc2MMDLHFMEL7SxJ1N/Y1av6VQeWwpdVpkpdsri
	x48F1tDSqZid4j0Xg+pv9EMmTsDw39Tjb/Df63DvN8welgs8cPZx1kP+t3R4FUVA
	GA0FsuGPqa5NvImROfZOIREdpKMjt3nmt1UxIoYNSvAEkpJHO82qNKKQZ9pnZXaW
	AzBC1FVyOH1+pBrjOkhQ+Cwc1KOi8DlBDJLCf7wIMO+drDrjKve1sXpWzJwQCmmA
	==
X-ME-Sender: <xms:qiwSYG3siBao22_5b4RoSRLadp7HMWMautWF8Ywru13MzjVlJJnVAg>
    <xme:qiwSYJG0KF-_NPHbPvn72sWkkb9s3uRhQXVI9oZu_pSfGxQ_tF_EWGTA7r0abSCv9
    KrXWILE4L0MbA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdelgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofggtghogfesthekredtredtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveektdfg
    tddutdetffehheejhfduhfelhefhfffgjefgfeefvddugeeghfelgfdtnecuffhomhgrih
    hnpehgnhhurdhorhhgnecukfhppeeluddrieegrddujedtrdekleenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:qiwSYO5_m0EAZQYtkPAA_9iWui7K_ZCERtPPVWA4cwk7dod3t7VA1w>
    <xmx:qiwSYH24cDwiptJyEp8tFxKBuZvb8OWrFfE3ae8reYKMxLOjsGzQ4g>
    <xmx:qiwSYJGfPrewEaGfHi7QRO6xf6d-A5SBGI4r1dSU0OsFh0zG2jzbZQ>
    <xmx:qywSYIyIHiRCmrTXkfhOM45AMFe3Qkrg6SMBneW9ZIE3YlZMWYgSkw>
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] xen: Add RING_COPY_RESPONSE()
Date: Thu, 28 Jan 2021 04:16:53 +0100
Message-Id: <20210128031653.1640771-1-marmarek@invisiblethingslab.com>
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
 xen/include/public/io/ring.h | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/xen/include/public/io/ring.h b/xen/include/public/io/ring.h
index d68615ae2f67..b63d7362f0e9 100644
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
  * to be ineffective where _req is a struct which consists of only bitfields.
  */
-#define RING_COPY_REQUEST(_r, _idx, _req) do {				\
+#define RING_COPY_(action, _r, _idx, _req) do {				\
 	/* Use volatile to force the copy into _req. */			\
-	*(_req) = *(volatile typeof(_req))RING_GET_REQUEST(_r, _idx);	\
+	*(_req) = *(volatile typeof(_req))RING_GET_##action(_r, _idx);	\
 } while (0)
 
-#define RING_GET_RESPONSE(_r, _idx)                                     \
-    (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].rsp))
+#define RING_COPY_REQUEST(_r, _idx, _req)  RING_COPY_(REQUEST, _r, _idx, _req)
+#define RING_COPY_RESPONSE(_r, _idx, _req) RING_COPY_(RESPONSE, _r, _idx, _req)
 
 /* Loop termination condition: Would the specified index overflow the ring? */
 #define RING_REQUEST_CONS_OVERFLOW(_r, _cons)                           \
-- 
2.25.4


