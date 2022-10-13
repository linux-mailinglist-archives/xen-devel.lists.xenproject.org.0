Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBF95FD364
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 04:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421620.667101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oioPp-0006TQ-II; Thu, 13 Oct 2022 02:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421620.667101; Thu, 13 Oct 2022 02:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oioPp-0006QR-F0; Thu, 13 Oct 2022 02:57:45 +0000
Received: by outflank-mailman (input) for mailman id 421620;
 Thu, 13 Oct 2022 02:57:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oioPn-0006QE-SY
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 02:57:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cdfe0aa2-4aa2-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 04:57:42 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B82BB15DB;
 Wed, 12 Oct 2022 19:57:47 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 265BC3F792;
 Wed, 12 Oct 2022 19:57:37 -0700 (PDT)
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
X-Inumbo-ID: cdfe0aa2-4aa2-11ed-91b4-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH for-4.17 0/2] Static heap follow-up doc changes
Date: Thu, 13 Oct 2022 02:57:20 +0000
Message-Id: <20221013025722.48802-1-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1

The static heap feature requires user to know the minimal size of
heap to make sure the system can work. Since the heap controlled
by Xen is intended to provide memory for the whole system, not only
the boot time memory allocation should be covered by the static
heap region, but also the runtime allocation should be covered.

The main source of runtime allocation is the memory for the P2M.
Currently, from XSA-409, the P2M memory is bounded by the P2M pool.
So make this part as the minimal requirement of static heap. The
amount of memory allocated after all the guests have been created
should be quite limited and mostly predictable.

Also, with the P2M pages pool bounding the domain memory runtime
allocation and the documented minimal size requirement of the static
heap, it is safe to mark static heap feature as supported.

This series handles the above-mentioned doc changes respectively.

Henry Wang (2):
  docs: Document the minimal requirement of static heap
  SUPPORT.md: Mark static heap feature as supported

 SUPPORT.md                            | 2 +-
 docs/misc/arm/device-tree/booting.txt | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.17.1


