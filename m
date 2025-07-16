Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E36D0B07A8D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 18:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045424.1415545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4YZ-0001je-Oc; Wed, 16 Jul 2025 16:00:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045424.1415545; Wed, 16 Jul 2025 16:00:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4YZ-0001gO-LQ; Wed, 16 Jul 2025 16:00:31 +0000
Received: by outflank-mailman (input) for mailman id 1045424;
 Wed, 16 Jul 2025 16:00:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O24U=Z5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uc4YY-0001PN-GA
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 16:00:30 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe315870-625d-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 18:00:28 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so19982f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 09:00:28 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8bd15bfsm18552177f8f.19.2025.07.16.09.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jul 2025 09:00:27 -0700 (PDT)
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
X-Inumbo-ID: fe315870-625d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1752681628; x=1753286428; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1SaeRL6BLke/Vs0aykI7PTH6MJeBZpeQf6U09ZSw/Ho=;
        b=Zhp19cqML+rJDq+x+bYZtCHME5zaso6rOUUDaD1NlzJ726lc6cSuaVdOT+VFH5uGhf
         e2mk69oPRG2YIPgMYU/4KK/hqX7cP6G+1CNG1hJvHe14lqiAeieL7AhJNIQeOkYMMpi6
         zSzzHYVy9xxZKwYFiWW72Y3hWdrnGYZ2NM0YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752681628; x=1753286428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1SaeRL6BLke/Vs0aykI7PTH6MJeBZpeQf6U09ZSw/Ho=;
        b=ZYYm9c1DkCwDpJSp8tLbWFMygYzySd66sJWod9+gjO4YFMv8puaveywqToqlg+eODA
         i+gbu/l7Z/NLRube3gZZ48GZfJAgkJNt25xAzpPMOnHnuPB7sVrQJ+igvqOICv+cigVd
         qxm1v3saTB6kgoocFbKOaJ2PVrz0vcQSLiKULeTMfbJx6btkLjsPJ/A/nkQ9FTubHfYC
         FuDr4DVz6tl3DCcT1P3+9mlQ5ZA5bAeS4d7O1CjYpvbE3kUWSH8blJoodYJuIIIMODP+
         oBju1wZSG0adMLuOj84cvwBQqmGDBipswZYCa5hmgg/cxjrqiwVqxM7QGh+XFyKuvZFj
         12Yg==
X-Gm-Message-State: AOJu0Yw0ta8Tg66/vcPNxQa6kkFJhOPL7jsAWgzYVNi/E2NRij8GDuKW
	fehks4/Jl0JHkDo1K+WL6CaqTR2XqI2XKy5dClUtXtDSSCq/A8l/gyQCNfawFudJqBKpDjSxCls
	Ea/vE
X-Gm-Gg: ASbGnctlpA9iut1fj7W+HuVptq4VYw0PQsnsy179ni9aOC3Yh26FfBtmOJMpRaDaMq5
	23yC8CCmTmbNc9SktfNu3wcubOj/lhOl+XJS4PHRcgth5AzNAljrmVJXFLHZsmxBglaUPk1/UML
	wRaZ1BbpVDaT1zxuOTU4WJ3udKuou51d3zzC1SBpUWNDKvLRh81xbd9oJXozOzCx+Z4VaBd97QL
	DHmz7juInCjIN4uqkpdzsEfa5GTYamdNGxCvHmbyU1ayON0T1uXx0oZc7oy7PelyEJ5fOrycWxi
	2nMU2glPEhoeKuxozp94DFCPXPh24RhbDntvHxIxa2r9+Lk5uLT+lkG3nsDyvde+wlN17ZIBpKn
	S3fozh7xcjui2wwpHcVgmJmE1DlbdJZnsj8mzSDDSO3DhIv78NnD324EsTOzT4MhbZQ==
X-Google-Smtp-Source: AGHT+IGp42/Z0gvqVR2I5ah6coouZnJKJ+IvBF0ZYBmlZ+EooodCIwhp+W3XM+wHaSfh2WLmC+veaw==
X-Received: by 2002:a05:6000:26cc:b0:3a4:d4cd:b06 with SMTP id ffacd0b85a97d-3b60e50ff10mr2596624f8f.34.1752681627552;
        Wed, 16 Jul 2025 09:00:27 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH] xen/livepatch: fixup relocations to replaced symbols
Date: Wed, 16 Jul 2025 18:00:07 +0200
Message-ID: <20250716160007.92461-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In a livepatch payload relocations will refer to included functions.  If
that function happens to be a replacement for an existing Xen function, the
relocations on the livepatch payload will use the newly introduced symbol,
rather than the old one.  This is usually fine, but if the result of the
relocation is stored for later use (for example in the domain struct),
usages of this address will lead to a page-fault once the livepatch is
reverted.

Implement a second pass over relocations once the list of replaced
functions has been loaded, and fixup any references to replaced functions
to use the old symbol address instead of the new one.  There are some
sections that must be special cased to continue using the new symbol
address, as those instances must reference the newly added livepatch
content (for example the alternative patch sites).

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/arm/arm32/livepatch.c  | 27 ++++++++++----
 xen/arch/arm/arm64/livepatch.c  | 23 ++++++++++--
 xen/arch/x86/livepatch.c        | 23 ++++++++++--
 xen/common/livepatch.c          | 13 ++++++-
 xen/common/livepatch_elf.c      | 62 +++++++++++++++++++++++++++++++--
 xen/include/xen/livepatch.h     |  6 ++--
 xen/include/xen/livepatch_elf.h |  4 ++-
 7 files changed, 139 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/arm32/livepatch.c b/xen/arch/arm/arm32/livepatch.c
index 134d07a175bb..8c12099d6a1d 100644
--- a/xen/arch/arm/arm32/livepatch.c
+++ b/xen/arch/arm/arm32/livepatch.c
@@ -224,7 +224,7 @@ static int perform_rel(unsigned char type, void *dest, uint32_t val,
 int arch_livepatch_perform(struct livepatch_elf *elf,
                            const struct livepatch_elf_sec *base,
                            const struct livepatch_elf_sec *rela,
-                           bool use_rela)
+                           bool fixup, bool use_rela)
 {
     unsigned int i;
     int rc = 0;
@@ -282,7 +282,20 @@ int arch_livepatch_perform(struct livepatch_elf *elf,
             return -EINVAL;
         }
 
-        val = elf->sym[symndx].sym->st_value; /* S */
+        if ( fixup )
+        {
+            val = livepatch_elf_use_old_addr(elf,
+                                             elf->sym[symndx].sym->st_value);
+            if ( val == elf->sym[symndx].sym->st_value )
+                /* Don't re-apply if the symbol value hasn't changed. */
+                continue;
+            dprintk(XENLOG_DEBUG, LIVEPATCH
+                    "%s: Using old address for symbol %s at reloc %s + %#x\n",
+                    elf->name, elf->sym[symndx].name, base->name,
+                    dest - base->addr);
+        }
+        else
+            val = elf->sym[symndx].sym->st_value; /* S */
 
         rc = perform_rel(type, dest, val, addend);
         switch ( rc )
@@ -307,16 +320,18 @@ int arch_livepatch_perform(struct livepatch_elf *elf,
 
 int arch_livepatch_perform_rel(struct livepatch_elf *elf,
                                const struct livepatch_elf_sec *base,
-                               const struct livepatch_elf_sec *rela)
+                               const struct livepatch_elf_sec *rela,
+                               bool fixup)
 {
-    return arch_livepatch_perform(elf, base, rela, false);
+    return arch_livepatch_perform(elf, base, rela, fixup, false);
 }
 
 int arch_livepatch_perform_rela(struct livepatch_elf *elf,
                                 const struct livepatch_elf_sec *base,
-                                const struct livepatch_elf_sec *rela)
+                                const struct livepatch_elf_sec *rela
+                                bool fixup)
 {
-    return arch_livepatch_perform(elf, base, rela, true);
+    return arch_livepatch_perform(elf, base, rela, fixup, true);
 }
 
 /*
diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index e135bd5bf99a..bdbe611832fb 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -233,14 +233,16 @@ static int reloc_insn_imm(enum aarch64_reloc_op op, void *dest, u64 val,
 
 int arch_livepatch_perform_rel(struct livepatch_elf *elf,
                                const struct livepatch_elf_sec *base,
-                               const struct livepatch_elf_sec *rela)
+                               const struct livepatch_elf_sec *rela,
+                               bool fixup)
 {
     return -ENOSYS;
 }
 
 int arch_livepatch_perform_rela(struct livepatch_elf *elf,
                                 const struct livepatch_elf_sec *base,
-                                const struct livepatch_elf_sec *rela)
+                                const struct livepatch_elf_sec *rela,
+                                bool fixup)
 {
     unsigned int i;
 
@@ -279,7 +281,22 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
             return -EINVAL;
         }
 
-        val = elf->sym[symndx].sym->st_value +  r->r_addend; /* S+A */
+        if ( fixup )
+        {
+            val = livepatch_elf_use_old_addr(elf,
+                                             elf->sym[symndx].sym->st_value);
+            if ( val == elf->sym[symndx].sym->st_value )
+                /* Don't re-apply if the symbol value hasn't changed. */
+                continue;
+            dprintk(XENLOG_DEBUG, LIVEPATCH
+                    "%s: Using old address for symbol %s at reloc %s + %#lx\n",
+                    elf->name, elf->sym[symndx].name, base->name,
+                    r->r_offset);
+        }
+        else
+            val = elf->sym[symndx].sym->st_value; /* S */
+
+        val += r->r_addend; /* S + A */
 
         /* ARM64 operations at minimum are always 32-bit. */
         if ( r->r_offset >= base->sec->sh_size ||
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index be40f625d206..2944fdb9f91e 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -243,7 +243,8 @@ bool arch_livepatch_symbol_deny(const struct livepatch_elf *elf,
 
 int arch_livepatch_perform_rel(struct livepatch_elf *elf,
                                const struct livepatch_elf_sec *base,
-                               const struct livepatch_elf_sec *rela)
+                               const struct livepatch_elf_sec *rela,
+                               bool fixup)
 {
     printk(XENLOG_ERR LIVEPATCH "%s: SHT_REL relocation unsupported\n",
            elf->name);
@@ -252,7 +253,8 @@ int arch_livepatch_perform_rel(struct livepatch_elf *elf,
 
 int arch_livepatch_perform_rela(struct livepatch_elf *elf,
                                 const struct livepatch_elf_sec *base,
-                                const struct livepatch_elf_sec *rela)
+                                const struct livepatch_elf_sec *rela,
+                                bool fixup)
 {
     unsigned int i;
 
@@ -289,7 +291,22 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
             return -EINVAL;
         }
 
-        val = r->r_addend + elf->sym[symndx].sym->st_value;
+        if ( fixup )
+        {
+            val = livepatch_elf_use_old_addr(elf,
+                                             elf->sym[symndx].sym->st_value);
+            if ( val == elf->sym[symndx].sym->st_value )
+                /* Don't re-apply if the symbol value hasn't changed. */
+                continue;
+            dprintk(XENLOG_DEBUG, LIVEPATCH
+                    "%s: Using old address for symbol %s at reloc %s + %#lx\n",
+                    elf->name, elf->sym[symndx].name, base->name,
+                    r->r_offset);
+        }
+        else
+            val = elf->sym[symndx].sym->st_value;
+
+        val += r->r_addend;
 
         switch ( ELF64_R_TYPE(r->r_info) )
         {
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 9a0df5363b59..6bffd1954469 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -741,6 +741,17 @@ static int prepare_payload(struct payload *payload,
             if ( rc )
                 return rc;
         }
+
+        /*
+         * Do a second pass over the relocations and adjust those that use a
+         * replacement symbol to continue using the old address.  Otherwise
+         * storing those relocated addresses would lead to crashes when the
+         * livepatch is reverted if there are stored references that point to
+         * the reverted symbols.
+         */
+        rc = livepatch_elf_perform_relocs(elf, true);
+        if ( rc )
+           return rc;
     }
 
     LIVEPATCH_ASSIGN_MULTI_HOOK(elf, payload->load_funcs, payload->n_load_funcs, ELF_LIVEPATCH_LOAD_HOOKS);
@@ -1164,7 +1175,7 @@ static int load_payload_data(struct payload *payload, void *raw, size_t len)
     if ( rc )
         goto out;
 
-    rc = livepatch_elf_perform_relocs(&elf);
+    rc = livepatch_elf_perform_relocs(&elf, false);
     if ( rc )
         goto out;
 
diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
index 25ce1bd5a0ad..f6d4c8584718 100644
--- a/xen/common/livepatch_elf.c
+++ b/xen/common/livepatch_elf.c
@@ -358,7 +358,29 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
     return rc;
 }
 
-int livepatch_elf_perform_relocs(struct livepatch_elf *elf)
+Elf_Addr livepatch_elf_use_old_addr(const struct livepatch_elf *elf,
+                                    Elf_Addr new)
+{
+    const struct livepatch_elf_sec *replacements =
+        livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_FUNC);
+    struct livepatch_func *f;
+    unsigned int i;
+
+    if ( !replacements )
+    {
+        ASSERT_UNREACHABLE();
+        return new;
+    }
+
+    f = replacements->addr;
+    for ( i = 0; i < replacements->sec->sh_size / sizeof(*f); i++ )
+        if ( (Elf_Addr)f[0].new_addr == new )
+            return (Elf_Addr)f[0].old_addr;
+
+    return new;
+}
+
+int livepatch_elf_perform_relocs(struct livepatch_elf *elf, bool fixup)
 {
     struct livepatch_elf_sec *r, *base;
     unsigned int i;
@@ -381,6 +403,40 @@ int livepatch_elf_perform_relocs(struct livepatch_elf *elf)
 
          base = &elf->sec[r->sec->sh_info];
 
+         if ( fixup )
+         {
+             static const char *const ignore[] = {
+                 /* Do not fixup the replacement coordinates. */
+                 ELF_LIVEPATCH_FUNC,
+                 /*
+                  * alternatives and exception table fixups need to unconditionally
+                  * reference the new functions, or otherwise they won't be applied
+                  * correctly.
+                  */
+                 ".altinstructions",
+                 ".alt_call_sites",
+                 ".ex_table",
+                 /*
+                  * livepatch hooks use the old function addresses: if there's a need
+                  * for the hooks to call the newly added function replacements a
+                  * non-aliased duplicate must be added.
+                  */
+             };
+             unsigned int j;
+
+             /* Bug frames must use the payload addresses. */
+             if ( !strncmp(base->name, ".bug_frames.", 12) )
+                 continue;
+
+             /* If doing fixups ignore some special sections. */
+             for ( j = 0; j < ARRAY_SIZE(ignore); j++ )
+                 if ( !strcmp(base->name, ignore[j]) )
+                     break;
+
+             if ( j != ARRAY_SIZE(ignore) )
+                 continue;
+         }
+
          /* Don't relocate non-allocated sections. */
          if ( !(base->sec->sh_flags & SHF_ALLOC) )
             continue;
@@ -410,9 +466,9 @@ int livepatch_elf_perform_relocs(struct livepatch_elf *elf)
         }
 
         if ( r->sec->sh_type == SHT_RELA )
-            rc = arch_livepatch_perform_rela(elf, base, r);
+            rc = arch_livepatch_perform_rela(elf, base, r, fixup);
         else /* SHT_REL */
-            rc = arch_livepatch_perform_rel(elf, base, r);
+            rc = arch_livepatch_perform_rel(elf, base, r, fixup);
 
         if ( rc )
             break;
diff --git a/xen/include/xen/livepatch.h b/xen/include/xen/livepatch.h
index d074a5bebecc..84091ea9c33e 100644
--- a/xen/include/xen/livepatch.h
+++ b/xen/include/xen/livepatch.h
@@ -75,10 +75,12 @@ bool arch_livepatch_symbol_deny(const struct livepatch_elf *elf,
                                 const struct livepatch_elf_sym *sym);
 int arch_livepatch_perform_rel(struct livepatch_elf *elf,
                                const struct livepatch_elf_sec *base,
-                               const struct livepatch_elf_sec *rela);
+                               const struct livepatch_elf_sec *rela,
+                               bool fixup);
 int arch_livepatch_perform_rela(struct livepatch_elf *elf,
                                 const struct livepatch_elf_sec *base,
-                                const struct livepatch_elf_sec *rela);
+                                const struct livepatch_elf_sec *rela,
+                                bool fixup);
 enum va_type {
     LIVEPATCH_VA_RX, /* .text */
     LIVEPATCH_VA_RW, /* .data */
diff --git a/xen/include/xen/livepatch_elf.h b/xen/include/xen/livepatch_elf.h
index 842111e14518..acd98b10d8da 100644
--- a/xen/include/xen/livepatch_elf.h
+++ b/xen/include/xen/livepatch_elf.h
@@ -46,7 +46,9 @@ int livepatch_elf_load(struct livepatch_elf *elf, void *data);
 void livepatch_elf_free(struct livepatch_elf *elf);
 
 int livepatch_elf_resolve_symbols(struct livepatch_elf *elf);
-int livepatch_elf_perform_relocs(struct livepatch_elf *elf);
+int livepatch_elf_perform_relocs(struct livepatch_elf *elf, bool fixup);
+Elf_Addr livepatch_elf_use_old_addr(const struct livepatch_elf *elf,
+                                    Elf_Addr new);
 
 static inline bool livepatch_elf_ignore_section(const Elf_Shdr *sec)
 {
-- 
2.49.0


