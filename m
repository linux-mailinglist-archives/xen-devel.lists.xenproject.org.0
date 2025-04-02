Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEE8A7891D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 09:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935189.1336638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzsoN-0005ET-Jc; Wed, 02 Apr 2025 07:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935189.1336638; Wed, 02 Apr 2025 07:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzsoN-0005C1-Gc; Wed, 02 Apr 2025 07:46:59 +0000
Received: by outflank-mailman (input) for mailman id 935189;
 Wed, 02 Apr 2025 07:46:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzsoM-0005Bv-4N
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 07:46:58 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6426d08-0f96-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 09:46:55 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-399744f74e9so4142772f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 00:46:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb60cd74dsm12195495e9.20.2025.04.02.00.46.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 00:46:54 -0700 (PDT)
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
X-Inumbo-ID: a6426d08-0f96-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743580015; x=1744184815; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=edDRPeSSLFBp5KTbZc8k1GEd+2MMcyjQAdZk6SqRO8Y=;
        b=ZBPuCJnc63j6VpVUJbFmDDPdiJ0oYGbProdQwSnESA9jUmOZEa1Or/E6J5ncmBjUR4
         fqJ2n2HlVZplzL3o60fjSVo1eJOzWPJwftKCAeZeT91TKsD/xGE7mdKzSxhVB950Yq/z
         m3yr0h5IV6+2yVyWKOlnSD+ZqZdqAqs5CPGZ6TsGsRN3z0VRF1idjBTWH1169Rx7as60
         7XbBumwXteF1GaUVYkZuPTWERcp7I6e8G/o5qcynV/wshBuddROIK8aRAi9t2RYoNI7E
         wNlTvSiV5qeYRptK6fNPFhUOdy+euiaaYl4AEyyEdCdZWPpyUo1AggSLzHv61olOrwuP
         DV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580015; x=1744184815;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=edDRPeSSLFBp5KTbZc8k1GEd+2MMcyjQAdZk6SqRO8Y=;
        b=k3gNZNJMM+CxCQbjcWMSrkX9HN+7wAMRJNAfkyBkxIPyn5T9NO7UQw0ufMx+XnHqG9
         ec2i+eiYZIE+j0TEeP93+Oq70aXlq7mRrG61hoZQPn7cvqHcxi9HhPGWDNOL18RtAd49
         wdYBw7OdPNou97OChxK5er013kXnu2plzHplpyHXwGuaRA8Nhuhp6odbwVqoqPcyq+FN
         cp7YYNqOpoj8u5vcj/MwvwEU7bs2Cu55JENp1LGhN/A7cOo3J0T5ZVN813+jEMp0DD3y
         mqHpewJ/9oEety3+C6BMio6tpzh7m218/Rjr3DeB0kzEFxH7xpKNDHi7wfQz6b8ix4RJ
         5Jlg==
X-Forwarded-Encrypted: i=1; AJvYcCUYBwJFt5E1slbwMlxEFj/VvHlJXv4sQ1ERPyxPQM9f2maBRk7aJmSi1Va1ihQShEP4aoiw4pXmpQ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwltQ8BreXrpR6le7KnPkphuJP8+A6dLa0yiEmsvvViDsf0wqYS
	yJtz1tdFg3uQCv088nqbwtauzZvwPMvZW4mV9AN18B9MbfksBKuL48zzqBluIA==
X-Gm-Gg: ASbGnctEuAL2odtFwBFaLPOhasMzY9qeVXfblipVxNTYuUHsZLE6sHF0LU/U3TZrt3n
	2kDSq3w0dxB983cg8xMbbP+6rIDwhZmq0pvD3JTqvnFV51jEOoKU2NR8lnyp5sjEPlkzYF5FYr0
	BEZ74jZ5EaYIWUSi2Mdf8viMOhg0Ok0VF4iael4VVfLnsr/0evrYFRbo0MzeBjQracSzF0V/qYj
	HVzmYwtbLRtc1Nl4JstrO5W8ym8QtdmarMzcUlJ7bAOgnh5KaWw6ogsnpHR2tYu01DxhZmTxvAu
	UtKYwUZ4cC9W5yv+4TBB7LZBPbG3YrHENpRvel0fW8F0tz/5JQYYNMzT7mycMlF+iSK5FXeep9D
	wBV9+yVgD7/YFyQA0R3caWOQK6brkgw==
X-Google-Smtp-Source: AGHT+IHBtxkx0B0/ryiZauBIuePc0enQPNC8VT6RZX9GFw/dZ1ansyAK7A18oQAsvRY/3J9sgGWysA==
X-Received: by 2002:a5d:47a2:0:b0:39a:c9ed:8555 with SMTP id ffacd0b85a97d-39c120dfd8dmr13699475f8f.23.1743580015299;
        Wed, 02 Apr 2025 00:46:55 -0700 (PDT)
Message-ID: <a14a7a42-cf7e-463b-a87d-e302ce32371b@suse.com>
Date: Wed, 2 Apr 2025 09:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/11] x86/mkreloc: fix obtaining PE image base address
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-3-roger.pau@citrix.com>
 <6c37ad18-a830-453e-a7ff-fb4978e3f0df@suse.com>
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
In-Reply-To: <6c37ad18-a830-453e-a7ff-fb4978e3f0df@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.04.2025 16:17, Jan Beulich wrote:
> On 01.04.2025 15:08, Roger Pau Monne wrote:
>> The base address is in the pe32_opt_hdr, not after it.

Which is a result of pe.h munging both the optional and the NT header into
a single structure.

>> Previous to commit f7f42accbbbb the base was read standalone (as the first
>> field of pe32_opt_hdr).  However with the addition of reading the full
>> contents of pe32_opt_hdr, such read will also fetch the base.  The current
>> attempt to read the base after pe32_opt_hdr is bogus, and could only work
>> if the file cursor is repositioned using lseek(), but there's no need for
>> that as the data is already fetched in pe32_opt_hdr.
> 
> Yes, but: How did things work at all then with this bug?

It simply didn't. We got away only because apparently no-one tried a build
with a linker old enough for this tool to come into play.

I'd like to suggest the replacement patch below, though.

Jan

x86/EFI: correct mkreloc header (field) reading

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
cumbersome if we wanted to check moret than just "is in high half of
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


