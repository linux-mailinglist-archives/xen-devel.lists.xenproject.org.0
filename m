Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CEF64F109
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 19:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464940.723511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FY9-0003qP-9p; Fri, 16 Dec 2022 18:35:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464940.723511; Fri, 16 Dec 2022 18:35:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6FY9-0003oC-66; Fri, 16 Dec 2022 18:35:13 +0000
Received: by outflank-mailman (input) for mailman id 464940;
 Fri, 16 Dec 2022 18:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CdjE=4O=citrix.com=prvs=342889366=edvin.torok@srs-se1.protection.inumbo.net>)
 id 1p6FPY-0008JE-DX
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 18:26:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f08731b-7d6f-11ed-91b6-6bf2151ebd3b;
 Fri, 16 Dec 2022 19:26:13 +0100 (CET)
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
X-Inumbo-ID: 1f08731b-7d6f-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1671215173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Sp2/iZsmo7dZyO9wo4dG7BuWjwTi9pk8mLkgWUOPpfw=;
  b=QJBy3CIIuAUMrPqTXpocjQpzpCxblVNeTL7yzNgoUOoec8F+NEOOuiKe
   Xkb4elczB8XBjWT/7fwAnGwZht8ktkv79oeSijJwDPeqhZXlfJdURSGX2
   Zvm2HfTBL0bXbU089dQpvlwr1T7nIATtCLtMVGq9cY6P7zZKgTheLaKV2
   s=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 87767484
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eeUt1qzEodpZS+qJ4P16t+c+xirEfRIJ4+MujC+fZmUNrF6WrkUBn
 zMeC2uPO/+IZjb8LY90PI/j8U4GvZPTyt9lHlE+rSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+U0HUMja4mtC5AVkPK4T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUEfy
 t0UNBQpVCy8xO+pmZL8ba42htt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tOqkmHj5NSFfslWWjaE2/3LS3Ep6172F3N/9KoPVG5oJzhrwS
 mTuwmPhKxcKbdyj9nmv6k323sPl3n3acddHfFG/3qEz2wDCroAJMzUaXEW2ieO0gUm/X5RYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8/AKxFmUCCDlbZ7QbWNQeHGJwk
 AXTxpWwWGIp4Ob9pW+hGqm8jWKNGCQJCUs4WRBHQBRcw57E59szkUeaJjp8K5KdgtrwEDD25
 jmFqikimrke5fI2O7WHEUPv2Gz1+MWQJuIhzkCOBz/+sFslDGKwT9bwgWU3+8qsO2pworOpm
 HEf0/aT4+kVZX1mvHzcGb5ddF1FChvsDdE9vbKNN8N5n9hO0yT5FWy13N2ZDBkBDyr8UWW1C
 HI/QCsIjHOpAFOkbLVsf6W6ANkwwK7rGLzND66LN4MUM8EgJFfbokmCgHJ8OEi0wCARfVwXY
 8/HIa5A815EYUiY8NZGb7hEiuJ6rszP7WjSWYr633yaPUm2PRaopUM+GALWNIgRtfrUyDg5B
 v4Db6NmPT0DCryhCsQWmKZPRW03wY8TWcin9pELK7DccmKL2ggJUpfs/F/oQKQ994w9qwsC1
 irnMqOE4DITXUH6FDg=
IronPort-HdrOrdr: A9a23:ivo+k6h5tFRsNc8qa/o4nKGTHXBQXtQji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690cu7IU80hKQV3WB5B97LNmTbUQCTXeJfBOXZsljdMhy72ulB1b
 pxN4hSYeeAaWSSVPyKgjWFLw==
X-IronPort-AV: E=Sophos;i="5.96,249,1665460800"; 
   d="scan'208";a="87767484"
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edvin.torok@citrix.com>, Christian
 Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	=?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: [PATCH v4 07/11] fixup! tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free
Date: Fri, 16 Dec 2022 18:25:16 +0000
Message-ID: <c0fab282ed4decc3375ef2abb8fe1e3591fb5508.1671214525.git.edwin.torok@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1671214525.git.edwin.torok@cloud.com>
References: <cover.1671214525.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fix unused value warning.

Fixes: 8b3c06a3e5 ("tools/ocaml/xenctrl: OCaml 5 support, fix use-after-free")
Signed-off-by: Edwin Török <edwin.torok@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>

---
Changes:
* new patch
---
 tools/ocaml/libs/xc/xenctrl.ml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/ocaml/libs/xc/xenctrl.ml b/tools/ocaml/libs/xc/xenctrl.ml
index b02be07429..a59dee0938 100644
--- a/tools/ocaml/libs/xc/xenctrl.ml
+++ b/tools/ocaml/libs/xc/xenctrl.ml
@@ -182,7 +182,7 @@ let get_handle () = !handle
 
 let close_handle () =
   match !handle with
-  | Some h -> handle := None
+  | Some _ -> handle := None
   | None -> ()
 
 let with_intf f =
-- 
2.34.1


