Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 210133257A8
	for <lists+xen-devel@lfdr.de>; Thu, 25 Feb 2021 21:30:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89957.170023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNHU-00081P-RD; Thu, 25 Feb 2021 20:30:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89957.170023; Thu, 25 Feb 2021 20:30:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFNHU-00080i-Mc; Thu, 25 Feb 2021 20:30:40 +0000
Received: by outflank-mailman (input) for mailman id 89957;
 Thu, 25 Feb 2021 20:30:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3W+l=H3=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lFNHT-00080O-Tw
 for xen-devel@lists.xenproject.org; Thu, 25 Feb 2021 20:30:39 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b336a773-bd63-4dcb-99ea-ee13014eb19f;
 Thu, 25 Feb 2021 20:30:38 +0000 (UTC)
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
X-Inumbo-ID: b336a773-bd63-4dcb-99ea-ee13014eb19f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614285038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8hVN7Jd1M433kecw5Oj1hJjCQjf9Moi2LnCMo4tdjc8=;
  b=PnHBjyDuSIgH/mNyiTj8N5Dn61ciBVwhrAhRGtNCpEV9kp5uneIVr743
   FhBlvDLimJ9wWT7Y2P0+YuIe0J/aVo+w3uP3arhMdsab1GIeomss/5ECO
   XTwqEgol8x4ky/fbI2UMuG/J0Peu1GZt8WFkTC4XVmgMNaLTqyykS2/eX
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ie/i33Gei64ljV6YdDzbwAvj2LHGW1RD5fqq8cdzwZCw3SJMDR/sr0A65QKgKfL1KiYvRTaAma
 wWm1R6HZw5QFP1YaRMbFw+ae+L32Ztf4C0rFbN4hbO9ozDESgcg6FmYPZXvzqo51j3WMYzq4hl
 Jn/o/1bxZGEE9SPrJn+3/7G5ut7OMKeBJoCjZldZTwtJEY5L3a0YWM1j1Hc+2iq/wBgDq5d4Mj
 S6hwVnQNFvEaOgU5LNG0tAxf/H3A7Zb5sr0kbWdj5v7MepBt6s9FrlANNYrhCNLyOBW1uVEa02
 acs=
X-SBRS: 5.2
X-MesageID: 38050464
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,207,1610427600"; 
   d="scan'208";a="38050464"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: [PATCH 2/3] tools/firmware: Build firmware as -ffreestanding
Date: Thu, 25 Feb 2021 20:30:08 +0000
Message-ID: <20210225203010.11378-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210225203010.11378-1-andrew.cooper3@citrix.com>
References: <20210225203010.11378-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

firmware should always have been -ffreestanding, as it doesn't execute in the
host environment.

inttypes.h isn't a freestanding header, but the 32bitbios_support.c only wants
the stdint.h types so switch to the more appropriate include.

This removes the build time dependency on a 32bit libc just to compile the
hvmloader and friends.

Update README and the TravisCI configuration.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Ian Jackson <iwj@xenproject.org>

For 4.15.  Build tested in Travis (Ubuntu) and XenServer (CentOS) - no change
in the compiled HVMLoader binary.  I'm currently rebuilding the containers
locally to check Arch, Debian and OpenSUSE, but don't anticipate any problems.

This does not resolve the build issue on Alpine.  Exactly what to do there is
still TBC, but Roger has opened a bug with Apline concerning their GCC
packaging.
---
 .travis.yml                                  | 1 -
 README                                       | 3 ---
 tools/firmware/Rules.mk                      | 2 +-
 tools/firmware/hvmloader/32bitbios_support.c | 2 +-
 4 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/.travis.yml b/.travis.yml
index 15ca9e9047..2362475f7a 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -58,7 +58,6 @@ addons:
             - acpica-tools
             - bin86
             - bcc
-            - libc6-dev-i386
             - libnl-3-dev
             - ocaml-nox
             - libfindlib-ocaml-dev
diff --git a/README b/README
index 33cdf6b826..5167bb1708 100644
--- a/README
+++ b/README
@@ -62,9 +62,6 @@ provided by your OS distributor:
     * GNU bison and GNU flex
     * GNU gettext
     * ACPI ASL compiler (iasl)
-    * Libc multiarch package (e.g. libc6-dev-i386 / glibc-devel.i686).
-      Required when building on a 64-bit platform to build
-      32-bit components which are enabled on a default build.
 
 In addition to the above there are a number of optional build
 prerequisites. Omitting these will cause the related features to be
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index 26bbddccd4..93abcabc67 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -16,4 +16,4 @@ CFLAGS += -Werror
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
 
 # Extra CFLAGS suitable for an embedded type of environment.
-CFLAGS += -fno-builtin -msoft-float
+CFLAGS += -fno-builtin -msoft-float -ffreestanding
diff --git a/tools/firmware/hvmloader/32bitbios_support.c b/tools/firmware/hvmloader/32bitbios_support.c
index 6f28fb6bde..cee3804888 100644
--- a/tools/firmware/hvmloader/32bitbios_support.c
+++ b/tools/firmware/hvmloader/32bitbios_support.c
@@ -20,7 +20,7 @@
  * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <inttypes.h>
+#include <stdint.h>
 #include <xen/libelf/elfstructs.h>
 
 #include "util.h"
-- 
2.11.0


