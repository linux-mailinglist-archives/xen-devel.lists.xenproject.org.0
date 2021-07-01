Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D7E3B92F5
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:11:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148720.274953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPE-00030T-Kp; Thu, 01 Jul 2021 14:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148720.274953; Thu, 01 Jul 2021 14:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxPE-0002wk-9d; Thu, 01 Jul 2021 14:11:04 +0000
Received: by outflank-mailman (input) for mailman id 148720;
 Thu, 01 Jul 2021 14:11:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxPC-0005F9-K1
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:11:02 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a1c1c88-da76-11eb-8328-12813bfff9fa;
 Thu, 01 Jul 2021 14:10:35 +0000 (UTC)
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
X-Inumbo-ID: 1a1c1c88-da76-11eb-8328-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148635;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YsKdP5YvQwz72PyZst34Fs58LUxCUW3nm9UPTFm+erc=;
  b=Q29apw6ypftOH/490vEziVLWVjfQGeauMxZ4Tiydmp6pRzvvAa0Bjtcs
   ica8vX0JMeGcvEDf1uoUZFYq1DhlgnObzoC+pivXhmxmVEyA617PGZUcR
   8apwQ3ippUKZdHew5PH4JzfjKQ/qzybivUxH2hBrMj36aPQI2YJ25Omhc
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Gl7gpFD2pCJm/M7MRaZCSy0jIjUuheQt71gIpKzZRJmorny4R1wgXdIXEWx2kMSa9kQ0I+OU9G
 NQzZK/HFxxwJXY6u9HXFz2LCU4pyaCe6qhszmQW+uYfpIywGumUK/u5/xhhm8FIpqA2oAZ6nL4
 1jwQaOfeYXlEqqJrawW9TZI6LGRJ5Y/FXqD3F6oQYBgh5lf4LEw118uw5/1b/uEN7rLbRZRCjM
 HxyNweZqtU3IAURTb1tAaEBFSwWE7aD0+m/av9OPsp8qk8OeIiBAmVkw9FC4JeldeCnhz4Z/rb
 u6E=
X-SBRS: 5.1
X-MesageID: 47376107
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Vun1V6ljqiwuiZcxmBJSZYTwKj/pDfIm3DAbv31ZSRFFG/Fw9/
 re/8jztCWE7Ar5N0tMpTntAsW9qBDnlaKdg7N+AV7KZmCP01dAR7sC0WKN+VLd84CUzIRgPS
 AKSdkaNDUlZmIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47376107"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 11/31] build: fix clean targets when subdir-y is used
Date: Thu, 1 Jul 2021 15:09:51 +0100
Message-ID: <20210701141011.785641-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The make variable $(subdir-y) isn't used yet but will be in a
following patch. Anything in $(subdir-y) doesn't to have a '/' as
suffix as we already now it's a directory.

Rework the rules so that it doesn't matter whether there is a '/' or
not. It also mimic more closely to the way Linux's Kbuild descend in
subdirectories.

FORCE phony target isn't needed anymore running clean, so it can be
removed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/scripts/Makefile.clean | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index 53379e6102cc..027c200c0efc 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -12,19 +12,18 @@ include Makefile
 # Figure out what we need to clean from the various variables
 # ==========================================================================
 subdir-all := $(subdir-y) $(subdir-n) $(subdir-) \
-              $(filter %/, $(obj-y) $(obj-n) $(obj-))
+              $(patsubst %/,%, $(filter %/, $(obj-y) $(obj-n) $(obj-)))
 
 DEPS_RM = $(DEPS) $(DEPS_INCLUDE)
 .PHONY: clean
-clean:: $(addprefix _clean_, $(subdir-all))
+clean:: $(subdir-all)
 	rm -f *.o .*.o.tmp *~ core $(DEPS_RM)
 
 # Descending
 # ---------------------------------------------------------------------------
 
-_clean_%/: FORCE
-	$(MAKE) $(clean) $*
+PHONY += $(subdir-all)
+$(subdir-all):
+	$(MAKE) $(clean) $@
 
-# Force execution of pattern rules (for which PHONY cannot be directly used).
-.PHONY: FORCE
-FORCE:
+.PHONY: $(PHONY)
-- 
Anthony PERARD


