Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBED2C826C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:44:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40924.73972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgfJ-0003er-Pb; Mon, 30 Nov 2020 10:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40924.73972; Mon, 30 Nov 2020 10:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgfJ-0003eK-Ju; Mon, 30 Nov 2020 10:44:17 +0000
Received: by outflank-mailman (input) for mailman id 40924;
 Mon, 30 Nov 2020 10:44:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgUn-0000Uu-Dz
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:33:25 +0000
Received: from mail-lj1-x22c.google.com (unknown [2a00:1450:4864:20::22c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 553845a9-04a6-42a1-bbaf-90d801202ba7;
 Mon, 30 Nov 2020 10:32:17 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id s9so16995139ljo.11
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:17 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:15 -0800 (PST)
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
X-Inumbo-ID: 553845a9-04a6-42a1-bbaf-90d801202ba7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kU8hXo0MhUwaJAOfCWP3cQmYgBrqrc7iZRLWg/7AJHY=;
        b=H4WDeUB/57LzDiHlv6dARF/vp22ivBig+v9X086y02k3BHN3mN0dh9PeTop8n5QXKF
         cxkGhqC99WfEJ99PDxwkWG5woj6hArK3AXI2CkKJ6WpEUA3hbmLzNqnd5VNI8CXezn/h
         Ic4P1axxOApt25piQe+p2rC5dSXtTnNggsi7AO9LlclK5q6QzqBrirRbyZs5bS5sp4x9
         iYDQWya4aKnvhO3hwu4e5xFiuXZEP79ChJfj0K+IVsaOz62D8NgxbkCGZFHDYLWPUDm/
         pyGeBcnLiG0tFkm5oRzUFxFGeOa+HIOyTCdpBtOPKcgQgsJ7RI6BqBxhKIQAvkeTh6YA
         X8ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kU8hXo0MhUwaJAOfCWP3cQmYgBrqrc7iZRLWg/7AJHY=;
        b=eLibJvDBL0/+WhxtJYEg2/pttSmXIx6y2xbY8HrUlpzxdKdJucbMvQabDBN+QJjyLS
         O/gNSEnipoJKPkIafwWAifjOaWQXPY0RGHZV7qcOXNLhC8dmP1SqL88NjiOl9EPbp6uN
         fgWK7j9Wvs/fZZWdiGMpYeSkaEY8cNouqgWPQQy0qbDKHYPYTs8M32Ge4JXmoUnIGyb+
         hZbjAJCLISdm7zno2+VNX2Nuaqvuz4TQJIA18nb45prw7L+Mr1jMhlMrohUuvIZgHqxq
         2T7E9f+bhxCy7C7OqNsfEnqw1ub23BC7ALnHz5FNEj7QZWTn5mXwr+0mPBi9Q8yawWhk
         GW7g==
X-Gm-Message-State: AOAM533ry5IvGkZNDpIynb5MT5+U/lALAlLixo2+hGFlGp/FVSTelYoI
	6HU7oERpuB+bYQKkij0/8qzKxpw80oNHIQ==
X-Google-Smtp-Source: ABdhPJwMpyUcazry+2thIFAZp4dzdk2dlfVeiFZSM93RQu/mrnP+Z/vMPEdKvWqrRLEmtl6WU6tNhA==
X-Received: by 2002:a2e:985:: with SMTP id 127mr10145900ljj.268.1606732336342;
        Mon, 30 Nov 2020 02:32:16 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Julien Grall <julien.grall@arm.com>
Subject: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
Date: Mon, 30 Nov 2020 12:31:32 +0200
Message-Id: <1606732298-22107-18-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch introduces a helper the main purpose of which is to check
if a domain is using IOREQ server(s).

On Arm the current benefit is to avoid calling vcpu_ioreq_handle_completion()
(which implies iterating over all possible IOREQ servers anyway)
on every return in leave_hypervisor_to_guest() if there is no active
servers for the particular domain.
Also this helper will be used by one of the subsequent patches on Arm.

This involves adding an extra per-domain variable to store the count
of servers in use.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
CC: Julien Grall <julien.grall@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch

Changes V1 -> V2:
   - update patch description
   - guard helper with CONFIG_IOREQ_SERVER
   - remove "hvm" prefix
   - modify helper to just return d->arch.hvm.ioreq_server.nr_servers
   - put suitable ASSERT()s
   - use ASSERT(d->ioreq_server.server[id] ? !s : !!s) in set_ioreq_server()
   - remove d->ioreq_server.nr_servers = 0 from hvm_ioreq_init()

Changes V2 -> V3:
   - update patch description
   - remove ASSERT()s from the helper, add a comment
   - use #ifdef CONFIG_IOREQ_SERVER inside function body
   - use new ASSERT() construction in set_ioreq_server()
---
---
 xen/arch/arm/traps.c    | 15 +++++++++------
 xen/common/ioreq.c      |  7 ++++++-
 xen/include/xen/ioreq.h | 14 ++++++++++++++
 xen/include/xen/sched.h |  1 +
 4 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 4cef43e..b6077d2 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2262,14 +2262,17 @@ static bool check_for_vcpu_work(void)
     struct vcpu *v = current;
 
 #ifdef CONFIG_IOREQ_SERVER
-    bool handled;
+    if ( domain_has_ioreq_server(v->domain) )
+    {
+        bool handled;
 
-    local_irq_enable();
-    handled = vcpu_ioreq_handle_completion(v);
-    local_irq_disable();
+        local_irq_enable();
+        handled = vcpu_ioreq_handle_completion(v);
+        local_irq_disable();
 
-    if ( !handled )
-        return true;
+        if ( !handled )
+            return true;
+    }
 #endif
 
     if ( likely(!v->arch.need_flush_to_ram) )
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 4855dd8..f35dcf9 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -39,9 +39,14 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
                              struct ioreq_server *s)
 {
     ASSERT(id < MAX_NR_IOREQ_SERVERS);
-    ASSERT(!s || !d->ioreq_server.server[id]);
+    ASSERT(!s ^ !d->ioreq_server.server[id]);
 
     d->ioreq_server.server[id] = s;
+
+    if ( s )
+        d->ioreq_server.nr_servers++;
+    else
+        d->ioreq_server.nr_servers--;
 }
 
 #define GET_IOREQ_SERVER(d, id) \
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 02ff998..2289e79 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -55,6 +55,20 @@ struct ioreq_server {
     uint8_t                bufioreq_handling;
 };
 
+/*
+ * This should only be used when d == current->domain and it's not paused,
+ * or when they're distinct and d is paused. Otherwise the result is
+ * stale before the caller can inspect it.
+ */
+static inline bool domain_has_ioreq_server(const struct domain *d)
+{
+#ifdef CONFIG_IOREQ_SERVER
+    return d->ioreq_server.nr_servers;
+#else
+    return false;
+#endif
+}
+
 static inline paddr_t ioreq_mmio_first_byte(const ioreq_t *p)
 {
     return unlikely(p->df) ?
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 8269f84..2277995 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -550,6 +550,7 @@ struct domain
     struct {
         spinlock_t              lock;
         struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
+        unsigned int            nr_servers;
     } ioreq_server;
 #endif
 };
-- 
2.7.4


