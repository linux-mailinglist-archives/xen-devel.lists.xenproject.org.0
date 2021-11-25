Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E0F45DB5D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231210.399971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzP-0008LJ-0L; Thu, 25 Nov 2021 13:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231210.399971; Thu, 25 Nov 2021 13:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzO-0008Hg-Pe; Thu, 25 Nov 2021 13:40:38 +0000
Received: by outflank-mailman (input) for mailman id 231210;
 Thu, 25 Nov 2021 13:40:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEzL-00076i-UX
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:36 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4191a2af-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:40:32 +0100 (CET)
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
X-Inumbo-ID: 4191a2af-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847631;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z/WT05OcUodD6RGHso4Z+Hq1+po51KMdUGAn2O0jpV0=;
  b=ZAWq4EeOVIDRUbEy/7i8b2gPliM3P9NeUvJsDZUs/QFNLvxEFjelb/FK
   21vZ8hahXpuLKF+mM/qJPB6F5/YTVaERNFHLZKv9PwKK3FbS1fg6bzhxG
   aR3ufZGAzWWdg2cpPwJGJyVzgQOxM/Icpv0NuCj/rvP8n4bV9gWFsNsce
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NlgjfJW98Grgo79rJFB0j2lKZZP6pmsV+RhUwPF+L98C7ubzhJyURbNM6dJdFn456UacZ7oSAK
 YDQPfh0Yb2XLMPDLKXBz7dErIdLCPeQT/PQ/nr8cbvbuzgg1vEGyjrsQLPWFbiXpVOH1qapvJM
 X/QiDCeYkt27L85Mmht/i03S+Vg3HC/Lo3blZ51Mxukg4Bz1U3AcDLa9CiQBEHBIcUbgCzmzRY
 3Xeqt077mdRoE4AeLmX5zdyumWmSRpTlYpxDf49x6jc3ZfkB5bJyu7XU/kTvBlLP1t+1Ug54Oe
 fGjd9J2R0Lv+8Ce2cZl06MYW
X-SBRS: 5.1
X-MesageID: 58576636
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:g0YqoqJe7reD1XSsFE+RVZIlxSXFcZb7ZxGr2PjKsXjdYENS0mQAy
 TRKD2iPbKmJYDb1Lo8gPYy39BxVvcPUmtE2SlBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2gmIgo7
 fRxlKfrRDkABaLlwOsMTERXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gpg258QQ62AD
 yYfQRwyfC/YPgRKAGgsFI0Ot7erxULicwQN/Tp5ooJoujOOnWSdyoPFMsfRe9GMbdVYmACfv
 G2u13/iHhgQOdibyDyE2nGhnOnCmWX8Qo16PKK83u5nhhuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQoWGGlg4RXcJKFO834x3LzbDbiy6bDGUZSj9KaPQ9qdQ7Azct0
 ze0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqTChcFC4k3/jY+4wNpynAZ45sAbHogYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBN/BFgHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWJ4vG4WyKRBaJ9sldrVj
 Kj741452XOrFCH2BZKbmb6ZBcUw1rTHHt/4TP3SZdcmSsEvL1DYo3A+NR/KgTGFfK0QfUYXY
 8nzTCpRJSxCVfQPIMSeG4/xLoPHNghhnDiOFPgXPjys0KaEZW79dFv2GADmUwzN14vd+F+92
 48Gb6OikkwDOMWjMni/2dNCdjgicClkba0aXuQKL4arOBR9Img9Bpf5mPV5E2CTt/8OzbmgE
 7DUchIw9WcTclWbc1jXMS46N+u0NXu9xFpiVRER0Z+T8yBLSe6SAG03LvPbpJErq75uy+BaV
 f4Ad5nSC/hDUG2fqT8ccYP8vMppcxHy3VCCOC+sYT4eeZ98RlOWpo+4L1W3rCReXDCqscYeo
 qG70l+JS5Q0WAk/Xt3db+iizg3tsCFFyv5yRUbBPvJaZF7orNpxMyX0g/Jue5MMJBzPyyG0z
 QGTBRtE9+DBr5VsqIvChLyerpfvGOx7RxIIE27e5LewFC/b4mv8ntMQDLfWJWjQDTqm9r+ja
 ONZy+DHHMcGxFsa4ZBhF7tLzL4l44e9rbFt0Qk5Tm7AaE6mC+08LyDej9VPrKBE2pRQpRCyB
 hCU4tBfNLiEZJHlHVoWKFZ3Z+iPz6hJyDzb7PBzK0Tm/i5nurGAVBwKbRWLjSVcKppzMZ8kn
 rh96JJHtVTnh0p4KMuCgwBV63+Ify4JXKgQv50HBJPm11gwwVZYbJ2AUiL77fljsTmX3pXG9
 tNMuJf/ug==
IronPort-HdrOrdr: A9a23:SqegZq2JElQSNMSfjakpKgqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58576636"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 03/47] build: generate "include/xen/compile.h" with if_changed
Date: Thu, 25 Nov 2021 13:39:22 +0000
Message-ID: <20211125134006.1076646-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This will avoid regenerating "compile.h" if the content hasn't changed.

As it's currently the case, the file isn't regenerated during `sudo
make install` if it exist and does belong to a different user, thus we
can remove the target "delete-unfresh-files". Target "$(TARGET)" still
need a phony dependency, so add "FORCE".

Use "$(dot-target).tmp" as temporary file as this is already cover by
".*.tmp" partern in ".gitconfig".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v8:
    - drop change in .gitignore
    
    v7:
    - Use $(if_changed,) instead of importing a new macro from Linux
      (filechk).
    - use $(dot-target).tmp as temporary file, that way is hiden, and
      already cover by .gitignore via ".*.tmp". (filechk was doing the same)
    - update .gitignore.

 xen/Makefile | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index b2a63edca1eb..2ad7da7ad67b 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -365,7 +365,7 @@ _debug:
 	$(OBJDUMP) -D -S $(TARGET)-syms > $(TARGET).s
 
 .PHONY: _clean
-_clean: delete-unfresh-files
+_clean:
 	$(MAKE) -C tools clean
 	$(MAKE) $(clean) include
 	$(MAKE) $(clean) common
@@ -383,7 +383,7 @@ _clean: delete-unfresh-files
 		-o -name "*.gcno" -o -name ".*.cmd" -o -name "lib.a" \) -exec rm -f {} \;
 	rm -f include/asm $(TARGET) $(TARGET).gz $(TARGET).efi $(TARGET).efi.map $(TARGET)-syms $(TARGET)-syms.map *~ core
 	rm -f asm-offsets.s arch/*/include/asm/asm-offsets.h
-	rm -f .banner .allconfig.tmp
+	rm -f .banner .allconfig.tmp include/xen/compile.h
 
 .PHONY: _distclean
 _distclean: clean
@@ -393,7 +393,7 @@ $(TARGET).gz: $(TARGET)
 	gzip -n -f -9 < $< > $@.new
 	mv $@.new $@
 
-$(TARGET): delete-unfresh-files
+$(TARGET): FORCE
 	$(MAKE) -C tools
 	$(MAKE) -f $(BASEDIR)/Rules.mk include/xen/compile.h
 	[ -e arch/$(TARGET_ARCH)/efi ] && for f in $$(cd common/efi; echo *.[ch]); \
@@ -406,14 +406,6 @@ $(TARGET): delete-unfresh-files
 	$(MAKE) -f $(BASEDIR)/Rules.mk arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
 	$(MAKE) -f $(BASEDIR)/Rules.mk -C arch/$(TARGET_ARCH) $@
 
-# drivers/char/console.o contains static banner/compile info. Blow it away.
-# Don't refresh these files during e.g., 'sudo make install'
-.PHONY: delete-unfresh-files
-delete-unfresh-files:
-	@if [ ! -r include/xen/compile.h -o -O include/xen/compile.h ]; then \
-		rm -f include/xen/compile.h; \
-	fi
-
 quiet_cmd_banner = BANNER  $@
 define cmd_banner
     if which figlet >/dev/null 2>&1 ; then \
@@ -428,9 +420,11 @@ endef
 	$(call if_changed,banner)
 targets += .banner
 
-# compile.h contains dynamic build info. Rebuilt on every 'make' invocation.
-include/xen/compile.h: include/xen/compile.h.in .banner
-	@sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
+# Don't refresh this files during e.g., 'sudo make install'
+quiet_cmd_compile.h = UPD     $@
+define cmd_compile.h
+    if [ ! -r $@ -o -O $@ ]; then \
+	sed -e 's/@@date@@/$(XEN_BUILD_DATE)/g' \
 	    -e 's/@@time@@/$(XEN_BUILD_TIME)/g' \
 	    -e 's/@@whoami@@/$(XEN_WHOAMI)/g' \
 	    -e 's/@@domain@@/$(XEN_DOMAIN)/g' \
@@ -440,10 +434,17 @@ include/xen/compile.h: include/xen/compile.h.in .banner
 	    -e 's/@@subversion@@/$(XEN_SUBVERSION)/g' \
 	    -e 's/@@extraversion@@/$(XEN_EXTRAVERSION)/g' \
 	    -e 's!@@changeset@@!$(shell tools/scmversion $(XEN_ROOT) || echo "unavailable")!g' \
-	    < include/xen/compile.h.in > $@.new
+	    < $< > $(dot-target).tmp; \
+	sed -rf tools/process-banner.sed < .banner >> $(dot-target).tmp; \
+	mv -f $(dot-target).tmp $@; \
+    fi
+endef
+
+include/xen/compile.h: include/xen/compile.h.in .banner FORCE
 	@cat .banner
-	@sed -rf tools/process-banner.sed < .banner >> $@.new
-	@mv -f $@.new $@
+	$(call if_changed,compile.h)
+
+targets += include/xen/compile.h
 
 asm-offsets.s: arch/$(TARGET_ARCH)/$(TARGET_SUBARCH)/asm-offsets.c
 	$(CC) $(call cpp_flags,$(c_flags)) -S -g0 -o $@.new -MQ $@ $<
-- 
Anthony PERARD


