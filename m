Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BC560E0F1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 14:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430531.682317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfh5-0004GD-3r; Wed, 26 Oct 2022 12:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430531.682317; Wed, 26 Oct 2022 12:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onfh5-0004DK-0v; Wed, 26 Oct 2022 12:39:39 +0000
Received: by outflank-mailman (input) for mailman id 430531;
 Wed, 26 Oct 2022 12:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JODj=23=citrix.com=prvs=291bfe38a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1onfh3-0004DE-9D
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 12:39:37 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e1e2224-552b-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 14:39:35 +0200 (CEST)
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
X-Inumbo-ID: 3e1e2224-552b-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666787974;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=bw9rQV/0FLFKekMb2yQK28V59IeT0f8Ipt+Y9TkCWig=;
  b=gMnTY6OE+lRF+XqHW//kMN2XeyBrj6o4l90VcjuLKwn3I6Ko4eFllrP2
   7pVbl5zj6E8wyJijwCIqmOBMuQj547meZFVKA3DItxD9muxgyifcMiWb1
   cpYZQU5kc/vb6qOV/GBxwko71GFJcMOofp9lTd1zMKIcqxEP7uRvEcJyb
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 83964485
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:1/YPsKqbbidrS24+E4UUeyp5hwheBmLTZRIvgKrLsJaIsI4StFCzt
 garIBnVO/nbamv9fo1zao3joEIDv5Ddm9c3TwpkqSlgQi4Q8puZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgR4geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mz
 /UZCB4raSq62byE6vWmU7hI2J9yFZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0FxRfG+
 j6WogwVBDk+P5+A9B3eqEiAue6SlwnbXq4JFfq3o6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80igzqak/8mS7Q9+7WAe3yFaksxgGSpxvGus1wAiXz+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8jxm/JCwUJm8qfjIfQE0O5NyLiJookhvFQ9JnEai0pt74Azf9x
 3aNtidWulkIpZdVjePhpwmB2m/y4MiSJuIo2unJdlis7yNXQomfXtL223Kc8O8RCNjCH2DU6
 RDohPOixOwJCJiMkgmET+MMAKyl6p65DdHMvbJ8N8J/rmrwohZPaagVuWgjfxkxbq7obBezO
 CfuVRVtCIi/1ZdARYt+eMqPBssj1sAM/vy1B6mPPrKijnWcHTJrHR2Ch2bKgQgBc2B2y8nT3
 Kt3lu71VB4n5VxPlmbeegvk+eZDKtoC7W3SX4vn6B+szKCTYnWYIZ9cbgXQMbpjvfrd+l2Im
 zq6Cydt40wBONASnwGNqdJDRbz0BSRT6W/KRzx/KbfYf1sO9JAJAP7N27IxE7GJbIwM/tokC
 kqVAxcCoHKm3CWvAVzTOhhehEbHAM8XQYQTZnd3Yz5FGhELPO6S0UvoX8JpJ+l5qbY6lK4co
 jtsU5zoP8mjgw/vo1w1BaQRZqQyHPh3rWpi5xaYXQU=
IronPort-HdrOrdr: A9a23:5DJwx65XTupAn/I4KwPXwNzXdLJyesId70hD6qhwISY7TiX4rb
 HLoB11737JYVoqNU3I+urwXZVoI0m9yXcd2+B4Vt2ftWHdyQmVxepZg7cKrQeNJ8SHzJ8/6Z
 td
X-IronPort-AV: E=Sophos;i="5.95,214,1661832000"; 
   d="scan'208";a="83964485"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH] CI: Drop more TravisCI remnants
Date: Wed, 26 Oct 2022 13:39:06 +0100
Message-ID: <20221026123906.10421-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

This was missed from previous attempts to remove Travis.

Fixes: e0dc9b095e7c ("CI: Drop TravisCI")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>

Preforably for 4.17.  Not a bugfix, but this does reduce the amount of
irrelevant junk in the tree.
---
 MAINTAINERS          |  1 -
 scripts/travis-build | 32 --------------------------------
 2 files changed, 33 deletions(-)
 delete mode 100755 scripts/travis-build

diff --git a/MAINTAINERS b/MAINTAINERS
index 816656950ae2..175f10f33fc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -274,7 +274,6 @@ W:	https://gitlab.com/xen-project/xen
 S:	Supported
 F:	.gitlab-ci.yml
 F:	automation/
-F:	scripts/travis-build
 
 CPU POOLS
 M:	Juergen Gross <jgross@suse.com>
diff --git a/scripts/travis-build b/scripts/travis-build
deleted file mode 100755
index 84d74266a01f..000000000000
--- a/scripts/travis-build
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/bash -ex
-
-$CC --version
-
-# random config or default config
-if [[ "${RANDCONFIG}" == "y" ]]; then
-    make -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
-else
-    make -C xen defconfig
-fi
-
-# build up our configure options
-cfgargs=()
-cfgargs+=("--disable-stubdom") # more work needed into building this
-cfgargs+=("--disable-rombios")
-cfgargs+=("--enable-docs")
-cfgargs+=("--with-system-seabios=/usr/share/seabios/bios.bin")
-
-# Qemu requires Python 3.5 or later
-if ! type python3 || python3 -c "import sys; res = sys.version_info < (3, 5); exit(not(res))"; then
-    cfgargs+=("--with-system-qemu=/bin/false")
-fi
-
-if [[ "${XEN_TARGET_ARCH}" == "x86_64" ]]; then
-    cfgargs+=("--enable-tools")
-else
-    cfgargs+=("--disable-tools") # we don't have the cross depends installed
-fi
-
-./configure "${cfgargs[@]}"
-
-make dist
-- 
2.11.0


