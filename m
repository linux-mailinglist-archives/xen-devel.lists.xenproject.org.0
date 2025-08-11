Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B3AB20646
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 12:50:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077291.1438356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQ6L-0004Nb-MM; Mon, 11 Aug 2025 10:50:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077291.1438356; Mon, 11 Aug 2025 10:50:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQ6L-0004LH-Hz; Mon, 11 Aug 2025 10:50:01 +0000
Received: by outflank-mailman (input) for mailman id 1077291;
 Mon, 11 Aug 2025 10:50:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulQ6K-0004L9-Hs
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 10:50:00 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec8d174c-76a0-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 12:49:58 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-af958127df5so632791966b.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 03:49:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af929c6a157sm1883763266b.91.2025.08.11.03.49.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:49:57 -0700 (PDT)
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
X-Inumbo-ID: ec8d174c-76a0-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754909398; x=1755514198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c0kRRXWE/dsdx4mKZYOIAFzRpb2D9T2OWENbKt8BtM0=;
        b=LcT9RvDwy+fK5IxjNq/TtFZ7JNl+IPMYHNSEs9t/StxBVeEyXqV954GMri3o1S9EAd
         kFnun4SAK6HbCDFWUXxMd+297WUpSoE3H7DbVZxKZh4dxCk+GnlaCOmwY+C8EDgVVwfO
         8R99P1H+zrpMIpSkDeXjMlFq6ONsYAGGvtKRh6puCIMqfXQYFyuLZ8gChRsv/odvHV8t
         u0rio2kaWQd68LPGDIVboXQ8u8M/LRhpGVCQc35h1iTlP+peRRy14VuwAxd5rhS9wlVj
         ciuzMdVAJwnff8428ncHQQ2j/2xpSf9Lp3rP13C90L30vtJ+L/n6XaWxHoMbgzZm6wUg
         rqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909398; x=1755514198;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c0kRRXWE/dsdx4mKZYOIAFzRpb2D9T2OWENbKt8BtM0=;
        b=fVjduTrfbVPKNS2PV73kc4jdEiyB/bJw5E/kjL0ooJZ3O/Uhw36PGdGI0behKDwqtW
         oZtqpMgCYsOtx3LMFM86//v7yESCVBayNyMPb2cBeZRRrpPmsCcfA4MF2XZFXk+1wgYh
         1KxlZvBuHIo7s59rCrRtO44/GRg3clvKE3kvR69eMvJXFKcbZW2RjXwY5ywldYGNv/oG
         LkuxdtRhanukE2r/AAJ/khu6k5/fVtDVS6uSikVG5BIgw/bvyN0rIp9WuUpJ5yRcHzTL
         lKRr8AOcv/HS+yCRSzLXfaRuxR/mi1DpZhrt/dJtGcdHMyKxqcgllPYBor3nYVXxFEXb
         CthQ==
X-Gm-Message-State: AOJu0YxF4zZ3J3Ys/N3Mp237gEZApIAn4+eQCDl/B7thNkgkV+xpyJ2P
	WeWu5mEcpY8qHZAxV14Ym/TpjEMslU6wwtBnkp/y7cX4pSKtbYBYIBwrkpWjf4NPu93pB3yo71w
	Td/Y=
X-Gm-Gg: ASbGncsetAeQ0gaDw0EnXwAYug1QhIRMJkQDQoyPgcLpfVAyMe+moRN4UgVPAJ+glfZ
	Au+QUyTvZAbaLz1wJMp7MaT+/exopQUilpxmiH+by7ITzjcSr9BGiDEYte2jYObRYBC6nFWCvxj
	bLiOY2yoSGaBLs2W1ajjlfLtm6h2AHx3WVqzOrjnm+STw18erg/NlWDu8kGIa0HA6KsfPwvJCJU
	f/gulUMOMJmd2sDxPbURhoGOk+2xtiJ5z4K3fiPs/RyMuizwlctKSbOB3F5lSTrV3FnLImJOsxA
	e/Wunmkqy1mzehzMHJwWYJMJTfuDTmCBelbVlJabqNc0Xof8ydeISo2EG5384SYvVeZtiTqv6OV
	5FSodtcQw0T8U9TPgYKDquo/2jr9R2Yac+dRM41YjCe+Hzkj+AoZaCOG4y0VveIL2JERj6u1y+0
	kPV/p5ZkY=
X-Google-Smtp-Source: AGHT+IFIiIOXTIfVIQ0ibV7NNZ95KDX2AyW9ZiKJINRkwWBFe/0km40+ll+vOgX3b6y501vFfzYcEQ==
X-Received: by 2002:a17:907:cd0e:b0:af9:3ad2:6930 with SMTP id a640c23a62f3a-af9c64859a3mr1060375766b.24.1754909397940;
        Mon, 11 Aug 2025 03:49:57 -0700 (PDT)
Message-ID: <6e295921-0432-435e-9efe-51caa106f203@suse.com>
Date: Mon, 11 Aug 2025 12:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/2] x86/mkelf32: pad load segment to 2Mb boundary
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ddfd86ad-19b3-495b-930c-1770dd92fa99@suse.com>
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
In-Reply-To: <ddfd86ad-19b3-495b-930c-1770dd92fa99@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In order to legitimately set up initial mappings past _end[], we need
to make sure that the entire mapped range is inside a RAM region.
Therefore we need to inform the bootloader (or alike) that our allocated
size is larger than just the next SECTION_ALIGN-ed boundary past _end[].

This allows dropping a command line option from the tool, which was
introduced to work around a supposed linker bug, when the problem was
really Xen's.

While adjusting adjacent code, correct the argc check to also cover the
case correctly when --notes was passed.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
There's no good Fixes: tag, I don't think, as in theory the issue could
even have happened when we still required to be loaded at a fixed
physical address (1Mb originally, later 2Mb), and when we statically
mapped the low 16Mb. If we assumed such can't happen below 16Mb, these
two should be added:
Fixes: e4dd91ea85a3 ("x86: Ensure RAM holes really are not mapped in Xen's ongoing 1:1 physmap")
Fixes: 7cd7f2f5e116 ("x86/boot: Remove the preconstructed low 16M superpage mappings")
---
v2: New.

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -130,8 +130,7 @@ orphan-handling-$(call ld-option,--orpha
 
 $(TARGET): TMP = $(dot-target).elf32
 $(TARGET): $(TARGET)-syms $(efi-y) $(obj)/boot/mkelf32
-	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET) \
-	               `$(NM) $(TARGET)-syms | sed -ne 's/^\([^ ]*\) . __2M_rwdata_end$$/0x\1/p'`
+	$(obj)/boot/mkelf32 $(notes_phdrs) $(TARGET)-syms $(TMP) $(XEN_IMG_OFFSET)
 	od -t x4 -N 8192 $(TMP)  | grep 1badb002 > /dev/null || \
 		{ echo "No Multiboot1 header found" >&2; false; }
 	od -t x4 -N 32768 $(TMP) | grep e85250d6 > /dev/null || \
--- a/xen/arch/x86/boot/mkelf32.c
+++ b/xen/arch/x86/boot/mkelf32.c
@@ -248,7 +248,6 @@ static void do_read(int fd, void *data,
 
 int main(int argc, char **argv)
 {
-    uint64_t   final_exec_addr;
     uint32_t   loadbase, dat_siz, mem_siz, note_base, note_sz, offset;
     char      *inimage, *outimage;
     int        infd, outfd;
@@ -261,22 +260,24 @@ int main(int argc, char **argv)
     Elf64_Ehdr in64_ehdr;
     Elf64_Phdr in64_phdr;
 
-    if ( argc < 5 )
+    if ( argc < 4 )
     {
+    help:
         fprintf(stderr, "Usage: mkelf32 [--notes] <in-image> <out-image> "
-                "<load-base> <final-exec-addr>\n");
+                "<load-base>\n");
         return 1;
     }
 
     if ( !strcmp(argv[1], "--notes") )
     {
+        if ( argc < 5 )
+            goto help;
         i = 2;
         num_phdrs = 2;
     }
     inimage  = argv[i++];
     outimage = argv[i++];
     loadbase = strtoul(argv[i++], NULL, 16);
-    final_exec_addr = strtoull(argv[i++], NULL, 16);
 
     infd = open(inimage, O_RDONLY);
     if ( infd == -1 )
@@ -339,9 +340,12 @@ int main(int argc, char **argv)
     (void)lseek(infd, in64_phdr.p_offset, SEEK_SET);
     dat_siz = (uint32_t)in64_phdr.p_filesz;
 
-    /* Do not use p_memsz: it does not include BSS alignment padding. */
-    /*mem_siz = (uint32_t)in64_phdr.p_memsz;*/
-    mem_siz = (uint32_t)(final_exec_addr - in64_phdr.p_vaddr);
+    /*
+     * We don't pad .bss in the linker script, but during early boot we map
+     * the Xen image using 2M pages.  To avoid running into adjacent non-RAM
+     * regions, pad the segment to the next 2M boundary.
+     */
+    mem_siz = ((uint32_t)in64_phdr.p_memsz + (1U << 20) - 1) & (-1U << 20);
 
     note_sz = note_base = offset = 0;
     if ( num_phdrs > 1 )


