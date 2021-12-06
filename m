Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC746A1F1
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239430.415051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOa-0000fk-5q; Mon, 06 Dec 2021 17:03:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239430.415051; Mon, 06 Dec 2021 17:03:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOZ-0000Xh-Sl; Mon, 06 Dec 2021 17:03:19 +0000
Received: by outflank-mailman (input) for mailman id 239430;
 Mon, 06 Dec 2021 17:03:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOX-0005ti-Nr
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:17 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 676f0b32-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:03:16 +0100 (CET)
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
X-Inumbo-ID: 676f0b32-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810196;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+OlQ+THP4J9buVH+FPSpdVxwEazvI9jKgpeddJ/Kp5A=;
  b=iKtBvJc+2k0w4+GT68DgiCO1zLX0/PnFkYYDTCjGBwYR7QeBAjR2pif3
   mjXDXdiVHQgwoJW7j2VybdR4Zt44cGSQAM+O30hsvuPhba8S/+s0CGSSv
   d2ySe1QbvPUtOHo76aCq26L1uuC/GcLhoT98bgVkxRUg3s+A7WGVU6ktr
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: JphdPSgst0BUiYRj99VRgUlnyVZmt1yRiAvgwSsBdNYRgLBuKZeAtaitwXnORAfWTvWzxWq32C
 zruFi2OAg3zCXKYLrZTAJpFtD4EtijKIEqfy9XM0JciFW1aEj52A1GfhNQXc1Rmg/NU3Hz+vfD
 Bi5/ghIaV0VNXVxqmtAN3PEtnwA7dEqjxV756NR2o1Egr7Lidr737KyeWV8EoRyTZHJDpqg5Q5
 x46551nG8uN9EYCWx2mkIPPqvnOEoquUom/1NmXTgFifTm4mhRdGvXheF4FB/ZF1JoYlS4PCyF
 UlWGPcPHJ2b2DU7z55Q1hQ3I
X-SBRS: 5.1
X-MesageID: 58884312
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:3ZPd76hzM32AmLbB5oEqUblgX161kRcKZh0ujC45NGQN5FlHY01je
 htvCmCPaPePZzfzfYt+a4S/90tS78TVn95gHAE5/no0Hykb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1Hl4WtVz5uM5Hss8sGSDtDUCp0FL1JreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauON
 5pFMmM1BPjGSyRJGmkuFdU0puWh33jELjBm9n2NgpNitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRAB4AM8eE4SGY6X/qjejK9Qv6R4A6BLC+7uRtglCY2ioUEhJ+fUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxastxgAW91WAqsi5RuE0Kb87AOQB2xCRTlEAOHKr+dvG2Zsj
 AXQ2Yq0W3o/69V5VE5x6J+ejyqvJxFSIFMiTgAfVikeoNLpiZE820enoslYLIa5idj8GDfVy
 j+MrTQji7h7sfPnx5lX7nic3Wvy+8Ghohodo1yOAzn7tl8RiJuNPtTwsTDmAeB8wJF1p7Vrl
 FwNgICg4e8HFvlhfwTdEbxWTNlFCxtoWQAwYGKD/bF8rlxBGFb5JOi8BQ2Swm8zaK7onhezP
 yfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlTXo3s/OBTKgT+9+KTJrU3ZE
 c3BGSpLJSxFYZmLMRLsH7tNuVPV7n5WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vfyDg5B
 +13bpPQoz0GCbWWSnCOreY7cABbRVBmVMueg5EGKYa+zv9ORThJ5wn5muh6JeSIXs19y4/1w
 51KchMClQek2ySYcV7ih7IKQOqHYKuTZEkTZUQEVWtEEVB6CWp2xKtAJZYxY5c98+lvkax9Q
 /UfIp3SCfVTUDXXvT8aaMCl/oBlcR2qgyOIPjakP2djL8IxGVSR94+2ZBbr+QkPEjGz6Zk0r
 Yq/216JWpEEXQljUprbMar901OrsHEBs+tuRE+UcMJLcUDh/dEyeSz8h/M6Oe8WLhDHymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIZCbSGZzHQUm/w6Z6OX
 +QNwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 0/TqNlXPbKFZJHsHFILfVd3a+2C0bcfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLX3Clb+lOFImEET6h65IoRB5Xmi1Zzx1xPCXAG5vQaPH1bhw1wD3QX
IronPort-HdrOrdr: A9a23:mWu96q6G6aQ8/iYysgPXwMLXdLJyesId70hD6qhwISY7TiX+rb
 HKoB17726StN9/YhAdcLy7VZVoIkmsl6Kdg7NwAV7KZmCP0wGVxelZnO/fKlbbdREWmNQw6U
 4ZSdkcNOHN
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="58884312"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 11/57] libs/store: Remove PKG_CONFIG_REMOVE
Date: Mon, 6 Dec 2021 17:01:54 +0000
Message-ID: <20211206170241.13165-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

PKG_CONFIG_REMOVE doesn't do anything anymore. Commit dd33fd2e81
(tools: split libxenstore into new tools/libs/store directory) had
reintroduced it without saying why.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/store/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 43b018aa8c..c208dbb48a 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -27,8 +27,6 @@ CFLAGS += -I $(XEN_ROOT)/tools/xenstore
 xs.opic: CFLAGS += -DUSE_PTHREAD
 ifeq ($(CONFIG_Linux),y)
 xs.opic: CFLAGS += -DUSE_DLSYM
-else
-PKG_CONFIG_REMOVE += -ldl
 endif
 
 -include $(DEPS_INCLUDE)
-- 
Anthony PERARD


