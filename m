Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8381EBF4F
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jun 2020 17:48:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jg990-0002g8-Vz; Tue, 02 Jun 2020 15:48:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g7Yl=7P=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jg98z-0002g3-Na
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 15:48:01 +0000
X-Inumbo-ID: 6ed22e58-a4e8-11ea-ac2c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6ed22e58-a4e8-11ea-ac2c-12813bfff9fa;
 Tue, 02 Jun 2020 15:47:59 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WG0yBtzVoLjaZ8Z0nvlOcMIIOaHUvHbOHixTxHma52lOACGW/5wkEke0E6aEl9RtN1UbMcnHxZ
 jRxXPDRo1mCWOi7kCr3zsQlw3+AG4hjXxvZQmtlUZm3Zq9nIdb7ainGi+Yt+o9o+iw+ZjD68e6
 WGiG6TGkMU0941sR/g1FSas90YJXHuGRpbvXzwvL6GQjYU9Kgovj7qA9GUnQpUXjB2UqkjkhS5
 +VvzstNUWGmDztKIUb+gwjPpYPnatZ8VW0wyQxip3jbmRu1PWldEQEhnD6rYYubnSGbBWOUU04
 Vp0=
X-SBRS: 2.7
X-MesageID: 19386188
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,465,1583211600"; d="scan'208";a="19386188"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <libvir-list@redhat.com>
Subject: [PATCH] autogen.sh: Restore --no-git (avoid git submodule update)
Date: Tue, 2 Jun 2020 16:47:45 +0100
Message-ID: <20200602154745.15054-1-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Prior to 2621d48f005a "gnulib: delete all gnulib integration",
one could pass ./autogen.sh --no-git to prevent the libvirt build
system from running git submodule update.

This feature is needed by systems like the Xen Project CI which want
to explicitly control the revisions of every tree.  These will
typically arrange to initialise the submodules check out the right
version of everything, and then expect the build system not to mess
with it any more.

Despite to the old documentation comments referring only to gnulib,
the --no-git feature is required not only because of gnulib but also
because of the other submodule, src/keycodemapdb.

(And in any case, even if it were no longer required because all the
submodules were removed, it ought ideally to have been retained as a
no-op for compaibility reasons.)

So restore the --no-git feature.

Because of the way the argument parsing of autogen.sh works, it is
easiest to recognise this option only if it comes first.  This works
for the Xen Project CI, which has always passed this option first.

If something else is using this option (and hasn't introduced a
different workaround in the meantime), not in the first position,
then perhaps a more sophisticated approach will be needed.  But I
think this will do for now.

Signed-off-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
 autogen.sh | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/autogen.sh b/autogen.sh
index 4e1bbceb0a..1c98273452 100755
--- a/autogen.sh
+++ b/autogen.sh
@@ -1,5 +1,10 @@
 #!/bin/sh
 # Run this to generate all the initial makefiles, etc.
+#
+# THe following options must come first.  All other or subsequent
+# arguments are passed to configure:
+#   --no-git   skip `git submodule update --init`
+
 test -n "$srcdir" || srcdir=$(dirname "$0")
 test -n "$srcdir" || srcdir=.
 
@@ -13,7 +18,11 @@ cd "$srcdir"
     exit 1
 }
 
-git submodule update --init || exit 1
+if [ "x$1" = x--no-git ]; then
+	shift
+else
+	git submodule update --init || exit 1
+fi
 
 autoreconf --verbose --force --install || exit 1
 
-- 
2.11.0


