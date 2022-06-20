Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDFE550EA5
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jun 2022 04:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.352183.578914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37P7-0004hM-Uu; Mon, 20 Jun 2022 02:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 352183.578914; Mon, 20 Jun 2022 02:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o37P7-0004eU-PD; Mon, 20 Jun 2022 02:44:41 +0000
Received: by outflank-mailman (input) for mailman id 352183;
 Mon, 20 Jun 2022 02:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dqE0=W3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1o37P5-0004eN-Lm
 for xen-devel@lists.xenproject.org; Mon, 20 Jun 2022 02:44:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ec16ec18-f042-11ec-bd2d-47488cf2e6aa;
 Mon, 20 Jun 2022 04:44:37 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C09981042;
 Sun, 19 Jun 2022 19:44:35 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3CA363F7D7;
 Sun, 19 Jun 2022 19:44:31 -0700 (PDT)
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
X-Inumbo-ID: ec16ec18-f042-11ec-bd2d-47488cf2e6aa
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 0/9] populate/unpopulate memory when domain on static allocation
Date: Mon, 20 Jun 2022 10:43:59 +0800
Message-Id: <20220620024408.203797-1-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Today when a domain unpopulates the memory on runtime, they will always
hand the memory over to the heap allocator. And it will be a problem if it
is a static domain.
Pages used as guest RAM for static domain shall always be reserved to this
domain only, and not be used for any other purposes, so they shall never go
back to heap allocator.

This patch serie intends to fix this issue, by adding pages on the new list
resv_page_list after having taken them off the "normal" list, when unpopulating
memory, and retrieving pages from resv page list(resv_page_list) when
populating memory.

---
v7 changes:
- protect free_staticmem_pages with heap_lock to match its reverse function
acquire_staticmem_pages
- IS_ENABLED(CONFIG_STATIC_MEMORY) would not be needed anymore
- add page on the rsv_page_list *after* it has been freed
- remove the lock, since we add the page to rsv_page_list after it has
been totally freed.
---
v6 changes:
- rename PGC_staticmem to PGC_static
- remove #ifdef aroud function declaration
- use domain instead of sub-systems
- move non-zero is_domain_using_staticmem() from ARM header to common
header
- move PGC_static !CONFIG_STATIC_MEMORY definition to common header
- drop the lock before returning
---
v5 changes:
- introduce three new commits
- In order to avoid stub functions, we #define PGC_staticmem to non-zero only
when CONFIG_STATIC_MEMORY
- use "unlikely()" around pg->count_info & PGC_staticmem
- remove pointless "if", since mark_page_free() is going to set count_info
to PGC_state_free and by consequence clear PGC_staticmem
- move #define PGC_staticmem 0 to mm.h
- guard "is_domain_using_staticmem" under CONFIG_STATIC_MEMORY
- #define is_domain_using_staticmem zero if undefined
- extract common codes for assigning pages into a helper assign_domstatic_pages
- refine commit message
- remove stub function acquire_reserved_page
- Alloc/free of memory can happen concurrently. So access to rsv_page_list
needs to be protected with a spinlock
---
v4 changes:
- commit message refinement
- miss dropping __init in acquire_domstatic_pages
- add the page back to the reserved list in case of error
- remove redundant printk
- refine log message and make it warn level
- guard "is_domain_using_staticmem" under CONFIG_STATIC_MEMORY
- #define is_domain_using_staticmem zero if undefined
---
v3 changes:
- fix possible racy issue in free_staticmem_pages()
- introduce a stub free_staticmem_pages() for the !CONFIG_STATIC_MEMORY case
- move the change to free_heap_pages() to cover other potential call sites
- change fixed width type uint32_t to unsigned int
- change "flags" to a more descriptive name "cdf"
- change name from "is_domain_static()" to "is_domain_using_staticmem"
- have page_list_del() just once out of the if()
- remove resv_pages counter
- make arch_free_heap_page be an expression, not a compound statement.
- move #ifndef is_domain_using_staticmem to the common header file
- remove #ifdef CONFIG_STATIC_MEMORY-ary
- remove meaningless page_to_mfn(page) in error log
---
v2 changes:
- let "flags" live in the struct domain. So other arch can take
advantage of it in the future
- change name from "is_domain_on_static_allocation" to "is_domain_static()"
- put reserved pages on resv_page_list after having taken them off
the "normal" list
- introduce acquire_reserved_page to retrieve reserved pages from
resv_page_list
- forbid non-zero-order requests in populate_physmap
- let is_domain_static return ((void)(d), false) on x86
- fix coding style

Penny Zheng (9):
  xen/arm: rename PGC_reserved to PGC_static
  xen: do not free reserved memory into heap
  xen: update SUPPORT.md for static allocation
  xen: do not merge reserved pages in free_heap_pages()
  xen: add field "flags" to cover all internal CDF_XXX
  xen/arm: introduce CDF_staticmem
  xen/arm: unpopulate memory when domain is static
  xen: introduce prepare_staticmem_pages
  xen: retrieve reserved pages on populate_physmap

 SUPPORT.md                        |   7 ++
 xen/arch/arm/domain.c             |   2 -
 xen/arch/arm/domain_build.c       |   5 +-
 xen/arch/arm/include/asm/domain.h |   3 +-
 xen/arch/arm/include/asm/mm.h     |   8 +-
 xen/common/domain.c               |   7 ++
 xen/common/memory.c               |  23 +++++
 xen/common/page_alloc.c           | 155 +++++++++++++++++++++---------
 xen/include/xen/domain.h          |  12 +++
 xen/include/xen/mm.h              |  10 +-
 xen/include/xen/sched.h           |   6 ++
 11 files changed, 182 insertions(+), 56 deletions(-)

-- 
2.25.1


