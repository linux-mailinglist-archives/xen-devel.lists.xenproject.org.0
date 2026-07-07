Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ERgcBNMQTWoMugEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 16:44:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C66871CC94
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 16:44:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=gx2EyMmx;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356293.1610930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh727-0001EG-NQ; Tue, 07 Jul 2026 14:44:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356293.1610930; Tue, 07 Jul 2026 14:44:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh727-0001Bs-Jy; Tue, 07 Jul 2026 14:44:23 +0000
Received: by outflank-mailman (input) for mailman id 1356293;
 Tue, 07 Jul 2026 14:44:22 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh726-0001Bh-8Y
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 14:44:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh725-00EAaw-AH
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 16:44:21 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d10c1-bab6-0a2a0a5309dd-0a2a450c8e28-2
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:44:21 +0200
Received: from [209.85.128.49] (helo=mail-wm1-f49.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d10c5-f399-0a2a450c0019-d1558031b9b5-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:44:21 +0200
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-493c52cde9eso42331845e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 07:44:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493e01c9faesm43411395e9.1.2026.07.07.07.44.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 07:44:20 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783435460; x=1784040260; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u3hyLhlP5/kin8s0XlLRomZ02/iENCnGZeQ9jDs63Ng=;
        b=gx2EyMmx0iS0lASa5sQF1hBDmVvXBBAu1xoRabd72VNz5OvPP/s69Xnh3PhH0GZU2k
         pN+2M6z/UTkKEWWFxUqQCtsQxDM/QCFQdnUgN6VxPhfSQSIEQpk0Z0rCvDOotBfiHV2X
         JpGxSpmhHdnSkp2k2lD5ui8Bn+HX1Gn0GA5nD5bZXigx1LTvQrJYLULzDXn08EAwFncz
         gYqEM6kzgzR5/vW2mLXew/i67ds40tdz0VwigFkMmuhy88ZSGEztkO+8mnmygyv9bjki
         Nt6DKZZOlpRDjziuLSuO+YSgZlmYoMuH/sBp4jmNetazPmedeqxy0oOuKYolBhGCRXlR
         BgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435460; x=1784040260;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3hyLhlP5/kin8s0XlLRomZ02/iENCnGZeQ9jDs63Ng=;
        b=rkgKV8VzBfn1/PTI0OV9Vx4W9MQgqv7rYAT6+f23h/76OIAUHDPzIvNkiIkGg2kdzd
         HRpOkG4GbfeM2fBz0C2cAtOGgyKw3F7cJ5+ZmPIWXo/aDxsqZvoBcAnlHPclmX2DtlZG
         zQsnOfuHPk7PaqQ9R9OS2wPk4sZVMdR0FtFzZfsA6b8Oy1rMQeEHtyjtkOWJ+30tQPbD
         gtJCIPlBUhr5K7Za4MNO32n28QHUbb9E+C2ua2a38OK/XyrkoQ6T11KPY39AXB8b+NOF
         wNse14SviiMQrSbMxl80OisMvNrgVKGCrZ+142m23mSzH52bCNFZVn3b+b2bOLrwPvNn
         bgeg==
X-Gm-Message-State: AOJu0Yx4Fa1Lavxn8TKDJlt6Jx78bMFiId3p/qFz2j5n0hj+dIAeHpbo
	XgJsdR3o5k+iSkqV53awNM3EHCKH/wEBlz6Bp5hHMfH6ifotjhbthor3yDDKz6ESNRws7Vq1VB1
	7qophRw==
X-Gm-Gg: AfdE7cmApKhzc0jGCarePy5kmLUIonpFljKFstKu5d/fDsz84eFPzXffMeCAfKw7gzH
	c0T+/M7vEjoVb/xVkfw2BjJekAxTN0T/pi4eLCD0mgzz2uAQrLs2a+t6i1npEOVkA4qEESoOsbO
	p+aUbh6a2mg20uTHkniWu7lhVIX+5K0Y148NKH9qVmt91bzXqayvkeQDZY1CFivyPQQCAnxDSt6
	UDudPgiXXLOLOCz7oU1A91l7HHhO2tuhYr+O/ec7DiTRzpw3zPC/k2/lGnncrIgjRC0BFdxYIjT
	zJC8yc3OPbBZM9+D9dPI+OO4qp3Kk/JEADuwtqUwo2Rf6zRQnG5NArMud0chcEuvG1YHEbAP63R
	Eux01HHap3wbV/Ia3kUmyu/xesTgFbnbLiOoTk1SxXCLgkZ7dph9OKB/fhnBvZDzgFpqWwOtwzm
	tl4g6B4kp5STs1ZocTnkxsM9A3jl1clwKyZG71utq+bMSiuONR9lbea3AZZxPjdqMEjMu/zHXNM
	zUb
X-Received: by 2002:a05:600c:154d:b0:493:b8d9:f28b with SMTP id 5b1f17b1804b1-493df09313bmr68573075e9.23.1783435460526;
        Tue, 07 Jul 2026 07:44:20 -0700 (PDT)
Message-ID: <28550fc7-eb6d-4d4b-ad6e-077dceb2a4f8@suse.com>
Date: Tue, 7 Jul 2026 16:44:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/3] ELF: correct .note.* alignment handling
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <7a495793-53b1-4681-9c74-fa7e901ccf59@suse.com>
Content-Language: en-US
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
In-Reply-To: <7a495793-53b1-4681-9c74-fa7e901ccf59@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-d25034/1783435461-93B35D51-1BE06C69/0/0
X-purgate-type: clean
X-purgate-size: 7337
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:julien@xen.org,m:sstabellini@kernel.org,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:url,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C66871CC94

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
Arguably the spec text is ambiguous as to the width of namesz, descsz,
and type: They could well be meant to be 8-byte quantities in 64-bit
ELF as per "each entry is an array of 8-byte words". Yet with everyone
using 4-byte fields, that's the de-facto standard now anyway.

--- a/xen/arch/x86/include/asm/asm_defns.h
+++ b/xen/arch/x86/include/asm/asm_defns.h
@@ -398,14 +398,14 @@ static always_inline void stac(void)
 
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


