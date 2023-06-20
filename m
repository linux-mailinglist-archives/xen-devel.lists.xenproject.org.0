Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA4473735D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:58:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552190.862121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfcr-00034D-K3; Tue, 20 Jun 2023 17:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552190.862121; Tue, 20 Jun 2023 17:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfcr-000319-GE; Tue, 20 Jun 2023 17:58:45 +0000
Received: by outflank-mailman (input) for mailman id 552190;
 Tue, 20 Jun 2023 17:58:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnc8=CI=citrix.com=prvs=5286b1552=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBfcq-00030v-2g
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:58:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16048270-0f94-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:58:41 +0200 (CEST)
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
X-Inumbo-ID: 16048270-0f94-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687283921;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R1S3QB8hL1l2bG8BaIFgqjepsm8Ot1LOvm8engXmJtI=;
  b=YKyIQog78DjjPuU4w2Hbp838UCDPPZ50Hn9wPonCIU1dJkrvedKfoUm1
   3ji5oJcSuuyApTRrWNibaitlDarMvGM0OcEMcYs8owXskU81GepRhYRGb
   Y85CYJqKS9lPVNF2t+/hyxJSizdMhRUwigXhOYp1hS2/2asO4kCl/6nml
   M=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113529525
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:VfaQh6KSWgjf0KyQFE+RNpUlxSXFcZb7ZxGr2PjKsXjdYENS3mMFm
 zMdCmmAOf/bamamKdBzPozipBwEu5/QzN5qSFFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4AZmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5YUGUSy
 NxHLgktf0ymp+aQmLO1btRV05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWteGknHTgNRZfr0qYv/Ef6GnP1g1hlrPqNbI5f/TTHJ4IxBfF/
 D+uE2LRHC0iEY2E0ji+4F3z29ThgwHUSZIDG+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHsljw2VsdUEuY6wBqQ0aeS6AGcbkAfVSJIYtEisM4wRBQp2
 0WPktevAiZg2JWKTVqN+7HSqim9UQAXMGsDaCksXQYDpd75r+kbsBXLSdpyFb+vuff8Ezrw3
 jOioTA3gvMYistj/6+250zdijSg4J3AVBco5x7/V3igqAh+YeaYi5eAsAaBq6wadcDAEwfH5
 SJf8ySD0AwQJb7ckHCwYLoLJZG4u9OlNBuEgFBLIqB0olxB5EWfkZBsDCBWfRk5bZxUI2WwO
 yc/qisKusYNYSLCgbtfJtvoVp90lfWI+cHNDKi8UzZYXnRmmOZrFglKbFXY4W3imVNEfUoXa
 cbCKpbE4Zr35M1aINuKqwQ1i+VDKtgWnz+7eHwC503PPUCiTHCUU6wZF1CFc/o06qiJyC2Mr
 YYAbprblkUPDbGgCsUyzWL1BQpXRZTcLcqsw/G7i8bZelY2cI3fI6K5LUwdl3xNwP0Oy7agE
 oCVUU5E0lvv7UAr2i3TAk2PnIjHBM4lxVpiZHxEALpd8yR7CWpZxPtFJsRfkHhO3LAL8MOYu
 NFfKpnaXqQRFGWvFvZ0RcCVkbGOvS+D3WqmVxdJqhBkF3K8b2QlIuPZQzY=
IronPort-HdrOrdr: A9a23:oQB9KqkfZy5GXlpuc99rRQ36SdbpDfIf3DAbv31ZSRFFG/Fwwf
 re5cjztCWE7Qr4Ohkb8+xoXZPsfZqyz/JICOUqUotKPzOW2ldATrsD0WK4+UyHJ8SWzIc0vp
 uIFZIRNDSaNykYsS+V2miF+3lL+qj+zEgF792uq0uE7GtRGsZd0zs=
X-Talos-CUID: 9a23:r6iqpWH2TjIaw+ljqmJIpUpIJ+B6dET93Sv1A0ueUWdnbICsHAo=
X-Talos-MUID: 9a23:18jn6Asr1MwpS6lPMc2nmg1aEZZz+KaVGm9SzK4opeurJDxhNGLI
X-IronPort-AV: E=Sophos;i="6.00,257,1681185600"; 
   d="scan'208";a="113529525"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/decompress: Drop bool_t and use bool instead
Date: Tue, 20 Jun 2023 18:58:35 +0100
Message-ID: <20230620175835.3908246-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In particular, the libxg wrapper for unxz.c uses char for bool_t which is a
major antipattern.  Luckily the code doesn't suffer from truncated values.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
---
 .../libs/guest/xg_dom_decompress_unsafe_xz.c  |  1 -
 xen/common/unxz.c                             |  2 +-
 xen/common/xz/dec_bcj.c                       |  6 +++---
 xen/common/xz/dec_lzma2.c                     | 20 +++++++++----------
 xen/common/xz/dec_stream.c                    |  8 ++++----
 xen/common/xz/lzma2.h                         |  2 +-
 xen/common/xz/private.h                       |  2 +-
 7 files changed, 20 insertions(+), 21 deletions(-)

diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
index fc4819874111..80eed912dd68 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
@@ -11,7 +11,6 @@
 // TODO
 #define XZ_DEC_X86
 
-typedef char bool_t;
 typedef uint8_t u8;
 typedef uint16_t u16;
 typedef uint32_t u32;
diff --git a/xen/common/unxz.c b/xen/common/unxz.c
index 17aead0adfe6..9586a4e5c94f 100644
--- a/xen/common/unxz.c
+++ b/xen/common/unxz.c
@@ -166,7 +166,7 @@ int __init unxz(unsigned char *in, unsigned int in_size,
 	struct xz_buf b;
 	struct xz_dec *s;
 	enum xz_ret ret;
-	bool_t must_free_in = false;
+	bool must_free_in = false;
 
 	xz_crc32_init();
 
diff --git a/xen/common/xz/dec_bcj.c b/xen/common/xz/dec_bcj.c
index bfa498587ab8..bdc59770f8a6 100644
--- a/xen/common/xz/dec_bcj.c
+++ b/xen/common/xz/dec_bcj.c
@@ -35,7 +35,7 @@ struct xz_dec_bcj {
 	enum xz_ret ret;
 
 	/* True if we are operating in single-call mode. */
-	bool_t single_call;
+	bool single_call;
 
 	/*
 	 * Absolute position relative to the beginning of the uncompressed
@@ -87,7 +87,7 @@ static inline int __init bcj_x86_test_msbyte(uint8_t b)
 
 static size_t __init bcj_x86(struct xz_dec_bcj *s, uint8_t *buf, size_t size)
 {
-	static const bool_t mask_to_allowed_status[8]
+	static const bool mask_to_allowed_status[8]
 		= { true, true, true, false, true, false, false, false };
 
 	static const uint8_t mask_to_bit_num[8] = { 0, 1, 2, 2, 3, 3, 3, 3 };
@@ -524,7 +524,7 @@ XZ_EXTERN enum xz_ret __init xz_dec_bcj_run(struct xz_dec_bcj *s,
 	return s->ret;
 }
 
-XZ_EXTERN struct xz_dec_bcj *__init xz_dec_bcj_create(bool_t single_call)
+XZ_EXTERN struct xz_dec_bcj *__init xz_dec_bcj_create(bool single_call)
 {
 	struct xz_dec_bcj *s = malloc(sizeof(*s));
 	if (s != NULL)
diff --git a/xen/common/xz/dec_lzma2.c b/xen/common/xz/dec_lzma2.c
index f80d8309f4c3..71359fab9f60 100644
--- a/xen/common/xz/dec_lzma2.c
+++ b/xen/common/xz/dec_lzma2.c
@@ -241,13 +241,13 @@ struct lzma2_dec {
 	 * True if dictionary reset is needed. This is false before
 	 * the first chunk (LZMA or uncompressed).
 	 */
-	bool_t need_dict_reset;
+	bool need_dict_reset;
 
 	/*
 	 * True if new LZMA properties are needed. This is false
 	 * before the first LZMA chunk.
 	 */
-	bool_t need_props;
+	bool need_props;
 };
 
 struct xz_dec_lzma2 {
@@ -306,7 +306,7 @@ static void __init dict_limit(struct dictionary *dict, size_t out_max)
 }
 
 /* Return true if at least one byte can be written into the dictionary. */
-static inline bool_t __init dict_has_space(const struct dictionary *dict)
+static inline bool __init dict_has_space(const struct dictionary *dict)
 {
 	return dict->pos < dict->limit;
 }
@@ -343,7 +343,7 @@ static inline void __init dict_put(struct dictionary *dict, uint8_t byte)
  * invalid, false is returned. On success, true is returned and *len is
  * updated to indicate how many bytes were left to be repeated.
  */
-static bool_t __init dict_repeat(struct dictionary *dict, uint32_t *len, uint32_t dist)
+static bool __init dict_repeat(struct dictionary *dict, uint32_t *len, uint32_t dist)
 {
 	size_t back;
 	uint32_t left;
@@ -463,7 +463,7 @@ static void __init rc_reset(struct rc_dec *rc)
  * Read the first five initial bytes into rc->code if they haven't been
  * read already. (Yes, the first byte gets completely ignored.)
  */
-static bool_t __init rc_read_init(struct rc_dec *rc, struct xz_buf *b)
+static bool __init rc_read_init(struct rc_dec *rc, struct xz_buf *b)
 {
 	while (rc->init_bytes_left > 0) {
 		if (b->in_pos == b->in_size)
@@ -477,7 +477,7 @@ static bool_t __init rc_read_init(struct rc_dec *rc, struct xz_buf *b)
 }
 
 /* Return true if there may not be enough input for the next decoding loop. */
-static inline bool_t __init rc_limit_exceeded(const struct rc_dec *rc)
+static inline bool __init rc_limit_exceeded(const struct rc_dec *rc)
 {
 	return rc->in_pos > rc->in_limit;
 }
@@ -486,7 +486,7 @@ static inline bool_t __init rc_limit_exceeded(const struct rc_dec *rc)
  * Return true if it is possible (from point of view of range decoder) that
  * we have reached the end of the LZMA chunk.
  */
-static inline bool_t __init rc_is_finished(const struct rc_dec *rc)
+static inline bool __init rc_is_finished(const struct rc_dec *rc)
 {
 	return rc->code == 0;
 }
@@ -736,7 +736,7 @@ static void __init lzma_rep_match(struct xz_dec_lzma2 *s, uint32_t pos_state)
 }
 
 /* LZMA decoder core */
-static bool_t __init lzma_main(struct xz_dec_lzma2 *s)
+static bool __init lzma_main(struct xz_dec_lzma2 *s)
 {
 	uint32_t pos_state;
 
@@ -814,7 +814,7 @@ static void __init lzma_reset(struct xz_dec_lzma2 *s)
  * from the decoded lp and pb values. On success, the LZMA decoder state is
  * reset and true is returned.
  */
-static bool_t __init lzma_props(struct xz_dec_lzma2 *s, uint8_t props)
+static bool __init lzma_props(struct xz_dec_lzma2 *s, uint8_t props)
 {
 	if (props > (4 * 5 + 4) * 9 + 8)
 		return false;
@@ -861,7 +861,7 @@ static bool_t __init lzma_props(struct xz_dec_lzma2 *s, uint8_t props)
  * function. We decode a few bytes from the temporary buffer so that we can
  * continue decoding from the caller-supplied input buffer again.
  */
-static bool_t __init lzma2_lzma(struct xz_dec_lzma2 *s, struct xz_buf *b)
+static bool __init lzma2_lzma(struct xz_dec_lzma2 *s, struct xz_buf *b)
 {
 	size_t in_avail;
 	uint32_t tmp;
diff --git a/xen/common/xz/dec_stream.c b/xen/common/xz/dec_stream.c
index b91d8362c19c..caea4f2596a1 100644
--- a/xen/common/xz/dec_stream.c
+++ b/xen/common/xz/dec_stream.c
@@ -55,7 +55,7 @@ struct xz_dec {
 	 * True if the next call to xz_dec_run() is allowed to return
 	 * XZ_BUF_ERROR.
 	 */
-	bool_t allow_buf_error;
+	bool allow_buf_error;
 
 	/* Information stored in Block Header */
 	struct {
@@ -132,7 +132,7 @@ struct xz_dec {
 
 #ifdef XZ_DEC_BCJ
 	struct xz_dec_bcj *bcj;
-	bool_t bcj_active;
+	bool bcj_active;
 #endif
 };
 
@@ -154,7 +154,7 @@ static const uint8_t check_sizes[16] = {
  * to copy into s->temp.buf. Return true once s->temp.pos has reached
  * s->temp.size.
  */
-static bool_t __init fill_temp(struct xz_dec *s, struct xz_buf *b)
+static bool __init fill_temp(struct xz_dec *s, struct xz_buf *b)
 {
 	size_t copy_size = min_t(size_t,
 			b->in_size - b->in_pos, s->temp.size - s->temp.pos);
@@ -367,7 +367,7 @@ static enum xz_ret __init crc32_validate(struct xz_dec *s, struct xz_buf *b)
  * Skip over the Check field when the Check ID is not supported.
  * Returns true once the whole Check field has been skipped over.
  */
-static bool_t __init check_skip(struct xz_dec *s, struct xz_buf *b)
+static bool __init check_skip(struct xz_dec *s, struct xz_buf *b)
 {
 	while (s->pos < check_sizes[s->check_type]) {
 		if (b->in_pos == b->in_size)
diff --git a/xen/common/xz/lzma2.h b/xen/common/xz/lzma2.h
index e0ef42e880a0..06a7edb4d720 100644
--- a/xen/common/xz/lzma2.h
+++ b/xen/common/xz/lzma2.h
@@ -90,7 +90,7 @@ static inline void __init lzma_state_short_rep(enum lzma_state *state)
 }
 
 /* Test if the previous symbol was a literal. */
-static inline bool_t __init lzma_state_is_literal(enum lzma_state state)
+static inline bool __init lzma_state_is_literal(enum lzma_state state)
 {
 	return state < LIT_STATES;
 }
diff --git a/xen/common/xz/private.h b/xen/common/xz/private.h
index 511343fcc234..e6814250e84f 100644
--- a/xen/common/xz/private.h
+++ b/xen/common/xz/private.h
@@ -237,7 +237,7 @@ XZ_EXTERN void xz_dec_lzma2_end(struct xz_dec_lzma2 *s);
  * Allocate memory for BCJ decoders. xz_dec_bcj_reset() must be used before
  * calling xz_dec_bcj_run().
  */
-XZ_EXTERN struct xz_dec_bcj *xz_dec_bcj_create(bool_t single_call);
+XZ_EXTERN struct xz_dec_bcj *xz_dec_bcj_create(bool single_call);
 
 /*
  * Decode the Filter ID of a BCJ filter. This implementation doesn't
-- 
2.30.2


