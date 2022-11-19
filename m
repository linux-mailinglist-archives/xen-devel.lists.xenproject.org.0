Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD6D630E34
	for <lists+xen-devel@lfdr.de>; Sat, 19 Nov 2022 12:07:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.446043.701541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owLgk-0008Iy-HW; Sat, 19 Nov 2022 11:07:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 446043.701541; Sat, 19 Nov 2022 11:07:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1owLgk-0008D0-A7; Sat, 19 Nov 2022 11:07:10 +0000
Received: by outflank-mailman (input) for mailman id 446043;
 Sat, 19 Nov 2022 09:02:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TADl=3T=huawei.com=xiujianfeng@srs-se1.protection.inumbo.net>)
 id 1owJkD-0003Ee-FS
 for xen-devel@lists.xenproject.org; Sat, 19 Nov 2022 09:02:37 +0000
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e8be1769-67e8-11ed-91b6-6bf2151ebd3b;
 Sat, 19 Nov 2022 10:02:36 +0100 (CET)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NDndf0h6HzFqQ9;
 Sat, 19 Nov 2022 16:59:18 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sat, 19 Nov 2022 17:02:29 +0800
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
X-Inumbo-ID: e8be1769-67e8-11ed-91b6-6bf2151ebd3b
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <jgross@suse.com>, <boris.ostrovsky@oracle.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <jeremy@goop.org>
CC: <x86@kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] x86/xen: Fix memory leak issue
Date: Sat, 19 Nov 2022 16:59:21 +0800
Message-ID: <20221119085923.114889-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected

The new string allocated by kasprintf() is leaked on error path

Xiu Jianfeng (2):
  x86/xen: Fix memory leak in xen_smp_intr_init{_pv}()
  x86/xen: Fix memory leak in xen_init_lock_cpu()

 arch/x86/xen/smp.c      | 16 ++++++++++++----
 arch/x86/xen/smp_pv.c   |  8 ++++++--
 arch/x86/xen/spinlock.c |  3 ++-
 3 files changed, 20 insertions(+), 7 deletions(-)

-- 
2.17.1


