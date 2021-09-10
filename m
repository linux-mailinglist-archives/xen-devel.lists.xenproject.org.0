Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5424060E9
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 02:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183770.332091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUIU-0007SS-C5; Fri, 10 Sep 2021 00:21:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183770.332091; Fri, 10 Sep 2021 00:21:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUIU-0007Pc-93; Fri, 10 Sep 2021 00:21:38 +0000
Received: by outflank-mailman (input) for mailman id 183770;
 Fri, 10 Sep 2021 00:21:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1So/=OA=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1mOUIS-0007PU-L6
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 00:21:36 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3b1c97d-a4c6-4169-b5f8-282d0232db61;
 Fri, 10 Sep 2021 00:21:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4B52604DC;
 Fri, 10 Sep 2021 00:21:34 +0000 (UTC)
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
X-Inumbo-ID: a3b1c97d-a4c6-4169-b5f8-282d0232db61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631233295;
	bh=L1NascCO+RqV2EXe7WgTVOgru+3jDwh0a4LVdwaZR/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=le8JpYTYX7fEO1b8fyXgaZSfOYm6pv+I74B3y145J2LTwFcvJQboMg4FdHCHlf8Sz
	 JX9OL+DQspZpvs3RuwBiXaJmZZImio38QXGbzvmP2FiXGO+RiuhgKWiyrdqvZntCcp
	 atXYYbcl7myrM22wfHZyFTMXm9P5BRuaPdheLtSAWydprnGMz++gdJ8iXQK+E82a97
	 JRWspK+h4nPQz9ABH+QX5C86kkTwDqnCFtPF4YQHTqgeJb/utqMec3RUbAy3ruy38W
	 WgrfdVVxOLUjzKubIS+3fCBt7+nVRfP32LR6h8HDHJCCVvP5cx3idVqgp4FP/wTGKV
	 FKjN8jVTKd4Ig==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.10 49/53] xen: remove stray preempt_disable() from PV AP startup code
Date: Thu,  9 Sep 2021 20:20:24 -0400
Message-Id: <20210910002028.175174-49-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002028.175174-1-sashal@kernel.org>
References: <20210910002028.175174-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Juergen Gross <jgross@suse.com>

[ Upstream commit 58e636039b512697554b579c2bb23774061877f5 ]

In cpu_bringup() there is a call of preempt_disable() without a paired
preempt_enable(). This is not needed as interrupts are off initially.
Additionally this will result in early boot messages like:

BUG: scheduling while atomic: swapper/1/0/0x00000002

Signed-off-by: Juergen Gross <jgross@suse.com>
Link: https://lore.kernel.org/r/20210825113158.11716-1-jgross@suse.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/xen/smp_pv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/x86/xen/smp_pv.c b/arch/x86/xen/smp_pv.c
index c2ac319f11a4..96afadf9878e 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -64,7 +64,6 @@ static void cpu_bringup(void)
 	cr4_init();
 	cpu_init();
 	touch_softlockup_watchdog();
-	preempt_disable();
 
 	/* PVH runs in ring 0 and allows us to do native syscalls. Yay! */
 	if (!xen_feature(XENFEAT_supervisor_mode_kernel)) {
-- 
2.30.2


