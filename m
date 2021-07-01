Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4423B92EF
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:11:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148716.274919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxP4-0001Ho-A2; Thu, 01 Jul 2021 14:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148716.274919; Thu, 01 Jul 2021 14:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxP4-000183-5k; Thu, 01 Jul 2021 14:10:54 +0000
Received: by outflank-mailman (input) for mailman id 148716;
 Thu, 01 Jul 2021 14:10:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxP2-0005F9-Jg
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:52 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 184bf81a-da76-11eb-8327-12813bfff9fa;
 Thu, 01 Jul 2021 14:10:32 +0000 (UTC)
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
X-Inumbo-ID: 184bf81a-da76-11eb-8327-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2WFDUvnAZmIMKGyUlu8KLXOxi1z1do7+jNPMy5fEh9Q=;
  b=HHS8m3PJMqEfShbC3br1fxuy3izyozdQk/J38+Hy6N3sd1/jHIfwoVMc
   yfr9Ow9m8VeSAU/yiBGlp3ZOY0tdQopWz78F/9LNmr28WI0xkz6JQk4ib
   AY+SS/AZJAdT90Rpr10Kh0s0Cc2S6UMTSbO41g1UXfl+HaJ9Zs53TzLD5
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Dls+lF5hiBXijky5vM+9nnAjrwEmsB23wra86iApibKZRVfZotBLVIGeJJHEQCC3VHZNUfkrja
 fSc+3ONCMCyMlkuaqQIuOVu5QsGl1xefaLtUoQAt0Wxg/dj88YZl0Ca8yAbAN+8jBVaClGtoth
 p0R3omGJRkxD+4qRurT1zmOcBkhfuNaAPi4ITsStNBMAo2T3VX6aHp+QRPZLWTec4Sz0GwBrW9
 WSi50YZ5JYuJsOmL4sfCCXgdIYT6lM9l282r2voKg4fBp63/bCFWPsWHTojhS7nZuMv1mJNdq+
 Wxs=
X-SBRS: 5.1
X-MesageID: 47755348
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:U8zI+6N+cOO1kcBcT1H155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90dq7MAnhHP9OkMQs1NKZMDUO11HYS72KgbGC/9SkIVyHygc/79
 YtT0EdMqyXMbESt6+Tj2eF+pQbsaC6GcuT9IXjJgJWPGVXgtZbnmJE42igcnFedU1jP94UBZ
 Cc7s1Iq36LYnIMdPm2AXEDQqzqu8DLvIiOW29JOzcXrC21yR+44r/zFBaVmj0EVSlU/Lsk+W
 /Z1yTk+6SYte2hwBO07R6T030Woqqg9jJwPr3PtiEnEESotu9uXvUkZ1S2hkF3nAho0idsrD
 CDmWZnAy050QKtQoj8m2qQ5+Cn6kdg15aq8y7mvVLz5cP+Xz40EMxHmMZQdQbY8VMpuJVm3L
 tMxH/xjesfMfrsplWL2zHzbWAdqqN0mwtRrccDy3hEFYcOYr5YqoISuEtTDZcbBSr/rIQqCv
 NnAs3Q7OtfNQryVQGTgkB/hNi3GngjFBaPRUYP/sSTzjhNhXh8i08V3tYWkHsM/I80D5NE++
 PHOKJ1k6wmdL5fUUu8PpZ0fSKTMB2GffvhChPjHb3XLtBzB5uWke+H3Fwc3pDYRHUn9upNpK
 j8
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47755348"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 09/31] build: clean "lib.a"
Date: Thu, 1 Jul 2021 15:09:49 +0100
Message-ID: <20210701141011.785641-10-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 360b4a1d1867..e4deceab2c9a 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -343,7 +343,7 @@ _clean: delete-unfresh-files
 	$(MAKE) $(clean) test
 	$(MAKE) -f $(BASEDIR)/tools/kconfig/Makefile.kconfig ARCH=$(ARCH) SRCARCH=$(SRCARCH) clean
 	find . \( -name "*.o" -o -name ".*.d" -o -name ".*.d2" \
-		-o -name "*.gcno" -o -name ".*.cmd" \) -exec rm -f {} \;
+		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
 	rm -f asm-offsets.s include/asm-*/asm-offsets.h
 	rm -f .banner
-- 
Anthony PERARD


