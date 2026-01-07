Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6EBCFE3B4
	for <lists+xen-devel@lfdr.de>; Wed, 07 Jan 2026 15:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196753.1514491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdUMK-0004xz-UG; Wed, 07 Jan 2026 14:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196753.1514491; Wed, 07 Jan 2026 14:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdUMK-0004vZ-RL; Wed, 07 Jan 2026 14:18:00 +0000
Received: by outflank-mailman (input) for mailman id 1196753;
 Wed, 07 Jan 2026 14:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdUMJ-0004vN-4A
 for xen-devel@lists.xenproject.org; Wed, 07 Jan 2026 14:17:59 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a988fb47-ebd3-11f0-b15e-2bf370ae4941;
 Wed, 07 Jan 2026 15:17:56 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4775e891b5eso10088615e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 07 Jan 2026 06:17:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d865e3d22sm14836415e9.1.2026.01.07.06.17.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jan 2026 06:17:55 -0800 (PST)
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
X-Inumbo-ID: a988fb47-ebd3-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767795476; x=1768400276; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B51kdTgZdEeG/nCjLbcF/Mc90bD2P9ay1J22aYRdGG8=;
        b=f3LIjd6SMJwA+IGNBXAmpLrn+YRheYtBAzuN45DiYYL7IVV8OgFscxAFO5k8CRT02o
         /Fdez4RZV5Yea2lqpTnKsMZ1kEwfsw6o0K2tZMsZrpuKkpbOVDUgcjMa0jA2YaqyHMrO
         UC4iklCG5IljosUSmToaTX959d0KhppOOQTZOzoXQtG7wlXHqnXG8V5aqkja3J45bCjt
         rN+TzPdux6yBo6ZWU8gwul77dqibkt5JrMYI1xZfXqySkWkoN5K7lHG5fL5tqZXHoQvp
         ei4R0qmnYt6Ix7Yj8fLdwjdjtAboxvNaC61OcxEfYtnitOgv1FyO+B4WdhXheRX5WvR8
         xlkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795476; x=1768400276;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B51kdTgZdEeG/nCjLbcF/Mc90bD2P9ay1J22aYRdGG8=;
        b=b8wFp/NgPl4p2Pgg5ZhSFK7C0R8jBzCwg5e7sqXGd93S7N2oYkZNnDs6MlnxqLLnkJ
         CRTB535f3wTuwIsCMfEvfLKquiSERVs3zY7Jc/UVzZWi/EIbyoIJJimOPWPaTbHoHR+y
         nHb9sRDBmq+GBf+DgzMB9A3ST1Xu+MTHKz7sv9flYRZLQCSqDRG0FiutpiupUVutVzOW
         WVJI/80j9UgbudetkuVmocc39T9GHl9l6/cXhK/ZVSy5EUFXlcnUSC7U2B70xJKXxaZW
         zLFrAw1JHfWmNYHem6Vr3JsP5lvBLZZyqEtPjCwdBlK4AZmHSlVggdH1f4IwlEsdGrJD
         aDIg==
X-Gm-Message-State: AOJu0YwAdiEMZEN5AM/4zK1Qj8ZafHD4mHxZJCvxTZdlMqjy8QSurYsO
	2lBbRK6DSMATP4qiFBXMrtO/v7ojfi2Jkv9IFmSQVxS8WG1phTXEHdQZSBxCPrxjH/JADOgOQaC
	Vfrg=
X-Gm-Gg: AY/fxX79lOum2QiLmySDXBAcO13/iAOgDQEFa4+jIxYVjcygQaSyW9mTwPQe63wUXLG
	aJWf4S+6eWr7XaX/q8eYbuRRNnrmX6A3dciwN1srcJglReatRJrtt3Y+R8ZAR8SHrgtnrn3pDGV
	oBbRnfZpq2ha2zp467pmQKHT1Q15ohvdiQOsPK2Rzxe06RkRskxr76yw6OpDDugWQ5RpH8JS5Ie
	HrD7Jcj0xd6AM9LEwTo1CFdpAWF+2FS4H0qe+NLifkz7dBMWXBqRU1/NT739DY5ywLDIhi1JgVw
	uEBliFpeE+DaVnIbuMhLrhzoWh+IfTIAth85e/QQVxQ8Rp68zeFw1BdQMYgC+Saz+OBYtYUtnPQ
	rIm7Y1vEOygg5jjvhmA4VMcB/LK0GajefnBe57MoSBYzG8H17MnV/uXqaR9nwJB4TS2c9t9y61N
	hLkb1eazMXwKKICWga48me4X5xxzkVwxqX0GXCyGXtGRKfb433/xyefI8jloq2Ja0AYzKapQ50A
	YE=
X-Google-Smtp-Source: AGHT+IHmSoe83rxhwzHPP+KD5pqvo4aJb6x8vD2N1054k/CIKMHmACtTrPmbbUkHsYqblgUcKKFC0A==
X-Received: by 2002:a05:600c:1991:b0:477:55c9:c3ea with SMTP id 5b1f17b1804b1-47d84b40aa4mr34943525e9.35.1767795475783;
        Wed, 07 Jan 2026 06:17:55 -0800 (PST)
Message-ID: <d5045a94-a38b-4c56-b4c7-61503589747d@suse.com>
Date: Wed, 7 Jan 2026 15:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] x86/cpu-policy: split out copy-in/-out functions
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
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
In-Reply-To: <4bd68e41-e665-4992-9d3c-0086bb5195ef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This is to aid with MGMT_HYPERCALL work, leaving the functions potentially
unreferenced (which Misra dislikes). By moving them to separate archive
members, the linker simply will not pick them up when not needed.

As the CPUID and MSR ones are always used together, put the "from" and
"to" variants of each together in one file respectively.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Re-base over moving of the entire directory.
---
 xen/arch/x86/lib/cpu-policy/Makefile.common   |   3 +-
 .../x86/lib/cpu-policy/copy-from-buffer.c     | 238 ++++++++++++++++++
 xen/arch/x86/lib/cpu-policy/copy-to-buffer.c  | 204 +++++++++++++++
 xen/arch/x86/lib/cpu-policy/cpuid.c           | 226 -----------------
 xen/arch/x86/lib/cpu-policy/msr.c             | 130 ----------
 xen/arch/x86/lib/cpu-policy/private.h         |  31 ---
 6 files changed, 444 insertions(+), 388 deletions(-)
 create mode 100644 xen/arch/x86/lib/cpu-policy/copy-from-buffer.c
 create mode 100644 xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
 delete mode 100644 xen/arch/x86/lib/cpu-policy/msr.c

diff --git a/xen/arch/x86/lib/cpu-policy/Makefile.common b/xen/arch/x86/lib/cpu-policy/Makefile.common
index 35475af78048..aff662aae83b 100644
--- a/xen/arch/x86/lib/cpu-policy/Makefile.common
+++ b/xen/arch/x86/lib/cpu-policy/Makefile.common
@@ -1,3 +1,4 @@
+lib-y += copy-from-buffer.o
+lib-y += copy-to-buffer.o
 lib-y += cpuid.o
-lib-y += msr.o
 lib-y += policy.o
diff --git a/xen/arch/x86/lib/cpu-policy/copy-from-buffer.c b/xen/arch/x86/lib/cpu-policy/copy-from-buffer.c
new file mode 100644
index 000000000000..24f7bc79d2bd
--- /dev/null
+++ b/xen/arch/x86/lib/cpu-policy/copy-from-buffer.c
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
diff --git a/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c b/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
new file mode 100644
index 000000000000..190dac746cdf
--- /dev/null
+++ b/xen/arch/x86/lib/cpu-policy/copy-to-buffer.c
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
diff --git a/xen/arch/x86/lib/cpu-policy/cpuid.c b/xen/arch/x86/lib/cpu-policy/cpuid.c
index 6298d051f2a6..3162e795bc21 100644
--- a/xen/arch/x86/lib/cpu-policy/cpuid.c
+++ b/xen/arch/x86/lib/cpu-policy/cpuid.c
@@ -322,232 +322,6 @@ const uint32_t *x86_cpu_policy_lookup_deep_deps(uint32_t feature)
     return NULL;
 }
 
-/*
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
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/lib/cpu-policy/msr.c b/xen/arch/x86/lib/cpu-policy/msr.c
deleted file mode 100644
index e04b9ca01302..000000000000
--- a/xen/arch/x86/lib/cpu-policy/msr.c
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
diff --git a/xen/arch/x86/lib/cpu-policy/private.h b/xen/arch/x86/lib/cpu-policy/private.h
index aedd8e482121..57f254c3e917 100644
--- a/xen/arch/x86/lib/cpu-policy/private.h
+++ b/xen/arch/x86/lib/cpu-policy/private.h
@@ -12,9 +12,6 @@
 
 #include <asm/msr.h>
 
-#define copy_to_buffer_offset copy_to_guest_offset
-#define copy_from_buffer_offset copy_from_guest_offset
-
 #else
 
 #include <errno.h>
@@ -35,34 +32,6 @@ static inline bool test_bit(unsigned int bit, const void *vaddr)
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


