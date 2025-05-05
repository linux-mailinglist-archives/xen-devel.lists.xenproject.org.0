Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3349AAA9197
	for <lists+xen-devel@lfdr.de>; Mon,  5 May 2025 13:09:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976007.1363274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBth2-0005hm-P6; Mon, 05 May 2025 11:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976007.1363274; Mon, 05 May 2025 11:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBth2-0005gK-Kj; Mon, 05 May 2025 11:09:04 +0000
Received: by outflank-mailman (input) for mailman id 976007;
 Mon, 05 May 2025 11:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdRb=XV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uBth1-0005gE-CQ
 for xen-devel@lists.xenproject.org; Mon, 05 May 2025 11:09:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 59169a23-29a1-11f0-9ffb-bf95429c2676;
 Mon, 05 May 2025 13:09:01 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac289147833so801790166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 May 2025 04:09:01 -0700 (PDT)
Received: from [192.168.1.5] (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad189147329sm474669466b.1.2025.05.05.04.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 04:08:59 -0700 (PDT)
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
X-Inumbo-ID: 59169a23-29a1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746443340; x=1747048140; darn=lists.xenproject.org;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7VIDio7v4eCyn7zzPuwMIMy5LSP9PCMQAr+XZhqwV80=;
        b=DR5eS1UbFQ4K91F+d5J2pyAeMWGn/VwfKusxj9JJIofhDTZR/8/JYyQ8H8yufyVVdL
         9Y9ewkzUMn1ySokwfrCSu6YVrjBxdoKRMZmV6HvKH3Ec9JElZuvL+FCZ1RV5iGQA76MY
         WTfsvFn1627LlFkeXe1fS6kVGjqKiPsz1sFX3dcc8vU8rTutDtxrSrnIGk5jq0t2weqy
         I++0EX1e/cI7iQuQJCEGrVZiFqucq+pG4JmzXhgtPHXA0R/9lkId+THd62w/xi4YQuLQ
         TYJugF6qLuNmUY6dvFO9VEKHILGlPCL+9rOX66635/QJOFlIJrM7DPIXyJ4KQffOhu1i
         Yx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746443340; x=1747048140;
        h=in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7VIDio7v4eCyn7zzPuwMIMy5LSP9PCMQAr+XZhqwV80=;
        b=uz2biA5T2r7JRZUcznTubz/F6DvTC+2ccGSL/uH/AKlqlIzW6mXJ09j+R7nMjJOyGP
         iqQYSBMd+nHo1LUJArrZ+rAEGql+jIkNwim7+dldFR+KB2oSWBKAll9VTG5Ijkfeuhp1
         lmc3s+gtv9/oFD56QF1Z9F7gMFAHNctAq9wqFMK4oc6ZrtY+m4VdXjLdKhqgGQotPZI1
         zA+gI6pFjap1ycKCY5U4NIdwmM7xQBkpCiyaXSK6AXGA9V1VEtZtMbDbSdMYY3Z0T6Ao
         xOcVkBB+pCY08/3D5uxiPnxwpRgAcDsq5/wnnJTwG0Ihue+atYY6+9cs6427s12fuB5i
         lpcg==
X-Gm-Message-State: AOJu0YwTME3qYsjj4Di/3m2C09zaedIhXB0QjKDEm3SBH5R6c9PNwGQt
	pt5nM468qAd2z3E1RS3SVOC1TvDyZZ1qNC/2ASb1Y/psPK4c71yv
X-Gm-Gg: ASbGncvX+likIFB1XPzyPUUr/H3fdbWUU70827GNpJRNBG3HDwyrY4+BItxrV7g3cNL
	SgT0732MMsRW8Q98S3eaOYLnquAYWMGld4kZxQtA5XumBAM5NQ/SySzA1G55xNFXOUxScjzlbVq
	/60ku3mW6J1k2U9v/D5y3PEh2cTcApCMA7bR+Xf8iY5Mujz4umIj7qCXD9uo2sq8E3Js88nvV7Q
	qAqLfTf2HJTkGUjUP50SnwEYwHMu1zOWXhwuClpHhnWnrH3pibP1Wb6drSAxD/GUfXddC9X3nGn
	i9l7yjVkmnB/mN+/UjNQlx7IoRl5codRiTwC/WQUTngiDC7JQR3GjkadB9NXBE1SNT/S2Y/DKUa
	cIaKNsz3aYCkCNlhw
X-Google-Smtp-Source: AGHT+IHIWLe66K68wHnMmWuuyS5SLDIXeBriNeLmArRF/X/Qsgykbm7FT9CWY6F7r/eqGbrRZBPJkA==
X-Received: by 2002:a17:907:9689:b0:acb:52cb:415f with SMTP id a640c23a62f3a-ad1a4acc679mr606225966b.48.1746443340218;
        Mon, 05 May 2025 04:09:00 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------i5KdX35EEWsNYYNEX0T1EBlw"
Message-ID: <21ef8c7d-90a1-426d-b642-d5eb40d4ce5e@gmail.com>
Date: Mon, 5 May 2025 13:08:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v3 5/8] asm-generic: move some parts of Arm's
 domain_build.h to common
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
 <bac1324ae98b8cfae12978f7d965d0ecdf8bb769.1746199009.git.oleksii.kurochko@gmail.com>
 <alpine.DEB.2.22.394.2505021353150.3879245@ubuntu-linux-20-04-desktop>
Content-Language: en-US
In-Reply-To: <alpine.DEB.2.22.394.2505021353150.3879245@ubuntu-linux-20-04-desktop>

This is a multi-part message in MIME format.
--------------i5KdX35EEWsNYYNEX0T1EBlw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 5/2/25 10:55 PM, Stefano Stabellini wrote:
> On Fri, 2 May 2025, Oleksii Kurochko wrote:
>> Nothing changed. Only some functions declaration are moved to xen/include/
>> headers as they are expected to be used by common code of domain builing
>> or dom0less.
>>
>> Signed-off-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>>   Chnages in v3:
>>   - Drop inclusion of <asm/domain_build.h> from xen/fdt-domain-build.h.
>>   - Add empty line after license tag in xen/fdt-domain-build.h.
>> ---
>>   Chnages in v2:
>>    - Add missed declaration of construct_hwdom().
>>    - Drop unnessary blank line.
>>    - Introduce xen/fdt-domain-build.h and move parts of Arm's domain_build.h to
>>      it.
>>    - Update the commit message.
>> ---
>>   xen/arch/arm/acpi/domain_build.c        |  1 +
>>   xen/arch/arm/dom0less-build.c           |  1 +
>>   xen/arch/arm/domain_build.c             |  1 +
>>   xen/arch/arm/include/asm/domain_build.h | 21 ++----------
>>   xen/arch/arm/kernel.c                   |  1 +
>>   xen/arch/arm/static-shmem.c             |  1 +
>>   xen/include/xen/fdt-domain-build.h      | 43 +++++++++++++++++++++++++
>>   7 files changed, 51 insertions(+), 18 deletions(-)
>>   create mode 100644 xen/include/xen/fdt-domain-build.h
>>
>> diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
>> index f9ca8b47e5..1c3555d814 100644
>> --- a/xen/arch/arm/acpi/domain_build.c
>> +++ b/xen/arch/arm/acpi/domain_build.c
>> @@ -10,6 +10,7 @@
>>    */
>>   
>>   #include <xen/compile.h>
>> +#include <xen/fdt-domain-build.h>
>>   #include <xen/fdt-kernel.h>
>>   #include <xen/mm.h>
>>   #include <xen/sched.h>
>> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
>> index 7eecd06d44..0310579863 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -1,6 +1,7 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   #include <xen/device_tree.h>
>>   #include <xen/domain_page.h>
>> +#include <xen/fdt-domain-build.h>
>>   #include <xen/fdt-kernel.h>
>>   #include <xen/err.h>
>>   #include <xen/event.h>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 8c7a054718..9d649b06b3 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1,6 +1,7 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   #include <xen/init.h>
>>   #include <xen/compile.h>
>> +#include <xen/fdt-domain-build.h>
>>   #include <xen/fdt-kernel.h>
>>   #include <xen/lib.h>
>>   #include <xen/llc-coloring.h>
>> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
>> index df1c0fe301..397e408a1f 100644
>> --- a/xen/arch/arm/include/asm/domain_build.h
>> +++ b/xen/arch/arm/include/asm/domain_build.h
>> @@ -5,28 +5,13 @@
>>   #include <xen/sched.h>
>>   
>>   typedef __be32 gic_interrupt_t[3];
>> -typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
>> -                                     unsigned int order, void *extra);
>> -bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>> -                             alloc_domheap_mem_cb cb, void *extra);
>> -bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>> -                          paddr_t tot_size);
>> -void allocate_memory(struct domain *d, struct kernel_info *kinfo);
>> -int construct_domain(struct domain *d, struct kernel_info *kinfo);
>> -int construct_hwdom(struct kernel_info *kinfo,
>> -                    const struct dt_device_node *node);
>> +
>>   int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
>> -int make_chosen_node(const struct kernel_info *kinfo);
>> -int make_cpus_node(const struct domain *d, void *fdt);
>> -int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
>> -                         int addrcells, int sizecells);
>> -int make_memory_node(const struct kernel_info *kinfo, int addrcells,
>> -                     int sizecells, const struct membanks *mem);
>>   int make_psci_node(void *fdt);
>> -int make_timer_node(const struct kernel_info *kinfo);
>>   void evtchn_allocate(struct domain *d);
>>   
>> -unsigned int get_allocation_size(paddr_t size);
>> +int construct_hwdom(struct kernel_info *kinfo,
>> +                    const struct dt_device_node *node);
> At the end of the series construct_hwdom is only called from within
> xen/arch/arm/domain_build.c, so it could be made static and removed from
> here. However, one of my review comments was that I think we should
> still call construct_hwdom from xen/common/device-tree/dom0less-build.c.
> So I think we should keep it.

I will move this change to the patch where this function will be really used.

>
>
>>   /*
>>    * Helper to write an interrupts with the GIC format
>> diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
>> index f00fc388db..5759a3470a 100644
>> --- a/xen/arch/arm/kernel.c
>> +++ b/xen/arch/arm/kernel.c
>> @@ -7,6 +7,7 @@
>>   #include <xen/byteorder.h>
>>   #include <xen/domain_page.h>
>>   #include <xen/errno.h>
>> +#include <xen/fdt-domain-build.h>
>>   #include <xen/fdt-kernel.h>
>>   #include <xen/guest_access.h>
>>   #include <xen/gunzip.h>
>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>> index 14ae48fb1e..1f8441d920 100644
>> --- a/xen/arch/arm/static-shmem.c
>> +++ b/xen/arch/arm/static-shmem.c
>> @@ -1,6 +1,7 @@
>>   /* SPDX-License-Identifier: GPL-2.0-only */
>>   
>>   #include <xen/device_tree.h>
>> +#include <xen/fdt-domain-build.h>
>>   #include <xen/libfdt/libfdt.h>
>>   #include <xen/rangeset.h>
>>   #include <xen/sched.h>
>> diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
>> new file mode 100644
>> index 0000000000..b79e9fabfe
>> --- /dev/null
>> +++ b/xen/include/xen/fdt-domain-build.h
>> @@ -0,0 +1,43 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef __XEN_FDT_DOMAIN_BUILD_H__
>> +#define __XEN_FDT_DOMAIN_BUILD_H__
>> +
>> +#include <xen/bootfdt.h>
>> +#include <xen/device_tree.h>
>> +#include <xen/fdt-kernel.h>
>> +#include <xen/types.h>
>> +
>> +struct domain;
>> +struct page_info;
>> +struct membanks;
>> +
>> +typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
>> +                                     unsigned int order, void *extra);
>> +bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
>> +                             alloc_domheap_mem_cb cb, void *extra);
>> +
>> +bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
>> +                          paddr_t tot_size);
>> +void allocate_memory(struct domain *d, struct kernel_info *kinfo);
>> +int construct_domain(struct domain *d, struct kernel_info *kinfo);
>> +int make_chosen_node(const struct kernel_info *kinfo);
>> +int make_cpus_node(const struct domain *d, void *fdt);
>> +int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
>> +                         int addrcells, int sizecells);
>> +int make_memory_node(const struct kernel_info *kinfo, int addrcells,
>> +                     int sizecells, const struct membanks *mem);
>> +int make_timer_node(const struct kernel_info *kinfo);
>> +
>> +unsigned int get_allocation_size(paddr_t size);
> Many of these functions are not actually moved until later patches. It
> would be best to move the declaration at the time the function is also
> moved. But if that is difficult for any reason, this is also OK.

I'll move then allocate_*(), to the patch where defintions
for these functions are introduced.

~ Oleksii

>> +#endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
>> +
>> +/*
>> + * Local variables:
>> + * mode: C
>> + * c-file-style: "BSD"
>> + * c-basic-offset: 4
>> + * indent-tabs-mode: nil
>> + * End:
>> + */
>> -- 
>> 2.49.0
>>
--------------i5KdX35EEWsNYYNEX0T1EBlw
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 5/2/25 10:55 PM, Stefano Stabellini
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021353150.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">On Fri, 2 May 2025, Oleksii Kurochko wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Nothing changed. Only some functions declaration are moved to xen/include/
headers as they are expected to be used by common code of domain builing
or dom0less.

Signed-off-by: Oleksii Kurochko <a class="moz-txt-link-rfc2396E"
        href="mailto:oleksii.kurochko@gmail.com">&lt;oleksii.kurochko@gmail.com&gt;</a>
---
 Chnages in v3:
 - Drop inclusion of &lt;asm/domain_build.h&gt; from xen/fdt-domain-build.h.
 - Add empty line after license tag in xen/fdt-domain-build.h.
---
 Chnages in v2:
  - Add missed declaration of construct_hwdom().
  - Drop unnessary blank line.
  - Introduce xen/fdt-domain-build.h and move parts of Arm's domain_build.h to
    it.
  - Update the commit message.
---
 xen/arch/arm/acpi/domain_build.c        |  1 +
 xen/arch/arm/dom0less-build.c           |  1 +
 xen/arch/arm/domain_build.c             |  1 +
 xen/arch/arm/include/asm/domain_build.h | 21 ++----------
 xen/arch/arm/kernel.c                   |  1 +
 xen/arch/arm/static-shmem.c             |  1 +
 xen/include/xen/fdt-domain-build.h      | 43 +++++++++++++++++++++++++
 7 files changed, 51 insertions(+), 18 deletions(-)
 create mode 100644 xen/include/xen/fdt-domain-build.h

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index f9ca8b47e5..1c3555d814 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -10,6 +10,7 @@
  */
 
 #include &lt;xen/compile.h&gt;
+#include &lt;xen/fdt-domain-build.h&gt;
 #include &lt;xen/fdt-kernel.h&gt;
 #include &lt;xen/mm.h&gt;
 #include &lt;xen/sched.h&gt;
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 7eecd06d44..0310579863 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include &lt;xen/device_tree.h&gt;
 #include &lt;xen/domain_page.h&gt;
+#include &lt;xen/fdt-domain-build.h&gt;
 #include &lt;xen/fdt-kernel.h&gt;
 #include &lt;xen/err.h&gt;
 #include &lt;xen/event.h&gt;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8c7a054718..9d649b06b3 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #include &lt;xen/init.h&gt;
 #include &lt;xen/compile.h&gt;
+#include &lt;xen/fdt-domain-build.h&gt;
 #include &lt;xen/fdt-kernel.h&gt;
 #include &lt;xen/lib.h&gt;
 #include &lt;xen/llc-coloring.h&gt;
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index df1c0fe301..397e408a1f 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -5,28 +5,13 @@
 #include &lt;xen/sched.h&gt;
 
 typedef __be32 gic_interrupt_t[3];
-typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
-                                     unsigned int order, void *extra);
-bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
-                             alloc_domheap_mem_cb cb, void *extra);
-bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
-                          paddr_t tot_size);
-void allocate_memory(struct domain *d, struct kernel_info *kinfo);
-int construct_domain(struct domain *d, struct kernel_info *kinfo);
-int construct_hwdom(struct kernel_info *kinfo,
-                    const struct dt_device_node *node);
+
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
-int make_chosen_node(const struct kernel_info *kinfo);
-int make_cpus_node(const struct domain *d, void *fdt);
-int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
-                         int addrcells, int sizecells);
-int make_memory_node(const struct kernel_info *kinfo, int addrcells,
-                     int sizecells, const struct membanks *mem);
 int make_psci_node(void *fdt);
-int make_timer_node(const struct kernel_info *kinfo);
 void evtchn_allocate(struct domain *d);
 
-unsigned int get_allocation_size(paddr_t size);
+int construct_hwdom(struct kernel_info *kinfo,
+                    const struct dt_device_node *node);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">At the end of the series construct_hwdom is only called from within
xen/arch/arm/domain_build.c, so it could be made static and removed from
here. However, one of my review comments was that I think we should
still call construct_hwdom from xen/common/device-tree/dom0less-build.c.
So I think we should keep it.</pre>
    </blockquote>
    <pre>I will move this change to the patch where this function will be really used.

</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021353150.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">


</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre"> /*
  * Helper to write an interrupts with the GIC format
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index f00fc388db..5759a3470a 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -7,6 +7,7 @@
 #include &lt;xen/byteorder.h&gt;
 #include &lt;xen/domain_page.h&gt;
 #include &lt;xen/errno.h&gt;
+#include &lt;xen/fdt-domain-build.h&gt;
 #include &lt;xen/fdt-kernel.h&gt;
 #include &lt;xen/guest_access.h&gt;
 #include &lt;xen/gunzip.h&gt;
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 14ae48fb1e..1f8441d920 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 #include &lt;xen/device_tree.h&gt;
+#include &lt;xen/fdt-domain-build.h&gt;
 #include &lt;xen/libfdt/libfdt.h&gt;
 #include &lt;xen/rangeset.h&gt;
 #include &lt;xen/sched.h&gt;
diff --git a/xen/include/xen/fdt-domain-build.h b/xen/include/xen/fdt-domain-build.h
new file mode 100644
index 0000000000..b79e9fabfe
--- /dev/null
+++ b/xen/include/xen/fdt-domain-build.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __XEN_FDT_DOMAIN_BUILD_H__
+#define __XEN_FDT_DOMAIN_BUILD_H__
+
+#include &lt;xen/bootfdt.h&gt;
+#include &lt;xen/device_tree.h&gt;
+#include &lt;xen/fdt-kernel.h&gt;
+#include &lt;xen/types.h&gt;
+
+struct domain;
+struct page_info;
+struct membanks;
+
+typedef bool (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
+                                     unsigned int order, void *extra);
+bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
+                             alloc_domheap_mem_cb cb, void *extra);
+
+bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
+                          paddr_t tot_size);
+void allocate_memory(struct domain *d, struct kernel_info *kinfo);
+int construct_domain(struct domain *d, struct kernel_info *kinfo);
+int make_chosen_node(const struct kernel_info *kinfo);
+int make_cpus_node(const struct domain *d, void *fdt);
+int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
+                         int addrcells, int sizecells);
+int make_memory_node(const struct kernel_info *kinfo, int addrcells,
+                     int sizecells, const struct membanks *mem);
+int make_timer_node(const struct kernel_info *kinfo);
+
+unsigned int get_allocation_size(paddr_t size);
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">Many of these functions are not actually moved until later patches. It
would be best to move the declaration at the time the function is also
moved. But if that is difficult for any reason, this is also OK.</pre>
    </blockquote>
    <pre>I'll move then allocate_*(), to the patch where defintions
for these functions are introduced.

~ Oleksii

</pre>
    <blockquote type="cite"
cite="mid:alpine.DEB.2.22.394.2505021353150.3879245@ubuntu-linux-20-04-desktop">
      <pre wrap="" class="moz-quote-pre">
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+#endif /* __XEN_FDT_DOMAIN_BUILD_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.49.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------i5KdX35EEWsNYYNEX0T1EBlw--

