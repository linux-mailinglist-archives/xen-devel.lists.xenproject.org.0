Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D10869CBD6
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 14:14:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498122.768935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU5z9-0001c5-Ra; Mon, 20 Feb 2023 13:13:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498122.768935; Mon, 20 Feb 2023 13:13:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU5z9-0001Zv-Mc; Mon, 20 Feb 2023 13:13:39 +0000
Received: by outflank-mailman (input) for mailman id 498122;
 Mon, 20 Feb 2023 13:13:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT8u=6Q=citrix.com=prvs=408b4b2b9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pU5z9-0001Zm-0H
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 13:13:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 600fc05b-b120-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 14:13:35 +0100 (CET)
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
X-Inumbo-ID: 600fc05b-b120-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676898815;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=M3wWiTSJa8onm3VWwUcqdATfRKQonuEe/05I0DHI0Ao=;
  b=UrNA/9K0Jn0Of3xXtLeIS6nfuDljMjZS8RHk3eBUVPa1T1YhBLUTk7+Q
   UL9ZiHhXMNhLEvtzot9zfi4KgSG0tYWYezZ6nG6/h+4vmDpATuNJHVzw3
   2ojshBvKMYIVYXxzEnQ/ZIPo/jQtLvv5a4vWJSuSp5taIh5Pz1jzo57Yu
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 96581669
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:O8B7FqmknJLiwnnhr/Sg3RLo5gx1JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfWTyAaPqJNzSnf4x/Pt+39xsG6MCDz9UxSARspX1hQyMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7auaVA8w5ARkPqgR5geGzhH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 eAiLm4nKTWyu9ON4Ii4cttU3cEHAuC+aevzulk4pd3YJfMvQJSFSKTW/95Imjw3g6iiH96HO
 ZBfM2A2Kk2dPVsWYAx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthfG+
 zKfoTqoav0cHPK61AWm1XuVvLTSwgbJSYUrErG98vE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpc8c6vcU7QTgr0
 F6hnN7zAzFr9rqPRhq16bO8vT60fy8PIgcqZzIATAYDy8nupsc0lB2nZuhkFKm5n9jkAwbay
 jqBrDU9r7gLhMtN3KK+lXjNjiiwvJHPQkgw7x/OQ2O+xgpjYciuYInA1LTAxa8edsDDFADH5
 SVa3ZHEt4jiEK1higSReuNTNvaM1sq0Cx3mgmZdJ8Ik0xqErivLkZ9r3BlyI0JgM8AhcDDvY
 VPOtQ452KK/LEdGfocsPdvvVp1CIbzIUI28C6uKNoYmjo1ZLlfvwc14WaKHM4kBemAImLp3B
 5qUeN3E4Z0yWfU+l2reqwvwPNYWKsECKYH7H8+TI/ePi+D2iJuppVAtaQLmUwzBxPnYyDg5C
 v4GXydw9z1RUfflfg7c+pMJIFYBIBATXM6p9ZwML7DYf1U+QwnN7sM9Jpt7JuRYc1l9zL+Ur
 hlRpGcFoLYAuZE3AVrTMS0yAF8edZ1+sWg6LUQR0aWAghAejXKUxP5HLfMfJOB3nNGPONYoF
 5Hpje3cWKUQItkGkhxBBaTAQHtKLkry1V/eYHb0OVDSvfdIHmT0xzMtRSO3nAFmM8Z9nZFWT
 2GIvu8Dfac+eg==
IronPort-HdrOrdr: A9a23:AjgU5quTNA8YcYQIy3knq9cl7skDTdV00zEX/kB9WHVpm62j5q
 KTdZEgviMc5wx9ZJhNo7y90dC7MBXhHP1OkOos1NWZPTUO0VHAROtfBO3ZrAEIcBefygcy78
 ldmudFebnN5BxB/L/HCDTRKadE/DGkmJrY4tvj8w==
X-IronPort-AV: E=Sophos;i="5.97,312,1669093200"; 
   d="scan'208";a="96581669"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: [PATCH RFC] xen: Annotate printk() as cold
Date: Mon, 20 Feb 2023 13:13:25 +0000
Message-ID: <20230220131325.1524786-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There is no such thing as a fastpath with a printk() on it, making printk() an
excellent heuristic for slowpaths.

Net delta is:

  add/remove: 595/2 grow/shrink: 56/762 up/down: 70879/-87331 (-16452)
  Total: Before=4085425, After=4068973, chg -0.40%

because cold functions are optimised differently.  For example, one function
with a particularly large swing is:

  vmcs_dump_vcpu.cold                            -    2172   +2172
  vmcs_dump_vcpu                              7030     408   -6622

with a net delta of 7030 down to 4450.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>

There are other functions which will be good heuristics to annotate, but we
probaby want to collect .cold together in one location rather than having them
spread out across all translation units.
---
 xen/include/xen/lib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 05ee1e18af6b..11ef287c1ed9 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -115,7 +115,7 @@ debugtrace_printk(const char *fmt, ...) {}
 /* Allows us to use '%p' as general-purpose machine-word format char. */
 #define _p(_x) ((void *)(unsigned long)(_x))
 extern void printk(const char *format, ...)
-    __attribute__ ((format (printf, 1, 2)));
+    __attribute__ ((format (printf, 1, 2), cold));
 
 #define printk_once(fmt, args...)               \
 ({                                              \
-- 
2.30.2


