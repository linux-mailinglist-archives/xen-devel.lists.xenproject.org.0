Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DFA2F88E5
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 23:52:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68729.123156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxY-0001uE-A9; Fri, 15 Jan 2021 22:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68729.123156; Fri, 15 Jan 2021 22:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0XxY-0001t9-2c; Fri, 15 Jan 2021 22:52:48 +0000
Received: by outflank-mailman (input) for mailman id 68729;
 Fri, 15 Jan 2021 22:52:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVL8=GS=citrix.com=edvin.torok@srs-us1.protection.inumbo.net>)
 id 1l0XxW-0001jt-JH
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 22:52:46 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cbd5bad1-0521-4255-9081-413b880163cd;
 Fri, 15 Jan 2021 22:52:42 +0000 (UTC)
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
X-Inumbo-ID: cbd5bad1-0521-4255-9081-413b880163cd
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610751162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m+mU/BwTks6nFEMCGPDEd+poI05u50+/Dta57xu6Hio=;
  b=SC4hW2RcpZDzQqkzPPKAm28RhWaIbKiZ0MFXq7bV6FmaK6dtBmcUDwq7
   w7ZYFs5neA3Ds1JX0ViPQyHdQ0EQA9HgbDBnhqVf5SPhz20sybMfjIJOZ
   6fBv18UnFHhkqNG4zBaKG8qh1YcS2CqwGkebxTIt4EEd6wl1Y7JvM3Jp5
   Q=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +/LaM1m+rcM5Pq74ZGY60/XWuFJNnjkfXHsM05xZlzUgtwMAilYZZNon8dyE9gIa6mse3zQ1m4
 OgskTagfrfHONx+iCP+6tBsPPbCvTEo7E2Qo1PNSJXX7DdpK7K2wJ5JLDvqnZrk9ncvSOqE5hV
 kU4HUUVCwYUGXEeW1ckW+zzD2rXMv6eOgk3eMxFDnsHoNhrU35JBjrctwRWiH6wQ7moClydpx1
 KSNkEg0iuiQU0jtwde1QYUZ8GqJWGvVyi3GnqXadR9SUrLjUHDIcZTzA1tiv57YvPM85beVs0H
 OTo=
X-SBRS: 5.1
X-MesageID: 35263553
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35263553"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, "Christian
 Lindig" <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, "Ian
 Jackson" <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v1 3/4] tools/ocaml/xenstored: reject invalid watch paths early
Date: Fri, 15 Jan 2021 22:29:08 +0000
Message-ID: <2fc657a7d7af881f2c0ee437ddaec668452419fe.1610748224.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1610748224.git.edvin.torok@citrix.com>
References: <cover.1610748224.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Watches on invalid paths were accepted, but they would never trigger.
The client also got no notification that its watch is bad and would
never trigger.

Found again by the structured fuzzer, due to an error on live update
reload: the invalid watch paths would get rejected during live update
and the list of watches would be different pre/post live update.

This was found by an older version of the fuzzer:
```
Test live-update failed (507 shrink steps):
[NEW; (0, None, WATCH ([""; ""], "")); (0, None, CONTROL live-update ())]
```

The testcase is watch on `//`, which is an invalid path.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
---
 tools/ocaml/xenstored/connection.ml  | 5 ++---
 tools/ocaml/xenstored/connections.ml | 4 +++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/tools/ocaml/xenstored/connection.ml b/tools/ocaml/xenstored/connection.ml
index 1f9fe9e3b2..c7f22e5ee9 100644
--- a/tools/ocaml/xenstored/connection.ml
+++ b/tools/ocaml/xenstored/connection.ml
@@ -163,18 +163,17 @@ let get_children_watches con path =
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
2.29.2


