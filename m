Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CB76C0A98
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 07:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511722.790893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pe8zj-0001CX-Oe; Mon, 20 Mar 2023 06:27:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511722.790893; Mon, 20 Mar 2023 06:27:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pe8zj-0001AI-Lw; Mon, 20 Mar 2023 06:27:47 +0000
Received: by outflank-mailman (input) for mailman id 511722;
 Mon, 20 Mar 2023 06:27:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbMo=7M=arm.com=jiamei.xie@srs-se1.protection.inumbo.net>)
 id 1pe8zh-0001AC-Fz
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 06:27:45 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 50998608-c6e8-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 07:27:42 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A5C1FEC;
 Sun, 19 Mar 2023 23:28:24 -0700 (PDT)
Received: from comhpcalt.shanghai.arm.com (comhpcalt.shanghai.arm.com
 [10.169.190.22])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B43F63F885;
 Sun, 19 Mar 2023 23:27:38 -0700 (PDT)
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
X-Inumbo-ID: 50998608-c6e8-11ed-87f5-c1b5be75604c
From: "jiamei.xie" <jiamei.xie@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	jiamei.xie@arm.com,
	sstabellini@kernel.org
Subject: [ImageBuilder][PATCH v3 0/2] uboot-script-gen: Add support for static heap and shared memory
Date: Mon, 20 Mar 2023 06:27:16 +0000
Message-Id: <20230320062718.365896-1-jiamei.xie@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,
This patch series is to enable to set the device tree for static heap and static
shared memory by uboot-script-gen

Changes from v2:
 - Remove "domid" parameter
 - Use lower capital letters for local variables
 - add Reviewed-by and Acked-by in XEN_STATIC_HEAP commit message 
Changes from v1:
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
 scripts/uboot-script-gen | 46 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

-- 
2.25.1


