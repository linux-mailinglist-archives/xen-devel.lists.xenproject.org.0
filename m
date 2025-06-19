Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5885AE021F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jun 2025 11:54:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019854.1396315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSBxp-0001lB-Vm; Thu, 19 Jun 2025 09:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019854.1396315; Thu, 19 Jun 2025 09:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uSBxp-0001ip-Sd; Thu, 19 Jun 2025 09:53:45 +0000
Received: by outflank-mailman (input) for mailman id 1019854;
 Thu, 19 Jun 2025 09:53:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UhHE=ZC=gmail.com=urezki@srs-se1.protection.inumbo.net>)
 id 1uSBxo-0001ij-Mi
 for xen-devel@lists.xenproject.org; Thu, 19 Jun 2025 09:53:44 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48701300-4cf3-11f0-b894-0df219b8e170;
 Thu, 19 Jun 2025 11:53:42 +0200 (CEST)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-54e7967cf67so543275e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Jun 2025 02:53:42 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553ac1367e9sm2541889e87.79.2025.06.19.02.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jun 2025 02:53:41 -0700 (PDT)
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
X-Inumbo-ID: 48701300-4cf3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750326822; x=1750931622; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lxye2GX1z6QI+SRVMkfZEngbWK9B27pd3eBJcWGrlg=;
        b=AlJUrCvmcpeVtVNVJRWm5zS/8kr43qptmYm647x/9kwjMzKvHe7bvVh036C3cWdAWF
         c+LbyEEWIndCWcZ6wYEfNJJx1WrcgSO4HBb9wQOnxHZ4+7uUTRamQ1SFSH+cf0JmjyDg
         MBhAkAmGETDZ8xiW752HHB3KyloULxGhPvUCF8aLQwWIsAEAMU5br0jIZux9C6eEO1bo
         YZvmGIrxbkuvoSLzFVWiCfvXN83sW9AVwpXzyOZP2N11UJBBXg5htnzY1xc2APTvU4LA
         Y3ii8IZWgMYD5YTnHqc1zwHtAuhJ+iMA0l9zaewuMs6yHkBrkGsRYmQKb+bj6MHaw4+0
         3UdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750326822; x=1750931622;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lxye2GX1z6QI+SRVMkfZEngbWK9B27pd3eBJcWGrlg=;
        b=iw4lvt04ewSdmXTy1kYCZsC7wojW/5EUQO7TUOCqi7xDjyDilrvtPgWjHk3S5Fqr0i
         x20FcvoJRbsFucfzaZ56gymr87Hd8RlqRVkdICKVbeNwxTvb3npxhLbncKAylA8xPFNe
         c0CbSiP4vbY8cmbrqEthQ0UZ2af4X8wpNga+u4qs/QxNz7IVK5pw+Ksf06iYJuD1+n6C
         RV8nQog3A5hYUF1TKU50E+0P2Rbt7Naf/PNrhfQZ0wPmRrI/HgvB5Ijx14uBcnKGSns/
         OyZ33obOWqCqXDnIVnBKwPufUlABgvDILSaCW8Pd82sdv+/n3I6mkumbr3wW4LPP0Wlq
         ZpeA==
X-Forwarded-Encrypted: i=1; AJvYcCVhlkePdfWWYw3Fs9YrMFM+fwmzn1Qyr0DYoS5sZqYlDJnoPIpfLynoydSvwVEj8IPtFQ85SQtARDc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypT/Oxv7cvkdy833tRv78TaUw0+ZeI1gfGH4t5UfFGjShSls3S
	oOWWXI6aeBImuDpVbRNbaBIKJmvUTc0IM/fG9Czx0fMqwZRyWhy8vjA4
X-Gm-Gg: ASbGnctSrvKjdHggprv1G7OqsvIt80eMK/a7r3zSApAH/Ct208qeJfV/EYycCwK0qjp
	+H7qTqk9hrRm4ZTO4H92MUjqGsO/eMc7JmnmG3U85t+arz9nNW3AzwJNMpBNcTVEu2FUQFbeZbe
	2uZLluxY31iE9EmAURfc1Jtmqqwlm26RQOHhz/P5l/5TYXiAHlQuB3GgtTJR8z4iyS5fa0eiVyB
	zWqp9Koj9bWLwtzrATm4QDYfJ42eIEVjkiGe7BtCLJUxKI7wqJBeWRtfJ6N+qGZ9ZNiNu5umgfU
	bLiIGPiihYaYRAr2wo95JhHYTujfpXcjZpVgFSTXvEFD3bfpnqrX/8jYh04xHdRAKYxy9fQanS2
	oO7ASVwV2hkY=
X-Google-Smtp-Source: AGHT+IEJV7RqZa9E1nD948cD6oSgemriE8btKJowGkw8tp48NbrB1jrcDoGclBvee7YrwcLZgS368g==
X-Received: by 2002:a05:6512:1049:b0:553:1f90:cca4 with SMTP id 2adb3069b0e04-553b6e74ae6mr5656846e87.13.1750326821436;
        Thu, 19 Jun 2025 02:53:41 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Thu, 19 Jun 2025 11:53:38 +0200
To: Dan Carpenter <dan.carpenter@linaro.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild@lists.linux.dev, Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, Hugh Dickins <hughd@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
	Jeremy Fitzhardinge <jeremy@goop.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU
 mode
Message-ID: <aFPeIisE3ufUGEUq@pc636>
References: <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>
 <0be7d42e-5898-4b94-829b-59c661c2f07b@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0be7d42e-5898-4b94-829b-59c661c2f07b@suswa.mountain>

On Wed, Jun 18, 2025 at 08:32:28PM +0300, Dan Carpenter wrote:
> Hi Alexander,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Gordeev/mm-Cleanup-apply_to_pte_range-routine/20250613-013835
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev%40linux.ibm.com
> patch subject: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU mode
> config: x86_64-randconfig-161-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132017.T1l1l6ME-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/
> 
> smatch warnings:
> mm/vmalloc.c:552 vmap_pages_pte_range() warn: inconsistent returns 'global &init_mm.page_table_lock'.
> 
> vim +552 mm/vmalloc.c
> 
> 0a264884046f1ab Nicholas Piggin   2021-04-29  517  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  518  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  519  		pgtbl_mod_mask *mask)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  520  {
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  521  	pte_t *pte;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  522  
> db64fe02258f150 Nicholas Piggin   2008-10-18  523  	/*
> db64fe02258f150 Nicholas Piggin   2008-10-18  524  	 * nr is a running index into the array which helps higher level
> db64fe02258f150 Nicholas Piggin   2008-10-18  525  	 * callers keep track of where we're up to.
> db64fe02258f150 Nicholas Piggin   2008-10-18  526  	 */
> db64fe02258f150 Nicholas Piggin   2008-10-18  527  
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  528  	pte = pte_alloc_kernel_track(pmd, addr, mask);
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  529  	if (!pte)
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  530  		return -ENOMEM;
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  531  
> dac0cc793368851 Alexander Gordeev 2025-06-12  532  	spin_lock(&init_mm.page_table_lock);
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  533  	arch_enter_lazy_mmu_mode();
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  534  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  535  	do {
> db64fe02258f150 Nicholas Piggin   2008-10-18  536  		struct page *page = pages[*nr];
> db64fe02258f150 Nicholas Piggin   2008-10-18  537  
> c33c794828f2121 Ryan Roberts      2023-06-12  538  		if (WARN_ON(!pte_none(ptep_get(pte))))
> db64fe02258f150 Nicholas Piggin   2008-10-18  539  			return -EBUSY;
> db64fe02258f150 Nicholas Piggin   2008-10-18  540  		if (WARN_ON(!page))
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  541  			return -ENOMEM;
> 4fcdcc12915c707 Yury Norov        2022-04-28  542  		if (WARN_ON(!pfn_valid(page_to_pfn(page))))
> 4fcdcc12915c707 Yury Norov        2022-04-28  543  			return -EINVAL;
> 
> These error paths don't unlock &init_mm.page_table_lock?
> 
> 4fcdcc12915c707 Yury Norov        2022-04-28  544  
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  545  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
> db64fe02258f150 Nicholas Piggin   2008-10-18  546  		(*nr)++;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  547  	} while (pte++, addr += PAGE_SIZE, addr != end);
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  548  
> 44562c71e2cfc9e Ryan Roberts      2025-04-22  549  	arch_leave_lazy_mmu_mode();
> dac0cc793368851 Alexander Gordeev 2025-06-12  550  	spin_unlock(&init_mm.page_table_lock);
> 2ba3e6947aed9bb Joerg Roedel      2020-06-01  551  	*mask |= PGTBL_PTE_MODIFIED;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16 @552  	return 0;
> ^1da177e4c3f415 Linus Torvalds    2005-04-16  553  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
> 
This patch introduce a huge performance degrade when testing this by
the test_vmalloc.sh performance tool. We return back to a single, not
serialized global spilock where we spend 90% of cycles:

<snip>
+   91.01%     1.67%  [kernel]          [k] _raw_spin_lock
-   89.29%    89.25%  [kernel]          [k] native_queued_spin_lock_slowpath
     69.82% ret_from_fork_asm
      - ret_from_fork
         - 69.81% kthread
            - 69.66% test_func
               - 26.31% full_fit_alloc_test
                  - 19.11% __vmalloc_node_noprof
                     - __vmalloc_node_range_noprof
                        - 13.73% vmap_small_pages_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                        - 5.38% __get_vm_area_node
                             alloc_vmap_area
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                  - 13.32% vfree.part.0
                     - 13.31% remove_vm_area
                        - 13.27% __vunmap_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
               - 25.57% fix_size_alloc_test
                  - 22.59% __vmalloc_node_noprof
                     - __vmalloc_node_range_noprof
                        - 17.34% vmap_small_pages_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                        - 5.25% __get_vm_area_node
                             alloc_vmap_area
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
                  - 11.59% vfree.part.0
                     - remove_vm_area
                        - 11.55% __vunmap_range_noflush
                             _raw_spin_lock
                             native_queued_spin_lock_slowpath
               - 17.78% long_busy_list_alloc_test
                  - 13.90% __vmalloc_node_noprof
                     - __vmalloc_node_range_noprof
                        - 9.95% vmap_small_pages_range_noflush
                             _raw_spin_lock
<snip>

No, we can not take this patch.

--
Uladzislau Rezki

