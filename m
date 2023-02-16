Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF8A69A22A
	for <lists+xen-devel@lfdr.de>; Fri, 17 Feb 2023 00:16:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496817.767719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSnUe-0006vs-9D; Thu, 16 Feb 2023 23:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496817.767719; Thu, 16 Feb 2023 23:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSnUe-0006tc-5R; Thu, 16 Feb 2023 23:16:48 +0000
Received: by outflank-mailman (input) for mailman id 496817;
 Thu, 16 Feb 2023 23:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSnUc-0006tS-Qd
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 23:16:46 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa20d0cf-ae4f-11ed-933c-83870f6b2ba8;
 Fri, 17 Feb 2023 00:16:45 +0100 (CET)
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
X-Inumbo-ID: fa20d0cf-ae4f-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676589405;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H3lBBbl40VP9Y4SFvw+2TEMNR/UniBXF4GbXvpS7rGY=;
  b=D44e4XdA1a5aCqpCCn4lOtTyZ12Xau8wk+jEIhKAD9B1z3zuStgLZumk
   zwsTqd2XilBN9KUh26djE3UAQswdptRYcsCteHKy9H6Bv2Vxfnju6a6NU
   IrQWXCiJd1H81GzlW7uym+n7AkpJZYN8Ug4DYyAXxD84uP4Fom3oqxPrB
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96776548
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6kIueanxRXgzzRGxyLx2zgPo5gy+JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIdUT2APPyJYjH1eot2Otu3pk8HsZCGxtU1GwBurXsyFSMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5QGGzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eM8DHMBKRSEu/qd0ey1S+BJxcolL+C+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthfG+
 T2Yojipav0cHJ+E4yjcz1CVvKjewzLUcpsoT+ao8OE/1TV/wURMUUZLBDNXu8KRkVWiUthSL
 0gV/CsGrqUo8kGvCN7nUHWQglSJoxodUNp4CPAh5UeGza+8ywSEAmkJSBZRZdpgs9U5LRQ10
 neZktWvAiZg2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nczp4OPfr1JuvQ2i2m
 m3U6nFk3N3/kPLnyY2k2XSEj3WooaTRZR9r6ATeeyGr6ABQMdvNi5OT1XDX6vNJLYC8R1aHv
 WQZl8X20N3iHa1hhwTWHrxTQejBC+KtdWSF3AUxR8VJGyGFoSbLQGxG3N1pyK6F2O4gcCShX
 kLcsBg5CHR7bCrzNv8fj25c5q0XIUnc+TbNDKy8gjlmOMIZmOq7EMZGPBf44owVuBJw+ZzTw
 L/CGSpWMV4UCL580B29TPoH3Lkgy0gWnD2MG82klUj/geHFNBZ5rIvp13PUM4gEAF6s+l2Jo
 76zyePUo/mgbAEOSnaOqtNCRbz7BXM6GYr3u6Rqmh2re2Jb9JUaI6aJm9sJItU195m5Y8+Up
 hlRrGcEkgug7ZAGQC3WAk1ehETHBsYk/S9hZHxxVbtqslB6CbuSAG4kX8NfVdEaGCZLl5aYk
 9Ftlx28P8ly
IronPort-HdrOrdr: A9a23:qOcPBqGEe+8DYbaapLqE1ceALOsnbusQ8zAX/mt6Q3VuA6ulfq
 eV8MjztCWatN91YhodcL+7VpVoLUm8yXcW2/hzAV7SZmnbUQKTRekJgLcKqAeQeREWmNQtsZ
 tIQuxTD8DxEEg/reuS2njfLz/4+qjjzJyV
X-IronPort-AV: E=Sophos;i="5.97,304,1669093200"; 
   d="scan'208";a="96776548"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
	"Jan Beulich" <JBeulich@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "Wei Liu" <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: [PATCH] tools: Remove the use of K&R functions
Date: Thu, 16 Feb 2023 23:16:36 +0000
Message-ID: <20230216231636.714006-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Clang-15 (as seen in the FreeBSD 14 tests) complains:

  xg_main.c:1248 error: a function declaration without a
  prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
  xg_init()
         ^
          void

The error message is a bit confusing but appears to new as part of
-Wdeprecated-non-prototype which is part of supporting C2x which formally
removes K&R syntax.

Either way, fix the offending functions.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 tools/debugger/gdbsx/xg/xg_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
index 4576c762af0c..580fe237b20e 100644
--- a/tools/debugger/gdbsx/xg/xg_main.c
+++ b/tools/debugger/gdbsx/xg/xg_main.c
@@ -121,7 +121,7 @@ xgprt(const char *fn, const char *fmt, ...)
  *         -1 failure, errno set.
  */
 int 
-xg_init()
+xg_init(void)
 {
     int flags, saved_errno;
 
-- 
2.30.2


