Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84628F739
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7618.20127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VH-0007OZ-7C; Thu, 15 Oct 2020 16:53:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7618.20127; Thu, 15 Oct 2020 16:53:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6VG-0007Lc-Iu; Thu, 15 Oct 2020 16:53:22 +0000
Received: by outflank-mailman (input) for mailman id 7618;
 Thu, 15 Oct 2020 16:53:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6OS-0004yr-7c
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:20 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32af136a-5429-4b00-9e08-60c144cc0ab3;
 Thu, 15 Oct 2020 16:45:12 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j30so4384033lfp.4
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:11 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:09 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6OS-0004yr-7c
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:46:20 +0000
X-Inumbo-ID: 32af136a-5429-4b00-9e08-60c144cc0ab3
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 32af136a-5429-4b00-9e08-60c144cc0ab3;
	Thu, 15 Oct 2020 16:45:12 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j30so4384033lfp.4
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=zwTLjXhVFQZPY98bDXqDnVXlV5nN/zRcFtlAgAIIKtA=;
        b=lrST4bt64gs4PNz3UdY5vzi3xN2250k4Zd38/7wosQDzG03cHDGXRkLEDBmTeiyRxt
         FrRApvPNjs9JWltwznEGxCZYSdEiTXQ/I1kijXKVHPEIIQVvOyFPeayMMa6QqwoIgRDO
         1Nj7CwAyQ3npadYy6JQiUHwh4xCynnUK+i13pyr9/c9+ms4oDHWa1Gk1PwgzYZDLNTES
         cKuLeCcb8NHUR5VZ7SCQlMACJ65DlDs+drUw31zdxlZDY92CJkeYcCLoODKKdirD0Xnd
         ktsrDym6ha0aADhF2FdOs5XCLKiRAli200vSwDOX6RIwcnBllyH+nUZMkjQ2hjAj0PjS
         ySWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zwTLjXhVFQZPY98bDXqDnVXlV5nN/zRcFtlAgAIIKtA=;
        b=anyWYJGhqJBwqg15O2wDlAT8c/BZcuhV2wziqUkiLc0cboE6iOIJ+zxgUwyDsUo9Qm
         WsLAcvLqDl3DgBNnf9v4PfSRNl2Dvwe6AyX8CmkS602JPSE8gvTGmCXg5iVs1znRuYrD
         54HXGOszZG5xzun7Xtd+bkejvYHjDrGiMH1n0WENw5hxeU7t5Us6SWJKlRSq0zcYfLog
         lqBusVMp+/MDdOxJdatVnX1nnABZggcu7+ZtbO0tSHqsFeKY1KfPrL1YbA2i4FffofM6
         tvESRlDyOzsC3QiutNCy4e1MvTvb0RcSimvgI8Twpzg1ems9HVQLPjhx9ifE6Zc9UzjV
         uJ0g==
X-Gm-Message-State: AOAM533KE4+UARVkHh20gBLeqrjC0AdCApcPFLUQdLuhwltlFXF8gLbT
	2U2lhoDOdJrT9NnzgG+b8NwDjqdKv6sn2w==
X-Google-Smtp-Source: ABdhPJxqqHSRzjcRFUYAOzYiBglt3Ho3KYEWGxvHa5/nJyWPqDD9K40O/lvReItlJHMTfAJak3MEdg==
X-Received: by 2002:ac2:592d:: with SMTP id v13mr1271605lfi.355.1602780310299;
        Thu, 15 Oct 2020 09:45:10 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:09 -0700 (PDT)
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
Subject: [PATCH V2 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
Date: Thu, 15 Oct 2020 19:44:28 +0300
Message-Id: <1602780274-29141-18-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This patch introduces a helper the main purpose of which is to check
if a domain is using IOREQ server(s).

On Arm the current benefit is to avoid calling handle_io_completion()
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
---
 xen/arch/arm/traps.c    | 15 +++++++++------
 xen/common/ioreq.c      |  7 ++++++-
 xen/include/xen/ioreq.h | 14 ++++++++++++++
 xen/include/xen/sched.h |  1 +
 4 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 507c095..a8f5fdf 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2261,14 +2261,17 @@ static bool check_for_vcpu_work(void)
     struct vcpu *v = current;
 
 #ifdef CONFIG_IOREQ_SERVER
-    bool handled;
+    if ( domain_has_ioreq_server(v->domain) )
+    {
+        bool handled;
 
-    local_irq_enable();
-    handled = handle_io_completion(v);
-    local_irq_disable();
+        local_irq_enable();
+        handled = handle_io_completion(v);
+        local_irq_disable();
 
-    if ( !handled )
-        return true;
+        if ( !handled )
+            return true;
+    }
 #endif
 
     if ( likely(!v->arch.need_flush_to_ram) )
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index bcd4961..a72bc0e 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -39,9 +39,14 @@ static void set_ioreq_server(struct domain *d, unsigned int id,
                              struct ioreq_server *s)
 {
     ASSERT(id < MAX_NR_IOREQ_SERVERS);
-    ASSERT(!s || !d->ioreq_server.server[id]);
+    ASSERT(d->ioreq_server.server[id] ? !s : !!s);
 
     d->ioreq_server.server[id] = s;
+
+    if ( s )
+        d->ioreq_server.nr_servers++;
+    else
+        d->ioreq_server.nr_servers--;
 }
 
 #define GET_IOREQ_SERVER(d, id) \
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index 7b03ab5..0679fef 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -55,6 +55,20 @@ struct ioreq_server {
     uint8_t                bufioreq_handling;
 };
 
+#ifdef CONFIG_IOREQ_SERVER
+static inline bool domain_has_ioreq_server(const struct domain *d)
+{
+    ASSERT((current->domain == d) || atomic_read(&d->pause_count));
+
+    return d->ioreq_server.nr_servers;
+}
+#else
+static inline bool domain_has_ioreq_server(const struct domain *d)
+{
+    return false;
+}
+#endif
+
 struct ioreq_server *get_ioreq_server(const struct domain *d,
                                       unsigned int id);
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index f9ce14c..290cddb 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -553,6 +553,7 @@ struct domain
     struct {
         spinlock_t              lock;
         struct ioreq_server     *server[MAX_NR_IOREQ_SERVERS];
+        unsigned int            nr_servers;
     } ioreq_server;
 #endif
 };
-- 
2.7.4


