Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E43A667FA
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 05:01:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.918493.1323147 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuO8R-0007RT-EE; Tue, 18 Mar 2025 04:00:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 918493.1323147; Tue, 18 Mar 2025 04:00:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuO8R-0007Pu-Av; Tue, 18 Mar 2025 04:00:59 +0000
Received: by outflank-mailman (input) for mailman id 918493;
 Tue, 18 Mar 2025 04:00:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sAjx=WF=boeing.com=anderson.choi@srs-se1.protection.inumbo.net>)
 id 1tuO8Q-0007Po-29
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 04:00:58 +0000
Received: from ewa-mbsout-01.mbs.boeing.net (ewa-mbsout-01.mbs.boeing.net
 [130.76.20.194]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 956b803a-03ad-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 05:00:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id
 52I40oC4030284; Mon, 17 Mar 2025 21:00:51 -0700
Received: from ewa-av-01.mbs.boeing.net (ewa-av-01.mbs.boeing.net
 [137.137.51.75])
 by ewa-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with
 ESMTPS id 52I40dAF030183
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Mar 2025 21:00:39 -0700
Received: from localhost (localhost [127.0.0.1])
 by ewa-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id
 52I40cuL060834; Mon, 17 Mar 2025 21:00:38 -0700
Received: from A6509144.boeing.com ([144.112.84.220])
 by ewa-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id
 52I40PgY059836; Mon, 17 Mar 2025 21:00:26 -0700
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
X-Inumbo-ID: 956b803a-03ad-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1742270451;
	bh=4L6rbM9kK/J7CXbTx1oIa/6hfpi4xWIOYGiXWXnEr+U=;
	h=From:To:Cc:Subject:Date:From;
	b=CKvYIrUTzS3Mfw728QSafDQ5b5WzQM6gFornrZLcRRA1gLfVj9Vxd6ugfit/8uSbS
	 +Ru+g4AHVCXmffXmeRAfDu1WxCr8Wq1HqYg4fj68VcXwMEZEXkpLNsG6dJq3BDhnn3
	 NgXiJ+JuwJ+eu3fDr8QR0dgYlDeDisdp+//1G87zX+wM5eCLffNh7y6V915W5NALqq
	 3c0YLUIMXs3N8zlB0EusA4AdbLZHXyvLnr6scrqK/cbV8CGXAYoQn1l9S3fFaZJhSW
	 UUcY9LxKobW5hsuzgYWx/SYgzklyzf8GGpe4kDP3aGdSh6LnSHURA5/J2zXR60jOHE
	 DdBzgmSek6HvQ==
From: Anderson Choi <anderson.choi@boeing.com>
To: xen-devel@lists.xenproject.org
Cc: nathan.studer@dornerworks.com, stewart@stew.dk,
        matthew.l.weber3@boeing.com, joshua.c.whitehead@boeing.com,
        andrew.cooper3@citrix.com, jgross@suse.com,
        Anderson Choi <anderson.choi@boeing.com>
Subject: [PATCH] xen/sched: call xfree() after local IRQ is enabled
Date: Tue, 18 Mar 2025 13:00:23 +0900
Message-ID: <20250318040023.4998-1-anderson.choi@boeing.com>
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
 xen/common/sched/arinc653.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
index 0a3733c04e90..b95492e1d96f 100644
--- a/xen/common/sched/arinc653.c
+++ b/xen/common/sched/arinc653.c
@@ -463,10 +463,11 @@ a653sched_free_udata(const struct scheduler *ops, void *priv)
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


