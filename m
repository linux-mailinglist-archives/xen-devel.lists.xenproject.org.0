Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2238CAC8FCB
	for <lists+xen-devel@lfdr.de>; Fri, 30 May 2025 15:20:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000977.1381234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzfF-000788-VF; Fri, 30 May 2025 13:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000977.1381234; Fri, 30 May 2025 13:20:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKzfF-00073z-PK; Fri, 30 May 2025 13:20:49 +0000
Received: by outflank-mailman (input) for mailman id 1000977;
 Fri, 30 May 2025 13:20:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sDQw=YO=3mdeb.com=sergii.dmytruk@srs-se1.protection.inumbo.net>)
 id 1uKzdh-0008Jy-Jl
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 13:19:13 +0000
Received: from 3.mo583.mail-out.ovh.net (3.mo583.mail-out.ovh.net
 [46.105.40.108]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab069374-3d58-11f0-a2ff-13f23c93f187;
 Fri, 30 May 2025 15:19:08 +0200 (CEST)
Received: from director4.ghost.mail-out.ovh.net (unknown [10.109.140.215])
 by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4b83jS26Cjz1gpb
 for <xen-devel@lists.xenproject.org>; Fri, 30 May 2025 13:19:08 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-sqj9x (unknown [10.110.113.35])
 by director4.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 70D72C5715;
 Fri, 30 May 2025 13:19:07 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.106])
 by ghost-submission-5b5ff79f4f-sqj9x with ESMTPSA
 id bshXCkuwOWj6JQAAPescrA
 (envelope-from <sergii.dmytruk@3mdeb.com>); Fri, 30 May 2025 13:19:07 +0000
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
X-Inumbo-ID: ab069374-3d58-11f0-a2ff-13f23c93f187
Authentication-Results:garm.ovh; auth=pass (GARM-106R006d10a0eb1-598f-4895-b746-f3445aee3969,
                    A4E380CC922F0B59227EC5DCC46884561651840B) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.184.221
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Ross Philipson <ross.philipson@oracle.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	trenchboot-devel@googlegroups.com
Subject: [PATCH v3 13/22] x86/tpm.c: implement event log for TPM2.0
Date: Fri, 30 May 2025 16:17:55 +0300
Message-ID: <a86083c305921cabd2df33a9eda2e2854600b20b.1748611041.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12703528653124908188
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddvleduudculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfehfeehudeileeikeffgfffgfefuddtveelvedvhfffgfelvdfgtddutdehfeeinecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukeegrddvvddupdefjedrheelrddugedvrddutdeinecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdpoffvtefjohhsthepmhhoheekfegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=ixLmPLThAstC9HSOCxNeT4qjU8C58Im4iR2Vxsanw3Y=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1748611148; v=1;
 b=EPtTXt3tCy4mxfiCGuAMAj/aTQ5IkWPMwhIJJPJEuc+aoZA25rC0B9UjsKHZ4H5FAr4M+Z30
 ufBRDnzwI781Wrnxfq6RhusSEsHWNUbaTH70b2RCXYfFs29V4RGtsNYOoHDwrx0olgZvBWaK8EE
 oP5lwrUTA3HnNPlpso5LN40kYO+aZH44Ess7BAtssJ1zCtVF6d3hZMpARDQePM48Lqx4uNeOAdx
 welO+/pnPQGkZmhUvj9s5JjmOnebt3WqpFF8g+/mOfpKwzYDOMpJWJCa3gnhI7orSNogV9SGOXY
 p6mECGTHhS5Uuxodpg9XTa3xm0sGFjOmyenoPYz9oSMAQ==

Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 xen/arch/x86/include/asm/intel-txt.h |  33 ++++++
 xen/arch/x86/tpm.c                   | 169 ++++++++++++++++++++++-----
 2 files changed, 175 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/include/asm/intel-txt.h b/xen/arch/x86/include/asm/intel-txt.h
index 0b0bdc1bb2..de7f23d4ff 100644
--- a/xen/arch/x86/include/asm/intel-txt.h
+++ b/xen/arch/x86/include/asm/intel-txt.h
@@ -215,6 +215,39 @@ struct txt_sinit_mle_data {
     /* Ext Data Elements */
 } __packed;
 
+/* Types of extended data. */
+#define TXT_HEAP_EXTDATA_TYPE_END                    0
+#define TXT_HEAP_EXTDATA_TYPE_BIOS_SPEC_VER          1
+#define TXT_HEAP_EXTDATA_TYPE_ACM                    2
+#define TXT_HEAP_EXTDATA_TYPE_STM                    3
+#define TXT_HEAP_EXTDATA_TYPE_CUSTOM                 4
+#define TXT_HEAP_EXTDATA_TYPE_MADT                   6
+#define TXT_HEAP_EXTDATA_TYPE_EVENT_LOG_POINTER2_1   8
+#define TXT_HEAP_EXTDATA_TYPE_MCFG                   9
+#define TXT_HEAP_EXTDATA_TYPE_TPR_REQ               13
+#define TXT_HEAP_EXTDATA_TYPE_DTPR                  14
+#define TXT_HEAP_EXTDATA_TYPE_CEDT                  15
+
+/*
+ * Self-describing data structure that is used for extensions to TXT heap
+ * tables.
+ */
+struct txt_ext_data_element {
+    uint32_t type;   /* One of TXT_HEAP_EXTDATA_TYPE_*. */
+    uint32_t size;
+    uint8_t data[0]; /* size bytes. */
+} __packed;
+
+/*
+ * Extended data describing TPM 2.0 log.
+ */
+struct heap_event_log_pointer_element2_1 {
+    uint64_t physical_address;
+    uint32_t allocated_event_container_size;
+    uint32_t first_record_offset;
+    uint32_t next_record_offset;
+} __packed;
+
 /*
  * Functions to extract data from the Intel TXT Heap Memory.
  *
diff --git a/xen/arch/x86/tpm.c b/xen/arch/x86/tpm.c
index ed49fe3ccf..3c145fd3cc 100644
--- a/xen/arch/x86/tpm.c
+++ b/xen/arch/x86/tpm.c
@@ -536,6 +536,44 @@ struct tpm2_log_hashes {
     struct tpm2_log_hash hashes[MAX_HASH_COUNT];
 };
 
+struct tpm2_pcr_event_header {
+    uint32_t pcrIndex;
+    uint32_t eventType;
+    uint32_t digestCount;
+    uint8_t digests[0];
+    /*
+     * Each hash is represented as:
+     * struct {
+     *     uint16_t hashAlg;
+     *     uint8_t hash[size of hashAlg];
+     * };
+     */
+    /* uint32_t eventSize; */
+    /* uint8_t event[0]; */
+} __packed;
+
+struct tpm2_digest_sizes {
+    uint16_t algId;
+    uint16_t digestSize;
+} __packed;
+
+struct tpm2_spec_id_event {
+    uint32_t pcrIndex;
+    uint32_t eventType;
+    uint8_t digest[20];
+    uint32_t eventSize;
+    uint8_t signature[16];
+    uint32_t platformClass;
+    uint8_t specVersionMinor;
+    uint8_t specVersionMajor;
+    uint8_t specErrata;
+    uint8_t uintnSize;
+    uint32_t digestCount;
+    struct tpm2_digest_sizes digestSizes[0]; /* variable number of members */
+    /* uint8_t vendorInfoSize; */
+    /* uint8_t vendorInfo[vendorInfoSize]; */
+} __packed;
+
 #ifdef __EARLY_SLAUNCH__
 
 union tpm2_cmd_rsp {
@@ -769,19 +807,11 @@ static uint32_t tpm2_hash_extend(unsigned loc, const uint8_t *buf,
         }
 
         if ( hash->alg == TPM_ALG_SHA1 )
-        {
             sha1_hash(hash->data, buf, size);
-        }
         else if ( hash->alg == TPM_ALG_SHA256 )
-        {
             sha2_256_digest(hash->data, buf, size);
-        }
         else
-        {
-            /* This is called "OneDigest" in TXT Software Development Guide. */
-            memset(hash->data, 0, size);
-            hash->data[0] = 1;
-        }
+            /* create_log_event20() took care of initializing the digest. */;
 
         if ( supported_hashes.count == MAX_HASH_COUNT )
         {
@@ -802,6 +832,102 @@ static uint32_t tpm2_hash_extend(unsigned loc, const uint8_t *buf,
 
 #endif /* __EARLY_SLAUNCH__ */
 
+static struct heap_event_log_pointer_element2_1 *find_evt_log_ext_data(void)
+{
+    struct txt_os_sinit_data *os_sinit;
+    struct txt_ext_data_element *ext_data;
+
+    os_sinit = txt_os_sinit_data_start(__va(txt_read(TXTCR_HEAP_BASE)));
+    ext_data = (void *)((uint8_t *)os_sinit + sizeof(*os_sinit));
+
+    /*
+     * Find TXT_HEAP_EXTDATA_TYPE_EVENT_LOG_POINTER2_1 which is necessary to
+     * know where to put the next entry.
+     */
+    while ( ext_data->type != TXT_HEAP_EXTDATA_TYPE_END )
+    {
+        if ( ext_data->type == TXT_HEAP_EXTDATA_TYPE_EVENT_LOG_POINTER2_1 )
+            break;
+        ext_data = (void *)&ext_data->data[ext_data->size];
+    }
+
+    if ( ext_data->type == TXT_HEAP_EXTDATA_TYPE_END )
+        return NULL;
+
+    return (void *)&ext_data->data[0];
+}
+
+static struct tpm2_log_hashes
+create_log_event20(struct tpm2_spec_id_event *evt_log, uint32_t evt_log_size,
+                   uint32_t pcr, uint32_t type, const uint8_t *data,
+                   unsigned data_size)
+{
+    struct tpm2_log_hashes log_hashes = {0};
+
+    struct heap_event_log_pointer_element2_1 *log_ext_data;
+    struct tpm2_pcr_event_header *new_entry;
+    uint32_t entry_size;
+    unsigned i;
+    uint8_t *p;
+
+    log_ext_data = find_evt_log_ext_data();
+    if ( log_ext_data == NULL )
+        return log_hashes;
+
+    entry_size = sizeof(*new_entry);
+    for ( i = 0; i < evt_log->digestCount; ++i )
+    {
+        entry_size += sizeof(uint16_t); /* hash type */
+        entry_size += evt_log->digestSizes[i].digestSize;
+    }
+    entry_size += sizeof(uint32_t); /* data size field */
+    entry_size += data_size;
+
+    /*
+     * Check if there is enough space left for new entry.
+     * Note: it is possible to introduce a gap in event log if entry with big
+     * data_size is followed by another entry with smaller data. Maybe we should
+     * cap the event log size in such case?
+     */
+    if ( log_ext_data->next_record_offset + entry_size > evt_log_size )
+        return log_hashes;
+
+    new_entry = (void *)((uint8_t *)evt_log + log_ext_data->next_record_offset);
+    log_ext_data->next_record_offset += entry_size;
+
+    new_entry->pcrIndex = pcr;
+    new_entry->eventType = type;
+    new_entry->digestCount = evt_log->digestCount;
+
+    p = &new_entry->digests[0];
+    for ( i = 0; i < evt_log->digestCount; ++i )
+    {
+        uint16_t alg = evt_log->digestSizes[i].algId;
+        uint16_t size = evt_log->digestSizes[i].digestSize;
+
+        *(uint16_t *)p = alg;
+        p += sizeof(uint16_t);
+
+        log_hashes.hashes[i].alg = alg;
+        log_hashes.hashes[i].size = size;
+        log_hashes.hashes[i].data = p;
+        p += size;
+
+        /* This is called "OneDigest" in TXT Software Development Guide. */
+        memset(log_hashes.hashes[i].data, 0, size);
+        log_hashes.hashes[i].data[0] = 1;
+    }
+    log_hashes.count = evt_log->digestCount;
+
+    *(uint32_t *)p = data_size;
+    p += sizeof(uint32_t);
+
+    if ( data && data_size > 0 )
+        memcpy(p, data, data_size);
+
+    return log_hashes;
+}
+
 /************************** end of TPM2.0 specific ****************************/
 
 void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
@@ -832,26 +958,15 @@ void tpm_hash_extend(unsigned loc, unsigned pcr, const uint8_t *buf,
             printk(XENLOG_ERR "Extending PCR%u failed\n", pcr);
 #endif
         }
-    } else {
-        uint8_t sha1_digest[SHA1_DIGEST_SIZE];
-        uint8_t sha256_digest[SHA2_256_DIGEST_SIZE];
+    }
+    else
+    {
         uint32_t rc;
 
-        struct tpm2_log_hashes log_hashes = {
-            .count = 2,
-            .hashes = {
-                {
-                    .alg = TPM_ALG_SHA1,
-                    .size = SHA1_DIGEST_SIZE,
-                    .data = sha1_digest,
-                },
-                {
-                    .alg = TPM_ALG_SHA256,
-                    .size = SHA2_256_DIGEST_SIZE,
-                    .data = sha256_digest,
-                },
-            },
-        };
+        struct tpm2_spec_id_event *evt_log = evt_log_addr;
+        struct tpm2_log_hashes log_hashes =
+            create_log_event20(evt_log, evt_log_size, pcr, type, log_data,
+                               log_data_size);
 
         rc = tpm2_hash_extend(loc, buf, size, pcr, &log_hashes);
         if ( rc != 0 )
-- 
2.49.0


