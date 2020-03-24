Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 960FE191430
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 16:25:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGlO1-0005fd-Dk; Tue, 24 Mar 2020 15:22:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=H+Hk=5J=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jGlO0-0005fY-2T
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 15:22:36 +0000
X-Inumbo-ID: 49e35e5a-6de3-11ea-92cf-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49e35e5a-6de3-11ea-92cf-bc764e2007e4;
 Tue, 24 Mar 2020 15:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gXKApFCXQyoLaC6VBivA79px1QsfOhlMkVAh1Z6eOKQ=; b=VNjPmN0rjbHdubpX5eQRIrplQD
 5D6pPEyvxbCQgc/bmK4TGICqrNX+Uq/cqbcxRXNkBvlgdBSgmYGROEddIuOs3qKhuI/741VDezP7Z
 fkNPXGW8eTC1KI9oQr4M9zZl9oKKR2DegdRXkeQqchLGwQWgw1brmUEiO3KYs/icvsGs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jGlNy-0007y6-V9; Tue, 24 Mar 2020 15:22:34 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <hx242@xen.org>)
 id 1jGlNy-0004ZY-Kl; Tue, 24 Mar 2020 15:22:34 +0000
From: Hongyan Xia <hx242@xen.org>
To: xen-devel@lists.xenproject.org
Date: Tue, 24 Mar 2020 15:21:58 +0000
Message-Id: <de46590ad566d9be55b26eaca0bc4dc7fbbada59.1585063311.git.hongyxia@amazon.com>
X-Mailer: git-send-email 2.17.1
Subject: [Xen-devel] [PATCH] Revert "domctl: improve locking during domain
 destruction"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Hongyan Xia <hongyxia@amazon.com>

Unfortunately, even though that commit dropped the domctl lock and
allowed other domctl to continue, it created severe lock contention
within domain destructions themselves. Multiple domain destructions in
parallel now spin for the global heap lock when freeing memory and could
spend a long time before the next hypercall continuation. In contrast,
after dropping that commit, parallel domain destructions will just fail
to take the domctl lock, creating a hypercall continuation and backing
off immediately, allowing the thread that holds the lock to destroy a
domain much more quickly and allowing backed-off threads to process
events and irqs.

On a 144-core server with 4TiB of memory, destroying 32 guests (each
with 4 vcpus and 122GiB memory) simultaneously takes:

before the revert: 29 minutes
after the revert: 6 minutes

This is timed between the first page and the very last page of all 32
guests is released back to the heap.

This reverts commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
---
 xen/common/domain.c | 11 +----------
 xen/common/domctl.c |  5 +----
 2 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index b4eb476a9c..7b02f5ead7 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -698,20 +698,11 @@ int domain_kill(struct domain *d)
     if ( d == current->domain )
         return -EINVAL;
 
-    /* Protected by d->domain_lock. */
+    /* Protected by domctl_lock. */
     switch ( d->is_dying )
     {
     case DOMDYING_alive:
-        domain_unlock(d);
         domain_pause(d);
-        domain_lock(d);
-        /*
-         * With the domain lock dropped, d->is_dying may have changed. Call
-         * ourselves recursively if so, which is safe as then we won't come
-         * back here.
-         */
-        if ( d->is_dying != DOMDYING_alive )
-            return domain_kill(d);
         d->is_dying = DOMDYING_dying;
         argo_destroy(d);
         evtchn_destroy(d);
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index a69b3b59a8..e010079203 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -571,14 +571,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
         break;
 
     case XEN_DOMCTL_destroydomain:
-        domctl_lock_release();
-        domain_lock(d);
         ret = domain_kill(d);
-        domain_unlock(d);
         if ( ret == -ERESTART )
             ret = hypercall_create_continuation(
                 __HYPERVISOR_domctl, "h", u_domctl);
-        goto domctl_out_unlock_domonly;
+        break;
 
     case XEN_DOMCTL_setnodeaffinity:
     {
-- 
2.17.1


