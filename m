Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D346ACAF28
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 15:37:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003325.1382892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LX-0001C0-Qf; Mon, 02 Jun 2025 13:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003325.1382892; Mon, 02 Jun 2025 13:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM5LX-00018U-Lw; Mon, 02 Jun 2025 13:36:59 +0000
Received: by outflank-mailman (input) for mailman id 1003325;
 Mon, 02 Jun 2025 13:36:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2MT+=YR=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uM5LV-0000AN-Pi
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 13:36:57 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a75c4373-3fb6-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 15:36:57 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-acb39c45b4eso709648366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 06:36:57 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82becbsm801962166b.39.2025.06.02.06.36.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 06:36:55 -0700 (PDT)
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
X-Inumbo-ID: a75c4373-3fb6-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1748871416; x=1749476216; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xN7zQNXihUlijbgV6bSCt7tkvkUX3nHa7idYxDq6Di8=;
        b=iDCMNbN1PXalTU2jWFC5KO/J9e0tBgS/01oVT/VVqXhonbw4T4hz9OuPlfoK7XVR1w
         G+pSel21H2EbrwweuySyeLbokCL9ZIk9NzzHI41syvlCzBEWEIu1aiUgwJwbkzv++WrF
         5vJlXKji7khC5HM0YDfl9X4t9On4HvshWl2+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748871416; x=1749476216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xN7zQNXihUlijbgV6bSCt7tkvkUX3nHa7idYxDq6Di8=;
        b=K+a54KKWD8W+tbdZHLPQ9XoXjI4UZTF+M4lDCcPYIqv35EstMmePji1H3ccOa2cD+p
         vcyqNN+M+8Z5mey/lqLWTNiGCQdClaYD2V5Tfs67GcT/lBZ90/y/kRdrdbc1bHG5UvZq
         nWwvDFmZpw03aahflis+75HbncF/40bLzsMomr5cSswgNPpO/3HFM1DZ5dB7Jf3esVWC
         HzpKN2S2hl8NimdR389nXeUTSN5OUhWKTAXVUlyyH+gAyUsx3owLoEqq9c9l2ftn7xoH
         ME7KnvhEC6ALpDzIW6B+tdR4KSm5VYI0dwpKg13C/Q1LxRgpFOFQkNAbzKcGRC158QS0
         SIqw==
X-Gm-Message-State: AOJu0YyliFVr2/khMbGQvnCstlCIVNKmbYdAq/UWGfbvNroWolOtxSIA
	WF+6kpFH4zdTqnoBDCuHY6S6utDrH+E6wqOR+UmdjUh/bfBNF/ghHeHEABoM8LFB6maxrLBCqyt
	yjMk=
X-Gm-Gg: ASbGncskLe+1RwgDmILSwt59Gs4LjsgOyi9TLD6uUYpKUXl2KIty+pANQ0216Jinwzk
	pGp1zXFT1gQov0auUaenZj7OAofEK5vKN54qVArtMZf8VJ0scFq4xr84XfeqV+sKcmzlOG4SAqp
	sBOp6TJziS10KGtLy6CzNyvbZVRG0XJmDgBkKzw3DRJii8KSqDglIGGHEtPWtqW72bE8/Avz0fA
	0zAyWF0Qtx7NzoHeRhAliGKsSrHICbHAo/BCakCPWeOoIU7S7hFF9WgD9xbfLn7HjS6gU/p3Nbt
	ZHpFEPwaf//RmPZgJcMY8h7ShUsqPjHVYfClsop+euIF10GKf+KRoqK1XVIidkaN3iFOuZZEip2
	X5YIcCWy31w==
X-Google-Smtp-Source: AGHT+IGS/er/Ph6frH7OwftA6z4tvqTxkoXIM3ibqtdHZvxd7ceD8DeUWCX9Q4Szhd1tn/kRrTfDlA==
X-Received: by 2002:a17:906:3d3:b0:adb:413e:2a2f with SMTP id a640c23a62f3a-adb413e2ae7mr631194466b.9.1748871416434;
        Mon, 02 Jun 2025 06:36:56 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jennifer Herbert <jennifer.herbert@cloud.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 5/5] livepatch: Verify livepatch signatures
Date: Mon,  2 Jun 2025 14:36:37 +0100
Message-ID: <20250602133639.2871212-6-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
References: <20250602133639.2871212-1-ross.lagerwall@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jennifer Herbert <jennifer.herbert@cloud.com>

Verify livepatch signatures against the embedded public key in Xen.
Failing to verify does not prevent the livepatch from being loaded.
In future, this will be changed for certain cases (e.g. when Secure Boot
is enabled).

Signed-off-by: Jennifer Herbert <jennifer.herbert@cloud.com>
Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
---

In v3:

* Minor style fixes

 xen/common/livepatch.c          | 103 ++++++++++++++++++++++++++++++++
 xen/common/livepatch_elf.c      |  55 +++++++++++++++++
 xen/include/xen/livepatch.h     |  10 ++++
 xen/include/xen/livepatch_elf.h |  18 ++++++
 4 files changed, 186 insertions(+)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 92d1d342d872..56a3d125483f 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -14,6 +14,7 @@
 #include <xen/mpi.h>
 #include <xen/rsa.h>
 #include <xen/sched.h>
+#include <xen/sha2.h>
 #include <xen/smp.h>
 #include <xen/softirq.h>
 #include <xen/spinlock.h>
@@ -525,6 +526,106 @@ static int check_xen_buildid(const struct livepatch_elf *elf)
     return 0;
 }
 
+#ifdef CONFIG_PAYLOAD_VERIFY
+static int check_rsa_sha256_signature(void *data, size_t datalen,
+                                      void *sig, uint32_t siglen)
+{
+    struct sha2_256_state hash;
+    MPI s;
+    int rc;
+
+    s = mpi_read_raw_data(sig, siglen);
+    if ( !s )
+    {
+        printk(XENLOG_ERR LIVEPATCH "Failed to mpi_read_raw_data\n");
+        return -ENOMEM;
+    }
+
+    sha2_256_init(&hash);
+    sha2_256_update(&hash, data, datalen);
+
+    rc = rsa_sha256_verify(&builtin_payload_key, &hash, s);
+    if ( rc )
+        printk(XENLOG_ERR LIVEPATCH "rsa_sha256_verify failed: %d\n", rc);
+
+    mpi_free(s);
+
+    return rc;
+}
+#endif
+
+static int check_signature(const struct livepatch_elf *elf, void *raw,
+                           size_t size)
+{
+#ifdef CONFIG_PAYLOAD_VERIFY
+#define MAX_SIG_NOTE_SIZE 1024
+    static const char notename[] = "Xen";
+    void *sig;
+    livepatch_elf_note note;
+    int rc;
+
+    rc = livepatch_elf_note_by_names(elf, ELF_XEN_SIGNATURE, notename, -1,
+                                     &note);
+    if ( rc )
+    {
+        dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Signature not present\n",
+                elf->name);
+        return rc;
+    }
+
+    /* We expect only one signature, find a second is an error! */
+    rc = livepatch_elf_next_note_by_name(notename, -1, &note);
+    if ( rc != -ENOENT )
+    {
+        if ( rc )
+        {
+            printk(XENLOG_ERR LIVEPATCH
+                   "Error while checking for notes! err = %d\n", rc);
+            return rc;
+        }
+        else
+        {
+            printk(XENLOG_ERR LIVEPATCH
+                   "Error, found second signature note! There can be only one!\n");
+            return -EINVAL;
+        }
+    }
+
+    if ( SIGNATURE_VERSION(note.type) != LIVEPATCH_SIGNATURE_VERSION ||
+         SIGNATURE_ALGORITHM(note.type) != SIGNATURE_ALGORITHM_RSA ||
+         SIGNATURE_HASH(note.type) != SIGNATURE_HASH_SHA256 )
+    {
+        printk(XENLOG_ERR LIVEPATCH
+               "Unsupported signature type: v:%u, a:%u, h:%u\n",
+               SIGNATURE_VERSION(note.type), SIGNATURE_ALGORITHM(note.type),
+               SIGNATURE_HASH(note.type));
+        return -EINVAL;
+    }
+
+    if ( note.size == 0 || note.size >= MAX_SIG_NOTE_SIZE )
+    {
+        printk(XENLOG_ERR LIVEPATCH "Invalid signature note size: %u\n",
+               note.size);
+        return -EINVAL;
+    }
+
+    sig = xmalloc_bytes(note.size);
+    if ( !sig )
+        return -ENOMEM;
+
+    memcpy(sig, note.data, note.size);
+
+    /* Remove signature from data, as can't be verified with it. */
+    memset((void *)note.data, 0, note.size);
+    rc = check_rsa_sha256_signature(raw, size, sig, note.size);
+
+    xfree(sig);
+    return rc;
+#else
+    return -EINVAL;
+#endif
+}
+
 static int check_special_sections(const struct livepatch_elf *elf)
 {
     unsigned int i;
@@ -1162,6 +1263,8 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     if ( rc )
        goto out;
 
+    check_signature(&elf, raw, len);
+
     rc = move_payload(payload, &elf);
     if ( rc )
         goto out;
diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
index 25ce1bd5a0ad..b27c4524611d 100644
--- a/xen/common/livepatch_elf.c
+++ b/xen/common/livepatch_elf.c
@@ -23,6 +23,61 @@ livepatch_elf_sec_by_name(const struct livepatch_elf *elf,
     return NULL;
 }
 
+int livepatch_elf_note_by_names(const struct livepatch_elf *elf,
+                                const char *sec_name, const char *note_name,
+                                const unsigned int type,
+                                livepatch_elf_note *note)
+{
+     const struct livepatch_elf_sec *sec = livepatch_elf_sec_by_name(elf,
+                                                                     sec_name);
+     if ( !sec )
+           return -ENOENT;
+
+     note->end = sec->addr + sec->sec->sh_size;
+     note->next = sec->addr;
+
+     return livepatch_elf_next_note_by_name(note_name, type, note);
+}
+
+int livepatch_elf_next_note_by_name(const char *note_name,
+                                    const unsigned int type,
+                                    livepatch_elf_note *note)
+{
+     const Elf_Note *pkd_note = note->next;
+     size_t notenamelen = strlen(note_name) + 1;
+     size_t note_hd_size;
+     size_t note_size;
+     size_t remaining;
+
+     while ( (void *)pkd_note < note->end )
+     {
+
+         remaining = note->end - (void *)pkd_note;
+         if ( remaining < sizeof(livepatch_elf_note) )
+             return -EINVAL;
+
+         note_hd_size = sizeof(Elf_Note) + ((pkd_note->namesz + 3) & ~0x3);
+         note_size = note_hd_size + ((pkd_note->descsz + 3) & ~0x3);
+         if ( remaining < note_size )
+             return -EINVAL;
+
+         if ( notenamelen == pkd_note->namesz &&
+              !memcmp(note_name, (const void *) pkd_note + sizeof(Elf_Note),
+                      notenamelen) &&
+              (type == -1 || pkd_note->type == type) )
+         {
+             note->size = pkd_note->descsz;
+             note->type = pkd_note->type;
+             note->data = (void *)pkd_note + note_hd_size;
+             note->next = (void *)pkd_note + note_size;
+             return 0;
+         }
+         pkd_note = (void *)pkd_note + note_size;
+     }
+
+     return -ENOENT;
+}
+
 static int elf_verify_strtab(const struct livepatch_elf_sec *sec)
 {
     const Elf_Shdr *s;
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index 52f90cbed45b..12206ce3b2b8 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -38,6 +38,7 @@ struct xen_sysctl_livepatch_op;
 #define ELF_LIVEPATCH_DEPENDS     ".livepatch.depends"
 #define ELF_LIVEPATCH_XEN_DEPENDS ".livepatch.xen_depends"
 #define ELF_BUILD_ID_NOTE         ".note.gnu.build-id"
+#define ELF_XEN_SIGNATURE         ".note.Xen.signature"
 #define ELF_LIVEPATCH_LOAD_HOOKS      ".livepatch.hooks.load"
 #define ELF_LIVEPATCH_UNLOAD_HOOKS    ".livepatch.hooks.unload"
 #define ELF_LIVEPATCH_PREAPPLY_HOOK   ".livepatch.hooks.preapply"
@@ -49,6 +50,15 @@ struct xen_sysctl_livepatch_op;
 /* Arbitrary limit for payload size and .bss section size. */
 #define LIVEPATCH_MAX_SIZE     MB(2)
 
+#define SIGNATURE_VERSION(type) ((type) & 0xffff)
+#define LIVEPATCH_SIGNATURE_VERSION 1
+
+#define SIGNATURE_ALGORITHM(type) (((type) >> 16) & 0xff)
+#define SIGNATURE_ALGORITHM_RSA 0
+
+#define SIGNATURE_HASH(type) (((type) >> 24) & 0xff)
+#define SIGNATURE_HASH_SHA256 0
+
 struct livepatch_symbol {
     const char *name;
     unsigned long value;
diff --git a/xen/include/xen/livepatch_elf.h b/xen/include/xen/livepatch_elf.h
index 842111e14518..04611bac410e 100644
--- a/xen/include/xen/livepatch_elf.h
+++ b/xen/include/xen/livepatch_elf.h
@@ -39,6 +39,16 @@ struct livepatch_elf {
     unsigned int symtab_idx;
 };
 
+typedef struct {
+    uint32_t size;                       /* Note size */
+    uint32_t type;                       /* Note type */
+    const void *data;                    /* Pointer to note */
+
+    /* Private */
+    const Elf_Note *next;
+    const void *end;
+} livepatch_elf_note;
+
 const struct livepatch_elf_sec *
 livepatch_elf_sec_by_name(const struct livepatch_elf *elf,
                           const char *name);
@@ -48,6 +58,14 @@ void livepatch_elf_free(struct livepatch_elf *elf);
 int livepatch_elf_resolve_symbols(struct livepatch_elf *elf);
 int livepatch_elf_perform_relocs(struct livepatch_elf *elf);
 
+int livepatch_elf_note_by_names(const struct livepatch_elf *elf,
+                                const char *sec_name, const char *note_name,
+                                const unsigned int type,
+                                livepatch_elf_note *note);
+int livepatch_elf_next_note_by_name(const char *note_name,
+                                    const unsigned int type,
+                                    livepatch_elf_note *note);
+
 static inline bool livepatch_elf_ignore_section(const Elf_Shdr *sec)
 {
     return !(sec->sh_flags & SHF_ALLOC);
-- 
2.49.0


