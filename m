Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEE654629A
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jun 2022 11:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.346265.572030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzb3l-0001fZ-3J; Fri, 10 Jun 2022 09:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 346265.572030; Fri, 10 Jun 2022 09:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzb3k-0001d5-VH; Fri, 10 Jun 2022 09:36:04 +0000
Received: by outflank-mailman (input) for mailman id 346265;
 Fri, 10 Jun 2022 09:36:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nzb3j-0001cz-Og
 for xen-devel@lists.xenproject.org; Fri, 10 Jun 2022 09:36:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzb3j-0005JX-DM; Fri, 10 Jun 2022 09:36:03 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.23.251]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nzb3j-0002BA-6q; Fri, 10 Jun 2022 09:36:03 +0000
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
	bh=s6BfmEU8864JGM4/VFVea1/LQptm4Ee9ClsMSi9Q/s8=; b=ajCsNIzqY9lSlw+s9QtqAv8EsR
	ok524mac7uTXy8sV7gGfVmCKDdY/P30vBlIMdZKjDy+v28WYR9mm8rAj5BN9aClshGfqc84c/uXoR
	xIoXYPlZxVjV3mk8pQpvOBQ5gzI6yZzs35pfOrBLyID2w6Y/XNd9pJs2oDp4Y/oGxTmc=;
Message-ID: <015d87aa-936b-94d4-2500-c438814c5d71@xen.org>
Date: Fri, 10 Jun 2022 10:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 0/2] xen/mm: Optimize init_heap_pages()
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220609083039.76667-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220609083039.76667-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2022 09:30, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> As part of the Live-Update work, we noticed that a big part Xen boot
> is spent to add pages in the heap. For instance, on when running Xen
> in a nested envionment on a c5.metal, it takes ~1.5s.

On IRC, Bertrand asked me how I measured the time taken here. I will 
share on xen-devel so everyone can use it. Note the patch is x86 
specific, but could be easily adapted for Arm.

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 53a73010e029..d99b9f3abf5e 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -615,10 +615,16 @@ static inline bool using_2M_mapping(void)
             !l1_table_offset((unsigned long)__2M_rwdata_end);
  }

+extern uint64_t myticks;
+
  static void noreturn init_done(void)
  {
      void *va;
      unsigned long start, end;
+    uint64_t elapsed = tsc_ticks2ns(myticks);
+
+    printk("elapsed %lu ms %lu ns\n", elapsed / MILLISECS(1),
+           elapsed % MILLISECS(1));

      system_state = SYS_STATE_active;

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ea59cd1a4aba..3e6504283f1e 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1865,9 +1865,12 @@ static unsigned long avail_heap_pages(
      return free_pages;
  }

+uint64_t myticks;
+
  void __init end_boot_allocator(void)
  {
      unsigned int i;
+    uint64_t stsc = rdtsc_ordered();

      /* Pages that are free now go to the domain sub-allocator. */
      for ( i = 0; i < nr_bootmem_regions; i++ )
@@ -1892,6 +1895,8 @@ void __init end_boot_allocator(void)
      if ( !dma_bitsize && (num_online_nodes() > 1) )
          dma_bitsize = arch_get_dma_bitsize();

+    myticks = rdtsc_ordered() - stsc;
+
      printk("Domain heap initialised");
      if ( dma_bitsize )
          printk(" DMA width %u bits", dma_bitsize);

Cheers,

-- 
Julien Grall

