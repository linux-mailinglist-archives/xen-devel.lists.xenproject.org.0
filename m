Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5651A3588
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 16:13:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMXvK-0002oV-JM; Thu, 09 Apr 2020 14:12:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Lf15=5Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jMXvI-0002oI-RA
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 14:12:52 +0000
X-Inumbo-ID: 2efc5962-7a6c-11ea-82d6-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2efc5962-7a6c-11ea-82d6-12813bfff9fa;
 Thu, 09 Apr 2020 14:12:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E6972AD72;
 Thu,  9 Apr 2020 14:12:43 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH 1/3] mini-os: fix double free() in netfront
Date: Thu,  9 Apr 2020 16:12:38 +0200
Message-Id: <20200409141240.28876-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200409141240.28876-1-jgross@suse.com>
References: <20200409141240.28876-1-jgross@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, samuel.thibault@ens-lyon.org, wl@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Commit d225f4012d69a19 ("Save/Restore Support: Add suspend/restore
support for netfront") introduced a regression in form of freeing a
netfront device structure twice.

Fix that.

Coverity-ID: 1433637
Fixes: d225f4012d69a19 ("Save/Restore Support: Add suspend/restore support for netfront")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 netfront.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/netfront.c b/netfront.c
index 50b3a57..fe7bb62 100644
--- a/netfront.c
+++ b/netfront.c
@@ -584,8 +584,6 @@ void shutdown_netfront(struct netfront_dev *dev)
     list->refcount--;
     if (list->refcount == 0) {
         _shutdown_netfront(dev);
-        free(dev->nodename);
-        free(dev);
 
         to_del = list;
         if (to_del == dev_list) {
-- 
2.16.4


