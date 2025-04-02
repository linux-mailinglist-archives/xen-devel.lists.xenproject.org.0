Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7811BA79090
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:01:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935777.1337166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyeV-0000cr-3r; Wed, 02 Apr 2025 14:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935777.1337166; Wed, 02 Apr 2025 14:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzyeV-0000Zk-0G; Wed, 02 Apr 2025 14:01:11 +0000
Received: by outflank-mailman (input) for mailman id 935777;
 Wed, 02 Apr 2025 14:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzyc1-0005kV-IU
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 13:58:37 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92a3c56e-0fca-11f0-9ea9-5ba50f476ded;
 Wed, 02 Apr 2025 15:58:36 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39ac8e7688aso5226141f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 06:58:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb61b5768sm21420665e9.33.2025.04.02.06.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 06:58:35 -0700 (PDT)
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
X-Inumbo-ID: 92a3c56e-0fca-11f0-9ea9-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743602316; x=1744207116; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e3lgQoWVEwKIU2psKovovYbn8xTJJbRXjtvyqx11OTY=;
        b=fIPdtene7QMz/+a1gdxCVElRmr6rJ358OYdtOgu6RqMpV0PfplwsVslKES9RjQt0v9
         Gt6hCmg17nTtn5/Cc7qWO2ODt85T3zP/MihFEdUc2fOA7YnwYxB5RIDKRP3Nn2wW2G0y
         TC2deztkOIfxvnZQDzsD4VUYM/b3RyT5TzfNa1FtxqO7hWqw8C+930duCQxT2tZcG4sC
         RJrflkjljndEcxS90DiV0BSpM6m3sNL+ZFblsGdgG9I6dCmnj4RgilvF9NUM1TFEsy+2
         WQ77zwZsoqwHm/I0IbRc1flrxDi4tUIAWK/2CBdglhCZuwU/pBYfr81hlAdu/LlzkZq4
         vL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602316; x=1744207116;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e3lgQoWVEwKIU2psKovovYbn8xTJJbRXjtvyqx11OTY=;
        b=EjUA5wyozFLNo0KxCQpavQcAltlAsBskEhjtydDlnAZn7d6ZAT8Zfb84iiwhutlCh9
         s5aNrC+5qYQAqDRpLcGYt0seJQL5oyg1+kKi8x8hDg+qj08JfqsFumjPkChbgISRPkAU
         kbQr4xQbxPLz+cExWW2LBPyDbJlz1kzG7ZBAz6uQRR9kelCsp9C/v9bq4CplXasJZXHT
         HCkL27NC3ldeFVYeLXZLXyH6EKLK8zlA1xHYUpN6Hz5gLRFVo/efSUVoVQnYO9JTWomg
         upCe4mhmaryZoSI2x45VOeBfKMSw45ZP0tx9itY1oAYXYNuGzukbK5DM+MIq6+t7kRnc
         v5Kg==
X-Gm-Message-State: AOJu0YzxjW5vexGIPPq3ROnPNIWQDytWR7coXhDpR0PZCeBGz6l1SMV0
	QwxYxEqCRzTTpp3TXXne/BFUiMjF1MJ2H7BNW6aRaq8IRllH5TOEXQXQYrSp4eC6UZ3hvFcG0HU
	=
X-Gm-Gg: ASbGncs2Dn8M4AVTsGcoxvAiijdCtlxGrg0YJdHx4ZAhlOMtk54mB/sS0pNanApc3xb
	/+TKZGkq4rmZM4CKsMNoG/fTfSwwOrEMFBrjmvV2fDT2rArzaNUKdCGsspYiBpAODxOGBuToKQK
	dJXiJ1H0fSkNWZfw0jeirWkIyiIqa78V0O0jP8fkfgnONHZt1POybUQ9RU6lZt5MGsB/Ke1L7gd
	2e5GcdjBeZXgselKWGqdIYon0Q/ScbVRV+ZBbOXQgop8LlVhvO2NaQOe4JdSPxI/ACgfDBVMfMU
	/Jb1hXXqpaPV4RiE0tC7g4W49xNrLxZxuUNedA3tK5N6/TR8r258QHeOkcXR9nXpNv0T9vJLUtP
	rBumGR3AVZpbdaFErL6zOjcTB6AVEtg==
X-Google-Smtp-Source: AGHT+IGLmQhSCBY0UpP7m+2d+nwr4FWstvnmSxxJqz7JNHuoO6b7H2PAgbj4gvMi0VJF8W5LpG/fkA==
X-Received: by 2002:a05:6000:40dd:b0:391:231b:8e0d with SMTP id ffacd0b85a97d-39c297e5c6dmr2109644f8f.39.1743602316126;
        Wed, 02 Apr 2025 06:58:36 -0700 (PDT)
Message-ID: <10e116c5-5a62-4abc-a52a-e2ca12118cfe@suse.com>
Date: Wed, 2 Apr 2025 15:58:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/5] symbols: arrange to know where functions end
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
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
In-Reply-To: <ceef1876-8759-465c-9a74-309b6b92f773@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

When determining the symbol for a given address (e.g. for the %pS
logging format specifier), so far the size of a symbol (function) was
assumed to be everything until the next symbol. There may be gaps
though, which would better be recognizable in output (often suggesting
something odd is going on).

Insert "fake" end symbols in the address table, accompanied by zero-
length type/name entries (to keep lookup reasonably close to how it
was).

Note however that this, with present GNU binutils, won't work for
xen.efi: The linker loses function sizes (they're not part of a normal
symbol table entry), and hence nm has no way of reporting them.

The address table growth is quite significant on x86 release builds (due
to functions being aligned to 16-byte boundaries), though: Its size
almost doubles.

Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Note: Style-wise this is a horrible mix. I'm trying to match styles with
      what's used in the respective functions.

Older GNU ld retains section symbols, which nm then also lists. Should
we perhaps strip those as we read in nm's output? They don't provide any
useful extra information, as our linker scripts add section start
symbols anyway. (For the purposes here, luckily such section symbols are
at least emitted without size.)

Even for section start symbols there is the question of whether they
really need retaining (except perhaps when producing a map file). The
main question here likely is whether livepatch may have a need to look
them up by name. (Section end symbols may actually be slightly more
useful to keep, but that may also want considering more closely.)
---
v2: Deal with multiple symbols at the same address, but only some having
    a size specified.

--- a/xen/common/symbols.c
+++ b/xen/common/symbols.c
@@ -116,6 +116,13 @@ const char *symbols_lookup(unsigned long
         else high = mid;
     }
 
+    /* If we hit an END symbol, move to the previous (real) one. */
+    if (!symbols_names[get_symbol_offset(low)]) {
+        ASSERT(low);
+        symbol_end = symbols_address(low);
+        --low;
+    }
+
     /* search for the first aliased symbol. Aliased symbols are
            symbols with the same address */
     while (low && symbols_address(low - 1) == symbols_address(low))
@@ -124,11 +131,13 @@ const char *symbols_lookup(unsigned long
         /* Grab name */
     symbols_expand_symbol(get_symbol_offset(low), namebuf);
 
-    /* Search for next non-aliased symbol */
-    for (i = low + 1; i < symbols_num_addrs; i++) {
-        if (symbols_address(i) > symbols_address(low)) {
-            symbol_end = symbols_address(i);
-            break;
+    if (!symbol_end) {
+        /* Search for next non-aliased symbol */
+        for (i = low + 1; i < symbols_num_addrs; i++) {
+            if (symbols_address(i) > symbols_address(low)) {
+                symbol_end = symbols_address(i);
+                break;
+            }
         }
     }
 
@@ -170,6 +179,7 @@ int xensyms_read(uint32_t *symnum, char
         return -ERANGE;
     if ( *symnum == symbols_num_addrs )
     {
+    no_symbol:
         /* No more symbols */
         name[0] = '\0';
         return 0;
@@ -183,10 +193,31 @@ int xensyms_read(uint32_t *symnum, char
         /* Non-sequential access */
         next_offset = get_symbol_offset(*symnum);
 
+    /*
+     * If we're at an END symbol, skip to the next (real) one. This can
+     * happen if the caller ignores the *symnum output from an earlier
+     * iteration (Linux'es /proc/xen/xensyms handling does as of 6.14-rc).
+     */
+    if ( !symbols_names[next_offset] )
+    {
+        ++next_offset;
+        if ( ++*symnum == symbols_num_addrs )
+            goto no_symbol;
+    }
+
     *type = symbols_get_symbol_type(next_offset);
     next_offset = symbols_expand_symbol(next_offset, name);
     *address = symbols_address(*symnum);
 
+    /* If next one is an END symbol, skip it. */
+    if ( !symbols_names[next_offset] )
+    {
+        ++next_offset;
+        /* Make sure not to increment past symbols_num_addrs below. */
+        if ( *symnum + 1 < symbols_num_addrs )
+            ++*symnum;
+    }
+
     next_symbol = ++*symnum;
 
     spin_unlock(&symbols_mutex);
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -38,6 +38,7 @@
 
 struct sym_entry {
 	unsigned long long addr;
+	unsigned long size;
 	unsigned int len;
 	unsigned char *sym;
 	char *orig_symbol;
@@ -87,6 +88,8 @@ static int read_symbol(FILE *in, struct
 	static char *filename;
 	int rc = -1;
 
+	s->size = 0;
+
 	switch (input_format) {
 	case fmt_bsd:
 		rc = fscanf(in, "%llx %c %499s\n", &s->addr, &stype, str);
@@ -96,8 +99,12 @@ static int read_symbol(FILE *in, struct
 			/* nothing */;
 		rc = fscanf(in, "%499[^ |] |%llx | %c |",
 			    str, &s->addr, &stype);
-		if (rc == 3 && fscanf(in, " %19[^ |] |", type) != 1)
-			*type = '\0';
+		if (rc == 3) {
+			if(fscanf(in, " %19[^ |] |", type) != 1)
+				*type = '\0';
+			else if(fscanf(in, "%lx |", &s->size) != 1)
+				s->size = 0;
+		}
 		break;
 	}
 	if (rc != 3) {
@@ -287,9 +294,18 @@ static int compare_name_orig(const void
 	return rc;
 }
 
+/* Determine whether the symbol at address table @idx wants a fake END
+ * symbol (address only) emitted as well. */
+static bool want_symbol_end(unsigned int idx)
+{
+	return table[idx].size &&
+	       (idx + 1 == table_cnt ||
+	        table[idx].addr + table[idx].size < table[idx + 1].addr);
+}
+
 static void write_src(void)
 {
-	unsigned int i, k, off;
+	unsigned int i, k, off, ends;
 	unsigned int best_idx[256];
 	unsigned int *markers;
 	char buf[KSYM_NAME_LEN+1];
@@ -318,24 +334,42 @@ static void write_src(void)
 	printf("#else\n");
 	output_label("symbols_offsets");
 	printf("#endif\n");
-	for (i = 0; i < table_cnt; i++) {
+	for (i = 0, ends = 0; i < table_cnt; i++) {
 		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n", table[i].addr);
+
+		table[i].addr_idx = i + ends;
+
+		if (!want_symbol_end(i)) {
+			/* If there's another symbol at the same address,
+			 * propagate this symbol's size if the next one has
+			 * no size, or if the next one's size is larger. */
+			if (table[i].size &&
+			    i + 1 < table_cnt &&
+			    table[i + 1].addr == table[i].addr &&
+			    (!table[i + 1].size ||
+			     table[i + 1].size > table[i].size))
+				table[i + 1].size = table[i].size;
+			continue;
+		}
+
+		++ends;
+		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n",
+		       table[i].addr + table[i].size);
 	}
 	printf("\n");
 
 	output_label("symbols_num_addrs");
-	printf("\t.long\t%d\n", table_cnt);
+	printf("\t.long\t%d\n", table_cnt + ends);
 	printf("\n");
 
 	/* table of offset markers, that give the offset in the compressed stream
 	 * every 256 symbols */
-	markers = (unsigned int *) malloc(sizeof(unsigned int) * ((table_cnt + 255) / 256));
+	markers = malloc(sizeof(*markers) * ((table_cnt + ends + 255) >> 8));
 
 	output_label("symbols_names");
-	off = 0;
-	for (i = 0; i < table_cnt; i++) {
-		if ((i & 0xFF) == 0)
-			markers[i >> 8] = off;
+	for (i = 0, off = 0, ends = 0; i < table_cnt; i++) {
+		if (((i + ends) & 0xFF) == 0)
+			markers[(i + ends) >> 8] = off;
 
 		printf("\t.byte 0x%02x", table[i].len);
 		for (k = 0; k < table[i].len; k++)
@@ -344,11 +378,22 @@ static void write_src(void)
 
 		table[i].stream_offset = off;
 		off += table[i].len + 1;
+
+		if (!want_symbol_end(i))
+			continue;
+
+		/* END symbols have no name or type. */
+		++ends;
+		if (((i + ends) & 0xFF) == 0)
+			markers[(i + ends) >> 8] = off;
+
+		printf("\t.byte 0\n");
+		++off;
 	}
 	printf("\n");
 
 	output_label("symbols_markers");
-	for (i = 0; i < ((table_cnt + 255) >> 8); i++)
+	for (i = 0; i < ((table_cnt + ends + 255) >> 8); i++)
 		printf("\t.long\t%d\n", markers[i]);
 	printf("\n");
 
@@ -450,7 +495,6 @@ static void compress_symbols(unsigned ch
 		len = table[i].len;
 		p1 = table[i].sym;
 
-		table[i].addr_idx = i;
 		/* find the token on the symbol */
 		p2 = memmem_pvt(p1, len, str, 2);
 		if (!p2) continue;


