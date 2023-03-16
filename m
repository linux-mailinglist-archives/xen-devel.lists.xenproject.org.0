Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4106BCA66
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:10:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510397.787984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjcu-0005OJ-Mj; Thu, 16 Mar 2023 09:10:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510397.787984; Thu, 16 Mar 2023 09:10:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcjcu-0005Li-Jt; Thu, 16 Mar 2023 09:10:24 +0000
Received: by outflank-mailman (input) for mailman id 510397;
 Thu, 16 Mar 2023 09:10:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XwUl=7I=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pcjct-0005Lc-9j
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:10:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5ff13bde-c3da-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 10:10:20 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37EFE2F4;
 Thu, 16 Mar 2023 02:11:03 -0700 (PDT)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CA5B23F67D;
 Thu, 16 Mar 2023 02:10:17 -0700 (PDT)
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
X-Inumbo-ID: 5ff13bde-c3da-11ed-b464-930f4c7d94ae
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org
Subject: [ImageBuilder][PATCH v2 0/2] uboot-script-gen: Add support for static heap and shared memory
Date: Thu, 16 Mar 2023 09:09:19 +0000
Message-Id: <20230316090921.338472-1-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series is to enable to set the device tree for static heap and static
shared memory by uboot-script-gen

Changes from v1:
 - Rename STATIC_HEAP to XEN_STATIC_HEAP and move it right after
   XEN_CMD documentation.
 - Rather than two separate properties and just use one like follows:
   Change
     DOMU_SHARED_MEM[0]="0x50000000 0x6000000 0x10000000"
     DOMU_SHARED_MEM_ID[0]="my-shared-mem-0"
   to
     DOMU_SHARED_MEM[0]="my-shared-mem-0 0x50000000 0x6000000 0x10000000"
- Use split_value function instead of opencoding it.

jiamei Xie (1):
  uboot-script-gen: Add XEN_STATIC_HEAP

jiamei.xie (1):
  uboot-script-gen: add support for static shared memory

 README.md                | 21 ++++++++++++++++++
 scripts/uboot-script-gen | 47 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

-- 
2.25.1


