Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7391AC133
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 14:27:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP3bq-0003TU-JU; Thu, 16 Apr 2020 12:27:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fNsn=6A=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jP3bp-0003TJ-5P
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 12:27:09 +0000
X-Inumbo-ID: 93aa684c-7fdd-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93aa684c-7fdd-11ea-b58d-bc764e2007e4;
 Thu, 16 Apr 2020 12:27:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0D00BAC6D;
 Thu, 16 Apr 2020 12:27:01 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH] mini-os: allow 4096 event channels for 64-bit mini-os
Date: Thu, 16 Apr 2020 14:27:00 +0200
Message-Id: <20200416122700.22620-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
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
Cc: Juergen Gross <jgross@suse.com>, samuel.thibault@ens-lyon.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Limiting the number of event channels to 1024 is fine for 32-bit
builds, but not for 64-bit ones. This might be a problem when using
Xenstore-stubdom as the number of domains which can be supported is
then limited to a little bit more than 1000.

So raise the number of event channels to 4096 in 64-bit builds.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 events.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/events.c b/events.c
index 342aead..cdae90f 100644
--- a/events.c
+++ b/events.c
@@ -23,7 +23,7 @@
 #include <mini-os/lib.h>
 #include <xen/xsm/flask_op.h>
 
-#define NR_EVS 1024
+#define NR_EVS EVTCHN_2L_NR_CHANNELS
 
 /* this represents a event handler. Chaining or sharing is not allowed */
 typedef struct _ev_action_t {
-- 
2.16.4


