Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB602650BC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:26:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT9K-0005Is-Ag; Thu, 10 Sep 2020 20:26:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT6I-0004JK-U0
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:23:22 +0000
X-Inumbo-ID: d5b9db3b-c25d-4e40-8632-104471869275
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5b9db3b-c25d-4e40-8632-104471869275;
 Thu, 10 Sep 2020 20:22:44 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a22so9837220ljp.13
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=6Ks15DjS0DDqzRnab3kDGJifccvvIXZZROzSdME2Ru0=;
 b=pQLnLxd6HijBw6T2/4r0fqA8xBIRT9t6cVrxHnIV9gMVt17VKbu3Zsxxka27qSmdBw
 5HrMqzO1V6mNh7eJGjj+GwUnNpFx/I73iJTzIzUblVtY4Y91FBhdhPwn8f/fXBmOrDPP
 o4B3x9w/h5t8TuhvaMEDr3W7xLqVRDnfTd9hOpq+yZv9dOL/i7Fw6C+TEOUsjgMJ/Kvw
 0nprpaQK3NwC7T7uIqIjfNPECDsKDr45zdgFvnpOLYIk89jbwJx+lE8PBUz75g2ZgN1D
 +wX0DeApF+jna8PMT0c7SRd34WEeuhcvDyuIWZn2o6EwV+mtOrCrkj91XQEIH5PLLKSw
 xe0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=6Ks15DjS0DDqzRnab3kDGJifccvvIXZZROzSdME2Ru0=;
 b=IkxSv5HVJdMBbwUdgI0YpOAZ3kMX2clrnOgy8HMetdDElMuhc7vQ8EeH7M7U98Ajvn
 Oyp4rZ/b5zEsgf094gfBDqeYUuZX9YOad5yTJJRD0Zpq3zq+AjS4hlvV3a9iHmW1gjyz
 IfPHUly1cu8HjGKTEs04FfEoExJ2+l7I0glNMb94co3F3/n+NDf2vs4dFgZ4UY5o7e8O
 Vl29WhDiQV0AZTkCcSu/CJWKbVHnoR82vJRe/0NWNona62nlOPjD96hPwrglfzKzFZ3s
 DLHiG4dfmdAb9OxUpjvZJQ6vIt4fpgGpIDWRwCPUAb1bUF1fzarJl5ko9NKRDR4BMLGZ
 G7CA==
X-Gm-Message-State: AOAM533idwie7/50DSPypeh9rhSUyUtDotyrv6JT9qeNJw7EubtbCH3D
 +HXhJ6idC06aBymIqPQ9UbbZw5iFkZOBiA==
X-Google-Smtp-Source: ABdhPJz9AmufEaILMskmWAfw+1Yby0aOeEljv9qOECw1anxy1bJsicUW6PMmbqgvYlENXsnfIcElZg==
X-Received: by 2002:a2e:a16e:: with SMTP id u14mr5889108ljl.464.1599769362623; 
 Thu, 10 Sep 2020 13:22:42 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:41 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Paul Durrant <paul@xen.org>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 11/16] xen/ioreq: Introduce hvm_domain_has_ioreq_server()
Date: Thu, 10 Sep 2020 23:22:05 +0300
Message-Id: <1599769330-17656-12-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
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

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch introduces a helper the main purpose of which is to check
if a domain is using IOREQ server(s).

On Arm the benefit is to avoid calling handle_hvm_io_completion()
(which implies iterating over all possible IOREQ servers anyway)
on every return in leave_hypervisor_to_guest() if there is no active
servers for the particular domain.

This involves adding an extra per-domain variable to store the count
of servers in use.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - new patch
---
---
 xen/arch/arm/traps.c             | 15 +++++++++------
 xen/common/ioreq.c               |  9 ++++++++-
 xen/include/asm-arm/domain.h     |  1 +
 xen/include/asm-x86/hvm/domain.h |  1 +
 xen/include/xen/ioreq.h          |  5 +++++
 5 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 121942c..6b37ae1 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2263,14 +2263,17 @@ static bool check_for_vcpu_work(void)
     struct vcpu *v = current;
 
 #ifdef CONFIG_IOREQ_SERVER
-    bool handled;
+    if ( hvm_domain_has_ioreq_server(v->domain) )
+    {
+        bool handled;
 
-    local_irq_enable();
-    handled = handle_hvm_io_completion(v);
-    local_irq_disable();
+        local_irq_enable();
+        handled = handle_hvm_io_completion(v);
+        local_irq_disable();
 
-    if ( !handled )
-        return true;
+        if ( !handled )
+            return true;
+    }
 #endif
 
     if ( likely(!v->arch.need_flush_to_ram) )
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index ce12751..4c3a835 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -38,9 +38,15 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
                              struct hvm_ioreq_server *s)
 {
     ASSERT(id < MAX_NR_IOREQ_SERVERS);
-    ASSERT(!s || !d->arch.hvm.ioreq_server.server[id]);
+    ASSERT((!s && d->arch.hvm.ioreq_server.server[id]) ||
+           (s && !d->arch.hvm.ioreq_server.server[id]));
 
     d->arch.hvm.ioreq_server.server[id] = s;
+
+    if ( s )
+        d->arch.hvm.ioreq_server.nr_servers ++;
+    else
+        d->arch.hvm.ioreq_server.nr_servers --;
 }
 
 /*
@@ -1395,6 +1401,7 @@ unsigned int hvm_broadcast_ioreq(ioreq_t *p, bool buffered)
 void hvm_ioreq_init(struct domain *d)
 {
     spin_lock_init(&d->arch.hvm.ioreq_server.lock);
+    d->arch.hvm.ioreq_server.nr_servers = 0;
 
     arch_hvm_ioreq_init(d);
 }
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index d1c48d7..0c0506a 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -31,6 +31,7 @@ struct hvm_domain
     struct {
         spinlock_t              lock;
         struct hvm_ioreq_server *server[MAX_NR_IOREQ_SERVERS];
+        unsigned int            nr_servers;
     } ioreq_server;
 };
 
diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
index 765f35c..79e0afb 100644
--- a/xen/include/asm-x86/hvm/domain.h
+++ b/xen/include/asm-x86/hvm/domain.h
@@ -77,6 +77,7 @@ struct hvm_domain {
     struct {
         spinlock_t              lock;
         struct hvm_ioreq_server *server[MAX_NR_IOREQ_SERVERS];
+        unsigned int            nr_servers;
     } ioreq_server;
 
     /* Cached CF8 for guest PCI config cycles */
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 102f7e8..25ce4c2 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -57,6 +57,11 @@ struct hvm_ioreq_server {
     uint8_t                bufioreq_handling;
 };
 
+static inline bool hvm_domain_has_ioreq_server(const struct domain *d)
+{
+    return (d->arch.hvm.ioreq_server.nr_servers > 0);
+}
+
 #define GET_IOREQ_SERVER(d, id) \
     (d)->arch.hvm.ioreq_server.server[id]
 
-- 
2.7.4


