Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5532F7635
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 11:06:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67888.121373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Lzn-0004U4-NM; Fri, 15 Jan 2021 10:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67888.121373; Fri, 15 Jan 2021 10:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0Lzn-0004Te-JX; Fri, 15 Jan 2021 10:06:19 +0000
Received: by outflank-mailman (input) for mailman id 67888;
 Fri, 15 Jan 2021 10:06:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nfe5=GS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l0Lzl-0004TV-UB
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 10:06:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b63fecca-47b7-4334-954f-e0076c52daa7;
 Fri, 15 Jan 2021 10:06:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B37B8B7C6;
 Fri, 15 Jan 2021 10:06:14 +0000 (UTC)
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
X-Inumbo-ID: b63fecca-47b7-4334-954f-e0076c52daa7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610705174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ESkwtyK5Nu1bA/P4m9+5lQyfgo+yurvBw9ceYhr0twU=;
	b=bzlamc9JkW/FzKqEaQuY/4Yc+VuIOV+k9gxFPcChw4+u7JgDtlkyIjCwFqRtShWNiXMadl
	dx8jesBI2HBPpgY63/NqwQhV6uCCTzoffWz/jorWZewbGvTJfw8OLS+FeNAfxoQnre9bh3
	+dH193MgeUHNUmkC0Q7IkCy69/9ptyY=
Subject: [PATCH 2/3] lib: introduce xxhash
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, M A Young <m.a.young@durham.ac.uk>
References: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
Message-ID: <8545f5cb-8c4e-4486-6350-57de8bac36de@suse.com>
Date: Fri, 15 Jan 2021 11:06:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <0eba95b9-66eb-2692-1da1-c27784b9f51e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Taken from Linux at commit d89775fc929c ("lib/: replace HTTP links with
HTTPS ones"), but split into separate 32-bit and 64-bit sources, since
the immediate consumer (zstd) will need only the latter.

Note that the building of this code is restricted to x86 for now because
of the need to sort asm/unaligned.h for Arm.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- /dev/null
+++ b/xen/include/xen/xxhash.h
@@ -0,0 +1,259 @@
+/*
+ * xxHash - Extremely Fast Hash algorithm
+ * Copyright (C) 2012-2016, Yann Collet.
+ *
+ * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are
+ * met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above
+ *     copyright notice, this list of conditions and the following disclaimer
+ *     in the documentation and/or other materials provided with the
+ *     distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ *
+ * You can contact the author at:
+ * - xxHash homepage: https://cyan4973.github.io/xxHash/
+ * - xxHash source repository: https://github.com/Cyan4973/xxHash
+ */
+
+/*
+ * Notice extracted from xxHash homepage:
+ *
+ * xxHash is an extremely fast Hash algorithm, running at RAM speed limits.
+ * It also successfully passes all tests from the SMHasher suite.
+ *
+ * Comparison (single thread, Windows Seven 32 bits, using SMHasher on a Core 2
+ * Duo @3GHz)
+ *
+ * Name            Speed       Q.Score   Author
+ * xxHash          5.4 GB/s     10
+ * CrapWow         3.2 GB/s      2       Andrew
+ * MumurHash 3a    2.7 GB/s     10       Austin Appleby
+ * SpookyHash      2.0 GB/s     10       Bob Jenkins
+ * SBox            1.4 GB/s      9       Bret Mulvey
+ * Lookup3         1.2 GB/s      9       Bob Jenkins
+ * SuperFastHash   1.2 GB/s      1       Paul Hsieh
+ * CityHash64      1.05 GB/s    10       Pike & Alakuijala
+ * FNV             0.55 GB/s     5       Fowler, Noll, Vo
+ * CRC32           0.43 GB/s     9
+ * MD5-32          0.33 GB/s    10       Ronald L. Rivest
+ * SHA1-32         0.28 GB/s    10
+ *
+ * Q.Score is a measure of quality of the hash function.
+ * It depends on successfully passing SMHasher test set.
+ * 10 is a perfect score.
+ *
+ * A 64-bits version, named xxh64 offers much better speed,
+ * but for 64-bits applications only.
+ * Name     Speed on 64 bits    Speed on 32 bits
+ * xxh64       13.8 GB/s            1.9 GB/s
+ * xxh32        6.8 GB/s            6.0 GB/s
+ */
+
+#ifndef __XENXXHASH_H__
+#define __XENXXHASH_H__
+
+#include <xen/types.h>
+
+/*-****************************
+ * Simple Hash Functions
+ *****************************/
+
+/**
+ * xxh32() - calculate the 32-bit hash of the input with a given seed.
+ *
+ * @input:  The data to hash.
+ * @length: The length of the data to hash.
+ * @seed:   The seed can be used to alter the result predictably.
+ *
+ * Speed on Core 2 Duo @ 3 GHz (single thread, SMHasher benchmark) : 5.4 GB/s
+ *
+ * Return:  The 32-bit hash of the data.
+ */
+uint32_t xxh32(const void *input, size_t length, uint32_t seed);
+
+/**
+ * xxh64() - calculate the 64-bit hash of the input with a given seed.
+ *
+ * @input:  The data to hash.
+ * @length: The length of the data to hash.
+ * @seed:   The seed can be used to alter the result predictably.
+ *
+ * This function runs 2x faster on 64-bit systems, but slower on 32-bit systems.
+ *
+ * Return:  The 64-bit hash of the data.
+ */
+uint64_t xxh64(const void *input, size_t length, uint64_t seed);
+
+/**
+ * xxhash() - calculate wordsize hash of the input with a given seed
+ * @input:  The data to hash.
+ * @length: The length of the data to hash.
+ * @seed:   The seed can be used to alter the result predictably.
+ *
+ * If the hash does not need to be comparable between machines with
+ * different word sizes, this function will call whichever of xxh32()
+ * or xxh64() is faster.
+ *
+ * Return:  wordsize hash of the data.
+ */
+
+static inline unsigned long xxhash(const void *input, size_t length,
+				   uint64_t seed)
+{
+#if BITS_PER_LONG == 64
+       return xxh64(input, length, seed);
+#else
+       return xxh32(input, length, seed);
+#endif
+}
+
+/*-****************************
+ * Streaming Hash Functions
+ *****************************/
+
+/*
+ * These definitions are only meant to allow allocation of XXH state
+ * statically, on stack, or in a struct for example.
+ * Do not use members directly.
+ */
+
+/**
+ * struct xxh32_state - private xxh32 state, do not use members directly
+ */
+struct xxh32_state {
+	uint32_t total_len_32;
+	uint32_t large_len;
+	uint32_t v1;
+	uint32_t v2;
+	uint32_t v3;
+	uint32_t v4;
+	uint32_t mem32[4];
+	uint32_t memsize;
+};
+
+/**
+ * struct xxh32_state - private xxh64 state, do not use members directly
+ */
+struct xxh64_state {
+	uint64_t total_len;
+	uint64_t v1;
+	uint64_t v2;
+	uint64_t v3;
+	uint64_t v4;
+	uint64_t mem64[4];
+	uint32_t memsize;
+};
+
+/**
+ * xxh32_reset() - reset the xxh32 state to start a new hashing operation
+ *
+ * @state: The xxh32 state to reset.
+ * @seed:  Initialize the hash state with this seed.
+ *
+ * Call this function on any xxh32_state to prepare for a new hashing operation.
+ */
+void xxh32_reset(struct xxh32_state *state, uint32_t seed);
+
+/**
+ * xxh32_update() - hash the data given and update the xxh32 state
+ *
+ * @state:  The xxh32 state to update.
+ * @input:  The data to hash.
+ * @length: The length of the data to hash.
+ *
+ * After calling xxh32_reset() call xxh32_update() as many times as necessary.
+ *
+ * Return:  Zero on success, otherwise an error code.
+ */
+int xxh32_update(struct xxh32_state *state, const void *input, size_t length);
+
+/**
+ * xxh32_digest() - produce the current xxh32 hash
+ *
+ * @state: Produce the current xxh32 hash of this state.
+ *
+ * A hash value can be produced at any time. It is still possible to continue
+ * inserting input into the hash state after a call to xxh32_digest(), and
+ * generate new hashes later on, by calling xxh32_digest() again.
+ *
+ * Return: The xxh32 hash stored in the state.
+ */
+uint32_t xxh32_digest(const struct xxh32_state *state);
+
+/**
+ * xxh64_reset() - reset the xxh64 state to start a new hashing operation
+ *
+ * @state: The xxh64 state to reset.
+ * @seed:  Initialize the hash state with this seed.
+ */
+void xxh64_reset(struct xxh64_state *state, uint64_t seed);
+
+/**
+ * xxh64_update() - hash the data given and update the xxh64 state
+ * @state:  The xxh64 state to update.
+ * @input:  The data to hash.
+ * @length: The length of the data to hash.
+ *
+ * After calling xxh64_reset() call xxh64_update() as many times as necessary.
+ *
+ * Return:  Zero on success, otherwise an error code.
+ */
+int xxh64_update(struct xxh64_state *state, const void *input, size_t length);
+
+/**
+ * xxh64_digest() - produce the current xxh64 hash
+ *
+ * @state: Produce the current xxh64 hash of this state.
+ *
+ * A hash value can be produced at any time. It is still possible to continue
+ * inserting input into the hash state after a call to xxh64_digest(), and
+ * generate new hashes later on, by calling xxh64_digest() again.
+ *
+ * Return: The xxh64 hash stored in the state.
+ */
+uint64_t xxh64_digest(const struct xxh64_state *state);
+
+/*-**************************
+ * Utils
+ ***************************/
+
+/**
+ * xxh32_copy_state() - copy the source state into the destination state
+ *
+ * @src: The source xxh32 state.
+ * @dst: The destination xxh32 state.
+ */
+void xxh32_copy_state(struct xxh32_state *dst, const struct xxh32_state *src);
+
+/**
+ * xxh64_copy_state() - copy the source state into the destination state
+ *
+ * @src: The source xxh64 state.
+ * @dst: The destination xxh64 state.
+ */
+void xxh64_copy_state(struct xxh64_state *dst, const struct xxh64_state *src);
+
+#endif /* __XENXXHASH_H__ */
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -7,3 +7,5 @@ lib-y += list-sort.o
 lib-y += parse-size.o
 lib-y += rbtree.o
 lib-y += sort.o
+lib-$(CONFIG_X86) += xxhash32.o
+lib-$(CONFIG_X86) += xxhash64.o
--- /dev/null
+++ b/xen/lib/xxhash32.c
@@ -0,0 +1,259 @@
+/*
+ * xxHash - Extremely Fast Hash algorithm
+ * Copyright (C) 2012-2016, Yann Collet.
+ *
+ * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are
+ * met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above
+ *     copyright notice, this list of conditions and the following disclaimer
+ *     in the documentation and/or other materials provided with the
+ *     distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ *
+ * You can contact the author at:
+ * - xxHash homepage: https://cyan4973.github.io/xxHash/
+ * - xxHash source repository: https://github.com/Cyan4973/xxHash
+ */
+
+#include <xen/compiler.h>
+#include <xen/errno.h>
+#include <xen/string.h>
+#include <xen/xxhash.h>
+#include <asm/unaligned.h>
+
+/*-*************************************
+ * Macros
+ **************************************/
+#define xxh_rotl32(x, r) ((x << r) | (x >> (32 - r)))
+
+#ifdef __LITTLE_ENDIAN
+# define XXH_CPU_LITTLE_ENDIAN 1
+#else
+# define XXH_CPU_LITTLE_ENDIAN 0
+#endif
+
+/*-*************************************
+ * Constants
+ **************************************/
+static const uint32_t PRIME32_1 = 2654435761U;
+static const uint32_t PRIME32_2 = 2246822519U;
+static const uint32_t PRIME32_3 = 3266489917U;
+static const uint32_t PRIME32_4 =  668265263U;
+static const uint32_t PRIME32_5 =  374761393U;
+
+/*-**************************
+ *  Utils
+ ***************************/
+void xxh32_copy_state(struct xxh32_state *dst, const struct xxh32_state *src)
+{
+	memcpy(dst, src, sizeof(*dst));
+}
+
+/*-***************************
+ * Simple Hash Functions
+ ****************************/
+static uint32_t xxh32_round(uint32_t seed, const uint32_t input)
+{
+	seed += input * PRIME32_2;
+	seed = xxh_rotl32(seed, 13);
+	seed *= PRIME32_1;
+	return seed;
+}
+
+uint32_t xxh32(const void *input, const size_t len, const uint32_t seed)
+{
+	const uint8_t *p = (const uint8_t *)input;
+	const uint8_t *b_end = p + len;
+	uint32_t h32;
+
+	if (len >= 16) {
+		const uint8_t *const limit = b_end - 16;
+		uint32_t v1 = seed + PRIME32_1 + PRIME32_2;
+		uint32_t v2 = seed + PRIME32_2;
+		uint32_t v3 = seed + 0;
+		uint32_t v4 = seed - PRIME32_1;
+
+		do {
+			v1 = xxh32_round(v1, get_unaligned_le32(p));
+			p += 4;
+			v2 = xxh32_round(v2, get_unaligned_le32(p));
+			p += 4;
+			v3 = xxh32_round(v3, get_unaligned_le32(p));
+			p += 4;
+			v4 = xxh32_round(v4, get_unaligned_le32(p));
+			p += 4;
+		} while (p <= limit);
+
+		h32 = xxh_rotl32(v1, 1) + xxh_rotl32(v2, 7) +
+			xxh_rotl32(v3, 12) + xxh_rotl32(v4, 18);
+	} else {
+		h32 = seed + PRIME32_5;
+	}
+
+	h32 += (uint32_t)len;
+
+	while (p + 4 <= b_end) {
+		h32 += get_unaligned_le32(p) * PRIME32_3;
+		h32 = xxh_rotl32(h32, 17) * PRIME32_4;
+		p += 4;
+	}
+
+	while (p < b_end) {
+		h32 += (*p) * PRIME32_5;
+		h32 = xxh_rotl32(h32, 11) * PRIME32_1;
+		p++;
+	}
+
+	h32 ^= h32 >> 15;
+	h32 *= PRIME32_2;
+	h32 ^= h32 >> 13;
+	h32 *= PRIME32_3;
+	h32 ^= h32 >> 16;
+
+	return h32;
+}
+
+/*-**************************************************
+ * Advanced Hash Functions
+ ***************************************************/
+void xxh32_reset(struct xxh32_state *statePtr, const uint32_t seed)
+{
+	/* use a local state for memcpy() to avoid strict-aliasing warnings */
+	struct xxh32_state state;
+
+	memset(&state, 0, sizeof(state));
+	state.v1 = seed + PRIME32_1 + PRIME32_2;
+	state.v2 = seed + PRIME32_2;
+	state.v3 = seed + 0;
+	state.v4 = seed - PRIME32_1;
+	memcpy(statePtr, &state, sizeof(state));
+}
+
+int xxh32_update(struct xxh32_state *state, const void *input, const size_t len)
+{
+	const uint8_t *p = (const uint8_t *)input;
+	const uint8_t *const b_end = p + len;
+
+	if (input == NULL)
+		return -EINVAL;
+
+	state->total_len_32 += (uint32_t)len;
+	state->large_len |= (len >= 16) | (state->total_len_32 >= 16);
+
+	if (state->memsize + len < 16) { /* fill in tmp buffer */
+		memcpy((uint8_t *)(state->mem32) + state->memsize, input, len);
+		state->memsize += (uint32_t)len;
+		return 0;
+	}
+
+	if (state->memsize) { /* some data left from previous update */
+		const uint32_t *p32 = state->mem32;
+
+		memcpy((uint8_t *)(state->mem32) + state->memsize, input,
+			16 - state->memsize);
+
+		state->v1 = xxh32_round(state->v1, get_unaligned_le32(p32));
+		p32++;
+		state->v2 = xxh32_round(state->v2, get_unaligned_le32(p32));
+		p32++;
+		state->v3 = xxh32_round(state->v3, get_unaligned_le32(p32));
+		p32++;
+		state->v4 = xxh32_round(state->v4, get_unaligned_le32(p32));
+		p32++;
+
+		p += 16-state->memsize;
+		state->memsize = 0;
+	}
+
+	if (p <= b_end - 16) {
+		const uint8_t *const limit = b_end - 16;
+		uint32_t v1 = state->v1;
+		uint32_t v2 = state->v2;
+		uint32_t v3 = state->v3;
+		uint32_t v4 = state->v4;
+
+		do {
+			v1 = xxh32_round(v1, get_unaligned_le32(p));
+			p += 4;
+			v2 = xxh32_round(v2, get_unaligned_le32(p));
+			p += 4;
+			v3 = xxh32_round(v3, get_unaligned_le32(p));
+			p += 4;
+			v4 = xxh32_round(v4, get_unaligned_le32(p));
+			p += 4;
+		} while (p <= limit);
+
+		state->v1 = v1;
+		state->v2 = v2;
+		state->v3 = v3;
+		state->v4 = v4;
+	}
+
+	if (p < b_end) {
+		memcpy(state->mem32, p, (size_t)(b_end-p));
+		state->memsize = (uint32_t)(b_end-p);
+	}
+
+	return 0;
+}
+
+uint32_t xxh32_digest(const struct xxh32_state *state)
+{
+	const uint8_t *p = (const uint8_t *)state->mem32;
+	const uint8_t *const b_end = (const uint8_t *)(state->mem32) +
+		state->memsize;
+	uint32_t h32;
+
+	if (state->large_len) {
+		h32 = xxh_rotl32(state->v1, 1) + xxh_rotl32(state->v2, 7) +
+			xxh_rotl32(state->v3, 12) + xxh_rotl32(state->v4, 18);
+	} else {
+		h32 = state->v3 /* == seed */ + PRIME32_5;
+	}
+
+	h32 += state->total_len_32;
+
+	while (p + 4 <= b_end) {
+		h32 += get_unaligned_le32(p) * PRIME32_3;
+		h32 = xxh_rotl32(h32, 17) * PRIME32_4;
+		p += 4;
+	}
+
+	while (p < b_end) {
+		h32 += (*p) * PRIME32_5;
+		h32 = xxh_rotl32(h32, 11) * PRIME32_1;
+		p++;
+	}
+
+	h32 ^= h32 >> 15;
+	h32 *= PRIME32_2;
+	h32 ^= h32 >> 13;
+	h32 *= PRIME32_3;
+	h32 ^= h32 >> 16;
+
+	return h32;
+}
+
--- /dev/null
+++ b/xen/lib/xxhash64.c
@@ -0,0 +1,294 @@
+/*
+ * xxHash - Extremely Fast Hash algorithm
+ * Copyright (C) 2012-2016, Yann Collet.
+ *
+ * BSD 2-Clause License (http://www.opensource.org/licenses/bsd-license.php)
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are
+ * met:
+ *
+ *   * Redistributions of source code must retain the above copyright
+ *     notice, this list of conditions and the following disclaimer.
+ *   * Redistributions in binary form must reproduce the above
+ *     copyright notice, this list of conditions and the following disclaimer
+ *     in the documentation and/or other materials provided with the
+ *     distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
+ * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
+ * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
+ * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
+ * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
+ * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
+ * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
+ * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
+ * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
+ * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ *
+ * You can contact the author at:
+ * - xxHash homepage: https://cyan4973.github.io/xxHash/
+ * - xxHash source repository: https://github.com/Cyan4973/xxHash
+ */
+
+#include <xen/compiler.h>
+#include <xen/errno.h>
+#include <xen/string.h>
+#include <xen/xxhash.h>
+#include <asm/unaligned.h>
+
+/*-*************************************
+ * Macros
+ **************************************/
+#define xxh_rotl64(x, r) ((x << r) | (x >> (64 - r)))
+
+#ifdef __LITTLE_ENDIAN
+# define XXH_CPU_LITTLE_ENDIAN 1
+#else
+# define XXH_CPU_LITTLE_ENDIAN 0
+#endif
+
+/*-*************************************
+ * Constants
+ **************************************/
+static const uint64_t PRIME64_1 = 11400714785074694791ULL;
+static const uint64_t PRIME64_2 = 14029467366897019727ULL;
+static const uint64_t PRIME64_3 =  1609587929392839161ULL;
+static const uint64_t PRIME64_4 =  9650029242287828579ULL;
+static const uint64_t PRIME64_5 =  2870177450012600261ULL;
+
+/*-**************************
+ *  Utils
+ ***************************/
+void xxh64_copy_state(struct xxh64_state *dst, const struct xxh64_state *src)
+{
+	memcpy(dst, src, sizeof(*dst));
+}
+
+/*-***************************
+ * Simple Hash Functions
+ ****************************/
+static uint64_t xxh64_round(uint64_t acc, const uint64_t input)
+{
+	acc += input * PRIME64_2;
+	acc = xxh_rotl64(acc, 31);
+	acc *= PRIME64_1;
+	return acc;
+}
+
+static uint64_t xxh64_merge_round(uint64_t acc, uint64_t val)
+{
+	val = xxh64_round(0, val);
+	acc ^= val;
+	acc = acc * PRIME64_1 + PRIME64_4;
+	return acc;
+}
+
+uint64_t xxh64(const void *input, const size_t len, const uint64_t seed)
+{
+	const uint8_t *p = (const uint8_t *)input;
+	const uint8_t *const b_end = p + len;
+	uint64_t h64;
+
+	if (len >= 32) {
+		const uint8_t *const limit = b_end - 32;
+		uint64_t v1 = seed + PRIME64_1 + PRIME64_2;
+		uint64_t v2 = seed + PRIME64_2;
+		uint64_t v3 = seed + 0;
+		uint64_t v4 = seed - PRIME64_1;
+
+		do {
+			v1 = xxh64_round(v1, get_unaligned_le64(p));
+			p += 8;
+			v2 = xxh64_round(v2, get_unaligned_le64(p));
+			p += 8;
+			v3 = xxh64_round(v3, get_unaligned_le64(p));
+			p += 8;
+			v4 = xxh64_round(v4, get_unaligned_le64(p));
+			p += 8;
+		} while (p <= limit);
+
+		h64 = xxh_rotl64(v1, 1) + xxh_rotl64(v2, 7) +
+			xxh_rotl64(v3, 12) + xxh_rotl64(v4, 18);
+		h64 = xxh64_merge_round(h64, v1);
+		h64 = xxh64_merge_round(h64, v2);
+		h64 = xxh64_merge_round(h64, v3);
+		h64 = xxh64_merge_round(h64, v4);
+
+	} else {
+		h64  = seed + PRIME64_5;
+	}
+
+	h64 += (uint64_t)len;
+
+	while (p + 8 <= b_end) {
+		const uint64_t k1 = xxh64_round(0, get_unaligned_le64(p));
+
+		h64 ^= k1;
+		h64 = xxh_rotl64(h64, 27) * PRIME64_1 + PRIME64_4;
+		p += 8;
+	}
+
+	if (p + 4 <= b_end) {
+		h64 ^= (uint64_t)(get_unaligned_le32(p)) * PRIME64_1;
+		h64 = xxh_rotl64(h64, 23) * PRIME64_2 + PRIME64_3;
+		p += 4;
+	}
+
+	while (p < b_end) {
+		h64 ^= (*p) * PRIME64_5;
+		h64 = xxh_rotl64(h64, 11) * PRIME64_1;
+		p++;
+	}
+
+	h64 ^= h64 >> 33;
+	h64 *= PRIME64_2;
+	h64 ^= h64 >> 29;
+	h64 *= PRIME64_3;
+	h64 ^= h64 >> 32;
+
+	return h64;
+}
+
+/*-**************************************************
+ * Advanced Hash Functions
+ ***************************************************/
+void xxh64_reset(struct xxh64_state *statePtr, const uint64_t seed)
+{
+	/* use a local state for memcpy() to avoid strict-aliasing warnings */
+	struct xxh64_state state;
+
+	memset(&state, 0, sizeof(state));
+	state.v1 = seed + PRIME64_1 + PRIME64_2;
+	state.v2 = seed + PRIME64_2;
+	state.v3 = seed + 0;
+	state.v4 = seed - PRIME64_1;
+	memcpy(statePtr, &state, sizeof(state));
+}
+
+int xxh64_update(struct xxh64_state *state, const void *input, const size_t len)
+{
+	const uint8_t *p = (const uint8_t *)input;
+	const uint8_t *const b_end = p + len;
+
+	if (input == NULL)
+		return -EINVAL;
+
+	state->total_len += len;
+
+	if (state->memsize + len < 32) { /* fill in tmp buffer */
+		memcpy(((uint8_t *)state->mem64) + state->memsize, input, len);
+		state->memsize += (uint32_t)len;
+		return 0;
+	}
+
+	if (state->memsize) { /* tmp buffer is full */
+		uint64_t *p64 = state->mem64;
+
+		memcpy(((uint8_t *)p64) + state->memsize, input,
+			32 - state->memsize);
+
+		state->v1 = xxh64_round(state->v1, get_unaligned_le64(p64));
+		p64++;
+		state->v2 = xxh64_round(state->v2, get_unaligned_le64(p64));
+		p64++;
+		state->v3 = xxh64_round(state->v3, get_unaligned_le64(p64));
+		p64++;
+		state->v4 = xxh64_round(state->v4, get_unaligned_le64(p64));
+
+		p += 32 - state->memsize;
+		state->memsize = 0;
+	}
+
+	if (p + 32 <= b_end) {
+		const uint8_t *const limit = b_end - 32;
+		uint64_t v1 = state->v1;
+		uint64_t v2 = state->v2;
+		uint64_t v3 = state->v3;
+		uint64_t v4 = state->v4;
+
+		do {
+			v1 = xxh64_round(v1, get_unaligned_le64(p));
+			p += 8;
+			v2 = xxh64_round(v2, get_unaligned_le64(p));
+			p += 8;
+			v3 = xxh64_round(v3, get_unaligned_le64(p));
+			p += 8;
+			v4 = xxh64_round(v4, get_unaligned_le64(p));
+			p += 8;
+		} while (p <= limit);
+
+		state->v1 = v1;
+		state->v2 = v2;
+		state->v3 = v3;
+		state->v4 = v4;
+	}
+
+	if (p < b_end) {
+		memcpy(state->mem64, p, (size_t)(b_end-p));
+		state->memsize = (uint32_t)(b_end - p);
+	}
+
+	return 0;
+}
+
+uint64_t xxh64_digest(const struct xxh64_state *state)
+{
+	const uint8_t *p = (const uint8_t *)state->mem64;
+	const uint8_t *const b_end = (const uint8_t *)state->mem64 +
+		state->memsize;
+	uint64_t h64;
+
+	if (state->total_len >= 32) {
+		const uint64_t v1 = state->v1;
+		const uint64_t v2 = state->v2;
+		const uint64_t v3 = state->v3;
+		const uint64_t v4 = state->v4;
+
+		h64 = xxh_rotl64(v1, 1) + xxh_rotl64(v2, 7) +
+			xxh_rotl64(v3, 12) + xxh_rotl64(v4, 18);
+		h64 = xxh64_merge_round(h64, v1);
+		h64 = xxh64_merge_round(h64, v2);
+		h64 = xxh64_merge_round(h64, v3);
+		h64 = xxh64_merge_round(h64, v4);
+	} else {
+		h64  = state->v3 + PRIME64_5;
+	}
+
+	h64 += (uint64_t)state->total_len;
+
+	while (p + 8 <= b_end) {
+		const uint64_t k1 = xxh64_round(0, get_unaligned_le64(p));
+
+		h64 ^= k1;
+		h64 = xxh_rotl64(h64, 27) * PRIME64_1 + PRIME64_4;
+		p += 8;
+	}
+
+	if (p + 4 <= b_end) {
+		h64 ^= (uint64_t)(get_unaligned_le32(p)) * PRIME64_1;
+		h64 = xxh_rotl64(h64, 23) * PRIME64_2 + PRIME64_3;
+		p += 4;
+	}
+
+	while (p < b_end) {
+		h64 ^= (*p) * PRIME64_5;
+		h64 = xxh_rotl64(h64, 11) * PRIME64_1;
+		p++;
+	}
+
+	h64 ^= h64 >> 33;
+	h64 *= PRIME64_2;
+	h64 ^= h64 >> 29;
+	h64 *= PRIME64_3;
+	h64 ^= h64 >> 32;
+
+	return h64;
+}


