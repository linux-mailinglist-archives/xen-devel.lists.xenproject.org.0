Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4462A231D42
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jul 2020 13:14:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0k1x-0005MF-Aw; Wed, 29 Jul 2020 11:13:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wgl/=BI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k0k1v-0005MA-P0
 for xen-devel@lists.xenproject.org; Wed, 29 Jul 2020 11:13:51 +0000
X-Inumbo-ID: 93e4c694-d18c-11ea-a9a4-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93e4c694-d18c-11ea-a9a4-12813bfff9fa;
 Wed, 29 Jul 2020 11:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596021230;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ltCUzbEZ2+9uj7fZHbzDVa+LQOjGccZT024Lno+r4Hw=;
 b=IgGC2XarEt7HNnPZAa5DdyyU/e8EnXYUmm0UIy+STiLQ5OqBW74USwbM
 SZ+HKQcCgtkXxp+dCsI/N1JCbEkOwZlInKGtCjzikQ5k8wcpPogzr0Y1P
 FBeGmu23mJ3sXAAA486YlvlnyF6gkOJLwJACSngFQdeZTn3Wnwj/3HHSq k=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: nvPtda8nmZUyePAFIgJ5GzuHipQyvX5GSfEe328YF4FLzBeOV5SLGXjhTpTIuJmZHkv0sV3Scj
 hVakrvywlKyKXFiSRJAGQmaXr7Fs87YSYfUz2bWrPcsWkET1G/fn+N4ZDI7geZzn9WkanZxY/9
 mBlwDlY18mHV6E+CTT1ZQR/mzdg+zOwgxtvshZbWPijKXDN9KGdcAzL7AZBdevwx7h27J1CZoy
 XJEM7Xk3vGua0kXu1/u2xMqZW3CNnJPc2f8dyMoGpXHmdi8D35Utj2E0Mjs2fpDPYiCu56BJjN
 h+4=
X-SBRS: 2.7
X-MesageID: 23442515
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,410,1589256000"; d="scan'208";a="23442515"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] xen/spinlock: move debug helpers inside the locked regions
Date: Wed, 29 Jul 2020 13:13:30 +0200
Message-ID: <20200729111330.64549-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Debug helpers such as lock profiling or the invariant pCPU assertions
must strictly be performed inside the exclusive locked region, or else
races might happen.

Note the issue was not strictly introduced by the pointed commit in
the Fixes tag, since lock stats where already incremented before the
barrier, but that commit made it more apparent as manipulating the cpu
field could happen outside of the locked regions and thus trigger the
BUG_ON. This is only enabled on debug builds, and thus releases are
not affected.

Fixes: 80cba391a35 ('spinlocks: in debug builds store cpu holding the lock')
Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/common/spinlock.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/common/spinlock.c b/xen/common/spinlock.c
index 17f4519fc7..ce3106e2d3 100644
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -170,9 +170,9 @@ void inline _spin_lock_cb(spinlock_t *lock, void (*cb)(void *), void *data)
             cb(data);
         arch_lock_relax();
     }
+    arch_lock_acquire_barrier();
     got_lock(&lock->debug);
     LOCK_PROFILE_GOT;
-    arch_lock_acquire_barrier();
 }
 
 void _spin_lock(spinlock_t *lock)
@@ -198,9 +198,9 @@ unsigned long _spin_lock_irqsave(spinlock_t *lock)
 
 void _spin_unlock(spinlock_t *lock)
 {
-    arch_lock_release_barrier();
     LOCK_PROFILE_REL;
     rel_lock(&lock->debug);
+    arch_lock_release_barrier();
     add_sized(&lock->tickets.head, 1);
     arch_lock_signal();
     preempt_enable();
@@ -249,15 +249,15 @@ int _spin_trylock(spinlock_t *lock)
         preempt_enable();
         return 0;
     }
+    /*
+     * cmpxchg() is a full barrier so no need for an
+     * arch_lock_acquire_barrier().
+     */
     got_lock(&lock->debug);
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
     if (lock->profile)
         lock->profile->time_locked = NOW();
 #endif
-    /*
-     * cmpxchg() is a full barrier so no need for an
-     * arch_lock_acquire_barrier().
-     */
     return 1;
 }
 
-- 
2.27.0


