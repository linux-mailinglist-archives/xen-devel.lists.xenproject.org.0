Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A99FA45DB83
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231278.400213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5y-00039m-3Z; Thu, 25 Nov 2021 13:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231278.400213; Thu, 25 Nov 2021 13:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5x-00035u-UN; Thu, 25 Nov 2021 13:47:25 +0000
Received: by outflank-mailman (input) for mailman id 231278;
 Thu, 25 Nov 2021 13:47:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0Q-0007NX-JW
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:42 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6b070573-4df5-11ec-9787-a32c541c8605;
 Thu, 25 Nov 2021 14:41:41 +0100 (CET)
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
X-Inumbo-ID: 6b070573-4df5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847701;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EuHi73nC8Lo2X69xXlwl/JFsLjuB22umM4hppbRP7sA=;
  b=N2XMfd1dxLtLCFYDFwGEjExr+Xgo9Y00OgL4rF4rbox+RlebOK1jiR0o
   FERt+cTmqwpCqT7CokV1/+TGk1g7B7W+n7CQrKbh87CtM3kj8KNol/fcL
   f8mQybmoYTjAr9O/8ZpBXuwsAy3H3224Hf4mHin4T6TKWVBF/ZbKSb/XX
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: a2TZ0JpCMic4LK80dwx4//vXt6zJcghg/RwWZMcGviTPCuuK9qqQM15vDv5PvYYOilRhbiKe76
 kz6e9vByi8e9WGr/p/40Nsr3uNnJRAQZyYN/DeHkV6E7vF5zVEW0TYeiiF0zXF16AKKX2EE4/b
 XNn9xJFdSTcMR8umUhH6x9dhDqvdQAxdVXhxMW+sL0qiqtTJhCLbuU9ZBQq0XTuoiNGTkZh3Fd
 A1gCGdK+y7tUsGILa3Abi/hXxrb7Lwr20rbSD/g6G5sMZY1SlgdCtSEasJX/XOzWnBYQHuq/jH
 q3AY9dADfufEV8aPtNLT36io
X-SBRS: 5.1
X-MesageID: 60634165
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:L4O2nqgwA0DFXhPOwCqqo/m7X161nRcKZh0ujC45NGQN5FlHY01je
 htvX2mAbvreYmT2et9yOdni9UtUvJ7WyIA1GVNvqC8wRXsb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy3IDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1fjrn3bwcoOZfCwsQjbgRBPn9SNPVvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNaiGO
 ZFFMGQyBPjGSyRuMGcdD5k9p+ytj0X9SBh6g06vlJNitgA/yyQuieOwYbI5YOeiR9hRn0uej
 nLL+SL+GB5yHMeE1TOP/3aoh+nOtSD2QoQfEPu/7PECqEKX7nweDlsRT1TTiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0WsVSO/037hmXzajZ6BrfAXILJhZDYtE7sM49RRQxy
 0SE2djuAFRSXKa9ECzHsO3O9HXrZHZTfTRqiTI4oRUt8eLG56czjxX1QIxDLpOol/CrNTio6
 mXfxMQhvIk7gckO3qS92FnIhTOwu5TEJjIIChXrsnGNtV0gOtP8D2C8wR2CtKsbct7FJrWUl
 CFcw5D20QwYMX2aeMVhqs0pFarh2fuKOSa0bbVHT8h4rGTFF5JOkOltDNBCyKVBbplsldzBO
 ha7VeZtCHh7ZibCUEOPS9jtY/nGNIC5fTgfatjab8BVfr96fxKd8SdlaCa4hj62zxdzwPFva
 M3FIK5A6Er27ow9klKLqxo1i+d3lkjSO0uPLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5TPb9q
 L5i2z+x40wHCoXWO3CPmaZKdAxiBSVrVPje9p0MHsbec1UOJY3UI6KIqV/XU9c+xPo9eyah1
 izVZ3K0P3Kj3yCaclvTNSg4AF4tNL4mxU8G0eUXFQ7A8xAejUyHtc/zrrM7Iusq8vJN1/lxQ
 6VXcsmMGK0XGD/G5y4cfd/2q4k7LEanggeHPiyEZjkjfsE/G1yVq4G8Jga/pjMTCieXtNclp
 +Hy3A3sXpdeFR9pC9zbaazzwgrp72Qdgu97Q2DBPsJXJBf36IFvJiGo1q03LsgAJA/t3Dyf0
 wrKUx4UqfOU+90+8cXThLDCpICsSrMsEk1fFmjdzLC3KSiFoTbznd4eCL6FJGmPWnn19aOuY
 fRu48v9aPBXzkxXt4dcEqpwyf5s7dXYuLIHnB9vG2/Gbgr3B+o4cGWGx8RGqoZE2qRd5VmtQ
 kuK99RXZeeJNcfiHAJDLQYpdL3eh/Qdmz2U5vUpOkTqoiRw+ePfA0lVOhCNjg1bLad0b9x5k
 btw5pZO5lztkAcuP/aHkjtQpjaFIXE3Wqk6so0XXd3wgQ0xx1AeOZHRB0caOn1Uhwmg5qXyH
 gKpuQ==
IronPort-HdrOrdr: A9a23:MyexUamP7sLWx0ELc7hHh1sTS2XpDfIq3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7wr5OUtQ4OxoV5PgfZqxz/NICMwqTNWftWrdyQ+VxeNZjbcKqgeIc0aVygce79
 YET0EXMqyXMbEQt6jHCWeDf+rIuOP3k5yVuQ==
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="60634165"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Ian
 Jackson" <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 30/47] build: rework "headers*.chk" prerequisite in include/
Date: Thu, 25 Nov 2021 13:39:49 +0000
Message-ID: <20211125134006.1076646-31-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
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
---

Notes:
    v8:
    - add prefix "public-" to newly introduced macros.
    - make use of the new "$(srcdir)" shortcut.

 xen/include/Makefile | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/xen/include/Makefile b/xen/include/Makefile
index 5a2b4c9f65fa..6e80ef276fd9 100644
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
@@ -81,10 +81,21 @@ ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
 
 all: $(obj)/headers.chk $(obj)/headers99.chk $(obj)/headers++.chk
 
-PUBLIC_HEADERS := $(filter-out $(src)/public/arch-% $(src)/public/dom0_ops.h, $(wildcard $(src)/public/*.h $(src)/public/*/*.h) $(public-y))
+public-hdrs-path := $(srcdir)/public
 
-PUBLIC_C99_HEADERS := $(src)/public/io/9pfs.h $(src)/public/io/pvcalls.h
-PUBLIC_ANSI_HEADERS := $(filter-out $(src)/public/%ctl.h $(src)/public/xsm/% $(src)/public/%hvm/save.h $(PUBLIC_C99_HEADERS), $(PUBLIC_HEADERS))
+public-list-headers = $(wildcard $1/*.h $1/*/*.h)
+public-filter-headers = $(filter-out $(addprefix $(public-hdrs-path)/,$($1-filter)), $($1))
+
+public-c99-headers := io/9pfs.h io/pvcalls.h
+public-headers := $(call public-list-headers,$(public-hdrs-path)) $(public-y)
+public-ansi-headers := $(public-headers)
+
+public-headers-filter := dom0_ops.h arch-%
+public-ansi-headers-filter := %ctl.h xsm/% %hvm/save.h $(public-headers-filter) $(public-c99-headers)
+
+PUBLIC_HEADERS := $(call public-filter-headers,public-headers)
+PUBLIC_ANSI_HEADERS := $(call public-filter-headers,public-ansi-headers)
+PUBLIC_C99_HEADERS := $(addprefix $(public-hdrs-path)/, $(public-c99-headers))
 
 $(src)/public/io/9pfs.h-prereq := string
 $(src)/public/io/pvcalls.h-prereq := string
-- 
Anthony PERARD


