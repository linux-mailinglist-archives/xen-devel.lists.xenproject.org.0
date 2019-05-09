Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32DA19316
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 21:52:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOp2T-00066k-Uc; Thu, 09 May 2019 19:49:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/9x=TJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hOp2R-00066V-Ub
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:49:07 +0000
X-Inumbo-ID: 7fd02e0e-7293-11e9-8342-97c8c5687abb
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fd02e0e-7293-11e9-8342-97c8c5687abb;
 Thu, 09 May 2019 19:49:04 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id E3557261C7;
 Thu,  9 May 2019 15:49:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 09 May 2019 15:49:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/tjdqGMOX9Qb8VVKC
 c4eaXGteEbLZhiLO6hJR/bn2N4=; b=6PSQYPKmZ8Vr9qmK6jhpKG+u1DvncqCMb
 /djoLYWvYZcgfUAlzFJawljKQX3izcGEex7871ISMyDl1eeWhez9+4Hwy/cAbJ1L
 YQ7WLKxEjMliZLJYc8S7mFaCM0Mq9mb9cUsjz7ZjIUMC9CAQt3TsqSyJJ2T0dfb7
 xtXiywohuJaoQ2oNoWehBZspWpOVm4Rb34vidilc77PsH10/oX/oAKgKjLetK26S
 ZcWvw7+7mik+WRTcNU3PBxw4CU5emBoUEko6Xn7dhMgCvXx8XeG/gw+Liaam6+OI
 lmvWJcOkykLkrAezO6LQheEJL4TsINtttKSftQ4eKWvzMZqqH+gZw==
X-ME-Sender: <xms:L4TUXF8KBNvqJDPW27ZB8vMHyza3Ab3DGE_J7bCROGNG6pa6rEYONg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeigdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fthfevqddqjfgurhdqufhushhpvggtthdqlhhoficuldehmdenucfjughrpefhvffufffk
 ofgjfhggjghftgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihi
 hkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
 hhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrg
 hmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:L4TUXAlA_z2D7EPHxyjAq3b2I_Z0_o5fMr1JIB4cpTGo6nXO5QXlCQ>
 <xmx:L4TUXP_aE5pxZeouXHImt6FTkQ6OFXA8zPqpS_2ZAqeVUaBktWK0gg>
 <xmx:L4TUXGliHOSDRILbk4LsduIt9J8R5ct7D9u3Es7HaJ-fylz2joWFNg>
 <xmx:L4TUXGz173_KFBPLw8hjfSixFCEI8sauzNrG4DS60OjrQ6G50DRQFw>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CC14103D0;
 Thu,  9 May 2019 15:49:01 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 May 2019 21:48:52 +0200
Message-Id: <eddbab0d58a78f10882ea0271d5b38b4e38763d1.1557431250.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
Subject: [Xen-devel] [PATCH v2 1/5] xen/bitmap: fix bitmap_fill with
 zero-sized bitmap
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBiaXRtYXBfZmlsbCguLi4sIDApIGlzIGNhbGxlZCwgZG8gbm90IHRyeSB0byB3cml0ZSBh
bnl0aGluZy4gQmVmb3JlCnRoaXMgcGF0Y2gsIGl0IHRyaWVkIHRvIHdyaXRlIGFsbW9zdCBMT05H
X01BWCwgc3VyZWx5IG92ZXJ3cml0aW5nCnNvbWV0aGluZy4KClNpZ25lZC1vZmYtYnk6IE1hcmVr
IE1hcmN6eWtvd3NraS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4K
UmV2aWV3ZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQogeGVuL2luY2x1
ZGUveGVuL2JpdG1hcC5oIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9iaXRtYXAuaCBiL3hlbi9pbmNsdWRlL3hlbi9i
aXRtYXAuaAppbmRleCBmZTNjNzIwLi4wNDMwYzFjIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94
ZW4vYml0bWFwLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2JpdG1hcC5oCkBAIC0xMjYsNiArMTI2
LDggQEAgc3RhdGljIGlubGluZSB2b2lkIGJpdG1hcF9maWxsKHVuc2lnbmVkIGxvbmcgKmRzdCwg
aW50IG5iaXRzKQogCXNpemVfdCBubG9uZ3MgPSBCSVRTX1RPX0xPTkdTKG5iaXRzKTsKIAogCXN3
aXRjaCAobmxvbmdzKSB7CisJY2FzZSAwOgorCQlicmVhazsKIAlkZWZhdWx0OgogCQltZW1zZXQo
ZHN0LCAtMSwgKG5sb25ncyAtIDEpICogc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKTsKIAkJLyogZmFs
bCB0aHJvdWdoICovCi0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
