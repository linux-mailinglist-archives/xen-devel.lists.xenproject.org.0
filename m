Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C66F7244DA2
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:26:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dTi-0004d9-Mk; Fri, 14 Aug 2020 17:26:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dQ8-00024H-WF
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:23:13 +0000
X-Inumbo-ID: 1bf497fa-4c22-4c20-9e89-315c3d95e6e1
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bf497fa-4c22-4c20-9e89-315c3d95e6e1;
 Fri, 14 Aug 2020 17:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=jayi6sGhQIIc8z8XNhCFRTqmNCWkgiucBJ6yZix0Kvw=;
 b=JJ4fV94L/BV3JCqWJgb3gLa1souVWmWSSG+7j6yTp9JGWu97A6aBst/5
 RFytzl0zIfgMMligeZlHt7GZuPa3KlvC+OBSFkUaTOzR3Yvv5V6NSjloK
 IcZTvszs9Dl82rF8j/t/yThkG0E+JmpIBFuvKPMak6SR7pIYr/51IxB9g g=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ZM+qnAmamfS8aNtrEEM81CpDEcrPmI36jzG2YueP+r9+lJqBMkYcGDA64gvfd41lerJSmrHH1t
 +zDi/NW6mYv0DspCJq7gwWk+nNj5jh+TTYk2TY00ZSKcBqqaQghTgKijta7j1QRWvt0w+rJD54
 5Q8cB9JMVbcEh0DqcqZJfXk9yXgqdJ39zrT/ZuGVqNp1/z4UP8FSKQDwoimP0DkfgiBe6QRLKp
 V3hmSTtp+Dg5byve+VY2YnUAlTX4+Pemy0m2kTxGejrfrD9v1OwZWy7VaxtYrYKI4FhB6A7W7/
 nBE=
X-SBRS: 2.7
X-MesageID: 25487821
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="25487821"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 27/60] sg-report-host-history: Write cache entry for
 unfinished jobs
Date: Fri, 14 Aug 2020 18:21:32 +0100
Message-ID: <20200814172205.9624-28-ian.jackson@eu.citrix.com>
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

We have to also check ->{finished}, rather than the existence of a row
at all, since now unfinished jobs can appear in the cache.

Because the cache key includes the job status, when the job becomes
finished the cache entry will be invalidated.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 sg-report-host-history | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sg-report-host-history b/sg-report-host-history
index 2ad2134d..6bf14aa2 100755
--- a/sg-report-host-history
+++ b/sg-report-host-history
@@ -214,7 +214,8 @@ END
 	cache_row_lookup_prep(\$jr);
 
 	my $endedrow = cacheable_query($endedq, $jr, 'e');
-	if (!$endedrow) {
+	if (!defined $endedrow->{finished}) {
+	    cache_write_entry(\*H, $jr);
 	    #print DEBUG "no-finished\n";
 	    next;
 	}
-- 
2.11.0


