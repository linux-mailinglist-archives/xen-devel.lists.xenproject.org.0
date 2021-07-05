Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F20883BC305
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 21:11:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150633.278517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tzm-0003i7-Nc; Mon, 05 Jul 2021 19:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150633.278517; Mon, 05 Jul 2021 19:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Tzm-0003fj-KE; Mon, 05 Jul 2021 19:11:06 +0000
Received: by outflank-mailman (input) for mailman id 150633;
 Mon, 05 Jul 2021 19:11:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Qt1=L5=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m0Tzk-0002tP-RR
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 19:11:04 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9903b4b-ddc4-11eb-8459-12813bfff9fa;
 Mon, 05 Jul 2021 19:10:57 +0000 (UTC)
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
X-Inumbo-ID: b9903b4b-ddc4-11eb-8459-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625512257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Yg5/TaytRdxEyL/8i1MtFxEb99X7krAsWD1gKRnJVZc=;
  b=AuWtHNe7smlbIpudLjdjd0HQoUizPx3cgl/g+3UnVc4bvtLaU69Qc7FM
   JvL98PMykhWwxNsyNKmMokpLGiCpE6dJH8hVDYY/iEnJpIStf+zPTnWtQ
   K/xFod8mvSX9OeFgnj7Xg/Q3lrP0Hc+n9Ot9p6J+MVEo2fSiyZDE/2EY0
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 1c9I/CO3mklO3t3Sj43l5AUhdN1jpqz8bljjxBwAjER/X9xEmVrm9EAnunhK2rtWehTTOlpmz7
 qB0jhsGU9KX+LIG9F4Vq3dxTAxoOk5mYtl79W/x8D2xpBE7odoEUpzNW4hfWFC8PM+USWwDeOD
 SLM7eMei7L4pc9+r3t2LHyn+44BWChEfBGSGHDDh0CVJoIq83i7yoSCtN0Is6TiSduyOLC+Xzp
 dZeP1NobtXmrAmwLqhBRpMN1jZGYHa91STJzeHNpnNYkZB6o4oJdlJW7Z+RdJKHeoIwSNR5DgX
 1p8=
X-SBRS: 5.1
X-MesageID: 47662837
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VSWnXau4mLbJk92XYmB6z5J97skDYNV00zEX/kB9WHVpmszxra
 6TdZUgpHjJYVkqOE3I9ertBEDiewK5yXcW2/hzAV7KZmCP0wHEEGgL1/qG/9SKIUzDH4Bmup
 uIC5IOauHNMQ==
X-IronPort-AV: E=Sophos;i="5.83,326,1616472000"; 
   d="scan'208";a="47662837"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Olaf Hering <olaf@aepfle.de>, "Juergen
 Gross" <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [PATCH 2/5] tools/python: fix Python3.4 TypeError in format string
Date: Mon, 5 Jul 2021 20:10:24 +0100
Message-ID: <20210705191027.15107-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210705191027.15107-1-andrew.cooper3@citrix.com>
References: <20210705191027.15107-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Olaf Hering <olaf@aepfle.de>

Using the first element of a tuple for a format specifier fails with
python3.4 as included in SLE12:
    b = b"string/%x" % (i, )
TypeError: unsupported operand type(s) for %: 'bytes' and 'tuple'

It happens to work with python 2.7 and 3.6.
To support older Py3, format as strings and explicitly encode as ASCII.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
 tools/python/scripts/convert-legacy-stream | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/scripts/convert-legacy-stream
index 227e1b5c3fd3..7fe375a66810 100755
--- a/tools/python/scripts/convert-legacy-stream
+++ b/tools/python/scripts/convert-legacy-stream
@@ -346,9 +346,9 @@ def read_libxl_toolstack(vm, data):
         if bytearray(name)[-1] != 0:
             raise StreamError("physmap name not NUL terminated")
 
-        root = b"physmap/%x" % (phys, )
-        kv = [root + b"/start_addr", b"%x" % (start, ),
-              root + b"/size",       b"%x" % (size, ),
+        root = ("physmap/%x" % (phys, )).encode('ascii')
+        kv = [root + b"/start_addr", ("%x" % (start, )).encode('ascii'),
+              root + b"/size",       ("%x" % (size, )).encode('ascii'),
               root + b"/name",       name[:-1]]
 
         for key, val in zip(kv[0::2], kv[1::2]):
-- 
2.11.0


