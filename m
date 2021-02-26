Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8C13268DF
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 21:52:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90590.171532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFk5p-0003vy-JR; Fri, 26 Feb 2021 20:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90590.171532; Fri, 26 Feb 2021 20:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFk5p-0003vZ-G4; Fri, 26 Feb 2021 20:52:09 +0000
Received: by outflank-mailman (input) for mailman id 90590;
 Fri, 26 Feb 2021 20:52:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFk5o-0003vU-3G
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 20:52:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFk5n-0003mr-GT; Fri, 26 Feb 2021 20:52:07 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFk5n-0000aM-4F; Fri, 26 Feb 2021 20:52:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=VsJfaR9k5iBd3+FDtR3JcGQ5njGJ38LtsD9QIHJUxzI=; b=zfqh0kVJ+B3dwAi/OSzhIcbUAw
	gwqoMVOaLsXXP0Lgeh8cAkOiY4FVSfzWCspd8LziD+DRsDUXKSIs4Yj/M9N+0jcRdnX2gSXCrvBYl
	VhpC/KtVUfmr4O12G7bTV1WgZymuiV6pvcct1+ESEu0OGbM0DA6Q75ddyJe6b45yXTZ0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	ash.j.wilding@gmail.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Ensure the vCPU context is seen before clearing the _VPF_down
Date: Fri, 26 Feb 2021 20:51:58 +0000
Message-Id: <20210226205158.20991-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

A vCPU can get scheduled as soon as _VPF_down is cleared. As there is
currently not ordering guarantee in arch_set_info_guest(), it may be
possible that flag can be observed cleared before the new values of vCPU
registers are observed.

Add an smp_mb() before the flag is cleared to prevent re-ordering.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Barriers should work in pair. However, I am not entirely sure whether to
put the other half. Maybe at the beginning of context_switch_to()?

The issues described here is also quite theoritical because there are
hundreds of instructions executed between the time a vCPU is seen
runnable and scheduled. But better be safe than sorry :).
---
 xen/arch/arm/domain.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index bdd3d3e5b5d5..2b705e66be81 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -914,7 +914,14 @@ int arch_set_info_guest(
     v->is_initialised = 1;
 
     if ( ctxt->flags & VGCF_online )
+    {
+        /*
+         * The vCPU can be scheduled as soon as _VPF_down is cleared.
+         * So clear the bit *after* the context was loaded.
+         */
+        smp_mb();
         clear_bit(_VPF_down, &v->pause_flags);
+    }
     else
         set_bit(_VPF_down, &v->pause_flags);
 
-- 
2.17.1


