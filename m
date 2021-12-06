Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1278B46A270
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239531.415491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTz-0007Sz-62; Mon, 06 Dec 2021 17:08:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239531.415491; Mon, 06 Dec 2021 17:08:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTy-0007BR-CW; Mon, 06 Dec 2021 17:08:54 +0000
Received: by outflank-mailman (input) for mailman id 239531;
 Mon, 06 Dec 2021 17:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPs-0005ta-DY
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98427bb0-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:04:39 +0100 (CET)
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
X-Inumbo-ID: 98427bb0-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810279;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=17GkR2xfeFdZkqadd7WfridmnTOn9dqn81AQSUR5V8Y=;
  b=J9ufKmkMFChxQwBbExT+t1+v6uNH19nH/9wxyT1vk3TmQzDidfe3xptB
   4578FWxRfZF8cU2R/UgMfdZwmed0OulSXsOKIfr7Xujy+I7wNZ7sGzb3h
   FtxJTlMm9/sUb5S1sxkwwftLsBPBnT/Cv8PZQW5efIzRk1AyMn3f9QFfC
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: UhMOe3HRq3IERCXBxThFhYhUOmg/zdsXCCRGZvlVBmcE4BIEchc7diJKsCJYjDbo+jKYCVGa4j
 xzLpUfxdlwpJiRgjyXY2D6Mfvoehl8Vt3+JBfHvWJt4A05qrNmxtrWi9xEipg0G4Ff491qskY2
 xp8vFZbah0Rks6rY2tXprW7h5FZYl8UjOgYmScAOuVi71JLyjp2HT7/4vd4geeqU6RqNEqn9Hi
 ERIrBwawgstyAyPnHW9Ca75fvBTAyS6WR7VPeC/HEcrNp5mIEL0MGIEEAgFTApyy9GI0/+Z9XC
 pplvkS2dkKBEgQKpNfb4Vzq/
X-SBRS: 5.1
X-MesageID: 59370747
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ocw5Oqjh1HCGEWY+22waEaFJX1615BcKZh0ujC45NGQN5FlHY01je
 htvDT+Eb/aKNmX0Ktl3YYnloBwGv8TczoJgHlZor389QXgb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29Qw34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /0Wka2pUBUoH5ecgekGf15ZMgFgL5dvreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNauPP
 JVBNmYwBPjGSyVTOQtUFMIApuCluiHSSSdd9E7J+7VitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRGRgfKdGbjyaF83ilm+vTtS79Q8cWBbq+sPlwjzW7x3MRIA0bU0Ohpvu0gVL4XMhQQ
 2QE9yxroaUs+UiDStjmQwb+sHOCpgQbWddbD6s98g7l4qPS/waeAHlCVjNbYcYqnMAzTD0uk
 FSOmrvU6SdH6ePPDyjHr/HN8G30aXN9wXI+iTEsFi80+sDxoaAJ3gvCVfokEY+VkM/PMGSlq
 9yVlxQWi7IWhM8N8qy0+1Hbnj6hzqT0oh4JChb/BTz8sF4gDGKxT8nxsAWAs64cRGqMZgDZ5
 CBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWeR4B3iUsI2aBj
 KrvVeV5vsU70JyCN/AfXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZ3wf5la
 MrBK5jzXR727JiLKhLsHY/xNpdxmUgDKZ77H8inn3xLL5LADJJqdVv1GATXNb1ohE91iA7U7
 8xeJ6O3J+Z3C4XDjt3s2ddLdzgidCFjbbiv8pA/XrPTc2JORTB6Y9eMkOxJRmCQt/kM/gs+1
 irmAREwJZuWrSCvFDhmnVg/Mu6yBsgm8ipgVcHuVH7xs0UejU+UxP93X/MKkXMProSPFNZ4E
 KsIfduuGPNKRmiV8jgRd8Cl/odjaA6qlUSFOC/8OGozeJtpRgro/N74f1SwqHlSX3Tv7cZu8
 ae90g77QIYYQ1gwBsjhd//ynUi6umIQmbwuUhKQcMVTYkjl7KNjNzf10q0sO8gJJBianmma2
 g+aDA02v+7Ip4NpotDFibrd99WiEvdkH1ocFG7etO7kOS7f92ul4IlBTOfXImyNCDKqoP2vP
 LwHwev9PfsLmEdxn7B9S7s7n7gj49bPpqNBylg2Fnv8cFn2WKhrJWOL3JcTu/QVlKNZowa/R
 mmG5sJeZeeSIMrgHVMceFglY+CE2a1GkzXe961ockDz5Ssx97ubS0RCeRKLjXUFfrdyNYokx
 8YnudIXtFPj2kZ7bI7eg3AG7XmII1wBT74j58MTD4LcgwY2zk1PPM7HASjs7ZDTM9hBPyHG+
 NNPaHYuU1iE+nf/Tg==
IronPort-HdrOrdr: A9a23:35G8C6MxWg2RDMBcTsejsMiBIKoaSvp037Eqv3ofdfUzSL3+qy
 nOpoVj6faaslcssR0b9OxofZPwI080lqQFhbX5X43DYOCOggLBR+tfBMnZsljd8kXFh4hgPM
 xbHZSWZuedMbEDt7eY3DWF
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59370747"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [XEN PATCH 52/57] stubdom: only build libxen*.a from tools/libs/
Date: Mon, 6 Dec 2021 17:02:35 +0000
Message-ID: <20211206170241.13165-53-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Avoid generating *.map files or running headers.chk when all we need
is the libxen*.a.

Also, allow force make to check again if libxen*.a needs rebuilt by
adding a '.PHONY' prerequisite.

Also, remove DESTDIR= as we don't do installation in this target, so
the value of DESTDIR doesn't matter.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 stubdom/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index ccfcf5b75f..5fb5dbc341 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -354,8 +354,8 @@ define BUILD_lib
  .PHONY: libxen$(1) clean-libxen$(1)
  libxen$(1): libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a
  libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: $$(LIBDEPS_$(1)) $$(LIBDEP_$(1))
- libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: mk-headers-$$(XEN_TARGET_ARCH) $$(NEWLIB_STAMPFILE)
-	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) DESTDIR= CONFIG_LIBXC_MINIOS=y -C libs-$$(XEN_TARGET_ARCH)/$(1)
+ libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: mk-headers-$$(XEN_TARGET_ARCH) $$(NEWLIB_STAMPFILE) .phony
+	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y -C $$(@D) $$(@F)
 
  clean-libxen$(1):
 	[ ! -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ] || $$(MAKE) DESTDIR= -C libs-$$(XEN_TARGET_ARCH)/$(1) clean
-- 
Anthony PERARD


