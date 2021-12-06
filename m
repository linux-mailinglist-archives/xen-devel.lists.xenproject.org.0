Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623646A1EC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:03:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239421.415004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOP-0007GW-Oz; Mon, 06 Dec 2021 17:03:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239421.415004; Mon, 06 Dec 2021 17:03:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHOP-00079u-H2; Mon, 06 Dec 2021 17:03:09 +0000
Received: by outflank-mailman (input) for mailman id 239421;
 Mon, 06 Dec 2021 17:03:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHOO-0005ta-9c
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:03:08 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61157ab3-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:03:07 +0100 (CET)
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
X-Inumbo-ID: 61157ab3-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810187;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DaXrysSp90BOa7sFLTeOykjPBw9Q7LCEVZdF9MEMsoE=;
  b=DzcK9qCnzNPwzJM9IMZIbmWbKDB/8CF4X8em30ULNMPw7nqyzq0ub1cl
   JhokXC6VwnbSDAcAYzds6aMNJvGbxo0UT5XLszNd+y7ehYS95YW8Ra3BF
   e1pWBACmlQbvoVJRJeKNoCku3dp4WYoFMp/7Cp+mqfTA6naEYIGaEsG+Y
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3g1gjSOqn/8TRY7RoV705Ql66WfCzKRg3U1yPMjNX42Imr3IJpqCpwx6XsHQOsZi8WCOBbnQJz
 Gi3tRlJI/dbYEWP9RTLpOe4YAyam0r0AO3WSCtxiPneJ6eZx3nC0YYzcee/IwQ7ZeJHq/ZWWwz
 kHLDvHlMqtWERlReTWCqS/6/Igoywp7hGZ3x7eaUPxA1WxapJUGJSwF6kLABxlBKsWfF8wMD7u
 21NtmMebKRNqxqnM3leHMi+r+3HSpqk1hkpGxqbM4+Gl0yAf2FT3p7G6lNDCvlLKEaDLgk57lD
 /lnDE4ZRXFM4tASLRHArTFKl
X-SBRS: 5.1
X-MesageID: 59370474
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:eMYLxqIiAzREeCT3FE+RIZIlxSXFcZb7ZxGr2PjKsXjdYENS12EHx
 mEXXD2DP6qCMTDzKNtzYYy3oEtSu56Dn9VkHgRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Eg7xbZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB3Sz8Bvx
 ot3m6WcWCVxP6f3mO8ddwJXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gph3Z8WQamCD
 yYfQSZ2aQj4YUEXBmkKNZduoN73l3P2VwQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 G3c+H/iKgoHL9HZwj2Amlqtme3njS79QJgVFrCz6rhtmlL77nweDlgaWEW2pdG9i1WiQJRPJ
 koM4C0soKMuskuxQbHVVhukoHmCr1gEVsBZCeES5wSEy66S6AGcblXoVRYYNoZg7pVvA2V3i
 BnZxLsFGACDrpXOGWKD+OmugwqeKApNLGU5ZSQEaRAKtoyLTJ4IsjrDSdNqEaiQh9LzGC3tz
 z3ikBXSl4n/nuZQifzloAmvbyaE48GQE1Vrvlm/sneNt1shPOaYi5qUBU83BBqqBKKQVRG/s
 XcNgKByB8heXMjWxERhrAjgdYxFBspp0hWB2DaD/LF7rlxBHkJPm6gKulmSw28zba45lcfBO
 hO7hO+ozMY70IGWRaF2eZmtLM8h0LLtE9/oPtiNMIEePcIgKVXdon4+DaJ144wLuBJ2+U3YE
 c3EGftA8F5AUfg3pNZIb7l1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PVBt3VGJis+V2Pm
 /4GbpPi40wGDIXWP3mGmaZOfAtiBSVqWvjLRzl/K7frzvxOQzp6VZc8ANoJJuRYokiivruSo
 yzmBBYHkAGXaL+uAVziV02PoYjHBf5XxU/X9wR2Zz5EAlAvPtSi6rkxbZwyceV1/eBv16csH
 fIEZ9+BErJETTGeo2YRapz0rYpDchW3hF3RY3r5MWZnJ5MwFRbU/tLEfxf08HVcBCSAqsZj8
 aar0RnWQMRfSl06XtrWcv+m03i4oWMZxLBpR0LNL9QKIBfs/YFmJjbflPgyJ81QexzPyiHDj
 1SdAAsCpPmLqIgwqYGbiaeBpoavMu1/AksFQDWLsefobXHXpzPxz5VBXeCEeSHmeFn1oKjyN
 /9Iy/zcMeEcmAoYuYRLDLs2n7k14MHipuEGw108TmnLdVmiFphpPmKCgZtUrqRIy7JU5Vm2V
 0aI9oUIMLmFIpq4QlsYJQ5jZeWfz/AE3DLV6K1tckn94SZ2+puBUFlTYEbQ2HAMcuMtPdN32
 /olte4X9xe720gjPduxhyxJ83iBcy4bWKI9u5BGWILmh2LHEL2ZjUAw3sMu3KyyVg==
IronPort-HdrOrdr: A9a23:pprZf61ZUOn8izpAeBbdQwqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59370474"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 05/57] libs: Remove -Iinclude from CFLAGS
Date: Mon, 6 Dec 2021 17:01:48 +0000
Message-ID: <20211206170241.13165-6-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

They are no more directory libs/*/include.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/libs.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index ebdb2a4782..830bdc851f 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -12,7 +12,7 @@ MINOR ?= 0
 SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
 
 CFLAGS   += -Werror -Wmissing-prototypes
-CFLAGS   += -I./include $(CFLAGS_xeninclude)
+CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
 
 LDUSELIBS = $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
-- 
Anthony PERARD


