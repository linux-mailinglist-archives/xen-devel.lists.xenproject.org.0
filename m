Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8603DB29B68
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 09:57:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085536.1443853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unukQ-0008Rv-Eu; Mon, 18 Aug 2025 07:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085536.1443853; Mon, 18 Aug 2025 07:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unukQ-0008QT-C5; Mon, 18 Aug 2025 07:57:42 +0000
Received: by outflank-mailman (input) for mailman id 1085536;
 Mon, 18 Aug 2025 07:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unukO-0008QK-L8
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 07:57:40 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01ac2169-7c09-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 09:57:37 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-afcb78c66dcso536529166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 00:57:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618af9da747sm6726244a12.19.2025.08.18.00.57.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 00:57:36 -0700 (PDT)
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
X-Inumbo-ID: 01ac2169-7c09-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755503857; x=1756108657; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Pgs+IIgn/sUdCqmh7fe6wvHFy3WtKqV40+O4WUq7794=;
        b=Xix8tPQN8W72hKwFx5nfHTzp/Z8bVS9nZRMmGUUOFBt9tkUFJghrM2SSSvlXwoWB6W
         CMmOfZiQkMU8cwDkwi110nQ4MqxsK8flene/3f7mMZUFrNB3HDw0aM712/VSssrFkVEo
         QcEOtyC4ejEFCRMIGU+JB15FAJM7Btz7NLU/W1ORvAOOiiu2Y8YWkEFroCIJXpaMLWHB
         o3+7UHVS3czIeaUunx3qhi3x+mZLaWnRb6IPTYmx0pdJ7lod8ccvkc4tBe/PWY491jxq
         vI7CryhUDlIdmdxrm6W9XQcj81XDAU6ECT1zBE32Pa0IYYQw6Tn/2zE1ITrGI+AiJff7
         0xoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755503857; x=1756108657;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pgs+IIgn/sUdCqmh7fe6wvHFy3WtKqV40+O4WUq7794=;
        b=n2NBzHby5FsU+JeMRkAVmOV6o8KduTYGHNDGluzVnEF0um/70elbxfYCzslfXzQcf/
         pNUHrZsTuTTbX2KyTGHGBJqdzYY+l98tkAu8mRwI4FoXp90eur6Im8AJINF5+KLASeBU
         38cKt/2nkz8dLlyw4MvswADEvJY3WWTWWXK8W1j/e+1wzmH8EhNurqnwuBtLfvbb8zcw
         CccFGcCLCPfvT5xlQ5KLDtuSmey0KPXEHfH76gR+ee2giuJNWrEL4BdEsz4kBKPdf8M3
         +NujkAXumvpwTo9vU+Xyjw1gadB4Fumo4VJrIQ7k5vB8JpqDUdOsuaEisUGWwIfuXpjm
         zang==
X-Gm-Message-State: AOJu0Yw+JsONkTjHjzgtsGtgy9u6oTteSgvvmGul85zrn6pwa4w+ZP9C
	1odWlpVwkrPUrPgwrb5gvtvd7RKG60dF51VGXk1hlZoWYm1i9iuWPVjbEL3wZ8Ps7fMm5HEEoBA
	3wEU=
X-Gm-Gg: ASbGncvJqoWEVWjTqQ0Ct7UNoN14wf5koccvpYNf+3PHy2njwooFoIA4dJLJXhK7gBW
	m4CEvV2BSBZGw3R370v68eae7UEXOeLXWwMv1SNtnEtxv+NHShV2AOfxo0wJd6YjQvaH81FAZ2o
	CmfVqZhIJIxJa8KGHTrEXgdhg5rAjQWVQ2+Pfe/1gUnJLOC9unXSVc50tOcsNCV+IbFzdCRCspd
	9RxhrhAINSf21wl4xuiooWyhxaB4KuLArDih0jv2H0mQyeDhQBFSdXIwmieG+innnxKGmr9bJne
	aQd/IMWUjRs7oIRRUGas2VY1ZDgHhYJBgf0uOJYiZQeKlWAetM2n8qDSzrMl+PG/dxoYPHvEYhX
	sDHtOMRpGCBzk4VAg23N6ZO3zME7jk283hT7LineFu727zbIyjOX+VoAZS48I8veJAtWmlfX06I
	UDXQgdBe6JWydO92iCuw==
X-Google-Smtp-Source: AGHT+IEkxn3JlDNFXp7hxB79wqP1o4SsRbRPNJ/jECI8MOKEMJIeauykkzlhv9IPtepT09GCUBrQpQ==
X-Received: by 2002:a17:907:9484:b0:af8:fad5:aee5 with SMTP id a640c23a62f3a-afcead09313mr808235866b.25.1755503856766;
        Mon, 18 Aug 2025 00:57:36 -0700 (PDT)
Message-ID: <4a568ff4-2cfd-40ec-b249-217fab34f4ec@suse.com>
Date: Mon, 18 Aug 2025 09:57:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] common: make page_{is,get}_ram_type() x86-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <a2dc40a8-908a-44a7-b443-90f492a775cc@suse.com>
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
In-Reply-To: <a2dc40a8-908a-44a7-b443-90f492a775cc@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The classification is pretty E820-centric anyway, and all uses of the
function are now in x86-only code.

Switch the boolean return type to properly use bool while at it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -464,6 +464,16 @@ extern bool opt_pv_linear_pt;
     ASSERT(((_p)->count_info & PGC_count_mask) != 0);          \
     ASSERT(page_get_owner(_p) == (_d))
 
+#define RAM_TYPE_CONVENTIONAL 0x00000001
+#define RAM_TYPE_RESERVED     0x00000002
+#define RAM_TYPE_UNUSABLE     0x00000004
+#define RAM_TYPE_ACPI         0x00000008
+#define RAM_TYPE_UNKNOWN      0x00000010
+/* TRUE if the whole page at @mfn is of the requested RAM type(s) above. */
+bool page_is_ram_type(unsigned long mfn, unsigned long mem_type);
+/* Returns the page type(s). */
+unsigned int page_get_ram_type(mfn_t mfn);
+
 /******************************************************************************
  * With shadow pagetables, the different kinds of address start
  * to get get confusing.
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -385,7 +385,7 @@ void __init arch_init_memory(void)
     ASM_CONSTANT(FIXADDR_X_SIZE, FIXADDR_X_SIZE);
 }
 
-int page_is_ram_type(unsigned long mfn, unsigned long mem_type)
+bool page_is_ram_type(unsigned long mfn, unsigned long mem_type)
 {
     uint64_t maddr = pfn_to_paddr(mfn);
     int i;
@@ -419,10 +419,10 @@ int page_is_ram_type(unsigned long mfn,
         /* Test the range. */
         if ( (e820.map[i].addr <= maddr) &&
              ((e820.map[i].addr + e820.map[i].size) >= (maddr + PAGE_SIZE)) )
-            return 1;
+            return true;
     }
 
-    return 0;
+    return false;
 }
 
 bool page_is_offlinable(mfn_t mfn)
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -565,15 +565,6 @@ int __must_check guest_remove_page(struc
 int __must_check steal_page(struct domain *d, struct page_info *page,
                             unsigned int memflags);
 
-#define RAM_TYPE_CONVENTIONAL 0x00000001
-#define RAM_TYPE_RESERVED     0x00000002
-#define RAM_TYPE_UNUSABLE     0x00000004
-#define RAM_TYPE_ACPI         0x00000008
-#define RAM_TYPE_UNKNOWN      0x00000010
-/* TRUE if the whole page at @mfn is of the requested RAM type(s) above. */
-int page_is_ram_type(unsigned long mfn, unsigned long mem_type);
-/* Returns the page type(s). */
-unsigned int page_get_ram_type(mfn_t mfn);
 /* Check if a range falls into a hole in the memory map. */
 bool is_memory_hole(mfn_t start, mfn_t end);
 


