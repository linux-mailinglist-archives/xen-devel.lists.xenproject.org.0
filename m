Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7D7559E0D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355617.583482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnu-0000xv-Ry; Fri, 24 Jun 2022 16:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355617.583482; Fri, 24 Jun 2022 16:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnu-0000r3-BG; Fri, 24 Jun 2022 16:05:06 +0000
Received: by outflank-mailman (input) for mailman id 355617;
 Fri, 24 Jun 2022 16:05:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnr-0004qc-VN
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:05:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67526923-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:05:02 +0200 (CEST)
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
X-Inumbo-ID: 67526923-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086702;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nUZOfBqCn5La2Rq50ef3cLNXGuInKFbPM4f0Kz8ZjEw=;
  b=U44QaZfzvIGNLuSYSB9zt5XpFF9/XG2Je3fBcg6RPSi9hqrVzuLsbuEj
   hP31PnuMAcIul5Og0zg3BmPQ+xXFy5ZVwKnIipdo4XhCYrSvGNETgAIEo
   RkuE9qLimGzK7XuursGTezh5a57V0/T2BoHjFDWXfJRQl4gZImPM+LhmR
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74787718
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Pekj9qzCshs3SyY3t+x6t+dvxirEfRIJ4+MujC+fZmUNrF6WrkVRn
 WoWDWGGOfnbYGrwf9Ena4i18U0HucPRnNAwGQRo+CAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY224ThWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplhbKpQwITIpLwg8MCSD5hShpUEIQc5+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6BO
 5VJNmU2PHwsZTVEE2YlBq46u9uJi0ftXxlfqHufqek4tj27IAtZj+G2bYu9lsaxbcdahEGDv
 Urd4n/0RBodMbS31j6t4n+qwOjVkkvTSI8UUbG16PNuqFmS3XAITg0bU0Ohpvu0gVL4XMhQQ
 3H44QJ38/J0rhbyCICgAVvo+xZooyLwRfJgPfQw7TuR9ZbPxBmCIVFddRRsQYY54ZpeqSMR6
 rOZoz/4LWUx7ePNEi/Fqef8QSCaYnZMczJbDcMQZU5cuoS4/tlu5v7aZow7eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5GxlkgDGJdT9b0gWU3FN4ZRGpjcnGPv
 WIfh++V5/0UAJeGmUSlGbtQQunxtq/abGWE3jaD+qXNERz3oxZPmqgAiAyS2W8zappUEdMXS
 BW7VfxtCG97YyLxMP4fj3OZAMU216nwfenYugTvRoMWOPBZLVbflAk3PBL49z29wSAEzPBkU
 b/GIJnEMJrvIfk+pNZAb7xGiuFDK+FX7T67eK0XODz9gOTHOiLKGOxbWLZMB8hghJ65TMzu2
 443H6O3J993C4USvgG/HVYvEG03
IronPort-HdrOrdr: A9a23:lsjL9q4JE9CmtxjY7QPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74787718"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v3 17/25] libs/libs.mk: Rework target headers.chk dependencies
Date: Fri, 24 Jun 2022 17:04:14 +0100
Message-ID: <20220624160422.53457-18-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is no need to call the "headers.chk" target when it isn't
wanted, so it never need to be .PHONY.

Also, there is no more reason to separate the prerequisites from the
recipe.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/libs.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 7aee449370..f778a7df82 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -55,22 +55,20 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
 .PHONY: all
-all: headers.chk $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
+all: $(TARGETS) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
 
 ifneq ($(NO_HEADERS_CHK),y)
-headers.chk:
+all: headers.chk
+
+headers.chk: $(LIBHEADERS) $(AUTOINCS)
 	for i in $(filter %.h,$^); do \
 	    $(CC) -x c -ansi -Wall -Werror $(CFLAGS_xeninclude) \
 	          -S -o /dev/null $$i || exit 1; \
 	    echo $$i; \
 	done >$@.new
 	mv $@.new $@
-else
-.PHONY: headers.chk
 endif
 
-headers.chk: $(LIBHEADERS) $(AUTOINCS)
-
 headers.lst: FORCE
 	@{ set -e; $(foreach h,$(LIBHEADERS),echo $(h);) } > $@.tmp
 	@$(call move-if-changed,$@.tmp,$@)
-- 
Anthony PERARD


