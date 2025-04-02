Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5942DA7907D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 15:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935747.1337146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzybl-0006BE-CW; Wed, 02 Apr 2025 13:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935747.1337146; Wed, 02 Apr 2025 13:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzybl-000682-9a; Wed, 02 Apr 2025 13:58:21 +0000
Received: by outflank-mailman (input) for mailman id 935747;
 Wed, 02 Apr 2025 13:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzybj-0005kV-Qk
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 13:58:19 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 879344c6-0fca-11f0-9ea9-5ba50f476ded;
 Wed, 02 Apr 2025 15:58:19 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-399749152b4so3295683f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 06:58:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb6135dc4sm21915525e9.33.2025.04.02.06.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 06:58:17 -0700 (PDT)
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
X-Inumbo-ID: 879344c6-0fca-11f0-9ea9-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743602298; x=1744207098; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P+LOVlzxlWAhiyLhRnyUc5EdBZYUf7MC1TaE2FmTLf4=;
        b=ZVZ3Iw/qtaE/AnBK3ohe8LRCktJ4RD+ZeblpFnP+oHoD12GfiqJZf9IxkUNHJDgODk
         VPBjnOS00WnLAyRtaplMkWZ/UitzVuVdLZdIfUGicMKE9w2xfhSnsx5rdpjNxDOvYHDU
         Bwafz8XzYiLucos3uP+bhNR5FEwPZMvPa/ledbccFGjAPMUTbIFJHN2dKYtjuKBJuga9
         3USC6R41Yh6tZZkKDSm5HWvwvgmmLj/z7hB0qKtbLCwmupXbJl3vHZOaEgsKy3Wiv7rD
         4L7hYqXUE7ONFXfmrf1MWQnxo/BVTAmjBODLctHocxR93Z0CLGGP+sLjsgzaD60nQrw2
         VGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602298; x=1744207098;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P+LOVlzxlWAhiyLhRnyUc5EdBZYUf7MC1TaE2FmTLf4=;
        b=r9+DxBOmiMhNmvTOY4sXR4h0tdXT3EHITBHCkJlhmZ/fxoGp1mOHdW6ZOGmIcuGZ68
         fsmBcONNljMT1/HS5XD5LURB1vbhH+L1vHhUHZ4R0dYq7ei90MV+39V89mbddDgimlSc
         7ExJ7uUzsA78iQfZPBqz7gGcuzOjSn6wRovumEfXQS5NiyWGBrdnBcUqM7wpmZUV/XcS
         ztxmSrwkrFJzrztJ5c+MJCJr+tw4tdlw735AdFvewGNUoD4GyPzw0PS70ozinTEOXy5/
         WoXt0xB9qBLs4qpxBY3vaRNXV1Usunaa7hH9rME/+jX6wM43gwOoAllW7L15T7KRb+K7
         lxOw==
X-Gm-Message-State: AOJu0YzA6rI5BIXNzc2ar+R1G94HYYxo/ueJ+9J0+GOmfmkjKqHslmOP
	2+82uguikX9PEHv8ahU5dkdIqI7TFrInJiE5SEdkL0o23MumicX4/EyGpI+K9cBTRLR0CFPsYI8
	=
X-Gm-Gg: ASbGncuPKARzE++rjr8hFD6Ol8q233VHTjXQLkMWtwB0rpAxVAksbEjMIj5FU7bENQb
	fp4nWsQNE+ao/LrNS3d2PINlX1/8P5Xudc55nRYYo+BfzO0+HqjkBnSaCwgY+Vh5ToTibAV6C6m
	OgPppieaWFZxyOa69HkRoICgy01apTT+FFvSWyactDqzeERd2gWxK5Cj/jmv3S3wgjRL0zs7X+I
	YIOmeWZfYGOKTIo3IoGYWy0EFt+I1qK5HFDqvf/1hZuwDeL/zWFijzfrlb7TkYhlnLujtXO6mit
	+VCAqc8SuDI0MQzyu0SBmKQdLgXwFZ83yOUVBXbgndrtYnk2Y0YfhvGK8CRTPr9Bq+npOA+nMtx
	KTyvSFHc+/LYIbpNh0JgNXCjese4BGwZ+ZHQQr5PI
X-Google-Smtp-Source: AGHT+IEPWM4pLIvNJKv9hvi5KcBEPkQlR1qwBmNSaJR90hRsMiKg3Eqggx0tBeXaRir6xP01k69eGw==
X-Received: by 2002:a05:6000:420c:b0:390:f902:f973 with SMTP id ffacd0b85a97d-39c23646776mr5682274f8f.8.1743602297716;
        Wed, 02 Apr 2025 06:58:17 -0700 (PDT)
Message-ID: <5015ce6d-a961-491b-9fe7-f6628329f3f0@suse.com>
Date: Wed, 2 Apr 2025 15:58:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/5] symbols: split symbols_num_syms
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

In preparation for inserting address entries into symbols_addresses[] /
symbols_offsets[] without enlarging symbols_sorted_offsets[], split
symbols_num_syms into symbols_num_addrs (counting entries in the former
plus symbols_names[] as well as, less directly, symbols_markers[]) and
symbols_num_names (counting entries in the latter).

While doing the adjustment move declarations to a new private symbols.h,
to be used by both symbols.c and symbols-dummy.c. Replace u8/u16 while
doing so.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/common/symbols.c
+++ b/xen/common/symbols.c
@@ -10,7 +10,6 @@
  *      compression (see tools/symbols.c for a more complete description)
  */
 
-#include <xen/symbols.h>
 #include <xen/kernel.h>
 #include <xen/init.h>
 #include <xen/lib.h>
@@ -21,22 +20,7 @@
 #include <xen/guest_access.h>
 #include <xen/errno.h>
 
-#ifdef SYMBOLS_ORIGIN
-extern const unsigned int symbols_offsets[];
-#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
-#else
-extern const unsigned long symbols_addresses[];
-#define symbols_address(n) symbols_addresses[n]
-#endif
-extern const unsigned int symbols_num_syms;
-extern const u8 symbols_names[];
-
-extern const struct symbol_offset symbols_sorted_offsets[];
-
-extern const u8 symbols_token_table[];
-extern const u16 symbols_token_index[];
-
-extern const unsigned int symbols_markers[];
+#include "symbols.h"
 
 /* expand a compressed symbol data into the resulting uncompressed string,
    given the offset to where the symbol is in the compressed stream */
@@ -124,7 +108,7 @@ const char *symbols_lookup(unsigned long
 
         /* do a binary search on the sorted symbols_addresses array */
     low = 0;
-    high = symbols_num_syms;
+    high = symbols_num_addrs;
 
     while (high-low > 1) {
         mid = (low + high) / 2;
@@ -141,7 +125,7 @@ const char *symbols_lookup(unsigned long
     symbols_expand_symbol(get_symbol_offset(low), namebuf);
 
     /* Search for next non-aliased symbol */
-    for (i = low + 1; i < symbols_num_syms; i++) {
+    for (i = low + 1; i < symbols_num_addrs; i++) {
         if (symbols_address(i) > symbols_address(low)) {
             symbol_end = symbols_address(i);
             break;
@@ -182,9 +166,9 @@ int xensyms_read(uint32_t *symnum, char
     static unsigned int next_symbol, next_offset;
     static DEFINE_SPINLOCK(symbols_mutex);
 
-    if ( *symnum > symbols_num_syms )
+    if ( *symnum > symbols_num_addrs )
         return -ERANGE;
-    if ( *symnum == symbols_num_syms )
+    if ( *symnum == symbols_num_addrs )
     {
         /* No more symbols */
         name[0] = '\0';
@@ -227,7 +211,7 @@ unsigned long symbols_lookup_by_name(con
 
 #ifdef CONFIG_FAST_SYMBOL_LOOKUP
     low = 0;
-    high = symbols_num_syms;
+    high = symbols_num_names;
     while ( low < high )
     {
         unsigned long mid = low + ((high - low) / 2);
--- /dev/null
+++ b/xen/common/symbols.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/stdint.h>
+#include <xen/symbols.h>
+
+#ifdef SYMBOLS_ORIGIN
+extern const unsigned int symbols_offsets[];
+#define symbols_address(n) (SYMBOLS_ORIGIN + symbols_offsets[n])
+#else
+extern const unsigned long symbols_addresses[];
+#define symbols_address(n) symbols_addresses[n]
+#endif
+extern const unsigned int symbols_num_addrs;
+extern const unsigned char symbols_names[];
+
+extern const unsigned int symbols_num_names;
+extern const struct symbol_offset symbols_sorted_offsets[];
+
+extern const uint8_t symbols_token_table[];
+extern const uint16_t symbols_token_index[];
+
+extern const unsigned int symbols_markers[];
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/common/symbols-dummy.c
+++ b/xen/common/symbols-dummy.c
@@ -3,22 +3,22 @@
  *                  link of the hypervisor image.
  */
 
-#include <xen/types.h>
-#include <xen/symbols.h>
+#include "symbols.h"
 
 #ifdef SYMBOLS_ORIGIN
 const unsigned int symbols_offsets[1];
 #else
 const unsigned long symbols_addresses[1];
 #endif
-const unsigned int symbols_num_syms;
-const u8 symbols_names[1];
+const unsigned int symbols_num_addrs;
+const unsigned char symbols_names[1];
 
 #ifdef CONFIG_FAST_SYMBOL_LOOKUP
+const unsigned int symbols_num_names;
 const struct symbol_offset symbols_sorted_offsets[1];
 #endif
 
-const u8 symbols_token_table[1];
-const u16 symbols_token_index[1];
+const uint8_t symbols_token_table[1];
+const uint16_t symbols_token_index[1];
 
 const unsigned int symbols_markers[1];
--- a/xen/tools/symbols.c
+++ b/xen/tools/symbols.c
@@ -323,7 +323,7 @@ static void write_src(void)
 	}
 	printf("\n");
 
-	output_label("symbols_num_syms");
+	output_label("symbols_num_addrs");
 	printf("\t.long\t%d\n", table_cnt);
 	printf("\n");
 
@@ -373,6 +373,10 @@ static void write_src(void)
 		return;
 	}
 
+	output_label("symbols_num_names");
+	printf("\t.long\t%d\n", table_cnt);
+	printf("\n");
+
 	/* Sorted by original symbol names and type. */
 	qsort(table, table_cnt, sizeof(*table), compare_name_orig);
 


