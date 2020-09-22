Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE42527491E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 21:29:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKny9-00073N-Vt; Tue, 22 Sep 2020 19:28:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZDRM=C7=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKny7-00073I-Qw
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 19:28:52 +0000
X-Inumbo-ID: f538ea9e-4e3a-46c5-8c67-f570747e507a
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f538ea9e-4e3a-46c5-8c67-f570747e507a;
 Tue, 22 Sep 2020 19:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
 bh=ELBXVt1YC1Qe7ZCtCl75qu55Vh/Op3lvAE15ZVrRx0Y=; b=Fcsskb8uOUU7VOs69OIluIu/Ux
 p2m4QUUmb6pSi/LTs4jQVwsJ1jQRjVfawEDUJcTQl7bffglCgYgQwpclM9sMAtWR8k6VNkVgtZEDu
 LcrwNH9D9m2McXfuv8RHyYE0p3MsWp65GIY2h5RT+tm11+HS7GyIuTx/W3d+aPsJQakg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKny5-0006rC-N2; Tue, 22 Sep 2020 19:28:49 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKny5-0001GN-AP; Tue, 22 Sep 2020 19:28:49 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: [PATCH] xen/arm: sched: Ensure the vCPU context is seen before
 vcpu_pause() returns
Date: Tue, 22 Sep 2020 20:28:24 +0100
Message-Id: <20200922192824.19619-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Some callers of vcpu_pause() will expect to access the latest vcpu
context when the function returns (see XENDOMCTL_{set,get}vcpucontext}.

However, the latest vCPU context can only be observed after
v->is_running has been observed to be false.

As there is no memory barrier instruction generated, a processor could
try to speculatively access the vCPU context before it was observed.

To prevent the corruption of the vCPU context, we need to insert a
memory barrier instruction after v->is_running is observed and before
the context is accessed. This barrier is added in sync_vcpu_execstate()
as it seems to be the place where we expect the synchronization to
happen.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Dario Faggioli <dfaggioli@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>

I am also adding the x86 and scheduler maintainers because I am not sure
whether this barrier should be part of the common code instead.
---
 xen/arch/arm/domain.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 9258f6d3faa2..3b37f899b9da 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -371,7 +371,20 @@ void sync_local_execstate(void)
 
 void sync_vcpu_execstate(struct vcpu *v)
 {
-    /* Nothing to do -- no lazy switching */
+    /*
+     * We don't support lazy switching.
+     *
+     * However the context may have been saved from a remote pCPU so we
+     * need a barrier to ensure it is observed before continuing.
+     *
+     * Per vcpu_context_saved(), the context can be observed when
+     * v->is_running is false (the caller should check it before calling
+     * this function).
+     *
+     * Note this is a full barrier to also prevent update of the context
+     * to happen before it was observed.
+     */
+    smp_mb();
 }
 
 #define NEXT_ARG(fmt, args)                                                 \
-- 
2.17.1


