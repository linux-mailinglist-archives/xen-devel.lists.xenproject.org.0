Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9998173E2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 15:40:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656062.1023998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEmn-0001kx-8t; Mon, 18 Dec 2023 14:40:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656062.1023998; Mon, 18 Dec 2023 14:40:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFEmn-0001hc-5F; Mon, 18 Dec 2023 14:40:01 +0000
Received: by outflank-mailman (input) for mailman id 656062;
 Mon, 18 Dec 2023 14:39:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFEml-0001hV-BS
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 14:39:59 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 504a794c-9db3-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 15:39:56 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c580ba223so39062195e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 06:39:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v9-20020a05600c470900b0040c4acaa4bfsm31329915wmo.19.2023.12.18.06.39.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 06:39:55 -0800 (PST)
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
X-Inumbo-ID: 504a794c-9db3-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702910396; x=1703515196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Lh1hl9sCcsQ2pc/dsi+OGUNJGqlfdDZuQfx1cyY8ztI=;
        b=dJu4DqehkFmfTtyrrANOa130oxlVefZStc6cpJB7gW/bsepqkRijK6NqYLCaRHS9Wj
         B172F0A0qZLe01VqRUXTE0aT3w9dPqv1geNeps3AkUYZjzVPR6SopnlwxRqWx+6wi4ar
         AATC0oshXaO2Ll/0DeVe7ZoJNPQ6i5AWYpjD/Gm5ovGNfgR5kFYzL7K4cKv38Qugskoy
         MwaRWKmtmek4vfLXlAXgMlDp6IBz+G6j2PhI84O9aXI6Odzcv8y/Nh3XrZncZS0y9qA+
         QElfHg903KOmRmPh23/Z4yraHkwkgMLOmfWAkCRbMRmbiK9x5EmXOcyyWp5txVjB4EV4
         PwIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702910396; x=1703515196;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lh1hl9sCcsQ2pc/dsi+OGUNJGqlfdDZuQfx1cyY8ztI=;
        b=ICTAfwYX148f0AV70D2hYWxgbjcfT6W43pLWWAYRl2fWtD2UYrbOJ6Su8HWm4JtdDq
         Vz70haLrYbCA4nYLkQ5LDomoptt4Rs2zz3jemUqr1lXvrmnMHKRCIP3bcjRx93uIcYHO
         /X+x1oBNnnsZsKtxgwHxnebQ8578C2F7hnXsdp8wNjjfguyqEv0R0vNsB1niU30tclB9
         8th6Eibz+jRsgz+7Gd2r0KVSHvT+y8RB55dufaH5Aa6roXut6ur9A3VfNqc22XeVspva
         Yd8tovfO47ejD3ULPmMLo3jWl29ZrxQYyyIehGQfReUxRHkuvM04i2o2Ty/5cgqn3Sh/
         P23A==
X-Gm-Message-State: AOJu0YxEawBIPlrsLyV50zyWBn9vrpX8wYLEFOmvIfUFhVpo1euG/seD
	NaS/KseXzkPnp2wcHFXqXmaHJdDletrh0aIgu5ms
X-Google-Smtp-Source: AGHT+IHVZs15/+OWblOreD2gWeNcEqRPITzOD3Nw9dnkYmZw3AoRm9ZBHpc1U0YnS53rESzeLQLXew==
X-Received: by 2002:a05:600c:4f56:b0:40c:6a42:c60b with SMTP id m22-20020a05600c4f5600b0040c6a42c60bmr3386796wmq.187.1702910396284;
        Mon, 18 Dec 2023 06:39:56 -0800 (PST)
Message-ID: <05e69eea-79cc-4b3c-861b-855fa67c878a@suse.com>
Date: Mon, 18 Dec 2023 15:39:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 1/5] x86/HVM: split restore state checking from state
 loading
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
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
In-Reply-To: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

..., at least as reasonably feasible without making a check hook
mandatory (in particular strict vs relaxed/zero-extend length checking
can't be done early this way).

Note that only one of the two uses of "real" hvm_load() is accompanied
with a "checking" one. The other directly consumes hvm_save() output,
which ought to be well-formed. This means that while input data related
checks don't need repeating in the "load" function when already done by
the "check" one (albeit assertions to this effect may be desirable),
domain state related checks (e.g. has_xyz(d)) will be required in both
places.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Now that this re-arranges hvm_load() anyway, wouldn't it be better to
down the vCPU-s ahead of calling arch_hvm_load() (which is now easy to
arrange for)?

Do we really need all the copying involved in use of _hvm_read_entry()
(backing hvm_load_entry()? Zero-extending loads are likely easier to
handle that way, but for strict loads all we gain is a reduced risk of
unaligned accesses (compared to simply pointing into h->data[]).
---
v4: Fold hvm_check() into hvm_load().
v2: New.

--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -379,8 +379,12 @@ long arch_do_domctl(
         if ( copy_from_guest(c.data, domctl->u.hvmcontext.buffer, c.size) != 0 )
             goto sethvmcontext_out;
 
+        ret = hvm_load(d, false, &c);
+        if ( ret )
+            goto sethvmcontext_out;
+
         domain_pause(d);
-        ret = hvm_load(d, &c);
+        ret = hvm_load(d, true, &c);
         domain_unpause(d);
 
     sethvmcontext_out:
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -5397,7 +5397,7 @@ int hvm_copy_context_and_params(struct d
     }
 
     c.cur = 0;
-    rc = hvm_load(dst, &c);
+    rc = hvm_load(dst, true, &c);
 
  out:
     vfree(c.data);
--- a/xen/arch/x86/hvm/save.c
+++ b/xen/arch/x86/hvm/save.c
@@ -30,7 +30,8 @@ static void arch_hvm_save(struct domain
     d->arch.hvm.sync_tsc = rdtsc();
 }
 
-static int arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
+static int arch_hvm_check(const struct domain *d,
+                          const struct hvm_save_header *hdr)
 {
     uint32_t eax, ebx, ecx, edx;
 
@@ -55,6 +56,11 @@ static int arch_hvm_load(struct domain *
                "(%#"PRIx32") and restored on another (%#"PRIx32").\n",
                d->domain_id, hdr->cpuid, eax);
 
+    return 0;
+}
+
+static void arch_hvm_load(struct domain *d, const struct hvm_save_header *hdr)
+{
     /* Restore guest's preferred TSC frequency. */
     if ( hdr->gtsc_khz )
         d->arch.tsc_khz = hdr->gtsc_khz;
@@ -66,13 +72,12 @@ static int arch_hvm_load(struct domain *
 
     /* VGA state is not saved/restored, so we nobble the cache. */
     d->arch.hvm.stdvga.cache = STDVGA_CACHE_DISABLED;
-
-    return 0;
 }
 
 /* List of handlers for various HVM save and restore types */
 static struct {
     hvm_save_handler save;
+    hvm_check_handler check;
     hvm_load_handler load;
     const char *name;
     size_t size;
@@ -88,6 +93,7 @@ void __init hvm_register_savevm(uint16_t
 {
     ASSERT(typecode <= HVM_SAVE_CODE_MAX);
     ASSERT(hvm_sr_handlers[typecode].save == NULL);
+    ASSERT(hvm_sr_handlers[typecode].check == NULL);
     ASSERT(hvm_sr_handlers[typecode].load == NULL);
     hvm_sr_handlers[typecode].save = save_state;
     hvm_sr_handlers[typecode].load = load_state;
@@ -275,12 +281,10 @@ int hvm_save(struct domain *d, hvm_domai
     return 0;
 }
 
-int hvm_load(struct domain *d, hvm_domain_context_t *h)
+int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
 {
     const struct hvm_save_header *hdr;
     struct hvm_save_descriptor *desc;
-    hvm_load_handler handler;
-    struct vcpu *v;
     int rc;
 
     if ( d->is_dying )
@@ -291,50 +295,91 @@ int hvm_load(struct domain *d, hvm_domai
     if ( !hdr )
         return -ENODATA;
 
-    rc = arch_hvm_load(d, hdr);
-    if ( rc )
-        return rc;
+    rc = arch_hvm_check(d, hdr);
+    if ( real )
+    {
+        struct vcpu *v;
+
+        ASSERT(!rc);
+        arch_hvm_load(d, hdr);
 
-    /* Down all the vcpus: we only re-enable the ones that had state saved. */
-    for_each_vcpu(d, v)
-        if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
-            vcpu_sleep_nosync(v);
+        /*
+         * Down all the vcpus: we only re-enable the ones that had state
+         * saved.
+         */
+        for_each_vcpu(d, v)
+            if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
+                vcpu_sleep_nosync(v);
+    }
+    else if ( rc )
+        return rc;
 
     for ( ; ; )
     {
+        const char *name;
+        hvm_load_handler load;
+
         if ( h->size - h->cur < sizeof(struct hvm_save_descriptor) )
         {
             /* Run out of data */
             printk(XENLOG_G_ERR
                    "HVM%d restore: save did not end with a null entry\n",
                    d->domain_id);
+            ASSERT(!real);
             return -ENODATA;
         }
 
         /* Read the typecode of the next entry  and check for the end-marker */
         desc = (struct hvm_save_descriptor *)(&h->data[h->cur]);
-        if ( desc->typecode == 0 )
+        if ( desc->typecode == HVM_SAVE_CODE(END) )
+        {
+            /* Reset cursor for hvm_load(, true, ). */
+            if ( !real )
+                h->cur = 0;
             return 0;
+        }
 
         /* Find the handler for this entry */
-        if ( (desc->typecode > HVM_SAVE_CODE_MAX) ||
-             ((handler = hvm_sr_handlers[desc->typecode].load) == NULL) )
+        if ( desc->typecode >= ARRAY_SIZE(hvm_sr_handlers) ||
+             !(name = hvm_sr_handlers[desc->typecode].name) ||
+             !(load = hvm_sr_handlers[desc->typecode].load) )
         {
             printk(XENLOG_G_ERR "HVM%d restore: unknown entry typecode %u\n",
                    d->domain_id, desc->typecode);
+            ASSERT(!real);
             return -EINVAL;
         }
 
-        /* Load the entry */
-        printk(XENLOG_G_INFO "HVM%d restore: %s %"PRIu16"\n", d->domain_id,
-               hvm_sr_handlers[desc->typecode].name, desc->instance);
-        rc = handler(d, h);
+        if ( real )
+        {
+            /* Load the entry */
+            printk(XENLOG_G_INFO "HVM restore %pd: %s %"PRIu16"\n", d,
+                   name, desc->instance);
+            rc = load(d, h);
+        }
+        else
+        {
+            /* Check the entry. */
+            hvm_check_handler check = hvm_sr_handlers[desc->typecode].check;
+
+            if ( !check )
+            {
+                if ( desc->length > h->size - h->cur - sizeof(*desc) )
+                    return -ENODATA;
+                h->cur += sizeof(*desc) + desc->length;
+                rc = 0;
+            }
+            else
+                rc = check(d, h);
+        }
+
         if ( rc )
         {
-            printk(XENLOG_G_ERR "HVM%d restore: failed to load entry %u/%u rc %d\n",
-                   d->domain_id, desc->typecode, desc->instance, rc);
+            printk(XENLOG_G_ERR "HVM restore %pd: failed to %s %s:%u rc %d\n",
+                   d, real ? "load" : "check", name, desc->instance, rc);
             return rc;
         }
+
         process_pending_softirqs();
     }
 
--- a/xen/arch/x86/include/asm/hvm/save.h
+++ b/xen/arch/x86/include/asm/hvm/save.h
@@ -103,6 +103,8 @@ static inline unsigned int hvm_load_inst
  * restoring.  Both return non-zero on error. */
 typedef int (*hvm_save_handler) (struct vcpu *v,
                                  hvm_domain_context_t *h);
+typedef int (*hvm_check_handler)(const struct domain *d,
+                                 hvm_domain_context_t *h);
 typedef int (*hvm_load_handler) (struct domain *d,
                                  hvm_domain_context_t *h);
 
@@ -140,6 +142,6 @@ size_t hvm_save_size(struct domain *d);
 int hvm_save(struct domain *d, hvm_domain_context_t *h);
 int hvm_save_one(struct domain *d, unsigned int typecode, unsigned int instance,
                  XEN_GUEST_HANDLE_64(uint8) handle, uint64_t *bufsz);
-int hvm_load(struct domain *d, hvm_domain_context_t *h);
+int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h);
 
 #endif /* __XEN_HVM_SAVE_H__ */


