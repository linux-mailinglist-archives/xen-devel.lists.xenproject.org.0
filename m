Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D899446A1EF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239422.415020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOS-0007qC-9A; Mon, 06 Dec 2021 17:03:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239422.415020; Mon, 06 Dec 2021 17:03:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOS-0007kg-0N; Mon, 06 Dec 2021 17:03:12 +0000
Received: by outflank-mailman (input) for mailman id 239422;
 Mon, 06 Dec 2021 17:03:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOP-0005ti-TL
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:10 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 62568e49-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:09 +0100 (CET)
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
X-Inumbo-ID: 62568e49-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810188;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AqCx8xVKCHbiltbPVLDXC8pN1HeD+g0vLeuICQJzUro=;
  b=OUA2kz0NewsT4bjgZ1J81sQqvPk55TZFbuzd98Z8qKdIwLOcIsOp3JUx
   q1pt4tZzRGLsLPyY/HyBXk6rAt7ypxuNqJUNoAEdu9rgjVIb/q5bdzGE8
   k5TMF55EdtQ8zf1KKf744UY+BqtiVEpjDmMQyW6vwt5hTqR5aUZi68zvc
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: HJjA2Up8hf8DgKMSCXZebzVgqV349LhdLVMYes+U2mPE3xpuNPK5L2hdCmi2ubW0cUGP1CDSHS
 UUEf2xTYYpynmnEUecbQcNzjKcUDL4EVNK2HidrbXD2TDrskuTuvmddd64RafEx4tyG21XY8yA
 ZpJNVGdAxm21uXsTrEr3ySyBHMsfr5lR8KYevbpPy8qOqTkhxjnG1SUQdRd1TDvJSfDgmcBUGc
 j4pqzcc3lRtj8nzMpUHIArGGVDCfXOXM41Ce1FRGbKWsaQ6yzG/0PXQb9bhJnA5ibiCKaiNNTM
 dndxTkEf+FW/8o/fVBmscTB+
X-SBRS: 5.1
X-MesageID: 58884283
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Pg+hravF2vr3pgb5U9tkiR2suOfnVKdZMUV32f8akzHdYApBsoF/q
 tZmKTrXPvbZYDH3f90jYdu38xxQ6JPczNQxQQRpriswQX9E+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cy2YbhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NplqJDgYjkbO6/1nadGAz5VEQpuYY5F0eqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DNYUDunZm3HfBAOwvW5zrSKTW/95Imjw3g6iiGN6DN
 5pJNWA/N3wsZTVsIFoaDatgo92Pg0bYLSdWrVm1poM4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKhMVLtuE0hKe72mhwOTImEvTWZ0QPK218OZwh1+ezXBVDwcZPXOrrP/8hkOgVtZ3L
 00P5jFovaU07FasTNT2Q1u/unHslhcaR9pXFfx88AyXw7DYywmcD2kACDVGbbQbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8sD/iEhYnKG07YGxfHSwI4fLz/KIwp0eaJjp8K5KdgtrwEDD25
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
IronPort-HdrOrdr: A9a23:YHOioql0awuY245S25XUtKoqfQbpDfIm3DAbv31ZSRFFG/Fxl6
 iV88jzsiWE7Qr5OUtQ/uxoV5PgfZqxz/NICOoqTNWftWvd2FdARbsKheCJ/9SJIVybygc378
 ldmsZFZOEYdWIK7vrH3A==
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="58884283"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 07/57] libs/guest: Drop spurious include in Makefile
Date: Mon, 6 Dec 2021 17:01:50 +0000
Message-ID: <20211206170241.13165-8-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This include hasn't been useful since e567964a54 (tools: drop ia64
support).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/guest/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/libs/guest/Makefile b/tools/libs/guest/Makefile
index b49e5059f2..c6d882e239 100644
--- a/tools/libs/guest/Makefile
+++ b/tools/libs/guest/Makefile
@@ -71,8 +71,6 @@ SRCS-y                 += xg_dom_decompress_unsafe_xz.c
 SRCS-y                 += xg_dom_decompress_unsafe_zstd.c
 endif
 
--include $(XEN_TARGET_ARCH)/Makefile
-
 CFLAGS   += -Werror -Wmissing-prototypes
 CFLAGS   += -I. -I./include $(CFLAGS_xeninclude)
 CFLAGS   += -D__XEN_TOOLS__
-- 
Anthony PERARD


