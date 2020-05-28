Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFDB1E6438
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 16:41:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeJiD-0006d7-HG; Thu, 28 May 2020 14:40:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eNTM=7K=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jeJiD-0006cz-0D
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 14:40:49 +0000
X-Inumbo-ID: 33b9ef18-a0f1-11ea-81bc-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 33b9ef18-a0f1-11ea-81bc-bc764e2007e4;
 Thu, 28 May 2020 14:40:40 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: B0tPt1oZmZtfZVk0/L0NGOLQ+wfZvyCCx2fkWMTTmrRNQcfGuApvslZJ44ku2jKqeCz3HbY1Wb
 ma8CcyoNOAm91tGEuQ9dldiOkBM1Zn3xCh5ojXFlP5nblUVGHs49aNn1BWjeZoMvP4zOQpqdCf
 2TbfKobJwDikEaNjr4VKWLjG07LiaQnHah0jXfLbxB8F40YwP2mZBCucnyL95enV//7LT5dtV1
 mj3UsWRczggiAFkFnckph0GZmdcyWIDzDXlsbHTAVbA0TkolSIQAzgVkmtX3se5JciIsY4QbtA
 krY=
X-SBRS: 2.7
X-MesageID: 18922185
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,445,1583211600"; d="scan'208";a="18922185"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 3/3] clang: don't define nocall
Date: Thu, 28 May 2020 16:40:23 +0200
Message-ID: <20200528144023.10814-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528144023.10814-1-roger.pau@citrix.com>
References: <20200528144023.10814-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Clang doesn't support attribute error, and the possible equivalents
like diagnose_if don't seem to work well in this case as they trigger
when when the function is not called (just by being used by the
APPEND_CALL macro).

Define nocall to a noop on clang until a proper solution can be found.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/xen/compiler.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index c22439b7a4..225e09e5f7 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -20,7 +20,11 @@
 
 #define __weak        __attribute__((__weak__))
 
-#define nocall        __attribute__((error("Nonstandard ABI")))
+#if !defined(__clang__)
+# define nocall        __attribute__((error("Nonstandard ABI")))
+#else
+# define nocall
+#endif
 
 #if (!defined(__clang__) && (__GNUC__ == 4) && (__GNUC_MINOR__ < 5))
 #define unreachable() do {} while (1)
-- 
2.26.2


