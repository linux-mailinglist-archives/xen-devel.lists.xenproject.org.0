Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D0FC8A16D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:48:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172767.1497874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFsQ-00082h-7K; Wed, 26 Nov 2025 13:48:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172767.1497874; Wed, 26 Nov 2025 13:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFsQ-0007zP-4B; Wed, 26 Nov 2025 13:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1172767;
 Wed, 26 Nov 2025 13:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOFsO-0007ZM-Gv
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:48:08 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8954f915-cace-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 14:48:06 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4775ae77516so63925265e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:48:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4790add608bsm46146195e9.5.2025.11.26.05.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 05:48:02 -0800 (PST)
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
X-Inumbo-ID: 8954f915-cace-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764164886; x=1764769686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZCrdi2DAluY4swzCa3OQQ3mZ4Vkg5kcV6zdhumUbXNA=;
        b=fK8IvvUfz85QnNxmo+g/g8I3bZlCe/NVwmGn6xmyIGcbZMc0OdOs/Fwpl3sQaY/0uz
         GTAo2xJAyvocRWOCbzLW9Y0zfHM7ydUnuXJAKB6oWhblbNzwr6WuRZz7t4MN47QgN0fl
         ES3xcY1VC8Q0FMXGzDmLlbrFvyRPrYrIO5/wrnMd9MwTlSZIYXxUcXw6Wq5v8cqey5sC
         BP44vPIEDyEPdtHC8cefqX1+DMqG4r70TBga6/xTNeoaRR1m4rjgw4uXdobvILgTe2wg
         w4w2zbWs2BKLuDDAs3AvTBuawwE9fMFTbw2qlWJseU5hsICXTllZtgSrIQJaeC6WOpOV
         gMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764164886; x=1764769686;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCrdi2DAluY4swzCa3OQQ3mZ4Vkg5kcV6zdhumUbXNA=;
        b=oEwV7M1V8UqdHy/WZq1keZcw1imK4FG/J5z0+hZjrr/kqdzGaHLQe2PqT4NZ4mwQpt
         C/yE8Yw8LZBAqlnud+gXuEMoM8UgJneHkG5eyufi01y1TqE1ppd84+IWAFMxgZTglIQz
         g9JENX3PQNZv21lTGC5oWzoit06kBqgb6K06KEtwO62ftqrH4wRT4z6TrTVt9hexejXF
         Dn7QCHzFtbYp1HBxXiSTzCcg8sGKot9hhyC5tEq4V7QcNxnVqjNLNO7gwfMhPhILmsKw
         kRg7n0dqEb38ExomiwclKMDdxo8Fc4VXGxdROAucCwq06UcVR2CftkyUNpPSgh1Rwt7V
         yaJg==
X-Gm-Message-State: AOJu0Yxc4SFQ+rfcteLPIhwJXjnXiGSUR6+jML4NqeXBJbzm1RkDe7SE
	3hUF9TjA8cynEIHv0wuzKJjVbr0YnaAmOe5kFeCmHU1W96XbpQRio5+HqZr+erVF7u+ISeNBeR/
	f5Os=
X-Gm-Gg: ASbGnctfUP7g7Lu4zQM0uECEzAfLiZrqnDsn0tHSMVXgXUjZoUoOCtg/pUKR2CF6bPN
	KORzsXtiwo7KcQTqjuKyhZ+FzWWrwnvhCOQtlWTSDDpnFEGoP+StKUzZlMKTZyRGQqfgSiZitUu
	AeaWdH7ViK4PufCwc5I5edWgsdIeVkhADT+ugKtdqjZ1Ng/L0kxWUCAO3CTnFALyDyJuAlGtarN
	juKj8Nj2V3SAhxmMG8ZBYRlXqIm5xxZsIL64MZZy1Mn8UDCBJQX/GKa4qIY/9OAZKlSHJ3cHXWZ
	kzwnu2RfJAGMM0uA9NvN13iZdiXbCKoNGvL4qxme/Sm+hPKecsSUDhtP/SwPN6xHNa2Q3fswO6e
	/u9giCLUwrbfzbEl3IY7QLlCV5O9D098/rxJv2//xykjKaniDFg4iIKrhUzstTqFAvURWDls8NG
	6iJEniPd2b9W/ub4CZrbdCcmrP2gSKPM1VGgsI77vuvgpJelRnA3tq+U9CRXdapMmmk9cdysR8M
	wv4sPYNdz/QAA==
X-Google-Smtp-Source: AGHT+IHmuOxOGyHnJ07PvjW0cQL8GhaOMCVBdFkSlRd+32xHflY64Y81Dy4rOdqFmqRQMbFBIV6S4w==
X-Received: by 2002:a05:600c:3592:b0:477:9b35:3e36 with SMTP id 5b1f17b1804b1-477c10c873amr217435685e9.2.1764164882996;
        Wed, 26 Nov 2025 05:48:02 -0800 (PST)
Message-ID: <94f993b2-93f4-43a5-a502-da53b810b201@suse.com>
Date: Wed, 26 Nov 2025 14:48:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v1' 8/8] symbols: check table sizes don't change between
 linking passes 2 and 3
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
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
In-Reply-To: <bd689f02-3e6b-4d15-aa1d-d757a9ee54a8@suse.com>
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

RFC: I'm all ears towards improvement suggestions in the temporary helper
     file handling of compare-symbol-tables. Or ideally some approach to
     avoid the use of a helper file altogether.
---
v1': Re-base over the re-numbering of intermediate files. Integrate into
     series.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -148,6 +148,7 @@ $(TARGET)-syms: $(objtree)/prelink.o $(o
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort $(syms-warn-dup-y) \
 		> $(dot-target).2.S
 	$(MAKE) $(build)=$(@D) $(dot-target).2.o
+	$(call compare-symbol-tables, $(dot-target).1.o, $(dot-target).2.o)
 	$(LD) $(XEN_LDFLAGS) -T $(obj)/xen.lds $< $(build_id_linker) \
 	    $(orphan-handling-y) $(dot-target).2.o -o $@
 	$(NM) -pa --format=sysv $@ \
@@ -230,6 +231,8 @@ endif
 		| $(objtree)/tools/symbols $(all_symbols) --sysv --sort \
 		> $(dot-target).2s.S
 	$(MAKE) $(build)=$(@D) .$(@F).2r.o .$(@F).2s.o
+	$(call compare-symbol-tables, $(dot-target).1r.o, $(dot-target).2r.o)
+	$(call compare-symbol-tables, $(dot-target).1s.o, $(dot-target).2s.o)
 	$(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
 	      $(dot-target).2r.o $(dot-target).2s.o $(orphan-handling-y) \
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
@@ -252,17 +252,26 @@ static void read_map(FILE *in)
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
 


