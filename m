Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25871A83B8D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 09:45:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944975.1343267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2mbA-0002yQ-An; Thu, 10 Apr 2025 07:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944975.1343267; Thu, 10 Apr 2025 07:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2mbA-0002w2-7s; Thu, 10 Apr 2025 07:45:20 +0000
Received: by outflank-mailman (input) for mailman id 944975;
 Thu, 10 Apr 2025 07:45:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2mb9-0002vw-Ki
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 07:45:19 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf1d6217-15df-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 09:45:17 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so3378535e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 00:45:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c49f7sm41250105e9.17.2025.04.10.00.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 00:45:16 -0700 (PDT)
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
X-Inumbo-ID: bf1d6217-15df-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744271117; x=1744875917; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZF2XejUi00jDPs3jcKuERLeUKtli1sGrr4QEMRrpN1g=;
        b=Cxa8UA0v9XTvo379Ruo1JsPle03/L5wJAVoarJ9vA0kMasUJqljWaHiE0wSH5VdVqp
         /OIivL6sBB3CamtZb2umnJp8I3Sb40drKe1Cr9Xm2xfSPF40YsLGlJj9EwqUh4ZjP9yk
         YXorsbmqKWOqiN/wpJBPLTWzBXYGpn7h/KB9mQIC/KEZwxpu9yzg1jfZDsBAJzTug+Bb
         7GOe7N2QdvkAwlTNJMY9D6DYUgB+h0RZAObIiWz1R5K9onrS2GPBuT8gLiC4w4Gd/C75
         qGwFiN/DmHFnpZb2waoCpGVxHHHyPgNo2mb3t++JaoMdrXG/ct73oFEs+2/rPGr0hEIR
         810Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744271117; x=1744875917;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF2XejUi00jDPs3jcKuERLeUKtli1sGrr4QEMRrpN1g=;
        b=vLUl2JrxiqDiwlfgk2ynhuYP9ZIJ3sRBy/jeo5CknGoI7czMQKFrhFMSVm/qqTFyRH
         Ns5jrSx7CHPox/6bWZf8qngzrBNQiXq49QXo0JEs9Jsjex8zS9FX7UEXkHKRF6Nl73Ly
         v6vBNwAkTwgrcgyZE2eSSRxI5wveN2N0BueIyUa6DrUhyTMeDTg/dt1bvWgV/7n5dGon
         yn3OwvYmEAf06T7/cYjt64+HuTkpX9DBtxmV50sP9/4GSnWhyEb/awZzDQ5uS43R+Sss
         6A8Osj9GH87oR4u6j8ftgyO4y/pH/xwjgtcwbqTf8KU1KSGX01feYmdSD+VnCgoHT/e8
         X80A==
X-Gm-Message-State: AOJu0YxgElYXhXPDpscuzrSgZN2/Qb/AMxuO1Z9tBnvwCi6ymOoOUYxF
	5T8HziOVNkipvDWiTsNUbyCTWF1P8aNHlNFVWRTGc4N2Cx31pA58wjiABDTwVa468LeoJoD/OCo
	=
X-Gm-Gg: ASbGnctEQq8E2I3nkdDCRaGS0vQzd80DVITh6Ep6lrfi4knDu+AlqwdkPZl8s6A2cJy
	i9CEUdWKBhTLWCSYSNVUhr8em2ZgE4+n/L0yvyUHg3ZDf8pATfgDUmdzP3/VB/2BeCOl8HsIu/f
	u4A8LYPe10lncQ3JmeKL64a7y190RT4Fze7ftHy57+a2/xIiDApQ5jf41YAr0cXcedPdvklD5XG
	ep6aHAq5VaNGKV52mSEvIVb+gQYboOcrW4CE98mJfqwR+VSfqq8y1wl9wuuHD6/C2jAOu3SJnqF
	QSvHep73oUm7lJ/EY8w8cvOygPew4LKuH+YAe1WRB2adyZvCUqClpb4lieKpRtIAde4jRX4FlxF
	l/WeIORmOIjy2f+E/rm6if/Zn/Q==
X-Google-Smtp-Source: AGHT+IFv19x43NJuislNUuQS4SL+U0uQPBViUfYSow+6o7Zz9w37bJ74XMdwX25UpxDmvHpq0+jxOw==
X-Received: by 2002:a05:600c:83ca:b0:43c:fdbe:439b with SMTP id 5b1f17b1804b1-43f2fdcea85mr12618475e9.4.1744271117162;
        Thu, 10 Apr 2025 00:45:17 -0700 (PDT)
Message-ID: <49b9d483-824d-4247-a642-f19f5c16fd5d@suse.com>
Date: Thu, 10 Apr 2025 09:45:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Daniel Smith <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RESEND] x86/EFI: correct mkreloc header (field) reading
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

With us now reading the full combined optional and NT headers, the
subsequent reading of (and seeking to) NT header fields is wrong. Since
PE32 and PE32+ NT headers are different anyway (beyond the image base
oddity extending across both headers), switch to using a union. This
allows to fetch the image base more directly then.

Additionally add checking to map_section(), which would have caught at
least the wrong (zero) image size that we previously used.

Fixes: f7f42accbbbb ("x86/efi: Use generic PE/COFF structures")
Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of the two checks added to map_section(), the 1st ends up being largely
redundant with the 2nd one. Should we use just the latter?

Also sanity checking the image base would be possible, but more
cumbersome if we wanted to check more than just "is in high half of
address space). Therefore I've left out doing so.

--- a/xen/arch/x86/efi/mkreloc.c
+++ b/xen/arch/x86/efi/mkreloc.c
@@ -28,14 +28,16 @@ static void usage(const char *cmd, int r
 static unsigned int load(const char *name, int *handle,
                          struct section_header **sections,
                          uint_fast64_t *image_base,
-                         uint32_t *image_size,
+                         uint_fast32_t *image_size,
                          unsigned int *width)
 {
     int in = open(name, O_RDONLY);
     struct mz_hdr mz_hdr;
     struct pe_hdr pe_hdr;
-    struct pe32_opt_hdr pe32_opt_hdr;
-    uint32_t base;
+    union {
+        struct pe32_opt_hdr pe;
+        struct pe32plus_opt_hdr pep;
+    } pe32_opt_hdr;
 
     if ( in < 0 ||
          read(in, &mz_hdr, sizeof(mz_hdr)) != sizeof(mz_hdr) )
@@ -54,31 +56,40 @@ static unsigned int load(const char *nam
 
     if ( lseek(in, mz_hdr.peaddr, SEEK_SET) < 0 ||
          read(in, &pe_hdr, sizeof(pe_hdr)) != sizeof(pe_hdr) ||
-         read(in, &pe32_opt_hdr, sizeof(pe32_opt_hdr)) != sizeof(pe32_opt_hdr) ||
-         read(in, &base, sizeof(base)) != sizeof(base) ||
-         /*
-          * Luckily the image size field lives at the
-          * same offset for both formats.
-          */
-         lseek(in, 24, SEEK_CUR) < 0 ||
-         read(in, image_size, sizeof(*image_size)) != sizeof(*image_size) )
+         (read(in, &pe32_opt_hdr.pe, sizeof(pe32_opt_hdr.pe)) !=
+          sizeof(pe32_opt_hdr.pe)) )
     {
         perror(name);
         exit(3);
     }
 
     switch ( (pe_hdr.magic == PE_MAGIC &&
-              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr)) *
-              pe32_opt_hdr.magic )
+              pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr.pe)) *
+              pe32_opt_hdr.pe.magic )
     {
     case PE_OPT_MAGIC_PE32:
         *width = 32;
-        *image_base = base;
+        *image_base = pe32_opt_hdr.pe.image_base;
+        *image_size = pe32_opt_hdr.pe.image_size;
         break;
     case PE_OPT_MAGIC_PE32PLUS:
-        *width = 64;
-        *image_base = ((uint64_t)base << 32) | pe32_opt_hdr.data_base;
-        break;
+        if ( pe_hdr.opt_hdr_size > sizeof(pe32_opt_hdr.pep) )
+        {
+            if ( read(in,
+                      &pe32_opt_hdr.pe + 1,
+                      sizeof(pe32_opt_hdr.pep) - sizeof(pe32_opt_hdr.pe)) !=
+                 sizeof(pe32_opt_hdr.pep) - sizeof(pe32_opt_hdr.pe) )
+            {
+                perror(name);
+                exit(3);
+            }
+
+            *width = 64;
+            *image_base = pe32_opt_hdr.pep.image_base;
+            *image_size = pe32_opt_hdr.pep.image_size;
+            break;
+        }
+        /* Fall through. */
     default:
         fprintf(stderr, "%s: Wrong PE file format\n", name);
         exit(3);
@@ -108,11 +119,28 @@ static unsigned int load(const char *nam
 static long page_size;
 
 static const void *map_section(const struct section_header *sec, int in,
-                               const char *name)
+                               const char *name, uint_fast32_t image_size)
 {
     const char *ptr;
     unsigned long offs;
 
+    if ( sec->rva > image_size )
+    {
+        fprintf(stderr,
+                "%s: section %.8s @ %08"PRIx32" beyond image size %08"PRIxFAST32"\n",
+                name, sec->name, sec->rva, image_size);
+        exit(6);
+    }
+
+    if ( (uint_fast64_t)sec->rva + sec->virtual_size > image_size )
+    {
+        fprintf(stderr,
+                "%s: section %.8s @ [%09"PRIx32",%09"PRIxFAST64") extends beyond image size %09"PRIxFAST32"\n",
+                name, sec->name, sec->rva,
+                (uint_fast64_t)sec->rva + sec->virtual_size, image_size);
+        exit(6);
+    }
+
     if ( !page_size )
         page_size = sysconf(_SC_PAGESIZE);
     offs = sec->data_addr & (page_size - 1);
@@ -233,7 +261,7 @@ int main(int argc, char *argv[])
     int in1, in2;
     unsigned int i, nsec, width1, width2;
     uint_fast64_t base1, base2;
-    uint32_t size1, size2;
+    uint_fast32_t size1, size2;
     struct section_header *sec1, *sec2;
 
     if ( argc == 1 ||
@@ -308,8 +336,8 @@ int main(int argc, char *argv[])
             sec1[i].raw_data_size = sec1[i].virtual_size;
             sec2[i].raw_data_size = sec2[i].virtual_size;
         }
-        ptr1 = map_section(sec1 + i, in1, argv[1]);
-        ptr2 = map_section(sec2 + i, in2, argv[2]);
+        ptr1 = map_section(sec1 + i, in1, argv[1], size1);
+        ptr2 = map_section(sec2 + i, in2, argv[2], size1);
 
         diff_sections(ptr1, ptr2, sec1 + i, base2 - base1, width1,
                       base1, base1 + size1);

