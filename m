Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ADF3F9A8B
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 16:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173682.316869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcQC-0007e1-8P; Fri, 27 Aug 2021 14:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173682.316869; Fri, 27 Aug 2021 14:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJcQC-0007bI-3J; Fri, 27 Aug 2021 14:01:28 +0000
Received: by outflank-mailman (input) for mailman id 173682;
 Fri, 27 Aug 2021 14:01:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4Ba=NS=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mJcQA-0007bB-Iz
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 14:01:26 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fd14cfa6-021f-4ab3-bd2b-0bf2021533f1;
 Fri, 27 Aug 2021 14:01:25 +0000 (UTC)
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
X-Inumbo-ID: fd14cfa6-021f-4ab3-bd2b-0bf2021533f1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630072885;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/J2auXVs1v8727jLQqWlc/Fzv5/mxYtQIc9zcGXc3FY=;
  b=dLfdy8oAxMdjeUPzBLEr8LU+Ro9sWIcd0CV/rWRGaBNFukg0FAWZuYUZ
   FUUQogTcSR/M/sdfuxunvM/I3pbvx44uXWaD5JlBKNwod3cgsCo5/ObBS
   je1tdX6K1osfSloJMIL1PtkrAWTtf+vMUAoFHdalbmiY0a1udUBJeJsVk
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: XADDKu41cuXVlyUp7FN0fIGSPyEbPNuNCGC5oWabFw89yDnKt5n8PTrYXqoR+iG9SSlnk3t7qU
 GwIObYO9PW7S9RWng21bbG2yB7HrHOk4fZIyvBSKipeKhEKdRYlp5PL4SaKgqw2ZFEmSNHYa4I
 RtyPbMQpMF9kvYlAfgVy1pM3LDgsuNWFyqet0qvaWWZgoRClvnC7A4MV/OUt2Ek298/7GEpAxf
 93HCWqr/aZksziK8KtztzLe6R1EQTGV8gvGZ0hPQ+JeuEwlUPuF5MsG4zOdUojxFUFI53sLBLo
 MfWpA8qnVez4tWzjhEdS5Tf1
X-SBRS: 5.1
X-MesageID: 51470801
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:cyqfo6/5Ubvf4NwgX3Vuk+DUI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+8jztCWE7Ar5N0tBpTntAsW9qBDnhPtICOsqTNSftWDd0QPCRuxfBOPZslvd8kbFl9K1u5
 0OT0EHMqyTMWRH
X-IronPort-AV: E=Sophos;i="5.84,356,1620705600"; 
   d="scan'208";a="51470801"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/domain: Fix label position in domain_teardown()
Date: Fri, 27 Aug 2021 15:01:08 +0100
Message-ID: <20210827140108.6633-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

As explained in the comments, a progress label wants to be before the function
it refers to for the higher level logic to make sense.  As it happens, the
effects are benign because gnttab_mappings is immediately adjacent to teardown
in terms of co-routine exit points.

There is and will always be a corner case with 0.  Help alleviate this
visually (at least slightly) with a BUILD_BUG_ON() to ensure the property
which makes this function do anything useful.

There is also a visual corner case when changing from PROGRESS() to
PROGRESS_VCPU().  The important detail is to check that there is a "return
rc;" logically between each PROGRESS*() marker.

Fixes: b1ee10be5625 ("gnttab: add preemption check to gnttab_release_mappings()")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/common/domain.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 14b1341e53c6..0d3385ad5a66 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -419,11 +419,13 @@ static int domain_teardown(struct domain *d)
         };
 
     case PROG_none:
+        BUILD_BUG_ON(PROG_none != 0);
+
+    PROGRESS(gnttab_mappings):
         rc = gnttab_release_mappings(d);
         if ( rc )
             return rc;
 
-    PROGRESS(gnttab_mappings):
         for_each_vcpu ( d, v )
         {
             PROGRESS_VCPU(teardown);
-- 
2.11.0


