Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF9E45DB7F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231272.400172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5s-0001Y0-IH; Thu, 25 Nov 2021 13:47:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231272.400172; Thu, 25 Nov 2021 13:47:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5s-0001Ju-1t; Thu, 25 Nov 2021 13:47:20 +0000
Received: by outflank-mailman (input) for mailman id 231272;
 Thu, 25 Nov 2021 13:47:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF0b-00076i-Vu
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:54 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71e503af-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:53 +0100 (CET)
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
X-Inumbo-ID: 71e503af-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847712;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8lx/+jmrSiPW0TNI8HSQ6GVzRfM87w+Yl5TJDEX54CU=;
  b=ChiTAraC+gHUTVdnejHn5Q/4+0WZ9dUJ++QIauSyNUZQklOUmDtfRg1J
   ez+vGXTlwmQf3iPZjPK7U79HYR7ryEQjQbMvoxe6aiMHB0YS/jGmPizoH
   L2/rvu+KF1YVRb3mxuj5do+fYUkV6NuPYdIZg2+wkmCYASQ3600JFkh8f
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QCGyXCny18waiPeNFNdUK2P7IBiw+R9MtneBAJBU/vvid/7vySpZkENhfvopyfDJurMhWxGQLp
 IiwXw8RgdvAP2cRHu7uBnkOFR8L9OFT8yB4+jtbvuC3X+TcRjZF9vKxig9xn+BB2BAmOkOK+YX
 v2maK15/WY/GZtFEHToXkF1UVyt40dhhyF1C5cfIwmjdxQMZnaR3TD/gT3YL2EMjNTP4kLwhKs
 Cz3CDajNBz6qCSOnaX6yeZ+mzK73Oh+69H7SBCFk7ILhdHwab9kdhzMu3TFGZ/OdqeeQzRvsX9
 eA07HWnmqI9L+GKk7o7aoMMD
X-SBRS: 5.1
X-MesageID: 58637880
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:zScv/qI+g/1ul3pcFE+RHpIlxSXFcZb7ZxGr2PjKsXjdYENSg2ZTm
 GVNDDuAMq7cYmP0ct1yOtjk8kMPuZDRx4dqHgplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2noP58w
 Y1opaaMZiA0GZTInb4kY0NhRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gpg2JsRTaaGD
 yYfQWAoZwSZOSUeBm4KDp8TzKSIo33xNBQN/Tp5ooJoujOOnWSdyoPFO9PPdtuHbc5chEqfq
 yTN+GGRKhgcKNyYzyvD6n+2j/XDtSz+UYMWUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nHFHVfGkAUf++iTd+EdBBZwASIXW9T1h1IL63CiUDzAhXgR9R/s7k/YyQGYT5
 gWwyoaB6SNUjJWZTneU97GxpDy0ODQIIWJqWRLoXTfp8PG4/tht00unosJLVffs04arQW2YL
 yWi9XBm390uYdg3O7JXFLwtqxalvdD3QwE8/W07tUr1v1oiNOZJi2FFgGU3DMqszq7FETFtX
 1BewqByCdzi6rnXyUSwrB0lRu3B2hp8GGS0baRTN5cg7S+x3HWoYJpd5jpzTG8wbJ1bJmC4M
 B+C410AjHO2AJdNRfUpC79d9uxwlfSwfTgbfqy8giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmDOCLbimnk/P+efPOxaopUItbQLmghYRt/jf/m04M
 r93aqO39vmoeLGkP3SMr9dMdQtiwLpSLcmelvG7v9WremJOcFzNwdeKqV/4U4A6zalTiMnS+
 XSxBh1RxFbl3CWVIgSWcHFzLrjoWM8n/348OCUtO3eu2mQiPtnzvPtOKcNvcOl17vFnwN51U
 +IBJ5eKDMNQR2mV4D8ad5T88tBvLUz5mQKUMiO5SzEjZJo8FRfR89rpc1K3pikDBya6r+Ukp
 Lik2l+JSJYPXV06Xs3XdOiu3xW6un1EwLB+WE7BI99yfkTw8dc1d3yt36Fve8xVcEfN3DqX0
 QqSECw0n+iVrt9n6sTNiICFs5ytT7l0EH1FEjSJ9r2xLyTboDaumNcSTOaScDnBf2ro46H+N
 /5NxvTxPfBbzlZHt41wT+Riwa4kvoa9orZbykJvHWnRbkTtAbRleyHU0c5Kv6xL57lYpQrpB
 R7fpogEYe2EaJH/DVocBAs5deDSh/gblw7b4ekxPEintjR8+6CKUBkKMhSB4MCHwGCZ7G/xL
 T8dhfMr
IronPort-HdrOrdr: A9a23:3x3n2q4SBz0OXktGywPXwU2BI+orL9Y04lQ7vn2ZFiYlEPBwxv
 re/8jziyWVtN9IYgBfpTlEAtjzfZquz+8F3WBxB9mftWbdyRGVxe1ZnOzfKnjbalLDH41mpO
 hdmspFeaDN5DFB5K6QimbYYrNQpOVr6JrFuQ6d9QYQcegDUdAi0+4TMHfjLqQCfng8OXNPLu
 vl2iMonUvHRV0nKu68C3U5Qe6Gg9HQjprpbT4qbiRXqTWmvHeD7rP3Lgaf5wwZWT9U27sumF
 K10zAR0p/T8c1ThyWsj1M6IPxt6Zfc4+oGIPbJptkeKz3qhArtTIN9W4eatDRwm+2r4EZCqq
 iGn/91Vf4f11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA0rkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkINUjgYdq3NwiFX5uYcs99WPBmd0a+d
 BVfZvhDSNtAAynh3OwhBgm/DXjZAV8b0S7qo5rgL3R79EcpgEI86Ii/r1qop/bnKhND6Wsr9
 60QZiAtIs+CPP+PpgNXdvot6OMeyHwqSylChPlHbwRfJt3cU4l7aSHu4kd5OakfoEFxpp3mJ
 mpaiIeiYcCQTOmNSTV5uw/zvnkehTLYQjQ
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="58637880"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Anthony PERARD
	<anthony.perard@gmail.com>, Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v8 35/47] RFC, no-VPATH: Kconfig: tell where Kconfig files are
Date: Thu, 25 Nov 2021 13:39:54 +0000
Message-ID: <20211125134006.1076646-36-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@gmail.com>

deps_config is the list of all Kconfig files, we need to say that they
are in the source tree, or make isn't going to find them without
VPATH and will try to rebuild 'syncconfig' over and over again.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/tools/kconfig/confdata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/tools/kconfig/confdata.c b/xen/tools/kconfig/confdata.c
index a69250c91355..4f9139d055be 100644
--- a/xen/tools/kconfig/confdata.c
+++ b/xen/tools/kconfig/confdata.c
@@ -971,6 +971,7 @@ static int conf_write_dep(const char *name)
 		else
 			fprintf(out, "\t%s\n", file->name);
 	}
+	fprintf(out, "deps_config := $(addprefix $(srctree)/, $(deps_config))\n");
 	fprintf(out, "\n%s: \\\n"
 		     "\t$(deps_config)\n\n", conf_get_autoconfig_name());
 
-- 
Anthony PERARD


