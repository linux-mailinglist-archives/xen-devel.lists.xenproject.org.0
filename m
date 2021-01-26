Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3011B303982
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 10:52:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74753.134388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L1X-0001df-6Z; Tue, 26 Jan 2021 09:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74753.134388; Tue, 26 Jan 2021 09:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4L1X-0001dB-29; Tue, 26 Jan 2021 09:52:35 +0000
Received: by outflank-mailman (input) for mailman id 74753;
 Tue, 26 Jan 2021 09:52:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ElsB=G5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4L1V-0001cu-3t
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 09:52:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7e55a7a-0a65-4c9e-a28e-93f149f818db;
 Tue, 26 Jan 2021 09:52:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 14BF0AE40;
 Tue, 26 Jan 2021 09:52:30 +0000 (UTC)
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
X-Inumbo-ID: a7e55a7a-0a65-4c9e-a28e-93f149f818db
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611654750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/4i3wadAj9OqzzCi0apOSgqGm1GFZ9A6DvjcMwsMXrQ=;
	b=NwGWLw4VYFdj40EY4EOCdybeT/Nk9duoQr79zYrl4EVI0jYOGaP705NtnuY+zQB/GEEe8O
	S4ZLD9nNXiht2NEwGqIZ/d3dvxUQ6G3DFYmWjaSVGBepIrPqldSlIJf3m/m7uW6XkUQSNg
	1QbVUnjcyy9DHhbcZuuyKoxE+Y2S/Z4=
Subject: [PATCH v3 12/15] unxz: replace INIT{,DATA} and STATIC
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Message-ID: <4e0a0db2-db34-a738-2f5e-1d5cd2c37e19@suse.com>
Date: Tue, 26 Jan 2021 10:52:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

With xen/common/decompress.h now agreeing in both build modes about
what STATIC expands to, there's no need for this abstraction anymore.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: New.

--- a/xen/common/decompress.h
+++ b/xen/common/decompress.h
@@ -9,7 +9,6 @@
 
 #define STATIC static
 #define INIT __init
-#define INITDATA __initdata
 
 #define malloc xmalloc_bytes
 #define free xfree
@@ -21,7 +20,6 @@
 
 #define STATIC static
 #define INIT
-#define INITDATA
 
 #undef __init /* tools/libs/guest/xg_private.h has its own one */
 #define __init
--- a/xen/common/unxz.c
+++ b/xen/common/unxz.c
@@ -95,7 +95,7 @@
 
 #include "decompress.h"
 
-#define XZ_EXTERN STATIC
+#define XZ_EXTERN static
 
 /*
  * For boot time use, we enable only the BCJ filter of the current
@@ -157,11 +157,11 @@
  * both input and output buffers are available as a single chunk, i.e. when
  * fill() and flush() won't be used.
  */
-int INIT unxz(unsigned char *in, unsigned int in_size,
-	      int (*fill)(void *dest, unsigned int size),
-	      int (*flush)(void *src, unsigned int size),
-	      unsigned char *out, unsigned int *in_used,
-	      void (*error)(const char *x))
+int __init unxz(unsigned char *in, unsigned int in_size,
+		int (*fill)(void *dest, unsigned int size),
+		int (*flush)(void *src, unsigned int size),
+		unsigned char *out, unsigned int *in_used,
+		void (*error)(const char *x))
 {
 	struct xz_buf b;
 	struct xz_dec *s;
--- a/xen/common/xz/crc32.c
+++ b/xen/common/xz/crc32.c
@@ -15,9 +15,9 @@
  * but they are bigger and use more memory for the lookup table.
  */
 
-XZ_EXTERN uint32_t INITDATA xz_crc32_table[256];
+XZ_EXTERN uint32_t __initdata xz_crc32_table[256];
 
-XZ_EXTERN void INIT xz_crc32_init(void)
+XZ_EXTERN void __init xz_crc32_init(void)
 {
 	const uint32_t poly = 0xEDB88320;
 
@@ -36,7 +36,7 @@ XZ_EXTERN void INIT xz_crc32_init(void)
 	return;
 }
 
-XZ_EXTERN uint32_t INIT xz_crc32(const uint8_t *buf, size_t size, uint32_t crc)
+XZ_EXTERN uint32_t __init xz_crc32(const uint8_t *buf, size_t size, uint32_t crc)
 {
 	crc = ~crc;
 
--- a/xen/common/xz/dec_bcj.c
+++ b/xen/common/xz/dec_bcj.c
@@ -80,12 +80,12 @@ struct xz_dec_bcj {
  * This is used to test the most significant byte of a memory address
  * in an x86 instruction.
  */
-static inline int INIT bcj_x86_test_msbyte(uint8_t b)
+static inline int __init bcj_x86_test_msbyte(uint8_t b)
 {
 	return b == 0x00 || b == 0xFF;
 }
 
-static size_t INIT bcj_x86(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
+static size_t __init bcj_x86(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
 {
 	static const bool_t mask_to_allowed_status[8]
 		= { true, true, true, false, true, false, false, false };
@@ -157,7 +157,7 @@ static size_t INIT bcj_x86(struct xz_dec
 #endif
 
 #ifdef XZ_DEC_POWERPC
-static size_t INIT bcj_powerpc(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
+static size_t __init bcj_powerpc(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
 {
 	size_t i;
 	uint32_t instr;
@@ -178,7 +178,7 @@ static size_t INIT bcj_powerpc(struct xz
 #endif
 
 #ifdef XZ_DEC_IA64
-static size_t INIT bcj_ia64(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
+static size_t __init bcj_ia64(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
 {
 	static const uint8_t branch_table[32] = {
 		0, 0, 0, 0, 0, 0, 0, 0,
@@ -262,7 +262,7 @@ static size_t INIT bcj_ia64(struct xz_de
 #endif
 
 #ifdef XZ_DEC_ARM
-static size_t INIT bcj_arm(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
+static size_t __init bcj_arm(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
 {
 	size_t i;
 	uint32_t addr;
@@ -285,7 +285,7 @@ static size_t INIT bcj_arm(struct xz_dec
 #endif
 
 #ifdef XZ_DEC_ARMTHUMB
-static size_t INIT bcj_armthumb(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
+static size_t __init bcj_armthumb(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
 {
 	size_t i;
 	uint32_t addr;
@@ -313,7 +313,7 @@ static size_t INIT bcj_armthumb(struct x
 #endif
 
 #ifdef XZ_DEC_SPARC
-static size_t INIT bcj_sparc(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
+static size_t __init bcj_sparc(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
 {
 	size_t i;
 	uint32_t instr;
@@ -342,8 +342,8 @@ static size_t INIT bcj_sparc(struct xz_d
  * pointers, which could be problematic in the kernel boot code, which must
  * avoid pointers to static data (at least on x86).
  */
-static void INIT bcj_apply(struct xz_dec_bcj *s,
-			   uint8_t *buf, size_t *pos, size_t size)
+static void __init bcj_apply(struct xz_dec_bcj *s,
+			     uint8_t *buf, size_t *pos, size_t size)
 {
 	size_t filtered;
 
@@ -396,7 +396,7 @@ static void INIT bcj_apply(struct xz_dec
  * Move the remaining mixture of possibly filtered and unfiltered
  * data to the beginning of temp.
  */
-static void INIT bcj_flush(struct xz_dec_bcj *s, struct xz_buf *b)
+static void __init bcj_flush(struct xz_dec_bcj *s, struct xz_buf *b)
 {
 	size_t copy_size;
 
@@ -414,9 +414,9 @@ static void INIT bcj_flush(struct xz_dec
  * data in chunks of 1-16 bytes. To hide this issue, this function does
  * some buffering.
  */
-XZ_EXTERN enum xz_ret INIT xz_dec_bcj_run(struct xz_dec_bcj *s,
-					  struct xz_dec_lzma2 *lzma2,
-					  struct xz_buf *b)
+XZ_EXTERN enum xz_ret __init xz_dec_bcj_run(struct xz_dec_bcj *s,
+					    struct xz_dec_lzma2 *lzma2,
+					    struct xz_buf *b)
 {
 	size_t out_start;
 
@@ -524,7 +524,7 @@ XZ_EXTERN enum xz_ret INIT xz_dec_bcj_ru
 	return s->ret;
 }
 
-XZ_EXTERN struct xz_dec_bcj *INIT xz_dec_bcj_create(bool_t single_call)
+XZ_EXTERN struct xz_dec_bcj *__init xz_dec_bcj_create(bool_t single_call)
 {
 	struct xz_dec_bcj *s = malloc(sizeof(*s));
 	if (s != NULL)
@@ -533,7 +533,7 @@ XZ_EXTERN struct xz_dec_bcj *INIT xz_dec
 	return s;
 }
 
-XZ_EXTERN enum xz_ret INIT xz_dec_bcj_reset(struct xz_dec_bcj *s, uint8_t id)
+XZ_EXTERN enum xz_ret __init xz_dec_bcj_reset(struct xz_dec_bcj *s, uint8_t id)
 {
 	switch (id) {
 #ifdef XZ_DEC_X86
--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -283,7 +283,7 @@ struct xz_dec_lzma2 {
  * Reset the dictionary state. When in single-call mode, set up the beginning
  * of the dictionary to point to the actual output buffer.
  */
-static void INIT dict_reset(struct dictionary *dict, struct xz_buf *b)
+static void __init dict_reset(struct dictionary *dict, struct xz_buf *b)
 {
 	if (DEC_IS_SINGLE(dict->mode)) {
 		dict->buf = b->out + b->out_pos;
@@ -297,7 +297,7 @@ static void INIT dict_reset(struct dicti
 }
 
 /* Set dictionary write limit */
-static void INIT dict_limit(struct dictionary *dict, size_t out_max)
+static void __init dict_limit(struct dictionary *dict, size_t out_max)
 {
 	if (dict->end - dict->pos <= out_max)
 		dict->limit = dict->end;
@@ -306,7 +306,7 @@ static void INIT dict_limit(struct dicti
 }
 
 /* Return true if at least one byte can be written into the dictionary. */
-static inline bool_t INIT dict_has_space(const struct dictionary *dict)
+static inline bool_t __init dict_has_space(const struct dictionary *dict)
 {
 	return dict->pos < dict->limit;
 }
@@ -317,7 +317,7 @@ static inline bool_t INIT dict_has_space
  * still empty. This special case is needed for single-call decoding to
  * avoid writing a '\0' to the end of the destination buffer.
  */
-static inline uint32_t INIT dict_get(const struct dictionary *dict, uint32_t dist)
+static inline uint32_t __init dict_get(const struct dictionary *dict, uint32_t dist)
 {
 	size_t offset = dict->pos - dist - 1;
 
@@ -330,7 +330,7 @@ static inline uint32_t INIT dict_get(con
 /*
  * Put one byte into the dictionary. It is assumed that there is space for it.
  */
-static inline void INIT dict_put(struct dictionary *dict, uint8_t byte)
+static inline void __init dict_put(struct dictionary *dict, uint8_t byte)
 {
 	dict->buf[dict->pos++] = byte;
 
@@ -343,7 +343,7 @@ static inline void INIT dict_put(struct
  * invalid, false is returned. On success, true is returned and *len is
  * updated to indicate how many bytes were left to be repeated.
  */
-static bool_t INIT dict_repeat(struct dictionary *dict, uint32_t *len, uint32_t dist)
+static bool_t __init dict_repeat(struct dictionary *dict, uint32_t *len, uint32_t dist)
 {
 	size_t back;
 	uint32_t left;
@@ -371,8 +371,8 @@ static bool_t INIT dict_repeat(struct di
 }
 
 /* Copy uncompressed data as is from input to dictionary and output buffers. */
-static void INIT dict_uncompressed(struct dictionary *dict, struct xz_buf *b,
-				   uint32_t *left)
+static void __init dict_uncompressed(struct dictionary *dict, struct xz_buf *b,
+				     uint32_t *left)
 {
 	size_t copy_size;
 
@@ -413,7 +413,7 @@ static void INIT dict_uncompressed(struc
  * enough space in b->out. This is guaranteed because caller uses dict_limit()
  * before decoding data into the dictionary.
  */
-static uint32_t INIT dict_flush(struct dictionary *dict, struct xz_buf *b)
+static uint32_t __init dict_flush(struct dictionary *dict, struct xz_buf *b)
 {
 	size_t copy_size = dict->pos - dict->start;
 
@@ -435,7 +435,7 @@ static uint32_t INIT dict_flush(struct d
  *****************/
 
 /* Reset the range decoder. */
-static void INIT rc_reset(struct rc_dec *rc)
+static void __init rc_reset(struct rc_dec *rc)
 {
 	rc->range = (uint32_t)-1;
 	rc->code = 0;
@@ -446,7 +446,7 @@ static void INIT rc_reset(struct rc_dec
  * Read the first five initial bytes into rc->code if they haven't been
  * read already. (Yes, the first byte gets completely ignored.)
  */
-static bool_t INIT rc_read_init(struct rc_dec *rc, struct xz_buf *b)
+static bool_t __init rc_read_init(struct rc_dec *rc, struct xz_buf *b)
 {
 	while (rc->init_bytes_left > 0) {
 		if (b->in_pos == b->in_size)
@@ -460,7 +460,7 @@ static bool_t INIT rc_read_init(struct r
 }
 
 /* Return true if there may not be enough input for the next decoding loop. */
-static inline bool_t INIT rc_limit_exceeded(const struct rc_dec *rc)
+static inline bool_t __init rc_limit_exceeded(const struct rc_dec *rc)
 {
 	return rc->in_pos > rc->in_limit;
 }
@@ -469,7 +469,7 @@ static inline bool_t INIT rc_limit_excee
  * Return true if it is possible (from point of view of range decoder) that
  * we have reached the end of the LZMA chunk.
  */
-static inline bool_t INIT rc_is_finished(const struct rc_dec *rc)
+static inline bool_t __init rc_is_finished(const struct rc_dec *rc)
 {
 	return rc->code == 0;
 }
@@ -550,7 +550,7 @@ static always_inline void rc_bittree_rev
 }
 
 /* Decode direct bits (fixed fifty-fifty probability) */
-static inline void INIT rc_direct(struct rc_dec *rc, uint32_t *dest, uint32_t limit)
+static inline void __init rc_direct(struct rc_dec *rc, uint32_t *dest, uint32_t limit)
 {
 	uint32_t mask;
 
@@ -569,7 +569,7 @@ static inline void INIT rc_direct(struct
  ********/
 
 /* Get pointer to literal coder probability array. */
-static uint16_t *INIT lzma_literal_probs(struct xz_dec_lzma2 *s)
+static uint16_t *__init lzma_literal_probs(struct xz_dec_lzma2 *s)
 {
 	uint32_t prev_byte = dict_get(&s->dict, 0);
 	uint32_t low = prev_byte >> (8 - s->lzma.lc);
@@ -578,7 +578,7 @@ static uint16_t *INIT lzma_literal_probs
 }
 
 /* Decode a literal (one 8-bit byte) */
-static void INIT lzma_literal(struct xz_dec_lzma2 *s)
+static void __init lzma_literal(struct xz_dec_lzma2 *s)
 {
 	uint16_t *probs;
 	uint32_t symbol;
@@ -616,8 +616,8 @@ static void INIT lzma_literal(struct xz_
 }
 
 /* Decode the length of the match into s->lzma.len. */
-static void INIT lzma_len(struct xz_dec_lzma2 *s, struct lzma_len_dec *l,
-			  uint32_t pos_state)
+static void __init lzma_len(struct xz_dec_lzma2 *s, struct lzma_len_dec *l,
+			    uint32_t pos_state)
 {
 	uint16_t *probs;
 	uint32_t limit;
@@ -643,7 +643,7 @@ static void INIT lzma_len(struct xz_dec_
 }
 
 /* Decode a match. The distance will be stored in s->lzma.rep0. */
-static void INIT lzma_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
+static void __init lzma_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
 {
 	uint16_t *probs;
 	uint32_t dist_slot;
@@ -685,7 +685,7 @@ static void INIT lzma_match(struct xz_de
  * Decode a repeated match. The distance is one of the four most recently
  * seen matches. The distance will be stored in s->lzma.rep0.
  */
-static void INIT lzma_rep_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
+static void __init lzma_rep_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
 {
 	uint32_t tmp;
 
@@ -719,7 +719,7 @@ static void INIT lzma_rep_match(struct x
 }
 
 /* LZMA decoder core */
-static bool_t INIT lzma_main(struct xz_dec_lzma2 *s)
+static bool_t __init lzma_main(struct xz_dec_lzma2 *s)
 {
 	uint32_t pos_state;
 
@@ -764,7 +764,7 @@ static bool_t INIT lzma_main(struct xz_d
  * Reset the LZMA decoder and range decoder state. Dictionary is nore reset
  * here, because LZMA state may be reset without resetting the dictionary.
  */
-static void INIT lzma_reset(struct xz_dec_lzma2 *s)
+static void __init lzma_reset(struct xz_dec_lzma2 *s)
 {
 	uint16_t *probs;
 	size_t i;
@@ -796,7 +796,7 @@ static void INIT lzma_reset(struct xz_de
  * from the decoded lp and pb values. On success, the LZMA decoder state is
  * reset and true is returned.
  */
-static bool_t INIT lzma_props(struct xz_dec_lzma2 *s, uint8_t props)
+static bool_t __init lzma_props(struct xz_dec_lzma2 *s, uint8_t props)
 {
 	if (props > (4 * 5 + 4) * 9 + 8)
 		return false;
@@ -843,7 +843,7 @@ static bool_t INIT lzma_props(struct xz_
  * function. We decode a few bytes from the temporary buffer so that we can
  * continue decoding from the caller-supplied input buffer again.
  */
-static bool_t INIT lzma2_lzma(struct xz_dec_lzma2 *s, struct xz_buf *b)
+static bool_t __init lzma2_lzma(struct xz_dec_lzma2 *s, struct xz_buf *b)
 {
 	size_t in_avail;
 	uint32_t tmp;
@@ -928,8 +928,8 @@ static bool_t INIT lzma2_lzma(struct xz_
  * Take care of the LZMA2 control layer, and forward the job of actual LZMA
  * decoding or copying of uncompressed chunks to other functions.
  */
-XZ_EXTERN enum xz_ret INIT xz_dec_lzma2_run(struct xz_dec_lzma2 *s,
-					    struct xz_buf *b)
+XZ_EXTERN enum xz_ret __init xz_dec_lzma2_run(struct xz_dec_lzma2 *s,
+					      struct xz_buf *b)
 {
 	uint32_t tmp;
 
@@ -1105,8 +1105,8 @@ XZ_EXTERN enum xz_ret INIT xz_dec_lzma2_
 	return XZ_OK;
 }
 
-XZ_EXTERN struct xz_dec_lzma2 *INIT xz_dec_lzma2_create(enum xz_mode mode,
-						   uint32_t dict_max)
+XZ_EXTERN struct xz_dec_lzma2 *__init xz_dec_lzma2_create(enum xz_mode mode,
+							  uint32_t dict_max)
 {
 	struct xz_dec_lzma2 *s = malloc(sizeof(*s));
 	if (s == NULL)
@@ -1129,7 +1129,7 @@ XZ_EXTERN struct xz_dec_lzma2 *INIT xz_d
 	return s;
 }
 
-XZ_EXTERN enum xz_ret INIT xz_dec_lzma2_reset(struct xz_dec_lzma2 *s, uint8_t props)
+XZ_EXTERN enum xz_ret __init xz_dec_lzma2_reset(struct xz_dec_lzma2 *s, uint8_t props)
 {
 	/* This limits dictionary size to 3 GiB to keep parsing simpler. */
 	if (props > 39)
@@ -1166,7 +1166,7 @@ XZ_EXTERN enum xz_ret INIT xz_dec_lzma2_
 	return XZ_OK;
 }
 
-XZ_EXTERN void INIT xz_dec_lzma2_end(struct xz_dec_lzma2 *s)
+XZ_EXTERN void __init xz_dec_lzma2_end(struct xz_dec_lzma2 *s)
 {
 	if (DEC_IS_MULTI(s->dict.mode))
 		large_free(s->dict.buf);
--- a/xen/common/xz/dec_stream.c
+++ b/xen/common/xz/dec_stream.c
@@ -154,7 +154,7 @@ static const uint8_t check_sizes[16] = {
  * to copy into s->temp.buf. Return true once s->temp.pos has reached
  * s->temp.size.
  */
-static bool_t INIT fill_temp(struct xz_dec *s, struct xz_buf *b)
+static bool_t __init fill_temp(struct xz_dec *s, struct xz_buf *b)
 {
 	size_t copy_size = min_t(size_t,
 			b->in_size - b->in_pos, s->temp.size - s->temp.pos);
@@ -172,8 +172,8 @@ static bool_t INIT fill_temp(struct xz_d
 }
 
 /* Decode a variable-length integer (little-endian base-128 encoding) */
-static enum xz_ret INIT dec_vli(struct xz_dec *s, const uint8_t *in,
-				size_t *in_pos, size_t in_size)
+static enum xz_ret __init dec_vli(struct xz_dec *s, const uint8_t *in,
+				  size_t *in_pos, size_t in_size)
 {
 	uint8_t byte;
 
@@ -215,7 +215,7 @@ static enum xz_ret INIT dec_vli(struct x
  * the sizes possibly stored in the Block Header. Update the hash and
  * Block count, which are later used to validate the Index field.
  */
-static enum xz_ret INIT dec_block(struct xz_dec *s, struct xz_buf *b)
+static enum xz_ret __init dec_block(struct xz_dec *s, struct xz_buf *b)
 {
 	enum xz_ret ret;
 
@@ -278,7 +278,7 @@ static enum xz_ret INIT dec_block(struct
 }
 
 /* Update the Index size and the CRC32 value. */
-static void INIT index_update(struct xz_dec *s, const struct xz_buf *b)
+static void __init index_update(struct xz_dec *s, const struct xz_buf *b)
 {
 	size_t in_used = b->in_pos - s->in_start;
 	s->index.size += in_used;
@@ -293,7 +293,7 @@ static void INIT index_update(struct xz_
  * This can return XZ_OK (more input needed), XZ_STREAM_END (everything
  * successfully decoded), or XZ_DATA_ERROR (input is corrupt).
  */
-static enum xz_ret INIT dec_index(struct xz_dec *s, struct xz_buf *b)
+static enum xz_ret __init dec_index(struct xz_dec *s, struct xz_buf *b)
 {
 	enum xz_ret ret;
 
@@ -343,7 +343,7 @@ static enum xz_ret INIT dec_index(struct
  * Validate that the next four input bytes match the value of s->crc32.
  * s->pos must be zero when starting to validate the first byte.
  */
-static enum xz_ret INIT crc32_validate(struct xz_dec *s, struct xz_buf *b)
+static enum xz_ret __init crc32_validate(struct xz_dec *s, struct xz_buf *b)
 {
 	do {
 		if (b->in_pos == b->in_size)
@@ -367,7 +367,7 @@ static enum xz_ret INIT crc32_validate(s
  * Skip over the Check field when the Check ID is not supported.
  * Returns true once the whole Check field has been skipped over.
  */
-static bool_t INIT check_skip(struct xz_dec *s, struct xz_buf *b)
+static bool_t __init check_skip(struct xz_dec *s, struct xz_buf *b)
 {
 	while (s->pos < check_sizes[s->check_type]) {
 		if (b->in_pos == b->in_size)
@@ -384,7 +384,7 @@ static bool_t INIT check_skip(struct xz_
 #endif
 
 /* Decode the Stream Header field (the first 12 bytes of the .xz Stream). */
-static enum xz_ret INIT dec_stream_header(struct xz_dec *s)
+static enum xz_ret __init dec_stream_header(struct xz_dec *s)
 {
 	if (!memeq(s->temp.buf, HEADER_MAGIC, HEADER_MAGIC_SIZE))
 		return XZ_FORMAT_ERROR;
@@ -419,7 +419,7 @@ static enum xz_ret INIT dec_stream_heade
 }
 
 /* Decode the Stream Footer field (the last 12 bytes of the .xz Stream) */
-static enum xz_ret INIT dec_stream_footer(struct xz_dec *s)
+static enum xz_ret __init dec_stream_footer(struct xz_dec *s)
 {
 	if (!memeq(s->temp.buf + 10, FOOTER_MAGIC, FOOTER_MAGIC_SIZE))
 		return XZ_DATA_ERROR;
@@ -446,7 +446,7 @@ static enum xz_ret INIT dec_stream_foote
 }
 
 /* Decode the Block Header and initialize the filter chain. */
-static enum xz_ret INIT dec_block_header(struct xz_dec *s)
+static enum xz_ret __init dec_block_header(struct xz_dec *s)
 {
 	enum xz_ret ret;
 
@@ -546,7 +546,7 @@ static enum xz_ret INIT dec_block_header
 	return XZ_OK;
 }
 
-static enum xz_ret INIT dec_main(struct xz_dec *s, struct xz_buf *b)
+static enum xz_ret __init dec_main(struct xz_dec *s, struct xz_buf *b)
 {
 	enum xz_ret ret;
 
@@ -706,7 +706,7 @@ static enum xz_ret INIT dec_main(struct
 	/* Never reached */
 }
 
-XZ_EXTERN void INIT xz_dec_reset(struct xz_dec *s)
+XZ_EXTERN void __init xz_dec_reset(struct xz_dec *s)
 {
 	s->sequence = SEQ_STREAM_HEADER;
 	s->allow_buf_error = false;
@@ -743,7 +743,7 @@ XZ_EXTERN void INIT xz_dec_reset(struct
  * actually succeeds (that's the price to pay of using the output buffer as
  * the workspace).
  */
-XZ_EXTERN enum xz_ret INIT xz_dec_run(struct xz_dec *s, struct xz_buf *b)
+XZ_EXTERN enum xz_ret __init xz_dec_run(struct xz_dec *s, struct xz_buf *b)
 {
 	size_t in_start;
 	size_t out_start;
@@ -779,7 +779,7 @@ XZ_EXTERN enum xz_ret INIT xz_dec_run(st
 	return ret;
 }
 
-XZ_EXTERN struct xz_dec *INIT xz_dec_init(enum xz_mode mode, uint32_t dict_max)
+XZ_EXTERN struct xz_dec *__init xz_dec_init(enum xz_mode mode, uint32_t dict_max)
 {
 	struct xz_dec *s = malloc(sizeof(*s));
 	if (s == NULL)
@@ -809,7 +809,7 @@ error_bcj:
 	return NULL;
 }
 
-XZ_EXTERN void INIT xz_dec_end(struct xz_dec *s)
+XZ_EXTERN void __init xz_dec_end(struct xz_dec *s)
 {
 	if (s != NULL) {
 		xz_dec_lzma2_end(s->lzma2);
--- a/xen/common/xz/lzma2.h
+++ b/xen/common/xz/lzma2.h
@@ -61,7 +61,7 @@ enum lzma_state {
 #define LIT_STATES 7
 
 /* Indicate that the latest symbol was a literal. */
-static inline void INIT lzma_state_literal(enum lzma_state *state)
+static inline void __init lzma_state_literal(enum lzma_state *state)
 {
 	if (*state <= STATE_SHORTREP_LIT_LIT)
 		*state = STATE_LIT_LIT;
@@ -72,25 +72,25 @@ static inline void INIT lzma_state_liter
 }
 
 /* Indicate that the latest symbol was a match. */
-static inline void INIT lzma_state_match(enum lzma_state *state)
+static inline void __init lzma_state_match(enum lzma_state *state)
 {
 	*state = *state < LIT_STATES ? STATE_LIT_MATCH : STATE_NONLIT_MATCH;
 }
 
 /* Indicate that the latest state was a long repeated match. */
-static inline void INIT lzma_state_long_rep(enum lzma_state *state)
+static inline void __init lzma_state_long_rep(enum lzma_state *state)
 {
 	*state = *state < LIT_STATES ? STATE_LIT_LONGREP : STATE_NONLIT_REP;
 }
 
 /* Indicate that the latest symbol was a short match. */
-static inline void INIT lzma_state_short_rep(enum lzma_state *state)
+static inline void __init lzma_state_short_rep(enum lzma_state *state)
 {
 	*state = *state < LIT_STATES ? STATE_LIT_SHORTREP : STATE_NONLIT_REP;
 }
 
 /* Test if the previous symbol was a literal. */
-static inline bool_t INIT lzma_state_is_literal(enum lzma_state state)
+static inline bool_t __init lzma_state_is_literal(enum lzma_state state)
 {
 	return state < LIT_STATES;
 }
@@ -144,7 +144,7 @@ static inline bool_t INIT lzma_state_is_
  * Get the index of the appropriate probability array for decoding
  * the distance slot.
  */
-static inline uint32_t INIT lzma_get_dist_state(uint32_t len)
+static inline uint32_t __init lzma_get_dist_state(uint32_t len)
 {
 	return len < DIST_STATES + MATCH_LEN_MIN
 			? len - MATCH_LEN_MIN : DIST_STATES - 1;


