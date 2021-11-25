Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B95745DB7E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231262.400153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5q-0000za-JK; Thu, 25 Nov 2021 13:47:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231262.400153; Thu, 25 Nov 2021 13:47:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5q-0000wx-6n; Thu, 25 Nov 2021 13:47:18 +0000
Received: by outflank-mailman (input) for mailman id 231262;
 Thu, 25 Nov 2021 13:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0d-0007NX-UB
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:56 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 72fe5a02-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:54 +0100 (CET)
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
X-Inumbo-ID: 72fe5a02-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7q2b6ioZxw6miBARrIxzLFbv4WP2dzhNSHzrlYKQwac=;
  b=bG8QDzpd4HwPDCkJbFiGlif7FgjQUAJD8a7CQ9L6PK8UrUm0ezcMpbhf
   lZb0HJus1Fp4OKKRvhGKLw7po8oQ2UpOGoVsA1cXOGbiUnE+K2+Wyw862
   jUUejYejMLzVXku0pEYaKZCy8V9IHVJBEp6ygakyYKqSmxOh6eP2tg39H
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NAgK5Mclx2aJ6A4HFAKnMSqzl1JB86WHq5Wx/QDwFu7MJso88dYoOlV1VxrcHwzMUQdBMyAeRz
 MJyKhgUdkoTC/CHb7tueIhpvW+42Yy7mVRYWWiNxeh8u95TMqt6ak4EhVer4ZSZSnJSQkhkGv8
 83sxOAdV/tucq5HdIkKmZ2hK02TLP4MD4Z/jPYic1b/Swe1RF0Ow21xkooThL8kTNIMK2aKlS4
 pz+idZe/jbIR5mkiFBJZNR/pMiz2Pn7pfkRsHfWsDtA9C4lJMwChQWkZJ7TnX4mO7hTRVbc/XU
 x3EHKgvMCLDhxWgaHgnQ8D5o
X-SBRS: 5.1
X-MesageID: 60634177
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:8b61f605Knk94uHHNvbD5UR2kn2cJEfYwER7XKvMYLTBsI5bp2EFx
 2tJX2qHOP+DMDDzL9l2b4jioBkP7JLRnIJqTVM+pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wbNh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhvO8u8
 N9LrKyJEl0JMIDFhNQGTkVVDHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9u3p4VQa+BO
 KL1bxJEKz3vTA9fGW42GZNmmbmn12P/WS9X/Qf9Sa0fvDGIkV0ZPKLWGNjIft2HQ+1Fk0Deo
 XjJl0ziGQ0TPtGbzTuD81qvi/XJkCe9X5gdfJWn8tZ6jVvVwXYcYDUUX1ampfiyimalRslSb
 UcT/0IGvaU0sUCmUNT5dxm5u2Kf+A4RXcJKFO834x3LzbDbiy6QAHQESThQLsQrrsYsSRQl0
 1aIm5XiAjkHmLyKS1qN+7GMtzSwNCMJa2gYakc5oRAtuoe55ttp11SWE4glQPXdYsDJ9S/Y4
 A/VlCI4noUq1pQr2Yiy4WDcnm6huc2cJuIq3Tn/UmWg5wJ/QYeqYY209FTWhcp9wJalokqp5
 yZdxZXHhAwaJdTUzXHWHr1RdF28z6/daGW0vLJ5I3U2G91BEVaHdJsY3jxxLVwB3i0sKW6wO
 x+7Ve+8CfZu0JqWgU1fP93Z5ycCl/GI+THZuhf8NIcmX3SJXFXblByCnGbJt4wXrGAikLskJ
 bCQetu2AHARBMxPlWTtGLhCgO97l3pglAs/oKwXKDz9j9KjiIO9E+9ZYDNikMhlhE97nOkl2
 4kGbJbbo/mueOb/fjPW4eYuwaMidhAG6WTNg5UPLIare1M+cEl4UqO56e5xKuRNwvUO/s+Vr
 y7VZ6Ot4Aem7ZExAV7RMS4LhXKGdcsXkE/XygRwZwv1gCZ6Pt70hErdHrNuFYQaGCVY5aYcZ
 5E4lw+oW5yjkxzLpGYQa4fTtotneEj5jA6CJXP9MjM+Y4RhV0rC/dq9Jlnj8ywHDyyWs8oio
 uL/ilOHEMRbHwkyXtzLbP+Pzk+quSRPkuxFQEaVcMJYf1/h8dY2JnWp3OM3OcwFNT7K2iCei
 1SNGR4dqOSU+901/dDFiLqqtYCsF+ciTENWE3OCteS9NDXA/3rlyohFCb7acTfYXWLy2aOje
 eQKkK2sbKxZxA5H6tMuHaxqwKQy48rUi4Vblgk0Tm/Wa1mLC697JiXU18d4qaAQlKRSvhG7W
 xzT94ACa6mJIs7sDHUYOBEhMraYzfgRlzTfsaY1LUH96HMl9baLSxwPbRyFiSgbJ7ppKoI1h
 +wmvZdOuQC4jxMrNPeAjzxVqDvQfiBRDf1/u8FIGpLvhyoq1kpGMM7VBSLB6Z2Sb8lBbxsxK
 TiOiaue37lRyyIuqZbo+aQhCQaFuakzhQ==
IronPort-HdrOrdr: A9a23:aRF+L6rgNwlk7kZj8a/dtgoaV5oteYIsimQD101hICG8cqSj+P
 xG+85rsiMc6QxhIU3I9urgBEDtex7hHNtOkOss1NSZLW3bUQmTTL2KhLGKq1aLJ8S9zJ856U
 4JSdkZNDSaNzZHZKjBjDVQa+xQo+W6zA==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="60634177"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	"George Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v8 37/47] RFC, no-VPATH: build: remove --include-dir option from MAKEFLAGS
Date: Thu, 25 Nov 2021 13:39:56 +0000
Message-ID: <20211125134006.1076646-38-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

File "include/config/auto.conf" and "include/config/auto.conf.cmd"
should be included from the build tree even if they are present in the
source tree. Avoiding to use make's command line option --include-dir
will have make include the right "auto.conf" file. But that mean we
now need to specify $(srctree) for all other Makefile we include.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Makefile               | 11 +----------
 xen/Rules.mk               |  2 +-
 xen/common/libfdt/Makefile |  2 +-
 xen/scripts/Makefile.clean |  2 +-
 4 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/xen/Makefile b/xen/Makefile
index e39a6f82859a..fbce0f6771fb 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -153,15 +153,6 @@ ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
 $(error source directory cannot contain spaces or colons)
 endif
 
-ifneq ($(abs_srctree),$(abs_objtree))
-# Look for make include files relative to root of kernel src
-#
-# This does not become effective immediately because MAKEFLAGS is re-parsed
-# once after the Makefile is read. We need to invoke sub-make.
-MAKEFLAGS += --include-dir=$(abs_srctree)
-need-sub-make := 1
-endif
-
 export abs_srctree abs_objtree
 export root-make-done := y
 
@@ -225,7 +216,7 @@ ifneq ($(filter %config,$(MAKECMDGOALS)),)
     config-build := y
 endif
 
-include scripts/Kbuild.include
+include $(srctree)/scripts/Kbuild.include
 
 ARCH=$(XEN_TARGET_ARCH)
 SRCARCH=$(shell echo $(ARCH) | \
diff --git a/xen/Rules.mk b/xen/Rules.mk
index 745d892d0707..45d2b72158b8 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -104,7 +104,7 @@ noubsan-y       := $(addprefix $(obj)/,$(noubsan-y))
 # $(sort ...) is used here to remove duplicated words and excessive spaces.
 hostprogs-y := $(sort $(hostprogs-y))
 ifneq ($(hostprogs-y),)
-include scripts/Makefile.host
+include $(srctree)/scripts/Makefile.host
 endif
 
 # subdir-builtin may contain duplications. Use $(sort ...)
diff --git a/xen/common/libfdt/Makefile b/xen/common/libfdt/Makefile
index 75aaefa2e37f..8d484063753b 100644
--- a/xen/common/libfdt/Makefile
+++ b/xen/common/libfdt/Makefile
@@ -1,4 +1,4 @@
-include $(src)/Makefile.libfdt
+include $(srcdir)/Makefile.libfdt
 
 SECTIONS := text data $(SPECIAL_DATA_SECTIONS)
 OBJCOPYFLAGS := $(foreach s,$(SECTIONS),--rename-section .$(s)=.init.$(s))
diff --git a/xen/scripts/Makefile.clean b/xen/scripts/Makefile.clean
index 53f7a76b3075..fa5f332e49a0 100644
--- a/xen/scripts/Makefile.clean
+++ b/xen/scripts/Makefile.clean
@@ -12,7 +12,7 @@ clean::
 
 include $(srctree)/scripts/Kbuild.include
 
-include $(src)/Makefile
+include $(srcdir)/Makefile
 
 # Figure out what we need to clean from the various variables
 # ==========================================================================
-- 
Anthony PERARD


