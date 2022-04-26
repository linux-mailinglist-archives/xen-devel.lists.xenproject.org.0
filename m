Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D02C510029
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 16:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313928.531738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njLxC-00053K-M8; Tue, 26 Apr 2022 14:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313928.531738; Tue, 26 Apr 2022 14:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njLxC-00050Y-IE; Tue, 26 Apr 2022 14:14:10 +0000
Received: by outflank-mailman (input) for mailman id 313928;
 Tue, 26 Apr 2022 14:14:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njLxB-00050M-4E
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 14:14:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njLx4-00060m-QS; Tue, 26 Apr 2022 14:14:02 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.15.135]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njLx4-0007ME-KH; Tue, 26 Apr 2022 14:14:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=LnLZK9Ky1sRVX0UAQejY+HIaD84FqEF5E8jM+59MwMY=; b=zqE8kSvAn/VEO2t4HZmkZmhh5Y
	6PPAMCyzTZReST2FJOefNEvmFiqLxGCLRHIEjw98Zh4/dsd0XpPIIWuT/QDRBrAIAZ/IiJfPUuEt1
	Z4oTMQhTr0KVHkNVbrea8hqFHvIt2g4hkgB12DhN6qcgTkU0bX4MYziS2AMp1FBBpazs=;
Message-ID: <ecb4876e-c6d4-4bff-d964-92af83d39dff@xen.org>
Date: Tue, 26 Apr 2022 15:14:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v4] page_alloc: assert IRQs are enabled in heap alloc/free
To: Jan Beulich <jbeulich@suse.com>, David Vrabel <dvrabel@cantab.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 David Vrabel <dvrabel@amazon.co.uk>, xen-devel@lists.xenproject.org
References: <20220425132801.1076759-1-dvrabel@cantab.net>
 <f5a45b8e-644d-15aa-951f-aa6d89ce4c5b@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f5a45b8e-644d-15aa-951f-aa6d89ce4c5b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/04/2022 15:01, Jan Beulich wrote:
> On 25.04.2022 15:28, David Vrabel wrote:
>> --- a/xen/common/page_alloc.c
>> +++ b/xen/common/page_alloc.c
>> @@ -162,6 +162,13 @@
>>   static char __initdata opt_badpage[100] = "";
>>   string_param("badpage", opt_badpage);
>>   
>> +/*
>> + * Heap allocations may need TLB flushes which require IRQs to be
>> + * enabled (except when only 1 PCPU is online).
>> + */
>> +#define ASSERT_ALLOC_CONTEXT() \
>> +    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1))
> 
> At least one of these tightened assertions triggers on Arm, as per the
> most recent smoke flight. I'm going to revert this for the time being.

 From the serial console [1]:

(XEN) Xen call trace:
(XEN)    [<0022a510>] alloc_xenheap_pages+0x120/0x150 (PC)
(XEN)    [<00000000>] 00000000 (LR)
(XEN)    [<002736ac>] arch/arm/mm.c#xen_pt_update+0x144/0x6e4
(XEN)    [<002740d4>] map_pages_to_xen+0x10/0x20
(XEN)    [<00236864>] __vmap+0x400/0x4a4
(XEN)    [<0026aee8>] 
arch/arm/alternative.c#__apply_alternatives_multi_stop+0x144/0x1ec
(XEN)    [<0022fe40>] stop_machine_run+0x23c/0x300
(XEN)    [<002c40c4>] apply_alternatives_all+0x34/0x5c
(XEN)    [<002ce3e8>] start_xen+0xcb8/0x1024
(XEN)    [<00200068>] arch/arm/arm32/head.o#primary_switched+0xc/0x1c

So we need to move out the vmap() from the 
__apply_alternatives_multi_stop() to apply_alternatives_all().

The patch below (only compile tested so far) should do the job. I will 
do further testing and confirm there are no other issue on Arm.

diff --git a/xen/arch/arm/alternative.c b/xen/arch/arm/alternative.c
index 237c4e564209..8004fc8a7d1a 100644
--- a/xen/arch/arm/alternative.c
+++ b/xen/arch/arm/alternative.c
@@ -170,7 +170,7 @@ static int __apply_alternatives(const struct 
alt_region *region,
   * We might be patching the stop_machine state machine, so implement a
   * really simple polling protocol here.
   */
-static int __apply_alternatives_multi_stop(void *unused)
+static int __apply_alternatives_multi_stop(void *xenmap)
  {
      static int patched = 0;

@@ -185,22 +185,9 @@ static int __apply_alternatives_multi_stop(void 
*unused)
      {
          int ret;
          struct alt_region region;
-        mfn_t xen_mfn = virt_to_mfn(_start);
-        paddr_t xen_size = _end - _start;
-        unsigned int xen_order = get_order_from_bytes(xen_size);
-        void *xenmap;

          BUG_ON(patched);

-        /*
-         * The text and inittext section are read-only. So re-map Xen to
-         * be able to patch the code.
-         */
-        xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
-                        VMAP_DEFAULT);
-        /* Re-mapping Xen is not expected to fail during boot. */
-        BUG_ON(!xenmap);
-
          region.begin = __alt_instructions;
          region.end = __alt_instructions_end;

@@ -208,8 +195,6 @@ static int __apply_alternatives_multi_stop(void *unused)
          /* The patching is not expected to fail during boot. */
          BUG_ON(ret != 0);

-        vunmap(xenmap);
-
          /* Barriers provided by the cache flushing */
          write_atomic(&patched, 1);
      }
@@ -224,14 +209,29 @@ static int __apply_alternatives_multi_stop(void 
*unused)
  void __init apply_alternatives_all(void)
  {
      int ret;
+    mfn_t xen_mfn = virt_to_mfn(_start);
+    paddr_t xen_size = _end - _start;
+    unsigned int xen_order = get_order_from_bytes(xen_size);
+    void *xenmap;

      ASSERT(system_state != SYS_STATE_active);

+    /*
+     * The text and inittext section are read-only. So re-map Xen to
+     * be able to patch the code.
+     */
+    xenmap = __vmap(&xen_mfn, 1U << xen_order, 1, 1, PAGE_HYPERVISOR,
+                    VMAP_DEFAULT);
+    /* Re-mapping Xen is not expected to fail during boot. */
+    BUG_ON(!xenmap);
+
  	/* better not try code patching on a live SMP system */
      ret = stop_machine_run(__apply_alternatives_multi_stop, NULL, 
NR_CPUS);

      /* stop_machine_run should never fail at this stage of the boot */
      BUG_ON(ret);
+
+    vunmap(xenmap);
  }

  int apply_alternatives(const struct alt_instr *start, const struct 
alt_instr *end)

Cheers,

[1] 
http://logs.test-lab.xenproject.org/osstest/logs/169729/test-armhf-armhf-xl/info.html

> 
> Jan
> 

-- 
Julien Grall

