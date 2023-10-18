Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35E7CD965
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 12:39:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618483.962165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt3x9-0001Kp-Ek; Wed, 18 Oct 2023 10:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618483.962165; Wed, 18 Oct 2023 10:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt3x9-0001IF-Bq; Wed, 18 Oct 2023 10:39:03 +0000
Received: by outflank-mailman (input) for mailman id 618483;
 Wed, 18 Oct 2023 10:39:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0YN=GA=antioche.eu.org=bouyer@srs-se1.protection.inumbo.net>)
 id 1qt3x7-0001I9-V0
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 10:39:01 +0000
Received: from isis.lip6.fr (isis.lip6.fr [2001:660:3302:283c::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bddff4b-6da2-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 12:39:00 +0200 (CEST)
Received: from asim.lip6.fr (asim.lip6.fr [132.227.86.2])
 by isis.lip6.fr (8.16.1/8.15.2) with ESMTPS id 39IAcwbl000294
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO)
 for <xen-devel@lists.xenproject.org>; Wed, 18 Oct 2023 12:38:58 +0200 (CEST)
Received: from armandeche.soc.lip6.fr (armandeche [132.227.63.133])
 by asim.lip6.fr (8.15.2/8.15.2) with ESMTP id 39IAcwoJ022746
 for <xen-devel@lists.xenproject.org>; Wed, 18 Oct 2023 12:38:58 +0200 (MEST)
Received: by armandeche.soc.lip6.fr (Postfix, from userid 20331)
 id D3B1577C1; Wed, 18 Oct 2023 12:38:57 +0200 (MEST)
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
X-Inumbo-ID: 8bddff4b-6da2-11ee-98d4-6d05b1d4d9a1
Date: Wed, 18 Oct 2023 12:38:57 +0200
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: xen-devel@lists.xenproject.org
Subject: Xen 4.18 pvshim console issue (with patch)
Message-ID: <ZS-1wVlZjdAJyUz6@mail.soc.lip6.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="CpdJGPHSvZKbuyRn"
Content-Disposition: inline
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.4 (isis.lip6.fr [132.227.60.2]); Wed, 18 Oct 2023 12:38:58 +0200 (CEST)
X-Scanned-By: MIMEDefang 3.3 on 132.227.60.2


--CpdJGPHSvZKbuyRn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,
With Xen 4.18, a PV domain running under pvshim doesn't get console input.
This is because the domain id in pvshim isn't 0 (and on x86 max_init_domid is
hardwired to 0), so console_input_domain() will never select that domain
as input.

The attached patch fixes it by translating 0 to the real domain id for
pvshim, but there may be a better way to do this.

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--CpdJGPHSvZKbuyRn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

--- drivers/char/console.c.orig	2023-10-18 12:24:57.221891748 +0200
+++ drivers/char/console.c	2023-10-18 12:30:26.072844802 +0200
@@ -478,14 +478,20 @@
 /* Make sure to rcu_unlock_domain after use */
 struct domain *console_input_domain(void)
 {
+    domid_t domid;
     if ( console_rx == 0 )
             return NULL;
-    return rcu_lock_domain_by_id(console_rx - 1);
+    if (console_rx == 1 && pv_shim)
+        domid = get_initial_domain_id();
+    else
+	domid = console_rx - 1;
+    return rcu_lock_domain_by_id(domid);
 }
 
 static void switch_serial_input(void)
 {
     unsigned int next_rx = console_rx;
+    domid_t domid;
 
     /*
      * Rotate among Xen, dom0 and boot-time created domUs while skipping
@@ -502,7 +508,11 @@
             break;
         }
 
-        d = rcu_lock_domain_by_id(next_rx - 1);
+	if (next_rx == 1 && pv_shim)
+	    domid = get_initial_domain_id();
+	else
+	    domid = next_rx - 1;
+        d = rcu_lock_domain_by_id(domid);
         if ( d )
         {
             rcu_unlock_domain(d);

--CpdJGPHSvZKbuyRn--

