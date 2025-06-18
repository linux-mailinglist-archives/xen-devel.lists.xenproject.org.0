Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33844ADE853
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 12:18:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019028.1395888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRprm-0003Yv-HS; Wed, 18 Jun 2025 10:18:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019028.1395888; Wed, 18 Jun 2025 10:18:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRprm-0003WT-El; Wed, 18 Jun 2025 10:18:02 +0000
Received: by outflank-mailman (input) for mailman id 1019028;
 Wed, 18 Jun 2025 10:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRprk-0003WN-Qf
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 10:18:00 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 81e95848-4c2d-11f0-a30a-13f23c93f187;
 Wed, 18 Jun 2025 12:17:58 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a57c8e247cso3213940f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 03:17:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-313c1c6a80bsm12349266a91.44.2025.06.18.03.17.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 03:17:57 -0700 (PDT)
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
X-Inumbo-ID: 81e95848-4c2d-11f0-a30a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750241878; x=1750846678; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lTcj4F18ielqy3N30HxOMFo1QHYtCfKFunvb6xsSaz8=;
        b=f5/zzFb/klmpT8RUZJuHiPJKV/N39T5ph6gLBh4H4gBxRm5WglGvuy25hDTYS6d8pX
         1XBgChNd8MdYzDpo8jN8tZBWs64A/s7s+FFqJ6gprdyzh0QytSBKB2O4Qi+ngoxr6TsJ
         PhQMEKk++NRYF8VZHEYv7hpeOSL0t3QcY3U5I1ywn3KMBSCNQzhAG5Wk44uyuchx4oN2
         X/5e4eKvMWg3+Q0kzh3Wl2jWMTbP6PINZ/YzrPQwqgskTL+sqSvhJzgTz11RrHuTrlhd
         DgKwyGf0SYHLj1ZOmSr5aHkNM0c57Ic979YgVn8jL6byHlI14JdY8hc0KviR9rfrDR2k
         VidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750241878; x=1750846678;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTcj4F18ielqy3N30HxOMFo1QHYtCfKFunvb6xsSaz8=;
        b=MZG+O0F08sNR3t+UFlrFDwWKEtlAdd/MHVqsLuPB3sLuRTOM8gE8Do98Tn9sHUphN/
         e7pSDCUkiX9LAhvwg3XCmPPjKjcTUt89xwMJjgSzCURL4zN3gkn5ygY6/eUz+lzqKL+O
         i6aXQahPhyH3wyogCgVDoNKhivYG7uhvt6QanRWiHEPP+WCml5VY8UCbFLP6lmgMSdOn
         3CXomusSHX4g+gMwtyasSSjHWmCOiSblYJlXWMd6T0Qjcri9StBr3cckrxxnWzEfGMq/
         yJ8cMpYWsS6DcwKNyPX1P+JEPsjIzdoGzRs1Idj5o2IozJP4okpVgXIrXVfPWNZN+T6k
         cbKQ==
X-Gm-Message-State: AOJu0Yzv0EpVoyjtlSHirOT5f3B9ksQOzZyiPA+Kqv/EWYnE1mUPzqa3
	5/eIFLDTVFdrNgM9t9TXCHIch1oTrfK8Uf67mYxNk5PS5INzkZJDVXYhNCVcbyPsAv3YH49B6SY
	VYZE=
X-Gm-Gg: ASbGncv+eJx02PsKWP8eVPnB2lhvunJvRVQlqLnr+qZk+OR1R8NKmN6V0lW7Ox6FGhW
	BGvqP/pkjAAeUUYmO45aqLBwIwpnGCM/v56/s9IKn5G3UGOJS+8lVEcR/ejzVfFVzYqbv8gdLfZ
	yFCGyLlqasVjDTg35M50F/UYFezpcywhzH31UtqUO9qGEpcwmt/A1mP4yjmlCHwUxhXZqz8w8Fy
	OqkyQx4sjmEHB6wpRnJ7aYYm+lnvDg5//j/dHbdMMJlgd+SQFIOn5vQ7cJwvKcBQsXRk2V166in
	+z0mWwCY71tx3lSmfLPi95OUIoaCVI7HniZUpEIbrfHZgTXgcaL3gIDyoBDehYu8KUBbd8UdIuv
	186b3Wov6A97PSmHNz/rZ6sqKrlFG9ZMkwZdm12LLwYFYYk4=
X-Google-Smtp-Source: AGHT+IFhpdbRQbB2G+DgsX8ubk6qlIxzd0fwMkTgMBrOdi1huey823h/9o1k8OaXDfEpVJixAdQz/A==
X-Received: by 2002:a05:6000:3112:b0:3a4:e480:b5df with SMTP id ffacd0b85a97d-3a572e79749mr14751450f8f.44.1750241878068;
        Wed, 18 Jun 2025 03:17:58 -0700 (PDT)
Message-ID: <57107b15-affc-43a6-b6f3-6196b40bbc8b@suse.com>
Date: Wed, 18 Jun 2025 12:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xvmalloc: extend to cover multi-dimensional arrays
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Take care of the multiplication(s) involved in determining overall size
in the macros themselves, saturating to ULONG_MAX. This way on 64-bit
systems the subsequent check against UINT_MAX will fail, while on 32-
bit systems allocations of this size simply cannot be fulfilled anyway
(such an allocation would consume the entire address space).

The only place where we truly consume guest input (but constrained to
hwdom) is cpufreq_statistic_init(). Play safe however and convert the
other three instances where a multiplication is involved as well.

While touching those sites also switch to xv*alloc_array(), following
what was settled upon when those were introduced. Don't bother extending
x*alloc_array() the same way.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
To my surprise code gen even improves a tiny bit for do_memory_op(), in
surrounding code (with gcc14).

--- a/xen/arch/x86/cpu/mcheck/mctelem.c
+++ b/xen/arch/x86/cpu/mcheck/mctelem.c
@@ -20,6 +20,7 @@
 #include <xen/sched.h>
 #include <xen/cpumask.h>
 #include <xen/event.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/processor.h>
 #include <asm/system.h>
@@ -340,7 +341,7 @@ void __init mctelem_init(unsigned int da
 
 	if ((mctctl.mctc_elems = xmalloc_array(struct mctelem_ent,
 	    MC_NENT)) == NULL ||
-	    (datarr = xmalloc_bytes(MC_NENT * datasz)) == NULL) {
+	    (datarr = xvmalloc_array(char, MC_NENT, datasz)) == NULL) {
 		xfree(mctctl.mctc_elems);
 		printk("Allocations for MCA telemetry failed\n");
 		return;
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -26,6 +26,8 @@
 #include <xen/hypercall.h>
 #include <xen/vm_event.h>
 #include <xen/monitor.h>
+#include <xen/xvmalloc.h>
+
 #include <asm/current.h>
 #include <asm/irq.h>
 #include <asm/page.h>
@@ -160,7 +162,7 @@ void vnuma_destroy(struct vnuma_info *vn
     {
         xfree(vnuma->vmemrange);
         xfree(vnuma->vcpu_to_vnode);
-        xfree(vnuma->vdistance);
+        xvfree(vnuma->vdistance);
         xfree(vnuma->vnode_to_pnode);
         xfree(vnuma);
     }
@@ -197,7 +199,7 @@ static struct vnuma_info *vnuma_alloc(un
     if ( !vnuma )
         return ERR_PTR(-ENOMEM);
 
-    vnuma->vdistance = xmalloc_array(unsigned int, nr_vnodes * nr_vnodes);
+    vnuma->vdistance = xvmalloc_array(unsigned int, nr_vnodes, nr_vnodes);
     vnuma->vcpu_to_vnode = xmalloc_array(unsigned int, nr_vcpus);
     vnuma->vnode_to_pnode = xmalloc_array(nodeid_t, nr_vnodes);
     vnuma->vmemrange = xmalloc_array(xen_vmemrange_t, nr_ranges);
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -26,6 +26,8 @@
 #include <xen/sections.h>
 #include <xen/trace.h>
 #include <xen/types.h>
+#include <xen/xvmalloc.h>
+
 #include <asm/current.h>
 #include <asm/hardirq.h>
 #include <asm/p2m.h>
@@ -1750,7 +1752,7 @@ long do_memory_op(unsigned long cmd, XEN
 
         read_unlock(&d->vnuma_rwlock);
 
-        tmp.vdistance = xmalloc_array(unsigned int, dom_vnodes * dom_vnodes);
+        tmp.vdistance = xvmalloc_array(unsigned int, dom_vnodes, dom_vnodes);
         tmp.vmemrange = xmalloc_array(xen_vmemrange_t, dom_vranges);
         tmp.vcpu_to_vnode = xmalloc_array(unsigned int, dom_vcpus);
 
@@ -1813,7 +1815,7 @@ long do_memory_op(unsigned long cmd, XEN
  vnumainfo_out:
         rcu_unlock_domain(d);
 
-        xfree(tmp.vdistance);
+        xvfree(tmp.vdistance);
         xfree(tmp.vmemrange);
         xfree(tmp.vcpu_to_vnode);
         break;
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -36,6 +36,7 @@
 #include <xen/percpu.h>
 #include <xen/domain.h>
 #include <xen/acpi.h>
+#include <xen/xvmalloc.h>
 
 #include <public/sysctl.h>
 #include <acpi/cpufreq/cpufreq.h>
@@ -126,7 +127,7 @@ int cpufreq_statistic_init(unsigned int
     }
     per_cpu(cpufreq_statistic_data, cpu) = pxpt;
 
-    pxpt->u.trans_pt = xzalloc_array(uint64_t, count * count);
+    pxpt->u.trans_pt = xvzalloc_array(uint64_t, count, count);
     if ( !pxpt->u.trans_pt )
     {
         xfree(pxpt);
@@ -137,7 +138,7 @@ int cpufreq_statistic_init(unsigned int
     pxpt->u.pt = xzalloc_array(struct pm_px_val, count);
     if ( !pxpt->u.pt )
     {
-        xfree(pxpt->u.trans_pt);
+        xvfree(pxpt->u.trans_pt);
         xfree(pxpt);
         spin_unlock(cpufreq_statistic_lock);
         return -ENOMEM;
@@ -171,7 +172,7 @@ void cpufreq_statistic_exit(unsigned int
         return;
     }
 
-    xfree(pxpt->u.trans_pt);
+    xvfree(pxpt->u.trans_pt);
     xfree(pxpt->u.pt);
     xfree(pxpt);
     per_cpu(cpufreq_statistic_data, cpu) = NULL;
--- a/xen/include/xen/xvmalloc.h
+++ b/xen/include/xen/xvmalloc.h
@@ -22,11 +22,24 @@
     (typeof(*(ptr)) *)p_;                                      \
 })
 
+#define DIM_MUL1(n) (n)
+#define DIM_MUL2(n1, n2) ({                                     \
+    unsigned long res_;                                         \
+    __builtin_umull_overflow(n1, n2, &res_) ? ULONG_MAX : res_; \
+})
+#define DIM_MUL3(n1, n2, n3) DIM_MUL2(DIM_MUL2(n1, n2), n3)
+#define DIM_MUL4(n1, n2, n3, n4) DIM_MUL2(DIM_MUL2(n1, n2), \
+                                          DIM_MUL2(n3, n4))
+#define DIM_MUL_(n, nums...) DIM_MUL##n(nums)
+#define DIM_MUL(n, nums...) DIM_MUL_(n, ## nums)
+
 /* Allocate space for array of typed objects. */
-#define xvmalloc_array(_type, _num) \
-    ((_type *)_xvmalloc_array(sizeof(_type), __alignof__(_type), _num))
-#define xvzalloc_array(_type, _num) \
-    ((_type *)_xvzalloc_array(sizeof(_type), __alignof__(_type), _num))
+#define xvmalloc_array(type, num, nums...) \
+    ((type *)_xvmalloc_array(sizeof(type), __alignof__(type), \
+                             DIM_MUL(count_args(num, ## nums), num, ## nums)))
+#define xvzalloc_array(type, num, nums...) \
+    ((type *)_xvzalloc_array(sizeof(type), __alignof__(type), \
+                             DIM_MUL(count_args(num, ## nums), num, ## nums)))
 
 /* Allocate space for a structure with a flexible array of typed objects. */
 #define xvzalloc_flex_struct(type, field, nr) \

