Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4E070E1F1
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 18:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538554.838598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1s-00070M-1f; Tue, 23 May 2023 16:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538554.838598; Tue, 23 May 2023 16:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1V1r-0006x1-Tv; Tue, 23 May 2023 16:38:31 +0000
Received: by outflank-mailman (input) for mailman id 538554;
 Tue, 23 May 2023 16:38:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UuGZ=BM=citrix.com=prvs=5000a0748=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1q1V1q-0006Dr-EW
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 16:38:30 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d9ef1d2-f988-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 18:38:27 +0200 (CEST)
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
X-Inumbo-ID: 3d9ef1d2-f988-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684859908;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gHSnwWQZeNLJTGRbdWUmwUXIbgpyRr1aGRD7CkY8Nag=;
  b=OQ9nSR56CJY6dCqTZ5z6nG8sF/XtQaMkoABf+s1nP8+/6zPXi1ICl3Y2
   Im8BPiG1ZwFTBscauCjoPTIJFIgVPjxbTuP0GUTIyWyw9a02bzhIaEskt
   VTTJJjs18DxMe1TAXL7gt7mmZNZNrNzuzSe6DKkpmjvh/P4RtunucR4vv
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110112539
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:lCo++6LMFJBJQso/FE+R2pUlxSXFcZb7ZxGr2PjKsXjdYENShDNWn
 DcaW2qPOKmJMGGgLtx2bty18EsB7JTTyIRrTFFlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4wZlPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5JWV1Xs
 tYnJApdLRCOm6Wmwq2xZLhF05FLwMnDZOvzu1llxDDdS/0nXYrCU+PB4towMDUY354UW6yEP
 oxANGQpNU6bC/FMEg5/5JYWleG0hn75YntApUicv6Yf6GnP1g1hlrPqNbI5f/TTHJ0MxxzF/
 TOuE2LRWztECPeTyRS+83+Mhff0wC3VYpggC+jtnhJtqALKnTFCYPEMbnOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhwWVsdUEuY6wBqQ0aeS6AGcbkAbShZRZdpgs9U5LQHGz
 XfQwYmvX2Y29uTIFzTErOz8QS6O1TY9Ezc+fGgucgc/s5rjrZ10nhDQRPgyOfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yT7FWyzyGskTKuMDirjUWGBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YhKFDXpH01NBfIgwgBdXTAdolmY
 /+mnTuEVy5GWcyLMhLtLwvi7VPb7n9nnj6CLXwK5x+mzaCfdBaodFvxC3PXNrpRxPrd8G3oH
 yN3a5PiJ+N3DLevPUE6MOc7cTg3EJTMLcuu8Z0IKbbTc1YO9aNII6a5/I7NsrdNx8x9/tokN
 FnnMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:4KA0+qG7d0GSW/a9pLqEGMeALOsnbusQ8zAXPiBKJCC9E/bo8/
 xG+c5w6faaslkssR0b9+xoW5PwJE80l6QFgrX5VI3KNGXbUQ2TTb2KhbGI/9SKIVydygcy78
 ddmtNFebrN5VgRt7eH3OG7eexQv+VuJsqT9JnjJ3QGd3AaV0l5hT0JbDpyiidNNXN77ZxSLu
 vk2uN34wCOVF4wdcqBCnwMT4H41qD2fMKPW29/O/Y/gjP+9g+V1A==
X-Talos-CUID: 9a23:ohZfuGF0dMTMVjdhqmJZrHINXeoafkeNj3fdPwioC3ljZuy8HAo=
X-Talos-MUID: 9a23:GBp5vwXBqT4llInq/GbG2g1JOMdG2KWjKEMVqsgIlfOeBzMlbg==
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="110112539"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 03/15] build, x86: clean build log for boot/ targets
Date: Tue, 23 May 2023 17:37:59 +0100
Message-ID: <20230523163811.30792-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523163811.30792-1-anthony.perard@citrix.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We are adding %.lnk to .PRECIOUS or make treat them as intermediate
targets and remove them.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/x86/boot/Makefile | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/boot/Makefile b/xen/arch/x86/boot/Makefile
index 03d8ce3a9e..2693b938bd 100644
--- a/xen/arch/x86/boot/Makefile
+++ b/xen/arch/x86/boot/Makefile
@@ -5,6 +5,8 @@ head-bin-objs := cmdline.o reloc.o
 nocov-y   += $(head-bin-objs)
 noubsan-y += $(head-bin-objs)
 targets   += $(head-bin-objs)
+targets   += $(head-bin-objs:.o=.bin)
+targets   += $(head-bin-objs:.o=.lnk)
 
 head-bin-objs := $(addprefix $(obj)/,$(head-bin-objs))
 
@@ -26,10 +28,16 @@ $(head-bin-objs): XEN_CFLAGS := $(CFLAGS_x86_32) -fpic
 LDFLAGS_DIRECT-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
 LDFLAGS_DIRECT += $(LDFLAGS_DIRECT-y)
 
-%.bin: %.lnk
-	$(OBJCOPY) -j .text -O binary $< $@
+%.bin: OBJCOPYFLAGS := -j .text -O binary
+%.bin: %.lnk FORCE
+	$(call if_changed,objcopy)
 
-%.lnk: %.o $(src)/build32.lds
-	$(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
+quiet_cmd_ld_lnk_o = LD      $@
+cmd_ld_lnk_o = $(LD) $(subst x86_64,i386,$(LDFLAGS_DIRECT)) -N -T $(filter %.lds,$^) -o $@ $<
+
+%.lnk: %.o $(src)/build32.lds FORCE
+	$(call if_changed,ld_lnk_o)
 
 clean-files := *.lnk *.bin
+
+.PRECIOUS: %.lnk
-- 
Anthony PERARD


