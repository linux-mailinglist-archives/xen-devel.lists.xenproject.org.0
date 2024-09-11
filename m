Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48405975229
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796531.1206176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMTH-0007D9-RH; Wed, 11 Sep 2024 12:29:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796531.1206176; Wed, 11 Sep 2024 12:29:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMTH-0007Aw-OJ; Wed, 11 Sep 2024 12:29:19 +0000
Received: by outflank-mailman (input) for mailman id 796531;
 Wed, 11 Sep 2024 12:29:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMTF-0006QZ-Lj
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:29:17 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7587ce88-7039-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 14:29:16 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so450631a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:29:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd467a7sm5299158a12.28.2024.09.11.05.29.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:29:15 -0700 (PDT)
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
X-Inumbo-ID: 7587ce88-7039-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726057755; x=1726662555; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P1wMR2Ky0D0RnS1CWW7K/sEuXU8VTiVbDfI8MfIKm1k=;
        b=D2hQM92cbnida/3ir7FlXv1QdqeueVzJkB9I9KEAxy044pQ6/8wUvBn9maXsyv2udc
         xb3QPR9rtilZC5TqHj62IZyPMOTnvEClnR+RoIEYZFO2TZBebtBzmwx54Q9WC67BrTBw
         v2RoIVszIOeLHrctiDHxKAaHP+1gyBHCwdjnl8iUL1jb8AN0Q1kfiiQicT75VtZd6m/j
         IbkenL4pri5/CXFFRcXcoaST/lGZ6JY4qIJDZ1JpRdgsd/5PaRyPJ0OoHCdwnBLoui97
         2iU2csnKvDMr19jmU/axRCHJwYhUSwaEzEfqtlgvTkJSpvRsQbZM4He0875V0TIcXKYV
         /GzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057755; x=1726662555;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1wMR2Ky0D0RnS1CWW7K/sEuXU8VTiVbDfI8MfIKm1k=;
        b=Ba4uD5aZvWQAD0SbZ2qbml5z2M4NROGOPfBeAnIS/KUqig22VZ/SVg08hMwvtW8IUu
         tbxOI5hhkHp0ZQmM8DwpMCxVk93rRrZngyjgzINC96iq2cdDLnvE0mDB4wHtQ89rqMss
         DcA/rFm5P3IOzpZe328XEzc9I9IkfxFvoLjthtdvrStxjRut3kUwvJxIizMTS9WfCGc+
         1efwFZhggikYR5swKUBtzDK/MNZwiHhJX9gzTB1CUkiJoR7tvspfSQhlBRrAsuXFmhcs
         WSB9OC/22wWxpD6kRFTia3jQWDj9a3yH8egpyOIZlVm+Mk6L/sILvAo/cNrc0X6ZS7x0
         Hb2g==
X-Gm-Message-State: AOJu0YxH4XzLp+AucLYld/6dTIQNhBOK3fB1boh+ff3guzzZyuFmHLG5
	xIQIqVNmzCfpx+RvH6EXL+1kjPwiSdGIhNUfUd+5+fCxobfZRfyxyHFgtVNhShJD0/RMuGetEQ8
	=
X-Google-Smtp-Source: AGHT+IG9u2CdxuO+LSS0wREJWb2P7n3FmHd/ldLRyyc0oFEeWfNT94Sj/OO4v6pgFjA/nWAYwsSSXw==
X-Received: by 2002:a05:6402:50c8:b0:5c2:e888:4cf4 with SMTP id 4fb4d7f45d1cf-5c40159115dmr6896227a12.0.1726057755447;
        Wed, 11 Sep 2024 05:29:15 -0700 (PDT)
Message-ID: <1334352a-4f10-4f32-962b-834db166a0c3@suse.com>
Date: Wed, 11 Sep 2024 14:29:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 6/9] x86/HVM: drop stdvga's "{g,s}r_index" struct members
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

No consumers are left, hence the producer and the fields themselves can
also go away. stdvga_outb() is then useless, rendering stdvga_out()
useless as well. Hence the entire I/O port intercept can go away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -37,62 +37,6 @@
 #define VGA_MEM_BASE 0xa0000
 #define VGA_MEM_SIZE 0x20000
 
-static int stdvga_outb(uint64_t addr, uint8_t val)
-{
-    struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
-    int rc = 1;
-
-    switch ( addr )
-    {
-    case 0x3c4:                 /* sequencer address register */
-        s->sr_index = val;
-        break;
-
-    case 0x3ce:                 /* graphics address register */
-        s->gr_index = val;
-        break;
-
-    default:
-        rc = 0;
-        break;
-    }
-
-    return rc;
-}
-
-static void stdvga_out(uint32_t port, uint32_t bytes, uint32_t val)
-{
-    switch ( bytes )
-    {
-    case 1:
-        stdvga_outb(port, val);
-        break;
-
-    case 2:
-        stdvga_outb(port + 0, val >> 0);
-        stdvga_outb(port + 1, val >> 8);
-        break;
-
-    default:
-        break;
-    }
-}
-
-static int cf_check stdvga_intercept_pio(
-    int dir, unsigned int port, unsigned int bytes, uint32_t *val)
-{
-    struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
-
-    if ( dir == IOREQ_WRITE )
-    {
-        spin_lock(&s->lock);
-        stdvga_out(port, bytes, *val);
-        spin_unlock(&s->lock);
-    }
-
-    return X86EMUL_UNHANDLEABLE; /* propagate to external ioemu */
-}
-
 static int cf_check stdvga_mem_read(
     const struct hvm_io_handler *handler, uint64_t addr, uint32_t size,
     uint64_t *p_data)
@@ -194,11 +138,6 @@ void stdvga_init(struct domain *d)
     {
         struct hvm_io_handler *handler;
 
-        /* Sequencer registers. */
-        register_portio_handler(d, 0x3c4, 2, stdvga_intercept_pio);
-        /* Graphics registers. */
-        register_portio_handler(d, 0x3ce, 2, stdvga_intercept_pio);
-
         /* VGA memory */
         handler = hvm_next_io_handler(d);
 
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -111,8 +111,6 @@ struct vpci_arch_msix_entry {
 };
 
 struct hvm_hw_stdvga {
-    uint8_t sr_index;
-    uint8_t gr_index;
     struct page_info *vram_page[64];  /* shadow of 0xa0000-0xaffff */
     spinlock_t lock;
 };


