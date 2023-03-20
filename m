Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 122576C18FE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 16:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511974.791460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHRU-0006Re-2e; Mon, 20 Mar 2023 15:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511974.791460; Mon, 20 Mar 2023 15:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peHRT-0006Oj-Vq; Mon, 20 Mar 2023 15:28:59 +0000
Received: by outflank-mailman (input) for mailman id 511974;
 Mon, 20 Mar 2023 15:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Jf3z=7M=citrix.com=prvs=43647449e=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1peHRS-0006Nv-4T
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 15:28:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebeef3df-c733-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 16:28:55 +0100 (CET)
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
X-Inumbo-ID: ebeef3df-c733-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679326135;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Cae7xsatjdkk0Qd3/PgXTMzDa7IbBzEW0WkMnFrgwDc=;
  b=I/wuFKFdOb9G77ef6BTV0zAaHDGc3L8MNqKUZsiPgWYvv0H11ifk8Tmw
   AvNB1B4/O9tA+/Y67TANSEKI9fIjbeqiRfAbgHu4UdHaNEeDzwxjZQZTh
   9sijN4/Ck5N2GmtxvXn7+sD/bt/T8Cw2bM3qhJRzVZvvx7YMJMUG7LJ/f
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100927263
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:D9MMD6/XEOA4d4p+Fq4IDrUD9n6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 GAbXGGGaP7ZZTeke99+atm28R8HvsfVmNdlS1E4qyk8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kI/1BjOkGlA5AdmPqka5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklkx
 NlDFT5XYyqquNi8xJGJaMJJjfwKeZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUqGOkcUUrsUIMtWcOOAj3/jczpeuRSNqLA++WT7xw1tyrn9dtHSf7RmQO0Mxh7J/
 D2coT+R7hcyF4CY5hHYwmmVvczTnhH0BNgAEqSXz6s/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c9haHvA+6QqN4rHJ+AvfDW8BJhZDddgnuckeVTEsk
 FiTkLvBHidzubeYTXac8La8rj6oPyURa2gYakcsUg8t89Tl5oYpgXryos1LSfDvyIevQHepn
 m7M9XJl71kOsSIV/4+K2Av6jWihnLH2dAQxxTf1dUeu1iosMeZJeLeUBUjnAedoddjGHwHb4
 SBby6By/8hVU8jTyXXlrPElWejwuq3baGC0bUtHRcFJyti7x5K0kWm8ChlaLVwhDMsLcCSBj
 KT76VIIv8870JdHgMZKj2ON5ycCl/KI+SzNDKy8Uza3SsEZmPW7ENxGPxbMjwgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreetrxJYQDn3hkrUuKHMCT8vhS+ebGDJJjYetfYQTmgyFQxP/snTg5B
 P4FZpHSlUoECL2Wj+u+2dd7EG3m5EMTXfjew/G7vMbZSua6MAnN08Ps/I4=
IronPort-HdrOrdr: A9a23:5074h6svGN0yGkpRxdCusWP77skDddV00zEX/kB9WHVpmwKj5q
 eTdZUgpHnJYVMqMk3I9urwW5VoLUm9yXcX2+gs1NWZLWvbUQKTRekI0WKI+UyEJ8SRzJ846U
 6iScRD4R/LYGSSQfyU3OBwKbgd/OU=
X-IronPort-AV: E=Sophos;i="5.98,274,1673931600"; 
   d="scan'208";a="100927263"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2] build: detect compiler change to rerun kconfig
Date: Mon, 20 Mar 2023 15:28:36 +0000
Message-ID: <20230320152836.43205-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This simple comment allows to detect when $(CC) changes version.
Kconfig will be rerun in this case. (Rerun is forced by
include/config/auto.conf.cmd which detects changes of CC_VERSION_TEXT
value).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Technically, it was acked by Andrew:
    https://lore.kernel.org/xen-devel/20200326135621.687685-1-anthony.perard@citrix.com/t/#ma1171775b9938bcdffc80b2fcb8d2a883cd3e32a

v2:
- s/upgrade/change/ in subject and in the comment in the Makefile
- Fix path in commit description
---
 xen/Kconfig  | 2 ++
 xen/Makefile | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/xen/Kconfig b/xen/Kconfig
index 134e6e68ad..756c7842e9 100644
--- a/xen/Kconfig
+++ b/xen/Kconfig
@@ -4,6 +4,8 @@
 #
 mainmenu "Xen/$(SRCARCH) $(XEN_FULLVERSION) Configuration"
 
+comment "Compiler: $(CC_VERSION_TEXT)"
+
 source "scripts/Kconfig.include"
 
 config BROKEN
diff --git a/xen/Makefile b/xen/Makefile
index 2710d7327e..12c6891a79 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -326,6 +326,10 @@ ifdef building_out_of_srctree
 	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
 endif
 
+# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
+# and from include/config/auto.conf.cmd to detect the compiler change.
+export CC_VERSION_TEXT := $(shell $(CC) --version 2>/dev/null | head -n 1)
+
 ifeq ($(config-build),y)
 # ===========================================================================
 # *config targets only - make sure prerequisites are updated, and descend
-- 
Anthony PERARD


