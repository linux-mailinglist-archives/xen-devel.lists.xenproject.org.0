Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C44A66BD1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 08:35:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918541.1323186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuRTe-00069l-GN; Tue, 18 Mar 2025 07:35:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918541.1323186; Tue, 18 Mar 2025 07:35:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuRTe-00067i-D6; Tue, 18 Mar 2025 07:35:06 +0000
Received: by outflank-mailman (input) for mailman id 918541;
 Tue, 18 Mar 2025 07:35:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAjx=WF=boeing.com=anderson.choi@srs-se1.protection.inumbo.net>)
 id 1tuRTd-00067c-L7
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 07:35:05 +0000
Received: from phx-mbsout-02.mbs.boeing.net (phx-mbsout-02.mbs.boeing.net
 [130.76.184.179]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fa125d6-03cb-11f0-9aba-95dc52dad729;
 Tue, 18 Mar 2025 08:35:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by phx-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 52I7YxvJ022091; Tue, 18 Mar 2025 00:34:59 -0700
Received: from ewa-av-01.mbs.boeing.net (ewa-av-01.mbs.boeing.net
 [137.137.51.75])
 by phx-mbsout-02.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 52I7Yvcn022074
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Mar 2025 00:34:57 -0700
Received: from localhost (localhost [127.0.0.1])
 by ewa-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 52I7YuFT048002; Tue, 18 Mar 2025 00:34:56 -0700
Received: from A6509144.boeing.com ([144.112.84.220])
 by ewa-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id
 52I7YlGP047876; Tue, 18 Mar 2025 00:34:48 -0700
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
X-Inumbo-ID: 7fa125d6-03cb-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1742283299;
	bh=bDrhRn09U3jy6rzOW2OFF3V//D8wiUf64tAZiFWD9FQ=;
	h=From:To:Cc:Subject:Date:From;
	b=dOfBUq3Ve7rynlUVemQs77A6oUVMW9HqUvaFWAGHbuJ3iKYg+YN2CgHUtRBQR0z4I
	 AgqRTZ43QL40BBFPvA5g3Q5h/t9HNoOUPa7qQtGMw22dCJQx1V7cBaybOLSjR28SAQ
	 eW/ZS5rmvD/vaZfAEHL26YgMA7iHRjF2GU+bOGBugEp0jgZZABgLYZzUDJ/8mkaEdi
	 R4doS7HbeLVGKRNzo6SyPJ9GlJe+OhWCxa78pMhJuUaPHARG/7HBP0ANtOWBrKEyZq
	 dL4pxH2w21MuvwNgtT51XJdSPFmW2e7+OFk5C9nfNF/fKPhQ+G6M2rYleKu0mBJdhG
	 +DuapS0j5IoMw==
From: Anderson Choi <anderson.choi@boeing.com>
To: xen-devel@lists.xenproject.org
Cc: nathan.studer@dornerworks.com, stewart@stew.dk,
        matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
        andrew.cooper3@citrix.com, jgross@suse.com, jbeulich@suse.com,
        Anderson Choi <anderson.choi@boeing.com>
Subject: [PATCH v2] xen/arinc653: call xfree() with local IRQ enabled
Date: Tue, 18 Mar 2025 16:34:15 +0900
Message-ID: <20250318073415.6652-1-anderson.choi@boeing.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00

xen panic is observed with the following configuration.

1. Debug xen build (CONFIG_DEBUG=y)
2. dom1 of an ARINC653 domain
3. shutdown dom1 with xl command

$ xl shutdown <domain_name>

(XEN) ****************************************
(XEN) Panic on CPU 2:
(XEN) Assertion '!in_irq() && (local_irq_is_enabled() ||
num_online_cpus() <= 1)' failed at common/xmalloc_tlsf.c:714
(XEN) ****************************************

panic was triggered since xfree() was called with local IRQ disabled and
therefore assertion failed.

Fix this by calling xfree() after local IRQ is enabled.

Fixes: 19049f8d796a sched: fix locking in a653sched_free_vdata()
Signed-off-by: Anderson Choi <anderson.choi@boeing.com>

---
Changes:
v1 -> v2
  * changed the title to show clearly which scheduler is modified
---
 xen/common/sched/arinc653.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index a82c0d7314a1..a297e64affe6 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -457,10 +457,11 @@ a653sched_free_udata(const struct scheduler *ops, void *priv)
     if ( !is_idle_unit(av->unit) )
         list_del(&av->list);
 
-    xfree(av);
     update_schedule_units(ops);
 
     spin_unlock_irqrestore(&sched_priv->lock, flags);
+
+    xfree(av);
 }
 
 /**
-- 
2.34.1


