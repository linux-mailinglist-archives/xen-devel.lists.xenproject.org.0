Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A533F5C64
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 12:51:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170902.311957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1U-0003dO-Pr; Tue, 24 Aug 2021 10:51:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170902.311957; Tue, 24 Aug 2021 10:51:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIU1U-0003aO-J6; Tue, 24 Aug 2021 10:51:16 +0000
Received: by outflank-mailman (input) for mailman id 170902;
 Tue, 24 Aug 2021 10:51:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU1T-0001EC-8L
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:51:15 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7d11996-2282-4cd7-9e1f-89089d3a8aef;
 Tue, 24 Aug 2021 10:50:57 +0000 (UTC)
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
X-Inumbo-ID: a7d11996-2282-4cd7-9e1f-89089d3a8aef
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Co6H7lVgiBUcy/feyke8bR5ma3P4dUmv5ksGl3mwp9c=;
  b=RyECNtla7WtKLhP5VrS8g/QrmUQJMJolbUA1qa5P6/f491WdC9XijfJP
   mpPQre//fSm6xIB0DjId1zlqVhjjZMt0kYZ+j+UXUeNiyJ+zfMrJ+m+LU
   rZFZnIkkn3D0GTnY88jBQr8DgAXmFbAHvBJZZeU1BLyJvANXOS0arcsaC
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3p1CextGzq0q9aOS4LAZ0UORCqraVkDsfc8ZpkLWAm/jshJ1BrfugFW/tAN4978p8Zbeh0HTYH
 +o6E6ZTkmAY19T3sZccjzvO9k2K8N3Sd1HOW2bm328Bu2iJJWN/SkHpIuWLub6TXJ/l9i7WHVA
 i6e/qN2PRifvasRCLCqBBkTUvi15uhJocjwq++34kURssTIAI3gPcIDbMHzui08WDLoFqL/E9e
 9vIFOhVtWDy332c4aKbix3jMJcSO+0w5uwMgEiirF/Joqi8R+rcCYHetqbaRnxLn6mk422Ub/i
 DNXXlDvNm3di2srvJsL160cj
X-SBRS: 5.1
X-MesageID: 52875430
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/dW1DqGBbYKpD/ZypLqFVJHXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskd2ZJkh8erhBEDyewKkyXcV2/hbAV7MZniDhILFFu9fBOjZsnfd8k/Fh4lgPM
 5bGsATZ+EYZmIK7voSlTPIdurIt+P3kpxA692+815dCSVRL41w5QZwDQiWVmdsQhNdOJY/HJ
 2AouJaujuJYx0sH4iGL0hAe9KGi8zAlZrgbxJDLQUg8hOygTSh76O/OwSE3y0ZTyhEzd4ZgC
 f4ek3Cl+ueWsOAu1/hPlzontdrcRzau5l+7fm3+4kow/PX+0OVjcpaKvm/VXsO0ZmSAR4R4a
 LxSlEbTolOAjrqDxuIiAqo1A/63Dk07Xj+jVeenHv4uMT8ACk3EsxbmOtiA23kAmcbzaVBOZ
 hwrhWkXltsfGL9tTW448KNWwBhl0Kyr3ZnmekPj2ZHWY9bbLNKt4QQ8E5cDZ9FRUvBmcgaOf
 grCNuZ6OddcFucYXyctm5zwMa0VnB2GhudWEANtsGczjATlnFkyEkTwtAZgx47hdsAYogB4/
 6BPrVjlblIQMNTZaVhBP0ZSc/yEWDJSQKkChPmHb0mLtB0B5vpke+I3FwY3pDXRHU49upApH
 2aaiIkiYcbQTOQNeSemIZM7g3ABH6gWDiF8LAv26RE
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="52875430"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 06/51] build,include: rework compat-build-source.py
Date: Tue, 24 Aug 2021 11:49:53 +0100
Message-ID: <20210824105038.1257926-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Improvement are:
- give the path to xlat.lst as argument
- include `grep -v` in compat-build-source.py script, we don't need to
  write this in several scripted language.

No changes in final compat/%.h headers.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v7:
    - actually keep the dependency on Makefile
    
    v6:
    - remove dependency on Makefile as it's not needed anymore
    
    v5:
    - removed "have 'xlat.lst' path as a variable" from the patch.
    
    v4:
    - new patch

 xen/include/Makefile             | 3 +--
 xen/tools/compat-build-source.py | 8 +++++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index c8ca97eed0fc..4fa10e68f997 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -61,8 +61,7 @@ compat/%.i: compat/%.c Makefile
 
 compat/%.c: public/%.h xlat.lst Makefile $(BASEDIR)/tools/compat-build-source.py
 	mkdir -p $(@D)
-	grep -v 'DEFINE_XEN_GUEST_HANDLE(long)' $< | \
-	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py >$@.new
+	$(PYTHON) $(BASEDIR)/tools/compat-build-source.py xlat.lst <$< >$@.new
 	mv -f $@.new $@
 
 compat/.xlat/%.h: compat/%.h compat/.xlat/%.lst $(BASEDIR)/tools/get-fields.sh Makefile
diff --git a/xen/tools/compat-build-source.py b/xen/tools/compat-build-source.py
index 2bcaf27d05a3..274d6917ab7f 100755
--- a/xen/tools/compat-build-source.py
+++ b/xen/tools/compat-build-source.py
@@ -13,7 +13,11 @@ pats = [
  [ r"XEN_GUEST_HANDLE", r"COMPAT_HANDLE" ],
 ];
 
-xlatf = open('xlat.lst', 'r')
+try:
+    xlatf = open(sys.argv[1], 'r')
+except IndexError:
+    print('missing path to xlat.lst argument')
+    sys.exit(1)
 for line in xlatf.readlines():
     match = re.subn(r"^\s*\?\s+(\w*)\s.*", r"\1", line.rstrip())
     if match[1]:
@@ -25,6 +29,8 @@ for pat in pats:
     pat[0] = re.compile(pat[0])
 
 for line in sys.stdin.readlines():
+    if 'DEFINE_XEN_GUEST_HANDLE(long)' in line:
+        continue
     for pat in pats:
         line = re.sub(pat[0], pat[1], line)
     print(line.rstrip())
-- 
Anthony PERARD


