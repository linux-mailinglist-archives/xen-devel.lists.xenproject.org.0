Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C05D615130
	for <lists+xen-devel@lfdr.de>; Tue,  1 Nov 2022 19:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.435179.688310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opvYG-00078H-U3; Tue, 01 Nov 2022 17:59:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 435179.688310; Tue, 01 Nov 2022 17:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opvYG-00074Z-QZ; Tue, 01 Nov 2022 17:59:52 +0000
Received: by outflank-mailman (input) for mailman id 435179;
 Tue, 01 Nov 2022 17:59:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l9Gt=3B=citrix.com=prvs=297828b18=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1opvYF-0006ou-3H
 for xen-devel@lists.xenproject.org; Tue, 01 Nov 2022 17:59:51 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f987485f-5a0e-11ed-8fd0-01056ac49cbb;
 Tue, 01 Nov 2022 18:59:49 +0100 (CET)
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
X-Inumbo-ID: f987485f-5a0e-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667325589;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GczOI6dOgGkSiOucAzErsvhWg4FDt4sWmOiy0PcUCiw=;
  b=eHIMTdmh2hTYoHE/V+EdBpAfArYXaERD995BdvnQJsVlpWP81GrpbUpf
   IXDZjrgp9yQBOKTv6mRJuBllf3qCdR8vl1gzugCnJmQ5YlfLTZW9I8Ftf
   zTCh9rgZ8UsUGaCna9w5Ue8+YFdsKKnizsw9mceYDU/l1qQ5xalq2HXWx
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 86481058
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CqrAvK6HpKl6A7m5+udmkQxRtDrHchMFZxGqfqrLsTDasY5as4F+v
 jcZWmmCaKqCMTH1LYpyOoi0pxkFuMSEmtVmQQRlqHtmHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraBYnoqLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKkT5QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m9
 c0hcRs3QFO4xKGU253kSLNFpsgcBZy+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJU0UUrsUIMtWcOOAi3XhcjsetFWPoqkf6GnP1g1hlrPqNbI5f/TaG5kFxx7F9
 goq+UynX0kXMdyV2wCDrGuHl8PvnCXdSZ4dQejQGvlC3wTImz175ActfUS/iem0jAi5Qd03A
 0Ad5CcGt6U5802vCN7nUHWQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3PLaXhRzi
 AXPxYmwQ2Uy7vvFEhpx64t4sxuyCBFMBlUsJhRHDikezIbh+qgTgi3mG4ML/LGOsvX5HjT5w
 javpSc4hqkOgcNj65hX7WwrkBr3+MGXE1ddChH/Gzv8s1gnPNLNi5mAswCz0BpWEGqOorBtV
 lAgktPW0u0BBIrleMelELRUR+HBCxpo3VThbb9T83sJrWrFF52LJ9o4DNRCyKBBa59sRNMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4QQPcItLVTdp3AzOCZ8OlwBd2B1z8kC1
 WqzK57wXR7294w6pNZJewvt+eBynX1vrY8ibZv60w6mwdKjiI29EN843K+1RrlgtMu5TPD9q
 Yk32z2il0oCC4UTo0D/reYuELz9BSNgXs2q9JcHL7Drz8gPMDhJNsI9CIgJI+RN95m5XM+Sl
 p1hcie0EGbCuEA=
IronPort-HdrOrdr: A9a23:TUFdLqG+5LsUrrVgpLqEGMeALOsnbusQ8zAXPiBKJCC9E/bo8P
 xG+c5w6faaslkssR0b9+xofZPwIk80lqQFhbX5X43DYOCOggLBQL2Kr7GSoQEIcxeUygc379
 YET0ERMrzN5VgRt7eH3OG7eexQv+VuJsqT9JnjJ3QGd3AaV0l5hT0JbDpyiidNNXN77ZxSLu
 vk2uN34wCOVF4wdcqBCnwMT4H41qD2fMKPW29/O/Y/gjP+9g+V1A==
X-IronPort-AV: E=Sophos;i="5.95,231,1661832000"; 
   d="scan'208";a="86481058"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <pau.safont@citrix.com>, =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?=
	<edvin.torok@citrix.com>, Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH for-4.17 v1 1/2] xenctrl.ml: make domain_getinfolist tail recursive
Date: Tue, 1 Nov 2022 17:59:16 +0000
Message-ID: <6e9ee150c5f393f2d403a71ac540ff0d621100ab.1667324874.git.edvin.torok@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1667324874.git.edvin.torok@citrix.com>
References: <cover.1667324874.git.edvin.torok@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On a host with ~1000 VMs (the support limit for XAPI) domain_getinfolist
took O(n^2) time (n=number of domains).
This couples with xenopsd making inefficient calls to
domain_getinfolist(1 call/VM) resulted in visibly bad performance of
XAPI.

It was calling the Xen domainfolist hypercall N/2 times.
Optimize this such that it is called at most 2 times during normal use.

Implement a tail recursive `rev_concat` equivalent to `concat |> rev`,
and use it instead of calling `@` multiple times.

The added benefit is that the list of domains should now actually be in
increasing order instead of having pairs of 2 changing direction every time.

Signed-off-by: Edwin Török <edvin.torok@citrix.com>
Tested-by: Pau Ruiz Safont <pau.safont@citrix.com>
---
 tools/ocaml/libs/xc/xenctrl.ml | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index 28ed642231..3ebedffdc7 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -226,14 +226,25 @@ external domain_shutdown: handle -> domid -> shutdown_reason -> unit
 external _domain_getinfolist: handle -> domid -> int -> domaininfo list
        = "stub_xc_domain_getinfolist"
 
+let rev_append_fold acc e = List.rev_append e acc
+
+(**
+	[rev_concat lst] is equivalent to [lst |> List.concat |> List.rev]
+	except it is tail recursive, whereas [List.concat] isn't.
+	Example:
+	rev_concat [[10;9;8];[7;6];[5]]] = [5; 6; 7; 8; 9; 10]
+*)
+let rev_concat lst = List.fold_left rev_append_fold [] lst
+
 let domain_getinfolist handle first_domain =
 	let nb = 2 in
-	let last_domid l = (List.hd l).domid + 1 in
-	let rec __getlist from =
-		let l = _domain_getinfolist handle from nb in
-		(if List.length l = nb then __getlist (last_domid l) else []) @ l
-		in
-	List.rev (__getlist first_domain)
+	let rec __getlist lst from =
+		(* _domain_getinfolist returns domains in reverse order, largest first *)
+		match _domain_getinfolist handle from nb with
+		| [] -> rev_concat lst
+		| (hd :: _) as l -> __getlist (l :: lst) (hd.domid + 1)
+	in
+	__getlist [] first_domain
 
 external domain_getinfo: handle -> domid -> domaininfo= "stub_xc_domain_getinfo"
 
-- 
2.34.1


