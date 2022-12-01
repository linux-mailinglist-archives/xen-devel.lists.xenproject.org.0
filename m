Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D45563F9BA
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 22:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451210.708861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0qxk-0007IA-BX; Thu, 01 Dec 2022 21:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451210.708861; Thu, 01 Dec 2022 21:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0qxk-0007FP-8Y; Thu, 01 Dec 2022 21:19:20 +0000
Received: by outflank-mailman (input) for mailman id 451210;
 Thu, 01 Dec 2022 21:19:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmm5=37=citrix.com=prvs=327587bd7=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1p0qxi-0007FJ-9A
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 21:19:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdd5ca19-71bd-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 22:19:16 +0100 (CET)
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
X-Inumbo-ID: cdd5ca19-71bd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669929556;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=hDkJOhI8Mbcv7LZLwCRBkw7mqTxR+Rw5qy0fsyDnMZY=;
  b=LOjy4s8MQP4zLV3nnY9Kps3QsSD+/g9VwACUvUoaDE7igJ1YgxAPWxKt
   pHh6NzFTANkd7dV24yYO9vWRzCdusMiSB/3AvHzmeGJbyFOxYQTV61bEx
   duu+aoSFkJN421ElVO3PnNVW3Mivf1hiL+MmfbC2o6bo5zoq+y3c5oG0g
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 85167982
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PJEf46gDreShGYU2+V5YmHt0X161ZxAKZh0ujC45NGQN5FlHY01je
 htvWD2BPvmJMWKnKosiO4/n9xgDscfUzdJnGgo+ris9Qy4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmUpH1QMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWs0N8klgZmP6oS5geHzyJ94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQBEy40Mj3EjNuM+6DhZq4zvJUgIc/CadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJagx/5JEWxY9EglHWdTFCpU3Tjq0w+2XJlyR60aT3McqTcduPLSlQthbF/
 zyZrjSjav0cHMCdzhCO9nKGvOjSmwKjVq0JLaCItdc/1TV/wURMUUZLBDNXu8KRhkegVvpFJ
 kcT+y5oqrI9nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYWum6I7IgHS5ABIuPzUuInA+HAgI5fC29enfkSnzZtpkFae0iPj8Fjfx3
 y2GoUACulkDsSIY//7lpA6a2lpAsrCMF1dovVuPAgpJ+ysjPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWG2TaD/LF7rVxBHkJPmqgOiAyS3G8zbq45lcbBO
 Sc/Qz956p5JJ2eNZqRqeY+3AMlC5fG+S4W0D6GKN4EQO8UZmOq7EMZGPB744owQuBJ0zfFX1
 WmzLq5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eHwI503P7FZqX1bMEe1tGALXPogEAFas/F29H
 yB3a5HblH2ykYTWPkHqzGLkBQtWdyJhVMip9JQ/myzqClMOJVzNwsT5mdsJE7GJVYwO/gsU1
 hlRgnNl9Wc=
IronPort-HdrOrdr: A9a23:6vuqSKEYDebhVYgVpLqFnpLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6fatskd3ZJhSo6HnBEDgewKpyXcb2/h1AV7PZmfbUQiTXfZfBOnZslnd8kTFn4Ywup
 uIGJIfNDSENykZsS+M2njaLz9P+ri62ZHtod2b42ZmTAlsZa0lxwBlCjyDGkkzaBhaCYE/HJ
 +84NMCgza7Y3wYYumyG3FABoH41pT2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbfyJTzawk+W
 3llRW8wqm4qfm0xjLVymeWxZVLn9nKzMdFGaW3+74oAwSprjztSJVqWrWEsjxwivqo8kwWnN
 7FpAplF9hv6lvKF1vF6ifF6k3F6nID+nXiwViXjT/IusriXg83DMJHmMZwbgbZ0Uw9p9txuZ
 g7lV5x9qAnQC8orh6NqOQgZCsa2HZcZkBS0NL7ukYvHbf2roUh7bD3snklU6voVxiKkbzPWN
 MedP00oswmOW9yJkqpxVVH0ZiiWG8+EQyBRVVHssuJ0yJOlHQ81EcAwtcD901wh67VZqM0lt
 gsCJ4Y5I1mX4sTd+ZwFe0BScy4BijERg/NKnubJRDiGLscM3zAppbr6PFtjdvaDaAg3d83gt
 DMQVlYvWk9dwbnDtCPxoRC9lTITH+mVTrgx8lC79xyu6H6RrDsLSqfIWpe4feIsrEaGInWSv
 yzMJVZD7vqKnbvA59A20nkV5xbORAlIbMoUxYAKi2zS+7wW/HXX7bgAYzuzZLWYEsZZl8=
X-IronPort-AV: E=Sophos;i="5.96,210,1665460800"; 
   d="scan'208";a="85167982"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Edwin Torok
	<edvin.torok@citrix.com>, Rob Hoes <Rob.Hoes@citrix.com>
Subject: [PATCH] tools/oxenstored: Render backtraces more nicely in Syslog
Date: Thu, 1 Dec 2022 21:19:06 +0000
Message-ID: <20221201211906.5214-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain

fallback_exception_handler feeds a string with embedded newlines directly into
syslog().  While this is an improvement on getting nothing, syslogd escapes
all control characters it gets, and emits one (long) line into the log.

Fix the problem generally in the syslog stub.  As we already have a local copy
of the string, split it in place and emit one syslog() call per line.

Also tweak Logging.msg_of to avoid putting an extra newline on a string which
already ends with one.

Fixes: ee7815f49faf ("tools/oxenstored: Set uncaught exception handler")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: David Scott <dave@recoil.org>
CC: Edwin Torok <edvin.torok@citrix.com>
CC: Rob Hoes <Rob.Hoes@citrix.com>
---
 tools/ocaml/xenstored/logging.ml     |  2 +-
 tools/ocaml/xenstored/syslog_stubs.c | 26 +++++++++++++++++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/xenstored/logging.ml b/tools/ocaml/xenstored/logging.ml
index 255051437d60..f233bc9a3956 100644
--- a/tools/ocaml/xenstored/logging.ml
+++ b/tools/ocaml/xenstored/logging.ml
@@ -344,7 +344,7 @@ let watch_not_fired ~con perms path =
 	access_logging ~tid:0 ~con ~data Watch_not_fired ~level:Info
 
 let msg_of exn bt =
-	Printf.sprintf "Fatal exception: %s\n%s\n" (Printexc.to_string exn)
+	Printf.sprintf "Fatal exception: %s\n%s" (Printexc.to_string exn)
 		(Printexc.raw_backtrace_to_string bt)
 
 let fallback_exception_handler exn bt =
diff --git a/tools/ocaml/xenstored/syslog_stubs.c b/tools/ocaml/xenstored/syslog_stubs.c
index e16c3a9491d0..760e78ff73dc 100644
--- a/tools/ocaml/xenstored/syslog_stubs.c
+++ b/tools/ocaml/xenstored/syslog_stubs.c
@@ -37,14 +37,34 @@ value stub_syslog(value facility, value level, value msg)
 {
 	CAMLparam3(facility, level, msg);
 	char *c_msg = strdup(String_val(msg));
+	char *s = c_msg, *ss;
 	int c_facility = __syslog_facility_table[Int_val(facility)]
 	               | __syslog_level_table[Int_val(level)];
 
 	if ( !c_msg )
 		caml_raise_out_of_memory();
-	caml_enter_blocking_section();
-	syslog(c_facility, "%s", c_msg);
-	caml_leave_blocking_section();
+
+	/*
+	 * syslog() doesn't like embedded newlines, and c_msg generally
+	 * contains them.
+	 *
+	 * Split the message in place by converting \n to \0, and issue one
+	 * syslog() call per line, skipping the final iteration if c_msg ends
+	 * with a newline anyway.
+	 */
+	do {
+		ss = strchr(s, '\n');
+		if ( ss )
+			*ss = '\0';
+		else if ( *s == '\0' )
+			break;
+
+		caml_enter_blocking_section();
+		syslog(c_facility, "%s", s);
+		caml_leave_blocking_section();
+
+		s = ss + 1;
+	} while ( ss );
 
 	free(c_msg);
 	CAMLreturn(Val_unit);
-- 
2.11.0


