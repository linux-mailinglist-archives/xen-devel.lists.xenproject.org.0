Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B739151E3B2
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 04:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323536.545252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnAan-0003sx-2P; Sat, 07 May 2022 02:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323536.545252; Sat, 07 May 2022 02:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnAam-0003pW-VR; Sat, 07 May 2022 02:54:48 +0000
Received: by outflank-mailman (input) for mailman id 323536;
 Sat, 07 May 2022 02:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7OHR=VP=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nnAal-0003pQ-7r
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 02:54:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 0cc602d5-cdb1-11ec-a406-831a346695d4;
 Sat, 07 May 2022 04:54:45 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73E8914BF;
 Fri,  6 May 2022 19:54:44 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 883673F800;
 Fri,  6 May 2022 19:54:40 -0700 (PDT)
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
X-Inumbo-ID: 0cc602d5-cdb1-11ec-a406-831a346695d4
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Wei Chen <wei.chen@arm.com>,
	Henry Wang <henry.wang@arm.com>
Subject: [PATCH v3 0/2] Adjustment after introducing ASSERT_ALLOC_CONTEXT
Date: Sat,  7 May 2022 10:54:32 +0800
Message-Id: <20220507025434.1063710-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the enhanced ASSERT_ALLOC_CONTEXT, calling request_irq before
local_irq_enable on secondary cores on Arm will lead to

(XEN) Xen call trace:
(XEN) [<000000000021d86c>] alloc_xenheap_pages+0x74/0x194 (PC)
(XEN) [<000000000021d864>] alloc_xenheap_pages+0x6c/0x194 (LR)
(XEN) [<0000000000229e90>] xmalloc_tlsf.c#xmalloc_pool_get+0x1c/0x28
(XEN) [<000000000022a270>] xmem_pool_alloc+0x21c/0x448
(XEN) [<000000000022a8dc>] _xmalloc+0x8c/0x290
(XEN) [<000000000026b57c>] request_irq+0x40/0xb8
(XEN) [<0000000000272780>] init_timer_interrupt+0x74/0xcc
(XEN) [<000000000027212c>] start_secondary+0x1b4/0x238
(XEN) [<0000000084000200>] 0000000084000200
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 4:
(XEN) Assertion '!in_irq() && (local_irq_is_enabled() ||
num_online_cpus() <= 1)' failed at common/page_alloc.c:2212
(XEN) ****************************************

on systems without a big enough pool for xmalloc() to cater the
requested size. To solve this issue, this series introduces two
patches. The first one defers the calling of request_irq on
secondary CPUs after local_irq_enable on Arm. The second one
moves the definition of ASSERT_ALLOC_CONTEXT to header and uses
the ASSERT_ALLOC_CONTEXT to replace the original assertion in
xmalloc().

Also take the chance to enhance the assertion in xmalloc_tlsf.c.

Henry Wang (2):
  xen/arm: Defer request_irq on secondary CPUs after local_irq_enable
  xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in xmalloc()

 xen/arch/arm/smpboot.c    | 12 +++++++++---
 xen/common/page_alloc.c   |  7 -------
 xen/common/xmalloc_tlsf.c | 10 +++++++---
 xen/include/xen/irq.h     |  7 +++++++
 4 files changed, 23 insertions(+), 13 deletions(-)

-- 
2.25.1


