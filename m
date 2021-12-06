Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 938CB46A1E9
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239418.414977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOI-0006Vy-Ia; Mon, 06 Dec 2021 17:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239418.414977; Mon, 06 Dec 2021 17:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOI-0006SE-Ef; Mon, 06 Dec 2021 17:03:02 +0000
Received: by outflank-mailman (input) for mailman id 239418;
 Mon, 06 Dec 2021 17:03:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOH-0005ti-2k
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:01 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5dadd8a9-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:00 +0100 (CET)
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
X-Inumbo-ID: 5dadd8a9-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3N07QGAtESY5bqMCOllijGa4cGWUF9eCtceys/Ns6K8=;
  b=G3uvCrDpG55W6OnGgWheKFcApMFKReNySs6pcy3IHXDdqF6zVnKuIir6
   ZIY6saXzkDYiDY9VAALTB1Cvo0UNVknkfnjmlpGpnfmyhF1VvyIDMKPMp
   gRaAposA5P6Fl4wPsxT0AYd2x3QygQ0bj/90eEerea9mQnAODuB5KQdZo
   o=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sywNBfXnP6sCqwGVg2yegclBoqeRZnnFfSn58+Cl4ZZG7I16R0TtNXSMWYLApskeUxPrGeebHe
 mhcZUMyPzOzs8ejPT3BDhEZxO5moiK05kzJOlWtxUC8O3A7ipB23thcCb6A5cRO1UskjNPi2xE
 hguUILyYzYPLdG8xIQpmPWO+7djnNu4CyBRscbxSHYvSyW/wP7OPsS20qKVzAoCG/fm+Lntc/p
 hVcDjGgHBoAo6zyPTEW12Gd+TwI2wJXqZVMs8ES1lG4WL2HHrQVpZsrFnUq3AvC0TR5nNEgJ3l
 auopn4rdLPQmW6rlQzgSjrVu
X-SBRS: 5.1
X-MesageID: 58884268
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:hyi46Kj/IFKkH2L/EOlsBdcwX161hhcKZh0ujC45NGQN5FlHY01je
 htvDGiHOvuLM2v3fNAnPYy+9kgBvcDVnN9rQAVvqC48EHgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1DtYKaSC0LLJfqs7wNeTJKGnt3LKtvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauON
 5pFM2Q/BPjGSxdvYHpPEI1up8CDlEnxTzkCon6Jg6VitgA/yyQuieOwYbI5YOeiRNpXtlaVo
 Hrc+Gb0CQ1cM8aQoRKa9lq8i+mJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN80iMosag18l3tVtTnVge0iHGBtx8YHdFXFoUHBBqlk/SOpVzDXy5dE2AHOIdOWNIKqSIC2
 F+XtdLDJy5VlpbNWVi25L7OpCK0EH1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJKIYs3J9SLYm
 G7T8nVn71kHpYtSjvjgowib6965jsGRFlZd2+nBYo6yAuqVjqaBbpfg11XU5O0owG2xHgjY5
 yhsdyRzAYkz4XCxeM6lHbxl8FKBva/t3NjgbbhHRcNJG9OFoSHLQGyoyGsiTHqFy+5dEdMTX
 GfduBlK+LhYN2awYKl8buqZUppxnfe6RIm/DK6LPrKih6SdkifdpkmCgmbKgAjQfLUEy/lja
 f93j+7yZZrlNUiX5GXvHLpMuVPa7is/2XnSVfjGI+ePitKjiIquYe5dajOmN7lhhIvd+Vm92
 4sPZqOilkQEOMWjM3a/zGLmBQ1TRZTNLcut8JI/my/qClcOJVzN/NeNm+58INI8wPwO/goKl
 1nkMnJlJJPErSWvAW23hrpLMdsDhL5z8iA2OzICJ1Gt1yRxaIqj9v5HJZA2YaMm5KpoyvstF
 6sJfMCJA/JuTDXb+mtCMcmh/dI6LBn71xiTOyeFYSQke8IyTQL+5dK5LBDk8zMDD3TruJJm8
 aGgzA7SXbEKWx9mUJTNcPuqwl7o5Sodlet+UlHmON5WfEmwooFmJzao1q08It0WKAWFzTyfj
 l7EDRAdrOjLgok07NiW2vzU89b3S7NzRxMIEXPa4LC6MTjh0lCimYIQAvyVeT39VX/v/Pnwb
 +ti0PyhYuYMm0xHstQgHu8zn74+/dbmu5RT0h9gQCfQd12uB75tfiuG0M1IuvEfz7NVo1LrC
 EeG+90cMrSVIsL1VlUWIVN9POiE0PgVnBjU7Og0fxqmtHMmouLfXBUAJQSIhQxcMKBxYdEsz
 uoWscIL7xCy10gxOdGcgyEIr2mBIxTsiUn8Wk321GMztjcW9w==
IronPort-HdrOrdr: A9a23:R4ZhS66j+dofRWlu2gPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HJoB17726NtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QCpSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="58884268"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH 03/57] tools/Rules.mk: Remove $(CFLAGS.opic) from %.opic: %.S
Date: Mon, 6 Dec 2021 17:01:46 +0000
Message-ID: <20211206170241.13165-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

$(CFLAGS.opic) isn't set anywere, never was, just remove it.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/Rules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index b022da3336..4e9b4ee17f 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -155,7 +155,7 @@ INSTALL_PYTHON_PROG = \
 %.o: %.S
 	$(CC) $(CFLAGS) $(CFLAGS_$*.o) -c $< -o $@ $(APPEND_CFLAGS)
 %.opic: %.S
-	$(CC) $(CPPFLAGS) -DPIC $(CFLAGS) $(CFLAGS.opic) -fPIC -c -o $@ $< $(APPEND_CFLAGS)
+	$(CC) $(CPPFLAGS) -DPIC $(CFLAGS) -fPIC -c -o $@ $< $(APPEND_CFLAGS)
 
 subdirs-all subdirs-clean subdirs-install subdirs-distclean subdirs-uninstall: .phony
 	@set -e; for subdir in $(SUBDIRS) $(SUBDIRS-y); do \
-- 
Anthony PERARD


