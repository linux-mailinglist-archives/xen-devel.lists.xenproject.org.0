Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7AECD6B96
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:55:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192307.1511613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXjBT-0001nZ-KB; Mon, 22 Dec 2025 16:54:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192307.1511613; Mon, 22 Dec 2025 16:54:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXjBT-0001kt-G6; Mon, 22 Dec 2025 16:54:59 +0000
Received: by outflank-mailman (input) for mailman id 1192307;
 Mon, 22 Dec 2025 16:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ezST=64=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vXjBR-0001kn-GL
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:54:57 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0bf4e4b-df56-11f0-9cce-f158ae23cfc8;
 Mon, 22 Dec 2025 17:54:54 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-42fbc305882so2148189f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:54:54 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea226d1sm23513860f8f.13.2025.12.22.08.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 08:54:53 -0800 (PST)
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
X-Inumbo-ID: f0bf4e4b-df56-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766422494; x=1767027294; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h4UevlDelbU9Pq4j3DueOab96zFdtjsssm1G7f69TuQ=;
        b=MXr8hTFbnyAHUj0lWW9Mugb1B6ap9CrbxJpHGCJ3uITgCrWoBbRhFoDd5txNIaFy+g
         Z14Vis6O6ZYERC6vW7tERnH9XqeYVXJFBGDAn8GXvjkPZBYpKxJJWj6rQlDen071UgoI
         38i6XMft6mTyCIh5KSOa11S4dygXfWGyPLmFBLOXl36NDtvjsT5g8cRU1uA9Wn9Llfbw
         J72eLZjNAyHgG8m9pQs+CG1rJZm3iv0TFdxwCwYHbLPIw4XCsNUTy6HhOldsoNncK3xj
         HQLDO+olodEGDrHyvSjQ0KDUtTGn/nyC/WL8tQpjnCIKr+veTqBVQaYCWFheeJL1gLZD
         V7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422494; x=1767027294;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4UevlDelbU9Pq4j3DueOab96zFdtjsssm1G7f69TuQ=;
        b=HjRu5eoaKm721ej96VCHPz0sa6S+G7EPrBdOv9z559bXEAieoZ0jfKRGfGJV9HAXz9
         uG7cPze43i1b3YI9OJ45HXBNtksJ1+qgmlamaJr63Mrguu6ikuj1S1Jia5RUuKOvuORE
         J9ah7PMo7fkLSRmuHY2d8cGIuot9TvKjYEa7aqYZBNE6cxEqzTC8xABSgN/5CKAhVyYQ
         5LYn8tXI529UKCy2NuM2jQ73vQbQlpS8pRnNU93/8HJFnMLPqxhbfCwOoNW2WeLZ2oKK
         y1R+3igexQ7AHXxbbpoLrPTCFcOi/YeE4R9UpyD4TIxG2AQErGK77fDv7mFsud5Na8k7
         UWcA==
X-Gm-Message-State: AOJu0Yz60sSnv7Ra66G+VBHwknjKKCP9e9MIdU09ajzTkdaJDru8IhwH
	zip5OplLzpG3GImtIlAl2Q+KEGhJbOYpUY+/ba6y7uClMW6+ZKWk9ITW/bQ4TgSa/6SC2IqkRnW
	cc60=
X-Gm-Gg: AY/fxX6Q2I+1syH+G1ghKVKsAf+1Oeczxa2X/6Z5/LJnBp1Nw3k9Iy0GcPLpsSzzSpE
	fuvV2sVy9538zrAvFa7qUQHdm1r3UDr8PPMYwEcJa/9oLzIlX2YRywJHPhAunpDrDWxkNG8duXH
	6PVg6KmLD6vxzgMUJ+u7dpHMyvrfYdw8U0DES5omLvG1b9bSodHbt6kNEqIsrrEiMq9IYH2zT1w
	DlqgmGaNCOTM82f02UBWdvwl2GFVv2V1A4t1yqWYxGl3cWgsUMTRjvYeAgMRvMoeRRU2Cg/N5J9
	Bewichnea3ciFxT6aWPpLw4h2ykAIylBXeesY/6tZ7jwDUEJOLLveggiSMQhv/r0ooq9UQK21R0
	XoHUrUVBTV5+qDfpItoeHaiDTuVuO+ZLhr+w2b+pc1WAmXc8TAAtyONOf5ctcp7cGECWtS8Gxf2
	PTJvotFhbkMbUynYt93v9uaG8BfWMKBKe/UqkEZM5Xl3EeRDuCdVq/Iwi5clhFgzJ6jKalDrsVp
	ndswaL4G842jg==
X-Google-Smtp-Source: AGHT+IGGNEP8R51YHcTVHI1J6n+HvViMPPWJH2k75K40fzbLspg0wnvCN9EU2Ya7lHhnmdHW0OX6Wg==
X-Received: by 2002:a5d:5d11:0:b0:430:f68f:ee91 with SMTP id ffacd0b85a97d-4324e4f68f5mr14055522f8f.37.1766422494158;
        Mon, 22 Dec 2025 08:54:54 -0800 (PST)
Message-ID: <41447fdb-bc9a-4b1a-afd0-9d878ab21301@suse.com>
Date: Mon, 22 Dec 2025 17:54:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] x86/cpu-policy: move copy-in/-out functions to arch
 library
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD <anthony.perard@vates.tech>
References: <4a8f06b9-8210-487f-9dd7-e0221e2df9db@suse.com>
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
In-Reply-To: <4a8f06b9-8210-487f-9dd7-e0221e2df9db@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is to aid with MGMT_HYPERCALL work, leaving the functions potentially
unreferenced (which Misra dislikes). By moving them to separate archive
members, the linker simply will not pick them up when not needed.

As the CPUID and MSR ones are always used together, put the "from" and
"to" variants of each together in one file respectively.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/tools/fuzz/cpu-policy/Makefile
+++ b/tools/fuzz/cpu-policy/Makefile
@@ -20,9 +20,13 @@ install: all
 CFLAGS += $(CFLAGS_xeninclude) -D__XEN_TOOLS__
 CFLAGS += $(APPEND_CFLAGS) -Og
 
-vpath %.c ../../../xen/lib/x86
+vpath %.c $(XEN_ROOT)/xen/lib/x86
+vpath %.c $(XEN_ROOT)/xen/arch/x86/lib
 
-afl-policy-fuzzer: afl-policy-fuzzer.o msr.o cpuid.o
+lib-y :=
+include $(XEN_ROOT)/xen/arch/x86/lib/Makefile.cpu-policy
+
+afl-policy-fuzzer: afl-policy-fuzzer.o cpuid.o $(lib-y)
 	$(CC) $(CFLAGS) $^ -o $@
 
 -include $(DEPS_INCLUDE)
--- a/tools/libs/guest/Makefile.common
+++ b/tools/libs/guest/Makefile.common
@@ -33,9 +33,13 @@ LIBELF_OBJS += libelf-dominfo.o
 OBJS-y += $(LIBELF_OBJS)
 
 ifeq ($(CONFIG_X86),y) # Add libx86 to the build
-vpath %.c ../../../xen/lib/x86
+vpath %.c $(XEN_ROOT)/xen/lib/x86
+vpath %.c $(XEN_ROOT)/xen/arch/x86/lib
 
-OBJS-y                 += cpuid.o msr.o policy.o
+lib-y :=
+include $(XEN_ROOT)/xen/arch/x86/lib/Makefile.cpu-policy
+
+OBJS-y                 += cpuid.o policy.o $(lib-y)
 endif
 
 # new domain builder
--- a/tools/tests/cpu-policy/Makefile
+++ b/tools/tests/cpu-policy/Makefile
@@ -42,11 +42,15 @@ CFLAGS += $(APPEND_CFLAGS)
 
 LDFLAGS += $(APPEND_LDFLAGS)
 
-vpath %.c ../../../xen/lib/x86
+vpath %.c $(XEN_ROOT)/xen/lib/x86
+vpath %.c $(XEN_ROOT)/xen/arch/x86/lib
+
+lib-y :=
+include $(XEN_ROOT)/xen/arch/x86/lib/Makefile.cpu-policy
 
 %.o: Makefile
 
-test-cpu-policy: test-cpu-policy.o msr.o cpuid.o policy.o
+test-cpu-policy: test-cpu-policy.o cpuid.o policy.o $(lib-y)
 	$(CC) $^ -o $@ $(LDFLAGS)
 
 -include $(DEPS_INCLUDE)
--- a/xen/arch/x86/lib/Makefile
+++ b/xen/arch/x86/lib/Makefile
@@ -6,3 +6,5 @@ lib-y += generic-hweightl.o
 lib-y += memcpy.o
 lib-y += memset.o
 lib-y += scrub-page.o
+
+include $(srcdir)/Makefile.cpu-policy
--- /dev/null
+++ b/xen/arch/x86/lib/Makefile.cpu-policy
@@ -0,0 +1,2 @@
+lib-y += cp-copy-from-buffer.o
+lib-y += cp-copy-to-buffer.o
--- /dev/null
+++ b/xen/arch/x86/lib/cp-copy-from-buffer.c
@@ -0,0 +1,238 @@
+#ifdef __XEN__
+
+#include <xen/errno.h>
+#include <xen/guest_access.h>
+#include <xen/nospec.h>
+#include <xen/types.h>
+
+#include <asm/msr-index.h>
+
+#define copy_from_buffer_offset copy_from_guest_offset
+
+#else /* !__XEN__ */
+
+#include <errno.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <string.h>
+
+#include <xen/asm/msr-index.h>
+
+#include <xen-tools/common-macros.h>
+
+#define array_access_nospec(a, i) (a)[(i)]
+
+/* memcpy(), but with copy_from_guest_offset()'s API. */
+#define copy_from_buffer_offset(dst, src, index, nr)    \
+({                                                      \
+    const typeof(*(src)) *src_ = (src);                 \
+    typeof(*(dst)) *dst_ = (dst);                       \
+    typeof(index) index_ = (index);                     \
+    typeof(nr) nr_ = (nr), i_;                          \
+                                                        \
+    for ( i_ = 0; i_ < nr_; i_++ )                      \
+        dst_[i_] = src_[index_ + i_];                   \
+    0;                                                  \
+})
+
+#endif /* __XEN__ */
+
+#include <xen/lib/x86/cpu-policy.h>
+
+int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
+                               const cpuid_leaf_buffer_t leaves,
+                               uint32_t nr_entries, uint32_t *err_leaf,
+                               uint32_t *err_subleaf)
+{
+    unsigned int i;
+    xen_cpuid_leaf_t data;
+
+    if ( err_leaf )
+        *err_leaf = -1;
+    if ( err_subleaf )
+        *err_subleaf = -1;
+
+    /*
+     * A well formed caller is expected to pass an array with leaves in order,
+     * and without any repetitions.  However, due to per-vendor differences,
+     * and in the case of upgrade or levelled scenarios, we typically expect
+     * fewer than MAX leaves to be passed.
+     *
+     * Detecting repeated entries is prohibitively complicated, so we don't
+     * bother.  That said, one way or another if more than MAX leaves are
+     * passed, something is wrong.
+     */
+    if ( nr_entries > CPUID_MAX_SERIALISED_LEAVES )
+        return -E2BIG;
+
+    for ( i = 0; i < nr_entries; ++i )
+    {
+        struct cpuid_leaf l;
+
+        if ( copy_from_buffer_offset(&data, leaves, i, 1) )
+            return -EFAULT;
+
+        l = (struct cpuid_leaf){ data.a, data.b, data.c, data.d };
+
+        switch ( data.leaf )
+        {
+        case 0 ... ARRAY_SIZE(p->basic.raw) - 1:
+            switch ( data.leaf )
+            {
+            case 0x4:
+                if ( data.subleaf >= ARRAY_SIZE(p->cache.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->cache.raw, data.subleaf) = l;
+                break;
+
+            case 0x7:
+                if ( data.subleaf >= ARRAY_SIZE(p->feat.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->feat.raw, data.subleaf) = l;
+                break;
+
+            case 0xb:
+                if ( data.subleaf >= ARRAY_SIZE(p->topo.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->topo.raw, data.subleaf) = l;
+                break;
+
+            case 0xd:
+                if ( data.subleaf >= ARRAY_SIZE(p->xstate.raw) )
+                    goto out_of_range;
+
+                array_access_nospec(p->xstate.raw, data.subleaf) = l;
+                break;
+
+            default:
+                if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
+                    goto out_of_range;
+
+                array_access_nospec(p->basic.raw, data.leaf) = l;
+                break;
+            }
+            break;
+
+        case 0x40000000:
+            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
+                goto out_of_range;
+
+            p->hv_limit = l.a;
+            break;
+
+        case 0x40000100:
+            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
+                goto out_of_range;
+
+            p->hv2_limit = l.a;
+            break;
+
+        case 0x80000000U ... 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1:
+            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
+                goto out_of_range;
+
+            array_access_nospec(p->extd.raw, data.leaf & 0xffff) = l;
+            break;
+
+        default:
+            goto out_of_range;
+        }
+    }
+
+    x86_cpu_policy_recalc_synth(p);
+
+    return 0;
+
+ out_of_range:
+    if ( err_leaf )
+        *err_leaf = data.leaf;
+    if ( err_subleaf )
+        *err_subleaf = data.subleaf;
+
+    return -ERANGE;
+}
+
+int x86_msr_copy_from_buffer(struct cpu_policy *p,
+                             const msr_entry_buffer_t msrs, uint32_t nr_entries,
+                             uint32_t *err_msr)
+{
+    unsigned int i;
+    xen_msr_entry_t data;
+    int rc;
+
+    if ( err_msr )
+        *err_msr = -1;
+
+    /*
+     * A well formed caller is expected to pass an array with entries in
+     * order, and without any repetitions.  However, due to per-vendor
+     * differences, and in the case of upgrade or levelled scenarios, we
+     * typically expect fewer than MAX entries to be passed.
+     *
+     * Detecting repeated entries is prohibitively complicated, so we don't
+     * bother.  That said, one way or another if more than MAX entries are
+     * passed, something is wrong.
+     */
+    if ( nr_entries > MSR_MAX_SERIALISED_ENTRIES )
+        return -E2BIG;
+
+    for ( i = 0; i < nr_entries; i++ )
+    {
+        if ( copy_from_buffer_offset(&data, msrs, i, 1) )
+            return -EFAULT;
+
+        if ( data.flags ) /* .flags MBZ */
+        {
+            rc = -EINVAL;
+            goto err;
+        }
+
+        switch ( data.idx )
+        {
+            /*
+             * Assign data.val to p->field, checking for truncation if the
+             * backing storage for field is smaller than uint64_t
+             */
+#define ASSIGN(field)                             \
+({                                                \
+    if ( (typeof(p->field))data.val != data.val ) \
+    {                                             \
+        rc = -EOVERFLOW;                          \
+        goto err;                                 \
+    }                                             \
+    p->field = data.val;                          \
+})
+
+        case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
+        case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
+
+#undef ASSIGN
+
+        default:
+            rc = -ERANGE;
+            goto err;
+        }
+    }
+
+    return 0;
+
+ err:
+    if ( err_msr )
+        *err_msr = data.idx;
+
+    return rc;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- /dev/null
+++ b/xen/arch/x86/lib/cp-copy-to-buffer.c
@@ -0,0 +1,204 @@
+#ifdef __XEN__
+
+#include <xen/errno.h>
+#include <xen/guest_access.h>
+#include <xen/types.h>
+
+#include <asm/msr-index.h>
+
+#define copy_to_buffer_offset copy_to_guest_offset
+
+#else /* !__XEN__ */
+
+#include <errno.h>
+#include <inttypes.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <string.h>
+
+#include <xen/asm/msr-index.h>
+
+#include <xen-tools/common-macros.h>
+
+/* memcpy(), but with copy_to_guest_offset()'s API. */
+#define copy_to_buffer_offset(dst, index, src, nr)      \
+({                                                      \
+    const typeof(*(src)) *src_ = (src);                 \
+    typeof(*(dst)) *dst_ = (dst);                       \
+    typeof(index) index_ = (index);                     \
+    typeof(nr) nr_ = (nr), i_;                          \
+                                                        \
+    for ( i_ = 0; i_ < nr_; i_++ )                      \
+        dst_[index_ + i_] = src_[i_];                   \
+    0;                                                  \
+})
+
+#endif /* __XEN__ */
+
+#include <xen/lib/x86/cpu-policy.h>
+
+/*
+ * Copy a single cpuid_leaf into a provided xen_cpuid_leaf_t buffer,
+ * performing boundary checking against the buffer size.
+ */
+static int copy_leaf_to_buffer(uint32_t leaf, uint32_t subleaf,
+                               const struct cpuid_leaf *data,
+                               cpuid_leaf_buffer_t leaves,
+                               uint32_t *curr_entry, const uint32_t nr_entries)
+{
+    const xen_cpuid_leaf_t val = {
+        leaf, subleaf, data->a, data->b, data->c, data->d,
+    };
+
+    if ( *curr_entry == nr_entries )
+        return -ENOBUFS;
+
+    if ( copy_to_buffer_offset(leaves, *curr_entry, &val, 1) )
+        return -EFAULT;
+
+    ++*curr_entry;
+
+    return 0;
+}
+
+int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
+                             cpuid_leaf_buffer_t leaves, uint32_t *nr_entries_p)
+{
+    const uint32_t nr_entries = *nr_entries_p;
+    uint32_t curr_entry = 0, leaf, subleaf;
+
+#define COPY_LEAF(l, s, data)                                       \
+    ({                                                              \
+        int ret;                                                    \
+                                                                    \
+        if ( (ret = copy_leaf_to_buffer(                            \
+                  l, s, data, leaves, &curr_entry, nr_entries)) )   \
+            return ret;                                             \
+    })
+
+    /* Basic leaves. */
+    for ( leaf = 0; leaf <= MIN(p->basic.max_leaf,
+                                ARRAY_SIZE(p->basic.raw) - 1); ++leaf )
+    {
+        switch ( leaf )
+        {
+        case 0x4:
+            for ( subleaf = 0; subleaf < ARRAY_SIZE(p->cache.raw); ++subleaf )
+            {
+                COPY_LEAF(leaf, subleaf, &p->cache.raw[subleaf]);
+
+                if ( p->cache.subleaf[subleaf].type == 0 )
+                    break;
+            }
+            break;
+
+        case 0x7:
+            for ( subleaf = 0;
+                  subleaf <= MIN(p->feat.max_subleaf,
+                                 ARRAY_SIZE(p->feat.raw) - 1); ++subleaf )
+                COPY_LEAF(leaf, subleaf, &p->feat.raw[subleaf]);
+            break;
+
+        case 0xb:
+            for ( subleaf = 0; subleaf < ARRAY_SIZE(p->topo.raw); ++subleaf )
+            {
+                COPY_LEAF(leaf, subleaf, &p->topo.raw[subleaf]);
+
+                if ( p->topo.subleaf[subleaf].type == 0 )
+                    break;
+            }
+            break;
+
+        case 0xd:
+        {
+            uint64_t xstates = cpu_policy_xstates(p);
+
+            COPY_LEAF(leaf, 0, &p->xstate.raw[0]);
+            COPY_LEAF(leaf, 1, &p->xstate.raw[1]);
+
+            for ( xstates >>= 2, subleaf = 2;
+                  xstates && subleaf < ARRAY_SIZE(p->xstate.raw);
+                  xstates >>= 1, ++subleaf )
+                COPY_LEAF(leaf, subleaf, &p->xstate.raw[subleaf]);
+            break;
+        }
+
+        default:
+            COPY_LEAF(leaf, XEN_CPUID_NO_SUBLEAF, &p->basic.raw[leaf]);
+            break;
+        }
+    }
+
+    /* TODO: Port Xen and Viridian leaves to the new CPUID infrastructure. */
+    COPY_LEAF(0x40000000, XEN_CPUID_NO_SUBLEAF,
+              &(struct cpuid_leaf){ p->hv_limit });
+    COPY_LEAF(0x40000100, XEN_CPUID_NO_SUBLEAF,
+              &(struct cpuid_leaf){ p->hv2_limit });
+
+    /* Extended leaves. */
+    for ( leaf = 0; leaf <= MIN(p->extd.max_leaf & 0xffffUL,
+                                ARRAY_SIZE(p->extd.raw) - 1); ++leaf )
+        COPY_LEAF(0x80000000U | leaf, XEN_CPUID_NO_SUBLEAF, &p->extd.raw[leaf]);
+
+#undef COPY_LEAF
+
+    *nr_entries_p = curr_entry;
+
+    return 0;
+}
+
+/*
+ * Copy a single MSR into the provided msr_entry_buffer_t buffer, performing a
+ * boundary check against the buffer size.
+ */
+static int copy_msr_to_buffer(uint32_t idx, uint64_t val,
+                              msr_entry_buffer_t msrs,
+                              uint32_t *curr_entry, const uint32_t nr_entries)
+{
+    const xen_msr_entry_t ent = { .idx = idx, .val = val };
+
+    if ( *curr_entry == nr_entries )
+        return -ENOBUFS;
+
+    if ( copy_to_buffer_offset(msrs, *curr_entry, &ent, 1) )
+        return -EFAULT;
+
+    ++*curr_entry;
+
+    return 0;
+}
+
+int x86_msr_copy_to_buffer(const struct cpu_policy *p,
+                           msr_entry_buffer_t msrs, uint32_t *nr_entries_p)
+{
+    const uint32_t nr_entries = *nr_entries_p;
+    uint32_t curr_entry = 0;
+
+#define COPY_MSR(idx, val)                                      \
+    ({                                                          \
+        int ret;                                                \
+                                                                \
+        if ( (ret = copy_msr_to_buffer(                         \
+                  idx, val, msrs, &curr_entry, nr_entries)) )   \
+            return ret;                                         \
+    })
+
+    COPY_MSR(MSR_INTEL_PLATFORM_INFO, p->platform_info.raw);
+    COPY_MSR(MSR_ARCH_CAPABILITIES,   p->arch_caps.raw);
+
+#undef COPY_MSR
+
+    *nr_entries_p = curr_entry;
+
+    return 0;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
--- a/xen/lib/x86/Makefile
+++ b/xen/lib/x86/Makefile
@@ -1,3 +1,2 @@
 obj-y += cpuid.o
-obj-y += msr.o
 obj-y += policy.o
--- a/xen/lib/x86/cpuid.c
+++ b/xen/lib/x86/cpuid.c
@@ -323,232 +323,6 @@ const uint32_t *x86_cpu_policy_lookup_de
 }
 
 /*
- * Copy a single cpuid_leaf into a provided xen_cpuid_leaf_t buffer,
- * performing boundary checking against the buffer size.
- */
-static int copy_leaf_to_buffer(uint32_t leaf, uint32_t subleaf,
-                               const struct cpuid_leaf *data,
-                               cpuid_leaf_buffer_t leaves,
-                               uint32_t *curr_entry, const uint32_t nr_entries)
-{
-    const xen_cpuid_leaf_t val = {
-        leaf, subleaf, data->a, data->b, data->c, data->d,
-    };
-
-    if ( *curr_entry == nr_entries )
-        return -ENOBUFS;
-
-    if ( copy_to_buffer_offset(leaves, *curr_entry, &val, 1) )
-        return -EFAULT;
-
-    ++*curr_entry;
-
-    return 0;
-}
-
-int x86_cpuid_copy_to_buffer(const struct cpu_policy *p,
-                             cpuid_leaf_buffer_t leaves, uint32_t *nr_entries_p)
-{
-    const uint32_t nr_entries = *nr_entries_p;
-    uint32_t curr_entry = 0, leaf, subleaf;
-
-#define COPY_LEAF(l, s, data)                                       \
-    ({                                                              \
-        int ret;                                                    \
-                                                                    \
-        if ( (ret = copy_leaf_to_buffer(                            \
-                  l, s, data, leaves, &curr_entry, nr_entries)) )   \
-            return ret;                                             \
-    })
-
-    /* Basic leaves. */
-    for ( leaf = 0; leaf <= MIN(p->basic.max_leaf,
-                                ARRAY_SIZE(p->basic.raw) - 1); ++leaf )
-    {
-        switch ( leaf )
-        {
-        case 0x4:
-            for ( subleaf = 0; subleaf < ARRAY_SIZE(p->cache.raw); ++subleaf )
-            {
-                COPY_LEAF(leaf, subleaf, &p->cache.raw[subleaf]);
-
-                if ( p->cache.subleaf[subleaf].type == 0 )
-                    break;
-            }
-            break;
-
-        case 0x7:
-            for ( subleaf = 0;
-                  subleaf <= MIN(p->feat.max_subleaf,
-                                 ARRAY_SIZE(p->feat.raw) - 1); ++subleaf )
-                COPY_LEAF(leaf, subleaf, &p->feat.raw[subleaf]);
-            break;
-
-        case 0xb:
-            for ( subleaf = 0; subleaf < ARRAY_SIZE(p->topo.raw); ++subleaf )
-            {
-                COPY_LEAF(leaf, subleaf, &p->topo.raw[subleaf]);
-
-                if ( p->topo.subleaf[subleaf].type == 0 )
-                    break;
-            }
-            break;
-
-        case 0xd:
-        {
-            uint64_t xstates = cpu_policy_xstates(p);
-
-            COPY_LEAF(leaf, 0, &p->xstate.raw[0]);
-            COPY_LEAF(leaf, 1, &p->xstate.raw[1]);
-
-            for ( xstates >>= 2, subleaf = 2;
-                  xstates && subleaf < ARRAY_SIZE(p->xstate.raw);
-                  xstates >>= 1, ++subleaf )
-                COPY_LEAF(leaf, subleaf, &p->xstate.raw[subleaf]);
-            break;
-        }
-
-        default:
-            COPY_LEAF(leaf, XEN_CPUID_NO_SUBLEAF, &p->basic.raw[leaf]);
-            break;
-        }
-    }
-
-    /* TODO: Port Xen and Viridian leaves to the new CPUID infrastructure. */
-    COPY_LEAF(0x40000000, XEN_CPUID_NO_SUBLEAF,
-              &(struct cpuid_leaf){ p->hv_limit });
-    COPY_LEAF(0x40000100, XEN_CPUID_NO_SUBLEAF,
-              &(struct cpuid_leaf){ p->hv2_limit });
-
-    /* Extended leaves. */
-    for ( leaf = 0; leaf <= MIN(p->extd.max_leaf & 0xffffUL,
-                                ARRAY_SIZE(p->extd.raw) - 1); ++leaf )
-        COPY_LEAF(0x80000000U | leaf, XEN_CPUID_NO_SUBLEAF, &p->extd.raw[leaf]);
-
-#undef COPY_LEAF
-
-    *nr_entries_p = curr_entry;
-
-    return 0;
-}
-
-int x86_cpuid_copy_from_buffer(struct cpu_policy *p,
-                               const cpuid_leaf_buffer_t leaves,
-                               uint32_t nr_entries, uint32_t *err_leaf,
-                               uint32_t *err_subleaf)
-{
-    unsigned int i;
-    xen_cpuid_leaf_t data;
-
-    if ( err_leaf )
-        *err_leaf = -1;
-    if ( err_subleaf )
-        *err_subleaf = -1;
-
-    /*
-     * A well formed caller is expected to pass an array with leaves in order,
-     * and without any repetitions.  However, due to per-vendor differences,
-     * and in the case of upgrade or levelled scenarios, we typically expect
-     * fewer than MAX leaves to be passed.
-     *
-     * Detecting repeated entries is prohibitively complicated, so we don't
-     * bother.  That said, one way or another if more than MAX leaves are
-     * passed, something is wrong.
-     */
-    if ( nr_entries > CPUID_MAX_SERIALISED_LEAVES )
-        return -E2BIG;
-
-    for ( i = 0; i < nr_entries; ++i )
-    {
-        struct cpuid_leaf l;
-
-        if ( copy_from_buffer_offset(&data, leaves, i, 1) )
-            return -EFAULT;
-
-        l = (struct cpuid_leaf){ data.a, data.b, data.c, data.d };
-
-        switch ( data.leaf )
-        {
-        case 0 ... ARRAY_SIZE(p->basic.raw) - 1:
-            switch ( data.leaf )
-            {
-            case 0x4:
-                if ( data.subleaf >= ARRAY_SIZE(p->cache.raw) )
-                    goto out_of_range;
-
-                array_access_nospec(p->cache.raw, data.subleaf) = l;
-                break;
-
-            case 0x7:
-                if ( data.subleaf >= ARRAY_SIZE(p->feat.raw) )
-                    goto out_of_range;
-
-                array_access_nospec(p->feat.raw, data.subleaf) = l;
-                break;
-
-            case 0xb:
-                if ( data.subleaf >= ARRAY_SIZE(p->topo.raw) )
-                    goto out_of_range;
-
-                array_access_nospec(p->topo.raw, data.subleaf) = l;
-                break;
-
-            case 0xd:
-                if ( data.subleaf >= ARRAY_SIZE(p->xstate.raw) )
-                    goto out_of_range;
-
-                array_access_nospec(p->xstate.raw, data.subleaf) = l;
-                break;
-
-            default:
-                if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
-                    goto out_of_range;
-
-                array_access_nospec(p->basic.raw, data.leaf) = l;
-                break;
-            }
-            break;
-
-        case 0x40000000:
-            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
-                goto out_of_range;
-
-            p->hv_limit = l.a;
-            break;
-
-        case 0x40000100:
-            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
-                goto out_of_range;
-
-            p->hv2_limit = l.a;
-            break;
-
-        case 0x80000000U ... 0x80000000U + ARRAY_SIZE(p->extd.raw) - 1:
-            if ( data.subleaf != XEN_CPUID_NO_SUBLEAF )
-                goto out_of_range;
-
-            array_access_nospec(p->extd.raw, data.leaf & 0xffff) = l;
-            break;
-
-        default:
-            goto out_of_range;
-        }
-    }
-
-    x86_cpu_policy_recalc_synth(p);
-
-    return 0;
-
- out_of_range:
-    if ( err_leaf )
-        *err_leaf = data.leaf;
-    if ( err_subleaf )
-        *err_subleaf = data.subleaf;
-
-    return -ERANGE;
-}
-
-/*
  * Local variables:
  * mode: C
  * c-file-style: "BSD"
--- a/xen/lib/x86/msr.c
+++ /dev/null
@@ -1,130 +0,0 @@
-#include "private.h"
-
-#include <xen/lib/x86/cpu-policy.h>
-
-/*
- * Copy a single MSR into the provided msr_entry_buffer_t buffer, performing a
- * boundary check against the buffer size.
- */
-static int copy_msr_to_buffer(uint32_t idx, uint64_t val,
-                              msr_entry_buffer_t msrs,
-                              uint32_t *curr_entry, const uint32_t nr_entries)
-{
-    const xen_msr_entry_t ent = { .idx = idx, .val = val };
-
-    if ( *curr_entry == nr_entries )
-        return -ENOBUFS;
-
-    if ( copy_to_buffer_offset(msrs, *curr_entry, &ent, 1) )
-        return -EFAULT;
-
-    ++*curr_entry;
-
-    return 0;
-}
-
-int x86_msr_copy_to_buffer(const struct cpu_policy *p,
-                           msr_entry_buffer_t msrs, uint32_t *nr_entries_p)
-{
-    const uint32_t nr_entries = *nr_entries_p;
-    uint32_t curr_entry = 0;
-
-#define COPY_MSR(idx, val)                                      \
-    ({                                                          \
-        int ret;                                                \
-                                                                \
-        if ( (ret = copy_msr_to_buffer(                         \
-                  idx, val, msrs, &curr_entry, nr_entries)) )   \
-            return ret;                                         \
-    })
-
-    COPY_MSR(MSR_INTEL_PLATFORM_INFO, p->platform_info.raw);
-    COPY_MSR(MSR_ARCH_CAPABILITIES,   p->arch_caps.raw);
-
-#undef COPY_MSR
-
-    *nr_entries_p = curr_entry;
-
-    return 0;
-}
-
-int x86_msr_copy_from_buffer(struct cpu_policy *p,
-                             const msr_entry_buffer_t msrs, uint32_t nr_entries,
-                             uint32_t *err_msr)
-{
-    unsigned int i;
-    xen_msr_entry_t data;
-    int rc;
-
-    if ( err_msr )
-        *err_msr = -1;
-
-    /*
-     * A well formed caller is expected to pass an array with entries in
-     * order, and without any repetitions.  However, due to per-vendor
-     * differences, and in the case of upgrade or levelled scenarios, we
-     * typically expect fewer than MAX entries to be passed.
-     *
-     * Detecting repeated entries is prohibitively complicated, so we don't
-     * bother.  That said, one way or another if more than MAX entries are
-     * passed, something is wrong.
-     */
-    if ( nr_entries > MSR_MAX_SERIALISED_ENTRIES )
-        return -E2BIG;
-
-    for ( i = 0; i < nr_entries; i++ )
-    {
-        if ( copy_from_buffer_offset(&data, msrs, i, 1) )
-            return -EFAULT;
-
-        if ( data.flags ) /* .flags MBZ */
-        {
-            rc = -EINVAL;
-            goto err;
-        }
-
-        switch ( data.idx )
-        {
-            /*
-             * Assign data.val to p->field, checking for truncation if the
-             * backing storage for field is smaller than uint64_t
-             */
-#define ASSIGN(field)                             \
-({                                                \
-    if ( (typeof(p->field))data.val != data.val ) \
-    {                                             \
-        rc = -EOVERFLOW;                          \
-        goto err;                                 \
-    }                                             \
-    p->field = data.val;                          \
-})
-
-        case MSR_INTEL_PLATFORM_INFO: ASSIGN(platform_info.raw); break;
-        case MSR_ARCH_CAPABILITIES:   ASSIGN(arch_caps.raw);     break;
-
-#undef ASSIGN
-
-        default:
-            rc = -ERANGE;
-            goto err;
-        }
-    }
-
-    return 0;
-
- err:
-    if ( err_msr )
-        *err_msr = data.idx;
-
-    return rc;
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
--- a/xen/lib/x86/private.h
+++ b/xen/lib/x86/private.h
@@ -12,9 +12,6 @@
 
 #include <asm/msr.h>
 
-#define copy_to_buffer_offset copy_to_guest_offset
-#define copy_from_buffer_offset copy_from_guest_offset
-
 #else
 
 #include <errno.h>
@@ -35,34 +32,6 @@ static inline bool test_bit(unsigned int
     return addr[bit / 8] & (1u << (bit % 8));
 }
 
-#define array_access_nospec(a, i) (a)[(i)]
-
-/* memcpy(), but with copy_to_guest_offset()'s API. */
-#define copy_to_buffer_offset(dst, index, src, nr)      \
-({                                                      \
-    const typeof(*(src)) *src_ = (src);                 \
-    typeof(*(dst)) *dst_ = (dst);                       \
-    typeof(index) index_ = (index);                     \
-    typeof(nr) nr_ = (nr), i_;                          \
-                                                        \
-    for ( i_ = 0; i_ < nr_; i_++ )                      \
-        dst_[index_ + i_] = src_[i_];                   \
-    0;                                                  \
-})
-
-/* memcpy(), but with copy_from_guest_offset()'s API. */
-#define copy_from_buffer_offset(dst, src, index, nr)    \
-({                                                      \
-    const typeof(*(src)) *src_ = (src);                 \
-    typeof(*(dst)) *dst_ = (dst);                       \
-    typeof(index) index_ = (index);                     \
-    typeof(nr) nr_ = (nr), i_;                          \
-                                                        \
-    for ( i_ = 0; i_ < nr_; i_++ )                      \
-        dst_[i_] = src_[index_ + i_];                   \
-    0;                                                  \
-})
-
 #endif /* __XEN__ */
 
 #endif /* XEN_LIB_X86_PRIVATE_H */


