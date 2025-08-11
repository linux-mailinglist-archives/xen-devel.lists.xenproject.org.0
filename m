Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C52B2066D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 12:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077311.1438376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQAR-0006kB-GS; Mon, 11 Aug 2025 10:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077311.1438376; Mon, 11 Aug 2025 10:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQAR-0006hR-Cx; Mon, 11 Aug 2025 10:54:15 +0000
Received: by outflank-mailman (input) for mailman id 1077311;
 Mon, 11 Aug 2025 10:54:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulQAP-0006hL-TC
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 10:54:13 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 827e03dd-76a1-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 12:54:10 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-af968aa2de4so771470266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 03:54:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c157sm2007428166b.100.2025.08.11.03.54.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:54:09 -0700 (PDT)
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
X-Inumbo-ID: 827e03dd-76a1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754909649; x=1755514449; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mUCV2NyNMANoGwoFXtVyYXTcA8jNF19RM15JavBWQsA=;
        b=ZIXto8UJXTPOx6rvHSAjWRizj3Yyg1yIuITsZtI8v4M6hunbad/rep54povaoqEsO1
         JXPthrEskt1IBk+1aRpXlfdOfatVXm5w+fbyOYYaFvSvCRZmSi/DWE0bU9D7QbPBUnv+
         +gjmXuuc+98NGy7sclagSu06JOU0AUE/bYgGlCzwkl487KUrn69TJyqWt7bW3wzAgS2P
         QP+0g8sJpsJUKxIUzzsG3o96yMpcAIafTq6M8nVICEh03IBUYqeonOMJfJqlwxkelj4p
         CtyB3nMlmC0rARSYIKdB4WtIqYxxAZquRLnuQym5zwc8oFmCrk24YNogAbW9/nVTDogc
         AnZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909649; x=1755514449;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mUCV2NyNMANoGwoFXtVyYXTcA8jNF19RM15JavBWQsA=;
        b=afP/lV++z74KKxWfMDA9XikJlTERyosLbqo/VBItS+i+8cF3ixK386YcKfjNuBmcLl
         op6SLk0OHe6K2+F8zLk7yfQHdeCVq5dAulVNH/+sycApnZwItNhTKZD5nrHGxZft/XUr
         40GVjbibvmASQMhnv9pASQzboVOJyd4+CDXBnzv5YZwSxRryaj17EXY4W2I8U6cVK6aG
         g7lNBLX2Aj4rk8A5k5H8fDQpaOh5haAwczYn7KGyGxpqwKXMLFyrPu4ISrCAOkapZ4+1
         /m45sFOYSifAX3zrY96cZcTVJpRilLHt72HxoYK8w3WrjCkEU5cT200hdmoDLzTvoyG0
         yngA==
X-Gm-Message-State: AOJu0Yw1jDOTgf9y20VMFCm3MuPcYIAwjwORY0OwXJDdNHl2pIjG/CLg
	sldvq5ZV3IYAbNt6mYJc+1DqjTnv+/OClJrP6aiK5yC+7BjL6R35OB/YGs1YKcOCGkgUm+NFZHp
	wG+A=
X-Gm-Gg: ASbGncvaXI1ecYAvqgxpnbA0UgQpUsY8ibfqZ+ip0F1nw2bz1xNT/RPGYkZEQLDz9we
	GknPcLlsVGGQs6/RAcY5k27TNqh8+Y02tMjy/yRZq6LNaX8aFR0nmii4FVXOW0mPQyFpAlJvQOz
	5As4/yjzO5ocvEewJ0jwolsu3Va+QwI5Z/bsU4wPvjau+g7x6qM6e6lRoWTT0WREBmPeZBm3vWj
	3ZxKkZnugBXwXMVxpB7MQmLGcuJRRqj6oQXK5jvakNFFbDoN3anrz1ppb3G8Qy448+HDYSNzUcI
	sn0kZcXwL+fzjC4fitrZyI/4xWt4GCq9TTiiYRfhgd5Jr2/wxL8MTzdvHsOIfXsv4v6Xn5iQJiQ
	fNe9ryQQFCC9bFWvyLafcrBVzbnyubv4Osl5fCDTdzGhU2EKr/Gb9RN5h2bBnsxfSyu4qxDYaex
	7ev5NiY5k=
X-Google-Smtp-Source: AGHT+IEgpHnKU7MIqgsQKSml3pAYfURDH06SDAw2wLNd+pnihsRB4O/q5UxkvwbxVKljV96FShrZ2A==
X-Received: by 2002:a17:906:6a02:b0:af9:4fa9:b132 with SMTP id a640c23a62f3a-af9c6516306mr1100470366b.33.1754909649391;
        Mon, 11 Aug 2025 03:54:09 -0700 (PDT)
Message-ID: <c6e38491-6fcd-4d14-a7da-fa77c9edc4a2@suse.com>
Date: Mon, 11 Aug 2025 12:54:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] ELF: correct .note.* alignment handling
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The present uniform 4-byte alignment hasn't been right for, I think, a
very long time (albeit not forever). As per e.g. [1], 8-byte alignment
is required in 64-bit ELF containers (and assembler-generated
.note.gnu.property, for example, is 8-byte aligned, while - oddly -
linker-generated .note.gnu.build-id is only 4-byte aligned [2]). Sadly
libelf is also affected, and hence going strictly by the spec would
break kernels also getting it wrong (e.g. Linux). Apply the same
heuristic as GNU readelf does: If section alignment is 4 or less, assume
only 4-byte padding.

[1] https://refspecs.linuxfoundation.org/elf/gabi4+/ch5.pheader.html#note_section
[2] https://sourceware.org/bugzilla/show_bug.cgi?id=33259

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
x86's mkelf32 also isn't dealing right with .note.* sections: Due to the
different padding rules for 32- and 64-bit ELF, what is correct in
xen-syms would need adjustment in xen. Question is whether we care
enough, as long as it's only a cosmetic problem: In the shim, the Xen
note comes first, and that's the only thing that really needs looking at
from the outside, aiui. (Since we actively tail-pad .note.Xen entries,
.note.gnu-build-id ends up correctly placed anyway, despite GNU ld only
aligning it at a 4-byte boundary.)

Arguably the spec text is ambiguous as to the width of namesz, descsz,
and type: They could well be meant to be 8-byte quantities in 64-bit
ELF as per "each entry is an array of 8-byte words". Yet with everyone
using 4-byte fields, that's the defacto standard now anyway.

--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -334,14 +334,14 @@ static always_inline void stac(void)
 
 #define ELFNOTE(name, type, desc)           \
     .pushsection .note.name, "a", @note   ; \
-    .p2align 2                            ; \
+    .balign BYTES_PER_LONG                ; \
     .long 2f - 1f       /* namesz */      ; \
     .long 4f - 3f       /* descsz */      ; \
     .long type          /* type   */      ; \
 1:  .asciz #name        /* name   */      ; \
-2:  .p2align 2                            ; \
+2:  .balign BYTES_PER_LONG                ; \
 3:  desc                /* desc   */      ; \
-4:  .p2align 2                            ; \
+4:  .balign BYTES_PER_LONG                ; \
     .popsection
 
 #define ASM_CONSTANT(name, value)                \
--- a/xen/common/libelf/libelf-dominfo.c
+++ b/xen/common/libelf/libelf-dominfo.c
@@ -583,6 +583,8 @@ elf_errorstatus elf_xen_parse(struct elf
     count = elf_phdr_count(elf);
     for ( i = 0; i < count; i++ )
     {
+        unsigned orig_align = elf->note_align;
+
         phdr = elf_phdr_by_index(elf, i);
         if ( !elf_access_ok(elf, ELF_HANDLE_PTRVAL(phdr), 1) )
             /* input has an insane program header count field */
@@ -597,10 +599,15 @@ elf_errorstatus elf_xen_parse(struct elf
         if (elf_uval(elf, phdr, p_offset) == 0)
              continue;
 
+        elf->note_align = elf_uval(elf, phdr, p_align);
+
         more_notes = elf_xen_parse_notes(elf, parms,
                                  elf_segment_start(elf, phdr),
                                  elf_segment_end(elf, phdr),
                                  &total_note_count);
+
+        elf->note_align = orig_align;
+
         if ( more_notes == ELF_NOTE_INVALID )
             return -1;
 
@@ -616,6 +623,8 @@ elf_errorstatus elf_xen_parse(struct elf
         count = elf_shdr_count(elf);
         for ( i = 1; i < count; i++ )
         {
+            unsigned orig_align = elf->note_align;
+
             shdr = elf_shdr_by_index(elf, i);
             if ( !elf_access_ok(elf, ELF_HANDLE_PTRVAL(shdr), 1) )
                 /* input has an insane section header count field */
@@ -624,11 +633,15 @@ elf_errorstatus elf_xen_parse(struct elf
             if ( elf_uval(elf, shdr, sh_type) != SHT_NOTE )
                 continue;
 
+            elf->note_align = elf_uval(elf, shdr, sh_addralign);
+
             more_notes = elf_xen_parse_notes(elf, parms,
                                      elf_section_start(elf, shdr),
                                      elf_section_end(elf, shdr),
                                      &total_note_count);
 
+            elf->note_align = orig_align;
+
             if ( more_notes == ELF_NOTE_INVALID )
                 return -1;
 
--- a/xen/common/libelf/libelf-loader.c
+++ b/xen/common/libelf/libelf-loader.c
@@ -72,6 +72,9 @@ elf_errorstatus elf_init(struct elf_bina
         return -1;
     }
 
+    /* Record default note alignment, as per EI_CLASS. */
+    elf->note_align = elf_64bit(elf) ? 8 : 4;
+
     /* Find section string table. */
     section = elf_uval(elf, elf->ehdr, e_shstrndx);
     shdr = elf_shdr_by_index(elf, section);
--- a/xen/common/libelf/libelf-tools.c
+++ b/xen/common/libelf/libelf-tools.c
@@ -288,6 +288,20 @@ ELF_HANDLE_DECL(elf_sym) elf_sym_by_inde
     return sym;
 }
 
+/*
+ * Notes are special: Formally for a long time the spec has demanded that
+ * 64-bit ELF would have 8-byte padding at respective places.  However, many
+ * producers were never updated, so apply a heuristic GNU readelf also applies:
+ * Take section (or segment) alignment into consideration.  When alignment is 4
+ * or less, assume only 4-byte padding.
+ */
+static unsigned elf_note_round_up(const struct elf_binary *elf, unsigned pos)
+{
+    unsigned align = elf_32bit(elf) || elf->note_align <= 4 ? 4 : 8;
+
+    return (pos + align - 1) & ~(align - 1);
+}
+
 const char *elf_note_name(struct elf_binary *elf, ELF_HANDLE_DECL(elf_note) note)
 {
     return elf_strval(elf, ELF_HANDLE_PTRVAL(note) + elf_size(elf, note));
@@ -295,9 +309,9 @@ const char *elf_note_name(struct elf_bin
 
 elf_ptrval elf_note_desc(struct elf_binary *elf, ELF_HANDLE_DECL(elf_note) note)
 {
-    unsigned namesz = (elf_uval(elf, note, namesz) + 3) & ~3;
-
-    return ELF_HANDLE_PTRVAL(note) + elf_size(elf, note) + namesz;
+    return ELF_HANDLE_PTRVAL(note) +
+           elf_note_round_up(elf,
+                             elf_size(elf, note) + elf_uval(elf, note, namesz));
 }
 
 uint64_t elf_note_numeric(struct elf_binary *elf, ELF_HANDLE_DECL(elf_note) note)
@@ -339,11 +353,9 @@ uint64_t elf_note_numeric_array(struct e
 
 ELF_HANDLE_DECL(elf_note) elf_note_next(struct elf_binary *elf, ELF_HANDLE_DECL(elf_note) note)
 {
-    unsigned namesz = (elf_uval(elf, note, namesz) + 3) & ~3;
-    unsigned descsz = (elf_uval(elf, note, descsz) + 3) & ~3;
-
-    elf_ptrval ptrval = ELF_HANDLE_PTRVAL(note)
-        + elf_size(elf, note) + namesz + descsz;
+    elf_ptrval ptrval =
+        elf_note_desc(elf, note) +
+        elf_note_round_up(elf, elf_uval(elf, note, descsz));
 
     if ( ( ptrval <= ELF_HANDLE_PTRVAL(note) || /* wrapped or stuck */
            !elf_access_ok(elf, ELF_HANDLE_PTRVAL(note), 1) ) )
--- a/xen/include/xen/elf.h
+++ b/xen/include/xen/elf.h
@@ -29,7 +29,7 @@
 
 #include <xen/elfstructs.h>
 
-#define ELFNOTE_ALIGN(_n_) (((_n_)+3)&~3)
+#define ELFNOTE_ALIGN(_n_) ROUNDUP(_n_, BYTES_PER_LONG)
 #define ELFNOTE_NAME(_n_) ((char*)(_n_) + sizeof(*(_n_)))
 #define ELFNOTE_DESC(_n_) (ELFNOTE_NAME(_n_) + ELFNOTE_ALIGN((_n_)->namesz))
 #define ELFNOTE_NEXT(_n_) ((Elf_Note *)(ELFNOTE_DESC(_n_) + ELFNOTE_ALIGN((_n_)->descsz)))
--- a/xen/include/xen/libelf.h
+++ b/xen/include/xen/libelf.h
@@ -181,6 +181,12 @@ struct elf_binary {
     char class;
     char data;
 
+    /*
+     * Note alignment is defaulted from EI_CLASS, but overridden by
+     * segment / section alignment.
+     */
+    unsigned note_align;
+
     ELF_HANDLE_DECL(elf_ehdr) ehdr;
     elf_ptrval sec_strtab;
     ELF_HANDLE_DECL(elf_shdr) sym_tab;

