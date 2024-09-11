Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 629DA975292
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:37:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796557.1206212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMb6-0001rG-AL; Wed, 11 Sep 2024 12:37:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796557.1206212; Wed, 11 Sep 2024 12:37:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMb6-0001nx-6I; Wed, 11 Sep 2024 12:37:24 +0000
Received: by outflank-mailman (input) for mailman id 796557;
 Wed, 11 Sep 2024 12:37:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMTs-0005SW-Az
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:29:56 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d3788be-7039-11ef-a0b5-8be0dac302b0;
 Wed, 11 Sep 2024 14:29:55 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so451924a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:29:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd76f8bsm5257243a12.76.2024.09.11.05.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:29:54 -0700 (PDT)
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
X-Inumbo-ID: 8d3788be-7039-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726057795; x=1726662595; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=F+7xG8Xlt7QQ6wJoGrrTXnXBxG7ZbwFf1eyCKqS9od0=;
        b=RmIkAsnV+UGfJFR6Uj09vEmB1hlE1Qrk5g4p9TalrazxJQhxlMHYHzeo0fuu7+G5C5
         oIDfsv1Abdy8NjUVqU6ILqv9gmtYEDCNPA+hQ8TIeWQBBNiA96Ct2/f0iFBSO2WLifCS
         az18EBB+nOvQs79x7zam6KRS8IE5iiE9/eWBr9xM9lZZgkousKaBoHto6ZZBrKZRCoR+
         culcZAaB57omnQKP/3DCoXH/ZXZ/k90nabGA2aKkddblQ1wrmTA62/3qRHeWA8s0ve8Z
         QwYNYosKXB0hjYLomDhNIqdi3T9QhPi1BDeMc708o/DbsvtEgDkZ+Lsf3E82Voj1HPnm
         avOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726057795; x=1726662595;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F+7xG8Xlt7QQ6wJoGrrTXnXBxG7ZbwFf1eyCKqS9od0=;
        b=IRn0xeeDWBi0nxJ1mniR3MeEjCXpLlEPtKGB1HFp9elHMEvvwTf/OimCnVZXA8kJ9k
         DWhv+BJby1mGch1Fs6crCzlyW7trSoTpBkCi0QsscBW/KGUHbXmO2LZePN+HXkpiXKQ/
         n5J3UHsppSzXvsxs9Iwxizm21c0TIYhTzI21JdkAmqFRJc+0qvNkYnsm+OEN8Af1adfz
         yTIZJ4+rOuQqtU4ewBKY7qMSLjG89PJSGKydPZS2I3a3/Ms8MnnN0JhzWZc8aVN88KH9
         5Pi5KPa3GajSK9stvo0181FaKnzPmknTfNSXt3ITFI8sGKt4GQz1BEkhC6KZ9SX0Q1UB
         7kVg==
X-Gm-Message-State: AOJu0YzsYuegXB21dYRVf9owEIVZDoi4oz1djS1eJy47jvo3I/RSUPTS
	/bABeZfkn/Eb+qNby/9IFD09RJKM4hFFN/FGMLMnouigRjZ7qNktkZdgSpkR4/8j82yI/41bT28
	=
X-Google-Smtp-Source: AGHT+IHBc9iPZBTrQE5hJh+YPMuQzCvCvSRO86wsMzJe8fmttkJ/WvW8eyN/vxAWmewbNAhyx0JcqQ==
X-Received: by 2002:a05:6402:27d4:b0:5c4:aea:5833 with SMTP id 4fb4d7f45d1cf-5c40aea5cbamr3381668a12.18.1726057795026;
        Wed, 11 Sep 2024 05:29:55 -0700 (PDT)
Message-ID: <716868cb-6a94-4470-a1a5-a4b5994e8195@suse.com>
Date: Wed, 11 Sep 2024 14:29:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 8/9] x86/HVM: drop stdvga's "lock" struct member
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

No state is left to protect. It being the last field, drop the struct
itself as well. Similarly for then ending up empty, drop the .complete
handler.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/hvm/stdvga.c
+++ b/xen/arch/x86/hvm/stdvga.c
@@ -69,8 +69,6 @@ static int cf_check stdvga_mem_write(
 static bool cf_check stdvga_mem_accept(
     const struct hvm_io_handler *handler, const ioreq_t *p)
 {
-    struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
-
     /*
      * The range check must be done without taking the lock, to avoid
      * deadlock when hvm_mmio_internal() is called from
@@ -80,50 +78,31 @@ static bool cf_check stdvga_mem_accept(
          (ioreq_mmio_last_byte(p) >= (VGA_MEM_BASE + VGA_MEM_SIZE)) )
         return 0;
 
-    spin_lock(&s->lock);
-
     if ( p->dir != IOREQ_WRITE || p->data_is_ptr || p->count != 1 )
     {
         /*
          * Only accept single direct writes, as that's the only thing we can
          * accelerate using buffered ioreq handling.
          */
-        goto reject;
+        return false;
     }
 
-    /* s->lock intentionally held */
-    return 1;
-
- reject:
-    spin_unlock(&s->lock);
-    return 0;
-}
-
-static void cf_check stdvga_mem_complete(const struct hvm_io_handler *handler)
-{
-    struct hvm_hw_stdvga *s = &current->domain->arch.hvm.stdvga;
-
-    spin_unlock(&s->lock);
+    return true;
 }
 
 static const struct hvm_io_ops stdvga_mem_ops = {
     .accept = stdvga_mem_accept,
     .read = stdvga_mem_read,
     .write = stdvga_mem_write,
-    .complete = stdvga_mem_complete
 };
 
 void stdvga_init(struct domain *d)
 {
-    struct hvm_hw_stdvga *s = &d->arch.hvm.stdvga;
     struct hvm_io_handler *handler;
 
     if ( !has_vvga(d) )
         return;
 
-    memset(s, 0, sizeof(*s));
-    spin_lock_init(&s->lock);
-    
     /* VGA memory */
     handler = hvm_next_io_handler(d);
     if ( handler )
--- a/xen/arch/x86/include/asm/hvm/domain.h
+++ b/xen/arch/x86/include/asm/hvm/domain.h
@@ -72,7 +72,6 @@ struct hvm_domain {
     struct hvm_hw_vpic     vpic[2]; /* 0=master; 1=slave */
     struct hvm_vioapic    **vioapic;
     unsigned int           nr_vioapics;
-    struct hvm_hw_stdvga   stdvga;
 
     /*
      * hvm_hw_pmtimer is a publicly-visible name. We will defer renaming
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -110,10 +110,6 @@ struct vpci_arch_msix_entry {
     int pirq;
 };
 
-struct hvm_hw_stdvga {
-    spinlock_t lock;
-};
-
 void stdvga_init(struct domain *d);
 
 extern void hvm_dpci_msi_eoi(struct domain *d, int vector);


