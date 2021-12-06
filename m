Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E21C46A1ED
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239419.414986 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHON-0006rl-T8; Mon, 06 Dec 2021 17:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239419.414986; Mon, 06 Dec 2021 17:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHON-0006pL-OS; Mon, 06 Dec 2021 17:03:07 +0000
Received: by outflank-mailman (input) for mailman id 239419;
 Mon, 06 Dec 2021 17:03:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOL-0005ta-NN
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:05 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f9b3036-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:04 +0100 (CET)
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
X-Inumbo-ID: 5f9b3036-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810184;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dGQdT72+D933SmY+1liMgkLhAn+NNQrE1q7y6JIxSec=;
  b=PjiKhHIG75Agld5T/rU17D0dM7fEinshu7IVykFyXykb4eb2hU2E0DWT
   4PQBfYMKwtGchp/4eDi7zjT9YprI6n0eK3Kg889Kpaauvwf3+zN9TUMlA
   it4xMW/Q4X8iFLtUa8M4rnwZp+otmBeQFxUnVYypwx78n5yD1t5HS5TQH
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ETkRjVaNhYjj/HzEsJIubXXXXxCCCHgqibvlJb3/+Tfl7F1NIIb1HiSwEKIs2YJIekabFHjh/5
 Giu8A7s/4ZfeU2/SxuJD2LYmVjMkiZ0RDc/dX/Y32xUDuDf5+OUiYsq0iMHOGSLwTs1U29vyBr
 xmwxd17wqxsd4TVvUzZ5uCSc58X2S/XZ04QnOCB9AEt0YBQzNej3RgEX0T3If2UrsybNyAlXlh
 HFhHniAzu95a9i6BzLzb+S5mSnsVnaAFb1DsBClAb/w66itz+hz/OTj8Kkhlcrit9OFaMHwRLD
 ViZJXnlHrz3x9/Tz3xrKuHlM
X-SBRS: 5.1
X-MesageID: 59387736
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:q1bA+ailmAzhCbocan0uFl5rX161yhcKZh0ujC45NGQN5FlHY01je
 htvDD2Gaa7bZGP0Lt5yat+z9BlU6MKHytI2HQNt+S4zFC0b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Xs6eOTA14EpHilaceYQtIKhlMZLF/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauPP
 JpGNmExBPjGSzBwM3QOKc0uprapmSLxeB9gjWmH4rVitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEhPLLnC79cJIfEvu/7PECqF+c3GsIEzUNSEC25/K+jyaWRNZ3O
 0ESvC00osAa/Uq3Tt77TlugrWSNpBI0VN9ZEul84waIooLE7gDcCmUaQzppbN09qNRwVTEsz
 kWOnd7iGXpoqrL9YXCX+6qQrDiyETMINmJEbigBJSME/NvLsIw1lgjITNtoDOiylNKdJN3r6
 2nU9m5k3exV1JNVkfXglbzav96yjoLPdTAw7FT7YkyorQBLdp6cX77x9WGOuJ6sM72lZlWGu
 XEFne2X4+YPEYyBmUSxfQkdIF26z63baWOB2DaDC7Fkrm3woCD7Iei89RknfB8xWvvobwMFd
 6M6Vel5wJZIdEWnYqZsC25aI5R7lPOwfTgJux29UzavXnSTXFLelM2NTRTJt4wIrKTKuftlU
 Xt8WZzzZUv28Yw9kFKLqx41iNfHPBwWy2LJXozcxB+6y7eYb3P9Ye5bawvRNLFktvna/1W9H
 zNj2y2ikU83vArWOHa/zGLuBQpScShT6W7e9aS7idJv0iI5QTp8Wpc9MJsqepB/nrQ9qws71
 irVZ6Os83Km3SevAVzTMhhLMeqzNb4i/SNTFXF9Zj6Ahil8CbtDGY9CLvPbi5F8r7c9pRO1J
 tFYE/i97gNnFm6apm9DNMal9+SPtn2D3GqzAsZsWxBnF7YIeuAD0oWMktLH+HZcAyypm9E5p
 rH8hArXTYBaH1ZpDdrMaeLpxFS05CBPlOV3VkrOA99SZESzr9Q6d32v1qc6c5MWNBHO5jqGz
 ALKUx0WkvbA/t0u+97TiKHa84rwS7liHlBXFnXw5KqtMXWI5XKqxIJNCb7afT3UWG7u1r+lY
 OFZk6P1PPEdxQ4YuItgCbd7i6k54oK39bNdyw1lGlTNbkiqVew8ciXXg5EXu/QUlLFDuAawV
 kaewfVgOO2EaJH/DVocBAs5deDfh/sarSbfsKYuK0Lg6S4poLfeCRdOPwOBgTB2JaduNN932
 v8ovcMb5lDtihcuNdra3ClY+37Vcy4FWqQj8JobHJXqmkwgzVQbOc7QDSr/4ZeubdRQMxZ1f
 m/I1fSa37kMlFDfd3cTFGTW2bsPjJsDjxlG0VseKgnbgdHCnPI2gEVc/Dlfot65FfmbPzaf4
 lRWCnA=
IronPort-HdrOrdr: A9a23:nUlQmajm/a4XMtgmAW1mQX/+bHBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59387736"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN PATCH 04/57] libs: Remove _paths.h from libs ctrl and util.
Date: Mon, 6 Dec 2021 17:01:47 +0000
Message-ID: <20211206170241.13165-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

libxenutil doesn't include _paths.h so no need to generate it.

libxenctrl doesn't use macros from _paths.h so can be removed.
Fix libxenguest to include _paths.h properly instead of relying on
xc_private.h

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 .gitignore                    | 2 --
 tools/libs/ctrl/Makefile      | 5 -----
 tools/libs/ctrl/xc_private.h  | 2 --
 tools/libs/guest/Makefile     | 2 +-
 tools/libs/guest/xg_suspend.c | 1 +
 tools/libs/util/Makefile      | 6 +-----
 6 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/.gitignore b/.gitignore
index cad5aacd8d..111eb03b86 100644
--- a/.gitignore
+++ b/.gitignore
@@ -117,7 +117,6 @@ tools/libs/hypfs/headers.chk
 tools/libs/hypfs/xenhypfs.pc
 tools/libs/call/headers.chk
 tools/libs/call/xencall.pc
-tools/libs/ctrl/_*.[ch]
 tools/libs/ctrl/libxenctrl.map
 tools/libs/ctrl/xencontrol.pc
 tools/libs/foreignmemory/headers.chk
@@ -157,7 +156,6 @@ tools/libs/store/utils.h
 tools/libs/store/xenstore.pc
 tools/libs/store/xs_lib.c
 tools/libs/util/*.pc
-tools/libs/util/_paths.h
 tools/libs/util/libxlu_cfg_y.output
 tools/libs/util/libxenutil.map
 tools/libs/vchan/headers.chk
diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 519246b0d6..5d866b8d04 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -54,11 +54,6 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-genpath-target = $(call buildmakevars2header,_paths.h)
-$(eval $(genpath-target))
-
-$(LIB_OBJS) $(PIC_OBJS): _paths.h
-
 -include $(DEPS_INCLUDE)
 
 clean: cleanlocal
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index 2e483590e6..824d3cfc21 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -29,8 +29,6 @@
 #include <limits.h>
 #include <sys/ioctl.h>
 
-#include "_paths.h"
-
 #define XC_WANT_COMPAT_MAP_FOREIGN_API
 #define XC_INTERNAL_COMPAT_MAP_FOREIGN_API
 #include "xenctrl.h"
diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 2ce92d247e..b49e5059f2 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -111,7 +111,7 @@ libxenguest.so.$(MAJOR).$(MINOR): APPEND_LDFLAGS += $(COMPRESSION_LIBS) -lz
 genpath-target = $(call buildmakevars2header,_paths.h)
 $(eval $(genpath-target))
 
-xc_private.h: _paths.h
+$(LIB_OBJS) $(PIC_OBJS): _paths.h
 
 -include $(DEPS_INCLUDE)
 
diff --git a/tools/libs/guest/xg_suspend.c b/tools/libs/guest/xg_suspend.c
index 0ce6364963..128353029c 100644
--- a/tools/libs/guest/xg_suspend.c
+++ b/tools/libs/guest/xg_suspend.c
@@ -19,6 +19,7 @@
 #include <xenevtchn.h>
 
 #include "xc_private.h"
+#include "_paths.h"
 #include "xenguest.h"
 
 #define SUSPEND_LOCK_FILE    XEN_RUN_DIR "/suspend-evtchn-%d.lock"
diff --git a/tools/libs/util/Makefile b/tools/libs/util/Makefile
index f5f9e89fee..87425d862a 100644
--- a/tools/libs/util/Makefile
+++ b/tools/libs/util/Makefile
@@ -39,7 +39,7 @@ NO_HEADERS_CHK := y
 
 include $(XEN_ROOT)/tools/libs/libs.mk
 
-$(LIB_OBJS) $(PIC_OBJS): $(AUTOINCS) _paths.h
+$(LIB_OBJS) $(PIC_OBJS): $(AUTOINCS)
 
 %.c %.h:: %.y
 	@rm -f $*.[ch]
@@ -49,14 +49,10 @@ $(LIB_OBJS) $(PIC_OBJS): $(AUTOINCS) _paths.h
 	@rm -f $*.[ch]
 	$(FLEX) --header-file=$*.h --outfile=$*.c $<
 
-genpath-target = $(call buildmakevars2header,_paths.h)
-$(eval $(genpath-target))
-
 -include $(DEPS_INCLUDE)
 
 clean: cleanlocal
 
 .PHONY: cleanlocal
 cleanlocal:
-	$(RM) -f _*.h
 	$(RM) -f libxlutil.map
-- 
Anthony PERARD


