Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4144060BA
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 02:18:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183756.332069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUEx-0005HN-JH; Fri, 10 Sep 2021 00:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183756.332069; Fri, 10 Sep 2021 00:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUEx-0005FD-Fw; Fri, 10 Sep 2021 00:17:59 +0000
Received: by outflank-mailman (input) for mailman id 183756;
 Fri, 10 Sep 2021 00:17:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1So/=OA=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1mOUEw-0005F7-Lv
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 00:17:58 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8c60b5f0-11cc-11ec-b204-12813bfff9fa;
 Fri, 10 Sep 2021 00:17:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D4099611BF;
 Fri, 10 Sep 2021 00:17:55 +0000 (UTC)
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
X-Inumbo-ID: 8c60b5f0-11cc-11ec-b204-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631233076;
	bh=L1NascCO+RqV2EXe7WgTVOgru+3jDwh0a4LVdwaZR/I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=arFFHtckENB/uaxPUEVv7ZUYqMWFts/MhT7jppWwPMHuIbxB74zrMtB87W0Ghq9ft
	 ioBgf5/NtxpeX0JpCEJwCqr0B2oHqC8G+0qV1px9BWYrX9qjx+/uvO+5wA/1PKoEEt
	 Jfy9T0Ur7fqA+1Z3lDyM49Hwi5epZNQDckSf7SzW1ofg2qfqzHw/Ts2V1TwXhkrHcN
	 SkHx/4itK+7zPdE0VP2Qx/4Mu0tNhyef9H6LzL6+EfMiKrJe+VdtaHeUHbjxJdfi8f
	 v1vjyiRG8+mijL7rP7ClsUnnapzz+yItaqq6zqAdZu0iWK37SWqkiLPl45BTwMHg4L
	 ENRKxc5nK3AZQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.14 85/99] xen: remove stray preempt_disable() from PV AP startup code
Date: Thu,  9 Sep 2021 20:15:44 -0400
Message-Id: <20210910001558.173296-85-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
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


