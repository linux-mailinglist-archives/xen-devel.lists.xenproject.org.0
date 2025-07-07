Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1E5AFB6AE
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jul 2025 17:01:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1035639.1407981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnLH-0006PY-99; Mon, 07 Jul 2025 15:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1035639.1407981; Mon, 07 Jul 2025 15:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uYnLH-0006Nw-69; Mon, 07 Jul 2025 15:01:15 +0000
Received: by outflank-mailman (input) for mailman id 1035639;
 Mon, 07 Jul 2025 15:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uYnLF-0005h3-OZ
 for xen-devel@lists.xenproject.org; Mon, 07 Jul 2025 15:01:13 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 375951f5-5b43-11f0-b894-0df219b8e170;
 Mon, 07 Jul 2025 17:01:10 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so1528730f8f.2
 for <xen-devel@lists.xenproject.org>; Mon, 07 Jul 2025 08:01:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31aaae81c0esm9768469a91.22.2025.07.07.08.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 08:01:08 -0700 (PDT)
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
X-Inumbo-ID: 375951f5-5b43-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751900469; x=1752505269; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0B+owFfBLNraJR5H+e0cWeOueBzyuuUs9eHMSwnCHWg=;
        b=Hki8Mpu694rErs7HeF+p7uh6hY5yLCt5UybHDn+vtDV01UoeFW0ZiuUGsy1jUIvOGb
         K7JNgYIuXbQ2m69C1EZhmR1RFEUFFGRW4mf80xNTbtUtz7sISwoG7FRhUyHVp+zLFpfZ
         QR4/mh2uLRmSVVwDJQIHndlviuy3OL5UqUHwqBaSWYNtOt006t7xlfsUqZeG8XqUVqqz
         7SMQ41EgwnA+7Bjx+NgDEgrm9lLbnAU8Fl3RO+5hkdrbXJaZkEiGUdu799vLLgLCvuO8
         ON/Uby/Cv6fQMcIKW9OPWweqv3bN+wPVD9J9I9mx+hI0Z2tWhxcGfJbYOQjsKyJ2hD2z
         2O+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751900469; x=1752505269;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0B+owFfBLNraJR5H+e0cWeOueBzyuuUs9eHMSwnCHWg=;
        b=mYzE8dGWO9yPdvx6LSgPXnm/F/8HE6aB8Y4ZOkcmFEvm06qfKUc5BYfUXRfXMLh0zr
         0yURDyl6P0wc2oVOlpuSaBrTXu2uFiJAOOqunby8NhKQWoDnaFA8HPZYSyaJMg7JKQJB
         iF+awikerwo64DkFAnroPJmQhdjvvYQnfNVRK7rdA/wJ7cocfOUZBp4v1MTAu2MnkfbL
         AFOTeS+LBPOQ4+4UiwsY3t+7xEXnRIZlmAdD0ecvAamKiSm1POswcrchaf0G9mcF4ek/
         jShhv+O8J6d2rtNYGcyhr5FX1F4TbyZVojl68RQdaoPiWnjMaUaDfMAnafi++3B5zBJl
         TG9g==
X-Gm-Message-State: AOJu0YxCc/5vq4gvd0xrESe7k+F4KgChY/6dOGsh/Twi3c/NQBNGIcRt
	8wyLQznM46eBYAOtxD+1XkG6318YrhBO/yS72bJJqhZpAAzww4jLmC9KwO5KuPqqXZ2YgIHncN5
	8iEE=
X-Gm-Gg: ASbGncteK9laB+6wl36kdUosnbERvqvZNR64PjILMlvCPEcYO7+dc9H0PCfXP5zhWgg
	DN8IpAx+w+3Uu9BoYPkxV2nzOpSYoAhpn+8yJYLRevPJ1hYAEPupgyP6DQx8+Vod1W5eFbkwsSZ
	KDUxmHceeIb+qpnNGqZmlc/wulCHrfdFipvCtysYatE8mRfX9CIXLtJfWia4+/1b2BshwjwevN8
	oCRELOf6ILSexzn52E9RAEU1mK1MTWPrcPP2Cl9DRyG0rDLpOaT+ojAuV0IdjBXOJDG092NBh7H
	6uNlbqv6sdXF3IWxyQjosKfoP2i7lqmVoAta19a/KfuLINwBLIxNf3DMWxNzfq1iyEmrjRCTmcC
	njTHsLoxBXGTaOay3aBGkL4r4vD+c3XLRRl0Fo/HJnm0FVk4=
X-Google-Smtp-Source: AGHT+IHCOy/P+1X4nG0b+RhroCZPh5OCPGQ3jVGG4oVXzzYbIMzAWhaLMRfMyZrJqKD5LMVupgae1g==
X-Received: by 2002:a05:6000:4011:b0:3a5:2ec5:35b8 with SMTP id ffacd0b85a97d-3b4964bbab2mr8778586f8f.11.1751900468828;
        Mon, 07 Jul 2025 08:01:08 -0700 (PDT)
Message-ID: <7463be1a-3f2e-4fd1-8067-2775318d5035@suse.com>
Date: Mon, 7 Jul 2025 17:01:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/PVH: extend checking in hwdom_fixup_p2m()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <664472bb-b375-46eb-999e-34f983275d92@suse.com>
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
In-Reply-To: <664472bb-b375-46eb-999e-34f983275d92@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.07.2025 16:44, Jan Beulich wrote:
> We're generally striving to minimize behavioral differences between PV
> and PVH Dom0. Using (just?) is_memory_hole() in the PVH case looks quite
> a bit weaker to me, compared to the page ownership check done in the PV
> case. Extend checking accordingly.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> The addition may actually be suitable to replace the use of
> is_memory_hole() here. While dropping that would in particular extend
> coverage to E820_RESERVED regions, those are identity-mapped anyway
> (albeit oddly enough still by IOMMU code).

This really is more of a by-product of me looking into the failing (by
default) memory accesses that Dom0 is doing on systems I can put my hands
on. Those accesses are indeed occurring in the context of ACPI evaluating
e.g. _INI or _STA methods, and at least some of the underlying memory
regions also appear in /proc/iomem. Which means that in principle there
could be the option of Dom0 informing us of (at least some of) such
regions.

However, the accesses occur ahead of the kernel actually collecting
resource data. In particular, the intention would have been for the
to-be-added sub-op to be invoked from drivers/pnp/system.c:reserve_range().
That runs from an fs_initcall though, while the accesses occur from
underneath acpi_bus_init() and acpi_scan_init(), both called from
acpi_init(), which is a subsys_initcall. It also doesn't look as if
re-arranging things in Linux would be reasonably possible. Hence the only
(vague) option might be to duplicate some of what is already being done.
Yet besides this appearing undesirable to me, even if we hooked such
duplicate code up from acpi_arch_init(), that would only cover accesses
from underneath acpi_scan_init(); acpi_bus_init() runs yet earlier.

Nevertheless, for the sake of completeness I'll reproduce my draft, patch
(not having the intended effect) below. For the moment, however, I think
I need to give up my hope that we could deal with the problem by other
than the "dom0=pf-fixup" approach.

Jan
---
Along the lines of the respective remark in "x86/PVH: extend checking
in hwdom_fixup_p2m()" submitted earlier, is_memory_hole() isn't used in
PHYSDEVOP_system_memory handling.

The new physdev-op is intended to be invoked from e.g. Linux'es
drivers/pnp/system.c:reserve_range().

Whether to make this a physdev-op or a platform-op wasn't quite clear
to me; the two have a pretty fuzzy boundary between them.

By observation, the size field doesn't need to be 64 bits wide. If we
still wanted to make it so, we'd definitely need to add preemption
checking, too. (We may need to do so anyway, I simply wasn't sure.)

There are sub-page regions being reported on the system I'm looking at.
Not sure what to do about them.

--- unstable.orig/xen/arch/x86/hvm/hypercall.c
+++ unstable/xen/arch/x86/hvm/hypercall.c
@@ -88,6 +88,7 @@ long hvm_physdev_op(int cmd, XEN_GUEST_H
     case PHYSDEVOP_pci_device_remove:
     case PHYSDEVOP_pci_device_reset:
     case PHYSDEVOP_dbgp_op:
+    case PHYSDEVOP_system_memory:
         if ( !is_hardware_domain(currd) )
             return -ENOSYS;
         break;
--- unstable.orig/xen/arch/x86/physdev.c
+++ unstable/xen/arch/x86/physdev.c
@@ -27,6 +27,8 @@ int physdev_unmap_pirq(struct domain *d,
 #ifndef COMPAT
 typedef long ret_t;
 
+#include <asm/altp2m.h>
+
 static int physdev_hvm_map_pirq(
     struct domain *d, int type, int *index, int *pirq)
 {
@@ -619,6 +621,71 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         break;
     }
 
+#ifndef COMPAT
+    case PHYSDEVOP_system_memory: {
+        struct xen_physdev_sysmem_op op;
+
+        if ( !is_hardware_domain(currd) )
+            ret = -EPERM;
+        else if ( copy_from_guest(&op, arg, 1) )
+            ret = -EFAULT;
+        else if ( !op.size )
+            ret = 0;
+        else if ( (op.addr | op.size) & (PAGE_SIZE - 1) ||
+                  (op.addr >> paddr_bits) ||
+                  ((op.addr + op.size - 1) >> paddr_bits) ||
+                  op.flags )
+            ret = -EINVAL;
+        else
+        {
+            mfn_t mfn = maddr_to_mfn(op.addr);
+
+            if ( mfn_valid(mfn) )
+            {
+                struct page_info *pg = mfn_to_page(mfn);
+                const struct domain *owner = page_get_owner_and_reference(pg);
+
+                if ( owner )
+                    put_page(pg);
+                if ( owner != dom_io )
+                    return -EINVAL;
+            }
+
+            /*
+             * Avoid the need to fix up behind a PVH Dom0, by inserting the
+             * desired mapping right away.  See also hwdom_fixup_p2m().
+             */
+            if ( !is_hvm_domain(currd) )
+                ret = 0;
+            else if ( !iomem_access_permitted(currd, mfn_x(mfn),
+                                              (mfn_x(mfn) +
+                                               PFN_DOWN(op.size) - 1)) ||
+                      altp2m_active(currd) )
+                ret = -EACCES;
+            else
+{ printk("sysmem: %08lx (%04x bytes; hole:%d)\n",//temp
+         op.addr, op.size, is_memory_hole(mfn, mfn_add(mfn, PFN_DOWN(op.size) - 1)));
+  ret = 0; break;//temp
+                do {
+                    p2m_type_t type;
+                    unsigned long gfn = mfn_x(mfn);
+                    mfn_t omfn = get_gfn(currd, gfn, &type);
+
+                    if ( !mfn_eq(omfn, INVALID_MFN) || !p2m_is_hole(type) )
+                        ret = mfn_eq(omfn, mfn) ? 0 : -ENOTEMPTY;
+                    else
+                        ret = set_mmio_p2m_entry(currd, _gfn(gfn), mfn, 0);
+                    put_gfn(currd, gfn);
+
+                    mfn = mfn_add(mfn, 1);
+                    op.size -= PAGE_SIZE;
+                } while ( !ret && op.size );
+}
+        }
+        break;
+    }
+#endif /* !COMPAT */
+
     default:
         ret = pci_physdev_op(cmd, arg);
         break;
--- unstable.orig/xen/include/public/physdev.h
+++ unstable/xen/include/public/physdev.h
@@ -344,6 +344,20 @@ typedef struct physdev_dbgp_op physdev_d
 DEFINE_XEN_GUEST_HANDLE(physdev_dbgp_op_t);
 
 /*
+ * Notify the hypervisor of a system memory range ("Motherboard resource"),
+ * some of which can only be discovered via interpreting ACPI's AML.  For PVH
+ * Dom0 such ranges, if deemed valid, would then have a 1:1 translation
+ * inserted into their P2M.
+ */
+#define PHYSDEVOP_system_memory         33
+struct xen_physdev_sysmem_op {
+    uint64_t addr;
+    uint32_t size;
+    /* No flags defined so far; field must be zero. */
+    uint32_t flags;
+};
+
+/*
  * Notify that some PIRQ-bound event channels have been unmasked.
  * ** This command is obsolete since interface version 0x00030202 and is **
  * ** unsupported by newer versions of Xen.                              **


