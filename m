Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A6F973A8B
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:50:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795735.1205212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2C6-0000Er-4N; Tue, 10 Sep 2024 14:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795735.1205212; Tue, 10 Sep 2024 14:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2C6-0000Dv-1m; Tue, 10 Sep 2024 14:50:14 +0000
Received: by outflank-mailman (input) for mailman id 795735;
 Tue, 10 Sep 2024 14:50:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so23X-0004pU-7G
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:41:23 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bde4e3e4-6f82-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 16:41:19 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d13b83511so447664866b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:41:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cf6a88sm486405666b.182.2024.09.10.07.41.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:41:18 -0700 (PDT)
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
X-Inumbo-ID: bde4e3e4-6f82-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725979279; x=1726584079; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+an3treqQP08FQ/4v2IVBHHJXdUo5OxtUySraZtU00s=;
        b=WWwGVS1FzMJ/Tp0id/F3+q5kpu1CqdJk/NytjTKpFQWVwHuCeNfJv/HBfMnVtLuUs8
         uI3A2Dy+GexWZEFONjHPHh5FYWC5Wih5WaQ3Xh5grWRRNd1gTJiiZrjHd/9HhuXWKmN6
         bWulY2mQsAVGg8vQfWONpce7aER/IHSPz7oKX5ebEt6gHhGz775jr7fEWdB359N+638r
         WlSUq6M0sA6xxd/obtp5BvIU4bjm62uJzXSTuuh+6JCdqNyK8d6BWMh/wcNJwLPfrUoS
         2pd65FzRKBUy6ZfiNkz6VAgNhZxT3lEtDXnqyBJh5a/zPAyyl56Ae1WtRLvr0PCMI2AZ
         FUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979279; x=1726584079;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+an3treqQP08FQ/4v2IVBHHJXdUo5OxtUySraZtU00s=;
        b=bAxsSkvN/R8AzdJ/QaFZ4HBDVQ5telu7Rtx6d2tm1NcVkm7G13C7uNmOrt1AVg8mFj
         S7LDIAvQE1eCQ6rDBVP9UecYcJ6M4vXHncdeQxBXeOn1rOFxgVvUCADgfoVaLY0NjXl/
         Js/BXwnw7sicQx5vD46BVx9tpVBneeGn7PyHmPtMh2ErJxt7pQ3BtCvH1ZR2euMIolyL
         vBVw2srRwiRbVgkoL/7eMgv/0fQLD4YE3vfOg4LbsPbzkfaXeZoQSUd1wWSCFqjliO3q
         7ptY58KnlEN4oBs9LsB0jLtk8wvEi+iBFYxUYrL3UPg8KU2hWMQgiGArNoEAscSDFr1y
         AjDQ==
X-Gm-Message-State: AOJu0YwcIdw/dc5Xu6r2edfirYbZ06XN/IGcwTY/9Hi6OqImqd1hq4qT
	VXibXmyS2y6pK8sgBQqP5vUE1EgS1ZiuAnft7wRifOSHeiFj7hDu+GlBSTQ60B2rTsRE6yUibH0
	=
X-Google-Smtp-Source: AGHT+IEL43VKLBgnsb/rYvhsWFRr2S0ZOZER3ChseZVfzNKPzJNE38MkCxUMvUjCV5fUJnkaoPwasw==
X-Received: by 2002:a17:907:3f96:b0:a77:cbe5:413f with SMTP id a640c23a62f3a-a8ffaaa6494mr107386766b.4.1725979278891;
        Tue, 10 Sep 2024 07:41:18 -0700 (PDT)
Message-ID: <64883365-9ed1-45d4-a586-90b488480a82@suse.com>
Date: Tue, 10 Sep 2024 16:41:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/7] x86/HVM: drop stdvga's "{g,s}r_index" struct members
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

No consumers are left, hence the producer and the fields themselves can
also go away. stdvga_outb() is then useless, rendering stdvga_out()
useless as well. Hence the entire I/O port intercept can go away.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -197,11 +141,6 @@ void stdvga_init(struct domain *d)
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


