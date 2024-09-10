Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C75B973A1A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795694.1205143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so21o-0001vY-SG; Tue, 10 Sep 2024 14:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795694.1205143; Tue, 10 Sep 2024 14:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so21o-0001tR-P9; Tue, 10 Sep 2024 14:39:36 +0000
Received: by outflank-mailman (input) for mailman id 795694;
 Tue, 10 Sep 2024 14:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so21n-0001bT-DI
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:39:35 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ebd2ceb-6f82-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 16:39:33 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2f762de00e5so34228641fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:39:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76fc4sm4375114a12.78.2024.09.10.07.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:39:32 -0700 (PDT)
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
X-Inumbo-ID: 7ebd2ceb-6f82-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725979173; x=1726583973; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WaFqEYBzQE2LZt1yiChdk7M33TQSnb66DPUTwVLJkXU=;
        b=EA4YfYQTs3jhHxD1jaxlM87VUbWYRi8iM9rknms/11PGjaf2NwgGbapUs2Qtp5q8v1
         7lP3advB+iH1khvT8LW/MVV0opGHDLlgDz23rdX3OZPKwdsv5TAr2Eud8FSjjJ2nSgUU
         AVivvrfg4y3UwSOH92h+G9PdOq3naejA4eZYwnlG9twdFbynVebdpNp5Ewa7gpDEmdaV
         m+ns0XoDKzKHxVudxwBkgQzz8Uj83dljnmiuUoBaaEYAfxxI89qjAYcMEFdymHaAEpyV
         R44JU6tojJlf5WWOGbyWB/GLIEkXYOn6nRVgi4j3nm7vvJPC84C7W8YcYrvdxEMAfX0i
         7bDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979173; x=1726583973;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WaFqEYBzQE2LZt1yiChdk7M33TQSnb66DPUTwVLJkXU=;
        b=Xf8J7QRBtt1L4D1dJSPu6nW/GXUipOsLNgRUz8FGmc5cpbI9fDRJ2w8Dl4HKnaQrYW
         TQTrkQVnMAG+ZnOYkncUO+GccI6zxYu2iuWsf0K/vJYgi7tUJU6V+e+tbTtbn0YcAjpu
         NO2h5JKTPJUrLc/0waXmeLP7G2FYTjLszY5zi/q34Z5ITrYnKeNS3cNrwD/FYdd7Zck8
         MKoIsSiF0HL1QkaWPIaY8+k5OjD6a6zOgAFKMOlm2aHIB06bLVS5JrS/AW0lopXdgsl+
         hil7Ux091jed1H1+iSdmNK7+BaCmXVlCMWKJxIjHjF9THLw/a9yTH8Wg0EEZ/m5eaZw+
         IVZQ==
X-Gm-Message-State: AOJu0Yx90agrYH4Zl7wFtms7PboNXGrNLOAJrgzJK6S3j8URS81JcwAQ
	zg8mC6RJb1DcT0PLiyE5PiUHSS9OkdFSFHir2EOoncHpUvD9R++NB9JVwwPbrLc/sRPB0AgDtdE
	=
X-Google-Smtp-Source: AGHT+IFSCzl4iBLY+y+n9/z19AaESU/S34kdkDp2DtKEavTSy+WC3SyBDXLlXFJ6wIKYZ2GzrOMFiA==
X-Received: by 2002:a2e:b8c7:0:b0:2ef:22ad:77b5 with SMTP id 38308e7fff4ca-2f751f69abcmr114228481fa.29.1725979172793;
        Tue, 10 Sep 2024 07:39:32 -0700 (PDT)
Message-ID: <cfbeff6c-569f-4f3b-8ea1-fc3ca36dbc65@suse.com>
Date: Tue, 10 Sep 2024 16:39:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/7] x86/HVM: drop stdvga's "cache" struct member
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
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
In-Reply-To: <cd97dd61-c75c-4ab6-b36f-b2b035c4a564@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

As of 68e1183411be ("libxc: introduce a xc_dom_arch for hvm-3.0-x86_32
guests") caching mode is disabled for HVM domains from start-of-day, due
the disabling being unconditional in hvm/save.c:arch_hvm_load(). With
that the field is useless, and can be dropped. Drop the helper functions
manipulating / checking as well right away, but leave the use sites of
stdvga_cache_is_enabled() with the hard-coded result the function would
have produced, to aid validation of subsequent dropping of further code.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -69,9 +69,6 @@ static void arch_hvm_load(struct domain
 
     /* Time when restore started  */
     d->arch.hvm.sync_tsc = rdtsc();
-
-    /* VGA state is not saved/restored, so we nobble the cache. */
-    d->arch.hvm.stdvga.cache = STDVGA_CACHE_DISABLED;
 }
 
 /* List of handlers for various HVM save and restore types */
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -100,37 +100,6 @@ static void vram_put(struct hvm_hw_stdvg
     unmap_domain_page(p);
 }
 
-static void stdvga_try_cache_enable(struct hvm_hw_stdvga *s)
-{
-    /*
-     * Caching mode can only be enabled if the the cache has
-     * never been used before. As soon as it is disabled, it will
-     * become out-of-sync with the VGA device model and since no
-     * mechanism exists to acquire current VRAM state from the
-     * device model, re-enabling it would lead to stale data being
-     * seen by the guest.
-     */
-    if ( s->cache != STDVGA_CACHE_UNINITIALIZED )
-        return;
-
-    gdprintk(XENLOG_INFO, "entering caching mode\n");
-    s->cache = STDVGA_CACHE_ENABLED;
-}
-
-static void stdvga_cache_disable(struct hvm_hw_stdvga *s)
-{
-    if ( s->cache != STDVGA_CACHE_ENABLED )
-        return;
-
-    gdprintk(XENLOG_INFO, "leaving caching mode\n");
-    s->cache = STDVGA_CACHE_DISABLED;
-}
-
-static bool stdvga_cache_is_enabled(const struct hvm_hw_stdvga *s)
-{
-    return s->cache == STDVGA_CACHE_ENABLED;
-}
-
 static int stdvga_outb(uint64_t addr, uint8_t val)
 {
     struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
@@ -170,7 +139,6 @@ static int stdvga_outb(uint64_t addr, ui
     if ( !prev_stdvga && s->stdvga )
     {
         gdprintk(XENLOG_INFO, "entering stdvga mode\n");
-        stdvga_try_cache_enable(s);
     }
     else if ( prev_stdvga && !s->stdvga )
     {
@@ -468,7 +436,7 @@ static int cf_check stdvga_mem_write(
     };
     struct ioreq_server *srv;
 
-    if ( !stdvga_cache_is_enabled(s) || !s->stdvga )
+    if ( true || !s->stdvga )
         goto done;
 
     /* Intercept mmio write */
@@ -536,18 +504,12 @@ static bool cf_check stdvga_mem_accept(
          * We cannot return X86EMUL_UNHANDLEABLE on anything other then the
          * first cycle of an I/O. So, since we cannot guarantee to always be
          * able to send buffered writes, we have to reject any multi-cycle
-         * I/O and, since we are rejecting an I/O, we must invalidate the
-         * cache.
-         * Single-cycle write transactions are accepted even if the cache is
-         * not active since we can assert, when in stdvga mode, that writes
-         * to VRAM have no side effect and thus we can try to buffer them.
+         * I/O.
          */
-        stdvga_cache_disable(s);
-
         goto reject;
     }
     else if ( p->dir == IOREQ_READ &&
-              (!stdvga_cache_is_enabled(s) || !s->stdvga) )
+              (true || !s->stdvga) )
         goto reject;
 
     /* s->lock intentionally held */
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -110,19 +110,12 @@ struct vpci_arch_msix_entry {
     int pirq;
 };
 
-enum stdvga_cache_state {
-    STDVGA_CACHE_UNINITIALIZED,
-    STDVGA_CACHE_ENABLED,
-    STDVGA_CACHE_DISABLED
-};
-
 struct hvm_hw_stdvga {
     uint8_t sr_index;
     uint8_t sr[8];
     uint8_t gr_index;
     uint8_t gr[9];
     bool stdvga;
-    enum stdvga_cache_state cache;
     uint32_t latch;
     struct page_info *vram_page[64];  /* shadow of 0xa0000-0xaffff */
     spinlock_t lock;


