Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9F72FD2EB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 15:44:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71460.127982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ehz-0007i6-DI; Wed, 20 Jan 2021 14:43:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71460.127982; Wed, 20 Jan 2021 14:43:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Ehz-0007hh-9t; Wed, 20 Jan 2021 14:43:43 +0000
Received: by outflank-mailman (input) for mailman id 71460;
 Wed, 20 Jan 2021 14:43:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQTN=GX=kernel.org=leon@srs-us1.protection.inumbo.net>)
 id 1l2Ehx-0007hc-Sv
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 14:43:41 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3efdb27c-94dc-4881-b29d-c78fae243f96;
 Wed, 20 Jan 2021 14:43:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF1CC2336E;
 Wed, 20 Jan 2021 14:43:39 +0000 (UTC)
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
X-Inumbo-ID: 3efdb27c-94dc-4881-b29d-c78fae243f96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611153820;
	bh=EzWFXWUaQ8L7XQdnFNv4eBv0bCWXILnVCWFQUG+WDJs=;
	h=From:To:Cc:Subject:Date:From;
	b=t5SvnYtIkt89u3tf1pgFFPZSgPYHdxGJm+7fw4ouuNMZ4f01o6cyd/XF0UVcc6PB8
	 WhBBHp0tFjx7tGu3mVWzdJdcjQL2itOgMPccdfoBeykdNQn4ZaJmHWQ6Jkat0gJ17V
	 JQQLGferEq5YMkQUKTKn6gEc1BhfVE0tBsyqkrkoqxzuDk9AP/53ZvnMoyu9xjKcbh
	 YqjdY7DIeCvSOszlFTSP1bK21tEAgfDBvcNesCxe6IedEmn2hQlXkuoBWb8KZTS0pb
	 jE0p4aOUYxmWIwvlunGIxHRTb9m8e6pz7ZOJlbCTApGzCvL+XyRmYfFITRdPD1Jham
	 4w8rareBS+ktA==
From: Leon Romanovsky <leon@kernel.org>
To: David Woodhouse <dwmw@amazon.co.uk>,
	Juergen Gross <jgross@suse.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH] x86/xen: Fix compilation error due to missing nopvspin declaration
Date: Wed, 20 Jan 2021 16:43:03 +0200
Message-Id: <20210120144303.501486-1-leon@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

 arch/x86/xen/smp_hvm.c: In function 'xen_hvm_smp_init':
 arch/x86/xen/smp_hvm.c:77:3: error: 'nopvspin' undeclared (first use in this function)
    nopvspin = true;
    ^~~~~~~~
 arch/x86/xen/smp_hvm.c:77:3: note: each undeclared identifier is reported only once for each function it appears in
 make[4]: *** [scripts/Makefile.build:279: arch/x86/xen/smp_hvm.o] Error 1
 make[3]: *** [scripts/Makefile.build:496: arch/x86/xen] Error 2
 make[3]: *** Waiting for unfinished jobs....
 make[2]: *** [Makefile:1805: arch/x86] Error 2
 make[2]: *** Waiting for unfinished jobs....

Fixes: 3d7746bea925 ("x86/xen: Fix xen_hvm_smp_init() when vector callback not available")
Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 arch/x86/xen/smp_hvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/xen/smp_hvm.c b/arch/x86/xen/smp_hvm.c
index 056430a1080b..1656713db71c 100644
--- a/arch/x86/xen/smp_hvm.c
+++ b/arch/x86/xen/smp_hvm.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/thread_info.h>
 #include <asm/smp.h>
+#include <asm/qspinlock.h>

 #include <xen/events.h>

--
2.29.2


