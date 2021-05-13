Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D1737F539
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 12:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126808.238311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8BX-0004sO-BZ; Thu, 13 May 2021 10:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126808.238311; Thu, 13 May 2021 10:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh8BX-0004oW-7T; Thu, 13 May 2021 10:03:15 +0000
Received: by outflank-mailman (input) for mailman id 126808;
 Thu, 13 May 2021 10:03:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KipV=KI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lh8BV-0003vw-Lh
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 10:03:13 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a9dd3b9-34ba-4a9b-a670-7154e734e457;
 Thu, 13 May 2021 10:03:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 845DCAFD5;
 Thu, 13 May 2021 10:03:05 +0000 (UTC)
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
X-Inumbo-ID: 4a9dd3b9-34ba-4a9b-a670-7154e734e457
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620900185; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gN4/rgxtzqVWaIyPGz03VdvKju8BDVEvYHrK0+8yrQE=;
	b=Qh2deAEmR6Q8nSdsLJ8lUqzSI4K8jVie2Wh3Br1Tzx8DdAbZnb/EnLyq49zG2YnzxnMmhO
	ois/KXtSxCCBenc/q1t5Iv0v7UKfC8/S5vxSR2UKSCur51mtgyGPzlCDf4DKCiLICMO1/r
	zHOzmGakvaDZYd99BPsLX5sz4brlCkU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 1/8] xen: sync include/xen/interface/io/ring.h with Xen's newest version
Date: Thu, 13 May 2021 12:02:55 +0200
Message-Id: <20210513100302.22027-2-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210513100302.22027-1-jgross@suse.com>
References: <20210513100302.22027-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sync include/xen/interface/io/ring.h with Xen's newest version in
order to get the RING_COPY_RESPONSE() and RING_RESPONSE_PROD_OVERFLOW()
macros.

Note that this will correct the wrong license info by adding the
missing original copyright notice.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 include/xen/interface/io/ring.h | 278 ++++++++++++++++++--------------
 1 file changed, 156 insertions(+), 122 deletions(-)

diff --git a/include/xen/interface/io/ring.h b/include/xen/interface/io/ring.h
index 2af7a1cd6658..b39cdbc522ec 100644
--- a/include/xen/interface/io/ring.h
+++ b/include/xen/interface/io/ring.h
@@ -1,21 +1,53 @@
-/* SPDX-License-Identifier: GPL-2.0 */
 /******************************************************************************
  * ring.h
  *
  * Shared producer-consumer ring macros.
  *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to
+ * deal in the Software without restriction, including without limitation the
+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
+ * sell copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
+ * DEALINGS IN THE SOFTWARE.
+ *
  * Tim Deegan and Andrew Warfield November 2004.
  */
 
 #ifndef __XEN_PUBLIC_IO_RING_H__
 #define __XEN_PUBLIC_IO_RING_H__
 
+/*
+ * When #include'ing this header, you need to provide the following
+ * declaration upfront:
+ * - standard integers types (uint8_t, uint16_t, etc)
+ * They are provided by stdint.h of the standard headers.
+ *
+ * In addition, if you intend to use the FLEX macros, you also need to
+ * provide the following, before invoking the FLEX macros:
+ * - size_t
+ * - memcpy
+ * - grant_ref_t
+ * These declarations are provided by string.h of the standard headers,
+ * and grant_table.h from the Xen public headers.
+ */
+
 #include <xen/interface/grant_table.h>
 
 typedef unsigned int RING_IDX;
 
 /* Round a 32-bit unsigned constant down to the nearest power of two. */
-#define __RD2(_x)  (((_x) & 0x00000002) ? 0x2		       : ((_x) & 0x1))
+#define __RD2(_x)  (((_x) & 0x00000002) ? 0x2                  : ((_x) & 0x1))
 #define __RD4(_x)  (((_x) & 0x0000000c) ? __RD2((_x)>>2)<<2    : __RD2(_x))
 #define __RD8(_x)  (((_x) & 0x000000f0) ? __RD4((_x)>>4)<<4    : __RD4(_x))
 #define __RD16(_x) (((_x) & 0x0000ff00) ? __RD8((_x)>>8)<<8    : __RD8(_x))
@@ -27,82 +59,79 @@ typedef unsigned int RING_IDX;
  * A ring contains as many entries as will fit, rounded down to the nearest
  * power of two (so we can mask with (size-1) to loop around).
  */
-#define __CONST_RING_SIZE(_s, _sz)				\
-	(__RD32(((_sz) - offsetof(struct _s##_sring, ring)) /	\
-		sizeof(((struct _s##_sring *)0)->ring[0])))
-
+#define __CONST_RING_SIZE(_s, _sz) \
+    (__RD32(((_sz) - offsetof(struct _s##_sring, ring)) / \
+	    sizeof(((struct _s##_sring *)0)->ring[0])))
 /*
  * The same for passing in an actual pointer instead of a name tag.
  */
-#define __RING_SIZE(_s, _sz)						\
-	(__RD32(((_sz) - (long)&(_s)->ring + (long)(_s)) / sizeof((_s)->ring[0])))
+#define __RING_SIZE(_s, _sz) \
+    (__RD32(((_sz) - (long)(_s)->ring + (long)(_s)) / sizeof((_s)->ring[0])))
 
 /*
  * Macros to make the correct C datatypes for a new kind of ring.
  *
  * To make a new ring datatype, you need to have two message structures,
- * let's say struct request, and struct response already defined.
+ * let's say request_t, and response_t already defined.
  *
  * In a header where you want the ring datatype declared, you then do:
  *
- *     DEFINE_RING_TYPES(mytag, struct request, struct response);
+ *     DEFINE_RING_TYPES(mytag, request_t, response_t);
  *
  * These expand out to give you a set of types, as you can see below.
  * The most important of these are:
  *
- *     struct mytag_sring      - The shared ring.
- *     struct mytag_front_ring - The 'front' half of the ring.
- *     struct mytag_back_ring  - The 'back' half of the ring.
+ *     mytag_sring_t      - The shared ring.
+ *     mytag_front_ring_t - The 'front' half of the ring.
+ *     mytag_back_ring_t  - The 'back' half of the ring.
  *
  * To initialize a ring in your code you need to know the location and size
  * of the shared memory area (PAGE_SIZE, for instance). To initialise
  * the front half:
  *
- *     struct mytag_front_ring front_ring;
- *     SHARED_RING_INIT((struct mytag_sring *)shared_page);
- *     FRONT_RING_INIT(&front_ring, (struct mytag_sring *)shared_page,
- *		       PAGE_SIZE);
+ *     mytag_front_ring_t front_ring;
+ *     SHARED_RING_INIT((mytag_sring_t *)shared_page);
+ *     FRONT_RING_INIT(&front_ring, (mytag_sring_t *)shared_page, PAGE_SIZE);
  *
  * Initializing the back follows similarly (note that only the front
  * initializes the shared ring):
  *
- *     struct mytag_back_ring back_ring;
- *     BACK_RING_INIT(&back_ring, (struct mytag_sring *)shared_page,
- *		      PAGE_SIZE);
+ *     mytag_back_ring_t back_ring;
+ *     BACK_RING_INIT(&back_ring, (mytag_sring_t *)shared_page, PAGE_SIZE);
  */
 
-#define DEFINE_RING_TYPES(__name, __req_t, __rsp_t)			\
-									\
-/* Shared ring entry */							\
-union __name##_sring_entry {						\
-    __req_t req;							\
-    __rsp_t rsp;							\
-};									\
-									\
-/* Shared ring page */							\
-struct __name##_sring {							\
-    RING_IDX req_prod, req_event;					\
-    RING_IDX rsp_prod, rsp_event;					\
-    uint8_t  pad[48];							\
-    union __name##_sring_entry ring[1]; /* variable-length */		\
-};									\
-									\
-/* "Front" end's private variables */					\
-struct __name##_front_ring {						\
-    RING_IDX req_prod_pvt;						\
-    RING_IDX rsp_cons;							\
-    unsigned int nr_ents;						\
-    struct __name##_sring *sring;					\
-};									\
-									\
-/* "Back" end's private variables */					\
-struct __name##_back_ring {						\
-    RING_IDX rsp_prod_pvt;						\
-    RING_IDX req_cons;							\
-    unsigned int nr_ents;						\
-    struct __name##_sring *sring;					\
-};
-
+#define DEFINE_RING_TYPES(__name, __req_t, __rsp_t)                     \
+                                                                        \
+/* Shared ring entry */                                                 \
+union __name##_sring_entry {                                            \
+    __req_t req;                                                        \
+    __rsp_t rsp;                                                        \
+};                                                                      \
+                                                                        \
+/* Shared ring page */                                                  \
+struct __name##_sring {                                                 \
+    RING_IDX req_prod, req_event;                                       \
+    RING_IDX rsp_prod, rsp_event;                                       \
+    uint8_t __pad[48];                                                  \
+    union __name##_sring_entry ring[1]; /* variable-length */           \
+};                                                                      \
+                                                                        \
+/* "Front" end's private variables */                                   \
+struct __name##_front_ring {                                            \
+    RING_IDX req_prod_pvt;                                              \
+    RING_IDX rsp_cons;                                                  \
+    unsigned int nr_ents;                                               \
+    struct __name##_sring *sring;                                       \
+};                                                                      \
+                                                                        \
+/* "Back" end's private variables */                                    \
+struct __name##_back_ring {                                             \
+    RING_IDX rsp_prod_pvt;                                              \
+    RING_IDX req_cons;                                                  \
+    unsigned int nr_ents;                                               \
+    struct __name##_sring *sring;                                       \
+};                                                                      \
+                                                                        \
 /*
  * Macros for manipulating rings.
  *
@@ -119,94 +148,99 @@ struct __name##_back_ring {						\
  */
 
 /* Initialising empty rings */
-#define SHARED_RING_INIT(_s) do {					\
-    (_s)->req_prod  = (_s)->rsp_prod  = 0;				\
-    (_s)->req_event = (_s)->rsp_event = 1;				\
-    memset((_s)->pad, 0, sizeof((_s)->pad));				\
+#define SHARED_RING_INIT(_s) do {                                       \
+    (_s)->req_prod  = (_s)->rsp_prod  = 0;                              \
+    (_s)->req_event = (_s)->rsp_event = 1;                              \
+    (void)memset((_s)->__pad, 0, sizeof((_s)->__pad));                  \
 } while(0)
 
-#define FRONT_RING_ATTACH(_r, _s, _i, __size) do {			\
-    (_r)->req_prod_pvt = (_i);						\
-    (_r)->rsp_cons = (_i);						\
-    (_r)->nr_ents = __RING_SIZE(_s, __size);				\
-    (_r)->sring = (_s);							\
+#define FRONT_RING_ATTACH(_r, _s, _i, __size) do {                      \
+    (_r)->req_prod_pvt = (_i);                                          \
+    (_r)->rsp_cons = (_i);                                              \
+    (_r)->nr_ents = __RING_SIZE(_s, __size);                            \
+    (_r)->sring = (_s);                                                 \
 } while (0)
 
 #define FRONT_RING_INIT(_r, _s, __size) FRONT_RING_ATTACH(_r, _s, 0, __size)
 
-#define BACK_RING_ATTACH(_r, _s, _i, __size) do {			\
-    (_r)->rsp_prod_pvt = (_i);						\
-    (_r)->req_cons = (_i);						\
-    (_r)->nr_ents = __RING_SIZE(_s, __size);				\
-    (_r)->sring = (_s);							\
+#define BACK_RING_ATTACH(_r, _s, _i, __size) do {                       \
+    (_r)->rsp_prod_pvt = (_i);                                          \
+    (_r)->req_cons = (_i);                                              \
+    (_r)->nr_ents = __RING_SIZE(_s, __size);                            \
+    (_r)->sring = (_s);                                                 \
 } while (0)
 
 #define BACK_RING_INIT(_r, _s, __size) BACK_RING_ATTACH(_r, _s, 0, __size)
 
 /* How big is this ring? */
-#define RING_SIZE(_r)							\
+#define RING_SIZE(_r)                                                   \
     ((_r)->nr_ents)
 
 /* Number of free requests (for use on front side only). */
-#define RING_FREE_REQUESTS(_r)						\
+#define RING_FREE_REQUESTS(_r)                                          \
     (RING_SIZE(_r) - ((_r)->req_prod_pvt - (_r)->rsp_cons))
 
 /* Test if there is an empty slot available on the front ring.
  * (This is only meaningful from the front. )
  */
-#define RING_FULL(_r)							\
+#define RING_FULL(_r)                                                   \
     (RING_FREE_REQUESTS(_r) == 0)
 
 /* Test if there are outstanding messages to be processed on a ring. */
-#define RING_HAS_UNCONSUMED_RESPONSES(_r)				\
+#define RING_HAS_UNCONSUMED_RESPONSES(_r)                               \
     ((_r)->sring->rsp_prod - (_r)->rsp_cons)
 
-#define RING_HAS_UNCONSUMED_REQUESTS(_r)				\
-    ({									\
-	unsigned int req = (_r)->sring->req_prod - (_r)->req_cons;	\
-	unsigned int rsp = RING_SIZE(_r) -				\
-			   ((_r)->req_cons - (_r)->rsp_prod_pvt);	\
-	req < rsp ? req : rsp;						\
-    })
+#define RING_HAS_UNCONSUMED_REQUESTS(_r) ({                             \
+    unsigned int req = (_r)->sring->req_prod - (_r)->req_cons;          \
+    unsigned int rsp = RING_SIZE(_r) -                                  \
+        ((_r)->req_cons - (_r)->rsp_prod_pvt);                          \
+    req < rsp ? req : rsp;                                              \
+})
 
 /* Direct access to individual ring elements, by index. */
-#define RING_GET_REQUEST(_r, _idx)					\
+#define RING_GET_REQUEST(_r, _idx)                                      \
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
 
-#define RING_GET_RESPONSE(_r, _idx)					\
-    (&((_r)->sring->ring[((_idx) & (RING_SIZE(_r) - 1))].rsp))
+#define RING_COPY_REQUEST(r, idx, req)  RING_COPY_(REQUEST, r, idx, req)
+#define RING_COPY_RESPONSE(r, idx, rsp) RING_COPY_(RESPONSE, r, idx, rsp)
 
 /* Loop termination condition: Would the specified index overflow the ring? */
-#define RING_REQUEST_CONS_OVERFLOW(_r, _cons)				\
+#define RING_REQUEST_CONS_OVERFLOW(_r, _cons)                           \
     (((_cons) - (_r)->rsp_prod_pvt) >= RING_SIZE(_r))
 
 /* Ill-behaved frontend determination: Can there be this many requests? */
-#define RING_REQUEST_PROD_OVERFLOW(_r, _prod)               \
+#define RING_REQUEST_PROD_OVERFLOW(_r, _prod)                           \
     (((_prod) - (_r)->rsp_prod_pvt) > RING_SIZE(_r))
 
+/* Ill-behaved backend determination: Can there be this many responses? */
+#define RING_RESPONSE_PROD_OVERFLOW(_r, _prod)                          \
+    (((_prod) - (_r)->rsp_cons) > RING_SIZE(_r))
 
-#define RING_PUSH_REQUESTS(_r) do {					\
-    virt_wmb(); /* back sees requests /before/ updated producer index */	\
-    (_r)->sring->req_prod = (_r)->req_prod_pvt;				\
+#define RING_PUSH_REQUESTS(_r) do {                                     \
+    virt_wmb(); /* back sees requests /before/ updated producer index */\
+    (_r)->sring->req_prod = (_r)->req_prod_pvt;                         \
 } while (0)
 
-#define RING_PUSH_RESPONSES(_r) do {					\
-    virt_wmb(); /* front sees responses /before/ updated producer index */	\
-    (_r)->sring->rsp_prod = (_r)->rsp_prod_pvt;				\
+#define RING_PUSH_RESPONSES(_r) do {                                    \
+    virt_wmb(); /* front sees resps /before/ updated producer index */  \
+    (_r)->sring->rsp_prod = (_r)->rsp_prod_pvt;                         \
 } while (0)
 
 /*
@@ -239,40 +273,40 @@ struct __name##_back_ring {						\
  *  field appropriately.
  */
 
-#define RING_PUSH_REQUESTS_AND_CHECK_NOTIFY(_r, _notify) do {		\
-    RING_IDX __old = (_r)->sring->req_prod;				\
-    RING_IDX __new = (_r)->req_prod_pvt;				\
-    virt_wmb(); /* back sees requests /before/ updated producer index */	\
-    (_r)->sring->req_prod = __new;					\
-    virt_mb(); /* back sees new requests /before/ we check req_event */	\
-    (_notify) = ((RING_IDX)(__new - (_r)->sring->req_event) <		\
-		 (RING_IDX)(__new - __old));				\
+#define RING_PUSH_REQUESTS_AND_CHECK_NOTIFY(_r, _notify) do {           \
+    RING_IDX __old = (_r)->sring->req_prod;                             \
+    RING_IDX __new = (_r)->req_prod_pvt;                                \
+    virt_wmb(); /* back sees requests /before/ updated producer index */\
+    (_r)->sring->req_prod = __new;                                      \
+    virt_mb(); /* back sees new requests /before/ we check req_event */ \
+    (_notify) = ((RING_IDX)(__new - (_r)->sring->req_event) <           \
+                 (RING_IDX)(__new - __old));                            \
 } while (0)
 
-#define RING_PUSH_RESPONSES_AND_CHECK_NOTIFY(_r, _notify) do {		\
-    RING_IDX __old = (_r)->sring->rsp_prod;				\
-    RING_IDX __new = (_r)->rsp_prod_pvt;				\
-    virt_wmb(); /* front sees responses /before/ updated producer index */	\
-    (_r)->sring->rsp_prod = __new;					\
-    virt_mb(); /* front sees new responses /before/ we check rsp_event */	\
-    (_notify) = ((RING_IDX)(__new - (_r)->sring->rsp_event) <		\
-		 (RING_IDX)(__new - __old));				\
+#define RING_PUSH_RESPONSES_AND_CHECK_NOTIFY(_r, _notify) do {          \
+    RING_IDX __old = (_r)->sring->rsp_prod;                             \
+    RING_IDX __new = (_r)->rsp_prod_pvt;                                \
+    virt_wmb(); /* front sees resps /before/ updated producer index */  \
+    (_r)->sring->rsp_prod = __new;                                      \
+    virt_mb(); /* front sees new resps /before/ we check rsp_event */   \
+    (_notify) = ((RING_IDX)(__new - (_r)->sring->rsp_event) <           \
+                 (RING_IDX)(__new - __old));                            \
 } while (0)
 
-#define RING_FINAL_CHECK_FOR_REQUESTS(_r, _work_to_do) do {		\
-    (_work_to_do) = RING_HAS_UNCONSUMED_REQUESTS(_r);			\
-    if (_work_to_do) break;						\
-    (_r)->sring->req_event = (_r)->req_cons + 1;			\
-    virt_mb();								\
-    (_work_to_do) = RING_HAS_UNCONSUMED_REQUESTS(_r);			\
+#define RING_FINAL_CHECK_FOR_REQUESTS(_r, _work_to_do) do {             \
+    (_work_to_do) = RING_HAS_UNCONSUMED_REQUESTS(_r);                   \
+    if (_work_to_do) break;                                             \
+    (_r)->sring->req_event = (_r)->req_cons + 1;                        \
+    virt_mb();                                                          \
+    (_work_to_do) = RING_HAS_UNCONSUMED_REQUESTS(_r);                   \
 } while (0)
 
-#define RING_FINAL_CHECK_FOR_RESPONSES(_r, _work_to_do) do {		\
-    (_work_to_do) = RING_HAS_UNCONSUMED_RESPONSES(_r);			\
-    if (_work_to_do) break;						\
-    (_r)->sring->rsp_event = (_r)->rsp_cons + 1;			\
-    virt_mb();								\
-    (_work_to_do) = RING_HAS_UNCONSUMED_RESPONSES(_r);			\
+#define RING_FINAL_CHECK_FOR_RESPONSES(_r, _work_to_do) do {            \
+    (_work_to_do) = RING_HAS_UNCONSUMED_RESPONSES(_r);                  \
+    if (_work_to_do) break;                                             \
+    (_r)->sring->rsp_event = (_r)->rsp_cons + 1;                        \
+    virt_mb();                                                          \
+    (_work_to_do) = RING_HAS_UNCONSUMED_RESPONSES(_r);                  \
 } while (0)
 
 
-- 
2.26.2


