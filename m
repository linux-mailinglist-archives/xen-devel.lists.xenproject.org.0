Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C34E46A243
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239467.415168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSY-00087o-JW; Mon, 06 Dec 2021 17:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239467.415168; Mon, 06 Dec 2021 17:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSY-00084i-AM; Mon, 06 Dec 2021 17:07:26 +0000
Received: by outflank-mailman (input) for mailman id 239467;
 Mon, 06 Dec 2021 17:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOs-0005ti-Hz
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:38 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72be75aa-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:35 +0100 (CET)
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
X-Inumbo-ID: 72be75aa-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TP5c4pGgMR6VLoF6V/Z6C00XsVMt1l37Dl5Mn5goLHs=;
  b=XNEFPWL3ysde62lYteDSgvIx87Kso0Agwkk4anpu0fNgWzXUSjVUFdB4
   IbdxUzbxfBiXX3w4DvlQpyQZhl8z5vdh3X8+a1j8dXFRtSxoh/FSNdpCs
   UQsYlxUmwsRivnBcTVACV4zQnM5af+NCRpv/4koY7YNIBz17lrrLeA+rB
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3opwMbn2x99q3zhORKoPiG1HPUCQz+KfI/stRL/eUlB/VpKRjdaFi+5ZdqH5cJMC5Fwz4ARgYd
 KjG5m/WCPXAcyqWEnzT2rYGMqmfwmCWPAVfmoNZb27rzSw9A0Bp6/ht/HLeu4mdsZIJPvszldp
 odOwOtxX1o9r/KM5BKbfSRtnVTTnLLyg4MBRlS63driEzDVobqQEtKTGB1l00eJqTC7AEFs+jz
 g7cMc3XhAaamoTsYjXedwDZCw7Z1odriExKccmuyjqWf4LDerzxrIm0Y/ojutyq1ntenzHwIx6
 hA4Fby4hGAlEwtdi8F+6FpW2
X-SBRS: 5.1
X-MesageID: 59324043
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Ocq29qj/XbQ/3OmvjBdDANPvX161kRcKZh0ujC45NGQN5FlHY01je
 htvWGGBMv+Ja2bxKt0ga4qx9BxX7cSAnNE1SQBsry1mFnkb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0dsJuqTAINP5TCncMAYiRfKyJ1EepJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauPP
 JBFMWY0BPjGSwJ9BHoOBKA+puDytHz9axFlr2CO9INitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRAB4AM8eE4SGY6X/qjejK9Qv6R4A6BLC+7uRtglCY2ioUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxastxgAW91WAqsi5RuE0Kb87AOQB2xCRTlEAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J/EqDSoPC0xLFYMYAgZfDYC29rojMY820enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPtTwsTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF8rlxBGFb5JOi8BQ2Swm8zaK7onhezP
 yfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlTXo3s/OBTKgT+9+KTJrU3ZE
 c3BGSpLJSxFYZmLMRLsH7tNuVPV7n5WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYa+zv9ORThJ5wn5muh6JeSIXs19y4/1w
 51KchMClQek2ySYcV7ih7IKQOqHYKuTZEkTZUQEVWtEEVB9CWp2xKtAJZYxY5c98+lvkax9Q
 /UfIp3SCfVTUDXXvT8aaMCl/oBlcR2qgyOIPjakP2djL8IxGVSR94+2ZBbr+QkPEjGz6Zk0r
 Yq/216JWpEEXQljUprbMar901OrsHEBs+tuRE+UcMJLcUDh/dEyeSz8h/M6Oe8WLhDHymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIZCbSGZzHQUm/w6Z6OX
 +QNwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 0/TqNlXPbKFZJHsHFILfVd3a+2C0bcfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLX3Clb+lOFImEET6h65IoRB5Xmi1Zzx1xPCXAG5vQaPH1bhw1wD3QX
IronPort-HdrOrdr: A9a23:2qWUFa974l+A6GU9IWRuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re+sjztCWE8Ar5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtFD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59324043"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 20/57] tools/Rules.mk: introduce FORCE target
Date: Mon, 6 Dec 2021 17:02:03 +0000
Message-ID: <20211206170241.13165-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

And replace the one defined in libs.mk.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/Rules.mk     | 3 +++
 tools/libs/libs.mk | 3 ---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 4e9b4ee17f..0d3febfbb6 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -210,3 +210,6 @@ $(PKG_CONFIG_DIR)/%.pc: Makefile $(XEN_ROOT)/tools/Rules.mk $(PKG_CONFIG_DIR)
 	echo "Libs.private: $(PKG_CONFIG_LIBSPRIV)"; \
 	echo "Requires.private: $(PKG_CONFIG_REQPRIV)"; \
 	} > $@
+
+.PHONY: FORCE
+FORCE:
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 5c2f16dda4..996d467346 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -135,6 +135,3 @@ clean:
 
 .PHONY: distclean
 distclean: clean
-
-.PHONY: FORCE
-FORCE:
-- 
Anthony PERARD


