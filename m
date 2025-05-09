Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19E2AB1A48
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 18:20:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980234.1366703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQSc-0007kc-MV; Fri, 09 May 2025 16:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980234.1366703; Fri, 09 May 2025 16:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQSc-0007iJ-It; Fri, 09 May 2025 16:20:30 +0000
Received: by outflank-mailman (input) for mailman id 980234;
 Fri, 09 May 2025 16:20:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bi0W=XZ=cloud.com=ross.lagerwall@srs-se1.protection.inumbo.net>)
 id 1uDQSb-0007iD-FD
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 16:20:29 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85792ee8-2cf1-11f0-9eb4-5ba50f476ded;
 Fri, 09 May 2025 18:20:28 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5fbfa0a7d2cso3894639a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 09:20:28 -0700 (PDT)
Received: from rossla-pc.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad21934de87sm171631166b.74.2025.05.09.09.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 09:20:27 -0700 (PDT)
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
X-Inumbo-ID: 85792ee8-2cf1-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746807628; x=1747412428; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/h+K9CEtvQx2D7M8j4k6bSPS6DyqWmWkp0jPmeHtdI=;
        b=fPc/HuYW00vSiUb8DCdI+r8gmxm9MofkzL8rb9B2FKZD/3zsUSXfRks9ayugxcjGGN
         /zzb4lTfmjbsguUc+8WE3DMW9/sN+3x1YPzV2GAY746EjAa37OhX6AgvEMG+qJ8IG9KD
         zKCTZzFMkcPPH445tJGfmWYqr5ccrYhsNQWwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746807628; x=1747412428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/h+K9CEtvQx2D7M8j4k6bSPS6DyqWmWkp0jPmeHtdI=;
        b=qP0WHo6etUdK3vCAyQ8qgr+Z8isCaHEyUhQ+LzlOYDaer7eqAGbr0L7f/y2Ygao+C9
         8ua0LolZE25SGcoRTqVZrqIFgI6hTYmxVXzGIs0PxpAlwzSougtnO1qmbisXTD+xpvaG
         eCs8gJkmECuYSYoVwT7v6VCrNV2Vs5IdVJW+h058Nkgco/TBM3uf+EZQ0GCkIEL6j9jj
         HFQXM9JpPMpdcjRZI3t4Gd1l/7EQ7AYROkle6Tb+bu4hRlxycZ+baVa2VyiS54ULdPbc
         2UmOx7VjeotOjHL5B3yjoTQuVZIU44KcHocu3Jhn5vDchMLQdxH8Wa6QFA1yCzhf2PCX
         HINQ==
X-Gm-Message-State: AOJu0YzWx3HmXG3kZEGARLoykYXdEBOy/pXaBJSbarKUw4KnN7JGk1/e
	jCOuzC1j/+T1BHf7Zd8IJqZSqwdi0YNOkBmdZJVKbqOpKcD8TrZ72eVCQLEs/OILvXUspuHqivU
	=
X-Gm-Gg: ASbGncvDsq8S55BY/5LzhXE80cNcivNyl7otaqbQr0H/ywnr1Pvj9JWUOHX8rBiTP5p
	LGRDRPlLgJLGsg76wSoiZttmlwnZvC9shRGPswVwVqmElas9syNvrwR1lxe4X3RPcGjT8zQZmuA
	OfXgeULnOQSbTPWAyhn0Xj6U9YbYTd6Frh2z+Lf0JJPJcg8yqqkxjUs4+cAagi8V0DNDwNqsG26
	FZtJ3yi9yueLE5qhN+Q7hx6b0hlMNO2s9Vr3/7Whz/zZtkhvm70P3AtZOZ2TDqUBs5noUShxYbn
	HCWej0rwLzE3wzEglrNMMnzCDFU8UUnku823hnO/UJO0K1Swz01q38c9uSkVmxWoVmGWFHzsFXk
	=
X-Google-Smtp-Source: AGHT+IFdxgMF1hWlw7F8AdxydqCoeJDiOqkj3myWL0NwNW0Guhy93AI+I59zq4XemUrcQMG84YIQVA==
X-Received: by 2002:a17:906:6a88:b0:ad2:1d12:fd68 with SMTP id a640c23a62f3a-ad21d1301c2mr259337066b.48.1746807627750;
        Fri, 09 May 2025 09:20:27 -0700 (PDT)
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Jennifer Herbert <jennifer.herbert@cloud.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH 4/4] livepatch: Verify livepatch signatures
Date: Fri,  9 May 2025 17:20:16 +0100
Message-ID: <20250509162016.45931-1-ross.lagerwall@citrix.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
References: <20250506143218.1782603-1-ross.lagerwall@citrix.com>
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
 xen/common/livepatch.c          | 134 ++++++++++++++++++++++++++++++++
 xen/common/livepatch_elf.c      |  55 +++++++++++++
 xen/include/xen/livepatch.h     |   5 ++
 xen/include/xen/livepatch_elf.h |  18 +++++
 4 files changed, 212 insertions(+)

diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 947d05671b4f..dd3532b7bbee 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -81,6 +81,9 @@ extern const uint8_t xen_livepatch_key_data[];
 static struct rsa_public_key builtin_payload_key;
 #endif
 
+static int check_signature(const struct livepatch_elf *elf, void *raw,
+                           size_t size);
+
 static int get_name(const struct xen_livepatch_name *name, char *n)
 {
     if ( !name->size || name->size > XEN_LIVEPATCH_NAME_SIZE )
@@ -1164,6 +1167,8 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     if ( rc )
        goto out;
 
+    check_signature(&elf, raw, len);
+
     rc = move_payload(payload, &elf);
     if ( rc )
         goto out;
@@ -1204,6 +1209,135 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     return rc;
 }
 
+#ifdef CONFIG_PAYLOAD_SIGNING
+
+#define MAX_SIG_NOTE_SIZE 1024
+
+struct payload_signature {
+    uint16_t version;
+    uint8_t algo;        /* Public-key crypto algorithm */
+    uint8_t hash;        /* Digest algorithm */
+    uint32_t sig_len;    /* Length of signature data */
+};
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
+    struct payload_signature *siginfo;
+    livepatch_elf_note note;
+    size_t nsize;
+    int rc;
+
+    rc = livepatch_elf_note_by_names(elf, ELF_XEN_SIGNATURE, notename, 0,
+                                     &note);
+    if ( rc )
+    {
+        dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Signature not present\n",
+                elf->name);
+        return rc;
+    }
+
+    /* We expect only one signature, find a second is an error! */
+    rc = livepatch_elf_next_note_by_name(notename, 0, &note);
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
+    nsize = note.size;
+    if ( nsize <= sizeof(*siginfo) || nsize >= MAX_SIG_NOTE_SIZE )
+    {
+        printk(XENLOG_ERR LIVEPATCH "Invalid signature note size: %zu\n",
+               nsize);
+        return -EINVAL;
+    }
+
+    siginfo = xmalloc_bytes(nsize);
+    if ( !siginfo )
+        return -ENOMEM;
+
+    memcpy(siginfo, note.data, nsize);
+
+    if ( siginfo->version != SIGNATURE_SUPPORTED_VERION )
+    {
+       printk(XENLOG_ERR LIVEPATCH "Bad signature version %u\n", siginfo->version);
+       rc = -EINVAL;
+       goto out;
+    }
+
+    if ( siginfo->sig_len == 0 ||
+         nsize - sizeof(*siginfo) < siginfo->sig_len )
+    {
+       printk(XENLOG_ERR LIVEPATCH
+              "Payload signature size bad. ns=%zu si=%u\n",
+              nsize, siginfo->sig_len);
+       rc = -EINVAL;
+       goto out;
+    }
+
+    if ( siginfo->algo != SIGNATURE_ALGORITHM_RSA ||
+         siginfo->hash != SIGNATURE_HASH_SHA256 )
+    {
+        printk(XENLOG_ERR LIVEPATCH "Bad payload signature: v:%u, a:%u, h:%u\n",
+               siginfo->version, siginfo->algo, siginfo->hash);
+        rc = -EINVAL;
+        goto out;
+    }
+
+    /* Remove signature from data, as can't be verified with it. */
+    memset((void *)note.data + sizeof(*siginfo), 0, siginfo->sig_len);
+    rc = check_rsa_sha256_signature(raw, size, siginfo + 1, siginfo->sig_len);
+
+out:
+    xfree(siginfo);
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
index d074a5bebecc..23bef334d24f 100644
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
@@ -49,6 +50,10 @@ struct xen_sysctl_livepatch_op;
 /* Arbitrary limit for payload size and .bss section size. */
 #define LIVEPATCH_MAX_SIZE     MB(2)
 
+#define SIGNATURE_SUPPORTED_VERION 1
+#define SIGNATURE_ALGORITHM_RSA 0
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


