Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C088ADF3DD
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 19:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019368.1396162 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRweJ-0004tB-Dl; Wed, 18 Jun 2025 17:32:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019368.1396162; Wed, 18 Jun 2025 17:32:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRweJ-0004rG-Am; Wed, 18 Jun 2025 17:32:35 +0000
Received: by outflank-mailman (input) for mailman id 1019368;
 Wed, 18 Jun 2025 17:32:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I41v=ZB=linaro.org=dan.carpenter@srs-se1.protection.inumbo.net>)
 id 1uRweI-0004rA-30
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 17:32:34 +0000
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [2607:f8b0:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36e03354-4c6a-11f0-a30b-13f23c93f187;
 Wed, 18 Jun 2025 19:32:32 +0200 (CEST)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-4067ac8f6cdso5082943b6e.2
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 10:32:32 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-40a740c2484sm2410989b6e.13.2025.06.18.10.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Jun 2025 10:32:30 -0700 (PDT)
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
X-Inumbo-ID: 36e03354-4c6a-11f0-a30b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750267951; x=1750872751; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JPaDHCf4QQfYtlFAEXP1n0ACjJsy8xyFFkSONW+4dVI=;
        b=fcoyYa5/vgLStJBGnfJQzsf080XXodxKAVM49xiYCaZnK6LO5HI0ogtMpnn5VlNFMd
         +5kaBmNTDnkXlkD++wvqsQ2Q2oqREOQg6CCPXpdCfp1vqcceF0OZqlPBU6l28Aa63dC+
         Ir3LhxB3RqXglRFa0jku34hcOYX5RWSs/c4IaE5XMjXo5Tj3AvktjybOXjBP1yphFQCq
         zRjm/IcYTTjFbq1vTW8pTtNWRPeDlNjE5pv+1smuESRCQaXkEtodZSNNxRgulLDHLpoK
         vRxJHDnldSN7BF3ZywXniOiHIvzP7mLpNNwaERd5RJcTjHuPA+G4qO/a+zQVZLhW99wF
         4udg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267951; x=1750872751;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JPaDHCf4QQfYtlFAEXP1n0ACjJsy8xyFFkSONW+4dVI=;
        b=LMyCeWCk6Rkxd9SMuQQUx5H2cM3Mf36AY0zmg+HsZJJEsRz12e//+e+Apx3rXWp27B
         SxEwgR7TT7ZzmHaVSgI7642TFks4v8eLbMmgLB3106HaHawEQoNGSiUZq3XXJesebLmj
         I3C4yhb7MZ3f+YI/9/1LLkGe7kgye5MNa2sV2qYi60HVvLrsICfmAV5doWNu0ewjXkSf
         RNwsgEpfqXUBoCHRd7EDGH2Ba92N5WDB6EljtC88dWIDQrn4tdgn3uPx3SNuE6kYmBDu
         o826KqsZWoIsA8iXkWOUpjar3SKgw6VbdVLBKunQvyaIy3T6+xQ1kZSBnqrYArjMIhwR
         JdvA==
X-Forwarded-Encrypted: i=1; AJvYcCWzHospFtjRMANgUGDPnluQlQeNhwQDL1tWv3AQogoKR0nidmdC6Lu7NogxhJsRDwtNa8XTmkHzdLw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YykAk6QUbd4M1+ut1UKf3mcL57/ln8Hf5g7/5dROSoCgzz766MO
	waoml8qeJTEBrsy0DA/2UVb/xBco2btnBONnOo4M3ph5DGjubztqcyJjlhGcqJC4rME=
X-Gm-Gg: ASbGnctpUR0L0AxNSni8im15r6cVtenryV1gCQmkLqBfJwobvmA/6K8XU5kX34Gm3KR
	8CSPzF7IQ9HYHw/DCZ22kkFwTOP0htCw/+AIpMO06+hPWhIMu75g6gjxunOulvlMfCc2kVCpygz
	rLmEkcnXiWo10jS1GHVvzG3bSfO0uTUJQQgRs2ZSZR/ior6GId1KuSDcxdral41e3pqlQDH2HH1
	S+X1uAJz20AEXbzhSi1Psko9DvuqFzZQVAvtDkaGh2CKVwGNyUfa/zhPfF83dOBxLmdBqdJTJYc
	J3nT9e7z9pRwufrtY/0OcIutUFeTop8hwqLcVFAMxT6+ZQYvxmrE9zaRLtUuwxQYISHEcw==
X-Google-Smtp-Source: AGHT+IEhmsXj/9aFuinmgp9fFM5zxL8AzdLs118MWezycsaLkbKoWiwnYgYHLgU6A9s7/1JQmPa7zA==
X-Received: by 2002:a05:6808:1523:b0:403:5150:c348 with SMTP id 5614622812f47-40a7c11902fmr11343414b6e.4.1750267951380;
        Wed, 18 Jun 2025 10:32:31 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:32:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Alexander Gordeev <agordeev@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
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
Message-ID: <0be7d42e-5898-4b94-829b-59c661c2f07b@suswa.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev@linux.ibm.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Gordeev/mm-Cleanup-apply_to_pte_range-routine/20250613-013835
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/7bd3a45dbc375dc2c15cebae09cb2bb972d6039f.1749747752.git.agordeev%40linux.ibm.com
patch subject: [PATCH 2/6] mm: Lock kernel page tables before entering lazy MMU mode
config: x86_64-randconfig-161-20250613 (https://download.01.org/0day-ci/archive/20250613/202506132017.T1l1l6ME-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202506132017.T1l1l6ME-lkp@intel.com/

smatch warnings:
mm/vmalloc.c:552 vmap_pages_pte_range() warn: inconsistent returns 'global &init_mm.page_table_lock'.

vim +552 mm/vmalloc.c

0a264884046f1ab Nicholas Piggin   2021-04-29  517  static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
2ba3e6947aed9bb Joerg Roedel      2020-06-01  518  		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
2ba3e6947aed9bb Joerg Roedel      2020-06-01  519  		pgtbl_mod_mask *mask)
^1da177e4c3f415 Linus Torvalds    2005-04-16  520  {
^1da177e4c3f415 Linus Torvalds    2005-04-16  521  	pte_t *pte;
^1da177e4c3f415 Linus Torvalds    2005-04-16  522  
db64fe02258f150 Nicholas Piggin   2008-10-18  523  	/*
db64fe02258f150 Nicholas Piggin   2008-10-18  524  	 * nr is a running index into the array which helps higher level
db64fe02258f150 Nicholas Piggin   2008-10-18  525  	 * callers keep track of where we're up to.
db64fe02258f150 Nicholas Piggin   2008-10-18  526  	 */
db64fe02258f150 Nicholas Piggin   2008-10-18  527  
2ba3e6947aed9bb Joerg Roedel      2020-06-01  528  	pte = pte_alloc_kernel_track(pmd, addr, mask);
^1da177e4c3f415 Linus Torvalds    2005-04-16  529  	if (!pte)
^1da177e4c3f415 Linus Torvalds    2005-04-16  530  		return -ENOMEM;
44562c71e2cfc9e Ryan Roberts      2025-04-22  531  
dac0cc793368851 Alexander Gordeev 2025-06-12  532  	spin_lock(&init_mm.page_table_lock);
44562c71e2cfc9e Ryan Roberts      2025-04-22  533  	arch_enter_lazy_mmu_mode();
44562c71e2cfc9e Ryan Roberts      2025-04-22  534  
^1da177e4c3f415 Linus Torvalds    2005-04-16  535  	do {
db64fe02258f150 Nicholas Piggin   2008-10-18  536  		struct page *page = pages[*nr];
db64fe02258f150 Nicholas Piggin   2008-10-18  537  
c33c794828f2121 Ryan Roberts      2023-06-12  538  		if (WARN_ON(!pte_none(ptep_get(pte))))
db64fe02258f150 Nicholas Piggin   2008-10-18  539  			return -EBUSY;
db64fe02258f150 Nicholas Piggin   2008-10-18  540  		if (WARN_ON(!page))
^1da177e4c3f415 Linus Torvalds    2005-04-16  541  			return -ENOMEM;
4fcdcc12915c707 Yury Norov        2022-04-28  542  		if (WARN_ON(!pfn_valid(page_to_pfn(page))))
4fcdcc12915c707 Yury Norov        2022-04-28  543  			return -EINVAL;

These error paths don't unlock &init_mm.page_table_lock?

4fcdcc12915c707 Yury Norov        2022-04-28  544  
^1da177e4c3f415 Linus Torvalds    2005-04-16  545  		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
db64fe02258f150 Nicholas Piggin   2008-10-18  546  		(*nr)++;
^1da177e4c3f415 Linus Torvalds    2005-04-16  547  	} while (pte++, addr += PAGE_SIZE, addr != end);
44562c71e2cfc9e Ryan Roberts      2025-04-22  548  
44562c71e2cfc9e Ryan Roberts      2025-04-22  549  	arch_leave_lazy_mmu_mode();
dac0cc793368851 Alexander Gordeev 2025-06-12  550  	spin_unlock(&init_mm.page_table_lock);
2ba3e6947aed9bb Joerg Roedel      2020-06-01  551  	*mask |= PGTBL_PTE_MODIFIED;
^1da177e4c3f415 Linus Torvalds    2005-04-16 @552  	return 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  553  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


