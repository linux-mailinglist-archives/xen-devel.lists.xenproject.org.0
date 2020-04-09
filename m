Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 334531A3201
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 11:42:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMThK-00059r-Ch; Thu, 09 Apr 2020 09:42:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7Ryc=5Z=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1jMThI-00059h-Lv
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 09:42:08 +0000
X-Inumbo-ID: 5fd92f86-7a46-11ea-82a1-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fd92f86-7a46-11ea-82a1-12813bfff9fa;
 Thu, 09 Apr 2020 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586425326;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=+uf2awDyEnaXI/3JjExta3Qxvv+TksGEoqixqNzCH7w=;
 b=PAYC0vPKFrn8ZkJfkvG0TtI07JlmkTLj9jQcl5W1mLhzR9Djf9A78KMI
 nJ6RoJj0bIyaLfjLRVxbqFZzw0QtfRBd9UU4ogNrsanpFUh4XKhovGxH0
 jiaYt4h7xogMKWjkwXv1QS4OVTs0eIEwcsRKPInq5LdlgNBx4XYp0i2qX M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 12bL7UfDp48cTDfK6rg6dkSj7OuFZU1AucseVrh9YC7Ni3fLeBe67cE0V73fiK29Hhl2CillX+
 Fst7NN+0jeeWz0DDClUXVEqlY1U8W+Ti27YOAP7hLi9qAmqBBaVSRS1uUSvXNZ8pU5RyFhYDHG
 AkaWczAwy2gUt+4KbYoEfe4NZ1WdnXRAO/+bLOigUOzBAgJ0z0IrrvVVkd2UoOfcNABktKVC4N
 O6IBUq5OcPjG1A2q7I2rg72jr5NQEgNcar3PK9Zrq/bT5AuyeT1JKiO9o3xhjA8ectL5fWdcHo
 dKc=
X-SBRS: 2.7
X-MesageID: 15825521
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,362,1580792400"; d="scan'208";a="15825521"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] sched: fix scheduler_disable() with core scheduling
Date: Thu, 9 Apr 2020 10:41:37 +0100
Message-ID: <20200409094137.13836-1-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

In core-scheduling mode, Xen might crash when entering ACPI S5 state.
This happens in sched_slave() during is_idle_unit(next) check because
next->vcpu_list is stale and points to an already freed memory.

This situation happens shortly after scheduler_disable() is called if
some CPU is still inside sched_slave() softirq. Current logic simply
returns prev->next_task from sched_wait_rendezvous_in() which causes
the described crash because next_task->vcpu_list has become invalid.

Fix the crash by returning NULL from sched_wait_rendezvous_in() in
the case when scheduler_disable() has been called.

Signed-off-by: Sergey Dyasli <sergey.dyasli@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
CC: Dario Faggioli <dfaggioli@suse.com>
CC: George Dunlap <george.dunlap@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>
---
 xen/common/sched/core.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 626861a3fe..d4a6489929 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2484,19 +2484,15 @@ static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev,
 
         *lock = pcpu_schedule_lock_irq(cpu);
 
-        if ( unlikely(!scheduler_active) )
-        {
-            ASSERT(is_idle_unit(prev));
-            atomic_set(&prev->next_task->rendezvous_out_cnt, 0);
-            prev->rendezvous_in_cnt = 0;
-        }
-
         /*
          * Check for scheduling resource switched. This happens when we are
          * moved away from our cpupool and cpus are subject of the idle
          * scheduler now.
+         *
+         * This is also a bail out case when scheduler_disable() has been
+         * called.
          */
-        if ( unlikely(sr != get_sched_res(cpu)) )
+        if ( unlikely(sr != get_sched_res(cpu) || !scheduler_active) )
         {
             ASSERT(is_idle_unit(prev));
             atomic_set(&prev->next_task->rendezvous_out_cnt, 0);
-- 
2.17.1


