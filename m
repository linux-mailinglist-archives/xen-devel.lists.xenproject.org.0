Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DC6C1FA16
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 11:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153482.1483805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQB9-0000g5-6p; Thu, 30 Oct 2025 10:46:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153482.1483805; Thu, 30 Oct 2025 10:46:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEQB9-0000dq-3W; Thu, 30 Oct 2025 10:46:51 +0000
Received: by outflank-mailman (input) for mailman id 1153482;
 Thu, 30 Oct 2025 10:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEQB7-0000dk-N0
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 10:46:49 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6d9cebf-b57d-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 11:46:39 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso614872f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 03:46:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db9d1sm30913855f8f.35.2025.10.30.03.46.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 03:46:37 -0700 (PDT)
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
X-Inumbo-ID: b6d9cebf-b57d-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761821199; x=1762425999; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIdfcQ7m+iCksx6XS4Zy/k7J2u9sMtddJCbPXsbZGMg=;
        b=OMul7DwjA4iXSgmY2Tz9GKsmw2f+pGLLB6TdGwnoWJQvSAVjfvPQChjdVVZkEMYYlc
         GTR/+kQIbzASn4+Dz2TC9uWlZ6FE2D5wi5dLXSWCAnDGTeuvURvCeTnOtg3t53A8uU/4
         5HyMPI6iIIkuMAKYZQfvQ30Tgtk3KNVJz4UQKttm2CCcrOMMKaFp29/IFIILiI41Rz98
         J0Qatb0TIwEEcPswqOVOKOoW/yGatqAl4pxXjdR+6exh1pzFQo4EDCZDtem45Xfp4h9X
         TCmkBVlv97YaRT+LkE9xK9nhTm17bDKgIVDo1uMdmR6UPwaE+ANzG+UYJhBnQ8sLwdKZ
         n4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761821199; x=1762425999;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EIdfcQ7m+iCksx6XS4Zy/k7J2u9sMtddJCbPXsbZGMg=;
        b=vn69c5hbZbRnhDx5TX0x8kfJVea3oNs/GYy1fW+Q0P4DTgoNQOvJRFG9RffAc8d+fY
         9SgoL+XqROQNLQ4314Q9aEVfTevzM8/zlo1ni9v98CZ3PibQpFB05bf1nCitlEFsQRwO
         UZgm/YivJUbRJBRU6Gn1jep2uRf0MDRjT7xMrDekIn3kGCSRr0R15lM62aBcM/UlwJkI
         q8BuspW0O3S40AKo++sfHfFqVipKsL3DBK1yCKyScaxfxVohAIgEr/aZSpOgW1JUwTM7
         fPeCdYgVWdiecCPDFiLcoCoaIqNFejl+Uo+Q9Dr+jXwmc2O0GfRzod8fNLjNeijboylX
         z8ew==
X-Gm-Message-State: AOJu0Yz8xb7+NluX2h9GvZcDylYcBzuB7Jmh5EyWwipo9UlgMtvztK7E
	ao3bSue39J8E4qhQ5RM5iT4J5YgFuhF2HIc7rEq5n3ENDGHTvEFPNHPiE3GJGq3/w6Gs/vyeoMY
	Mwng=
X-Gm-Gg: ASbGncvdcAwXxZSxNGcZ6UHndyE0zig2BwiITGZ4HWtkPOAZ+0psLd8beda9U/s+/uO
	CjklAIIbyI074dhEjWp22tDHD221ZzHX/DnnZ6/6WwD9+18AMfP+zKQ+054l4TRQ6kl3p6Y2Fhp
	gnF51Bi1wJ9sj7CyAxn9b3wBz6lHx3bLcqlISXs9jcG6sugAUwtaFhTTQKLBtdoo6D4t/80DyHn
	1G0NF/Cy4wvy1wvfT2lfv9tbL/FwqRLb9M//o2SX8xU/IF/c9ICvvLobz8WMwo/W81tEAQe4IKs
	CA+o7+riHz3pp68dH/+ewe8I3jpp974vD63LddmuR8ohekmAoJH7HwGKhkY56eURQwnALG011Jp
	shHmPtCq+Av/+7Jo80RB1OLgPzuIvIJFvyezuu4KfKrwW67UxZzZUzie4d30QmUQ0kOjCetm0XP
	ARO1uFCqZU8HJh66v33c/CXySKC79eGJxFfAdblBFPBRZzHLLsOpeLdWKHOak6Ob7K+XF9q4Y=
X-Google-Smtp-Source: AGHT+IGuRWjiz7++m6WWVCnzcpjeEmvOCfIfgPkkI+5Zi1UR9Uxv7NvfdyegqX+67terXOdN6E7qqg==
X-Received: by 2002:a05:6000:43c5:20b0:426:d619:cac7 with SMTP id ffacd0b85a97d-429b4c985aamr2225435f8f.36.1761821198614;
        Thu, 30 Oct 2025 03:46:38 -0700 (PDT)
Message-ID: <2a8bbf67-90f6-4114-9951-099ee72d6021@suse.com>
Date: Thu, 30 Oct 2025 11:46:36 +0100
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
Subject: [PATCH RFC] symbols: check table sizes don't change between linking
 passes 2 and 3
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
Content-Transfer-Encoding: 8bit

While sizes (and possibly positions) of the symbol table related symbols
(and as a result other ones) are expected to change from linking pass 1
to pass 2, no such change should happen anymore from pass 2 to pass 3, or
else the internally recorded symbol table wouldn't represent the ELF or
PE/COFF ones.

For comparing to be actually useful, i.e. most notably also covering the
last of the arrays emitted, symbol sizes need establishing. Make use of
the xen/linkage.h machinery to achieve that.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Likely other ports also want to add such checking. Really it would be nice
if we could properly abstract out shared parts of the linking steps.

RFC: Aiui this can't go in as is right now, or we would break building Xen
     with lld. Further changes are first needed to help the situation
     there.

RFC: I'm all ears towards improvement suggestions in the temporary helper
     file handling of compare-symbol-tables. Or ideally some approach to
     avoid the use of a helper file altogether.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -146,6 +146,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		> $(dot-target).1.S
 	$(MAKE) $(build)=$(@D) $(dot-target).1.o
+	$(call compare-symbol-tables, $(dot-target).0.o, $(dot-target).1.o)
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(orphan-handling-y) $(dot-target).1.o -o $@
 	$(NM) -pa --format=sysv $@ \
@@ -226,6 +227,8 @@ endif
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).1s.S
 	$(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
+	$(call compare-symbol-tables, $(dot-target).0r.o, $(dot-target).1r.o)
+	$(call compare-symbol-tables, $(dot-target).0s.o, $(dot-target).1s.o)
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
 	      $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
 	      $(note_file_option) -o $@
--- a/xen/scripts/Kbuild.include
+++ b/xen/scripts/Kbuild.include
@@ -56,6 +56,19 @@ define filechk
 	fi
 endef
 
+###
+# Compare the symbol tables of two object files.  As diff's -I option isn't
+# standardized, the name difference of the two object files needs abstracting
+# out.
+define compare-symbol-tables
+    ln -f $(1) $(@D)/.cst.$$$$; \
+    $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(1).sym; \
+    ln -f $(1) $(@D)/.cst.$$$$; \
+    $(OBJDUMP) -t $(@D)/.cst.$$$$ > $(2).sym; \
+    rm -f $(@D)/.cst.$$$$
+    diff -u $(1).sym $(2).sym
+endef
+
 # as-insn: Check whether assembler supports an instruction.
 # Usage: cflags-y += $(call as-insn,CC FLAGS,"insn",option-yes,option-no)
 as-insn = $(if $(shell echo 'void _(void) { asm volatile ( $(2) ); }' \
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -253,17 +253,26 @@ static void read_map(FILE *in)
 	}
 }
 
-static void output_label(char *label)
+static void output_label(const char *label, bool keep)
 {
-	if (symbol_prefix_char)
-		printf(".globl %c%s\n", symbol_prefix_char, label);
-	else
-		printf(".globl %s\n", label);
-	printf("\tALGN\n");
-	if (symbol_prefix_char)
-		printf("%c%s:\n", symbol_prefix_char, label);
-	else
-		printf("%s:\n", label);
+	static bool pending;
+
+	if (pending && !keep) {
+		printf("END(CURRENT)\n");
+		printf("#undef CURRENT\n\n");
+	}
+
+	pending = label;
+	if (!label)
+		return;
+
+	if (symbol_prefix_char) {
+		printf("DATA(%c%s, ALGN)\n", symbol_prefix_char, label);
+		printf("#define CURRENT %c%s\n", symbol_prefix_char, label);
+	} else {
+		printf("DATA(%s, ALGN)\n", label);
+		printf("#define CURRENT %s\n", label);
+	}
 }
 
 /* uncompress a compressed symbol. When this function is called, the best table
@@ -331,22 +340,22 @@ static void write_src(void)
 
 		return;
 	}
-	printf("#include <xen/config.h>\n");
+	printf("#include <xen/linkage.h>\n");
 	printf("#if BITS_PER_LONG == 64 && !defined(SYMBOLS_ORIGIN)\n");
 	printf("#define PTR .quad\n");
-	printf("#define ALGN .balign 8\n");
+	printf("#define ALGN 8\n");
 	printf("#else\n");
 	printf("#define PTR .long\n");
-	printf("#define ALGN .balign 4\n");
+	printf("#define ALGN 4\n");
 	printf("#endif\n");
 
 	printf("\t.section .rodata, \"a\"\n");
 
 	printf("#ifndef SYMBOLS_ORIGIN\n");
 	printf("#define SYMBOLS_ORIGIN 0\n");
-	output_label("symbols_addresses");
+	output_label("symbols_addresses", false);
 	printf("#else\n");
-	output_label("symbols_offsets");
+	output_label("symbols_offsets", true);
 	printf("#endif\n");
 	for (i = 0, ends = 0; i < table_cnt; i++) {
 		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n", table[i].addr);
@@ -370,17 +379,15 @@ static void write_src(void)
 		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n",
 		       table[i].addr + table[i].size);
 	}
-	printf("\n");
 
-	output_label("symbols_num_addrs");
+	output_label("symbols_num_addrs", false);
 	printf("\t.long\t%d\n", table_cnt + ends);
-	printf("\n");
 
 	/* table of offset markers, that give the offset in the compressed stream
 	 * every 256 symbols */
 	markers = malloc(sizeof(*markers) * ((table_cnt + ends + 255) >> 8));
 
-	output_label("symbols_names");
+	output_label("symbols_names", false);
 	for (i = 0, off = 0, ends = 0; i < table_cnt; i++) {
 		if (((i + ends) & 0xFF) == 0)
 			markers[(i + ends) >> 8] = off;
@@ -404,15 +411,12 @@ static void write_src(void)
 		printf("\t.byte 0\n");
 		++off;
 	}
-	printf("\n");
 
-	output_label("symbols_markers");
+	output_label("symbols_markers", false);
 	for (i = 0; i < ((table_cnt + ends + 255) >> 8); i++)
 		printf("\t.long\t%d\n", markers[i]);
-	printf("\n");
 
-
-	output_label("symbols_token_table");
+	output_label("symbols_token_table", false);
 	off = 0;
 	for (i = 0; i < 256; i++) {
 		best_idx[i] = off;
@@ -420,34 +424,27 @@ static void write_src(void)
 		printf("\t.asciz\t\"%s\"\n", buf);
 		off += strlen(buf) + 1;
 	}
-	printf("\n");
 
-	output_label("symbols_token_index");
+	output_label("symbols_token_index", false);
 	for (i = 0; i < 256; i++)
 		printf("\t.short\t%d\n", best_idx[i]);
-	printf("\n");
 
-	if (!sort_by_name) {
-		free(markers);
-		return;
-	}
-
-	output_label("symbols_num_names");
-	printf("\t.long\t%d\n", table_cnt);
-	printf("\n");
-
-	/* Sorted by original symbol names and type. */
-	qsort(table, table_cnt, sizeof(*table), compare_name_orig);
-
-	output_label("symbols_sorted_offsets");
-	/* A fixed sized array with two entries: offset in the
-	 * compressed stream (for symbol name), and offset in
-	 * symbols_addresses (or symbols_offset). */
-	for (i = 0; i < table_cnt; i++) {
-		printf("\t.long %u, %u\n", table[i].stream_offset, table[i].addr_idx);
+	if (sort_by_name) {
+		output_label("symbols_num_names", false);
+		printf("\t.long\t%d\n", table_cnt);
+
+		/* Sorted by original symbol names and type. */
+		qsort(table, table_cnt, sizeof(*table), compare_name_orig);
+
+		/* A fixed sized array with two entries: offset in the
+		 * compressed stream (for symbol name), and offset in
+		 * symbols_addresses (or symbols_offset). */
+		output_label("symbols_sorted_offsets", false);
+		for (i = 0; i < table_cnt; i++)
+			printf("\t.long %u, %u\n", table[i].stream_offset, table[i].addr_idx);
 	}
-	printf("\n");
 
+	output_label(NULL, false);
 	free(markers);
 }
 

