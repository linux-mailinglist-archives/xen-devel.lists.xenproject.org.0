Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD254E3D79
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 12:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293379.498416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbJ-0002vB-Bm; Tue, 22 Mar 2022 11:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293379.498416; Tue, 22 Mar 2022 11:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWcbJ-0002oJ-6e; Tue, 22 Mar 2022 11:22:57 +0000
Received: by outflank-mailman (input) for mailman id 293379;
 Tue, 22 Mar 2022 11:22:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wGTH=UB=citrix.com=prvs=07349bdb1=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nWcbI-0001pm-0C
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 11:22:56 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b0fe40c-a9d2-11ec-a405-831a346695d4;
 Tue, 22 Mar 2022 12:22:54 +0100 (CET)
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
X-Inumbo-ID: 6b0fe40c-a9d2-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647948174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iCkD9kQGHEIpSeuGuWXlR9E5wrrWdyUrQlYnyc/6iyA=;
  b=gbgq4FBt48dLd45ULw6fWFMwuv7HLeSCrP1rc4TA9po4ztReBBAIz4qA
   I0DGmqvUzgv2UtT107r5BxW5vdtr4plWmBw20hbxQ3GcAWrH6xcoauH3s
   KHlV4J6B7p5D+wl3UHBzslQ5mQp+ww+1YIbzvgJuH1Uk9R4OfvINE46dp
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66847218
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OBUPp6DgjqcyERVW/wTjw5YqxClBgxIJ4kV8jS/XYbTApDNwhmEBn
 TQeXTiPOvreMWCgKd93bojkoBxSvJLQy9BnQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vj2NYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPhWx
 41xtMTqdzwzN4iUsqcWXx1YOgpHaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguwqKtXrO4UO/Glt1zjDAd4tQIzZQrWM7thdtNs1rp4QTaqBP
 ZNJAdZpRFfdfR5QE3UaM7l9kMCvgUPWdCJHqV3A8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt7XaEluLJ2yThV+o6FqC89/NsqE2ewCoUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxO4QfZmcfMpp87pZwHGF0k
 A/S9z/0OdBxmJqaEU6cru2qlim7HHA/bmQOYS8tZjJQtrEPv7oPph7IS99iFou8gdv0BSz8z
 li2kcQuu1kApZVVjvvmpDgrlxrp/8GUFVBtum07S0r/tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7YaVUwYnY1RvHNEghBHVb5Jui8BxkkeC9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyLPooRP8cgLlHalM2LWaJ29zqx+KTLuftiU
 ap3jO72VSpKYUiZ5GTeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313Db2vCgGKoNV7BQ1bchAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/8Mx7mSo
 S3lBBMwJZiWrSSvFDhmo0tLMNvHNauTZ1pgVcDwFT5EA0QeXLs=
IronPort-HdrOrdr: A9a23:WTwJz60mjJAYb4hxSXAOjQqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.90,201,1643691600"; 
   d="scan'208";a="66847218"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v10 4/7] build: rework "headers*.chk" prerequisite in include/
Date: Tue, 22 Mar 2022 11:22:35 +0000
Message-ID: <20220322112238.1117737-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322112238.1117737-1-anthony.perard@citrix.com>
References: <20220322112238.1117737-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Listing public headers when out-of-tree build are involved becomes
more annoying where every path to every headers needs to start with
"$(srctree)/$(src)", or $(wildcard ) will not work. This means more
repetition. ( "$(srcdir)" is a shortcut for "$(srctree)/$(src)" )

This patch attempt to reduce the amount of duplication and make better
use of make's meta programming capability. The filters are now listed
in a variable and don't have to repeat the path to the headers files
as this is added later as needed.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v10:
    - acked
    
    v9:
    - reorder *-headers variables
    - call public-filter-headers on $(public-c99-headers) as well, for this I
      needed to rework $(public-c99-headers) and $(public-ansi-headers-filter)
    
    v8:
    - add prefix "public-" to newly introduced macros.
    - make use of the new "$(srcdir)" shortcut.

 xen/include/Makefile | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 5a2b4c9f65fa..fddf5a575bf6 100644
--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -39,8 +39,8 @@ cppflags-$(CONFIG_X86)    += -m32
 
 endif
 
-public-$(CONFIG_X86) := $(wildcard $(src)/public/arch-x86/*.h $(src)/public/arch-x86/*/*.h)
-public-$(CONFIG_ARM) := $(wildcard $(src)/public/arch-arm/*.h $(src)/public/arch-arm/*/*.h)
+public-$(CONFIG_X86) := $(wildcard $(srcdir)/public/arch-x86/*.h $(srcdir)/public/arch-x86/*/*.h)
+public-$(CONFIG_ARM) := $(wildcard $(srcdir)/public/arch-arm/*.h $(srcdir)/public/arch-arm/*/*.h)
 
 .PHONY: all
 all: $(addprefix $(obj)/,$(headers-y))
@@ -81,10 +81,23 @@ ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
 
 all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
 
-PUBLIC_HEADERS := $(filter-out $(src)/public/arch-% $(src)/public/dom0_ops.h, $(wildcard $(src)/public/*.h $(src)/public/*/*.h) $(public-y))
+public-hdrs-path := $(srcdir)/public
 
-PUBLIC_C99_HEADERS := $(src)/public/io/9pfs.h $(src)/public/io/pvcalls.h
-PUBLIC_ANSI_HEADERS := $(filter-out $(src)/public/%ctl.h $(src)/public/xsm/% $(src)/public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
+public-list-headers = $(wildcard $1/*.h $1/*/*.h)
+public-filter-headers = $(filter-out $(addprefix $(public-hdrs-path)/, $($1-filter)), $($1))
+
+public-headers := $(call public-list-headers, $(public-hdrs-path)) $(public-y)
+public-ansi-headers := $(public-headers)
+public-c99-headers := $(addprefix $(public-hdrs-path)/, io/9pfs.h io/pvcalls.h)
+
+public-headers-filter := dom0_ops.h arch-%
+public-ansi-headers-filter := %ctl.h xsm/% %hvm/save.h $(public-headers-filter) \
+    $(patsubst $(public-hdrs-path)/%,%,$(public-c99-headers))
+public-c99-headers-filter :=
+
+PUBLIC_HEADERS := $(call public-filter-headers,public-headers)
+PUBLIC_ANSI_HEADERS := $(call public-filter-headers,public-ansi-headers)
+PUBLIC_C99_HEADERS := $(call public-filter-headers,public-c99-headers)
 
 $(src)/public/io/9pfs.h-prereq := string
 $(src)/public/io/pvcalls.h-prereq := string
-- 
Anthony PERARD


