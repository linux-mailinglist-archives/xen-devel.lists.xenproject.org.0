Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1821B9643A7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 13:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785711.1195195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdnb-0007hH-A3; Thu, 29 Aug 2024 11:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785711.1195195; Thu, 29 Aug 2024 11:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdnb-0007fS-5q; Thu, 29 Aug 2024 11:58:47 +0000
Received: by outflank-mailman (input) for mailman id 785711;
 Thu, 29 Aug 2024 11:58:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ImPG=P4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sjdnZ-0007Df-45
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 11:58:45 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09d2b8e8-65fe-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 13:58:43 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c218866849so615328a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 04:58:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8988feb25asm70548366b.41.2024.08.29.04.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Aug 2024 04:58:42 -0700 (PDT)
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
X-Inumbo-ID: 09d2b8e8-65fe-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724932723; x=1725537523; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jj1rljSuKRUjwrs1h28RS9OID/yR/9HEGB54IEgRD3U=;
        b=QohyuEnsdR2zXM0eVawHZE4t4bXxT9+4qEL6LTg7VlAkpu6mZ6dFWHqqy8Od7jM/3W
         6zz/rT+/2FTliZnbpnuIsqNHHy6DhZ9oXJWCQdQ4lHgGxEWn2F9PE6gi1+zYQKRp8G3I
         r9e0XYY9dy7kDbNUQMOktuD2hrQCGvOcAYWljWTM0VSpL8CwmSVFtyR0Vhc1k4CHXzAr
         NPXvs6ySXhd+rGfttbdL3D40bSkRaUAm1CnKlalrSayclN64L4FeWlba1m0gfMJMuoyi
         evZN5cYCEWUqawf/XsKLtFxEh87PlW45z5h47YVzC0FNV7GGw+vrH2Fq0ifN9M6+cIC5
         X9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932723; x=1725537523;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jj1rljSuKRUjwrs1h28RS9OID/yR/9HEGB54IEgRD3U=;
        b=wsZIN/15kZ7su+LoVNbFROpD7fVwGkUBMC84TP7KDxTe9OEmsJ8/8N+0LAFxWsbLXy
         0NKF1d00WRyYEeY7Jc9b8W/1CQt6orNBmCwSNFUx53q3v2FTRIQo8WG/f6XvBkU1XFYV
         GjdH2WskzUO86Lxr6JqNGTXLuxeYe0cPcDKsZpgNad6yjHdmBk5dT9itC7gf0Om7F84a
         ONEfLsHyE+veL5YpXm7q15F6Xc9sbUGudaVQgltdDqj5c+PGHPRjTo1ZXinAJfP5J4GD
         +PlDaQ68O/Ucwwzl1N20Xe3rSLqGedUs7JgXAizP/NliFSAwaTv4eQgyschykYyWMouN
         DokQ==
X-Gm-Message-State: AOJu0YySQn6up6lHERyG7p25NfOOiAQNJs9tJYJKyFVrqHUEwZy8s9+1
	7pd3X/ufF1KMMM7hDqoHnl77tfXqaftIzEnUBj6KgnqX4QDCYf4G4NCX7sKE1uSrxzYcSJNpgM4
	=
X-Google-Smtp-Source: AGHT+IFfF3TsFB/px46qApHrHb+1lPV9mj1iQ1UFMtiio3ecKTtqUspu393BT8Klm2Ctq1gR8hNYHw==
X-Received: by 2002:a05:6402:2690:b0:5c0:902c:e191 with SMTP id 4fb4d7f45d1cf-5c21ed45d49mr2462989a12.9.1724932722830;
        Thu, 29 Aug 2024 04:58:42 -0700 (PDT)
Message-ID: <fd27e294-744d-4fe0-ba73-1483dfc27621@suse.com>
Date: Thu, 29 Aug 2024 13:58:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/5] x86: drop s<N>/u<N> overrides from mkelf32
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
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
In-Reply-To: <b1ded557-63b8-4999-98ca-de80488ebad1@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use uint<N>_t instead (s<N> were unused altogether). While adjusting
swap<N>() drop excessive casts and rename the arguments to avoid leading
underscores.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/boot/mkelf32.c
+++ b/xen/arch/x86/boot/mkelf32.c
@@ -17,14 +17,6 @@
 #include <unistd.h>
 #include <inttypes.h>
 
-#define u8  uint8_t
-#define u16 uint16_t
-#define u32 uint32_t
-#define u64 uint64_t
-#define s8  int8_t
-#define s16 int16_t
-#define s32 int32_t
-#define s64 int64_t
 #include "../../../include/xen/elfstructs.h"
 
 #define DYNAMICALLY_FILLED   0
@@ -72,9 +64,9 @@ static Elf32_Phdr note_phdr = {
     4                                        /* p_align */
 };
 
-static u8 out_shstrtab[] = "\0.text\0.shstrtab";
+static uint8_t out_shstrtab[] = "\0.text\0.shstrtab";
 /* If num_phdrs >= 2, we need to tack the .note. */
-static u8 out_shstrtab_extra[] = ".note\0";
+static uint8_t out_shstrtab_extra[] = ".note\0";
 
 static Elf32_Shdr out_shdr[] = {
     { 0 },
@@ -124,9 +116,9 @@ static Elf32_Shdr out_shdr_note = {
 #undef swap32
 #undef swap64
 
-#define swap16(_v) ((((u16)(_v)>>8)&0xff)|(((u16)(_v)&0xff)<<8))
-#define swap32(_v) (((u32)swap16((u16)(_v))<<16)|(u32)swap16((u32)((_v)>>16)))
-#define swap64(_v) (((u64)swap32((u32)(_v))<<32)|(u64)swap32((u32)((_v)>>32)))
+#define swap16(v) (( (uint8_t)(v)       <<  8) | (uint8_t)((v) >>  8))
+#define swap32(v) (((uint32_t)swap16(v) << 16) |    swap16((v) >> 16))
+#define swap64(v) (((uint64_t)swap32(v) << 32) |    swap32((v) >> 32))
 
 static int big_endian;
 
@@ -256,8 +248,8 @@ static void do_read(int fd, void *data,
 
 int main(int argc, char **argv)
 {
-    u64        final_exec_addr;
-    u32        loadbase, dat_siz, mem_siz, note_base, note_sz, offset;
+    uint64_t   final_exec_addr;
+    uint32_t   loadbase, dat_siz, mem_siz, note_base, note_sz, offset;
     char      *inimage, *outimage;
     int        infd, outfd;
     char       buffer[1024] = {};
@@ -302,7 +294,7 @@ int main(int argc, char **argv)
         return 1;
     }
 
-    big_endian = (*(u16 *)in32_ehdr.e_ident == ((ELFMAG0 << 8) | ELFMAG1));
+    big_endian = (*(uint16_t *)in32_ehdr.e_ident == ((ELFMAG0 << 8) | ELFMAG1));
 
     endianadjust_ehdr32(&in32_ehdr);
     if ( in32_ehdr.e_ident[EI_CLASS] != ELFCLASS64 )
@@ -345,11 +337,11 @@ int main(int argc, char **argv)
     endianadjust_phdr64(&in64_phdr);
 
     (void)lseek(infd, in64_phdr.p_offset, SEEK_SET);
-    dat_siz = (u32)in64_phdr.p_filesz;
+    dat_siz = (uint32_t)in64_phdr.p_filesz;
 
     /* Do not use p_memsz: it does not include BSS alignment padding. */
-    /*mem_siz = (u32)in64_phdr.p_memsz;*/
-    mem_siz = (u32)(final_exec_addr - in64_phdr.p_vaddr);
+    /*mem_siz = (uint32_t)in64_phdr.p_memsz;*/
+    mem_siz = (uint32_t)(final_exec_addr - in64_phdr.p_vaddr);
 
     note_sz = note_base = offset = 0;
     if ( num_phdrs > 1 )


