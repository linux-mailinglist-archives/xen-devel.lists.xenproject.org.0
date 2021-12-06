Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97B46A23B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239443.415097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHS4-0004tC-HZ; Mon, 06 Dec 2021 17:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239443.415097; Mon, 06 Dec 2021 17:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHS4-0004qz-D3; Mon, 06 Dec 2021 17:06:56 +0000
Received: by outflank-mailman (input) for mailman id 239443;
 Mon, 06 Dec 2021 17:06:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOg-0005ta-M1
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6bcafb74-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:25 +0100 (CET)
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
X-Inumbo-ID: 6bcafb74-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7aOw8syolA2pTNhK+TaqXfl93M4Y1PlS90vYN+kTCEs=;
  b=ZXBM6mt2KR8XlgTCinH9E4/rzpLzIt+hWK1iktxaj+pxOp+/8jn9chIg
   +gona542ud50hqtV4TZe6DmqpSKCLzTlio5hDQ/W1ZfpMkn44jCx1xtAD
   U0jABKCKXJt8tt+uh88JILsVL/MRx66yv8hdtCPALOhJczHPc1R1MGB1n
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: rQVJznZ5uG9sm+n5Vr8uI41OMqkvi/LSOFE2AFkmUsO58NtDw0w7Ab6eRfrJl+81DSs9hU0C1C
 Y6TxwQ0bK1y1MhkZRtDH/DaWEvC2jn8SLpo1H6ao5P62cqamfqS9JhM2VwHJvAnmZ35CQ9YCdx
 nVFTq91G8HSvLGCWjwQAwxsM/u+Okbu2HjJQ2f4fSIpjjCL8q3yxYUZlxm3B4sfLbD8WAHRrGg
 EBdHDVbSeY85GwKtXY7fLp6mH8Mx5KbOeNsauSRXJa5AZmrHkKmpuuFZaLR8780wsAgR85ITdX
 jDm6V/7RUTMAOfJozAYJ3EHP
X-SBRS: 5.1
X-MesageID: 59766334
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Aapz5qnY0gOW1xt3iF16ZGHo5gxnIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJJXzyAM/aOM2OmftxxYYWz/E9Uv5DWnINlSgFrqCwzRCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA187IMsdoUg7wbdg2NY22YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PVpl6KobgcbAvHVwe0bUBAfSjleY7ITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQKeBO
 ZRCMmYHgBLofREQAVsdL5MFl9i4hzr4cwdbsVbEqv9ii4TU5FMoi+W8WDbPQfSLWsd9jkuev
 njB/WnyHlcdLtP34SWB2mKhgKnIhyyTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQ88ywyra805QqzQ8P0RRGQr3uNvxpaUN1Ve9DW8ynUlPCSuVzAQDFZEHgRM7TKqfPaWxQK8
 n23h/TpNwAzqeScT3GUse6MjW2tbH19wXA5WQcISg4M4t/GqY41jw7SQtsLLJNZnuEZChmrn
 WnU8XFWa6E7yJdSiv7lpQyvbyeE/8CRFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdgTQGY3h/5nzvp5p1QEwZ3Y1RfHNEBz3pBaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZ96kvKxSI6/CK+EBjarXnSXXFXdlM2JTRTPt10BbWB2yf1vU
 XtlWZjE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz8uYdykEW9EO9fWHPXN7hRxPrd/G39r
 oYOX+PXmk43eLCvPUHqHXs7cAliwY4TXsut9aS6t4erf2JbJY3WI6OLnO56JdU6x/89eyWh1
 ijVZ3K0AWHX3RXvQThmoFgyAF82dZog/389IwI2OlOkhyoqbYq1tf9NfJorZ7g3sudkyKcsH
 fUCfsyBBNVJSyjGpGtBPcWs8tQ6eUT5nx+KMgqkfCM7I8xqSTvW94K2ZQDo7iQPUHa67JNsv
 7262wrHapMfXAA+Xt3OYfeiwgrp73gQke5/RWXSJdxXdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YnRxhUBWjW67qyJBL2xGv7zN8SSvuMcBDcSHjwpPeoa
 9JKwqyuK/YAhltL7dZxSu450aIk6tLzjLZG1QA4Tm7TZlGmB748cHmL2c5D6v9EyrND4FbkX
 0uO/p9ROKmTOdOjG1kUfVJ3YuOG3PASuz/T8fVqfxmquH4ppOKKARdIIh2BqC1BN78kYooqz
 NAotNMS9wHi2AEhNcyLj3wM+mmBRpDav37Lan3O7FfXtzcW
IronPort-HdrOrdr: A9a23:1zU9FaC39zQ1h83lHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo8f
 xG/c5rrSMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 5dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59766334"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 02/57] tools/configure.ac: Remove left over system_aio
Date: Mon, 6 Dec 2021 17:01:45 +0000
Message-ID: <20211206170241.13165-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

system_aio isn't set since 3d4678108a (tools: remove in tree libaio).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/configure.ac | 1 -
 tools/configure    | 2 --
 2 files changed, 3 deletions(-)

diff --git a/tools/configure.ac b/tools/configure.ac
index 3ac62626a5..5a4fb9022d 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -402,7 +402,6 @@ AC_CHECK_LIB([lzo2], [lzo1x_decompress], [zlib="$zlib -DHAVE_LZO1X -llzo2"])
 PKG_CHECK_MODULES([libzstd], [libzstd],
     [zlib="$zlib -DHAVE_ZSTD $libzstd_CFLAGS $libzstd_LIBS"], [true])
 AC_SUBST(zlib)
-AC_SUBST(system_aio)
 AX_CHECK_EXTFS
 AX_CHECK_PTHREAD
 AX_CHECK_PTYFUNCS
diff --git a/tools/configure b/tools/configure
index 21e3a83795..8e4a59c2cb 100755
--- a/tools/configure
+++ b/tools/configure
@@ -641,7 +641,6 @@ PTHREAD_LIBS
 PTHREAD_LDFLAGS
 PTHREAD_CFLAGS
 EXTFS_LIBS
-system_aio
 zlib
 libzstd_LIBS
 libzstd_CFLAGS
@@ -8772,7 +8771,6 @@ $as_echo "yes" >&6; }
 fi
 
 
-
 ac_fn_c_check_header_mongrel "$LINENO" "ext2fs/ext2fs.h" "ac_cv_header_ext2fs_ext2fs_h" "$ac_includes_default"
 if test "x$ac_cv_header_ext2fs_ext2fs_h" = xyes; then :
 
-- 
Anthony PERARD


