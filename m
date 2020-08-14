Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A7F244DB1
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 19:27:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6dU9-0005k3-Pj; Fri, 14 Aug 2020 17:27:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gClF=BY=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1k6dRc-00024Q-JG
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 17:24:44 +0000
X-Inumbo-ID: e4380587-44ea-47ba-a23c-6fce3ce9b12c
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4380587-44ea-47ba-a23c-6fce3ce9b12c;
 Fri, 14 Aug 2020 17:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597425760;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=2BRyay7ySv9zUIDvN5Jo2Q0hBQCNwJhXHMBk7elBw7g=;
 b=FCK66EYNzY4f0U5MjxMwBG5NMZldAGx4of7v6H0oPBAkslvA3Hjrdy3f
 DDzYmH+Ms4thSM7fHYBTenih2fk8a/hqdUJ7mhSKgBQQ7bW6vW2BZjVXg
 SzdQsEMyROcIN980R+NZJH3JfBrL0XtAWIjGe9bG5QokSeDWO/Rb3P8mJ U=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: NrB0FhW6FhsTx4sJML8vp8SQmOnDDQYGciMcYCmvIFRLqNUg4xsz3/wMwGVYi3iB6Ngqgmlr5N
 401J/McXKXwFLHuOAHL5fCrcLmgzxpYNVEyGJHpzxTcaI1qG10QFEUd9kIyl7ovqZl66paIkjy
 pwX8rW4XT8djWEXe94aStObE5jguax0ayEoYi59E7NKkIn9MQ5z/9NqlDRbIez8ML2nLr8eUnc
 q827IdX1JcYKT2mTI1PWiOV59g+ufwXv09LZcC3R/OupGxjM4iyuIcofX4nOIUC13R7Ci4vzxx
 BgI=
X-SBRS: 2.7
X-MesageID: 24576921
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,313,1592884800"; d="scan'208";a="24576921"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>
Subject: [OSSTEST PATCH 50/60] history reporting (nfc): url-quoting: quote =
 too
Date: Fri, 14 Aug 2020 18:21:55 +0100
Message-ID: <20200814172205.9624-51-ian.jackson@eu.citrix.com>
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

We are going to want to url-encode keys.  If key contains =, we still
need to be able to tell where it ends, so it must be encoded.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 Osstest/HistoryReport.pm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Osstest/HistoryReport.pm b/Osstest/HistoryReport.pm
index 75ec75f3..20913d27 100644
--- a/Osstest/HistoryReport.pm
+++ b/Osstest/HistoryReport.pm
@@ -45,7 +45,7 @@ BEGIN {
 
 use POSIX;
 
-our $url_ok_chars = '-+=/~:;_.,\w';
+our $url_ok_chars = '-+/~:;_.,\w';
 
 our @key_cols;
 
-- 
2.11.0


