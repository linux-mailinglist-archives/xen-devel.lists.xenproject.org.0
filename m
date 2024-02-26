Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DB98671BE
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:45:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685435.1066146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYUL-0003fF-Vq; Mon, 26 Feb 2024 10:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685435.1066146; Mon, 26 Feb 2024 10:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYUL-0003cz-Ry; Mon, 26 Feb 2024 10:45:37 +0000
Received: by outflank-mailman (input) for mailman id 685435;
 Mon, 26 Feb 2024 10:45:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hPQ6=KD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1reYUJ-0003ck-TC
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:45:35 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2acc6136-d494-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 11:45:33 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5643eccad0bso4514060a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 02:45:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a50ea86000000b005661badcccesm44605edo.87.2024.02.26.02.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 02:45:33 -0800 (PST)
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
X-Inumbo-ID: 2acc6136-d494-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708944333; x=1709549133; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1KdKJYo5Q7bYuv+aHSBf3jqyyInf5NNlws7iGpvocd8=;
        b=DHAAoJ0q/Yo1V4BNvkgI1/4fXDG8wpmuM6cQOEzWzEOVGomXKIIyLX//D7q+lpA2Io
         Gwv//a5053j+8JEnhsmFeWPEZBrJ/Qzad7t4PC94MZ8dUPF2+lcB+7ZxXtvMiYVn0dAi
         c5b0/obnqEc7tb9J68E+dN+U/pPYp0XQtFsUogaUcyEmjvFDnM8VsyYhNzRLdee6lEbp
         dKldaMywSTzD++vU8aYiJ9fIR+BOFmzFHmeMQ5f16mmLnNBMKR2Zmnh96Ovzv5JZLFxP
         8ff7dbpB4SJckYw39FutL4XtBIFvaaDBohrSWojxiEWMJtTQYVO1ReRJwIONlbxyv320
         rJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708944333; x=1709549133;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1KdKJYo5Q7bYuv+aHSBf3jqyyInf5NNlws7iGpvocd8=;
        b=dsBtxpAD+EMdpocPwYVisXR9vJyB8YlczNS9kt4jXkc4IJEyr3EuiPQ5yBmQO/MX8k
         sKy2W2QaTj3tpqVYnzbcguJTD8AOERHvb2F6vytI9RVQzJJPHgUridsDqX2b1EQBoZG5
         LfJW+g4785TReWkV32Z6gwmiECnXNMtArKEyozHmcJAYQCOYm/4SVfb24st1q/uckARQ
         1G383vZISP6gQPP6uThOxCYoKthfZvSe409hdwAVZA4XfKbchHxzOQhjKSjdsDrotBMS
         IrdGoKEUclRbDcMKSG4LagdrP6khj6sxFaSdz0NAL40xRclGNblg/SdaB6HiWauMn06n
         0orw==
X-Gm-Message-State: AOJu0Yw1sNTTp8XD79RQzNFGvD1Dc0J8L8rNgDivBDeuQbbtlefqibAL
	wdMCHe0+xc6/KFHViE1GNZx6ukALMWyNPQ1dtkdfziiRbgevpDMJlSDZ75cOeQ9ariYZgxoyKDI
	=
X-Google-Smtp-Source: AGHT+IEHk7mKkhLGf0l55aNiymIDjGoQxhCcEYQLWbg+pKFgyX85fYEIa5wskm+8TG+wN6HFO0QYyg==
X-Received: by 2002:aa7:d416:0:b0:564:39b6:fe9 with SMTP id z22-20020aa7d416000000b0056439b60fe9mr4530036edq.12.1708944333355;
        Mon, 26 Feb 2024 02:45:33 -0800 (PST)
Message-ID: <0c2e7ded-45c2-485f-9184-c71a58f56109@suse.com>
Date: Mon, 26 Feb 2024 11:45:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] gnttab: restrict GNTTABOP_cache_flush to Arm
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <94418e0e-1805-4c30-a4a7-4e9cbfaf984e@suse.com>
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
In-Reply-To: <94418e0e-1805-4c30-a4a7-4e9cbfaf984e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This special purpose operation possibly shouldn't have been a grant
table sub-op, but instead an arch-specific memory management one. No
users are known or supposed to exist outside of Arm. Along with adding
suitable #ifdef-s, move a helper function used solely here into the
first of these new #ifdef-s.

With the functionality restricted, questionable helper functions can
then also be purged from x86.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/include/asm/flushtlb.h
+++ b/xen/arch/x86/include/asm/flushtlb.h
@@ -182,21 +182,6 @@ void flush_area_mask(const cpumask_t *ma
 }
 
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache) {}
-static inline int invalidate_dcache_va_range(const void *p,
-                                             unsigned long size)
-{ return -EOPNOTSUPP; }
-static inline int clean_and_invalidate_dcache_va_range(const void *p,
-                                                       unsigned long size)
-{
-    unsigned int order = get_order_from_bytes(size);
-    /* sub-page granularity support needs to be added if necessary */
-    flush_area_local(p, FLUSH_CACHE|FLUSH_ORDER(order));
-    return 0;
-}
-static inline int clean_dcache_va_range(const void *p, unsigned long size)
-{
-    return clean_and_invalidate_dcache_va_range(p, size);
-}
 
 unsigned int guest_flush_tlb_flags(const struct domain *d);
 void guest_flush_tlb_mask(const struct domain *d, const cpumask_t *mask);
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -940,42 +940,6 @@ static void reduce_status_for_pin(struct
         gnttab_clear_flags(rd, clear_flags, status);
 }
 
-static struct active_grant_entry *grant_map_exists(const struct domain *ld,
-                                                   struct grant_table *rgt,
-                                                   mfn_t mfn,
-                                                   grant_ref_t *cur_ref)
-{
-    grant_ref_t ref, max_iter;
-
-    /*
-     * The remote grant table should be locked but the percpu rwlock
-     * cannot be checked for read lock without race conditions or high
-     * overhead so we cannot use an ASSERT
-     *
-     *   ASSERT(rw_is_locked(&rgt->lock));
-     */
-
-    max_iter = min(*cur_ref + (1 << GNTTABOP_CONTINUATION_ARG_SHIFT),
-                   nr_grant_entries(rgt));
-    for ( ref = *cur_ref; ref < max_iter; ref++ )
-    {
-        struct active_grant_entry *act = active_entry_acquire(rgt, ref);
-
-        if ( act->pin && act->domid == ld->domain_id &&
-             mfn_eq(act->mfn, mfn) )
-            return act;
-        active_entry_release(act);
-    }
-
-    if ( ref < nr_grant_entries(rgt) )
-    {
-        *cur_ref = ref;
-        return NULL;
-    }
-
-    return ERR_PTR(-EINVAL);
-}
-
 union maptrack_node {
     struct {
         /* Radix tree slot pointers use two of the bits. */
@@ -3519,6 +3483,44 @@ gnttab_swap_grant_ref(XEN_GUEST_HANDLE_P
     return 0;
 }
 
+#ifdef CONFIG_ARM
+
+static struct active_grant_entry *grant_map_exists(const struct domain *ld,
+                                                   struct grant_table *rgt,
+                                                   mfn_t mfn,
+                                                   grant_ref_t *cur_ref)
+{
+    grant_ref_t ref, max_iter;
+
+    /*
+     * The remote grant table should be locked but the percpu rwlock
+     * cannot be checked for read lock without race conditions or high
+     * overhead so we cannot use an ASSERT
+     *
+     *   ASSERT(rw_is_locked(&rgt->lock));
+     */
+
+    max_iter = min(*cur_ref + (1 << GNTTABOP_CONTINUATION_ARG_SHIFT),
+                   nr_grant_entries(rgt));
+    for ( ref = *cur_ref; ref < max_iter; ref++ )
+    {
+        struct active_grant_entry *act = active_entry_acquire(rgt, ref);
+
+        if ( act->pin && act->domid == ld->domain_id &&
+             mfn_eq(act->mfn, mfn) )
+            return act;
+        active_entry_release(act);
+    }
+
+    if ( ref < nr_grant_entries(rgt) )
+    {
+        *cur_ref = ref;
+        return NULL;
+    }
+
+    return ERR_PTR(-EINVAL);
+}
+
 static int _cache_flush(const gnttab_cache_flush_t *cflush, grant_ref_t *cur_ref)
 {
     struct domain *d, *owner;
@@ -3633,6 +3635,8 @@ gnttab_cache_flush(XEN_GUEST_HANDLE_PARA
     return 0;
 }
 
+#endif /* CONFIG_ARM */
+
 long do_grant_table_op(
     unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) uop, unsigned int count)
 {
@@ -3776,6 +3780,7 @@ long (do_grant_table_op)(
 
     case GNTTABOP_cache_flush:
     {
+#ifdef CONFIG_ARM
         XEN_GUEST_HANDLE_PARAM(gnttab_cache_flush_t) cflush =
             guest_handle_cast(uop, gnttab_cache_flush_t);
 
@@ -3788,6 +3793,9 @@ long (do_grant_table_op)(
             uop = guest_handle_cast(cflush, void);
             opaque_out = opaque_in;
         }
+#else
+        rc = -EOPNOTSUPP;
+#endif
         break;
     }
 


