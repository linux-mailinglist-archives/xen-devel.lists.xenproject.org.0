Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854B046A24C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239482.415230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSn-00020f-Tw; Mon, 06 Dec 2021 17:07:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239482.415230; Mon, 06 Dec 2021 17:07:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHSn-0001lR-6d; Mon, 06 Dec 2021 17:07:41 +0000
Received: by outflank-mailman (input) for mailman id 239482;
 Mon, 06 Dec 2021 17:07:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPo-0005ta-Kr
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:36 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95c7e7e0-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:04:35 +0100 (CET)
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
X-Inumbo-ID: 95c7e7e0-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810275;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e1NkHAQPfUnAtHDePdITPlx+ldg10pRV4o24t5c0gJk=;
  b=O3f6icxWvYVrM0z4Wa29/2DAIPr9tWzzBhN5nxJr/wQTbIL2bCLW/oy4
   PdH8VLCD3Dzdp8gm0LHUn/iL9GoKwscHYNWAQLByw7CG9Ghx7LtlLv7Kx
   qGx690gjq6bsk9z2fSOuI5G0NQRE+RNLaZb2/yONvrO+3VzVtywlKOyfl
   k=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: YdG7wedAVNPucWIF4lx8DrQU/DiJl0Mh2wZ06U+Eud91fHe24OImndvWB4o7ou1i+MQLJiWHpx
 QRrJ661YgHjG2u/Nn349JE77F5HGHXN+AByoZGY8hIrKQs8/M6CQGCdTEcN1Obx+hEEJIaATMF
 hpKEb88BfzPv8VQehCniew98sW2E7uhAonnxPdLbrpmpKSY2E3C6xMZEPGNmat4wPBfSf4hFft
 8CdlkXXFgTk0VT8xWGLXXHFLc0gb95C6Yp+MOu5T7zao+qIWZkiE+Cj8DVXkIu/7+D8Wimjtbv
 ySny5v8Wflm252tJ6klHBA6Z
X-SBRS: 5.1
X-MesageID: 59388021
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:OBHA4KKSBFpFt4b6FE+RIJIlxSXFcZb7ZxGr2PjKsXjdYENS1TcPx
 2EbCzqBa63eNmD3eNl/YIS//U1U65GBnIIxG1RlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eg7xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Og4lu4
 ttdmaDscjUwBPbSm9kkSUBxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gph3ZAeRayHD
 yYfQTxfVhicSQZhBhQeLJ0+wtqi2Sf7LSIN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 G3c+H/iKgoHL9HZwj2Amlqtme3njS79QJgVFrCz6rhtmlL77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVVhukoHmCr1gEVsBZCeES5wSEy66S6AGcblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpWSVSuC3LmEgQ/uAhoMFzQcZhI9V1IstoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNt1shPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWB2DaD/LF7rlxBHkJPm6gKulmSw28zba45lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIEePcIgKVXdon4+DaJ144wLuBJ2+U3YE
 c3EGftA8F5AUfg3pNZIb7l1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3mGmaZOfAtiBSVqWvjLRzl/K7frzvxOQzp6VZc8ANoJJuRYokiivruSo
 yzmBBYHkAGXaL+uAVziV02PoYjHBf5XxU/X9wRwVbpx83R8M4up8okFcJ47Iesu+OB5lKYmR
 PgZYcSQRP9IT22fqTgaaJD8qq1kdQiq2l3Sb3b0PmBncs4yXRHN9//lYhDrqHsEAB2ouJZsu
 LanzA7aH8YOHlwwEMbMZfuz5FqtpnxByvlqVk7FL4ALKkXh+YRnMQLrifozL51eIBnP3GLCh
 Q2XHQ0Zta/GpIpsqIvFgqWNroGIFepiHxUFQzmHvOjubSSDpzit245NVuqMbAvxbmKs9fXwf
 /hRwtH9LOYDwARAvb1jHus51qk5/dbu+eNXl1w2AHXRYl23Ibp8OX3aj9JXv6hAy7IF6wu7X
 kWDpotTNbmTYZ63FVcQIEwub/iZ1OFSkT7XtKxnLEL/7S5x3byGTUQNYEXc1H0DdON4YNE/3
 OMsmM8K8Aju2BMlP+GPgj1Q62nRfGcLVL8qt81CDYLm4ubxJoquvXAI5vfK3ayy
IronPort-HdrOrdr: A9a23:6IJ9mKMWWMMOQMBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59388021"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 49/57] libs/toolcore: don't install xentoolcore_internal.h anymore
Date: Mon, 6 Dec 2021 17:02:32 +0000
Message-ID: <20211206170241.13165-50-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

With "xentoolcore_internal.h" been in LIBHEADER, it was installed. But
its dependency "_xentoolcore_list.h" wasn't installed so the header
couldn't be used anyway.

This patch also mean that the rule "headers.chk" doesn't check it
anymore as well.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/toolcore/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/toolcore/Makefile b/tools/libs/toolcore/Makefile
index 632048c899..360a10e5da 100644
--- a/tools/libs/toolcore/Makefile
+++ b/tools/libs/toolcore/Makefile
@@ -5,7 +5,7 @@ MAJOR	= 1
 MINOR	= 0
 AUTOINCS := $(XEN_INCLUDE)/_xentoolcore_list.h
 
-LIBHEADER := xentoolcore.h xentoolcore_internal.h
+LIBHEADER := xentoolcore.h
 
 OBJS-y	+= handlereg.o
 
-- 
Anthony PERARD


