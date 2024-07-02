Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F15D4923AB6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 11:52:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752172.1160298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaBL-00063V-DB; Tue, 02 Jul 2024 09:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752172.1160298; Tue, 02 Jul 2024 09:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOaBL-00060l-9k; Tue, 02 Jul 2024 09:52:15 +0000
Received: by outflank-mailman (input) for mailman id 752172;
 Tue, 02 Jul 2024 09:52:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WXFQ=OC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOaBJ-00060d-TY
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 09:52:13 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1335896-3858-11ef-958a-bbd156597b9e;
 Tue, 02 Jul 2024 11:52:12 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec61eeed8eso49284311fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 02:52:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70803ecf8cdsm8019882b3a.126.2024.07.02.02.52.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 02:52:11 -0700 (PDT)
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
X-Inumbo-ID: c1335896-3858-11ef-958a-bbd156597b9e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719913932; x=1720518732; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UTwYfh4+dc9yq+apCt2SE7M4PIFKpjWEAQB5n6LxZxE=;
        b=aoB83JcOKAarJAWakqAdfazrUkcPL1xAXE5nxFlrLUJzK+xpvboca7tz27u4ohwqxf
         SFB7hjlSylRDiapnzzZnxDe95BF5kjKY9GSh1zLRDKBsXz9Kzj0DjTLB3leoGkoHEJkT
         8Y2YbLKqTjOeolyUsS1VXRXWcz+SEKMxEjRQjJ648tmbNoMTVmHAQkorwhmjbWMcQSz4
         6VIck2Yikspw27nSyQXBDNnrmIXxJw7ZeQQ18UNn08oTMwGrtTspTMj9K5z5MEGkaMoO
         KkrmZEsYE5qgGAJ4UGtlO5YXCqVUE2zlRucY4wCH1UDD1wMUFQTte9lNp4XJErEiEMFW
         aLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719913932; x=1720518732;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UTwYfh4+dc9yq+apCt2SE7M4PIFKpjWEAQB5n6LxZxE=;
        b=vFX7I91g5Smcpzaipuj12NoeArwUkpASDqIyhvmvH1MTdWbhNBYXixwZ68GqwX+lWH
         DES9dKsPPnbcF/jR/fQ+hoS2nKfwQfGClfr7B4CV/Y0G2hYFtyQAw7/gXluqyhUF2/Ym
         IVf/vAVFGPUhWPO5O2SN+18JgIXPXFCgNV6aWbrjYurZu/U98RCrAJXhpexzJ3mLftKj
         n0A9d222ZZa0zZCT5Z7usoiWKvFC0dPx1hJF6I7Q0cP6SU5ntVlCqwrg5JQdMQSjIwWX
         JbDnUjiwzfW+YzCQnBpNHDdlM0KeO3JxJAWwLoUxmiByL3BgYarCyK8Eri1jHKASwLpk
         r8ow==
X-Gm-Message-State: AOJu0YzRmYIe/N/ArjUa+nNZ/M8kUuFiVKF3qncLCJahM8hRKUk3eenE
	MvGfZaVv3y+SuKHnpEn37NqjdbDHX+GHxXOXGrMgzpzfm6C23ksV2IzH1x2OOP5Ye3JKW1Cpcf4
	=
X-Google-Smtp-Source: AGHT+IHVX7g1f6mraouK3efgcoKG6wstLSIFTOInGxA/V+QOE5vPYhuAU6RGJNiw5UizGFzI+v2pNg==
X-Received: by 2002:a05:651c:1038:b0:2ec:661e:e83e with SMTP id 38308e7fff4ca-2ee5e37537cmr43705131fa.23.1719913931775;
        Tue, 02 Jul 2024 02:52:11 -0700 (PDT)
Message-ID: <c76a60c9-c491-44bd-a6be-0199f0022e3d@suse.com>
Date: Tue, 2 Jul 2024 11:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 for-4.19? 1/2] cmdline: document and enforce
 "extra_guest_irqs" upper bounds
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <03f6674c-f2d1-4ec1-995e-a3e25278ceac@suse.com>
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
In-Reply-To: <03f6674c-f2d1-4ec1-995e-a3e25278ceac@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

PHYSDEVOP_pirq_eoi_gmfn_v<N> accepting just a single GFN implies that no
more than 32k pIRQ-s can be used by a domain on x86. Document this upper
bound.

To also enforce the limit, (ab)use both arch_hwdom_irqs() (changing its
parameter type) and setup_system_domains(). This is primarily to avoid
exposing the two static variables or introducing yet further arch hooks.

While touching arch_hwdom_irqs() also mark it hwdom-init.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>
---
Instead of passing dom_xen into arch_hwdom_irqs(), NULL could also be
used. That would make the connection to setup_system_domains() yet more
weak, though.
---
v4: arch_hwdom_irqs() -> __hwdom_init. Local constant for upper bound in
    arch_hwdom_irqs(). Re-base.
v2: Also enforce these bounds. Adjust doc to constrain the bound to x86
    only. Re-base over new earlier patch.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1175,7 +1175,8 @@ common for all domUs, while the optional
 is for dom0.  Changing the setting for domU has no impact on dom0 and vice
 versa.  For example to change dom0 without changing domU, use
 `extra_guest_irqs=,512`.  The default value for Dom0 and an eventual separate
-hardware domain is architecture dependent.
+hardware domain is architecture dependent.  The upper limit for both values on
+x86 is such that the resulting total number of IRQs can't be higher than 32768.
 Note that specifying zero as domU value means zero, while for dom0 it means
 to use the default.
 
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2660,18 +2660,20 @@ void __init ioapic_init(void)
            nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
 }
 
-unsigned int arch_hwdom_irqs(domid_t domid)
+unsigned int __hwdom_init arch_hwdom_irqs(const struct domain *d)
 {
     unsigned int n = fls(num_present_cpus());
+    /* Bounded by the domain pirq EOI bitmap gfn. */
+    const unsigned int max_irqs = PAGE_SIZE * BITS_PER_BYTE;
 
-    if ( !domid )
-        n = min(n, dom0_max_vcpus());
-    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, nr_irqs);
+    if ( is_system_domain(d) )
+        return max_irqs;
 
-    /* Bounded by the domain pirq eoi bitmap gfn. */
-    n = min_t(unsigned int, n, PAGE_SIZE * BITS_PER_BYTE);
+    if ( !d->domain_id )
+        n = min(n, dom0_max_vcpus());
+    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, min(nr_irqs, max_irqs));
 
-    printk("Dom%d has maximum %u PIRQs\n", domid, n);
+    printk("%pd has maximum %u PIRQs\n", d, n);
 
     return n;
 }
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -695,7 +695,7 @@ struct domain *domain_create(domid_t dom
             d->nr_pirqs = nr_static_irqs + extra_domU_irqs;
         else
             d->nr_pirqs = extra_hwdom_irqs ? nr_static_irqs + extra_hwdom_irqs
-                                           : arch_hwdom_irqs(domid);
+                                           : arch_hwdom_irqs(d);
         d->nr_pirqs = min(d->nr_pirqs, nr_irqs);
 
         radix_tree_init(&d->pirq_tree);
@@ -829,6 +829,24 @@ void __init setup_system_domains(void)
     if ( IS_ERR(dom_xen) )
         panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
 
+#ifdef CONFIG_HAS_PIRQ
+    /* Bound-check values passed via "extra_guest_irqs=". */
+    {
+        unsigned int n = max(arch_hwdom_irqs(dom_xen), nr_static_irqs);
+
+        if ( extra_hwdom_irqs > n - nr_static_irqs )
+        {
+            extra_hwdom_irqs = n - nr_static_irqs;
+            printk(XENLOG_WARNING "hwdom IRQs bounded to %u\n", n);
+        }
+        if ( extra_domU_irqs > max(32U, n - nr_static_irqs) )
+        {
+            extra_domU_irqs = n - nr_static_irqs;
+            printk(XENLOG_WARNING "domU IRQs bounded to %u\n", n);
+        }
+    }
+#endif
+
     /*
      * Initialise our DOMID_IO domain.
      * This domain owns I/O pages that are within the range of the page_info
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -202,8 +202,9 @@ extern struct irq_desc *pirq_spin_lock_i
 
 unsigned int set_desc_affinity(struct irq_desc *desc, const cpumask_t *mask);
 
+/* When passed a system domain, this returns the maximum permissible value. */
 #ifndef arch_hwdom_irqs
-unsigned int arch_hwdom_irqs(domid_t domid);
+unsigned int arch_hwdom_irqs(const struct domain *d);
 #endif
 
 #ifndef arch_evtchn_bind_pirq


