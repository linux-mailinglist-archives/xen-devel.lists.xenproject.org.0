Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1594E1F3FC0
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 17:46:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jigRk-0005GT-EM; Tue, 09 Jun 2020 15:45:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QMey=7W=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jigRi-0005GO-Uk
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 15:45:50 +0000
X-Inumbo-ID: 4add515a-aa68-11ea-b339-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4add515a-aa68-11ea-b339-12813bfff9fa;
 Tue, 09 Jun 2020 15:45:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 83301AC5B;
 Tue,  9 Jun 2020 15:45:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH for-4.14] xen/hypfs: fix loglvl parameter setting
Date: Tue,  9 Jun 2020 17:45:46 +0200
Message-Id: <20200609154546.4531-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Writing the runtime parameters loglvl or guest_loglvl omits setting the
new length of the resulting parameter value.

Reported-by: George Dunlap <george.dunlap@citrix.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
---
 xen/drivers/char/console.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 56e24821b2..861ad53a8f 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -241,14 +241,25 @@ static int _parse_loglvl(const char *s, int *lower, int *upper, char *val)
 
 static int parse_loglvl(const char *s)
 {
-    return _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thresh,
-                         xenlog_val);
+    int ret;
+
+    ret = _parse_loglvl(s, &xenlog_lower_thresh, &xenlog_upper_thresh,
+                        xenlog_val);
+    custom_runtime_set_var(param_2_parfs(parse_loglvl), xenlog_val);
+
+    return ret;
 }
 
 static int parse_guest_loglvl(const char *s)
 {
-    return _parse_loglvl(s, &xenlog_guest_lower_thresh,
-                         &xenlog_guest_upper_thresh, xenlog_guest_val);
+    int ret;
+
+    ret = _parse_loglvl(s, &xenlog_guest_lower_thresh,
+                        &xenlog_guest_upper_thresh, xenlog_guest_val);
+    custom_runtime_set_var(param_2_parfs(parse_guest_loglvl),
+                           xenlog_guest_val);
+
+    return ret;
 }
 
 static char *loglvl_str(int lvl)
-- 
2.26.2


