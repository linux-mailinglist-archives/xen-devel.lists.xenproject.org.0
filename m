Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AFF646A26C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239527.415471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTu-0006LM-JL; Mon, 06 Dec 2021 17:08:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239527.415471; Mon, 06 Dec 2021 17:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTt-00066N-F0; Mon, 06 Dec 2021 17:08:49 +0000
Received: by outflank-mailman (input) for mailman id 239527;
 Mon, 06 Dec 2021 17:08:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPd-0005ti-K4
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:25 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ed2b36a-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:23 +0100 (CET)
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
X-Inumbo-ID: 8ed2b36a-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810263;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qNEiXbZNcqKEkFNMg9wHhNcWDaVP6Y/xsY+VPfn4eh0=;
  b=GhF2qD+8Bf3DZeX7Fo++ffP8NDxi67gOBZMIGpELxd8F66sVFV2XQZfk
   vbNnPiO7TE8QkjJHH5qTifrJOmd5iCkRPlzLSAv9I7YGBGsAsVlIexGHR
   Th4RPHQZl9Yin8+S1bpgSJHtEO9DMGjqW33g9/fxv7t8OiJtjgRd8PD8X
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xExfwYnABfsPqQDlHb1Z8/1Yp7pRi/cEttHbvh0dQB9S5rwHUP3z7fp3ALFsXLaNtPULBZbg0Z
 hq9mJ48m0GrgpNVJ2yS8RL1l1D8HQgKRoZZlb0ziquFuJ15/a0UR58QTibn97kTKEc5lxDmGoE
 D+KRi7Gd7HDjo+CF3omn2LRMdGoYnh7T+mxEwUG5Fe1XmYx8hqnRrFzwRTyZPX6pN3bkrK3Py/
 zsedEiZGoF2b52iA4F2lVTZXUA884I+4OeVfCti0VaARKt8HJMOSHE3x+/XKQs5RuIuA0x3ViA
 thGk8uLp6u8jyckhK56W2kAK
X-SBRS: 5.1
X-MesageID: 58884486
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:H1Omlauxkx4sAWI2IXbWlfpzqufnVKdZMUV32f8akzHdYApBsoF/q
 tZmKWjVaa2LNjD1KNxwOdjjoUsC6pGBmtRhHFFp+yFjRi8S+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cy2YbhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplnJ29TwcOBrT1kulBYyZUDCZvOPZ+weqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DN
 5pJNWY/MnwsZTUSE2wRL4oQsNyhuUL2UHpXhFKemqs4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMVLtuE0hKe72mhwOTImEvTWZ0QPK218OZwh1+ezXBVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhcaR9pXFfx88AyXw7DYywmcD2kACDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8hDK/PygyFXY7byJYfTQJ/N7ypdoLt0eaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9XwsQCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJqm3FF52LJ9k4DNRCyKFBaJxsldjBO
 hC7hO+pzMUPVEZGlIcuC25LN+wkzLL7CfPuXe3OY9xFb/BZLVHcrH40NBPKhT6ywCDAdJ3T3
 7/BK65A6l5AVsxaIMeeHb9BgdfHOAhgrY8seXwL50v+iufPDJJkYbwELEGPfogEAFCs+23oH
 yJkH5LSkX13CbSmCgGOqNJ7BQ1afBATWMGtw+QKJ7HrH+aTMDx4YxMn6eh6ININcmU8vrqgw
 0xRrWcEkgei3iOedl3RAp2hAZu2NatCQbsAFXREFT6VN7ILOO5DNY8TKMk6e6cJ7utmwaImR
 vUJYZzYUP9OVi7G63IWapyk9N5ucxGihASvOSu5YWdgI848FlKRotK0LBHy8CQuDzassZdsq
 bOXyQ6GE4EIQB5vDZiKZav3nU+xp3UUhMl7Q1DMfotIYEzp/YUzc37xg/Y7LtsiMxLGwjfGh
 Q+aDQ1B/bvGopMv8cmPjqeB9t/7H+x7F0tcPm/a8bfpanWKojv9mddNCb/acyrcWWX4/LSZS
 d9Ul/ysYucamFtqspZnF+o5x6wJ+Nay9aRRyR5pHSuXYg3zWK9gOHSPweJGqrZJmu1CoQKzV
 0+CpotaNLGONJ+3GVIdPlN4POGK1PVSkTjO9/UlZk794XYvrraAVExTOTiKiTBcc+QpYN90n
 795tZ5E8RG7hzorLs2C33Jd+Gm7J3AdV7kq68MBC4jxhwt3klxPbPQw0MMtDE1jvzmUDnQXH
 w==
IronPort-HdrOrdr: A9a23:V+oIT669Pq5m5c90UwPXwM7XdLJyesId70hD6qhwISY7TiX+rb
 HIoB17726MtN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKPjOHhILAFugLhuHfKn/bakjDH4ZmpM
 FdmsNFZuEYY2IXsS+D2njaL+od
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="58884486"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 44/57] libs/guest: rename ELF_OBJS to LIBELF_OBJS
Date: Mon, 6 Dec 2021 17:02:27 +0000
Message-ID: <20211206170241.13165-45-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It seems a better name. Latter, we will introduce LIBX86_OBJS to
collect lib/x86/* objects.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/guest/Makefile | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index 455e23c432..770b9a7ef1 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -33,13 +33,12 @@ CFLAGS += -I$(XEN_libxenctrl)
 vpath %.c ../../../xen/common/libelf
 CFLAGS += -I../../../xen/common/libelf
 
-ELF_OBJS-y += libelf-tools.o libelf-loader.o
-ELF_OBJS-y += libelf-dominfo.o
+LIBELF_OBJS += libelf-tools.o libelf-loader.o
+LIBELF_OBJS += libelf-dominfo.o
 
-OBJS-y += $(ELF_OBJS-y)
+OBJS-y += $(LIBELF_OBJS)
 
-$(ELF_OBJS-y): CFLAGS += -Wno-pointer-sign
-$(ELF_OBJS-y:.o=.opic): CFLAGS += -Wno-pointer-sign
+$(LIBELF_OBJS) $(LIBELF_OBJS:.o=.opic): CFLAGS += -Wno-pointer-sign
 
 ifeq ($(CONFIG_X86),y) # Add libx86 to the build
 vpath %.c ../../../xen/lib/x86
-- 
Anthony PERARD


