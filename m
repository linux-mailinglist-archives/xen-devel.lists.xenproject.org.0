Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 735E02DEC16
	for <lists+xen-devel@lfdr.de>; Sat, 19 Dec 2020 00:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56753.99464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqPL6-0002Pa-I3; Fri, 18 Dec 2020 23:39:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56753.99464; Fri, 18 Dec 2020 23:39:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqPL6-0002PB-Ep; Fri, 18 Dec 2020 23:39:12 +0000
Received: by outflank-mailman (input) for mailman id 56753;
 Fri, 18 Dec 2020 23:39:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fP3M=FW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kqPL5-0002P6-2g
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 23:39:11 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1017ef90-350a-4de9-a0c5-8a122d09e37a;
 Fri, 18 Dec 2020 23:39:09 +0000 (UTC)
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
X-Inumbo-ID: 1017ef90-350a-4de9-a0c5-8a122d09e37a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1608334749;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jNHKbYTTBr5uWlZ+nqwtHXf5IXemodP6GeLyGxYrL+M=;
  b=SWTI8tGtBx0bkUvcBy7v+Eq04WoFTNBnJMZWxlf6UY2XBPHHdsWLz6+o
   4qOxdPCs0jq1aCFBNmX5wowjYzF1Z2857PlIfHrRYERw2t2VLfT5yMqOL
   VC00LE/g8M4mh7zJXh48npBor2yoiWad7+DotIUclHVXFb2YjoJssriUI
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uXSwno8/MTAbO3X2QdFfay/uiXzNeBGegxgSext7SNv35qDrbTOgM1ByyhMeCALLa/lJJmg6pt
 sRkrYvP57DdHzp+ikkzarTTrYYFkRdjRXgSGo40Cgs4D04taCQFApEXUmkzVFAalQc8J5iKMG0
 WdWXoqp/rY+HbR9sqvajclGW7WRP9L/Mq4SW9QesoJDiAjrKtb62fR/vZ+XtmqOH8WShXmnCQ4
 kKji7sZyAka8z+OuDFyE9NfFv433vM2oj8c4KF4zXfwQSuosv/5BTKbIoHo1BYQY1cJ9iw0nqn
 MzM=
X-SBRS: 5.2
X-MesageID: 33594741
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.78,431,1599537600"; 
   d="scan'208";a="33594741"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, <hanetzer@startmail.com>
Subject: [PATCH] xen/Kconfig: Correct the NR_CPUS description
Date: Fri, 18 Dec 2020 23:38:42 +0000
Message-ID: <20201218233842.5277-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The description "physical CPUs" is especially wrong, as it implies the number
of sockets, which tops out at 8 on all but the very biggest servers.

NR_CPUS is the number of logical entities the scheduler can use.

Reported-by: hanetzer@startmail.com
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: hanetzer@startmail.com
---
 xen/arch/Kconfig | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index 1954d1c5c1..d144d4c8d3 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -1,11 +1,17 @@
 
 config NR_CPUS
-	int "Maximum number of physical CPUs"
+	int "Maximum number of CPUs"
 	range 1 4095
 	default "256" if X86
 	default "8" if ARM && RCAR3
 	default "4" if ARM && QEMU
 	default "4" if ARM && MPSOC
 	default "128" if ARM
-	---help---
-	  Specifies the maximum number of physical CPUs which Xen will support.
+	help
+	  Controls the build-time size of various arrays and bitmaps
+	  associated with multiple-cpu management.  It is the upper bound of
+	  the number of logical entities the scheduler can run code on.
+
+	  For CPU cores which support Simultaneous Multi-Threading or similar
+	  technologies, this the number of logical threads which Xen will
+	  support.
-- 
2.11.0


