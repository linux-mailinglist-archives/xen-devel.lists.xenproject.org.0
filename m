Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E888B4060F3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 02:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183782.332113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUJu-0000Gb-VH; Fri, 10 Sep 2021 00:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183782.332113; Fri, 10 Sep 2021 00:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOUJu-0000Dg-S3; Fri, 10 Sep 2021 00:23:06 +0000
Received: by outflank-mailman (input) for mailman id 183782;
 Fri, 10 Sep 2021 00:23:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1So/=OA=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1mOUJs-0000DC-Sj
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 00:23:04 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43510a62-11cd-11ec-b204-12813bfff9fa;
 Fri, 10 Sep 2021 00:23:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2057611BD;
 Fri, 10 Sep 2021 00:23:02 +0000 (UTC)
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
X-Inumbo-ID: 43510a62-11cd-11ec-b204-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631233383;
	bh=ISzSvm4C6f8lHwgz+pYqhFqWZ8I8lIYQVNbzl6VCqi8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a5MczqkOv12YbXLfY+4UES3v7pDgRRD1dU8G94Qd7iHMhMSSSq8cmGwT+rXcnRt8m
	 /Mc5s268pWlkd4bq/VhK/PT4cHc6Dwo8ij7i3AjMTp9pA7ak+OKVDc6lo8YwQdVEGG
	 SXzdnBzR4qHIbj0mmYPkiBqRnjFTdqblDnis4MdC9yTyX+tkSDKHCeVBeekwsJKqcZ
	 c/OCy7kpOFXYakCa3kchfeiujZE+xS8+oa/y7aZfAPpxb/FCay3TBPYBBG8gDranT1
	 D9gGC0CIMdD1WlhldaPoPg9/h6oG9vWZgjPW7j2M8bKPBvhhDX2gYas3mVI8MIe7Or
	 biPeLnvF+4N8w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 4.19 22/25] xen: remove stray preempt_disable() from PV AP startup code
Date: Thu,  9 Sep 2021 20:22:30 -0400
Message-Id: <20210910002234.176125-22-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002234.176125-1-sashal@kernel.org>
References: <20210910002234.176125-1-sashal@kernel.org>
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
index 41fd4c123165..7b6e56703bb9 100644
--- a/arch/x86/xen/smp_pv.c
+++ b/arch/x86/xen/smp_pv.c
@@ -59,7 +59,6 @@ static void cpu_bringup(void)
 
 	cpu_init();
 	touch_softlockup_watchdog();
-	preempt_disable();
 
 	/* PVH runs in ring 0 and allows us to do native syscalls. Yay! */
 	if (!xen_feature(XENFEAT_supervisor_mode_kernel)) {
-- 
2.30.2


