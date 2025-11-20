Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E552C7615C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 20:33:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1167942.1494116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAPE-0001oe-5C; Thu, 20 Nov 2025 19:33:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1167942.1494116; Thu, 20 Nov 2025 19:33:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vMAPD-0001kh-W6; Thu, 20 Nov 2025 19:33:23 +0000
Received: by outflank-mailman (input) for mailman id 1167942;
 Thu, 20 Nov 2025 19:33:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zJ8u=54=gmail.com=nicola.vetrini@bugseng.com>)
 id 1vMAPC-0001hr-QQ
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 19:33:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c65e2080-c647-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 20:33:22 +0100 (CET)
Received: from nico-ideapad (93-44-185-120.ip98.fastwebnet.it [93.44.185.120])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPSA id 18C6D4EEBF05;
 Thu, 20 Nov 2025 20:33:20 +0100 (CET)
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
X-Inumbo-ID: c65e2080-c647-11f0-9d18-b5c5bf9af7f9
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=93.44.185.120
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1763667202;
	b=QBOJn5COohY6EVdf9TchCvbCtKP6qVM60HetoIS12UZ2YiHx+Jg13HaiuQe46Q/L2KVS
	 AZXcG7YFyYhKzWyLqV3FQk1DKF74EsbSPaOAOCSLQ10GN0MbFfrb6IqayMAWZb1Z1lIFD
	 XNpvb2A2+jr908oA6x1nQVaZ0Fc/FwfIUSPxed67PdPs5ESyHobds7QST8MmAJwRVgErg
	 /Tp2ApV7JLIPRL7i+/WkNuuBOxlLhp2nsabLQdHSvB1KIFUpLjsKi1gbVMU4dCKaJYuEo
	 JxmEz06rCFO8c/x06Cb0/KCF+Y3pDfMO2bcnzZy21dVrPboXWa1heClJD7me482G5A47p
	 2uClJ9SRvCL+kSpM/gSQutfkoRJhPC6Y6yqKZTyvEPfabwEBEpcP31av5PqggULM/ug0Y
	 HYLp34H8gF6oJbxli9d35cq/jYXQNvF2D11mBcjHdK2rNSeVfxo9YLiEjZYHPHrxB7ewT
	 JGrYb1MgMz45n9+/yERN2PvNsXXIpufsFixBQ/+rOKe0V7bXRsamwdsGlZ+PxtEjTEMKc
	 FFN9pVRppAEbFpx8tM2RhP188InEuuAoKATgQ/Fv1tkWxPQyqzmA8hUu2Rrosrm8Ls10D
	 ZgdhtRteKAT/m8KcPUaHrF/gLJBOuFibYm4lvSnNQ+0idrE2J3j68uhjm9a21pg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1763667202;
	h=From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xleBcpqxr79kzkE5NhaulXEzW9GO9ArZ3q/6z7TZImA=;
	b=BiXb7B7hIrXv+fEis3uOor5bjbh/78aJwbAfgGw8CQYi++IDePbbYU2U9fMD3VfxcFyv
	 8I2G2QNexryiCccfylQY1Oh0RaWps8EFfytMC0NRWOAmOUepWI7jbPl2tA//fWRMwCDyJ
	 iqZTwogZGLZE9y7PiRkhPSd03QlLsoV/EfDSwoquYjM6yvBaCN2vlPVEWPjl3rWJtMV6y
	 yQ5DZXStmvwtsaDSyP98Hazy9teZDdcTysosGhrEMCfZXo0jEiA4uyQMUmjcCE2+9gVgu
	 yjwVidD5S5PnrLHhv4+GpnVY4Ovzlns04pxekeohq0+888bUFznz930BycK5rPobPitlh
	 Z+ZQ5+Ou4yckW3Dpn/TMuGn9PcyBI4tROJiKNoxYR7QiuW527EQaJwobGdC9cbK6dWqJr
	 qEykfm+bHCaOQZqgQbdMO6/2hrRf5VTdm6Hhl1jYi5nBzcYv1eFPeAY0vtomxcQTNC+ky
	 6vlmZcuLAqb9YwUXzkHXDdEdF/KxD3buEBTdB6aBEiwFe2RwDChqWZqcK2q5L5nGnpJNs
	 3bBqBSb/HLEm3c0JAlbRTj8QhAuJKPIbtAMejvSLBjGe8LML/6LWzEwxPPwLe/5n1sezT
	 PQw9Fq4OBgVrABgVZLGhxtmRxk8UKan63ix9cPbpYXFicnECCcz3MUXzMytYhus=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=93.44.185.120
From: Nicola Vetrini <nicola.vetrini@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andrew.cooper3@citrix.com,
	jbeulich@suse.com,
	sstabellini@kernel.org,
	Nicola Vetrini <nicola.vetrini@gmail.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH 2/4] xen/sched: address violation of MISRA C Rule 16.3
Date: Thu, 20 Nov 2025 20:32:54 +0100
Message-ID: <60e3bd1ba6ab3bc47d3a95ddf1e3e7ef71db5f3d.1763642993.git.nicola.vetrini@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1763642993.git.nicola.vetrini@gmail.com>
References: <cover.1763642993.git.nicola.vetrini@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rule states: An unconditional `break' statement shall terminate
every switch-clause.

Use the `fallthrough' pseudo-keyword for which an ECLAIR deviation
is already in place.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@gmail.com>
---
 xen/common/sched/credit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 6dcf6b2c8b..e9a91d11c3 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -1288,7 +1288,7 @@ csched_sys_cntl(const struct scheduler *ops,
         prv->unit_migr_delay = MICROSECS(params->vcpu_migr_delay_us);
         spin_unlock_irqrestore(&prv->lock, flags);
 
-        /* FALLTHRU */
+        fallthrough;
     case XEN_SYSCTL_SCHEDOP_getinfo:
         params->tslice_ms = prv->tslice / MILLISECS(1);
         params->ratelimit_us = prv->ratelimit / MICROSECS(1);
-- 
2.51.2


