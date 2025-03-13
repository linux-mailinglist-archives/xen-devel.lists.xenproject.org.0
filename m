Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF62A5F732
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 15:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912293.1318596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsj9W-0001gm-UW; Thu, 13 Mar 2025 14:03:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912293.1318596; Thu, 13 Mar 2025 14:03:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsj9W-0001fI-QR; Thu, 13 Mar 2025 14:03:14 +0000
Received: by outflank-mailman (input) for mailman id 912293;
 Thu, 13 Mar 2025 14:03:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tsj1L-0005Wp-RM
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 13:54:47 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b70eb2d5-0012-11f0-9898-31a8f345e629;
 Thu, 13 Mar 2025 14:54:43 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso6115475e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 06:54:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a75b0f6sm54380865e9.22.2025.03.13.06.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Mar 2025 06:54:42 -0700 (PDT)
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
X-Inumbo-ID: b70eb2d5-0012-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741874082; x=1742478882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BLOSHq8PWlNDBpZfFh39qmol2jrCmXZN7mJgC6pp9zw=;
        b=Dc5+uRvK4O8z3z9fneMry5OuJja3ueWO/XG7YI20gmdCqtCqreUU4W3ijB20FNXte0
         XDK8NvkR5WYoMMvEA9yxSll7ROYk4ygGUR38SwtIfM/hB5Gykc/17zSaUyhxStRhcxow
         GYuPAi8YgrpDCmFxHfmvWK62h8onVflbbp/0EzFLq3+wcDB2a+L5KYR0eWEbqNFHXHGP
         MAMDvoTi5EkiYfRJG/rJtrTr/oh+QDtILVRNcin9ssBeJDwcWYPRo1NWMqLRXEWFdeZP
         QAuXa1AXess4s9153yGELdmn+22APCwxUrZs90/txoZ219v1Fetd3Tdp2cxvMhYGtU2v
         8nDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741874082; x=1742478882;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BLOSHq8PWlNDBpZfFh39qmol2jrCmXZN7mJgC6pp9zw=;
        b=jDQ7c/KKNvZGywFq/3BATd3uqu89SY7cpfOhK+4/BckuCKFLZ8UFemp4L0cEQt0Cp8
         X+WPg7JtU3LxvH7fAvmKlrV/4huVGw6PnV+MMrWYFI8abSVgXhITQPAcuYHef1wH55X8
         wL64vPEcpfy2DPJBRZrs0O6i9uY+xk6vPWhYI2hbO1cm8SuPBk5dgmiEeyfYZZ5Eu4wO
         Nr/ymyyaEcdxDsrsut1qpDQ/2UTWTEjBw8RIM+jMOsJKyBS7sbOPUKKgdZ8cCvcCHChv
         fMMyMJlg1eF4l8bG/NBgoottezrglcFpR59FGtkwCZH9d7TEYCLeaTCcPcEGaysNoqRR
         xg0w==
X-Gm-Message-State: AOJu0Yw6ry+DnTM/IQmKn9PNwjlDTRyuPxLkSz7Xw9q59abQ2oopyaJA
	UmCqs1GqSD4cQajpbsTb5kWQZ1+gdgVKjD6hq3Ae2dVYvBaGAvvYFmRxWqiJ6KgeWGwszB8CmtY
	=
X-Gm-Gg: ASbGncu2sxCc/CyVJZIVXzNbLkOOPI+rfpnglrS+Z8MFBdF7zC7Jxd6MhXr5o3tOfr/
	1jvf3HKAlj7imz/mwVcLm4SSyfBLhWbdFrWCiGchn5U4g9p/qDWuFT+I7e6aW6C0heDhiIlfvtu
	8QKnp4fiUiOK1foMX7nb1ceTTv8uwYKm5EAc3suaec7IYNgEx7Cco52IuBnQPJUlPzSTYuzifVC
	H/9eT2olKZnwvXHBi9ZUeJDOB42yelPrtahltXSfpibOHuG//Maq7Q+JdXdtHbKUNlVlU9au5fO
	MYEsZ9XGQdm8K3gluUqsrzBhFTNAuDBkxPEhRpL3+Q/t8SBRERZwswHI3gOxrPJ9CFZWmn1OsSZ
	dS+IvKzpdUbauk18GhuFjP2ef/zI6jQ==
X-Google-Smtp-Source: AGHT+IHNrxWxqUZCs1z/QJri7R24okz3X/vk5S6V8rhATJNTwR8xIQ1Guxwt4lsvdBllZ08p7oSS2g==
X-Received: by 2002:a05:600c:1c9a:b0:43c:e8ba:e166 with SMTP id 5b1f17b1804b1-43d01c1daebmr103220705e9.22.1741874082408;
        Thu, 13 Mar 2025 06:54:42 -0700 (PDT)
Message-ID: <51f2cd39-e92f-4745-8053-e51ada22d601@suse.com>
Date: Thu, 13 Mar 2025 14:54:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/6] symbols: arrange to know where functions end
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
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
In-Reply-To: <58b3d7dc-5966-432c-8def-e841feaee1c8@suse.com>
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
@@ -318,24 +334,32 @@ static void write_src(void)
 	printf("#else\n");
 	output_label("symbols_offsets");
 	printf("#endif\n");
-	for (i = 0; i < table_cnt; i++) {
+	for (i = 0, ends = 0; i < table_cnt; i++) {
 		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n", table[i].addr);
+
+		table[i].addr_idx = i + ends;
+
+		if (!want_symbol_end(i))
+			continue;
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
@@ -344,11 +368,22 @@ static void write_src(void)
 
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
 
@@ -450,7 +485,6 @@ static void compress_symbols(unsigned ch
 		len = table[i].len;
 		p1 = table[i].sym;
 
-		table[i].addr_idx = i;
 		/* find the token on the symbol */
 		p2 = memmem_pvt(p1, len, str, 2);
 		if (!p2) continue;


