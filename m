Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC69244DAA
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTx-0005FO-VJ; Fri, 14 Aug 2020 17:27:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQY-00024H-0Y
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:38 +0000
X-Inumbo-ID: fe115fab-4164-4cf4-a2e1-fd75a7cc3094
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fe115fab-4164-4cf4-a2e1-fd75a7cc3094;
 Fri, 14 Aug 2020 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425739;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=0DVXE2AqFVp60oYFsg0RponXDX/ELl0fuRQ+BVVXl9o=;
 b=HzWNdqZkyV0t5uHJQkeXWZWg78UeprqYbDqqwTtXsYBUmZmxkiCZj82s
 tHtwuunSxWX0d9iVQR80FYx26KKW/OnpilEhN04vO4AvJUiyJgfRZo6DX
 I3b6qvtaBIdtfwnaU1O9rqtth+6Vdfq/JIG0oKTlFDqv6EsJim4uyr6lP Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9BULI4WaFnmOP0IWATDe50lEkRiAS7v+k23D/fvybUNsECBZfnrUx7zmA/yS9oUAUzi3cngFFh
 KLi9kzPWUexJx9iAIdYN7KSa28buvQUut7rC6cYqI06sMB8Aas5tKTrTJnXGXPvcUV9A0TgP2W
 Fx4k/thKN3yAZH44l5lCwQmHyFKVr4GoRj/6ekHxYvoa5BMnjvaAIOrPMLk1mpyHjRvfjNFhE8
 oukIIb3S+yIzoS9d2iT0NywaUd7ls4UkXBujJMv2CNAMJZSDLd2oClxdrBr8Fpl/il5tYZUHhm
 ehY=
X-SBRS: 2.7
X-MesageID: 25487826
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="25487826"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 31/60] sg-report-job-history: Prep for fork: Move
 $buildsq query
Date: Fri, 14 Aug 2020 18:21:36 +0100
Message-ID: <20200814172205.9624-32-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
References: <20200814172205.9624-1-ian.jackson@eu.citrix.com>
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

We will need to prepare this once per (job,branch) so that it works
when we do each of those in a different process.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-job-history | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sg-report-job-history b/sg-report-job-history
index 6008ca72..47fc7a62 100755
--- a/sg-report-job-history
+++ b/sg-report-job-history
@@ -106,15 +106,15 @@ sub add_revisions ($$$$) {
     }
 }
 
-our $buildsq= db_prepare(<<END);
+sub processjobbranch ($$) {
+    my ($j,$bra) = @_;
+
+    my $buildsq= db_prepare(<<END);
         SELECT * FROM runvars
          WHERE flight=? AND job=?
            AND name LIKE '%buildjob'
 END
 
-sub processjobbranch ($$) {
-    my ($j,$bra) = @_;
-
     print DEBUG "processjobbranch('$j',", ($bra ? "'$bra'" : 'undef'), ")\n";
 
     my %rev_grid_col;
-- 
2.11.0


