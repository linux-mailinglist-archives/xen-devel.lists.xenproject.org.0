Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34626A36714
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 21:46:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889052.1298301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj2ZS-0008Tu-Si; Fri, 14 Feb 2025 20:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889052.1298301; Fri, 14 Feb 2025 20:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj2ZS-0008SJ-Pw; Fri, 14 Feb 2025 20:45:58 +0000
Received: by outflank-mailman (input) for mailman id 889052;
 Fri, 14 Feb 2025 20:45:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vKzd=VF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1tj2ZR-0008RW-H3
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 20:45:57 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afe48f91-eb14-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 21:45:55 +0100 (CET)
Received: from nico.tail608894.ts.net (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id 0AF954EF5133;
 Fri, 14 Feb 2025 21:45:52 +0100 (CET)
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
X-Inumbo-ID: afe48f91-eb14-11ef-9896-31a8f345e629
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=46.228.253.214
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1739565955;
	b=SRGrr3fWpxobkT6A8GTnCqfGSsQBST0I5DTyG9lsvRSxJ/stJC5nYLCHqzeOX3bL13Nz
	 RaDeFCCB4uz2Gvk4hzwOMkS29/0It39M/KVLSohFkYnoVZcFZMaZJhdQ6qLginsodZ9C+
	 DZiazjAxtqeWNLQlXJFzzd98zEJ9YcydDqioBF9NT71aEwqh21uyU6Um+WIiiOB+g32U6
	 sKq5e67S9f3WHF3W4mB8Q4njU50sM1FdtMFVvIPuCP45+W66EaElwlEpu77b5NxCtTus3
	 CltaL2vgSumf3txWHo8wdQ6skthayfTjURsgk8iGJyx4V9tl6AOyrH266Wu30qUSuOjtC
	 0z/mzm4OmAVaRj1f3B10B4m8EJkixRrFlOwMHY8FE9sloPgwmxWn/G9h84hNeoZekORek
	 X16AN903m+ot8Jml3ELcf5I2twsLO9Gwm5T5Frn2Ev/2JLvQR0ZBbHm6dXmwYqV9bMwwm
	 af9Du4SpK/2tSAaZDZNdT9IzV8R0HDTEUn8MMbc1VqQ7VjZxWMElPjH/OUR/I+lVawE3g
	 7cEAbZcS1RKrjMBQ+vRd6zITHnL7jtuG8Dbuh1nLE8OYWXR8VABSJhc45xMph7bp5PwA/
	 90Yi5RGf/jLHcNpKHfg9uxMJAWda0yNP46Do/Z2DPTbhJil4o1T7X/3rlx87cpw=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1739565955;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=F6dLZHpAftKOEJLHOuiXBv1ROWYaaj6czWWml//vfP0=;
	b=oviKzs0tnfmSMvkUg1ae9I4NMp+AGpxMtrjTWz7KMlJSjAJzhjnw7+x2fi4VMa5AQLTX
	 02YxcshJDUkm7eKlH3WpSg68eJYZNO7IzGJrSEZWRCKKe4ubxqq2t7iucAfCUv8BOknBg
	 ltJutQGsP6DmwIXPdGpR1akJqv/2XWwJDIygwXaFgsxXgITePLxwrt6HuWEga5Q7wYfVO
	 uEg1qH2AF1yIF4lL/kvl+73j439Zdp2AmF0ZqmTPzLVLuGZntu+y2aHkY9f5daHtJ7O5p
	 BjqPFQSPcSyHMe+v6aDATsvC0dqaQf1as2aZgzj/92hJgQvmeFVnDjbs9LBIFHz7rY3FY
	 ic4+U0Ch9DzgHG2WKSPSnx2wGGBauaJu5ZU4gNMrtH+Etni9GS88GJzKtacTRcyFXdd9B
	 aX/IqN/NuMYJuUymLhlNNlwtZblFNoG97wlYNTYVRTSCNIZTL0RkxKy5ny5ivZFh7u32C
	 oL2XuhtVyeVY6nuyb5dX6iN5s/DgZP1p0HtUoNogjQELcLw6u7SVeR+OR2ItfzoSURSzW
	 jwtBTapXsDjAEHnQtzIQg+NZTI4B+4aZ1rYGfTheMdaQTXS3Xt5f9OuFYJanqBd6AUXdm
	 CF8SSTinOuVKsgKvrXjK/dsjLB2oXj8PhHsFAc0qN1tgC/hlMCKg4niLvea7wDY=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=46.228.253.214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1739565955; bh=rEgEDMpEVP5VlbunFiK29t0Y1ZnvBhmsHk6WUsWWNG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PO5lgtBMFI2wMxd7QJ/57rYccIJUVHSFshYS2KAkD2u825wmMrbHonalfLVmdht8m
	 GsAJci8/YN7Ay3037S1Fq4m830N9u/IbrHUsACV18fDKe+Ig5XhrKATtZ4R83wM5Ur
	 DRembfBxS8XQIq8vzeC1TVYfGKcVPDq00hUWImsd6EhYlwnV2eFXe5NYILGodv62Tx
	 j3I9U5sv+ROhOPM24S/eHikJDw7szcUSQegHuoHot36KYXr0B9r1n/tEELiQTKzeHJ
	 hgsrdKyP+Haw0d3u49oPLRVxzFrZkxgmZJcYHUHhZOIA7j4YzyEchrp4SW3UA+sQDC
	 Ip7rjfauefO5A==
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Meng Xu <mengxu@cis.upenn.edu>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [XEN PATCH 2/3] xen/sched: address violation of MISRA C Rule 8.2
Date: Fri, 14 Feb 2025 21:45:22 +0100
Message-ID: <36cd255a8d4068a66ad8cf45060d60b84b9d4c6d.1739564781.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739564781.git.nicola.vetrini@bugseng.com>
References: <cover.1739564781.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 8.2 states: "Function types shall be in prototype form with
named parameters".

The parameter name is missing from the function pointer type
that constitutes the first parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
This small fix is needed in order to keep the rule clean in the
follow-up patch that changes the Xen configuration under static
analysis.

I wasn't really certain about the right name to give to the parameter,
so if there are better options I'd be happy to accept them.
---
 xen/common/sched/rt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
index f368e0fdd5a5..0300d2d2e454 100644
--- a/xen/common/sched/rt.c
+++ b/xen/common/sched/rt.c
@@ -500,7 +500,7 @@ deadline_queue_remove(struct list_head *queue, struct list_head *elem)
 }
 
 static inline bool
-deadline_queue_insert(struct rt_unit * (*qelem)(struct list_head *),
+deadline_queue_insert(struct rt_unit * (*qelem)(struct list_head *q_iter),
                       struct rt_unit *svc, struct list_head *elem,
                       struct list_head *queue)
 {
-- 
2.43.0


