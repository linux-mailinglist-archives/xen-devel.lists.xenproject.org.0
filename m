Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E6987142
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805201.1216250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stld6-0001Qi-Tb; Thu, 26 Sep 2024 10:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805201.1216250; Thu, 26 Sep 2024 10:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stld6-0001OL-Op; Thu, 26 Sep 2024 10:21:48 +0000
Received: by outflank-mailman (input) for mailman id 805201;
 Thu, 26 Sep 2024 10:21:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ahor=QY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1stld5-0001Nm-Bu
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:21:47 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2164b3eb-7bf1-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:21:45 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so97830066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:21:45 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9392f3420esm329957766b.40.2024.09.26.03.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 03:21:43 -0700 (PDT)
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
X-Inumbo-ID: 2164b3eb-7bf1-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727346104; x=1727950904; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eDso/Pr8s7RpxPIwn6UDYP8gOZplQOaVxuligGB90sQ=;
        b=rENQF9NQxCZq4wlrOY70MdmrBlz/SYY+5AJIqhtrDpFrnJ7kBh1Qe7d1fudb347YK6
         oOA98F5rzyygUactTzDHd0ViJQn2mUtGzkZdVkhUnK06J80kOLDk9ma10C5hl8n78x7S
         WgDBa8kMBtIhim0987KmXlBrLsOUnqt0rYNtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727346104; x=1727950904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDso/Pr8s7RpxPIwn6UDYP8gOZplQOaVxuligGB90sQ=;
        b=MMrKmdUcHzQNXVqLnFKj5ZxeUe6i83XReJb5fA1MxbcOnogkyjr/pKHY4dGvCbKNdn
         4AY4d48LwX8XAEDlmRQAKlE0WiwQzUMLLbYXCspopooDIx52DIiwaWa4mJu1Qttj4spp
         VFTIrwpTkaur9+BGZC11SF6sB5LmtcQDa1tgEhxo8tAShiJ8cUvleLgU0B5wV1GxmIK7
         M5h4v1/7SUHhGWvkXNmrhkcKWMAX07tW5ts2n329OIRUdqHZo5RDrU9dYeJFrcvAv8It
         zRZEDQJlM16wL+21buokqg2pteakHwS5tAAJE5kKJpbYJiufxeljJN9WnLsplz4AvrDI
         ZI8g==
X-Gm-Message-State: AOJu0YychFahvbUAdp+Ytvd/ntxzFc2jzVu7CJ9bbRTgqtzY7BNZZ3oh
	qt/Z4+BIg0T1cLhSoRIhD7yLOP3YjW2UxpNKyThgBdrMGIn1PH6n8SpD9+wNjuQQ487lLsL2cE9
	s
X-Google-Smtp-Source: AGHT+IEvsbzLb/qGdqqJ0XTDWcyfYeCjaaAUF7ElCrZjELC3nWpE3pht/kOZv3/RRWA68fzj8NrG0w==
X-Received: by 2002:a17:907:1ca1:b0:a8c:78a5:8fc4 with SMTP id a640c23a62f3a-a93a036a36bmr444073166b.19.1727346104080;
        Thu, 26 Sep 2024 03:21:44 -0700 (PDT)
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
Subject: [PATCH v3 1/5] xen/livepatch: drop load_addr Elf section field
Date: Thu, 26 Sep 2024 12:14:27 +0200
Message-ID: <20240926101431.97444-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240926101431.97444-1-roger.pau@citrix.com>
References: <20240926101431.97444-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Elf loading logic will initially use the `data` section field to stash a
pointer to the temporary loaded data (from the buffer allocated in
livepatch_upload(), which is later relocated and the new pointer stashed in
`load_addr`.

Remove this dual field usage and use an `addr` uniformly.  Initially data will
point to the temporary buffer, until relocation happens, at which point the
pointer will be updated to the relocated address.

This avoids leaking a dangling pointer in the `data` field once the temporary
buffer is freed by livepatch_upload().

Note the `addr` field cannot retain the const attribute from the previous
`data`field, as there's logic that performs manipulations against the loaded
sections, like applying relocations or sorting the exception table.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - New in this version.
---
 xen/arch/arm/arm32/livepatch.c  |  8 +++---
 xen/arch/arm/arm64/livepatch.c  |  4 +--
 xen/arch/x86/livepatch.c        |  4 +--
 xen/common/livepatch.c          | 43 ++++++++++++++++++---------------
 xen/common/livepatch_elf.c      | 20 +++++++--------
 xen/include/xen/livepatch_elf.h | 11 +++++----
 6 files changed, 47 insertions(+), 43 deletions(-)

diff --git a/xen/arch/arm/arm32/livepatch.c b/xen/arch/arm/arm32/livepatch.c
index d50066564666..134d07a175bb 100644
--- a/xen/arch/arm/arm32/livepatch.c
+++ b/xen/arch/arm/arm32/livepatch.c
@@ -239,20 +239,20 @@ int arch_livepatch_perform(struct livepatch_elf *elf,
 
         if ( use_rela )
         {
-            const Elf_RelA *r_a = rela->data + i * rela->sec->sh_entsize;
+            const Elf_RelA *r_a = rela->addr + i * rela->sec->sh_entsize;
 
             symndx = ELF32_R_SYM(r_a->r_info);
             type = ELF32_R_TYPE(r_a->r_info);
-            dest = base->load_addr + r_a->r_offset; /* P */
+            dest = base->addr + r_a->r_offset; /* P */
             addend = r_a->r_addend;
         }
         else
         {
-            const Elf_Rel *r = rela->data + i * rela->sec->sh_entsize;
+            const Elf_Rel *r = rela->addr + i * rela->sec->sh_entsize;
 
             symndx = ELF32_R_SYM(r->r_info);
             type = ELF32_R_TYPE(r->r_info);
-            dest = base->load_addr + r->r_offset; /* P */
+            dest = base->addr + r->r_offset; /* P */
             addend = get_addend(type, dest);
         }
 
diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index dfb72be44fb8..d80051f9dc67 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -246,9 +246,9 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
 
     for ( i = 0; i < (rela->sec->sh_size / rela->sec->sh_entsize); i++ )
     {
-        const Elf_RelA *r = rela->data + i * rela->sec->sh_entsize;
+        const Elf_RelA *r = rela->addr + i * rela->sec->sh_entsize;
         unsigned int symndx = ELF64_R_SYM(r->r_info);
-        void *dest = base->load_addr + r->r_offset; /* P */
+        void *dest = base->addr + r->r_offset; /* P */
         bool overflow_check = true;
         int ovf = 0;
         uint64_t val;
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 4f76127e1f77..be40f625d206 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -258,9 +258,9 @@ int arch_livepatch_perform_rela(struct livepatch_elf *elf,
 
     for ( i = 0; i < (rela->sec->sh_size / rela->sec->sh_entsize); i++ )
     {
-        const Elf_RelA *r = rela->data + i * rela->sec->sh_entsize;
+        const Elf_RelA *r = rela->addr + i * rela->sec->sh_entsize;
         unsigned int symndx = ELF64_R_SYM(r->r_info);
-        uint8_t *dest = base->load_addr + r->r_offset;
+        uint8_t *dest = base->addr + r->r_offset;
         uint64_t val;
 
         if ( symndx == STN_UNDEF )
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index df41dcce970a..7e6bf58f4408 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -371,18 +371,21 @@ static int move_payload(struct payload *payload, struct livepatch_elf *elf)
 
             ASSERT(offset[i] != UINT_MAX);
 
-            elf->sec[i].load_addr = buf + offset[i];
+            buf += offset[i];
 
             /* Don't copy NOBITS - such as BSS. */
             if ( elf->sec[i].sec->sh_type != SHT_NOBITS )
             {
-                memcpy(elf->sec[i].load_addr, elf->sec[i].data,
+                memcpy(buf, elf->sec[i].addr,
                        elf->sec[i].sec->sh_size);
                 dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Loaded %s at %p\n",
-                        elf->name, elf->sec[i].name, elf->sec[i].load_addr);
+                        elf->name, elf->sec[i].name, buf);
             }
             else
-                memset(elf->sec[i].load_addr, 0, elf->sec[i].sec->sh_size);
+                memset(buf, 0, elf->sec[i].sec->sh_size);
+
+            /* Replace the temporary buffer with the relocated one. */
+            elf->sec[i].addr = buf;
         }
     }
 
@@ -616,7 +619,7 @@ static inline int livepatch_check_expectations(const struct payload *payload)
         break;                                                                            \
     if ( !section_ok(elf, __sec, sizeof(*hook)) || __sec->sec->sh_size != sizeof(*hook) ) \
         return -EINVAL;                                                                   \
-    hook = __sec->load_addr;                                                              \
+    hook = __sec->addr;                                                                   \
 } while (0)
 
 /*
@@ -630,7 +633,7 @@ static inline int livepatch_check_expectations(const struct payload *payload)
         break;                                                                            \
     if ( !section_ok(elf, __sec, sizeof(*hook)) )                                         \
         return -EINVAL;                                                                   \
-    hook = __sec->load_addr;                                                              \
+    hook = __sec->addr;                                                                   \
     nhooks = __sec->sec->sh_size / sizeof(*hook);                                         \
 } while (0)
 
@@ -650,7 +653,7 @@ static int prepare_payload(struct payload *payload,
         if ( !section_ok(elf, sec, sizeof(*payload->funcs)) )
             return -EINVAL;
 
-        payload->funcs = funcs = sec->load_addr;
+        payload->funcs = funcs = sec->addr;
         payload->nfuncs = sec->sec->sh_size / sizeof(*payload->funcs);
 
         payload->fstate = xzalloc_array(typeof(*payload->fstate),
@@ -709,7 +712,7 @@ static int prepare_payload(struct payload *payload,
     {
         const struct payload *data;
 
-        n = sec->load_addr;
+        n = sec->addr;
 
         if ( sec->sec->sh_size <= sizeof(*n) )
             return -EINVAL;
@@ -739,7 +742,7 @@ static int prepare_payload(struct payload *payload,
     sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_DEPENDS);
     if ( sec )
     {
-        n = sec->load_addr;
+        n = sec->addr;
 
         if ( sec->sec->sh_size <= sizeof(*n) )
             return -EINVAL;
@@ -755,7 +758,7 @@ static int prepare_payload(struct payload *payload,
     sec = livepatch_elf_sec_by_name(elf, ELF_LIVEPATCH_XEN_DEPENDS);
     if ( sec )
     {
-        n = sec->load_addr;
+        n = sec->addr;
 
         if ( sec->sec->sh_size <= sizeof(*n) )
             return -EINVAL;
@@ -794,8 +797,8 @@ static int prepare_payload(struct payload *payload,
         if ( !section_ok(elf, sec, sizeof(*region->frame[i].start)) )
             return -EINVAL;
 
-        region->frame[i].start = sec->load_addr;
-        region->frame[i].stop  = sec->load_addr + sec->sec->sh_size;
+        region->frame[i].start = sec->addr;
+        region->frame[i].stop  = sec->addr + sec->sec->sh_size;
     }
 
     sec = livepatch_elf_sec_by_name(elf, ".altinstructions");
@@ -843,8 +846,8 @@ static int prepare_payload(struct payload *payload,
             return -EINVAL;
         }
 
-        start = sec->load_addr;
-        end = sec->load_addr + sec->sec->sh_size;
+        start = sec->addr;
+        end = sec->addr + sec->sec->sh_size;
 
         for ( a = start; a < end; a++ )
         {
@@ -867,14 +870,14 @@ static int prepare_payload(struct payload *payload,
              * repl must be fully within .altinstr_replacement, even if the
              * replacement and the section happen to both have zero length.
              */
-            if ( repl               < repl_sec->load_addr ||
+            if ( repl               < repl_sec->addr ||
                  a->repl_len        > repl_sec->sec->sh_size ||
-                 repl + a->repl_len > repl_sec->load_addr + repl_sec->sec->sh_size )
+                 repl + a->repl_len > repl_sec->addr + repl_sec->sec->sh_size )
             {
                 printk(XENLOG_ERR LIVEPATCH
                        "%s Alternative repl %p+%#x outside .altinstr_replacement %p+%#"PRIxElfWord"\n",
                        elf->name, repl, a->repl_len,
-                       repl_sec->load_addr, repl_sec->sec->sh_size);
+                       repl_sec->addr, repl_sec->sec->sh_size);
                 return -EINVAL;
             }
         }
@@ -896,8 +899,8 @@ static int prepare_payload(struct payload *payload,
         if ( !section_ok(elf, sec, sizeof(*region->ex)) )
             return -EINVAL;
 
-        s = sec->load_addr;
-        e = sec->load_addr + sec->sec->sh_size;
+        s = sec->addr;
+        e = sec->addr + sec->sec->sh_size;
 
         sort_exception_table(s ,e);
 
@@ -916,7 +919,7 @@ static int prepare_payload(struct payload *payload,
         if ( !section_ok(elf, sec, sizeof(*payload->metadata.data)) )
             return -EINVAL;
 
-        payload->metadata.data = sec->load_addr;
+        payload->metadata.data = sec->addr;
         payload->metadata.len = sec->sec->sh_size;
 
         /* The metadata is required to consists of null terminated strings. */
diff --git a/xen/common/livepatch_elf.c b/xen/common/livepatch_elf.c
index 45d73912a3cd..25ce1bd5a0ad 100644
--- a/xen/common/livepatch_elf.c
+++ b/xen/common/livepatch_elf.c
@@ -36,7 +36,7 @@ static int elf_verify_strtab(const struct livepatch_elf_sec *sec)
     if ( !s->sh_size )
         return -EINVAL;
 
-    contents = sec->data;
+    contents = sec->addr;
 
     if ( contents[0] || contents[s->sh_size - 1] )
         return -EINVAL;
@@ -44,7 +44,7 @@ static int elf_verify_strtab(const struct livepatch_elf_sec *sec)
     return 0;
 }
 
-static int elf_resolve_sections(struct livepatch_elf *elf, const void *data)
+static int elf_resolve_sections(struct livepatch_elf *elf, void *data)
 {
     struct livepatch_elf_sec *sec;
     unsigned int i;
@@ -104,7 +104,7 @@ static int elf_resolve_sections(struct livepatch_elf *elf, const void *data)
                   sec[i].sec->sh_size > LIVEPATCH_MAX_SIZE )
             return -EINVAL;
 
-        sec[i].data = data + delta;
+        sec[i].addr = data + delta;
         /* Name is populated in elf_resolve_section_names. */
         sec[i].name = NULL;
 
@@ -226,14 +226,14 @@ static int elf_get_sym(struct livepatch_elf *elf, const void *data)
     strtab_sec = elf->strtab;
 
     /* Pointers arithmetic to get file offset. */
-    offset = strtab_sec->data - data;
+    offset = strtab_sec->addr - data;
 
     /* Checked already in elf_resolve_sections, but just in case. */
     ASSERT(offset == strtab_sec->sec->sh_offset);
     ASSERT(offset < elf->len && (offset + strtab_sec->sec->sh_size <= elf->len));
 
-    /* symtab_sec->data was computed in elf_resolve_sections. */
-    ASSERT((symtab_sec->sec->sh_offset + data) == symtab_sec->data);
+    /* symtab_sec->addr was computed in elf_resolve_sections. */
+    ASSERT((symtab_sec->sec->sh_offset + data) == symtab_sec->addr);
 
     /* No need to check values as elf_resolve_sections did it. */
     nsym = symtab_sec->sec->sh_size / symtab_sec->sec->sh_entsize;
@@ -251,7 +251,7 @@ static int elf_get_sym(struct livepatch_elf *elf, const void *data)
 
     for ( i = 1; i < nsym; i++ )
     {
-        const Elf_Sym *s = symtab_sec->data + symtab_sec->sec->sh_entsize * i;
+        const Elf_Sym *s = symtab_sec->addr + symtab_sec->sec->sh_entsize * i;
 
         delta = s->st_name;
         /* Boundary check within the .strtab. */
@@ -263,7 +263,7 @@ static int elf_get_sym(struct livepatch_elf *elf, const void *data)
         }
 
         sym[i].sym = s;
-        sym[i].name = strtab_sec->data + delta;
+        sym[i].name = strtab_sec->addr + delta;
         if ( arch_livepatch_symbol_deny(elf, &sym[i]) )
         {
             printk(XENLOG_ERR LIVEPATCH "%s: Symbol '%s' should not be in payload\n",
@@ -342,7 +342,7 @@ int livepatch_elf_resolve_symbols(struct livepatch_elf *elf)
                 break;
             }
 
-            st_value += (unsigned long)elf->sec[idx].load_addr;
+            st_value += (unsigned long)elf->sec[idx].addr;
             if ( elf->sym[i].name )
                 dprintk(XENLOG_DEBUG, LIVEPATCH "%s: Symbol resolved: %s => %#"PRIxElfAddr" (%s)\n",
                        elf->name, elf->sym[i].name,
@@ -503,7 +503,7 @@ static int livepatch_header_check(const struct livepatch_elf *elf)
     return 0;
 }
 
-int livepatch_elf_load(struct livepatch_elf *elf, const void *data)
+int livepatch_elf_load(struct livepatch_elf *elf, void *data)
 {
     int rc;
 
diff --git a/xen/include/xen/livepatch_elf.h b/xen/include/xen/livepatch_elf.h
index 7116deaddc28..842111e14518 100644
--- a/xen/include/xen/livepatch_elf.h
+++ b/xen/include/xen/livepatch_elf.h
@@ -13,10 +13,11 @@ struct livepatch_elf_sec {
     const Elf_Shdr *sec;                 /* Hooked up in elf_resolve_sections.*/
     const char *name;                    /* Human readable name hooked in
                                             elf_resolve_section_names. */
-    const void *data;                    /* Pointer to the section (done by
-                                            elf_resolve_sections). */
-    void *load_addr;                     /* A pointer to the allocated destination.
-                                            Done by load_payload_data. */
+    void *addr;                          /*
+                                          * Pointer to the section.  This is
+                                          * first a temporary buffer, then
+                                          * later the relocated load address.
+                                          */
 };
 
 struct livepatch_elf_sym {
@@ -41,7 +42,7 @@ struct livepatch_elf {
 const struct livepatch_elf_sec *
 livepatch_elf_sec_by_name(const struct livepatch_elf *elf,
                           const char *name);
-int livepatch_elf_load(struct livepatch_elf *elf, const void *data);
+int livepatch_elf_load(struct livepatch_elf *elf, void *data);
 void livepatch_elf_free(struct livepatch_elf *elf);
 
 int livepatch_elf_resolve_symbols(struct livepatch_elf *elf);
-- 
2.46.0


