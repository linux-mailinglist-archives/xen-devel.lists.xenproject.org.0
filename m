Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8EA3F5CA8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:02:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171001.312235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBk-0000tT-0o; Tue, 24 Aug 2021 11:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171001.312235; Tue, 24 Aug 2021 11:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBi-0000ab-7R; Tue, 24 Aug 2021 11:01:50 +0000
Received: by outflank-mailman (input) for mailman id 171001;
 Tue, 24 Aug 2021 11:01:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU3A-0001EC-CK
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:53:00 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29d63f64-83ea-4e87-a250-534450e6dc50;
 Tue, 24 Aug 2021 10:51:33 +0000 (UTC)
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
X-Inumbo-ID: 29d63f64-83ea-4e87-a250-534450e6dc50
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4Cv/yeAIlw+I3PqZSpnr4pgLY+dq26BTRMJUJxN2iw4=;
  b=Ic+EdWU+iNQ20et/vMjEMRVos2UXYAbtzZ38DrZ1+xpsbKIaPZtI4KTG
   uRi4RSxhLBOH6/YFUjzT1GJOkE52+komQvIp/Vr2mkq5fFsTR4Ds+VTP0
   Ksz9JwiN9Gu3xbeBe/NKBGdi3EgY7G9O6MJbvaSkJRGdCySg/2YR+Z7rk
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 9FiVE4Hs4ct/OKapHCfR5rlGmoKlsqritircRBdgizXln8eYCQSfrEPdzvpg+Wb50gMOqyyM6I
 U4n6x9r6z3+3YNywjuJ5NTTG9z6R9fuUsRFwfZPw7ZQBLFms7BIEZYKMNuYmPdp03qWloDHWHX
 StxNqj8bZjbXG8dLRjOzevdAUsMhubxd835QZn9/Dc6FA4eU32SyvtwjpI/UP2V3x5YhZOPGgR
 OfuswxZBknMXDBbiLevguqB+vKtbX++9h/hO/iAWqpxlEBDtrXqo1hDuNUXHvdO98PE9mKlQfX
 uvPAjAHTkRzDI1lIlk9Y5fH8
X-SBRS: 5.1
X-MesageID: 52875482
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:+Q4/jqDdYsCUQjjlHegQsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPEfP+VAssHFJo7C90dq7MArhHP9OkMIs1NiZLW3bUQeTQr2KjrGSiQEIeReOkdK1vJ
 0IG8QQNDSaNykYsS+O2njcLz9W+qjkzEnHv4bj5kYoaTsvR7Br7g9/BAreOFZxXhN6CZ0wE4
 fZztZbphK7EE5nIviTNz0gZazuttfLnJXpbVotHBg88jSDijuu9frTDwWY5BEDSDlCqI1Svl
 Qt0jaJqJlLgcvLiiM05FWjrKi+X+GRiOerMfb8y/T97A+czzpAKr4RH4Fq9wpF2N1HoGxa6+
 Uk5S1QcvibokmhBF2dsF/j3RLt3y0p7GKnwViEgWH7qci8Xz4iDdFd7LgpBCcxxnBQyO2U6p
 g7qF5xdqAnfC/ojWD4/ZzFRhtqnk27rT4rlvMSlWVWVc8bZKVKpYIS8UtJGNNYdRiKoLwPAa
 1rFoXR9fxWeVSVYzTQuXRu2sWlWjA2Eg2dSkYPt8SJ23xdnWx/zUEf2MsD901wva4VWt1B/a
 DJI65onLZBQosfar98Hv4IRY+tBmnEUXv3QRevyJTcZdM60lf22uDKCZkOlZ2Xka0zvegPcc
 76IS5lXEYJCj3TINzLx5tW7xyIW3m5UV3Wu7Fj26Q=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="52875482"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 23/51] build,include: remove arch-*/*.h public header listing from headers*.chk
Date: Tue, 24 Aug 2021 11:50:10 +0100
Message-ID: <20210824105038.1257926-24-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

$(public-y) contains "public/arch-%" but when used by
$(PUBLIC_HEADERS) $(public-y) is filtered-out by the pattern
"public/arch-%". So $(public-y) content is never used.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v7:
    - new patch

 xen/include/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 95daa8a28975..65a938a66555 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -39,9 +39,6 @@ cppflags-$(CONFIG_X86)    += -m32
 
 endif
 
-public-$(CONFIG_X86) := $(wildcard public/arch-x86/*.h public/arch-x86/*/*.h)
-public-$(CONFIG_ARM) := $(wildcard public/arch-arm/*.h public/arch-arm/*/*.h)
-
 .PHONY: all
 all: $(headers-y)
 
@@ -81,7 +78,7 @@ ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
 
 all: headers.chk headers99.chk headers++.chk
 
-PUBLIC_HEADERS := $(filter-out public/arch-% public/dom0_ops.h, $(wildcard public/*.h public/*/*.h) $(public-y))
+PUBLIC_HEADERS := $(filter-out public/arch-% public/dom0_ops.h, $(wildcard public/*.h public/*/*.h))
 
 PUBLIC_C99_HEADERS := public/io/9pfs.h public/io/pvcalls.h
 PUBLIC_ANSI_HEADERS := $(filter-out public/%ctl.h public/xsm/% public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
-- 
Anthony PERARD


