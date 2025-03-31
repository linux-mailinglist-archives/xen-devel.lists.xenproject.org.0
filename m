Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F064A767CD
	for <lists+xen-devel@lfdr.de>; Mon, 31 Mar 2025 16:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.932604.1334710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzG5k-000186-B0; Mon, 31 Mar 2025 14:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 932604.1334710; Mon, 31 Mar 2025 14:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzG5k-00015h-7u; Mon, 31 Mar 2025 14:26:20 +0000
Received: by outflank-mailman (input) for mailman id 932604;
 Mon, 31 Mar 2025 14:26:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AhU9=WS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzG5i-00015Y-0m
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 14:26:18 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13cc87b1-0e3c-11f0-9ffb-bf95429c2676;
 Mon, 31 Mar 2025 16:26:04 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43ea40a6e98so4208235e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 31 Mar 2025 07:26:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d8fba3b13sm127754825e9.3.2025.03.31.07.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Mar 2025 07:26:03 -0700 (PDT)
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
X-Inumbo-ID: 13cc87b1-0e3c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743431164; x=1744035964; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xoZscG+ML7hjpeKtb+hASzDuPGFgYqTnd4rWapiJ2V0=;
        b=Ut7yOvP+gwMhxvIwiRpZn/64fWcGpQBWmoa0fNO18lzzm80enMepWIykT598UbqAb4
         JJBGX1hjy9vbfcFWPK+yK8f5EEG964O04MwJTXccHgHPIe6pp1q1YA2hG3fycd89AqNx
         YZSzABkCBU5j92C+y+vqDmENNq0rgLGZY3X3RiQKvN279m6OUZGPGlCRVbJ3uoMVlYng
         I00XKQuVVsnk6K6sE3DNVkZumTtOY77y+v3H+1x8q66QYwRqfz0JgeQZpcVHtoDMAUkv
         B9aUiTkFCMPE18BXFFk9nPDYvekmdxm4dI7jB1x70eetwORSearS4QHWlIVc0HdctNG1
         8cfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743431164; x=1744035964;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xoZscG+ML7hjpeKtb+hASzDuPGFgYqTnd4rWapiJ2V0=;
        b=X1315/eyOHXsBRR+LUkogDzPmUorzsBgtYQ8x8AHPt+Ff4RaOwN+TFxO/DLJ3tgHoa
         OR9fJAqB3bn8KzTPmwW/4bWZE3v6sDsBFkmk6aAPbrZUCzaAW6Zcq8iTn2R2YQIlh/G8
         V9EEfzl4hNgOK+c+uXj7cQwq5B/3NckAhVg1hS9TioCjD8LwqIUARL6yu5mLtfSQcUWs
         h6QpYj0Bh1vk2Ji4x5L0nopC1vja8CxFn9diQ25EZs20zyOoNDa/MF8dhfHnLZxRq9aF
         RyX/0p5v/yM0u67BNnEUuu0Kqfx0w/ihHZKQc5hJjD/Vq6MyIUhmt7purvAYZWjcjVGW
         9wRg==
X-Gm-Message-State: AOJu0Yxrmhf5q0q+jwkOGvqprNfFW8p7rm9rGuAlsZfLBFqI/nFqb39K
	c30BPJlctqW8mzeJQiDCWoCag4eBd3N1rqQGXvQ2xLJilaj71BSxutmRtfc5EHf6avul5DV4QCg
	=
X-Gm-Gg: ASbGncsk+13SoxdRkxYbI2MTU29yNyQ57/6cvVfr9+li594OjyWdpDhNjfjZiz5dmGS
	2lGVfUfJVuCtnx8upaPTtHCPhmvf8JMY1ZFEDlqoWLpVOxFP6yPy4I9yixVouZF4n3W4nzXl3g/
	m79KgfxGplwRPboi0t2cZltdWloGZwSQ5OHLignxt8M2k1mtYuBCba0GhRQRfABuqbUb8htkDe7
	T7BOKeqr+RVGemWMCPa8h/So1Ftm81raTlgnL6ir9q17qz8rL2vhCIk9zJKAZue7bR8X4mCvqtF
	zY2A8XCnwYdlzhQt/Of8CL5PdWvh4c1XxZOyX4Jsa2y4YS5OkwJ6XittSWVVuvXmeToKGkyfk8+
	xS8FK1ZIrKnkJXjMUt/d3rQgr+g7iRQ==
X-Google-Smtp-Source: AGHT+IHQteaLNcNt65I4dgQ6qDS2Ewm584l+pQbdvqhBBjAGq9rRtpSwV90ZN6CnpL4Beq7D9jCUmA==
X-Received: by 2002:a05:600c:699b:b0:43c:e305:6d50 with SMTP id 5b1f17b1804b1-43db62c034bmr86702825e9.24.1743431163723;
        Mon, 31 Mar 2025 07:26:03 -0700 (PDT)
Message-ID: <e77a48b7-8f26-4b13-8863-615b5fbb7a29@suse.com>
Date: Mon, 31 Mar 2025 16:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: annotate page tables also with type
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

Use infrastructure from xen/linkage.h instead of the custom legacy
macros that we're in the process of phasing out.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I wasn't quite sure whether to also convert __page_tables_{start,end}
right here (to LABEL()).

--- a/xen/arch/x86/boot/x86_64.S
+++ b/xen/arch/x86/boot/x86_64.S
@@ -79,15 +79,18 @@ ENTRY(__high_start)
 .L_bsp:
         tailcall __start_xen
 
+/* Around page tables the fill pattern would better be zero. */
+#undef DATA_FILL
+#define DATA_FILL 0
+
         .section .data.page_aligned, "aw", @progbits
-        .align PAGE_SIZE, 0
 /*
  * Mapping of first 2 megabytes of memory. This is mapped with 4kB mappings
  * to avoid type conflicts with fixed-range MTRRs covering the lowest megabyte
  * of physical memory. In any case the VGA hole should be mapped with type UC.
  * Uses 1x 4k page.
  */
-l1_directmap:
+DATA_LOCAL(l1_directmap, PAGE_SIZE)
         pfn = 0
         .rept L1_PAGETABLE_ENTRIES
         /* VGA hole (0xa0000-0xc0000) should be mapped UC-. */
@@ -98,7 +101,7 @@ l1_directmap:
         .endif
         pfn = pfn + 1
         .endr
-        .size l1_directmap, . - l1_directmap
+END(l1_directmap)
 
 /*
  * __page_tables_{start,end} cover the range of pagetables which need
@@ -111,17 +114,17 @@ GLOBAL(__page_tables_start)
  * Space for 4G worth of 2M mappings, first 2M actually mapped via
  * l1_directmap[].  Uses 4x 4k pages.
  */
-GLOBAL(l2_directmap)
+DATA(l2_directmap, PAGE_SIZE)
         .quad sym_offs(l1_directmap) + __PAGE_HYPERVISOR
         .fill 4 * L2_PAGETABLE_ENTRIES - 1, 8, 0
-        .size l2_directmap, . - l2_directmap
+END(l2_directmap)
 
 /*
  * L2 mapping the Xen text/data/bss region, constructed dynamically.
  * Executable fixmap is hooked up statically.
  * Uses 1x 4k page.
  */
-GLOBAL(l2_xenmap)
+DATA(l2_xenmap, PAGE_SIZE)
         idx = 0
         .rept L2_PAGETABLE_ENTRIES
         .if idx == l2_table_offset(FIXADDR_X_TOP - 1)
@@ -131,10 +134,10 @@ GLOBAL(l2_xenmap)
         .endif
         idx = idx + 1
         .endr
-        .size l2_xenmap, . - l2_xenmap
+END(l2_xenmap)
 
 /* L2 mapping the fixmap.  Uses 1x 4k page. */
-l2_fixmap:
+DATA_LOCAL(l2_fixmap, PAGE_SIZE)
         idx = 0
         .rept L2_PAGETABLE_ENTRIES
         .if idx == l2_table_offset(FIXADDR_TOP - 1)
@@ -144,20 +147,20 @@ l2_fixmap:
         .endif
         idx = idx + 1
         .endr
-        .size l2_fixmap, . - l2_fixmap
+END(l2_fixmap)
 
 /* Direct map, initially covering the 4 l2_directmap tables.  Uses 1x 4k page. */
-l3_directmap:
+DATA_LOCAL(l3_directmap, PAGE_SIZE)
         idx = 0
         .rept 4
         .quad sym_offs(l2_directmap) + (idx << PAGE_SHIFT) + __PAGE_HYPERVISOR
         idx = idx + 1
         .endr
         .fill L3_PAGETABLE_ENTRIES - 4, 8, 0
-        .size l3_directmap, . - l3_directmap
+END(l3_directmap)
 
 /* L3 mapping the fixmap.  Uses 1x 4k page. */
-l3_xenmap:
+DATA_LOCAL(l3_xenmap, PAGE_SIZE)
         idx = 0
         .rept L3_PAGETABLE_ENTRIES
         .if idx == l3_table_offset(XEN_VIRT_START)
@@ -169,10 +172,10 @@ l3_xenmap:
         .endif
         idx = idx + 1
         .endr
-        .size l3_xenmap, . - l3_xenmap
+END(l3_xenmap)
 
 /* Top-level master (and idle-domain) page directory. */
-GLOBAL(idle_pg_table)
+DATA(idle_pg_table, PAGE_SIZE)
         .quad sym_offs(l3_bootmap) + __PAGE_HYPERVISOR
         idx = 1
         .rept L4_PAGETABLE_ENTRIES - 1
@@ -185,22 +188,21 @@ GLOBAL(idle_pg_table)
         .endif
         idx = idx + 1
         .endr
-        .size idle_pg_table, . - idle_pg_table
+END(idle_pg_table)
 
 GLOBAL(__page_tables_end)
 
 /* Init pagetables. Enough page directories to map into 4GB. */
         .section .init.data, "aw", @progbits
-        .align PAGE_SIZE, 0
 
-l1_bootmap:
+DATA_LOCAL(l1_bootmap, PAGE_SIZE)
         .fill L1_PAGETABLE_ENTRIES, 8, 0
-        .size l1_bootmap, . - l1_bootmap
+END(l1_bootmap)
 
-GLOBAL(l2_bootmap)
+DATA(l2_bootmap, PAGE_SIZE)
         .fill 4 * L2_PAGETABLE_ENTRIES, 8, 0
-        .size l2_bootmap, . - l2_bootmap
+END(l2_bootmap)
 
-GLOBAL(l3_bootmap)
+DATA(l3_bootmap, PAGE_SIZE)
         .fill L3_PAGETABLE_ENTRIES, 8, 0
-        .size l3_bootmap, . - l3_bootmap
+END(l3_bootmap)

