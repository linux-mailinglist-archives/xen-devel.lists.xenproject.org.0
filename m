Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C49C24A3B5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Aug 2020 18:02:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8QXQ-000725-Cy; Wed, 19 Aug 2020 16:02:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N7ZT=B5=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k8QXO-0006xV-5q
 for xen-devel@lists.xenproject.org; Wed, 19 Aug 2020 16:02:06 +0000
X-Inumbo-ID: 7cee65c1-dd86-477d-904f-5c33bd14d7a6
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7cee65c1-dd86-477d-904f-5c33bd14d7a6;
 Wed, 19 Aug 2020 16:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597852921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=Y+z6/GUp1gQAbh9BXTGZb0V2zD55Xmss4MsgKfc57wk=;
 b=a5FP4teYhCjXFmceRGc90WxDQ5Sr+FdH3dfcrAujkXY/c1QiQy+kgzXb
 f513wOlFhaDTE729ZuqVvFmWwrbd4hYxifjo21aajP/8+z+PLAdYvCFK+
 OXkznTiDnKqy3V6+/dp48hLTN6izrqwUs1slz//8zNghHceVLYSYdtYAG g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: fQuG5WlXHINzhafW331wQcamnzx+XwJ/o4tphoHXcExCRjb9NpUiMcitUV92Ay4jvtqyZIHxl5
 rKj22LyXsWHfUzdw24ncyY2wlx/4tQij2Hd+u8EjNJxvSAcJkg1wJtthXjYcWWCdNNDWMkEj7d
 fgPUniF0Fe7MGhuGgEL29gX17kbCigpHWcGw3cFMVXqv/EVSgq2BBp2nwMW95qnnkym8VAHeiW
 yeQ4L6j+4MdQa8i7cZBweAmedbH9jJ2zCuDjYhYVDVnzAmTCJKc2ocT8HGrwN/LhabjtX4ACxw
 zCw=
X-SBRS: 2.7
X-MesageID: 24885407
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,331,1592884800"; d="scan'208";a="24885407"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 3/7] ts-hosts-allocate-Executive: Do a pre-check
Date: Wed, 19 Aug 2020 17:01:39 +0100
Message-ID: <20200819160143.11178-4-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200819160143.11178-1-ian.jackson@eu.citrix.com>
References: <20200819160143.11178-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Type: text/plain
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

Call attempt_allocation with an empty plan and $mayalloc=0.

In the usual case this will arrange to prime our memoisation caches
before we get involved with the queueing system.

It will also arrange for various errors to be reported sooner.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 ts-hosts-allocate-Executive | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/ts-hosts-allocate-Executive b/ts-hosts-allocate-Executive
index e5a6fbfe..4140b65c 100755
--- a/ts-hosts-allocate-Executive
+++ b/ts-hosts-allocate-Executive
@@ -692,6 +692,13 @@ sub alloc_hosts () {
         return;
     }
 
+    {
+	logm("pre-checking resources...");
+	local $Osstest::TestSupport::logm_prefix = $logm_prefix.' (precheck)';
+	my ($ok, $bookinglist) = attempt_allocation({}, 0);
+	die $ok if $ok>1 && $ok != $alloc_starved_r;
+    }
+
     my $waitstartadjust=
         $jobinfo->{recipe} =~ m/build/
         ? -10000
-- 
2.11.0


