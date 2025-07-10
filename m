Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE26B00009
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jul 2025 13:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039345.1411199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZp3X-0002GV-6C; Thu, 10 Jul 2025 11:03:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039345.1411199; Thu, 10 Jul 2025 11:03:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZp3X-0002DO-33; Thu, 10 Jul 2025 11:03:11 +0000
Received: by outflank-mailman (input) for mailman id 1039345;
 Thu, 10 Jul 2025 11:03:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V320=ZX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uZp3V-0002DI-FS
 for xen-devel@lists.xenproject.org; Thu, 10 Jul 2025 11:03:09 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70a5e84e-5d7d-11f0-b894-0df219b8e170;
 Thu, 10 Jul 2025 13:02:59 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-453647147c6so7593575e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 10 Jul 2025 04:02:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de42849d7sm17419475ad.21.2025.07.10.04.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jul 2025 04:02:57 -0700 (PDT)
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
X-Inumbo-ID: 70a5e84e-5d7d-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752145378; x=1752750178; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W6r0Bex0UStGaZB6/IW4HglFMAoiQOhLuQjg8gMplp0=;
        b=NiBdcjBnHvrv6qztvNDQAdVWCjWwKvk2KxVrgooicU0ZGgfp+qsOvJdBrqOuylxLjl
         A0BvkVh6ge5WfHCSVRyupzwlmg8BdD+rENXwp6nTIxRezmWaQebqDHwv6T8R7JwV2rDX
         18ESCvObTzztOpdRyfCXWYeXVtyZtuMfhCD42fKtHx7q8VRExheOUIRkZsRHD1jEXy7B
         P3C++knQYdmSY2uPGbAtfOjaXh9ek9i6vngfSPnbbrYv/DnXtkE6cOrio6ffs4eAH5qL
         hsZDFRrg30GwObpN8rZQwmY1YVi3LgwYDd4inNv5fqY6F15bwFyUNXq6PtZkAmJaJ878
         4MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752145378; x=1752750178;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W6r0Bex0UStGaZB6/IW4HglFMAoiQOhLuQjg8gMplp0=;
        b=OOAbuANz101uszi/zw58BfvBLGU+2qaNapYAFsdvEJsJkxS6UaqiIfCZ91ddRmLJvH
         H4N9cXPMWebWnU/eDpRBod+6dcO7rdZRf3Ol6guz52q4ERWV5kG+z1ZU8jeYRPQ06e4t
         bzlMP8LM1Dtx0bbRlYlPvkVXzfGZMOC1B4nIELcUfm0Pre4TiNtZS7cbVm6Ji8skEzhn
         hgFVYfyPeqXU7Z8ne3VBFSrHovr3eoqMgAyJx6M/UbLC7FdisvJgBx+5HuJRlGtNcEXr
         BkXqksgLYSolIFE36GHYQztBCklyQfcUdgkjqqJSnFxoaVphqbL9QoMtOgY4AuY+egmx
         vHZw==
X-Gm-Message-State: AOJu0YwQ1nAOzH2EwboV0C6nEARp/bgrlwfJx3nBPsy+QhnJSIINvV7A
	tmLCTpf3dQT5AbRcs6DWT3n5Toxwuju0dhY5G03M3MNga5VBIUsGS4CQlyNbTPJ5gAiRBR7en+D
	hGwY=
X-Gm-Gg: ASbGncsNclPROIc5aqwrfpmMpxBr4Q7/WTvU7kBwHk4d69kelsuJliCZVpBYYWCW/yk
	43Ufp4h2GRlOiF1LkpRi6sEcEvOXrxO9gIPbXDnvXvXVWlJh3NreD12+4R1ZQ35xMfLOWvVlbNK
	yyuLz6f2w8v9U3EhjNrmlNG7YlHoV2yI5ySNgcDTUEp2iZPRGuHpIjG+9Eds0uYEgvYAljC8DOJ
	kvznJ1Zga/Didxo74fkU4HtMYo2Fmz/jY9gltxcM1/6DdLY1NXpjc9rvsEwvZmK/9ZaT1QTDpV1
	4GyYfuhBdIsxhryWz79ZNxLkfNSWJ/AWvL3+q2Xdg5v2eozd0sI4pHmOCp/j6B9JitEYu3/sZhn
	JjsQAjbCxe8dT9KZS4tGlkYWrb5x/9y2gSa5sZrPTK6S+kItzuvAZsG3DpQ==
X-Google-Smtp-Source: AGHT+IGJ/fglKlpIAil8MM7eHZGPbQlR1Z7JHbQcT/bsBtov3NcEpy28fVDvySdjap6B9+VB+cHJZA==
X-Received: by 2002:a05:6000:25c4:b0:3a5:52d4:5b39 with SMTP id ffacd0b85a97d-3b5e44da884mr5552176f8f.8.1752145378395;
        Thu, 10 Jul 2025 04:02:58 -0700 (PDT)
Message-ID: <af01370b-4482-49ff-ada7-3e02d3f31d1a@suse.com>
Date: Thu, 10 Jul 2025 13:02:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] xvmalloc: extend to cover 2-dimensional arrays
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
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
---
v2: Drop (unused) logic for 3- and 4-dim arrays. Re-base.

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
@@ -125,7 +126,7 @@ int cpufreq_statistic_init(unsigned int
         return -ENOMEM;
     }
 
-    pxpt->u.trans_pt = xzalloc_array(uint64_t, count * count);
+    pxpt->u.trans_pt = xvzalloc_array(uint64_t, count, count);
     if ( !pxpt->u.trans_pt )
     {
         xfree(pxpt);
@@ -136,7 +137,7 @@ int cpufreq_statistic_init(unsigned int
     pxpt->u.pt = xzalloc_array(struct pm_px_val, count);
     if ( !pxpt->u.pt )
     {
-        xfree(pxpt->u.trans_pt);
+        xvfree(pxpt->u.trans_pt);
         xfree(pxpt);
         spin_unlock(cpufreq_statistic_lock);
         return -ENOMEM;
@@ -172,7 +173,7 @@ void cpufreq_statistic_exit(unsigned int
         return;
     }
 
-    xfree(pxpt->u.trans_pt);
+    xvfree(pxpt->u.trans_pt);
     xfree(pxpt->u.pt);
     xfree(pxpt);
     per_cpu(cpufreq_statistic_data, cpu) = NULL;
--- a/xen/include/xen/xvmalloc.h
+++ b/xen/include/xen/xvmalloc.h
@@ -22,11 +22,21 @@
     (typeof(*(ptr)) *)p_;                                      \
 })
 
+#define DIM_MUL1(n) (n)
+#define DIM_MUL2(n1, n2) ({                                     \
+    unsigned long res_;                                         \
+    __builtin_umull_overflow(n1, n2, &res_) ? ULONG_MAX : res_; \
+})
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

