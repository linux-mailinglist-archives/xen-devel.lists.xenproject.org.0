Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ss1gCu4QTWoVugEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 16:45:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C1871CCA9
	for <lists+xen-devel@lfdr.de>; Tue, 07 Jul 2026 16:45:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=Hp6kxM4R;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1356300.1610939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh72d-0001hF-1L; Tue, 07 Jul 2026 14:44:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356300.1610939; Tue, 07 Jul 2026 14:44:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wh72c-0001el-Ug; Tue, 07 Jul 2026 14:44:54 +0000
Received: by outflank-mailman (input) for mailman id 1356300;
 Tue, 07 Jul 2026 14:44:53 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wh72a-0001eQ-To
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 14:44:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wh72a-006gde-Aj
 for xen-devel@lists.xenproject.org; Tue, 07 Jul 2026 16:44:52 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d10d4-e002-0a2a0a5209dd-0a2a4509ad3a-8
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:44:52 +0200
Received: from [209.85.221.54] (helo=mail-wr1-f54.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4d10e4-97e6-0a2a45090019-d155dd36ed98-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 16:44:52 +0200
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so2240558f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jul 2026 07:44:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9e4d780csm35456052f8f.11.2026.07.07.07.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jul 2026 07:44:51 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783435492; x=1784040292; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Uco6iUozAyjagFtzC9lAXRJPgK3e6gqt9d8xgjkfa5M=;
        b=Hp6kxM4Rj8dk5RsnCdci7ZVH1TjG+VpwvP+7hMxyhU6+Y+C+G8WSpUhqbEwuPJCUkg
         M18SKTM/vpYq00yUK5K1ncYjuhk0VmzXZwqjYW+oXsBLAYOIFk2icKSlAAVRFJETCI/v
         P8teO+Ph74N6EznLosPq4ENFE5RggnZ8/uOU0a2EDtcMLo0Gtm/ovdp9mvmfTNkkgMZW
         zkZJ3xcxzTgtZtb9/kJgaYOIXABQsPnkzMihwKJSPbsIdYkrDSTc+FzEWl4+9DZWRsQa
         SY2V9nzhJ4CJECASQevd7wUnIj3Ys5+6+aN4bWpqFd5cXXmfzU15hH00A8dp7BMpLvGY
         brxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435492; x=1784040292;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uco6iUozAyjagFtzC9lAXRJPgK3e6gqt9d8xgjkfa5M=;
        b=LKguKx0a2XhUERmpTsgjm95ByY1KLHdnzLLwC4r+C0dA1Mx2O8QQifsScn9bwoc4qG
         2/HlfzFBxB9+lB/dehwteyxbM3QNGnviIZLAlUyHsRwVwND5EZIae0WG9MmULvbjkkPa
         VNfbn7AA6o8AFNYiN5fGkfSASsFEGaOJthR3EQaRX2RouNXzN+3TVWMerv+QMEMDYude
         ST8mPTQVkDPFQHkWRtGgyGZ9qP4uuiOGsZAR8Louulr4tux55XZp9ABEjJYqJ2stw+Bw
         gwbILVoplddSQB9ojrJYRXlvXhIJ9RdYc39f0+d9GTLM6s0W9AGnflVhfeE0enkYEvdH
         ViJA==
X-Gm-Message-State: AOJu0YwmuKHvUyw4YgrDkkbCKSiT/gKq6DM+8FJ99lGIGTU0EEEScOdl
	aQ28RvjzMRa60RYUy5fykm6EVOyA9nS7tpePFX9feJUj3yxsIJspOwXPIdCYjGX/WGyVcM4fl8c
	jMRZHLA==
X-Gm-Gg: AfdE7cm67W9SGhgdDbriUfYKj2eNSb9uFN0HuK2uRvRBXzoBynETInw/X+MMGdV/vHB
	JkH2e7KLMCZ9dCUJSEVB/ckCozjejBVVT045pI+oY1Q1o2M6ESqK8E+/jFaW4+DzOyXaVdmGA/B
	O2HRw+u3JmErJE/vMMyrE9Y5JqZUiv5OnDu1pEh3gQBG8myB+LM4ubDea9vB58dmfK/jqqeCpUG
	sBRk+ObcuatkffACkzylqEbTPh1la3FYQcq07g9JiBTXOxNzqjh1QICg01DjhrVADdCMJMQLdoq
	nVVRX0jN1mNP3PyBF1oEYpU72qRm91T160REq4wOHgQnKXeGPy9dqgYXJ6BAFBY+8M1RKXe+3Jo
	tRqcbwCKjZQlP55ZuWR5VaicxprnbEfPG4jqKU06SoC/KqQ5hpG+Z0JAjvFGby3RVmgnAngJGOP
	7T7iyOsDmCeLxF9u8Z1hgyQEgrk1J35p0VI94SRz71ngn+o7MZbNVKeHGsaH0PLyC90t4zo5UvQ
	Wyr
X-Received: by 2002:a5d:56c2:0:b0:473:1706:7efe with SMTP id ffacd0b85a97d-47de66b489amr4385109f8f.24.1783435491686;
        Tue, 07 Jul 2026 07:44:51 -0700 (PDT)
Message-ID: <6657fbca-d261-439f-a40d-77b7c1c93696@suse.com>
Date: Tue, 7 Jul 2026 16:44:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/3] x86/mkelf32: re-write ELF notes
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <7a495793-53b1-4681-9c74-fa7e901ccf59@suse.com>
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
In-Reply-To: <7a495793-53b1-4681-9c74-fa7e901ccf59@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-bad1c0/1783435492-571AA986-E6A19B44/0/0
X-purgate-type: clean
X-purgate-size: 5769
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,sourceware.org:url];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1C1871CCA9

64-bit ELF notes generally (sadly with exceptions) are padded to 8-byte
boundaries, whereas 32-bit ELF notes are padded to 4-byte ones. The excess
padding makes it impossible for tools like objdump to properly deal with
these notes.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Is there a need to further generalize or tighten anything?
---
v2: New.

--- a/xen/arch/x86/boot/mkelf32.c
+++ b/xen/arch/x86/boot/mkelf32.c
@@ -8,6 +8,7 @@
  */
 
 #include <errno.h>
+#include <stdbool.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -256,6 +257,8 @@ int main(int argc, char **argv)
     char       buffer[1024] = {};
     int        bytes, todo, i = 1;
     int        num_phdrs = 1;
+    void      *notes32 = NULL;
+    unsigned int note_sz32 = 0;
 
     Elf32_Ehdr in32_ehdr;
 
@@ -359,8 +362,6 @@ int main(int argc, char **argv)
         do_read(infd, &in64_phdr, sizeof(in64_phdr));
         endianadjust_phdr64(&in64_phdr);
 
-        (void)lseek(infd, offset, SEEK_SET);
-
         note_sz = in64_phdr.p_memsz;
         note_base = in64_phdr.p_vaddr - note_base;
 
@@ -373,6 +374,84 @@ int main(int argc, char **argv)
                     offset, offset + dat_siz);
             return 1;
         }
+
+        note_sz32 = note_sz;
+
+        /* Convert 8-byte padded notes to 4-byte padded ones. */
+        if ( in64_phdr.p_align == 8 )
+        {
+            Elf64_Note *notes64 = malloc(note_sz);
+
+            notes32 = malloc(note_sz);
+            if ( notes64 && notes32 )
+            {
+                unsigned int left = note_sz;
+                void *ptr32 = notes32;
+
+                lseek(infd, in64_phdr.p_offset, SEEK_SET);
+                do_read(infd, notes64, note_sz);
+
+                for ( bool start = true; left > sizeof(*notes64); )
+                {
+                    unsigned int size;
+
+                    if ( start && !notes64->namesz )
+                    {
+                        /* Padding. */
+                        notes64 = (void *)(&notes64->namesz + 1);
+                        left -= sizeof(notes64->namesz);
+                        start = false;
+                        continue;
+                    }
+
+                    /*
+                     * The note descriptor may start at either the next 4- or
+                     * 8-byte boundary.  See e.g.
+                     * https://sourceware.org/bugzilla/show_bug.cgi?id=33259.
+                     * For the notes we have actively in use at the time of
+                     * writing, rounding to the next 4-byte boundary is enough
+                     * (and in fact is already excessive: "GNU" and "Xen" as
+                     * note names both satisfy the 8-byte alignment without
+                     * extra effort).
+                     *
+                     * The similar ->descsz aspect is covered by the check
+                     * above.
+                     */
+                    size = ROUNDUP(sizeof(*notes64) + notes64->namesz, 4) +
+                           ROUNDUP(notes64->descsz, 4);
+                    if ( left < size )
+                    {
+                        fprintf(stderr,
+                                "Warning: ELF note overrunning segment (%u bytes left, %u bytes claimed)\n",
+                                left, size);
+                        left = 0;
+                        break;
+                    }
+
+                    /* Leverage Elf{32,64}_Note actually having same layout. */
+                    memcpy(ptr32, notes64, size);
+
+                    notes64 = (void *)notes64 + size;
+                    ptr32 += size;
+                    left -= size;
+                    start = true;
+                }
+
+                if ( left )
+                    fprintf(stderr, "Warning: %u trailing bytes of ELF notes\n",
+                            left);
+
+                note_sz32 = ptr32 - notes32;
+                memset(ptr32, 0, note_sz - note_sz32);
+            }
+            else
+                fprintf(stderr,
+                        "Warning: Not enough memory to re-write %"PRIu32" bytes of ELF notes\n",
+                        note_sz);
+        }
+
+        (void)lseek(infd, offset, SEEK_SET);
+
         /* Gets us the absolute offset within the .text section. */
         offset = in64_phdr.p_offset - offset;
     }
@@ -405,8 +484,8 @@ int main(int argc, char **argv)
         /* Fill out the PT_NOTE program header. */
         note_phdr.p_vaddr   = note_base;
         note_phdr.p_paddr   = note_base;
-        note_phdr.p_filesz  = note_sz;
-        note_phdr.p_memsz   = note_sz;
+        note_phdr.p_filesz  = note_sz32;
+        note_phdr.p_memsz   = note_sz32;
         note_phdr.p_offset  = RAW_OFFSET + offset;
 
         /* Tack on the .note\0 */
@@ -415,7 +494,7 @@ int main(int argc, char **argv)
         out_shdr[2].sh_offset += sizeof(out_shdr_note);
 
         /* Fill out the .note section. */
-        out_shdr_note.sh_size = note_sz;
+        out_shdr_note.sh_size = note_sz32;
         out_shdr_note.sh_addr = note_base;
         out_shdr_note.sh_offset = RAW_OFFSET + offset;
     }
@@ -483,6 +562,17 @@ int main(int argc, char **argv)
         do_write(outfd, buffer, 4 - (bytes & 3));
     }
 
+    if ( notes32 )
+    {
+        lseek(outfd, note_phdr.p_offset, SEEK_SET);
+
+        /*
+         * While we use note_sz32 above, overwrite the full original contents,
+         * to not leave confusing rubbish there.
+         */
+        do_write(outfd, notes32, note_sz);
+    }
+
     close(infd);
     close(outfd);
 


