Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158BF84CDAF
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 16:09:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677748.1054567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjXc-0003p2-NQ; Wed, 07 Feb 2024 15:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677748.1054567; Wed, 07 Feb 2024 15:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXjXc-0003mF-Ig; Wed, 07 Feb 2024 15:08:48 +0000
Received: by outflank-mailman (input) for mailman id 677748;
 Wed, 07 Feb 2024 15:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXjXb-0003S8-DD
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 15:08:47 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9d2726d-c5ca-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 16:08:45 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b40208735so535310f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 07:08:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c430500b0040fd3121c4asm2241587wme.46.2024.02.07.07.08.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 07:08:44 -0800 (PST)
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
X-Inumbo-ID: c9d2726d-c5ca-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707318525; x=1707923325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ncbHwP6wrgBev/dEAPt4B8n9MsTfuVc0R/BDYiBxm7I=;
        b=HO0v/oNk7GgTTMwbOmP05neLcZh4mFxlA5CbkF1koMq2UUuSx2FYZV+HDez2jY//7D
         mSVtTBsQfA5imPPK3UoMCNX+zqkB0nfGwturMAZELcx6whhquy+GA2WZg4JfaX3uk0cQ
         SqIbSZN/wu93Zvj2qSBFHH8fSU8t9+F45UEVDd9sCHx13HnAioTA8iwTdTvlybs7shAB
         2kJq5wqIbvCgmhuvbS/kycLErjNQHLu35HgHRPLKIG67DxAQbVAlar8/3GzUr+7iDjVe
         r3ZY8ZqYJ1802EjvmOFp4pDpNh1EmES7kAQNmbHBG/mq1doNd1307acRDnc8aHgaPcNc
         9WyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707318525; x=1707923325;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ncbHwP6wrgBev/dEAPt4B8n9MsTfuVc0R/BDYiBxm7I=;
        b=qKqvOXTebVlpMk9AMA8ML+iLlJv8RABbvRmb2I1pxyP4rLr5BVuI+3m2qbVNcKXN9V
         KJSHvsYOMA3A8LuO2U9d8mOf0PAUWM26OI2JqstFpsaGygCud7xlIhE6kHn5VKiLP9Xx
         wF1dtdSiEshcHEBt+8Oh/tRtq26Ksnj7j3fNNHqly1pH0wDwregh8PKle9aoTTffEM8y
         VK4MsvwV6M3M4GGawtnV7aQaE6JFBNxSrrWffbSbcKqb1jyWgGPk4DRgwR3ealypB7Jn
         EAlvTKokwxNeb41WDMDANpK1JH+v8bfweiLpNklAxnI36ss0uC/uDQIPxzukN0PxUfdg
         eDZA==
X-Gm-Message-State: AOJu0YyDSn4uStWXAB/5GMzCDws6IU/keoewY7a8SVYtKn7888cTRhHA
	fAcWaAYm/UVqi94u+TZiNn0SvHuD4vbJ+SJK/jOophn4E7/HQKBVx0hDqLKkfQ==
X-Google-Smtp-Source: AGHT+IHpTZbVlXr6oUYAFfED3ujMa1YPEDCizZUL0qYIsnLU1QfxeZLUqnPn2oqdtgJdan/kkrVMwA==
X-Received: by 2002:adf:e50b:0:b0:33b:4f78:a5b8 with SMTP id j11-20020adfe50b000000b0033b4f78a5b8mr1538168wrm.44.1707318525010;
        Wed, 07 Feb 2024 07:08:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWtjlpRWbb5uFymD3YuVK3I1HwqWinyKwXYL860LzvmTS8AEkqDEqAGOkOukoo5+b3JueSTLUhSnMG9651mbS8+9e7sYP9xyxRAb8bnDNGTs7SUAhdTo3B5nNxsDVUpaFH5mF8=
Message-ID: <56c24b5b-42a0-4022-bb14-f90a3881fdc1@suse.com>
Date: Wed, 7 Feb 2024 16:08:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hvmloader - allow_memory_relocate overlaps
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: Neowutran <xen@neowutran.ovh>
Cc: xen-devel@lists.xenproject.org, Anthony Perard
 <anthony.perard@citrix.com>, George Dunlap <george.dunlap@citrix.com>
References: <7oe275z3eap7rhdwmrm4mvqnjnhrpag5cjwnfvwsf7rchhkyjv@pd3abzwdhg6v>
 <217649a9-8399-48d3-ba49-ae22cacf0d4b@suse.com>
 <lyqv62ezqqaybcfuhkvbhiltvnxyy32wzr36kclh7bzrupcvib@a5fpoe6atykl>
 <1c857c96-9f2d-4787-8804-799a63a00480@suse.com>
 <7lhrvh2ad46gjke5kvy4pbvrhstv7ihwm64suqrkle4v43tos6@oktohrjfupkc>
 <6db70696-4b40-46d2-b19c-881820338ba4@suse.com>
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
In-Reply-To: <6db70696-4b40-46d2-b19c-881820338ba4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.01.2024 14:16, Jan Beulich wrote:
> On 22.12.2023 16:49, Neowutran wrote:
>> Full logs without my patch to set allow-memory-relocate (https://github.com/neowutran/qubes-vmm-xen/blob/allowmemoryrelocate/ALLOWMEMORYRELOCATE.patch)
>> https://pastebin.com/g 
>> QGg55WZ
>> (GPU passthrough doesn't work, hvmloader overlaps with guest memory)
> 
> So there are oddities, but I can't spot any overlaps. What's odd is that
> the two blocks already above 4Gb are accounted for (and later relocated)
> when calculating total MMIO size. BARs of size 2Gb and more shouldn't be
> accounted for at all when deciding whether low RAM needs relocating, as
> those can't live below 4Gb anyway. I vaguely recall pointing this out
> years ago, but it was thought we'd get away for a fair while. What's
> further odd is where the two blocks are moved to: F800000 moves (down)
> to C00000, while the smaller FC00000 moves further up to FC80000.
> 
> I'll try to get to addressing at least the first oddity; if I can figure
> out why the second one occurs, I may try to address that as well.

Could you give the patch below a try? I don't have a device with large
enough a BAR that I could sensibly pass through to a guest, so I was
only able to build-test the change.

Jan

hvmloader/PCI: skip huge BARs in certain calculations

BARs of size 2Gb and up can't possibly fit below 4Gb: Both the bottom of
the lower 2Gb range and the top of the higher 2Gb range have special
purpose. Don't even have them influence whether to (perhaps) relocate
low RAM.

Reported-by: Neowutran <xen@neowutran.ovh>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
If we wanted to fit e.g. multiple 1Gb BARs, it would likely be prudent
to similarly avoid low RAM relocation in the first place. Yet accounting
for things differently depending on many large BARs there are would
require more intrusive code changes.

That said, I'm open to further lowering of the threshold. That'll
require different justification then, though.

--- a/tools/firmware/hvmloader/pci.c
+++ b/tools/firmware/hvmloader/pci.c
@@ -33,6 +33,13 @@ uint32_t pci_mem_start = HVM_BELOW_4G_MM
 const uint32_t pci_mem_end = RESERVED_MEMBASE;
 uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
 
+/*
+ * BARs larger than this value are put in 64-bit space unconditionally.  That
+ * is, such BARs also don't play into the determination of how big the lowmem
+ * MMIO hole needs to be.
+ */
+#define HUGE_BAR_THRESH GB(1)
+
 enum virtual_vga virtual_vga = VGA_none;
 unsigned long igd_opregion_pgbase = 0;
 
@@ -286,9 +293,11 @@ void pci_setup(void)
             bars[i].bar_reg = bar_reg;
             bars[i].bar_sz  = bar_sz;
 
-            if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
-                  PCI_BASE_ADDRESS_SPACE_MEMORY) ||
-                 (bar_reg == PCI_ROM_ADDRESS) )
+            if ( is_64bar && bar_sz > HUGE_BAR_THRESH )
+                bar64_relocate = 1;
+            else if ( ((bar_data & PCI_BASE_ADDRESS_SPACE) ==
+                       PCI_BASE_ADDRESS_SPACE_MEMORY) ||
+                      (bar_reg == PCI_ROM_ADDRESS) )
                 mmio_total += bar_sz;
 
             nr_bars++;
@@ -367,7 +376,7 @@ void pci_setup(void)
             pci_mem_start = hvm_info->low_mem_pgend << PAGE_SHIFT;
     }
 
-    if ( mmio_total > (pci_mem_end - pci_mem_start) )
+    if ( mmio_total > (pci_mem_end - pci_mem_start) || bar64_relocate )
     {
         printf("Low MMIO hole not large enough for all devices,"
                " relocating some BARs to 64-bit\n");
@@ -446,8 +455,9 @@ void pci_setup(void)
          *   the code here assumes it to be.)
          * Should either of those two conditions change, this code will break.
          */
-        using_64bar = bars[i].is_64bar && bar64_relocate
-            && (mmio_total > (mem_resource.max - mem_resource.base));
+        using_64bar = bars[i].is_64bar && bar64_relocate &&
+            (mmio_total > (mem_resource.max - mem_resource.base) ||
+             bar_sz > HUGE_BAR_THRESH);
         bar_data = pci_readl(devfn, bar_reg);
 
         if ( (bar_data & PCI_BASE_ADDRESS_SPACE) ==
@@ -467,7 +477,8 @@ void pci_setup(void)
                 resource = &mem_resource;
                 bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
             }
-            mmio_total -= bar_sz;
+            if ( bar_sz <= HUGE_BAR_THRESH )
+                mmio_total -= bar_sz;
         }
         else
         {



