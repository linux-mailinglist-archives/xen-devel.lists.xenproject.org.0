Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DE946A261
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239516.415383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTa-0002Ev-B5; Mon, 06 Dec 2021 17:08:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239516.415383; Mon, 06 Dec 2021 17:08:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTa-00029W-2w; Mon, 06 Dec 2021 17:08:30 +0000
Received: by outflank-mailman (input) for mailman id 239516;
 Mon, 06 Dec 2021 17:08:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOt-0005ti-I1
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:39 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7392cda0-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:36 +0100 (CET)
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
X-Inumbo-ID: 7392cda0-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ncr3lIi38E0siWJzJi6btExaNaeaiEW2/teWOIwBcPA=;
  b=XqLP5lf+8ZGqBKikfTLLnVMx2N3n96+HxSjcir0iQ2bzAtZkLyiAtXCK
   6VfT+cfGlmYaWi6VyfKVCWBNRgqeT1QqtQJUfdJm5Bo1yVfyFaRnjCI3r
   zLunzSnnE3NtdsZo9+lHhVqO8dlfTnY6KvHibjJVnPAvjN10A48CaL/0A
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Ek1RNuKqMkEJMUikv7DTFzl70J0nrxT6CuQdemUffhBIDJ/a2TxQgpNwYzDSS6JqcForF07C74
 v4oydXezartqG+ofeCK+cnAIBcboagjErP50ngRKTFP7UFtqlWksPNivnrR3M6eDmKtSlXtKD5
 a4HTmQ/cFWlN2uebgNLTG6R5SVgWefVQ3VYjs5RWXBjmweHw5JtmhX/0zx2OZqOoeHC6OFSvL2
 8d8i6MTgM3lFjhPtXti64qljJ/JsICkQaxkmKzrxh81WaGhjITsugSIE8TgqmG53eeBP0fho7D
 sbjJH/LOwzqSa1YSho6KvOqq
X-SBRS: 5.1
X-MesageID: 61420662
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:b9u3z67Cnf4KxuhWL6cLkAxRtN7AchMFZxGqfqrLsTDasY5as4F+v
 mEbWTqEM/+PajH1Ltxya9u+8EhX7JCBzIJqGVRl+H1gHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdj2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zx
 tJDlcGVZBcVEo7AoOYMbT1UGConIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQRKqEP
 5RHM1KDajz9chBmAmoIUakvlcmyoHKvKWZYhnOK8P9fD2/7k1UqjemF3MDuUt2VR+1Fk0CAv
 GXE8m/lRBYAO7S31j6t4n+qwOjVkkvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 2Qd/DYuqq4jslSmVNDnUzW3pXeFulgXXN84LgEhwFjTkOyOuV/fXzVaCG4aADA7iCMobTIt2
 H/Uuv75ORBMvIWXWEy5+ryf9CznbED5MlQ+TSMDSAIE5fzqr4cykg/DQ75fLUKlsjHmMWqum
 m7X9UDSk51W1JdWjPvjoTgrlhr1/sCRJjPZ8Dk7SY5MAulRQIe+L7Kl5lHAhRqrBNbIFwLR1
 JTodiX30QzvMX1vvHHUKAnuNOvwjxpgDNE6qQQ1d3XG327yk0NPhagKvFlDyL5Ba67ogwPBb
 k7Joh9275ROJnasZqIfS9vvUJR1l/m9T467CaC8gj9yjn5ZLlXvEMZGPxH44owQuBJ0zfFX1
 WmzL65A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI50/P7FZqX1bMEe1tGALXNogRtfrYyC2Io
 4c3H5bbkH13DbyhChQ7BKZOdDjm21BgXsuowyGWH8beSjdb9JYJV6WMnOh/ItM9xMy4VI7gp
 xmAZ6OR83Kn7VWvFOlAQisLhGrHUcktoHQlEzYrOFr0iXEvbZz2tPUUdoctfKlh/+tmlKYmQ
 /4AcsSGI/JOVjWYpGhNMcij9NRvJEaxmAaDHyu5ezxjLZRucBPEp43/dQz1+ShQUifu7Zkio
 6et3x/wSIYYQ1gwF97fbf+ilgvjvXUUlO9ocVHPJ91fJBfl/IRwcnSjhf4rOcAcbx7Ew2LCh
 QqRBB4Zo8jLopM0r4aV1fzV8d/xHrInTERAHmTd4bKnDgXg/zKukd1aTeKFXTHBT2eoqq+sU
 vpYkqPnO/odkVcU74clS+R3zbgz7sfErqNBylg2B23CalmmB+8yInSC2sUT5KRByqUA5FmzU
 0OLvNJbJa+IKIXuF1tIfFgpaeGK1Pc1nDjO7KtqfBWmtXEvpLfXA19POxSsiTBGKOonOYwo9
 u4tpcoK5lHtkREtKNuH0nhZ+mnkwqbsiEn7WkX22LPWtzc=
IronPort-HdrOrdr: A9a23:Ap5ncKG7vr5hDYJHpLqE4seALOsnbusQ8zAXP0AYc3Nom6uj5q
 WTdZUgpHjJYVkqOU3I9ersBEDiewK/yXcW2+ks1N6ZNWGM0ldARLsSibcKqAePJ8SRzIJgPN
 9bAstDNOE=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="61420662"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 21/57] tools/include/xen-foreign: avoid to rely on default .SUFFIXES
Date: Mon, 6 Dec 2021 17:02:04 +0000
Message-ID: <20211206170241.13165-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When a rule isn't a pattern rule, and thus don't have a %, the
value of the automatic variable stem $* depends on .SUFFIXES. GNU make
manual explain that it is better to avoid this "bizarre" behavior
which exist for compatibility.

Use $(basename ) instead. So we can one day avoid make's build-in
rules and variables.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/xen-foreign/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/include/xen-foreign/Makefile b/tools/include/xen-foreign/Makefile
index e395011fdd..6ce51daf5e 100644
--- a/tools/include/xen-foreign/Makefile
+++ b/tools/include/xen-foreign/Makefile
@@ -25,28 +25,28 @@ check-headers: checker
 	rm tmp.size
 
 arm32.h: mkheader.py structs.py $(ROOT)/arch-arm.h $(ROOT)/xen.h
-	$(PYTHON) $< $* $@.tmp $(filter %.h,$^)
+	$(PYTHON) $< $(basename $@) $@.tmp $(filter %.h,$^)
 	#Avoid mixing an alignment directive with a uint64_t cast or sizeof expression
 	sed 's/(__align8__ \(uint64_t\))/(\1)/g' < $@.tmp > $@.tmp2
 	rm $@.tmp
 	$(call move-if-changed,$@.tmp2,$@)
 
 arm64.h: mkheader.py structs.py $(ROOT)/arch-arm.h $(ROOT)/xen.h
-	$(PYTHON) $< $* $@.tmp $(filter %.h,$^)
+	$(PYTHON) $< $(basename $@) $@.tmp $(filter %.h,$^)
 	#Avoid mixing an alignment directive with a uint64_t cast or sizeof expression
 	sed 's/(__align8__ \(uint64_t\))/(\1)/g' < $@.tmp > $@.tmp2
 	rm $@.tmp
 	$(call move-if-changed,$@.tmp2,$@)
 
 x86_32.h: mkheader.py structs.py $(ROOT)/arch-x86/xen-x86_32.h $(ROOT)/arch-x86/xen.h $(ROOT)/xen.h
-	$(PYTHON) $< $* $@.tmp $(filter %.h,$^)
+	$(PYTHON) $< $(basename $@) $@.tmp $(filter %.h,$^)
 	#Avoid mixing an alignment directive with a uint64_t cast or sizeof expression
 	sed 's/(__align8__ \(uint64_t\))/(\1)/g' < $@.tmp > $@.tmp2
 	rm $@.tmp
 	$(call move-if-changed,$@.tmp2,$@)
 
 x86_64.h: mkheader.py structs.py $(ROOT)/arch-x86/xen-x86_64.h $(ROOT)/arch-x86/xen.h $(ROOT)/xen.h
-	$(PYTHON) $< $* $@.tmp $(filter %.h,$^)
+	$(PYTHON) $< $(basename $@) $@.tmp $(filter %.h,$^)
 	#Avoid mixing an alignment directive with a uint64_t cast or sizeof expression
 	sed 's/(__align8__ \(uint64_t\))/(\1)/g' < $@.tmp > $@.tmp2
 	rm $@.tmp
-- 
Anthony PERARD


