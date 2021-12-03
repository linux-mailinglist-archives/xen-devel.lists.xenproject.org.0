Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE70467624
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 12:20:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237374.411707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6c2-0005fV-1U; Fri, 03 Dec 2021 11:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237374.411707; Fri, 03 Dec 2021 11:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mt6c1-0005di-Uj; Fri, 03 Dec 2021 11:20:21 +0000
Received: by outflank-mailman (input) for mailman id 237374;
 Fri, 03 Dec 2021 11:20:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mRw7=QU=gmail.com=ltykernel@srs-se1.protection.inumbo.net>)
 id 1mt6c0-0004uM-K4
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 11:20:20 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff219311-542a-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 12:20:19 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id u11so1886437plf.3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Dec 2021 03:20:19 -0800 (PST)
Received: from ?IPV6:2404:f801:0:5:8000::50b? ([2404:f801:9000:18:efec::50b])
 by smtp.gmail.com with ESMTPSA id
 q32sm2126609pja.4.2021.12.03.03.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Dec 2021 03:20:17 -0800 (PST)
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
X-Inumbo-ID: ff219311-542a-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7XsAJ2cZU1lppUyPBmVsEbXy/GKDAj/Ht+i8uHD7lok=;
        b=fQI0WyY3dvLwdv22bT+tWb115e4Q95jD6vrbYcmPVcwOyogr9umcIO0a/KZzkZF0rU
         qjv+YjbgPRKUi57eJSOspJ/nc9Xx0y6B+ShA6u79dQDpjAliXRhyzyFFhlcxT7Mkch1K
         q1Htr6xBNQmACCzFHpqEJQ4IFR5KLc5Up09f0yDbrMAL2dGNIoDCk2kVY9vf7H/OqfTF
         vj7WVjaYIRG9InmQYKKZoLEcnyr9fnCfLZMJ00mCUyXKJGM6wmAKtV6BkqeDbPJtqzHZ
         wVggDDSxJtPp+HclUV3H9xLVWitco7xUeWkf/kzzWR666KG5ZxHBXQifzIXarMd5G5hy
         YahQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7XsAJ2cZU1lppUyPBmVsEbXy/GKDAj/Ht+i8uHD7lok=;
        b=nKh4d2dPqY6Gem9IxtGc77jqQOWFwnbRRI+7LrKzSNlQ910FmA5Yq2HqWP48oocpjc
         ltQitOknXZrZ4oYMlKbQ+v4fjlDXRTiZEf8GRxNjNvqPEjTQ52pNJZSc29Ib9q35wYLm
         amhQPenVx+Lx0pkrE4npY4eANufR6GeIJL7P3j7CBXrKz8jXfsw7LKh32aVuu8SdrbGP
         iUROsBJOt58SEuqCGJBTYrTPsvs/kUga+OAREuY/E+uqHrNMWZIilFSoq1ErcWXZhe+r
         T8T2OfwD0B/ysR1lObwjglWwYoa/z/iXYD2FybxsSSZeAKZq12QPuuBypQ/KaqHnzn7f
         v1+g==
X-Gm-Message-State: AOAM532IMviLB/EDdREJSlXPzYQxvSMIoIrlcGn03jTHZ2lPsn8sjfra
	Smy92c2+O9ceQ/U5Rfa6TBQ=
X-Google-Smtp-Source: ABdhPJwyiDbpHGaLzHTehq+eMK96rnMASx0J/gnS2CYK1pGpGeM2FntwySwLQ6ehw5HLLx+8am9Xvw==
X-Received: by 2002:a17:90b:3447:: with SMTP id lj7mr13390043pjb.112.1638530418013;
        Fri, 03 Dec 2021 03:20:18 -0800 (PST)
Message-ID: <e78ba239-2dad-d48f-671e-f76a943052f1@gmail.com>
Date: Fri, 3 Dec 2021 19:20:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH V3 1/5] Swiotlb: Add Swiotlb bounce buffer remap function
 for HV IVM
Content-Language: en-US
To: Tom Lendacky <thomas.lendacky@amd.com>, kys@microsoft.com,
 haiyangz@microsoft.com, sthemmin@microsoft.com, wei.liu@kernel.org,
 decui@microsoft.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, jgross@suse.com,
 sstabellini@kernel.org, boris.ostrovsky@oracle.com, joro@8bytes.org,
 will@kernel.org, davem@davemloft.net, kuba@kernel.org, jejb@linux.ibm.com,
 martin.petersen@oracle.com, arnd@arndb.de, hch@infradead.org,
 m.szyprowski@samsung.com, robin.murphy@arm.com, Tianyu.Lan@microsoft.com,
 xen-devel@lists.xenproject.org, michael.h.kelley@microsoft.com
Cc: iommu@lists.linux-foundation.org, linux-arch@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org, vkuznets@redhat.com,
 brijesh.singh@amd.com, konrad.wilk@oracle.com, hch@lst.de,
 parri.andrea@gmail.com, dave.hansen@intel.com
References: <20211201160257.1003912-1-ltykernel@gmail.com>
 <20211201160257.1003912-2-ltykernel@gmail.com>
 <41bb0a87-9fdb-4c67-a903-9e87d092993a@amd.com>
From: Tianyu Lan <ltykernel@gmail.com>
In-Reply-To: <41bb0a87-9fdb-4c67-a903-9e87d092993a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/2/2021 10:42 PM, Tom Lendacky wrote:
> On 12/1/21 10:02 AM, Tianyu Lan wrote:
>> From: Tianyu Lan <Tianyu.Lan@microsoft.com>
>>
>> In Isolation VM with AMD SEV, bounce buffer needs to be accessed via
>> extra address space which is above shared_gpa_boundary (E.G 39 bit
>> address line) reported by Hyper-V CPUID ISOLATION_CONFIG. The access
>> physical address will be original physical address + shared_gpa_boundary.
>> The shared_gpa_boundary in the AMD SEV SNP spec is called virtual top of
>> memory(vTOM). Memory addresses below vTOM are automatically treated as
>> private while memory above vTOM is treated as shared.
>>
>> Expose swiotlb_unencrypted_base for platforms to set unencrypted
>> memory base offset and platform calls swiotlb_update_mem_attributes()
>> to remap swiotlb mem to unencrypted address space. memremap() can
>> not be called in the early stage and so put remapping code into
>> swiotlb_update_mem_attributes(). Store remap address and use it to copy
>> data from/to swiotlb bounce buffer.
>>
>> Signed-off-by: Tianyu Lan <Tianyu.Lan@microsoft.com>
> 
> This patch results in the following stack trace during a bare-metal boot
> on my EPYC system with SME active (e.g. mem_encrypt=on):
> 
> [    0.123932] BUG: Bad page state in process swapper  pfn:108001
> [    0.123942] page:(____ptrval____) refcount:0 mapcount:-128 
> mapping:0000000000000000 index:0x0 pfn:0x108001
> [    0.123946] flags: 0x17ffffc0000000(node=0|zone=2|lastcpupid=0x1fffff)
> [    0.123952] raw: 0017ffffc0000000 ffff88904f2d5e80 ffff88904f2d5e80 
> 0000000000000000
> [    0.123954] raw: 0000000000000000 0000000000000000 00000000ffffff7f 
> 0000000000000000
> [    0.123955] page dumped because: nonzero mapcount
> [    0.123957] Modules linked in:
> [    0.123961] CPU: 0 PID: 0 Comm: swapper Not tainted 
> 5.16.0-rc3-sos-custom #2
> [    0.123964] Hardware name: AMD Corporation
> [    0.123967] Call Trace:
> [    0.123971]  <TASK>
> [    0.123975]  dump_stack_lvl+0x48/0x5e
> [    0.123985]  bad_page.cold+0x65/0x96
> [    0.123990]  __free_pages_ok+0x3a8/0x410
> [    0.123996]  memblock_free_all+0x171/0x1dc
> [    0.124005]  mem_init+0x1f/0x14b
> [    0.124011]  start_kernel+0x3b5/0x6a1
> [    0.124016]  secondary_startup_64_no_verify+0xb0/0xbb
> [    0.124022]  </TASK>
> 
> I see ~40 of these traces, each for different pfns.
> 
> Thanks,
> Tom

Hi Tom:
       Thanks for your test. Could you help to test the following patch 
and check whether it can fix the issue.


diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 569272871375..f6c3638255d5 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -73,6 +73,9 @@ extern enum swiotlb_force swiotlb_force;
   * @end:       The end address of the swiotlb memory pool. Used to do 
a quick
   *             range check to see if the memory was in fact allocated 
by this
   *             API.
+ * @vaddr:     The vaddr of the swiotlb memory pool. The swiotlb memory 
pool
+ *             may be remapped in the memory encrypted case and store 
virtual
+ *             address for bounce buffer operation.
   * @nslabs:    The number of IO TLB blocks (in groups of 64) between 
@start and
   *             @end. For default swiotlb, this is command line 
adjustable via
   *             setup_io_tlb_npages.
@@ -92,6 +95,7 @@ extern enum swiotlb_force swiotlb_force;
  struct io_tlb_mem {
         phys_addr_t start;
         phys_addr_t end;
+       void *vaddr;
         unsigned long nslabs;
         unsigned long used;
         unsigned int index;
@@ -186,4 +190,6 @@ static inline bool is_swiotlb_for_alloc(struct 
device *dev)
  }
  #endif /* CONFIG_DMA_RESTRICTED_POOL */

+extern phys_addr_t swiotlb_unencrypted_base;
+
  #endif /* __LINUX_SWIOTLB_H */
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 8e840fbbed7c..34e6ade4f73c 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -50,6 +50,7 @@
  #include <asm/io.h>
  #include <asm/dma.h>

+#include <linux/io.h>
  #include <linux/init.h>
  #include <linux/memblock.h>
  #include <linux/iommu-helper.h>
@@ -72,6 +73,8 @@ enum swiotlb_force swiotlb_force;

  struct io_tlb_mem io_tlb_default_mem;

+phys_addr_t swiotlb_unencrypted_base;
+
  /*
   * Max segment that we can provide which (if pages are contingous) will
   * not be bounced (unless SWIOTLB_FORCE is set).
@@ -155,6 +158,27 @@ static inline unsigned long nr_slots(u64 val)
         return DIV_ROUND_UP(val, IO_TLB_SIZE);
  }

+/*
+ * Remap swioltb memory in the unencrypted physical address space
+ * when swiotlb_unencrypted_base is set. (e.g. for Hyper-V AMD SEV-SNP
+ * Isolation VMs).
+ */
+void *swiotlb_mem_remap(struct io_tlb_mem *mem, unsigned long bytes)
+{
+       void *vaddr = NULL;
+
+       if (swiotlb_unencrypted_base) {
+               phys_addr_t paddr = mem->start + swiotlb_unencrypted_base;
+
+               vaddr = memremap(paddr, bytes, MEMREMAP_WB);
+               if (!vaddr)
+                       pr_err("Failed to map the unencrypted memory 
%llx size %lx.\n",
+                              paddr, bytes);
+       }
+
+       return vaddr;
+}
+
  /*
   * Early SWIOTLB allocation may be too early to allow an architecture to
   * perform the desired operations.  This function allows the 
architecture to
@@ -172,7 +196,12 @@ void __init swiotlb_update_mem_attributes(void)
         vaddr = phys_to_virt(mem->start);
         bytes = PAGE_ALIGN(mem->nslabs << IO_TLB_SHIFT);
         set_memory_decrypted((unsigned long)vaddr, bytes >> PAGE_SHIFT);
-       memset(vaddr, 0, bytes);
+
+       mem->vaddr = swiotlb_mem_remap(mem, bytes);
+       if (!mem->vaddr)
+               mem->vaddr = vaddr;
+
+       memset(mem->vaddr, 0, bytes);
  }

  static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, 
phys_addr_t start,
@@ -196,7 +225,17 @@ static void swiotlb_init_io_tlb_mem(struct 
io_tlb_mem *mem, phys_addr_t start,
                 mem->slots[i].orig_addr = INVALID_PHYS_ADDR;
                 mem->slots[i].alloc_size = 0;
         }
+
+       /*
+        * If swiotlb_unencrypted_base is set, the bounce buffer memory will
+        * be remapped and cleared in swiotlb_update_mem_attributes.
+        */
+       if (swiotlb_unencrypted_base)
+               return;
+
         memset(vaddr, 0, bytes);
+       mem->vaddr = vaddr;
+       return;
  }

  int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int 
verbose)
@@ -371,7 +410,7 @@ static void swiotlb_bounce(struct device *dev, 
phys_addr_t tlb_addr, size_t size
         phys_addr_t orig_addr = mem->slots[index].orig_addr;
         size_t alloc_size = mem->slots[index].alloc_size;
         unsigned long pfn = PFN_DOWN(orig_addr);
-       unsigned char *vaddr = phys_to_virt(tlb_addr);
+       unsigned char *vaddr = mem->vaddr + tlb_addr - mem->start;
         unsigned int tlb_offset, orig_addr_offset;

         if (orig_addr == INVALID_PHYS_ADDR)


Thanks.


