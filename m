Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2802C5FD365
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 04:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.421621.667111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oioPw-0006kR-QJ; Thu, 13 Oct 2022 02:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 421621.667111; Thu, 13 Oct 2022 02:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oioPw-0006hf-NF; Thu, 13 Oct 2022 02:57:52 +0000
Received: by outflank-mailman (input) for mailman id 421621;
 Thu, 13 Oct 2022 02:57:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j8+s=2O=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oioPv-0006QE-35
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 02:57:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d2cbf27e-4aa2-11ed-91b4-6bf2151ebd3b;
 Thu, 13 Oct 2022 04:57:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B854D15DB;
 Wed, 12 Oct 2022 19:57:55 -0700 (PDT)
Received: from entos-skylake.shanghai.arm.com (entos-skylake.shanghai.arm.com
 [10.169.212.207])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 37A333F792;
 Wed, 12 Oct 2022 19:57:46 -0700 (PDT)
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
X-Inumbo-ID: d2cbf27e-4aa2-11ed-91b4-6bf2151ebd3b
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH for-4.17 1/2] docs: Document the minimal requirement of static heap
Date: Thu, 13 Oct 2022 02:57:21 +0000
Message-Id: <20221013025722.48802-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221013025722.48802-1-Henry.Wang@arm.com>
References: <20221013025722.48802-1-Henry.Wang@arm.com>

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

This commit adds documentation that explains how a user can size the
static heap region.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 87eaa3e254..046f28ce31 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -531,6 +531,13 @@ Below is an example on how to specify the static heap in device tree:
 RAM starting from the host physical address 0x30000000 of 1GB size will
 be reserved as static heap.
 
+Users should be mindful that the static heap should at least satisfy the
+allocation of the P2M maps for all guests. Currently, the minimal requirement
+of per-domain P2M pages pool is in-sync with function
+libxl__get_required_paging_memory() (for xl-created domUs) and
+domain_p2m_pages() (for dom0less domUs), that is, 1MB per vCPU, plus 4KiB per
+MiB of RAM for the P2M map, and plus 512KiB to cover extended regions.
+
 Static Shared Memory
 ====================
 
-- 
2.17.1


