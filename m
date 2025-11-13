Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D21C570C6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 11:59:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160958.1488993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJV2e-00043Y-DB; Thu, 13 Nov 2025 10:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160958.1488993; Thu, 13 Nov 2025 10:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJV2e-00041t-9W; Thu, 13 Nov 2025 10:59:04 +0000
Received: by outflank-mailman (input) for mailman id 1160958;
 Thu, 13 Nov 2025 10:59:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJV2d-00041n-F7
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 10:59:03 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd840d88-c07f-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 11:58:52 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-b7277324204so85797966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 02:58:52 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fdaf6dasm138748666b.63.2025.11.13.02.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 02:58:51 -0800 (PST)
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
X-Inumbo-ID: bd840d88-c07f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763031532; x=1763636332; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGxBTIU10Y/v1zy5kRtoc14zm7cERi9DxeHKAfNyZsM=;
        b=E9MfgM23VCNJwJajYViaTFlpDqD/5KN+qYSQ5zuDTGjQMIJw6w/A2ZyKtkyZ02aFAA
         myefvF45VRJhysF3G8rpMZftk0DOIswPuDeuzi/r2m3vw/5F1dYV3QKBDVgBFH+jmJCI
         GzaqAF8GSiK0OIstId0lgdk4zHxk9lpvy9f/N5NG5b8dtGEo0WPzMxO/RtZxalIIL2PP
         3x1XHWqwMWM6iOZOTkoPU8fqaZBxOtM6mhmeAG7OA0uwB4+bEzOPOh0uqI9krDQQCMk5
         ce05+ffMgq6eeqgFHlM9cJXGvDAOLhpcwPX/aO/w1dKYsZ2KI6UFOVto2lFMTiCf3wUQ
         6ZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763031532; x=1763636332;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGxBTIU10Y/v1zy5kRtoc14zm7cERi9DxeHKAfNyZsM=;
        b=NsiYpmEaN9evZafu/eWbUgKRrIfQs138wB5MTPTR5q4Aq9kiTCoua8sDn3yLcP+ncF
         qbwAnTcbE3kd28dljPxxBHqgS3JQCQDJwhlSHqJ3kVKyOl8/5ffxRlhBqHlekcUD4Hwy
         9YjGml8eLiSVWeFrdnGDRWkipWChdP2OTqXrDpG3xHMzjB/ns77Aa5UnxfA+J+V5VnDp
         rmJab8+4QDmPIXIyQJ7lXadE86N3H01FIyF23Dizr8aUz9VZ9q7GHLp6nLMl/OyFurBs
         dbGdB7cXzilnvvvmV9GK5BypqvX1KxgldaBpJ7nnjg3Ok+DuB/fkIaS9alFb9V7OgSrF
         eQ/Q==
X-Gm-Message-State: AOJu0YyZsinKghiYOUzg9B8xKFuy+hfPnWW09hcio04N7pikrPxTbQ1P
	x3LKQBd9YEhQhF4WVCff9Z8+pfDC+fAOXx9jvyBpwPrgaYuScmER99HcgJ5D3fanbMWpISOx+Qy
	jkuc=
X-Gm-Gg: ASbGnctgnJp/RJZxBJ5IveeoEcX1oappz2YdkFGQe0H5B0VSSGex5MBXiVsDmot0XKM
	jRp8tkXyC4H34gecEIMDeUDu1KPuOa9sNV9kkBtYeODGS+VWViwnIuqG1UvWLAsxsDuwVUYfNEP
	aEyEy/PPRvdK7u6WpNjycuQfJ2miL0yN3+Zo107r/yhPJZIzqMnK0zoGhbPRuba9ZEY3hvDAylx
	PJCwVsqi/6Vt0kM9REH6w6jqCzNMVG91IXoKPuRh6reytoatJnDozln2ggPRtkjd0tjt6Vk8RHK
	cztLEIX/0yWIO5p56JsIQ0SRdD2mv4ZlPt1KiOm5gxJ4UbpVydKYDPd35O3r8lTNNJcfUpi/cQh
	SahXU8/g5xnnrxGlIIXG81b2It8ZPG5k8CejXYJgi1QZzRO7xJXa8TKSB3s0JwkEq1KUH86nVJU
	9rta0NYUEXDseQ4eD+A/pWihzOtXPTKIX2Iqog6SVV6T/bcSMNOMdksn1ePd0DYQF3
X-Google-Smtp-Source: AGHT+IGNSi9EfQWVr+QcWe2PZLCDNYCyAdY9Arukhjy3Jxv9LEg+T4zsVGiibXpzQU+qJT6q52s/AA==
X-Received: by 2002:a17:907:3e9e:b0:b70:df0d:e2f1 with SMTP id a640c23a62f3a-b73319b2c68mr559087266b.28.1763031531576;
        Thu, 13 Nov 2025 02:58:51 -0800 (PST)
Message-ID: <e220ea61-5483-4a91-a8b5-ac8fa387d9ab@suse.com>
Date: Thu, 13 Nov 2025 11:58:49 +0100
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
Subject: [PATCH] symbols: don't over-align data
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

Arrays of .byte or .short don't really need aligning better than 1 or 2
bytes respectively. Arrays of .long also don't need aligning to 8 bytes
(which would have happened when BITS_PER_LONG is 64 and SYMBOLS_ORIGIN is
not defined).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Strictly speaking, however, we may have been under-aligning the arrays for
x86-64: The psABI mandates
"An array uses the same alignment as its elements, except that a local or
 global array variable of length at least 16 bytes or a C99 variable-
 length array variable always has alignment of at least 16 bytes."
I don't think the compiler can leverage that though, as long as we declare
the arrays as incomplete ones (without dimension). Note the subtlety
though: C99 distinguishes [] and [*] (only the latter being "variable
length"), while the psABI may not mean to limit its constraint to the
latter form.

This, contextually (not functionally), goes on top of "symbols: check
table sizes don't change between linking passes 2 and 3"

--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -252,7 +252,7 @@ static void read_map(FILE *in)
 	}
 }
 
-static void output_label(const char *label, bool keep)
+static void output_label(const char *label, const char *align, bool keep)
 {
 	static bool pending;
 
@@ -266,10 +266,10 @@ static void output_label(const char *lab
 		return;
 
 	if (symbol_prefix_char) {
-		printf("DATA(%c%s, ALGN)\n", symbol_prefix_char, label);
+		printf("DATA(%c%s, %s)\n", symbol_prefix_char, label, align);
 		printf("#define CURRENT %c%s\n", symbol_prefix_char, label);
 	} else {
-		printf("DATA(%s, ALGN)\n", label);
+		printf("DATA(%s, %s)\n", label, align);
 		printf("#define CURRENT %s\n", label);
 	}
 }
@@ -353,9 +353,9 @@ static void write_src(void)
 
 	printf("#ifndef SYMBOLS_ORIGIN\n");
 	printf("#define SYMBOLS_ORIGIN 0\n");
-	output_label("symbols_addresses", false);
+	output_label("symbols_addresses", "ALGN", false);
 	printf("#else\n");
-	output_label("symbols_offsets", true);
+	output_label("symbols_offsets", "ALGN", true);
 	printf("#endif\n");
 	for (i = 0, ends = 0; i < table_cnt; i++) {
 		printf("\tPTR\t%#llx - SYMBOLS_ORIGIN\n", table[i].addr);
@@ -380,14 +380,14 @@ static void write_src(void)
 		       table[i].addr + table[i].size);
 	}
 
-	output_label("symbols_num_addrs", false);
+	output_label("symbols_num_addrs", "4", false);
 	printf("\t.long\t%d\n", table_cnt + ends);
 
 	/* table of offset markers, that give the offset in the compressed stream
 	 * every 256 symbols */
 	markers = malloc(sizeof(*markers) * ((table_cnt + ends + 255) >> 8));
 
-	output_label("symbols_names", false);
+	output_label("symbols_names", "1", false);
 	for (i = 0, off = 0, ends = 0; i < table_cnt; i++) {
 		if (((i + ends) & 0xFF) == 0)
 			markers[(i + ends) >> 8] = off;
@@ -412,11 +412,11 @@ static void write_src(void)
 		++off;
 	}
 
-	output_label("symbols_markers", false);
+	output_label("symbols_markers", "4", false);
 	for (i = 0; i < ((table_cnt + ends + 255) >> 8); i++)
 		printf("\t.long\t%d\n", markers[i]);
 
-	output_label("symbols_token_table", false);
+	output_label("symbols_token_table", "1", false);
 	off = 0;
 	for (i = 0; i < 256; i++) {
 		best_idx[i] = off;
@@ -425,12 +425,12 @@ static void write_src(void)
 		off += strlen(buf) + 1;
 	}
 
-	output_label("symbols_token_index", false);
+	output_label("symbols_token_index", "2", false);
 	for (i = 0; i < 256; i++)
 		printf("\t.short\t%d\n", best_idx[i]);
 
 	if (sort_by_name) {
-		output_label("symbols_num_names", false);
+		output_label("symbols_num_names", "4", false);
 		printf("\t.long\t%d\n", table_cnt);
 
 		/* Sorted by original symbol names and type. */
@@ -439,12 +439,12 @@ static void write_src(void)
 		/* A fixed sized array with two entries: offset in the
 		 * compressed stream (for symbol name), and offset in
 		 * symbols_addresses (or symbols_offset). */
-		output_label("symbols_sorted_offsets", false);
+		output_label("symbols_sorted_offsets", "4", false);
 		for (i = 0; i < table_cnt; i++)
 			printf("\t.long %u, %u\n", table[i].stream_offset, table[i].addr_idx);
 	}
 
-	output_label(NULL, false);
+	output_label(NULL, NULL, false);
 	free(markers);
 }
 

