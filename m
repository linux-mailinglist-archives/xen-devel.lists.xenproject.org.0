Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2716B97522B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796536.1206185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMTf-0007my-3H; Wed, 11 Sep 2024 12:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796536.1206185; Wed, 11 Sep 2024 12:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMTf-0007kg-08; Wed, 11 Sep 2024 12:29:43 +0000
Received: by outflank-mailman (input) for mailman id 796536;
 Wed, 11 Sep 2024 12:29:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMTd-0006QZ-Ap
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:29:41 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83a06bcf-7039-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 14:29:39 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a7a843bef98so526328366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:29:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ceaf4fsm606146266b.152.2024.09.11.05.29.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:29:38 -0700 (PDT)
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
X-Inumbo-ID: 83a06bcf-7039-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726057779; x=1726662579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s3kc1/kslZn0fKyNCZ0xFJr0vc7t/1tBsHEf2vOZYws=;
        b=ZaSP5dcNM1vmdZK+NEnC2xpVwW8Wo/QMeqasSVEKOsfC4Jw7pykz086IVvUCzdPi28
         hEzgnO1MjAtGXXLpRg5txVTTnPEBEsris8pkqE9SRITGaxUiI3rHV8Z2phD2KM+2Isfv
         PUEyBr+as3GDOoAogk3Ob8uIMJYWeb/SiuRJHlrn6p44XZ5BzvflPQVNa3bbiY4oYIOI
         rxXQnofVbXzXE8aGM7mahcs34bn972+xf5NfnL0l0qZPY8mcySr8Z9GJakgupSJAcx4m
         BS3m9hGKO3up8yi3FUzhJZFFUK2gmRJpPUxR7gK8phpYWKDq1JhXgE/Kl8cqFTRMCUVC
         93QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057779; x=1726662579;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s3kc1/kslZn0fKyNCZ0xFJr0vc7t/1tBsHEf2vOZYws=;
        b=MBH1ZRZzoJmPopnLsFDWuap9t8EeVLjEy1AbkKiLGoEF13CwDby4M5KtX0s7o0xO2t
         tTpsJ1/7d0qhIK3pY10oR3PY53ZAfNbQk9njdbSS0PZOlFnxwndP+HxwPQkGM9PXuzsq
         00X5CbpF53PGmeLNVoCB6jbkcz3XETndqGMH3WazC0EqhN838EHpsyWCHgcLGwwSyLTw
         rxhWgufCyxOHX0XfETQDpEb3z1/wNVh9ZU4JDruwX5gRvIcUF9IIzfm5Exkc3uaiecPx
         PhjV6OFBsk3UoWueW8kDi3h5uzvRUcRIrDuS6kif32Syc5FP5PeiFUwI10oN8YR4hEsG
         bSRA==
X-Gm-Message-State: AOJu0YwQgN949WlL8EdR3uRFd2yNbGV2eU4dWfiXiMdWfyDXsb1RhXE1
	AZ7b1JqQXqCSirusYZL2xhgKxKcrldUROvNxRYI9duwD+0L24FWJgHHx1/Zk5FG5TmjkPbWsfP4
	=
X-Google-Smtp-Source: AGHT+IH2mPVwIEJjReX5Hy/bSvfLEpDZ+Ycr2SHLEDAZk3i3lw2MeLOXwfShPYV9vOUgZnh2r9LrlA==
X-Received: by 2002:a17:907:6eaa:b0:a86:92a5:247a with SMTP id a640c23a62f3a-a8ffab294eamr357780566b.17.1726057779024;
        Wed, 11 Sep 2024 05:29:39 -0700 (PDT)
Message-ID: <96bc4615-fd26-40db-8feb-f6ece4584550@suse.com>
Date: Wed, 11 Sep 2024 14:29:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 7/9] x86/HVM: drop stdvga's "vram_page[]" struct member
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

No uses are left, hence its setup, teardown, and the field itself can
also go away. stdvga_deinit() is then empty and can be dropped as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
@@ -116,8 +116,7 @@ static const struct hvm_io_ops stdvga_me
 void stdvga_init(struct domain *d)
 {
     struct hvm_hw_stdvga *s = &d->arch.hvm.stdvga;
-    struct page_info *pg;
-    unsigned int i;
+    struct hvm_io_handler *handler;
 
     if ( !has_vvga(d) )
         return;
@@ -125,47 +124,15 @@ void stdvga_init(struct domain *d)
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
 


