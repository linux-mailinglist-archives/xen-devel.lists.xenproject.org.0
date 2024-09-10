Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB808973A8A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:50:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795737.1205222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2CB-0000XQ-F0; Tue, 10 Sep 2024 14:50:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795737.1205222; Tue, 10 Sep 2024 14:50:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2CB-0000VY-BS; Tue, 10 Sep 2024 14:50:19 +0000
Received: by outflank-mailman (input) for mailman id 795737;
 Tue, 10 Sep 2024 14:50:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so23u-0003oG-Lv
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:41:46 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdd31445-6f82-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:41:46 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so380231166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:41:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835abbsm490822066b.9.2024.09.10.07.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:41:45 -0700 (PDT)
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
X-Inumbo-ID: cdd31445-6f82-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725979305; x=1726584105; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=T0HPYysww8NjDfVR7D5Ro3dCBVCxnKMFK0Vtc+tPX5w=;
        b=eaQJdsoexvkMGtDwj5bfYncZmc59lP5n3+fJR/FQTaueX/AzVAscr0e2JZuCftAjqU
         oUUlL6Hhkki1fMPnJWaoClUNVMxAaCGW1G6SXnuCoQFSe/7ECfJ6FkFoMgMSPYp33LOq
         T9uOgwZMiOAWSwhkc1ylcCDWK85uSTj1bHj9Plb9y+RxNZmWE5wn2BF+YO7tRf7W1vZc
         woChaGKwMF3x/5OuaLHEovoHPgNgVrh9dVjBP10dLFjqFQF0IT1WV95Jb8nKtxsGjVZC
         SBO/EFxdWXqA9AUk6o54TVA4bRoHKDGILnwZmm0wIU9CHTXfxaYwZPzRcbLcA9Uht2pe
         cc+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725979305; x=1726584105;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T0HPYysww8NjDfVR7D5Ro3dCBVCxnKMFK0Vtc+tPX5w=;
        b=wT8SJ7o/T6qM0gBEtQLe2hCExHKCMl9zZ0bRjlDmGAIvjx8FiL3IByXWFxsdWqIn/m
         CwHCQT1M1deO7iFvxXCyWRtB+Pk+rbUffxpDgxKf0j89zegYIO6u7OhivtBStpWy4HLe
         WC8ERQncEcYvJDb0gu2LK3wNyXYeSp5OIab0vXyFIxbKwQJkZPBMEOVBCK7UjYBYRZ9E
         HaS5VHZTNBGFKhtEAax6RyLUgAXQLWwBoP0Vvfo+yYdcfqyC9pRTRKTigTxbmGxCPBGl
         5unwhn9PpS33V0lXj5GH2jXm/9TIKRu8DOH7RrO0r4w+NP/HjBpjqTcHz95YJuyJK147
         ovpQ==
X-Gm-Message-State: AOJu0Yz9XqDWXbGb17Ind6i419ZfL1q9K8yCbOEMhbFWcozU6mvzXl2g
	BYJ/I63S94C1kC0QK6Bj+DJcvkn9qPBTzu/wQL2/w2f8IL+9QufaPs36upULDm81LgRTjzpHtH0
	=
X-Google-Smtp-Source: AGHT+IGsXMt2gYa0m8r8uAsXTtdVcBwOA09R8xfJDdn+51Kv36iJJXt4HR3SyAZS6KYwvPBxPoUMWg==
X-Received: by 2002:a17:907:6d0c:b0:a8a:8c04:ce95 with SMTP id a640c23a62f3a-a8ffadee50dmr109540466b.43.1725979305389;
        Tue, 10 Sep 2024 07:41:45 -0700 (PDT)
Message-ID: <abbd917c-d13d-4572-ae9e-1c413c7d4cf2@suse.com>
Date: Tue, 10 Sep 2024 16:41:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 7/7] x86/HVM: drop stdvga's "vram_page[]" struct member
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

No uses are left, hence its setup, teardown, and the field itself can
also go away. stdvga_deinit() is then empty and can be dropped as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
I have no idea whether in the tool stack some memory calculations would
want adjusting, to account for the 256k less that a HVM domain now
needs.

--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -700,7 +700,6 @@ int hvm_domain_initialise(struct domain
     return 0;
 
  fail2:
-    stdvga_deinit(d);
     vioapic_deinit(d);
  fail1:
     if ( is_hardware_domain(d) )
@@ -763,7 +762,6 @@ void hvm_domain_destroy(struct domain *d
     if ( hvm_funcs.domain_destroy )
         alternative_vcall(hvm_funcs.domain_destroy, d);
 
-    stdvga_deinit(d);
     vioapic_deinit(d);
 
     XFREE(d->arch.hvm.pl_time);
--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -119,8 +119,7 @@ static const struct hvm_io_ops stdvga_me
 void stdvga_init(struct domain *d)
 {
     struct hvm_hw_stdvga *s = &d->arch.hvm.stdvga;
-    struct page_info *pg;
-    unsigned int i;
+    struct hvm_io_handler *handler;
 
     if ( !has_vvga(d) )
         return;
@@ -128,47 +127,15 @@ void stdvga_init(struct domain *d)
     memset(s, 0, sizeof(*s));
     spin_lock_init(&s->lock);
     
-    for ( i = 0; i != ARRAY_SIZE(s->vram_page); i++ )
+    /* VGA memory */
+    handler = hvm_next_io_handler(d);
+    if ( handler )
     {
-        pg = alloc_domheap_page(d, MEMF_no_owner);
-        if ( pg == NULL )
-            break;
-        s->vram_page[i] = pg;
-        clear_domain_page(page_to_mfn(pg));
-    }
-
-    if ( i == ARRAY_SIZE(s->vram_page) )
-    {
-        struct hvm_io_handler *handler;
-
-        /* VGA memory */
-        handler = hvm_next_io_handler(d);
-
-        if ( handler == NULL )
-            return;
-
         handler->type = IOREQ_TYPE_COPY;
         handler->ops = &stdvga_mem_ops;
     }
 }
 
-void stdvga_deinit(struct domain *d)
-{
-    struct hvm_hw_stdvga *s = &d->arch.hvm.stdvga;
-    int i;
-
-    if ( !has_vvga(d) )
-        return;
-
-    for ( i = 0; i != ARRAY_SIZE(s->vram_page); i++ )
-    {
-        if ( s->vram_page[i] == NULL )
-            continue;
-        free_domheap_page(s->vram_page[i]);
-        s->vram_page[i] = NULL;
-    }
-}
-
 /*
  * Local variables:
  * mode: C
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -111,12 +111,10 @@ struct vpci_arch_msix_entry {
 };
 
 struct hvm_hw_stdvga {
-    struct page_info *vram_page[64];  /* shadow of 0xa0000-0xaffff */
     spinlock_t lock;
 };
 
 void stdvga_init(struct domain *d);
-void stdvga_deinit(struct domain *d);
 
 extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
 


