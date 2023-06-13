Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FB72E851
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 18:22:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548278.856149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96mx-0003VU-M0; Tue, 13 Jun 2023 16:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548278.856149; Tue, 13 Jun 2023 16:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q96mx-0003Si-J6; Tue, 13 Jun 2023 16:22:35 +0000
Received: by outflank-mailman (input) for mailman id 548278;
 Tue, 13 Jun 2023 16:22:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MgtI=CB=citrix.com=prvs=52172834f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q96mw-0003Sa-DF
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 16:22:34 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ebcb040-0a06-11ee-b232-6b7b168915f2;
 Tue, 13 Jun 2023 18:22:32 +0200 (CEST)
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
X-Inumbo-ID: 7ebcb040-0a06-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686673352;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wI7Ox+ZcvL31pWek3khs75KPYrJtX+VL5V8BRP+W/vc=;
  b=hJ7Vos5V9MYurOekWLzMM4+4gakrNFTVBFt81Tc9EQfxzo1ap5Dw+itu
   Z2SmyTA4lCH75bWVX8Jb1eYcnAdLIPOp98zok/C6HUqS4wCZGVStkvdtA
   8pqAymacmfTzrW1sD0XIweUHdDsOaKKFuEnNS5vZRu5RbsHmgREFkG5Cz
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 113061536
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:j6rQGa5OI1RWnWsDc6c7RQxRtN7HchMFZxGqfqrLsTDasY5as4F+v
 mIbDWuPPfrYN2T3ed1+PYuwoEhS6J6DyoBlQVZkqyo8Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4S5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mp
 fUBEytTRCu/hdmN572/FPFIn8oYBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx/D/
 jyfoj+nav0cHNiRyn3bojWKuurOnH/yG6I8CJyF5vE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq16bO8vT60fy8PIgcqZzIATAYDy8nupsc0lB2nZuhkFKm5n9jkAwbay
 jqBrDU9r7gLhMtN3KK+lXjNjiiwvJHPQkgw7x/OQ2O+xgpjYciuYInA1LTAxa8edsDDFADH5
 SVa3ZHEt4jiEK1higTdSfw2B++D3MqHCwb7jloxB704+Q+ErivLkZ9r3N1uGKt4Gp9aKWG3O
 hOL5l85CIx7ZyXzM/IuC26lI4FzlPW7S4y4PhzBRoAWCqWdYjNr682HiaS4+2n22HYhnqgkU
 XtwWZb9VC1KYUiLIdffegv87VPI7npkrY8rbcqnpylLKJLHDJJvdZ8LMUGVcscy576erQPe/
 r53bpXalUgODLKlM3WHqOb/yGzmy1BhXfgaTOQNL4a+zvdOQjl9W5c9P5t8E2Cao0ilvriRp
 SzsMqOp4FH+mWfGOW23hoNLMdvSsWJEhStjZ0QEZA/4s0XPlK7ztM/zgbNrJ+h4nAGipNYoJ
 8Q4lzKoW6wfEG6bqmpMMPEQbuVKLXyWuO5HBAL9CBBXQnKqb1ChFgPMFuc3yBQzMw==
IronPort-HdrOrdr: A9a23:Smvyc64zB332mUsWHAPXwBrXdLJyesId70hD6qkXc20xTiX4rb
 HNoB1/73TJYVkqOU3Ip+rwRJVoLUmwyXZaibNhR4tKdjOWwVdBFelZnPDfK9eJIVyCygcl79
 YZT0EcMqySMbEZt6bHCVKDYrAdKbC8mcjDuQ659RlQpC5RGt5dBmxCZjpzfHcYeOGGbaBJcK
 Z1aaJ81l2dRUg=
X-Talos-CUID: =?us-ascii?q?9a23=3AMRLog2rq2CfhJl57ttMkRZvmUZAsa0bGkl3rH02?=
 =?us-ascii?q?DMkFmTOONbUaew4oxxg=3D=3D?=
X-Talos-MUID: 9a23:1kZfLQv9EJDAuNUdos2ngD9hc5k4pIKSDUEMzZxFm+eYFBFgNGLI
X-IronPort-AV: E=Sophos;i="6.00,240,1681185600"; 
   d="scan'208";a="113061536"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH] xen/evtchn: Purge ERROR_EXIT{,_DOM}()
Date: Tue, 13 Jun 2023 17:22:20 +0100
Message-ID: <20230613162220.3052184-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These are disliked specifically by MISRA, but they also interfere with code
legibility by hiding control flow.  Expand and drop them.

 * Rearrange the order of actions to write into rc, then render rc in the
   gdprintk().
 * Drop redundant "rc = rc" assignments
 * Switch to using %pd for rendering domains

No functional change.  Resulting binary is identical.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/common/event_channel.c | 79 +++++++++++++++++++++++++-------------
 1 file changed, 52 insertions(+), 27 deletions(-)

diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
index f5e0b12d1520..a7a004a08429 100644
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -36,23 +36,6 @@
 #include <asm/guest.h>
 #endif
 
-#define ERROR_EXIT(_errno)                                          \
-    do {                                                            \
-        gdprintk(XENLOG_WARNING,                                    \
-                "EVTCHNOP failure: error %d\n",                     \
-                (_errno));                                          \
-        rc = (_errno);                                              \
-        goto out;                                                   \
-    } while ( 0 )
-#define ERROR_EXIT_DOM(_errno, _dom)                                \
-    do {                                                            \
-        gdprintk(XENLOG_WARNING,                                    \
-                "EVTCHNOP failure: domain %d, error %d\n",          \
-                (_dom)->domain_id, (_errno));                       \
-        rc = (_errno);                                              \
-        goto out;                                                   \
-    } while ( 0 )
-
 #define consumer_is_xen(e) (!!(e)->xen_consumer)
 
 /*
@@ -336,7 +319,11 @@ int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
 
     port = rc = evtchn_get_port(d, port);
     if ( rc < 0 )
-        ERROR_EXIT(rc);
+    {
+        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
+        goto out;
+    }
+
     rc = 0;
 
     chn = evtchn_from_port(d, port);
@@ -412,17 +399,30 @@ int evtchn_bind_interdomain(evtchn_bind_interdomain_t *bind, struct domain *ld,
 
     lport = rc = evtchn_get_port(ld, lport);
     if ( rc < 0 )
-        ERROR_EXIT(rc);
+    {
+        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
+        goto out;
+    }
+
     rc = 0;
 
     lchn = evtchn_from_port(ld, lport);
 
     rchn = _evtchn_from_port(rd, rport);
     if ( !rchn )
-        ERROR_EXIT_DOM(-EINVAL, rd);
+    {
+        rc = -EINVAL;
+        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: %pd, error %d\n", rd, rc);
+        goto out;
+    }
+
     if ( (rchn->state != ECS_UNBOUND) ||
          (rchn->u.unbound.remote_domid != ld->domain_id) )
-        ERROR_EXIT_DOM(-EINVAL, rd);
+    {
+        rc = -EINVAL;
+        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: %pd, error %d\n", rd, rc);
+        goto out;
+    }
 
     rc = xsm_evtchn_interdomain(XSM_HOOK, ld, lchn, rd, rchn);
     if ( rc )
@@ -487,11 +487,19 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
     write_lock(&d->event_lock);
 
     if ( read_atomic(&v->virq_to_evtchn[virq]) )
-        ERROR_EXIT(-EEXIST);
+    {
+        rc = -EEXIST;
+        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
+        goto out;
+    }
 
     port = rc = evtchn_get_port(d, port);
     if ( rc < 0 )
-        ERROR_EXIT(rc);
+    {
+        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
+        goto out;
+    }
+
     rc = 0;
 
     chn = evtchn_from_port(d, port);
@@ -535,7 +543,11 @@ static int evtchn_bind_ipi(evtchn_bind_ipi_t *bind)
     write_lock(&d->event_lock);
 
     if ( (port = get_free_port(d)) < 0 )
-        ERROR_EXIT(port);
+    {
+        rc = port;
+        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
+        goto out;
+    }
 
     chn = evtchn_from_port(d, port);
 
@@ -599,16 +611,29 @@ static int evtchn_bind_pirq(evtchn_bind_pirq_t *bind)
     write_lock(&d->event_lock);
 
     if ( pirq_to_evtchn(d, pirq) != 0 )
-        ERROR_EXIT(-EEXIST);
+    {
+        rc = -EEXIST;
+        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
+        goto out;
+    }
 
     if ( (port = get_free_port(d)) < 0 )
-        ERROR_EXIT(port);
+    {
+        rc = port;
+        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
+        goto out;
+    }
 
     chn = evtchn_from_port(d, port);
 
     info = pirq_get_info(d, pirq);
     if ( !info )
-        ERROR_EXIT(-ENOMEM);
+    {
+        rc = -ENOMEM;
+        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
+        goto out;
+    }
+
     info->evtchn = port;
     rc = (!is_hvm_domain(d)
           ? pirq_guest_bind(v, info,

base-commit: f29363922c1b41310c3d87fd9a861ffa9db9204a
-- 
2.30.2


