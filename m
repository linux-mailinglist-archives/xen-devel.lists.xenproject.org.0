Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C1F415B51
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 11:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193574.344798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLKd-0006S6-Pm; Thu, 23 Sep 2021 09:47:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193574.344798; Thu, 23 Sep 2021 09:47:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTLKd-0006O8-Lo; Thu, 23 Sep 2021 09:47:55 +0000
Received: by outflank-mailman (input) for mailman id 193574;
 Thu, 23 Sep 2021 09:47:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lEPm=ON=csgroup.eu=christophe.leroy@srs-us1.protection.inumbo.net>)
 id 1mTLKc-0006O2-PH
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 09:47:54 +0000
Received: from pegase2.c-s.fr (unknown [93.17.235.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5219fa5a-1c53-11ec-ba25-12813bfff9fa;
 Thu, 23 Sep 2021 09:47:53 +0000 (UTC)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HFVhS1HTcz9sTZ;
 Thu, 23 Sep 2021 11:47:52 +0200 (CEST)
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N2iojAvTUjrW; Thu, 23 Sep 2021 11:47:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HFVhS0G8Vz9sTX;
 Thu, 23 Sep 2021 11:47:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E65698B775;
 Thu, 23 Sep 2021 11:47:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HEg50hnqH7U5; Thu, 23 Sep 2021 11:47:51 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.200])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 224928B763;
 Thu, 23 Sep 2021 11:47:50 +0200 (CEST)
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
X-Inumbo-ID: 5219fa5a-1c53-11ec-ba25-12813bfff9fa
X-Virus-Scanned: amavisd-new at c-s.fr
X-Virus-Scanned: amavisd-new at c-s.fr
Subject: Re: [PATCH 3/3] memblock: cleanup memblock_free interface
To: Mike Rapoport <rppt@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: devicetree@vger.kernel.org, linux-efi@vger.kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, linux-usb@vger.kernel.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20210923074335.12583-1-rppt@kernel.org>
 <20210923074335.12583-4-rppt@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1101e3c7-fcb7-a632-8e22-47f4a01ea02e@csgroup.eu>
Date: Thu, 23 Sep 2021 11:47:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210923074335.12583-4-rppt@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
Content-Transfer-Encoding: 8bit



Le 23/09/2021 à 09:43, Mike Rapoport a écrit :
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> For ages memblock_free() interface dealt with physical addresses even
> despite the existence of memblock_alloc_xx() functions that return a
> virtual pointer.
> 
> Introduce memblock_phys_free() for freeing physical ranges and repurpose
> memblock_free() to free virtual pointers to make the following pairing
> abundantly clear:
> 
> 	int memblock_phys_free(phys_addr_t base, phys_addr_t size);
> 	phys_addr_t memblock_phys_alloc(phys_addr_t base, phys_addr_t size);
> 
> 	void *memblock_alloc(phys_addr_t size, phys_addr_t align);
> 	void memblock_free(void *ptr, size_t size);
> 
> Replace intermediate memblock_free_ptr() with memblock_free() and drop
> unnecessary aliases memblock_free_early() and memblock_free_early_nid().
> 
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---

> diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
> index 1a04e5bdf655..37826d8c4f74 100644
> --- a/arch/s390/kernel/smp.c
> +++ b/arch/s390/kernel/smp.c
> @@ -723,7 +723,7 @@ void __init smp_save_dump_cpus(void)
>   			/* Get the CPU registers */
>   			smp_save_cpu_regs(sa, addr, is_boot_cpu, page);
>   	}
> -	memblock_free(page, PAGE_SIZE);
> +	memblock_phys_free(page, PAGE_SIZE);
>   	diag_amode31_ops.diag308_reset();
>   	pcpu_set_smt(0);
>   }
> @@ -880,7 +880,7 @@ void __init smp_detect_cpus(void)
>   
>   	/* Add CPUs present at boot */
>   	__smp_rescan_cpus(info, true);
> -	memblock_free_early((unsigned long)info, sizeof(*info));
> +	memblock_free(info, sizeof(*info));
>   }
>   
>   /*

I'm a bit lost. IIUC memblock_free_early() and memblock_free() where 
identical.

In the first hunk memblock_free() gets replaced by memblock_phys_free()
In the second hunk memblock_free_early() gets replaced by memblock_free()

I think it would be easier to follow if you could split it in several 
patches:
- First patch: Create memblock_phys_free() and change all relevant 
memblock_free() to memblock_phys_free() - Or change memblock_free() to 
memblock_phys_free() and make memblock_free() an alias of it.
- Second patch: Make memblock_free_ptr() become memblock_free() and 
change all remaining callers to the new semantics (IIUC 
memblock_free(__pa(ptr)) becomes memblock_free(ptr) and make 
memblock_free_ptr() an alias of memblock_free()
- Fourth patch: Replace and drop memblock_free_ptr()
- Fifth patch: Drop memblock_free_early() and memblock_free_early_nid() 
(All users should have been upgraded to memblock_free_phys() in patch 1 
or memblock_free() in patch 2)

Christophe

