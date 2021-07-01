Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5970E3B92E8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 16:10:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148707.274842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOi-0006Mx-Vr; Thu, 01 Jul 2021 14:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148707.274842; Thu, 01 Jul 2021 14:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyxOi-0006KQ-SN; Thu, 01 Jul 2021 14:10:32 +0000
Received: by outflank-mailman (input) for mailman id 148707;
 Thu, 01 Jul 2021 14:10:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXwC=LZ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1lyxOg-0005tj-Vv
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 14:10:31 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55f3a9fb-720c-452f-92ed-fae6b830b800;
 Thu, 01 Jul 2021 14:10:28 +0000 (UTC)
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
X-Inumbo-ID: 55f3a9fb-720c-452f-92ed-fae6b830b800
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625148628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WNQw53D2CBl7IfW7DXoevzSfofTFknY56S4ZzC5yIeA=;
  b=I088QyBYbmJgARWg3Rl1kWwYGKh6OVysOFfctpmQYsAubBdFIKYgeTnm
   ZlQdcg2xM0y3FfYb4JNNyqZN5ibFk1BE7nn9S7xc6uV+sROVx3m/pZbiE
   +SBh5maz81JC7ojjj7EyO7Pl02efi6Of4zPCe12jcxA2Y9W1SyEO2aAWn
   A=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: R+4i4GvhQ/bsJUtm/f25GRNBFTY3QnEzZIDpOXXFfnM5XPyNmcnKTNMALl1I858HTbrVLZVixL
 FgY6jes9ShraMHqbhQlMzSz8xTfRFUc9jB7H1cETWgAamV0+K9rrCleR8qbkJ0a0BRdAQ9eYaP
 nUvRrZOqNNPCZlfHQPUvTRpOcY27WfA4TJ5l//hJnCFFvDQvJ2gox59VU6cgAH4FAwStzGRh0f
 IvuCpRqKjohQzU3SLVpZMJktlV2zWnSMmKVSs5/fCBnhAyBheMMWULR8HDZNLd5afZ0WMwzF3W
 Izk=
X-SBRS: 5.1
X-MesageID: 47093323
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fExu1qhU81WMd6RejdhUkxV2BnBQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.83,314,1616472000"; 
   d="scan'208";a="47093323"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v6 07/31] build,include: rework compat-build-source.py
Date: Thu, 1 Jul 2021 15:09:47 +0100
Message-ID: <20210701141011.785641-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210701141011.785641-1-anthony.perard@citrix.com>
References: <20210701141011.785641-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Improvement are:
- give the path to xlat.lst as argument
- include `grep -v` in compat-build-source.py script, we don't need to
  write this in several scripted language.

Also remove dependency on Makefile as the file generation doesn't
depend on it anymore.

No changes in final compat/%.h headers.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v6:
    - remove dependency on Makefile as it's not needed anymore
    
    v5:
    - removed "have 'xlat.lst' path as a variable" from the patch.
    
    v4:
    - new patch

 xen/include/Makefile             | 5 ++---
 xen/tools/compat-build-source.py | 8 +++++++-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index c8ca97eed0fc..be3b81485bdc 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -59,10 +59,9 @@ compat/%.h: compat/%.i Makefile $(BASEDIR)/tools/compat-build-header.py
 compat/%.i: compat/%.c Makefile
 	$(CPP) $(filter-out -Wa$(comma)% -include %/include/xen/config.h,$(XEN_CFLAGS)) $(cppflags-y) -o $@ $<
 
-compat/%.c: public/%.h xlat.lst Makefile $(BASEDIR)/tools/compat-build-source.py
+compat/%.c: public/%.h xlat.lst $(BASEDIR)/tools/compat-build-source.py
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


