Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 496386BD965
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 20:38:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510809.789197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pctQO-0001Vu-W5; Thu, 16 Mar 2023 19:38:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510809.789197; Thu, 16 Mar 2023 19:38:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pctQO-0001Tp-Rt; Thu, 16 Mar 2023 19:38:08 +0000
Received: by outflank-mailman (input) for mailman id 510809;
 Thu, 16 Mar 2023 19:38:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lZp/=7I=citrix.com=prvs=432965e83=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pctQM-0001Th-KY
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 19:38:06 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0de374b6-c432-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 20:38:01 +0100 (CET)
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
X-Inumbo-ID: 0de374b6-c432-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678995480;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mTISRMWZr8ba7nnJbNCCzyiScF6I+/PfZRJYstrMh00=;
  b=JPPk9zlJqhHVRyF9XoSf2+733gm37PPMj4RqCmyZ5uM8TbfizFXmMRlW
   c8E75pGEYum+CCbIo7A9GVhGhPbkLcl38BmMbd0+G6VwzlSecLyvVn3br
   8uxpKeoDTLjzZLxYnJ9aMiElgzn+wMg9KRs1D5rC4e9uBqwO3eZdfQd6s
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100541595
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:0xki3aj4kE6ef2wZiLHY8unzX161fxAKZh0ujC45NGQN5FlHY01je
 htvW2+DM/vbN2LyeYx/OYzgpx9VvMPXxt41TFRspX8xEiob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5waAzyZ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQXBwI/f0iawNmp66n4TbRT1+0PAu/SadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 jqboz2kU0xy2Nq3lT2340jwnMb2o3npBN0ZDb26371YjwjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O/I+wBGAzOzT+QnxLm0NVDtIctElnM4wWz0x1
 1WNks/pBDpgq7mcQzSW8bL8kN+pEXFLdylYP3ZCFFZbpYC5++nfky4jUP5sP5yHn4XsXgrv6
 CvJq3UB1pw/o+gygvDTEU/8vxqgoZ3ATwgQ7wrRX3644g4RWLNJd7BE+nCAs68ecd/xok2p+
 SFdxpPAtLxm4YSlznTlfQkbIF2+Cx9p2hX4iEUnIZQu/i/FF5WLLdEJu2EWyKuE3685ld7Vj
 K374185CHx7ZiHCgUpLj2WZWqwXIVDIT4iNaxwtRoMmjmJNXAGG5jpyQkWbwnrglkMh+YlmZ
 8jLIJf1XC9AVfo4pNZTewv6+e5D+8zD7TmLGcCTI+qPiNJym0J5uZ9aaQDTP4jVHYuPoRnP8
 sY3CvZmPy53CbWkCgGOqN57ELz/BSRjbXwAg5ANJ7Hrz8sPMD1JNsI9Npt+JdY9w/wIyrmgE
 7PUchYw9WcTTEbvcW2iAk2Popu2NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:F+Qf9K5yglcXnd791gPXwbOBI+orL9Y04lQ7vn2ZhyYlFvBw9v
 re6MjzsCWe5gr5N0tBpTn+Atj+fZqxz/9ICOoqTMWftXfdyQmVxehZhOOJ/9SKIVycygcy79
 YET0B0YOeAc2ST5azBjDVReLwbr+VuP8qT6Nv2/jNVaUVPVokl1gF+D2+gYzhLrMstP+tJKH
 JZjPA31AZJvB4sH7SG7wI+Lo/+juyOrovifRkFQzY/8WC1/EuVwY+/KQGcwhAdFxhSwbIumF
 K17zDR1+GYqvSmzR2Z8GfW4/1t6b3c4+oGPtWIls8WbhPzjQqyDb4RIoGqjXQOueSy71Rvqv
 ngyi1QRPhb2jfqZ2Sophmo4QX6zzo0zHfnxTaj8AHeiP28fis+F81Cwb1UaQHY7U1IhqAA7J
 52
X-IronPort-AV: E=Sophos;i="5.98,265,1673931600"; 
   d="scan'208";a="100541595"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bernhard Kaindl
	<bernhard.kaindl@citrix.com>
Subject: [PATCH v2 5/7] tools: Use -s for python shebangs
Date: Thu, 16 Mar 2023 19:37:44 +0000
Message-ID: <20230316193744.1077012-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314141520.3652451-6-andrew.cooper3@citrix.com>
References: <20230314141520.3652451-6-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is mandated by the Fedora packaging guidelines because it is a security
vulnerability otherwise in suid scripts.  While Xen doesn't have suid scripts,
it's a very good idea generally, because it prevents the users local python
environment interfering from system packaged scripts.

pygrub is the odd-script-out, being installed by distutils rather than
manually with INSTALL_PYTHON_PROG.  distutils has no nice way of editing the
shebang, so arrange to use INSTALL_PYTHON_PROG on pygrub too.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>

v2:
 * Remove accidental setuputils dependency.
---
 tools/Rules.mk        | 2 +-
 tools/pygrub/Makefile | 4 +++-
 tools/pygrub/setup.py | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 6e135387bd7e..18cf83f5be83 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -179,7 +179,7 @@ CFLAGS += $(CFLAGS-y)
 CFLAGS += $(EXTRA_CFLAGS_XEN_TOOLS)
 
 INSTALL_PYTHON_PROG = \
-	$(XEN_ROOT)/tools/python/install-wrap "$(PYTHON_PATH)" $(INSTALL_PROG)
+	$(XEN_ROOT)/tools/python/install-wrap "$(PYTHON_PATH) -s" $(INSTALL_PROG)
 
 %.opic: %.c
 	$(CC) $(CPPFLAGS) -DPIC $(CFLAGS) $(CFLAGS_$*.opic) -fPIC -c -o $@ $< $(APPEND_CFLAGS)
diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
index 29ad0513212f..4963bc89c6ed 100644
--- a/tools/pygrub/Makefile
+++ b/tools/pygrub/Makefile
@@ -18,8 +18,10 @@ build:
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
+	$(INSTALL_DIR) $(DESTDIR)/$(LIBEXEC_BIN)
 	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
-		--root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force
+		--root="$(DESTDIR)" --force
+	$(INSTALL_PYTHON_PROG) src/pygrub $(DESTDIR)/$(LIBEXEC_BIN)/pygrub
 	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
 	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
 	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
diff --git a/tools/pygrub/setup.py b/tools/pygrub/setup.py
index 0e4e3d02d372..502aa4df2dae 100644
--- a/tools/pygrub/setup.py
+++ b/tools/pygrub/setup.py
@@ -23,7 +23,6 @@ setup(name='pygrub',
       author_email='katzj@redhat.com',
       license='GPL',
       package_dir={'grub': 'src', 'fsimage': 'src'},
-      scripts = ["src/pygrub"],
       packages=pkgs,
       ext_modules = [ xenfsimage ]
       )
-- 
2.30.2


