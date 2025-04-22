Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65022A9700F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 17:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.962873.1354031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FH8-0007ze-Tt; Tue, 22 Apr 2025 15:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 962873.1354031; Tue, 22 Apr 2025 15:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7FH8-0007xQ-Pi; Tue, 22 Apr 2025 15:11:06 +0000
Received: by outflank-mailman (input) for mailman id 962873;
 Tue, 22 Apr 2025 15:11:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiSK=XI=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1u7FDn-0000lQ-NY
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 15:07:39 +0000
Received: from 3.mo561.mail-out.ovh.net (3.mo561.mail-out.ovh.net
 [46.105.44.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 87b4c9eb-1f8b-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 17:07:38 +0200 (CEST)
Received: from director5.ghost.mail-out.ovh.net (unknown [10.109.148.79])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4ZhlwB25jwz1bkB
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 15:07:38 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-6lh9k (unknown [10.110.118.244])
 by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 607401FEB0;
 Tue, 22 Apr 2025 15:07:37 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.107])
 by ghost-submission-5b5ff79f4f-6lh9k with ESMTPSA
 id 5U5yDrmwB2ghLAEAYYaAsQ
 (envelope-from <sergii.dmytruk@3mdeb.com>); Tue, 22 Apr 2025 15:07:37 +0000
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
X-Inumbo-ID: 87b4c9eb-1f8b-11f0-9eb0-5ba50f476ded
Authentication-Results:garm.ovh; auth=pass (GARM-107S001d849ccc2-e4d5-46c9-818c-6ce398306f16,
                    7E508E014E7E7C169EB13C6E22C3C4EBF1F0FDD7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH 12/21] x86/tpm.c: support extending PCRs of TPM2.0
Date: Tue, 22 Apr 2025 18:06:46 +0300
Message-ID: <755e15243aa8f510ad1b8b4a463dc5235dd4a7e0.1745172094.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
References: <cover.1745172094.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12734209424960959644
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeegtdehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgvrhhgihhiucffmhihthhruhhkuceoshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvhfehudekhfevieefffefvdefjeeggeekuefhgeehjeehgfeiieekjeeliefhffenucffohhmrghinhepuhhpuggrthgvpggtrdgurghtrgdpfhhinhhishhhpggtrdgurghtrgenucfkphepuddvjedrtddrtddruddpudejiedrudduuddrudekuddrudejkedpfeejrdehledrudegvddruddtjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=LnQanrLZSiseLtQH/HLftA62py2wzTEodAlV4bGhsCQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745334458; v=1;
 b=Bxc1cM6TL/BrqXqKe3g8zOG0coHU6IUVJ/Nm7s7kgKb6+lAc2/igrYrMQ7IjtBfOQiqVfqWG
 e2trFbz+kCKEJzVc5Dq/ebEnMZQeodvHdiJUdqYwt310LPqgjDCS80kmK5Pm/OKljGqM/b5vvqx
 fNyQKBcCX7S4zU4RbIsIVwnvK1SkcbHOaVNOdiLFV2EnlnUr00nVCI/x3cH+d4gqOsNEVnvNnD5
 7PEBAmeYR4gQCC83X5w/0/4injkq5mHNQ6a3lTCR2EkV4d/ftcSkd3KzRILhXsk98oBXHT52Nlu
 JiKXYg2hNaKe0PGcP9Bkrymlyn6UXiuQ8r4mXtNEZVDKg==

SHA1 and SHA256 are hard-coded here, but their support by the TPM is
checked.  Addition of event log for TPM2.0 will generalize the code
further.

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/tpm.c | 465 +++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 453 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/tpm.c b/xen/arch/x86/tpm.c
index 8cf836d0df..9d20cff94e 100644
--- a/xen/arch/x86/tpm.c
+++ b/xen/arch/x86/tpm.c
@@ -5,6 +5,7 @@
  */
 
 #include <xen/sha1.h>
+#include <xen/sha256.h>
 #include <xen/types.h>
 #include <asm/intel_txt.h>
 #include <asm/slaunch.h>
@@ -30,6 +31,15 @@ struct slr_table *slaunch_get_slrt(void)
  * other part of Xen.  Providing implementation of builtin functions in this
  * case is necessary if compiler chooses to not use an inline builtin.
  */
+void *memset(void *dest, int c, size_t n)
+{
+    uint8_t *d = dest;
+
+    while ( n-- )
+        *d++ = c;
+
+    return dest;
+}
 void *memcpy(void *dest, const void *src, size_t n)
 {
     const uint8_t *s = src;
@@ -65,6 +75,7 @@ void *memcpy(void *dest, const void *src, size_t n)
 
 #define swap16(x)       __builtin_bswap16(x)
 #define swap32(x)       __builtin_bswap32(x)
+#define memset(s, c, n) __builtin_memset(s, c, n)
 #define memcpy(d, s, n) __builtin_memcpy(d, s, n)
 
 static inline volatile uint32_t tis_read32(unsigned reg)
@@ -146,14 +157,15 @@ static inline bool is_tpm12(void)
             (tis_read32(TPM_STS_(0)) & TPM_FAMILY_MASK) == 0);
 }
 
-/****************************** TPM1.2 specific *******************************/
-#define TPM_ORD_Extend              0x00000014
-#define TPM_ORD_SHA1Start           0x000000A0
-#define TPM_ORD_SHA1Update          0x000000A1
-#define TPM_ORD_SHA1CompleteExtend  0x000000A3
+/****************************** TPM1.2 & TPM2.0 *******************************/
 
-#define TPM_TAG_RQU_COMMAND         0x00C1
-#define TPM_TAG_RSP_COMMAND         0x00C4
+/*
+ * TPM1.2 is required to support commands of up to 1101 bytes, vendors rarely
+ * go above that. Limit maximum size of block of data to be hashed to 1024.
+ *
+ * TPM2.0 should support hashing of at least 1024 bytes.
+ */
+#define MAX_HASH_BLOCK      1024
 
 /* All fields of following structs are big endian. */
 struct tpm_cmd_hdr {
@@ -168,6 +180,17 @@ struct tpm_rsp_hdr {
     uint32_t    returnCode;
 } __packed;
 
+/****************************** TPM1.2 specific *******************************/
+
+#define TPM_ORD_Extend              0x00000014
+#define TPM_ORD_SHA1Start           0x000000A0
+#define TPM_ORD_SHA1Update          0x000000A1
+#define TPM_ORD_SHA1CompleteExtend  0x000000A3
+
+#define TPM_TAG_RQU_COMMAND         0x00C1
+#define TPM_TAG_RSP_COMMAND         0x00C4
+
+/* All fields of following structs are big endian. */
 struct extend_cmd {
     struct tpm_cmd_hdr h;
     uint32_t pcrNum;
@@ -233,11 +256,6 @@ struct txt_ev_log_container_12 {
 };
 
 #ifdef __EARLY_SLAUNCH__
-/*
- * TPM1.2 is required to support commands of up to 1101 bytes, vendors rarely
- * go above that. Limit maximum size of block of data to be hashed to 1024.
- */
-#define MAX_HASH_BLOCK      1024
 #define CMD_RSP_BUF_SIZE    (sizeof(struct sha1_update_cmd) + MAX_HASH_BLOCK)
 
 union cmd_rsp {
@@ -393,6 +411,400 @@ static void *create_log_event12(struct txt_ev_log_container_12 *evt_log,
 
 /************************** end of TPM1.2 specific ****************************/
 
+/****************************** TPM2.0 specific *******************************/
+
+/*
+ * These constants are for TPM2.0 but don't have a distinct prefix to match
+ * names in the specification.
+ */
+
+#define TPM_HT_PCR   0x00
+
+#define TPM_RH_NULL  0x40000007
+#define TPM_RS_PW    0x40000009
+
+#define HR_SHIFT     24
+#define HR_PCR       (TPM_HT_PCR << HR_SHIFT)
+
+#define TPM_ST_NO_SESSIONS  0x8001
+#define TPM_ST_SESSIONS     0x8002
+
+#define TPM_ALG_SHA1        0x0004
+#define TPM_ALG_SHA256      0x000b
+#define TPM_ALG_NULL        0x0010
+
+#define TPM2_PCR_Extend                 0x00000182
+#define TPM2_PCR_HashSequenceStart      0x00000186
+#define TPM2_PCR_SequenceUpdate         0x0000015C
+#define TPM2_PCR_EventSequenceComplete  0x00000185
+
+#define PUT_BYTES(p, bytes, size)  do {  \
+        memcpy((p), (bytes), (size));    \
+        (p) += (size);                   \
+    } while ( 0 )
+
+#define PUT_16BIT(p, data) do {          \
+        *(uint16_t *)(p) = swap16(data); \
+        (p) += 2;                        \
+    } while ( 0 )
+
+/* All fields of following structs are big endian. */
+struct tpm2_session_header {
+    uint32_t handle;
+    uint16_t nonceSize;
+    uint8_t nonce[0];
+    uint8_t attrs;
+    uint16_t hmacSize;
+    uint8_t hmac[0];
+} __packed;
+
+struct tpm2_extend_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t pcrHandle;
+    uint32_t sessionHdrSize;
+    struct tpm2_session_header pcrSession;
+    uint32_t hashCount;
+    uint8_t hashes[0];
+} __packed;
+
+struct tpm2_extend_rsp {
+    struct tpm_rsp_hdr h;
+} __packed;
+
+struct tpm2_sequence_start_cmd {
+    struct tpm_cmd_hdr h;
+    uint16_t hmacSize;
+    uint8_t hmac[0];
+    uint16_t hashAlg;
+} __packed;
+
+struct tpm2_sequence_start_rsp {
+    struct tpm_rsp_hdr h;
+    uint32_t sequenceHandle;
+} __packed;
+
+struct tpm2_sequence_update_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t sequenceHandle;
+    uint32_t sessionHdrSize;
+    struct tpm2_session_header session;
+    uint16_t dataSize;
+    uint8_t data[0];
+} __packed;
+
+struct tpm2_sequence_update_rsp {
+    struct tpm_rsp_hdr h;
+} __packed;
+
+struct tpm2_sequence_complete_cmd {
+    struct tpm_cmd_hdr h;
+    uint32_t pcrHandle;
+    uint32_t sequenceHandle;
+    uint32_t sessionHdrSize;
+    struct tpm2_session_header pcrSession;
+    struct tpm2_session_header sequenceSession;
+    uint16_t dataSize;
+    uint8_t data[0];
+} __packed;
+
+struct tpm2_sequence_complete_rsp {
+    struct tpm_rsp_hdr h;
+    uint32_t paramSize;
+    uint32_t hashCount;
+    uint8_t hashes[0];
+    /*
+     * Each hash is represented as:
+     * struct {
+     *     uint16_t hashAlg;
+     *     uint8_t hash[size of hashAlg];
+     * };
+     */
+} __packed;
+
+/*
+ * These two structure are for convenience, they don't correspond to anything in
+ * any spec.
+ */
+struct tpm2_log_hash {
+    uint16_t alg;  /* TPM_ALG_* */
+    uint16_t size;
+    uint8_t *data; /* Non-owning reference to a buffer inside log entry. */
+};
+/* Should be more than enough for now and awhile in the future. */
+#define MAX_HASH_COUNT 8
+struct tpm2_log_hashes {
+    uint32_t count;
+    struct tpm2_log_hash hashes[MAX_HASH_COUNT];
+};
+
+#ifdef __EARLY_SLAUNCH__
+
+union tpm2_cmd_rsp {
+    uint8_t b[sizeof(struct tpm2_sequence_update_cmd) + MAX_HASH_BLOCK];
+    struct tpm_cmd_hdr c;
+    struct tpm_rsp_hdr r;
+    struct tpm2_sequence_start_cmd start_c;
+    struct tpm2_sequence_start_rsp start_r;
+    struct tpm2_sequence_update_cmd update_c;
+    struct tpm2_sequence_update_rsp update_r;
+    struct tpm2_sequence_complete_cmd finish_c;
+    struct tpm2_sequence_complete_rsp finish_r;
+};
+
+static uint32_t tpm2_hash_extend(unsigned loc, const uint8_t *buf,
+                                 unsigned size, unsigned pcr,
+                                 struct tpm2_log_hashes *log_hashes)
+{
+    uint32_t seq_handle;
+    unsigned max_bytes = MAX_HASH_BLOCK;
+
+    union tpm2_cmd_rsp cmd_rsp;
+    unsigned o_size;
+    unsigned i;
+    uint8_t *p;
+    uint32_t rc;
+
+    cmd_rsp.start_c = (struct tpm2_sequence_start_cmd) {
+        .h.tag = swap16(TPM_ST_NO_SESSIONS),
+        .h.paramSize = swap32(sizeof(cmd_rsp.start_c)),
+        .h.ordinal = swap32(TPM2_PCR_HashSequenceStart),
+        .hashAlg = swap16(TPM_ALG_NULL), /* Compute all supported hashes. */
+    };
+
+    request_locality(loc);
+
+    o_size = sizeof(cmd_rsp);
+    send_cmd(loc, cmd_rsp.b, swap32(cmd_rsp.c.paramSize), &o_size);
+
+    if ( cmd_rsp.r.tag == swap16(TPM_ST_NO_SESSIONS) &&
+         cmd_rsp.r.paramSize == swap32(10) )
+    {
+        rc = swap32(cmd_rsp.r.returnCode);
+        if ( rc != 0 )
+            goto error;
+    }
+
+    seq_handle = swap32(cmd_rsp.start_r.sequenceHandle);
+
+    while ( size > 64 )
+    {
+        if ( size < max_bytes )
+            max_bytes = size & ~(64 - 1);
+
+        cmd_rsp.update_c = (struct tpm2_sequence_update_cmd) {
+            .h.tag = swap16(TPM_ST_SESSIONS),
+            .h.paramSize = swap32(sizeof(cmd_rsp.update_c) + max_bytes),
+            .h.ordinal = swap32(TPM2_PCR_SequenceUpdate),
+            .sequenceHandle = swap32(seq_handle),
+            .sessionHdrSize = swap32(sizeof(struct tpm2_session_header)),
+            .session.handle = swap32(TPM_RS_PW),
+            .dataSize = swap16(max_bytes),
+        };
+
+        memcpy(cmd_rsp.update_c.data, buf, max_bytes);
+
+        o_size = sizeof(cmd_rsp);
+        send_cmd(loc, cmd_rsp.b, swap32(cmd_rsp.c.paramSize), &o_size);
+
+        if ( cmd_rsp.r.tag == swap16(TPM_ST_NO_SESSIONS) &&
+             cmd_rsp.r.paramSize == swap32(10) )
+        {
+            rc = swap32(cmd_rsp.r.returnCode);
+            if ( rc != 0 )
+                goto error;
+        }
+
+        size -= max_bytes;
+        buf += max_bytes;
+    }
+
+    cmd_rsp.finish_c = (struct tpm2_sequence_complete_cmd) {
+        .h.tag = swap16(TPM_ST_SESSIONS),
+        .h.paramSize = swap32(sizeof(cmd_rsp.finish_c) + size),
+        .h.ordinal = swap32(TPM2_PCR_EventSequenceComplete),
+        .pcrHandle = swap32(HR_PCR + pcr),
+        .sequenceHandle = swap32(seq_handle),
+        .sessionHdrSize = swap32(sizeof(struct tpm2_session_header)*2),
+        .pcrSession.handle = swap32(TPM_RS_PW),
+        .sequenceSession.handle = swap32(TPM_RS_PW),
+        .dataSize = swap16(size),
+    };
+
+    memcpy(cmd_rsp.finish_c.data, buf, size);
+
+    o_size = sizeof(cmd_rsp);
+    send_cmd(loc, cmd_rsp.b, swap32(cmd_rsp.c.paramSize), &o_size);
+
+    if ( cmd_rsp.r.tag == swap16(TPM_ST_NO_SESSIONS) &&
+         cmd_rsp.r.paramSize == swap32(10) )
+    {
+        rc = swap32(cmd_rsp.r.returnCode);
+        if ( rc != 0 )
+            goto error;
+    }
+
+    p = cmd_rsp.finish_r.hashes;
+    for ( i = 0; i < swap32(cmd_rsp.finish_r.hashCount); ++i )
+    {
+        unsigned j;
+        uint16_t hash_type;
+
+        hash_type = swap16(*(uint16_t *)p);
+        p += sizeof(uint16_t);
+
+        for ( j = 0; j < log_hashes->count; ++j )
+        {
+            struct tpm2_log_hash *hash = &log_hashes->hashes[j];
+            if ( hash->alg == hash_type )
+            {
+                memcpy(hash->data, p, hash->size);
+                p += hash->size;
+                break;
+            }
+        }
+
+        if ( j == log_hashes->count )
+            /* Can't continue parsing without knowing hash size. */
+            break;
+    }
+
+    rc = 0;
+
+error:
+    relinquish_locality(loc);
+    return rc;
+}
+
+#else
+
+union tpm2_cmd_rsp {
+    /* Enough space for multiple hashes. */
+    uint8_t b[sizeof(struct tpm2_extend_cmd) + 1024];
+    struct tpm_cmd_hdr c;
+    struct tpm_rsp_hdr r;
+    struct tpm2_extend_cmd extend_c;
+    struct tpm2_extend_rsp extend_r;
+};
+
+static uint32_t tpm20_pcr_extend(unsigned loc, uint32_t pcr_handle,
+                                 const struct tpm2_log_hashes *log_hashes)
+{
+    union tpm2_cmd_rsp cmd_rsp;
+    unsigned o_size;
+    unsigned i;
+    uint8_t *p;
+
+    cmd_rsp.extend_c = (struct tpm2_extend_cmd) {
+        .h.tag = swap16(TPM_ST_SESSIONS),
+        .h.ordinal = swap32(TPM2_PCR_Extend),
+        .pcrHandle = swap32(pcr_handle),
+        .sessionHdrSize = swap32(sizeof(struct tpm2_session_header)),
+        .pcrSession.handle = swap32(TPM_RS_PW),
+        .hashCount = swap32(log_hashes->count),
+    };
+
+    p = cmd_rsp.extend_c.hashes;
+    for ( i = 0; i < log_hashes->count; ++i )
+    {
+        const struct tpm2_log_hash *hash = &log_hashes->hashes[i];
+
+        if ( p + sizeof(uint16_t) + hash->size > &cmd_rsp.b[sizeof(cmd_rsp)] )
+        {
+            printk(XENLOG_ERR "Hit TPM message size implementation limit: %ld\n",
+                   sizeof(cmd_rsp));
+            return -1;
+        }
+
+        *(uint16_t *)p = swap16(hash->alg);
+        p += sizeof(uint16_t);
+
+        memcpy(p, hash->data, hash->size);
+        p += hash->size;
+    }
+
+    /* Fill in command size (size of the whole buffer). */
+    cmd_rsp.extend_c.h.paramSize = swap32(sizeof(cmd_rsp.extend_c) +
+                                          (p - cmd_rsp.extend_c.hashes)),
+
+    o_size = sizeof(cmd_rsp);
+    send_cmd(loc, cmd_rsp.b, swap32(cmd_rsp.c.paramSize), &o_size);
+
+    return swap32(cmd_rsp.r.returnCode);
+}
+
+static bool tpm_supports_hash(unsigned loc, const struct tpm2_log_hash *hash)
+{
+    uint32_t rc;
+    struct tpm2_log_hashes hashes = {
+        .count = 1,
+        .hashes[0] = *hash,
+    };
+
+    /*
+     * This is a valid way of checking hash support, using it to not implement
+     * TPM2_GetCapability().
+     */
+    rc = tpm20_pcr_extend(loc, /*pcr_handle=*/TPM_RH_NULL, &hashes);
+
+    return rc == 0;
+}
+
+static uint32_t tpm2_hash_extend(unsigned loc, const uint8_t *buf,
+                                 unsigned size, unsigned pcr,
+                                 const struct tpm2_log_hashes *log_hashes)
+{
+    uint32_t rc;
+    unsigned i;
+    struct tpm2_log_hashes supported_hashes = {0};
+
+    request_locality(loc);
+
+    for ( i = 0; i < log_hashes->count; ++i )
+    {
+        const struct tpm2_log_hash *hash = &log_hashes->hashes[i];
+        if ( !tpm_supports_hash(loc, hash) )
+        {
+            printk(XENLOG_WARNING "Skipped hash unsupported by TPM: %d\n",
+                   hash->alg);
+            continue;
+        }
+
+        if ( hash->alg == TPM_ALG_SHA1 )
+        {
+            sha1_hash(buf, size, hash->data);
+        }
+        else if ( hash->alg == TPM_ALG_SHA256 )
+        {
+            sha256_hash(buf, size, hash->data);
+        }
+        else
+        {
+            /* This is called "OneDigest" in TXT Software Development Guide. */
+            memset(hash->data, 0, size);
+            hash->data[0] = 1;
+        }
+
+        if ( supported_hashes.count == MAX_HASH_COUNT )
+        {
+            printk(XENLOG_ERR "Hit hash count implementation limit: %d\n",
+                   MAX_HASH_COUNT);
+            return -1;
+        }
+
+        supported_hashes.hashes[supported_hashes.count] = *hash;
+        ++supported_hashes.count;
+    }
+
+    rc = tpm20_pcr_extend(loc, HR_PCR + pcr, &supported_hashes);
+    relinquish_locality(loc);
+
+    return rc;
+}
+
+#endif /* __EARLY_SLAUNCH__ */
+
+/************************** end of TPM2.0 specific ****************************/
+
 void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
                      unsigned size, uint32_t type, const uint8_t *log_data,
                      unsigned log_data_size)
@@ -419,6 +831,35 @@ void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
         {
 #ifndef __EARLY_SLAUNCH__
             printk(XENLOG_ERR "Extending PCR%u failed\n", pcr);
+#endif
+        }
+    } else {
+        uint8_t sha1_digest[SHA1_DIGEST_SIZE];
+        uint8_t sha256_digest[SHA256_DIGEST_SIZE];
+        uint32_t rc;
+
+        struct tpm2_log_hashes log_hashes = {
+            .count = 2,
+            .hashes = {
+                {
+                    .alg = TPM_ALG_SHA1,
+                    .size = SHA1_DIGEST_SIZE,
+                    .data = sha1_digest,
+                },
+                {
+                    .alg = TPM_ALG_SHA256,
+                    .size = SHA256_DIGEST_SIZE,
+                    .data = sha256_digest,
+                },
+            },
+        };
+
+        rc = tpm2_hash_extend(loc, buf, size, pcr, &log_hashes);
+        if ( rc != 0 )
+        {
+#ifndef __EARLY_SLAUNCH__
+            printk(XENLOG_ERR "Extending PCR%u failed with TPM error: 0x%08x\n",
+                   pcr, rc);
 #endif
         }
     }
-- 
2.49.0


