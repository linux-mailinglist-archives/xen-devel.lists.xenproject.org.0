Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3723181CA9D
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 14:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659366.1028933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfSH-0002r8-V9; Fri, 22 Dec 2023 13:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659366.1028933; Fri, 22 Dec 2023 13:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGfSH-0002oG-Rv; Fri, 22 Dec 2023 13:20:45 +0000
Received: by outflank-mailman (input) for mailman id 659366;
 Fri, 22 Dec 2023 13:20:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=r2k+=IB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGfSG-0002oA-Kq
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 13:20:44 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8a326e1-a0cc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 14:20:43 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-336897b6bd6so1549843f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 05:20:43 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k16-20020a5d6e90000000b0033667867a66sm4270794wrz.101.2023.12.22.05.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Dec 2023 05:20:42 -0800 (PST)
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
X-Inumbo-ID: e8a326e1-a0cc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703251243; x=1703856043; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pi0fdrqwhgdXKn1d3N8NE3nCUCrARlI+3Bsj1guebrs=;
        b=Txmn02TIoh6JpkOqfOm68lLAQ29S7QlRT4ro2t29bK10vhky/ub1P3vfmWp41CoObB
         3/RhvxxH9hiA+5WmFh/2UfhVK9jDx3zVnqK11xARtp+wl3d1EihPcqaASiPcayco19tC
         M5GUVlpva3k+quclcYJHSwS+aTuUOCRDPN/M+T3SZev46zS/RzRsNRTnNMTEH0w70cuj
         qXNuIM5HF27w3k4s8RBmbi8hXT+o+O4A6eNmDji7MQHivQnMtnoFg/XHJfG/ppCnHV6b
         jOHLPaVMWs4HaxeuajcpVjdGlK4r7tDIvaATu4OgOarCZMLkehoKIlNg4ama7WVIVRQo
         XB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703251243; x=1703856043;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pi0fdrqwhgdXKn1d3N8NE3nCUCrARlI+3Bsj1guebrs=;
        b=I8M41gKsRQake3rJC6S+LQIOZwvV7VcdIWV2wv3jbaLA7Kcf3QUDVwZgBoG71uPOEV
         hRz8jsO1Bp/zz8ks09Gpk5wFnSdl1irtLNBMzI6+oinj0tcO1W7aIcVXt5Grh77V34V8
         XWpjlvKKFhfJmtAoMC3bFD8zk0nnrVKrc3dXQx34f5Jr0/pC2P9+UodfQ9y7cfDzPlM2
         in6o8NS9kRT7FpeHHEKB8Snua9S13/TFXhAq1KD09ffsfuvmiuVAw33eICexZZQiGfZc
         YztEAprr/jyF0mrgyKYAb+XjPhCp6TTxW4kliZG1Q+rfHbCXgyzsBFfBcgmVoxdjkoHL
         pudg==
X-Gm-Message-State: AOJu0YzzH+aHIoDuD6+zvCOtr3Ww63Nnmj5YNUB0ov+AqDXjtmhPnVBD
	s0el3RMEDU59SpKKEeJf9i91Oz1cqgXR
X-Google-Smtp-Source: AGHT+IFCbFK/Ow/+oTPLr79W1ll3YWn2lsVFqg3ViXle1geVrd0A57KxB5YUDgM55YhzpkRPpuBWxA==
X-Received: by 2002:a05:6000:108d:b0:336:873b:3605 with SMTP id y13-20020a056000108d00b00336873b3605mr678223wrw.60.1703251242654;
        Fri, 22 Dec 2023 05:20:42 -0800 (PST)
Message-ID: <67bf2be7-53f4-40d0-a856-8ae631a054b0@suse.com>
Date: Fri, 22 Dec 2023 14:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] xen/asm-generic: introduce stub header numa.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
 <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
 <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 14:07, Oleksii wrote:
> On Fri, 2023-12-22 at 09:22 +0100, Jan Beulich wrote:
>> On 21.12.2023 20:09, Julien Grall wrote:
>>> On 20/12/2023 14:08, Oleksii Kurochko wrote:
>>>> <asm/numa.h> is common through some archs so it is moved
>>>> to asm-generic.
>>>>
>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>
>>> I think this patch will need to be rebased on top of the lastest
>>> staging 
>>> as this should clash with 51ffb3311895.
>>
>> No, and I'd like to withdraw my ack here. In this case a stub header
>> isn't
>> the right choice imo - the !NUMA case should be handled in common
>> code. I
>> would have submitted the patch I have, if only the first_valid_mfn
>> patch
>> hadn't been committed already (which I now need to re-base over).
> I haven't seen your patch yet (waiting for it), but I assume that
> <asm/numa.h> will still be necessary and remain the same across Arm,
> PPC, and RISC-V.
> 
> What am I missing?

asm/numa.h will be necessary for an arch only if it actually has a way
to have CONFIG_NUMA enabled. Below, for your reference, the patch in
the not-yet-rebased form. As you can see, Arm's (and PPC's) header goes
away. If and when they choose to support NUMA, they may need to regain
one; whether at that point we can sort how an asm-generic/ form of the
header might sensibly look like remains to be seen.

Jan

NUMA: no need for asm/numa.h when !NUMA

There's no point in every architecture carrying the same stubs for the
case when NUMA isn't enabled (or even supported). Move all of that to
xen/numa.h; replace explicit uses of asm/numa.h in common code. Make
inclusion of asm/numa.h dependent upon NUMA=y.

Address the TODO regarding first_valid_mfn by making the variable static
when NUMA=y, thus also addressing a Misrs C:2012 rule 8.4 concern. Drop
the not really applicable "implement NUMA support" comment - in a !NUMA
section this simply makes no sense.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This is an alternative proposal to
https://lists.xen.org/archives/html/xen-devel/2023-12/msg01586.html
and its earlier forms.

--- unstable.orig/xen/arch/arm/include/asm/numa.h
+++ /dev/null
@@ -1,37 +0,0 @@
-#ifndef __ARCH_ARM_NUMA_H
-#define __ARCH_ARM_NUMA_H
-
-#include <xen/mm.h>
-
-typedef u8 nodeid_t;
-
-#ifndef CONFIG_NUMA
-
-/* Fake one node for now. See also node_online_map. */
-#define cpu_to_node(cpu) 0
-#define node_to_cpumask(node)   (cpu_online_map)
-
-/*
- * TODO: make first_valid_mfn static when NUMA is supported on Arm, this
- * is required because the dummy helpers are using it.
- */
-extern mfn_t first_valid_mfn;
-
-/* XXX: implement NUMA support */
-#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
-#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
-#define __node_distance(a, b) (20)
-
-#endif
-
-#define arch_want_default_dmazone() (false)
-
-#endif /* __ARCH_ARM_NUMA_H */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
--- unstable.orig/xen/arch/arm/smpboot.c
+++ unstable/xen/arch/arm/smpboot.c
@@ -42,7 +42,7 @@ integer_param("maxcpus", max_cpus);
 /* CPU logical map: map xen cpuid to an MPIDR */
 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
-/* Fake one node for now. See also asm/numa.h */
+/* Fake one node for now. See also xen/numa.h */
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 /* Xen stack for bringing up the first CPU. */
--- unstable.orig/xen/arch/ppc/include/asm/numa.h
+++ /dev/null
@@ -1,26 +0,0 @@
-#ifndef __ASM_PPC_NUMA_H__
-#define __ASM_PPC_NUMA_H__
-
-#include <xen/types.h>
-#include <xen/mm.h>
-
-typedef uint8_t nodeid_t;
-
-/* Fake one node for now. See also node_online_map. */
-#define cpu_to_node(cpu) 0
-#define node_to_cpumask(node)   (cpu_online_map)
-
-/*
- * TODO: make first_valid_mfn static when NUMA is supported on PPC, this
- * is required because the dummy helpers are using it.
- */
-extern mfn_t first_valid_mfn;
-
-/* XXX: implement NUMA support */
-#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
-#define node_start_pfn(nid) (mfn_x(first_valid_mfn))
-#define __node_distance(a, b) (20)
-
-#define arch_want_default_dmazone() (false)
-
-#endif /* __ASM_PPC_NUMA_H__ */
--- unstable.orig/xen/common/page_alloc.c
+++ unstable/xen/common/page_alloc.c
@@ -140,7 +140,6 @@
 #include <xen/vm_event.h>
 
 #include <asm/flushtlb.h>
-#include <asm/numa.h>
 #include <asm/page.h>
 
 #include <public/sysctl.h>
@@ -256,10 +255,14 @@ static PAGE_LIST_HEAD(page_broken_list);
  * BOOT-TIME ALLOCATOR
  */
 
+#ifndef CONFIG_NUMA
 /*
  * first_valid_mfn is exported because it is use in ARM specific NUMA
  * helpers. See comment in arch/arm/include/asm/numa.h.
  */
+#else
+static
+#endif
 mfn_t first_valid_mfn = INVALID_MFN_INITIALIZER;
 
 struct bootmem_region {
--- unstable.orig/xen/common/sysctl.c
+++ unstable/xen/common/sysctl.c
@@ -22,8 +22,8 @@
 #include <asm/current.h>
 #include <xen/hypercall.h>
 #include <public/sysctl.h>
-#include <asm/numa.h>
 #include <xen/nodemask.h>
+#include <xen/numa.h>
 #include <xsm/xsm.h>
 #include <xen/pmstat.h>
 #include <xen/livepatch.h>
--- unstable.orig/xen/include/xen/domain.h
+++ unstable/xen/include/xen/domain.h
@@ -2,6 +2,7 @@
 #ifndef __XEN_DOMAIN_H__
 #define __XEN_DOMAIN_H__
 
+#include <xen/numa.h>
 #include <xen/types.h>
 
 #include <public/xen.h>
@@ -12,7 +13,6 @@ struct guest_area {
 };
 
 #include <asm/domain.h>
-#include <asm/numa.h>
 
 typedef union {
     struct vcpu_guest_context *nat;
--- unstable.orig/xen/include/xen/numa.h
+++ unstable/xen/include/xen/numa.h
@@ -2,7 +2,13 @@
 #define _XEN_NUMA_H
 
 #include <xen/mm-frame.h>
+
+#ifdef CONFIG_NUMA
+#include <xen/pdx.h>
 #include <asm/numa.h>
+#else
+typedef uint8_t nodeid_t;
+#endif
 
 #define NUMA_NO_NODE     0xFF
 #define NUMA_NO_DISTANCE 0xFF
@@ -108,6 +114,18 @@ extern void numa_set_processor_nodes_par
 
 #else
 
+/* Fake one node for now. See also node_online_map. */
+#define cpu_to_node(cpu) 0
+#define node_to_cpumask(node)   cpu_online_map
+
+#define arch_want_default_dmazone() false
+
+extern mfn_t first_valid_mfn;
+
+#define node_spanned_pages(nid) (max_page - mfn_x(first_valid_mfn))
+#define node_start_pfn(nid) mfn_x(first_valid_mfn)
+#define __node_distance(a, b) 20
+
 static inline nodeid_t mfn_to_nid(mfn_t mfn)
 {
     return 0;
--- unstable.orig/xen/include/xen/pci.h
+++ unstable/xen/include/xen/pci.h
@@ -11,10 +11,10 @@
 #include <xen/list.h>
 #include <xen/spinlock.h>
 #include <xen/irq.h>
+#include <xen/numa.h>
 #include <xen/pci_regs.h>
 #include <xen/pfn.h>
 #include <asm/device.h>
-#include <asm/numa.h>
 
 /*
  * The PCI interface treats multi-function devices as independent


