Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34C39BCE66
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 14:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830243.1245177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8K36-0003uz-Ep; Tue, 05 Nov 2024 13:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830243.1245177; Tue, 05 Nov 2024 13:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8K36-0003sw-Bw; Tue, 05 Nov 2024 13:56:48 +0000
Received: by outflank-mailman (input) for mailman id 830243;
 Tue, 05 Nov 2024 13:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqUC=SA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8K35-0003sq-6u
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 13:56:47 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca4ce850-9b7d-11ef-a0c5-8be0dac302b0;
 Tue, 05 Nov 2024 14:56:44 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-37d43a9bc03so3739455f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 05:56:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd9a9a53sm218113865e9.30.2024.11.05.05.56.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 05:56:43 -0800 (PST)
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
X-Inumbo-ID: ca4ce850-9b7d-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzUiLCJoZWxvIjoibWFpbC13cjEteDQzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImNhNGNlODUwLTliN2QtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODE1MDA0LjEzNjQ0Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730815004; x=1731419804; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfZ+UeYj+bJxihuwa6M3uSLAGfb4Hl4ju6KISLMCXMM=;
        b=SL6oHW6hzwJWXH3jkqZzUPMCTLxEP1/fcCIwnq6VgAlbMObIa3z/kqDNUKNX2MAFI3
         VQq84tLJbMlg3q/r7wB0Cdymv7QRb1v1L4ZPj/EfKciSUP3XcJQXZdupxljPhY6Wknx4
         nuqASMhPTXYELt3thmf7HQZvzJfH5AvrkY1CI1Y4oOA5EzTht9rg3XO5NvhzTiHchbvn
         zoTxyS/vaNkRwkIN2aQ4hSwP3Z/gTxtW/EDiLy9EMsyEmoPlT5d63UsbOR0uvSYkMBx9
         r/5sS4cE3cKc/4kGLeCbvA2dNU2MLGfefHmHKB6jlzWqT9rOnu0cx39z+O5x7vDErCcx
         CaqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730815004; x=1731419804;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pfZ+UeYj+bJxihuwa6M3uSLAGfb4Hl4ju6KISLMCXMM=;
        b=D+qyAvBEC9nC8csbx4mYvVXy0vF22gqXiBhARScCCcKZEuoSDAHNhhvcsRUbGP/EIi
         264rZ/a929/DDCmKwMKilNYzslFszZZIEjQyKIAjVjQSAH+ijEIOLkEF9HbOLawZlTzI
         4asxqDPxULXHeZh6cUlId8ETivSb3qNeYF+fK1U0t/F1vZWqmQPvAjKLPhqlDWCYpRFf
         OzDIkjE6DlhJJnJCUzTPOYw/esg46Ftln8uYUFURU3Z3K1BOqvazLUCR0aPZd3xm8pa6
         44oGpiuiCR/riub9mAAzNxQxxLdUY5Zqu2ERhLOE9jPsandaubqca00X3550zNH5jP3B
         xGvQ==
X-Gm-Message-State: AOJu0Yy5PsulZ0Tr2dRZKpzH0g9M42jDR6Aab308V85YUCL9wOKrts2Z
	or6poIxmGg5WGgxubv1ThfEM1wzNg5qY7erctxRP170sYxBxFyMuR1vV62p+hmjdzCOqy5TC7Oo
	=
X-Google-Smtp-Source: AGHT+IETFyL1eq6hZ6r5qv9ZNjWhBJBWwhWurrQxX1VCDwppsP/H65RLcVhbyGJKTycRd4yF770tqA==
X-Received: by 2002:a05:6000:1541:b0:37c:cee9:4684 with SMTP id ffacd0b85a97d-381c7a5d493mr12483664f8f.14.1730815003608;
        Tue, 05 Nov 2024 05:56:43 -0800 (PST)
Message-ID: <a537dd1e-bbd3-4ef8-8014-6bb432484c57@suse.com>
Date: Tue, 5 Nov 2024 14:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/PV: further harden guest memory accesses against
 speculative abuse
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

The original implementation has two issues: For one it doesn't preserve
non-canonical-ness of inputs in the range 0x8000000000000000 through
0x80007fffffffffff. Bogus guest pointers in that range would not cause a
(#GP) fault upon access, when they should.

And then there is an AMD-specific aspect, where only the low 48 bits of
an address are used for speculative execution; the architecturally
mandated #GP for non-canonical addresses would be raised at a later
execution stage. Therefore to prevent Xen controlled data to make it
into any of the caches in a guest controllable manner, we need to
additionally ensure that for non-canonical inputs bit 47 would be clear.

See the code comment for how addressing both is being achieved.

Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: Two variants of part of the logic are being presented, both with
     certain undesirable aspects: The first form is pretty large and
     ugly (some improvement may be possible by introducing further
     helper macros). The alternative form continues to use RCR, which
     generally would be nice to do away with. Then again that's also
     slightly smaller generated code.

RFC: The .irp/.irpc/.if constructs used in variant 1 will need checking
     as to them working with old gas as well as Clang.

RFC: When the scratch registers aren't %r8...%r15, several unnecessary
     REX prefixes are emitted, as users of the macro pass in 64-bit
     registers. Similar to what's done to be able to use SETcc, we could
     derive %e.. from %r.. to shrink code size some. (An alternative,
     requiring to touch the use sites, would be to constrain the scratch
     registers to AX...DI and pass in only the last two characters of
     the names [e.g. "di", i.e. also without the leading %]. That would
     make it straightforward to use both %r.. and %e.. at the same time.

RFC: If code size was of concern, then in variant 1 the XOR could in
     principle be omitted.

--- a/xen/arch/x86/include/asm/asm-defns.h
+++ b/xen/arch/x86/include/asm/asm-defns.h
@@ -1,3 +1,5 @@
+#include <asm/page-bits.h>
+
 #ifndef HAVE_AS_CLAC_STAC
 .macro clac
     .byte 0x0f, 0x01, 0xca
@@ -65,17 +67,55 @@
 .macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
 #if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
     /*
-     * Here we want
-     *
-     * ptr &= ~0ull >> (ptr < HYPERVISOR_VIRT_END);
-     *
+     * Here we want to adjust \ptr such that
+     * - if it's within Xen range, it becomes non-canonical,
+     * - otherwise if it's (non-)canonical on input, it retains that property,
+     * - if the result is non-canonical, bit 47 is clear (to avoid
+     *   potentially populating the cache with Xen data),
      * but guaranteed without any conditional branches (hence in assembly).
+     *
+     * To achieve this we determine which bit to forcibly clear: Either bit 47
+     * (in case the address is below HYPERVISOR_VIRT_END) or bit 63.  Further
+     * we determine whether for forcably set bit 63: In case we first cleared
+     * it, we'll merely restore the original address.  In case we ended up
+     * clearing bit 47 (i.e. the address was either non-canonical or within Xen
+     * range), setting the bit will yield a guaranteed non-canonical address.
+     * If we didn't clear a bit, we also won't set one: The address was in the
+     * low half of address space in that case with bit 47 already clear.  The
+     * address can thus be left unchanged, whether canonical or not.
      */
     mov $(HYPERVISOR_VIRT_END - 1), \scratch1
-    mov $~0, \scratch2
+    mov $(VADDR_BITS - 1), \scratch2
     cmp \ptr, \scratch1
+    /*
+     * Not needed: The value we have in \scratch1 will be truncated to 6 bits,
+     * thus yielding the value we need.
+    mov $63, \scratch1
+     */
+    cmovnb \scratch2, \scratch1
+    xor \scratch2, \scratch2
+    btr \scratch1, \ptr
+ .if 1
+ .irpc r, "acdb"
+  .if \scratch2 == %r\r\(\(x))
+     setc %\r\(\(l))
+  .endif
+ .endr
+ .irp r, bp, si, di
+  .if \scratch2 == %r\r
+     setc %\r\(\(l))
+  .endif
+ .endr
+ .irp r, 8, 9, 10, 11, 12, 13, 14, 15
+  .if \scratch2 == %r\r
+     setc   %r\r\(\(b))
+  .endif
+ .endr
+    shl $63, \scratch2
+ .else
     rcr $1, \scratch2
-    and \scratch2, \ptr
+ .endif
+    or \scratch2, \ptr
 #elif defined(CONFIG_DEBUG) && defined(CONFIG_PV)
     xor $~\@, \scratch1
     xor $~\@, \scratch2

