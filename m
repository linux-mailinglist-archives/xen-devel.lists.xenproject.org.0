Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74E9303979
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:52:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74742.134363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L0p-0001Oj-AD; Tue, 26 Jan 2021 09:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74742.134363; Tue, 26 Jan 2021 09:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L0p-0001OI-7G; Tue, 26 Jan 2021 09:51:51 +0000
Received: by outflank-mailman (input) for mailman id 74742;
 Tue, 26 Jan 2021 09:51:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4L0n-0001O4-Od
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:51:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45470abb-f0e0-4948-b497-f378f54a6531;
 Tue, 26 Jan 2021 09:51:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D48C9AF17;
 Tue, 26 Jan 2021 09:51:47 +0000 (UTC)
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
X-Inumbo-ID: 45470abb-f0e0-4948-b497-f378f54a6531
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azZcQFU/ZVnloJg9e2l3sLBy83G0faybtBUm3/hBATU=;
	b=TJClGczvJPfeJr4QweEM1cgE3vACvhAGQr8ecl/oi21g8ZE7jsA80SH0q6hlubjj1RamCa
	mR8D/L5W2GAHg3uWBMTWvvVxEL4d9l2WkvJr+29UkS/EWoWf4gNpZQQ2ppVPCjdgZ6jlnA
	46YOOseV8J9cbXom9ruTYjPAJNpWQc0=
Subject: [PATCH v3 10/15] unlzma: replace INIT
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <b955d146-d9dd-daa2-984b-c50d38c714d7@suse.com>
Date: Tue, 26 Jan 2021 10:51:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no need for this abstraction.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/common/unlzma.c
+++ b/xen/common/unlzma.c
@@ -30,7 +30,7 @@
 
 #include "decompress.h"
 
-static long long INIT read_int(unsigned char *ptr, int size)
+static long long __init read_int(unsigned char *ptr, int size)
 {
 	int i;
 	long long ret = 0;
@@ -76,13 +76,13 @@ struct rc {
 #define RC_MODEL_TOTAL_BITS 11
 
 
-static int INIT nofill(void *buffer, unsigned int len)
+static int __init nofill(void *buffer, unsigned int len)
 {
 	return -1;
 }
 
 /* Called twice: once at startup and once in rc_normalize() */
-static void INIT rc_read(struct rc *rc)
+static void __init rc_read(struct rc *rc)
 {
 	rc->buffer_size = rc->fill((char *)rc->buffer, LZMA_IOBUF_SIZE);
 	if (rc->buffer_size <= 0)
@@ -92,9 +92,9 @@ static void INIT rc_read(struct rc *rc)
 }
 
 /* Called once */
-static inline void INIT rc_init(struct rc *rc,
-				       int (*fill)(void*, unsigned int),
-				       unsigned char *buffer, int buffer_size)
+static inline void __init rc_init(struct rc *rc,
+				  int (*fill)(void*, unsigned int),
+				  unsigned char *buffer, int buffer_size)
 {
 	if (fill)
 		rc->fill = fill;
@@ -109,7 +109,7 @@ static inline void INIT rc_init(struct r
 	rc->range = 0xFFFFFFFF;
 }
 
-static inline void INIT rc_init_code(struct rc *rc)
+static inline void __init rc_init_code(struct rc *rc)
 {
 	int i;
 
@@ -122,14 +122,14 @@ static inline void INIT rc_init_code(str
 
 
 /* Called twice, but one callsite is in inline'd rc_is_bit_0_helper() */
-static void INIT rc_do_normalize(struct rc *rc)
+static void __init rc_do_normalize(struct rc *rc)
 {
 	if (rc->ptr >= rc->buffer_end)
 		rc_read(rc);
 	rc->range <<= 8;
 	rc->code = (rc->code << 8) | *rc->ptr++;
 }
-static inline void INIT rc_normalize(struct rc *rc)
+static inline void __init rc_normalize(struct rc *rc)
 {
 	if (rc->range < (1 << RC_TOP_BITS))
 		rc_do_normalize(rc);
@@ -139,20 +139,20 @@ static inline void INIT rc_normalize(str
 /* Why rc_is_bit_0_helper exists?
  *Because we want to always expose (rc->code < rc->bound) to optimizer
  */
-static inline uint32_t INIT rc_is_bit_0_helper(struct rc *rc, uint16_t *p)
+static inline uint32_t __init rc_is_bit_0_helper(struct rc *rc, uint16_t *p)
 {
 	rc_normalize(rc);
 	rc->bound = *p * (rc->range >> RC_MODEL_TOTAL_BITS);
 	return rc->bound;
 }
-static inline int INIT rc_is_bit_0(struct rc *rc, uint16_t *p)
+static inline int __init rc_is_bit_0(struct rc *rc, uint16_t *p)
 {
 	uint32_t t = rc_is_bit_0_helper(rc, p);
 	return rc->code < t;
 }
 
 /* Called ~10 times, but very small, thus inlined */
-static inline void INIT rc_update_bit_0(struct rc *rc, uint16_t *p)
+static inline void __init rc_update_bit_0(struct rc *rc, uint16_t *p)
 {
 	rc->range = rc->bound;
 	*p += ((1 << RC_MODEL_TOTAL_BITS) - *p) >> RC_MOVE_BITS;
@@ -165,7 +165,7 @@ static inline void rc_update_bit_1(struc
 }
 
 /* Called 4 times in unlzma loop */
-static int INIT rc_get_bit(struct rc *rc, uint16_t *p, int *symbol)
+static int __init rc_get_bit(struct rc *rc, uint16_t *p, int *symbol)
 {
 	if (rc_is_bit_0(rc, p)) {
 		rc_update_bit_0(rc, p);
@@ -179,7 +179,7 @@ static int INIT rc_get_bit(struct rc *rc
 }
 
 /* Called once */
-static inline int INIT rc_direct_bit(struct rc *rc)
+static inline int __init rc_direct_bit(struct rc *rc)
 {
 	rc_normalize(rc);
 	rc->range >>= 1;
@@ -191,7 +191,7 @@ static inline int INIT rc_direct_bit(str
 }
 
 /* Called twice */
-static inline void INIT
+static inline void __init
 rc_bit_tree_decode(struct rc *rc, uint16_t *p, int num_levels, int *symbol)
 {
 	int i = num_levels;
@@ -283,14 +283,14 @@ struct cstate {
 	uint32_t rep0, rep1, rep2, rep3;
 };
 
-static inline size_t INIT get_pos(struct writer *wr)
+static inline size_t __init get_pos(struct writer *wr)
 {
 	return
 		wr->global_pos + wr->buffer_pos;
 }
 
-static inline uint8_t INIT peek_old_byte(struct writer *wr,
-						uint32_t offs)
+static inline uint8_t __init peek_old_byte(struct writer *wr,
+					   uint32_t offs)
 {
 	if (!wr->flush) {
 		int32_t pos;
@@ -307,7 +307,7 @@ static inline uint8_t INIT peek_old_byte
 
 }
 
-static inline int INIT write_byte(struct writer *wr, uint8_t byte)
+static inline int __init write_byte(struct writer *wr, uint8_t byte)
 {
 	wr->buffer[wr->buffer_pos++] = wr->previous_byte = byte;
 	if (wr->flush && wr->buffer_pos == wr->header->dict_size) {
@@ -321,13 +321,13 @@ static inline int INIT write_byte(struct
 }
 
 
-static inline int INIT copy_byte(struct writer *wr, uint32_t offs)
+static inline int __init copy_byte(struct writer *wr, uint32_t offs)
 {
 	return write_byte(wr, peek_old_byte(wr, offs));
 }
 
-static inline int INIT copy_bytes(struct writer *wr,
-					 uint32_t rep0, int len)
+static inline int __init copy_bytes(struct writer *wr,
+				    uint32_t rep0, int len)
 {
 	do {
 		if (copy_byte(wr, rep0))
@@ -338,10 +338,10 @@ static inline int INIT copy_bytes(struct
 	return len;
 }
 
-static inline int INIT process_bit0(struct writer *wr, struct rc *rc,
-				     struct cstate *cst, uint16_t *p,
-				     int pos_state, uint16_t *prob,
-				     int lc, uint32_t literal_pos_mask) {
+static inline int __init process_bit0(struct writer *wr, struct rc *rc,
+				      struct cstate *cst, uint16_t *p,
+				      int pos_state, uint16_t *prob,
+				      int lc, uint32_t literal_pos_mask) {
 	int mi = 1;
 	rc_update_bit_0(rc, prob);
 	prob = (p + LZMA_LITERAL +
@@ -382,9 +382,9 @@ static inline int INIT process_bit0(stru
 	return write_byte(wr, mi);
 }
 
-static inline int INIT process_bit1(struct writer *wr, struct rc *rc,
-					    struct cstate *cst, uint16_t *p,
-					    int pos_state, uint16_t *prob) {
+static inline int __init process_bit1(struct writer *wr, struct rc *rc,
+				      struct cstate *cst, uint16_t *p,
+				      int pos_state, uint16_t *prob) {
   int offset;
 	uint16_t *prob_len;
 	int num_bits;
@@ -528,11 +528,11 @@ static inline int INIT process_bit1(stru
 
 
 
-int INIT unlzma(unsigned char *buf, unsigned int in_len,
-	        int(*fill)(void*, unsigned int),
-	        int(*flush)(void*, unsigned int),
-	        unsigned char *output, unsigned int *posp,
-	        void(*error)(const char *x))
+int __init unlzma(unsigned char *buf, unsigned int in_len,
+		  int(*fill)(void*, unsigned int),
+		  int(*flush)(void*, unsigned int),
+		  unsigned char *output, unsigned int *posp,
+		  void(*error)(const char *x))
 {
 	struct lzma_header header;
 	int lc, pb, lp;


