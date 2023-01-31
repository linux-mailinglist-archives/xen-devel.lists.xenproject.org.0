Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E25B6838AB
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 22:30:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487844.755559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC4-0000Po-BK; Tue, 31 Jan 2023 21:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487844.755559; Tue, 31 Jan 2023 21:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMyC4-0000Ns-8E; Tue, 31 Jan 2023 21:29:32 +0000
Received: by outflank-mailman (input) for mailman id 487844;
 Tue, 31 Jan 2023 21:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qwjI=54=citrix.com=prvs=3886215e8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pMyC2-0000Nb-CI
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 21:29:30 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54e58ec1-a1ae-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 22:29:28 +0100 (CET)
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
X-Inumbo-ID: 54e58ec1-a1ae-11ed-933c-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1675200568;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jNU72Uu2tmrcqHFCNgIV8t/XfjcVgtHdUCV/DbhunZ0=;
  b=QMTAIaJm5uUkfYsHhHh2hOmT50uppvvn2vGnDBTiyGu9DAV8jDMUCRHI
   deD4VWRrMcJ8iF4eZBFHj1uUyUTGWch1DkfbvylTBb428J9UtTjolI0s9
   +3zUzq1u89Eb8QCyeAhb3jWz95EGclaGS6TXrvLTyzEadp/LYwBXR092n
   4=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 95499176
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:DRPIu6rBBa1a1sQTvyEoYRPaRKNeBmIZZRIvgKrLsJaIsI4StFCzt
 garIBmGOayJYmr3L4onPYrg9k1XucfSz4BjHQZtrC9kQy0WoJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpAFc+E0/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weHzCBNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABkVS0ixwMCo+auyR+VI3ZgKHvv6BapK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jObozWoW05EXDCZ4XmM3SylpNbppgPcQLIbD6y90aJ7gULGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U24R+A4rDZ6AGYAi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2U169V5VE5x6J+9tRbqC283M1YbbCIIaVBZyuvRsbga20enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPdTA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHRcFJG9eFoSTLkWVsDNZWei9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CK+JN4sWOsAsLlXYlM2LWaJ39zm9+HXAbIllY
 cvLGSpSJSly5VtbIMqeGL5GjO5DKtEWzmLPX5HrpylLIpLHDEN5vYwtaQPUBshgtfPsnekg2
 4oHXyd840kFAbKWj+i+2dJ7EG3m2lBgXMyo8JMKKrTTSuekcUl4Y8LsLXoaU9QNt8xoei3gp
 xlRhmcwJILDuED6
IronPort-HdrOrdr: A9a23:zKvS1q9/wraM3VeHjKxuk+HBdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYW4qKQkdcdDpAsm9qADnhOVICOgqTP6ftWbdyQ+Vxe1Zg7cKhgeQYhEWldQtnZ
 uIEZIOb+EYZGIS5aqU3OD7KadH/DDtytHKuQ6q9QYJcegcUdAD0+4WMGemO3wzYDMDKYsyFZ
 Ka6MYCjz28eU4PZsD+KmgZU/PFr9jrkoujRRIdHRYo5CSHkDvtsdfBYlKl9yZbdwkK7aYp8G
 DDnQC8zqK/s8ujwhuZ+37P449QkN7BzMIGIMCXkMAaJhjllw7tToV8XL+puiwzvYiUmR0Xue
 iJhy1lE9V46nvXcG3wiwDqwRPc3DEn7GKn4UOEgFP4yPaJCA4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn93d7VTBtn/3DE7kbK0NRjwUC3Y7FuKIO5nrZvv3+9161wXh4S3bpXUd
 WGyvusocq+P2nqK0wx9VMfuuBEFk5DYytuBHJy9/B9mgIm4ExR3g8WwtcSkWwH8494Q55Y5/
 7cOqAtj71WSNQKBJgNcNvpbPHHeFAleyi8RV66MBDiDuUKKnjNo5n47PE84/yrYoUByN83lI
 7aWF1VuGYucwa2YPf+qqFj41TIWiGwTD7twsZR69xwvaD9XqPiNWmGREo1m8Wtrv0DConQWu
 q1OphRH/j/RFGebrphzkn7Qd1fOHMeWMoatpIyXE+PuNvCLsnwuunSYJ/oVcnQ+PYfKxPC61
 c4LUnOzZ97nz+Ws1fD8WbsZ08=
X-IronPort-AV: E=Sophos;i="5.97,261,1669093200"; 
   d="scan'208";a="95499176"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH 1/7] tools/ocaml/libs: Don't declare stubs as taking void
Date: Tue, 31 Jan 2023 21:29:07 +0000
Message-ID: <20230131212913.6199-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20230131212913.6199-1-andrew.cooper3@citrix.com>
References: <20230131212913.6199-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edwin.torok@cloud.com>

There is no such thing as an Ocaml function (C stub or otherwise) taking no
parameters.  In the absence of any other parameters, unit is still passed.

This doesn't explode with any ABI we care about, but would malfunction for an
ABI environment such as stdcall.

Fixes: c3afd398ba7f ("ocaml: Add XS bindings.")
Fixes: 8b7ce06a2d34 ("ocaml: Add XC bindings.")
Signed-off-by: Edwin Török <edwin.torok@cloud.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Török <edwin.torok@cloud.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/libs/xb/xenbus_stubs.c  | 5 ++---
 tools/ocaml/libs/xc/xenctrl_stubs.c | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/ocaml/libs/xb/xenbus_stubs.c b/tools/ocaml/libs/xb/xenbus_stubs.c
index 3065181a55e6..97116b07826a 100644
--- a/tools/ocaml/libs/xb/xenbus_stubs.c
+++ b/tools/ocaml/libs/xb/xenbus_stubs.c
@@ -30,10 +30,9 @@
 #include <xenctrl.h>
 #include <xen/io/xs_wire.h>
 
-CAMLprim value stub_header_size(void)
+CAMLprim value stub_header_size(value unit)
 {
-	CAMLparam0();
-	CAMLreturn(Val_int(sizeof(struct xsd_sockmsg)));
+	return Val_int(sizeof(struct xsd_sockmsg));
 }
 
 CAMLprim value stub_header_of_string(value s)
diff --git a/tools/ocaml/libs/xc/xenctrl_stubs.c b/tools/ocaml/libs/xc/xenctrl_stubs.c
index 2fba9c5e94d6..728818445975 100644
--- a/tools/ocaml/libs/xc/xenctrl_stubs.c
+++ b/tools/ocaml/libs/xc/xenctrl_stubs.c
@@ -86,9 +86,9 @@ static void Noreturn failwith_xc(xc_interface *xch)
 	caml_raise_with_string(*caml_named_value("xc.error"), error_str);
 }
 
-CAMLprim value stub_xc_interface_open(void)
+CAMLprim value stub_xc_interface_open(value unit)
 {
-	CAMLparam0();
+	CAMLparam1(unit);
 	CAMLlocal1(result);
 	xc_interface *xch;
 
-- 
2.11.0


