Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2DE636532
	for <lists+xen-devel@lfdr.de>; Wed, 23 Nov 2022 17:02:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447670.704173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxsCQ-0007Vy-Ra; Wed, 23 Nov 2022 16:02:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447670.704173; Wed, 23 Nov 2022 16:02:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxsCQ-0007Oo-LI; Wed, 23 Nov 2022 16:02:10 +0000
Received: by outflank-mailman (input) for mailman id 447670;
 Wed, 23 Nov 2022 16:02:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QFfC=3X=huawei.com=xiujianfeng@srs-se1.protection.inumbo.net>)
 id 1oxsCP-0007Mj-P6
 for xen-devel@lists.xenproject.org; Wed, 23 Nov 2022 16:02:09 +0000
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cbf32f4-6b48-11ed-8fd2-01056ac49cbb;
 Wed, 23 Nov 2022 17:02:06 +0100 (CET)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NHQln6mVczJnhn;
 Wed, 23 Nov 2022 23:58:45 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 24 Nov 2022 00:02:02 +0800
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
X-Inumbo-ID: 2cbf32f4-6b48-11ed-8fd2-01056ac49cbb
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <jgross@suse.com>, <boris.ostrovsky@oracle.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <jeremy@goop.org>
CC: <x86@kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2]x86/xen: Fix memory leak issue
Date: Wed, 23 Nov 2022 23:58:56 +0800
Message-ID: <20221123155858.11382-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected

The new string allocated by kasprintf() is leaked on error paths

v2: follow Juergen's suggestion.

Xiu Jianfeng (2):
  x86/xen: Fix memory leak in xen_smp_intr_init{_pv}()
  x86/xen: Fix memory leak in xen_init_lock_cpu()

 arch/x86/xen/smp.c      | 24 ++++++++++++------------
 arch/x86/xen/smp_pv.c   | 12 ++++++------
 arch/x86/xen/spinlock.c |  6 +++---
 3 files changed, 21 insertions(+), 21 deletions(-)

-- 
2.17.1


