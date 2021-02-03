Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E342230E12C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 18:36:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81000.148833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M4f-00008v-58; Wed, 03 Feb 2021 17:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81000.148833; Wed, 03 Feb 2021 17:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7M4e-00007V-Tk; Wed, 03 Feb 2021 17:36:16 +0000
Received: by outflank-mailman (input) for mailman id 81000;
 Wed, 03 Feb 2021 17:36:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0lb=HF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l7M4d-0008Tz-2W
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 17:36:15 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adc4e1d1-95bd-4935-8ece-b9fabf13efa6;
 Wed, 03 Feb 2021 17:36:10 +0000 (UTC)
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
X-Inumbo-ID: adc4e1d1-95bd-4935-8ece-b9fabf13efa6
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612373770;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jygmUT9ZgGv9XOH9leiyk/f2jyGpdMf+qKEjhDs7RYI=;
  b=hUAZxBfXhjv4XwruRSQv/O1Zb5KU5RL9xPfHW++fdsduOt1Ik+3sfxhh
   eQqkoH2TJ2PHDsP6USL/UkW/EYZdYBiFRSDt+ew8QCARlTVaWJhAVOE6S
   63iRut9ukT6//s4sTxFWVNpPBCjOpi4mT+VT1hIwjgFOcaAdGcBBgCq5a
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ps/T2ELTmh5sbe8wJPIhhRDNfIPLPal8p3N/07kJv29melQyOj0h8RWyJIhLIdUTpR4XNNS/7Z
 7ziBh1l1UWLsB7UWnqDf3f6heXzFR1dPKUSMhBc6fjHlkqspctyKwG98mSNKUqXpKFPg+GjQHo
 gHFHONUbOP7V9S3HoZHqjyxMr3TYgPWRcPpB15Rk7ZEvn6TwKdyOuhpvJh1BsE6Eb7qp3ACYQD
 qNN11o2T1Aki7W63juGTtXGA1EOEBuHow7MdUFIEMfHlY/nhQvFElpmsfFSY+PKb7PD3BpetBf
 /+8=
X-SBRS: 4.0
X-MesageID: 36863744
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,399,1602561600"; 
   d="scan'208";a="36863744"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>
Subject: [PATCH 2/3] tools/oxenstored: Reject invalid watch paths early
Date: Wed, 3 Feb 2021 17:35:48 +0000
Message-ID: <20210203173549.21159-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210203173549.21159-1-andrew.cooper3@citrix.com>
References: <20210203173549.21159-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Edwin Török <edvin.torok@citrix.com>

Watches on invalid paths were accepted, but they would never trigger.  The
client also got no notification that its watch is bad and would never trigger.

Found again by the structured fuzzer, due to an error on live update reload:
the invalid watch paths would get rejected during live update and the list of
watches would be different pre/post live update.

The testcase is watch on `//`, which is an invalid path.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
CC: Christian Lindig <christian.lindig@citrix.com>
CC: Ian Jackson <iwj@xenproject.org>
CC: Wei Liu <wl@xen.org>
---
 tools/ocaml/xenstored/connection.ml  | 5 ++---
 tools/ocaml/xenstored/connections.ml | 4 +++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index d09a0fa405..65f99ea6f2 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -158,18 +158,17 @@ let get_children_watches con path =
 let is_dom0 con =
 	Perms.Connection.is_dom0 (get_perm con)
 
-let add_watch con path token =
+let add_watch con (path, apath) token =
 	if !Quota.activate && !Define.maxwatch > 0 &&
 	   not (is_dom0 con) && con.nb_watches > !Define.maxwatch then
 		raise Quota.Limit_reached;
-	let apath = get_watch_path con path in
 	let l = get_watches con apath in
 	if List.exists (fun w -> w.token = token) l then
 		raise Define.Already_exist;
 	let watch = watch_create ~con ~token ~path in
 	Hashtbl.replace con.watches apath (watch :: l);
 	con.nb_watches <- con.nb_watches + 1;
-	apath, watch
+	watch
 
 let del_watch con path token =
 	let apath = get_watch_path con path in
diff --git a/tools/ocaml/xenstored/connections.ml b/tools/ocaml/xenstored/connections.ml
index 8a66eeec3a..3c7429fe7f 100644
--- a/tools/ocaml/xenstored/connections.ml
+++ b/tools/ocaml/xenstored/connections.ml
@@ -114,8 +114,10 @@ let key_of_path path =
 	"" :: Store.Path.to_string_list path
 
 let add_watch cons con path token =
-	let apath, watch = Connection.add_watch con path token in
+	let apath = Connection.get_watch_path con path in
+	(* fail on invalid paths early by calling key_of_str before adding watch *)
 	let key = key_of_str apath in
+	let watch = Connection.add_watch con (path, apath) token in
 	let watches =
  		if Trie.mem cons.watches key
  		then Trie.find cons.watches key
-- 
2.11.0


