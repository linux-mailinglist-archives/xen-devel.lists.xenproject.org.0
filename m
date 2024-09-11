Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3B9975218
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:28:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796516.1206146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMSK-0005Wf-1Q; Wed, 11 Sep 2024 12:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796516.1206146; Wed, 11 Sep 2024 12:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMSJ-0005So-UT; Wed, 11 Sep 2024 12:28:19 +0000
Received: by outflank-mailman (input) for mailman id 796516;
 Wed, 11 Sep 2024 12:28:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMSJ-0005SW-9c
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:28:19 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 530ab0f8-7039-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 14:28:18 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5365cc68efaso4800658e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:28:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cf4aa7sm615263966b.176.2024.09.11.05.28.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:28:17 -0700 (PDT)
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
X-Inumbo-ID: 530ab0f8-7039-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726057697; x=1726662497; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GU5uJOFJeV+lLoYSgZiwdkedyXxQBupmKk22qJVGgqc=;
        b=XHn/sVkecVXnSrrERJqDosELedu+DkyevS5chxOwNmfEhRZflaWu6LZfWdoXmwsMg9
         2mcIesGlLT8FSz2ShrOm9+GhZiYKkEye2mdh3x8BjXPgRX/vM2nl81EcjNCzslRjETYw
         yMObusGdp8tmZRNjJ5hQgBThXX7z2omwhcOxjnUGcDl+2FtV7AVOa37TFFYSbKpdaVwW
         usN0aaV1yxo4IUSnM3SxjAAHZWwvXF5MKvpb9aLRhdo6a+qnC/DVkcb51Gthp7gchx1I
         NOBa4j2HppKNJ6EjqgsSrMX9hndFfZsbeOhup/r0m3hOwm4I8l04PnnGmNtR2uq/J63d
         Jg1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057697; x=1726662497;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GU5uJOFJeV+lLoYSgZiwdkedyXxQBupmKk22qJVGgqc=;
        b=NW3lTB9LZv4EYi6i1cDiLX2IM4Y1MxDlcDQgUS5Sk/p5kmHRpXv00CpXGVFkL3Jfct
         DAhLl/ucSB3jYnRt94LhMUNR+Zx2vaOBO7xT7BKiW5nO7XwvZa6QZcm4dWtuGoBnIEB6
         7jgwVA/hWEhFp9Mvns5z5oSE7ZXyndAffvRSDHzyQAAGFO/fLj5wapvCPY+xw+rO4aqM
         xhvjnE429dVnDLuGnolPeMYbiflXEftgMmOqJc/fKaq7V+7vS1cgEQl/WZESvy4pKZxG
         pzDR3e6hHecDvDVETZlkUPIda3agfPn3Fod7LdItzASzYoXa2hANW/zz012TJQhSJNmJ
         4Pgg==
X-Gm-Message-State: AOJu0YzWPH6MHAecPgs/4lB7cVbEBVuZ0oyylhlVNyKSoZMowNaNuxCw
	ftpx8ek1HII5P8aXuOGPfG8gTVQ6j7n4I/ZGaNmCa892+6BZ5TnfrULMycqPL6+RcgYaXulih3Y
	=
X-Google-Smtp-Source: AGHT+IFPE5x4kAcG6OYExYpkdZ3Kff1XuRgrn3sAXugkDl/ggtin8YTOvaRYDhzIvw4RsVHmrS0xoQ==
X-Received: by 2002:a05:6512:33c8:b0:52f:d0f0:e37e with SMTP id 2adb3069b0e04-536587f5e2amr11209565e87.42.1726057697367;
        Wed, 11 Sep 2024 05:28:17 -0700 (PDT)
Message-ID: <706ee6f3-ade8-45b2-adaa-eb7938286c29@suse.com>
Date: Wed, 11 Sep 2024 14:28:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/9] x86/HVM: remove unused MMIO handling code
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
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
In-Reply-To: <dc3faf7d-0690-46e6-8fbc-67a177a1e171@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

All read accesses are rejected by the ->accept handler, while writes
bypass the bulk of the function body. Drop the dead code, leaving an
assertion in the read handler.

A number of other static items (and a macro) are then unreferenced and
hence also need (want) dropping. The same applies to the "latch" field
of the state structure.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -37,26 +37,6 @@
 #define VGA_MEM_BASE 0xa0000
 #define VGA_MEM_SIZE 0x20000
 
-#define PAT(x) (x)
-static const uint32_t mask16[16] = {
-    PAT(0x00000000U),
-    PAT(0x000000ffU),
-    PAT(0x0000ff00U),
-    PAT(0x0000ffffU),
-    PAT(0x00ff0000U),
-    PAT(0x00ff00ffU),
-    PAT(0x00ffff00U),
-    PAT(0x00ffffffU),
-    PAT(0xff000000U),
-    PAT(0xff0000ffU),
-    PAT(0xff00ff00U),
-    PAT(0xff00ffffU),
-    PAT(0xffff0000U),
-    PAT(0xffff00ffU),
-    PAT(0xffffff00U),
-    PAT(0xffffffffU),
-};
-
 /* force some bits to zero */
 static const uint8_t sr_mask[8] = {
     (uint8_t)~0xfc,
@@ -81,25 +61,6 @@ static const uint8_t gr_mask[9] = {
     (uint8_t)~0x00, /* 0x08 */
 };
 
-static uint8_t *vram_getb(struct hvm_hw_stdvga *s, unsigned int a)
-{
-    struct page_info *pg = s->vram_page[(a >> 12) & 0x3f];
-    uint8_t *p = __map_domain_page(pg);
-    return &p[a & 0xfff];
-}
-
-static uint32_t *vram_getl(struct hvm_hw_stdvga *s, unsigned int a)
-{
-    struct page_info *pg = s->vram_page[(a >> 10) & 0x3f];
-    uint32_t *p = __map_domain_page(pg);
-    return &p[a & 0x3ff];
-}
-
-static void vram_put(struct hvm_hw_stdvga *s, void *p)
-{
-    unmap_domain_page(p);
-}
-
 static int stdvga_outb(uint64_t addr, uint8_t val)
 {
     struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
@@ -168,244 +129,13 @@ static int cf_check stdvga_intercept_pio
     return X86EMUL_UNHANDLEABLE; /* propagate to external ioemu */
 }
 
-static unsigned int stdvga_mem_offset(
-    struct hvm_hw_stdvga *s, unsigned int mmio_addr)
-{
-    unsigned int memory_map_mode = (s->gr[6] >> 2) & 3;
-    unsigned int offset = mmio_addr & 0x1ffff;
-
-    switch ( memory_map_mode )
-    {
-    case 0:
-        break;
-    case 1:
-        if ( offset >= 0x10000 )
-            goto fail;
-        offset += 0; /* assume bank_offset == 0; */
-        break;
-    case 2:
-        offset -= 0x10000;
-        if ( offset >= 0x8000 )
-            goto fail;
-        break;
-    default:
-    case 3:
-        offset -= 0x18000;
-        if ( offset >= 0x8000 )
-            goto fail;
-        break;
-    }
-
-    return offset;
-
- fail:
-    return ~0u;
-}
-
-#define GET_PLANE(data, p) (((data) >> ((p) * 8)) & 0xff)
-
-static uint8_t stdvga_mem_readb(uint64_t addr)
-{
-    struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
-    int plane;
-    uint32_t ret, *vram_l;
-    uint8_t *vram_b;
-
-    addr = stdvga_mem_offset(s, addr);
-    if ( addr == ~0u )
-        return 0xff;
-
-    if ( s->sr[4] & 0x08 )
-    {
-        /* chain 4 mode : simplest access */
-        vram_b = vram_getb(s, addr);
-        ret = *vram_b;
-        vram_put(s, vram_b);
-    }
-    else if ( s->gr[5] & 0x10 )
-    {
-        /* odd/even mode (aka text mode mapping) */
-        plane = (s->gr[4] & 2) | (addr & 1);
-        vram_b = vram_getb(s, ((addr & ~1) << 1) | plane);
-        ret = *vram_b;
-        vram_put(s, vram_b);
-    }
-    else
-    {
-        /* standard VGA latched access */
-        vram_l = vram_getl(s, addr);
-        s->latch = *vram_l;
-        vram_put(s, vram_l);
-
-        if ( !(s->gr[5] & 0x08) )
-        {
-            /* read mode 0 */
-            plane = s->gr[4];
-            ret = GET_PLANE(s->latch, plane);
-        }
-        else
-        {
-            /* read mode 1 */
-            ret = (s->latch ^ mask16[s->gr[2]]) & mask16[s->gr[7]];
-            ret |= ret >> 16;
-            ret |= ret >> 8;
-            ret = (~ret) & 0xff;
-        }
-    }
-
-    return ret;
-}
-
 static int cf_check stdvga_mem_read(
     const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
     uint64_t *p_data)
 {
-    uint64_t data = ~0UL;
-
-    switch ( size )
-    {
-    case 1:
-        data = stdvga_mem_readb(addr);
-        break;
-
-    case 2:
-        data = stdvga_mem_readb(addr);
-        data |= stdvga_mem_readb(addr + 1) << 8;
-        break;
-
-    case 4:
-        data = stdvga_mem_readb(addr);
-        data |= stdvga_mem_readb(addr + 1) << 8;
-        data |= stdvga_mem_readb(addr + 2) << 16;
-        data |= (uint32_t)stdvga_mem_readb(addr + 3) << 24;
-        break;
-
-    case 8:
-        data =  (uint64_t)(stdvga_mem_readb(addr));
-        data |= (uint64_t)(stdvga_mem_readb(addr + 1)) << 8;
-        data |= (uint64_t)(stdvga_mem_readb(addr + 2)) << 16;
-        data |= (uint64_t)(stdvga_mem_readb(addr + 3)) << 24;
-        data |= (uint64_t)(stdvga_mem_readb(addr + 4)) << 32;
-        data |= (uint64_t)(stdvga_mem_readb(addr + 5)) << 40;
-        data |= (uint64_t)(stdvga_mem_readb(addr + 6)) << 48;
-        data |= (uint64_t)(stdvga_mem_readb(addr + 7)) << 56;
-        break;
-
-    default:
-        gdprintk(XENLOG_WARNING, "invalid io size: %u\n", size);
-        break;
-    }
-
-    *p_data = data;
-    return X86EMUL_OKAY;
-}
-
-static void stdvga_mem_writeb(uint64_t addr, uint32_t val)
-{
-    struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
-    int plane, write_mode, b, func_select, mask;
-    uint32_t write_mask, bit_mask, set_mask, *vram_l;
-    uint8_t *vram_b;
-
-    addr = stdvga_mem_offset(s, addr);
-    if ( addr == ~0u )
-        return;
-
-    if ( s->sr[4] & 0x08 )
-    {
-        /* chain 4 mode : simplest access */
-        plane = addr & 3;
-        mask = (1 << plane);
-        if ( s->sr[2] & mask )
-        {
-            vram_b = vram_getb(s, addr);
-            *vram_b = val;
-            vram_put(s, vram_b);
-        }
-    }
-    else if ( s->gr[5] & 0x10 )
-    {
-        /* odd/even mode (aka text mode mapping) */
-        plane = (s->gr[4] & 2) | (addr & 1);
-        mask = (1 << plane);
-        if ( s->sr[2] & mask )
-        {
-            addr = ((addr & ~1) << 1) | plane;
-            vram_b = vram_getb(s, addr);
-            *vram_b = val;
-            vram_put(s, vram_b);
-        }
-    }
-    else
-    {
-        write_mode = s->gr[5] & 3;
-        switch ( write_mode )
-        {
-        default:
-        case 0:
-            /* rotate */
-            b = s->gr[3] & 7;
-            val = ((val >> b) | (val << (8 - b))) & 0xff;
-            val |= val << 8;
-            val |= val << 16;
-
-            /* apply set/reset mask */
-            set_mask = mask16[s->gr[1]];
-            val = (val & ~set_mask) | (mask16[s->gr[0]] & set_mask);
-            bit_mask = s->gr[8];
-            break;
-        case 1:
-            val = s->latch;
-            goto do_write;
-        case 2:
-            val = mask16[val & 0x0f];
-            bit_mask = s->gr[8];
-            break;
-        case 3:
-            /* rotate */
-            b = s->gr[3] & 7;
-            val = (val >> b) | (val << (8 - b));
-
-            bit_mask = s->gr[8] & val;
-            val = mask16[s->gr[0]];
-            break;
-        }
-
-        /* apply logical operation */
-        func_select = s->gr[3] >> 3;
-        switch ( func_select )
-        {
-        case 0:
-        default:
-            /* nothing to do */
-            break;
-        case 1:
-            /* and */
-            val &= s->latch;
-            break;
-        case 2:
-            /* or */
-            val |= s->latch;
-            break;
-        case 3:
-            /* xor */
-            val ^= s->latch;
-            break;
-        }
-
-        /* apply bit mask */
-        bit_mask |= bit_mask << 8;
-        bit_mask |= bit_mask << 16;
-        val = (val & bit_mask) | (s->latch & ~bit_mask);
-
-    do_write:
-        /* mask data according to sr[2] */
-        mask = s->sr[2];
-        write_mask = mask16[mask];
-        vram_l = vram_getl(s, addr);
-        *vram_l = (*vram_l & ~write_mask) | (val & write_mask);
-        vram_put(s, vram_l);
-    }
+    ASSERT_UNREACHABLE();
+    *p_data = ~0;
+    return X86EMUL_UNHANDLEABLE;
 }
 
 static int cf_check stdvga_mem_write(
@@ -420,47 +150,8 @@ static int cf_check stdvga_mem_write(
         .dir = IOREQ_WRITE,
         .data = data,
     };
-    struct ioreq_server *srv;
-
-    goto done;
-
-    /* Intercept mmio write */
-    switch ( size )
-    {
-    case 1:
-        stdvga_mem_writeb(addr, (data >>  0) & 0xff);
-        break;
-
-    case 2:
-        stdvga_mem_writeb(addr+0, (data >>  0) & 0xff);
-        stdvga_mem_writeb(addr+1, (data >>  8) & 0xff);
-        break;
-
-    case 4:
-        stdvga_mem_writeb(addr+0, (data >>  0) & 0xff);
-        stdvga_mem_writeb(addr+1, (data >>  8) & 0xff);
-        stdvga_mem_writeb(addr+2, (data >> 16) & 0xff);
-        stdvga_mem_writeb(addr+3, (data >> 24) & 0xff);
-        break;
-
-    case 8:
-        stdvga_mem_writeb(addr+0, (data >>  0) & 0xff);
-        stdvga_mem_writeb(addr+1, (data >>  8) & 0xff);
-        stdvga_mem_writeb(addr+2, (data >> 16) & 0xff);
-        stdvga_mem_writeb(addr+3, (data >> 24) & 0xff);
-        stdvga_mem_writeb(addr+4, (data >> 32) & 0xff);
-        stdvga_mem_writeb(addr+5, (data >> 40) & 0xff);
-        stdvga_mem_writeb(addr+6, (data >> 48) & 0xff);
-        stdvga_mem_writeb(addr+7, (data >> 56) & 0xff);
-        break;
-
-    default:
-        gdprintk(XENLOG_WARNING, "invalid io size: %u\n", size);
-        break;
-    }
+    struct ioreq_server *srv = ioreq_server_select(current->domain, &p);
 
- done:
-    srv = ioreq_server_select(current->domain, &p);
     if ( !srv )
         return X86EMUL_UNHANDLEABLE;
 
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -115,7 +115,6 @@ struct hvm_hw_stdvga {
     uint8_t sr[8];
     uint8_t gr_index;
     uint8_t gr[9];
-    uint32_t latch;
     struct page_info *vram_page[64];  /* shadow of 0xa0000-0xaffff */
     spinlock_t lock;
 };


