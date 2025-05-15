Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A5EAB8301
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 11:39:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.985056.1371028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV3Q-00078Z-Si; Thu, 15 May 2025 09:39:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 985056.1371028; Thu, 15 May 2025 09:39:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFV3Q-00076A-O7; Thu, 15 May 2025 09:39:04 +0000
Received: by outflank-mailman (input) for mailman id 985056;
 Thu, 15 May 2025 09:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DjGQ=X7=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uFV3O-0005Wo-MK
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 09:39:02 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e841e5f-3170-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 11:39:01 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so145398266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 02:39:01 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad23ad2b386sm895152066b.104.2025.05.15.02.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 02:38:59 -0700 (PDT)
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
X-Inumbo-ID: 6e841e5f-3170-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747301940; x=1747906740; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRxfQHGUaM2bVrY5MoSx7hsp7Lwa7FAJBo/pdIXsvMI=;
        b=u0bVDa5VNiH0A9KZyo8YuyIecbJjlB93AIk/WLr/NCGwZBo7TImnHi5/MycaAifznK
         AHd04iGYTL+RhZp2Wef46I0AcyqnDYCZhtgit+mn+aV7Ia4UXMYQguxh0eciPZQ06ANE
         ofsyI/ZU1U1ZQDV9pHUF1URwhmPLbyWhcCdgE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747301940; x=1747906740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRxfQHGUaM2bVrY5MoSx7hsp7Lwa7FAJBo/pdIXsvMI=;
        b=KV14lyDZKb98oaGA0iiwENP/+KcZip0OGepYClkm3+ZW2jbxBRh/sa8+p1IjgzsvcR
         e+u5UIs8Jyfeac38rRwazUR0JSPnlY9pqJfGir/im7XnsF7h9qhBlEh3jEyNoewp4peT
         kxiVBBZQCoMxOfcO/gES+EZ8RzC/6/AunonKTwpmStj4PNlHOiJty9rcYUWN0KyqTjVM
         vzbo2avz6cs6ffI9uoPO+MpeOKum6jiuIWQP918EP7L+7lSbmFJaP49Ie6LmEhxCSVcT
         J8B001Znbe7IPuCf996HB3EUvbrZmkpS0p93cnIfOkmtyLknTXfejGrji9ViMFMH+/eh
         koZQ==
X-Gm-Message-State: AOJu0YyewOmI6KP2AsmUcIsRJbV3y1U6QSwvjS1msa1BM/bD95oiKvKV
	skl4tfkXG3O77rWNhb+Z3IUpc7HG2ghKP1BFoLK/IvYpd5+uQH2lEo4CzOZGvV7s6KzNu8C3FXQ
	=
X-Gm-Gg: ASbGncuw72VRhWu2l5gDv1U3Dfa0iZX7y9458MXFqPR94+hDGWr0Ru/An6QKYPddDQl
	YadIXwkPZUGohiI34B0bITIxCJd7d34Vu0I6gKSVi20AQTgPbUleFyR+Pn3anFnCoy7zkWhq1Q+
	FdwVI2rwEIBLrpIJp7I1IN8lD7skZZBSEWD897ZMVeDd0Kbyy9m4BYG9byUHgvJb2CMaRyNGwZ6
	60roG916XBA3zQ6vSbh4n3goUy3bC1gt4sHxQ3yg972UT+IYfEyxLM9wIaT/MAfkS6WDiADS+E2
	ddbrJFTOmK9cn9a/3eiWN4icsfPuiSC8ncOnG/xXsDwEn/qim1cOicxgWGaJlICDKnARUXwsP0c
	=
X-Google-Smtp-Source: AGHT+IHgmGS6dPuTLipWb6cw/6Fs3w9jLG9+8Qa0x10kxJOwpfb5vJN4OT3sfkoIIZeGgwmJFmtvCw==
X-Received: by 2002:a17:907:86a1:b0:ad2:4374:84a2 with SMTP id a640c23a62f3a-ad4f70f61eamr636239566b.6.1747301940038;
        Thu, 15 May 2025 02:39:00 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jennifer Herbert <jennifer.herbert@cloud.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 5/5] livepatch: Verify livepatch signatures
Date: Thu, 15 May 2025 10:38:20 +0100
Message-ID: <20250515093822.659916-6-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250515093822.659916-1-ross.lagerwall@citrix.com>
References: <20250515093822.659916-1-ross.lagerwall@citrix.com>
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

In v2:

* Adjust according to design tweaks.

 xen/common/livepatch.c          | 109 ++++++++++++++++++++++++++++++++
 xen/common/livepatch_elf.c      |  55 ++++++++++++++++
 xen/include/xen/livepatch.h     |  10 +++
 xen/include/xen/livepatch_elf.h |  18 ++++++
 4 files changed, 192 insertions(+)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index bc158971b4bf..7b7a2434e5c3 100644
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
@@ -79,6 +80,9 @@ static DEFINE_PER_CPU(struct tasklet, livepatch_tasklet);
 static struct rsa_public_key builtin_payload_key;
 #endif
 
+static int check_signature(const struct livepatch_elf *elf, void *raw,
+                           size_t size);
+
 static int get_name(const struct xen_livepatch_name *name, char *n)
 {
     if ( !name->size || name->size > XEN_LIVEPATCH_NAME_SIZE )
@@ -1162,6 +1166,8 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     if ( rc )
        goto out;
 
+    check_signature(&elf, raw, len);
+
     rc = move_payload(payload, &elf);
     if ( rc )
         goto out;
@@ -1202,6 +1208,109 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     return rc;
 }
 
+#ifdef CONFIG_PAYLOAD_VERIFY
+#define MAX_SIG_NOTE_SIZE 1024
+
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
+
+static int check_signature(const struct livepatch_elf *elf, void *raw,
+                           size_t size)
+{
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
+}
+#else
+static int check_signature(const struct livepatch_elf *elf, void *raw,
+                           size_t size)
+{
+    return -EINVAL;
+}
+#endif
+
 static int livepatch_upload(struct xen_sysctl_livepatch_upload *upload)
 {
     struct payload *data, *found;
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
index 0265f1fce057..a06be3ab61bc 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -39,6 +39,7 @@ struct xen_sysctl_livepatch_op;
 #define ELF_LIVEPATCH_DEPENDS     ".livepatch.depends"
 #define ELF_LIVEPATCH_XEN_DEPENDS ".livepatch.xen_depends"
 #define ELF_BUILD_ID_NOTE         ".note.gnu.build-id"
+#define ELF_XEN_SIGNATURE         ".note.Xen.signature"
 #define ELF_LIVEPATCH_LOAD_HOOKS      ".livepatch.hooks.load"
 #define ELF_LIVEPATCH_UNLOAD_HOOKS    ".livepatch.hooks.unload"
 #define ELF_LIVEPATCH_PREAPPLY_HOOK   ".livepatch.hooks.preapply"
@@ -50,6 +51,15 @@ struct xen_sysctl_livepatch_op;
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


