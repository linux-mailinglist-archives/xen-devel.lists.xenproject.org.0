Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5DD688529
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 18:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488875.757155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNd9k-0002mS-0R; Thu, 02 Feb 2023 17:13:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488875.757155; Thu, 02 Feb 2023 17:13:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNd9j-0002kJ-U9; Thu, 02 Feb 2023 17:13:51 +0000
Received: by outflank-mailman (input) for mailman id 488875;
 Thu, 02 Feb 2023 17:13:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U0Je=56=citrix.com=prvs=390ca835d=Bernhard.Kaindl@srs-se1.protection.inumbo.net>)
 id 1pNd9j-0002kD-6r
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 17:13:51 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f426a6fb-a31c-11ed-933c-83870f6b2ba8;
 Thu, 02 Feb 2023 18:13:48 +0100 (CET)
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
X-Inumbo-ID: f426a6fb-a31c-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675358029;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fFiWgEXEsgneyrj55bhkya8ez9VyVvITW6NA9kQZf4U=;
  b=MEuTu4Gj5kBB8kWrAdg4tbpelVsDTzxxsEI/4SFx9iGuIT40ae0ZFiLv
   PJ8d2Qr8slC1WWUcAP954MFPm2XVBKdTje0X6mWGKamqJ5cjSB83AsCLP
   vVQQfEgbyh6DGaxS0yfEYbd+/CZmA3Ui9gkXbhC+8x5QqNz+GR/7ZJD5k
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 94276427
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:6euqAKphfD5ZWn7e2l+dr6MPP7heBmIdZRIvgKrLsJaIsI4StFCzt
 garIBmCO/2DZmWgeY93aoS18xkF656GzNdrHQBqpSszFilD85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzyNNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGstVCKhjMWV+7/lablQheUDDe6zOapK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVypUiTpaMt7y7wxQ133LzFO9vJYN2aA85Smy50o
 0qXoz6mXE1Aa7RzzxKh0mjri87Cgx/bAoAdEreH5rlFkFOqkzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUS9wWl2qfSpQGDCQA5oiVpMYJ88pVsHHpzi
 wHPxomybdByjFGLYSm9zIW2phSRAiVLDj8+Zg4kbCxd5vC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWG2TaD/LF7rVxBHkJPmqgOiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+Som/Ca6INoUeOcIZmOq7EMZGPB744owQuBJ0zfFX1
 WmzLq5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI503P7FZqX1bMEe1tGALXPogEAFas/F29H
 yB3a5HblH2ykYTWPkHqzGLkBQtScyhmVcqs9JM/myzqClMOJVzNwsT5mdsJE7GJVYwM/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:n+zQTaMS8lK3wcBcTv6jsMiBIKoaSvp037Dk7TEJdfU1SL3hqy
 nKpp4mPHDP+VMssR0b6LK90ey7MBDhHP1OgLX5X43SODUO0VHAROpfBMnZowEIcBeOkdK1u5
 0QFZSWy+edMbG5t6vHCcWDfOrICePozJyV
X-IronPort-AV: E=Sophos;i="5.97,268,1669093200"; 
   d="scan'208";a="94276427"
From: Bernhard Kaindl <bernhard.kaindl@citrix.com>
To: <bernhard.kaindl@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@citrix.com>
Subject: [XEN PATCH] tools/xenmon: Fix xenmon.py for with python3.x
Date: Thu, 2 Feb 2023 18:13:19 +0100
Message-ID: <20230202171319.285548-1-bernhard.kaindl@citrix.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fixes for Py3:
* class Delayed(): file not defined; also an error for pylint -E
* Inconsistent use of tabs and spaces for indentation (in one block)

Signed-off-by: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/xenmon/xenmon.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/xenmon/xenmon.py b/tools/xenmon/xenmon.py
index 175eacd2cb..3a81e43edf 100644
--- a/tools/xenmon/xenmon.py
+++ b/tools/xenmon/xenmon.py
@@ -533,7 +533,7 @@ def show_livestats(cpu):
 # simple functions to allow initialization of log files without actually
 # physically creating files that are never used; only on the first real
 # write does the file get created
-class Delayed(file):
+class Delayed():
     def __init__(self, filename, mode):
         self.filename = filename
         self.saved_mode = mode
@@ -677,8 +677,8 @@ def main():
 
     if os.uname()[0] == "SunOS":
         xenbaked_cmd = "/usr/lib/xenbaked"
-	stop_cmd = "/usr/bin/pkill -INT -z global xenbaked"
-	kill_cmd = "/usr/bin/pkill -KILL -z global xenbaked"
+        stop_cmd = "/usr/bin/pkill -INT -z global xenbaked"
+        kill_cmd = "/usr/bin/pkill -KILL -z global xenbaked"
     else:
         # assumes that xenbaked is in your path
         xenbaked_cmd = "xenbaked"
-- 
2.34.1


