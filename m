Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 527FF19311
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 21:51:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOp2Y-00067z-V1; Thu, 09 May 2019 19:49:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/9x=TJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hOp2X-00067n-IL
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:49:13 +0000
X-Inumbo-ID: 839bb896-7293-11e9-a434-9bc2b4b1f565
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 839bb896-7293-11e9-a434-9bc2b4b1f565;
 Thu, 09 May 2019 19:49:10 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 71B759A2F;
 Thu,  9 May 2019 15:49:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 09 May 2019 15:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3bK0thz9tq9hjxecf
 EL8naAOTRTUEHVihfUgwxt06Wg=; b=sfOZBT7NtEraBdXzScPoL4fR86a4XH454
 VCy/YaEQfIM2GXZORntNMXc3hkuuimC2zRnxyID7QbK4yGvaMODabylu+Sm+LJjM
 XwY9WB4emFKEF2KtljO5uOYfxEdaKTobcAmzVAFisNfWAi9Rc4yH/wPKH8mHFpwb
 EbSeCT+2hx7vW/Oix03lqmtB8lOpLAoOAFdxnn+BzGlgH8JDwaV26n8qMj4U7EYc
 l264GIYPBo+UJjOpCvAlh/p9GeoWWcSQ0mRRklokWZyVGZ3hVC6dB/LeJSRL1xjC
 5Ry4EB8tu88TU8kLI8wAT5osDG7yGK4KIzuVnrfcyKWafpDsMWaiA==
X-ME-Sender: <xms:NoTUXPZ2sbORqvIFXUwxK_115g9ahcHNgv7VelX3q_jw_gauEMLiEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeigdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fthfevqddqjfgurhdqufhushhpvggtthdqlhhoficuldehmdenucfjughrpefhvffufffk
 ofgjfhggjghftgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihi
 hkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
 hhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrg
 hmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedu
X-ME-Proxy: <xmx:NoTUXDVgxf_KtCnyqgmzRusOgoVamHPUknNbH24Y-TvUiUMgFxgikw>
 <xmx:NoTUXGPE1WOzdYfXUkdWKsxzcdEgjyJry4v8A3ZUWlVFSm4YI5NwdQ>
 <xmx:NoTUXFZGW4dMdt75AvDb7graNY1KL7Cue7Z5-96PzlYEDKelFaBA4g>
 <xmx:NoTUXMGoxAYTM1Qbwp73TyAKYUOryejazKoXuRHZOwrvhnhm83YrSg>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id BF011103D2;
 Thu,  9 May 2019 15:49:08 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 May 2019 21:48:56 +0200
Message-Id: <1b867212c9a027fdbd7ec9d48c57011ab7b931cc.1557431250.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
Subject: [Xen-devel] [PATCH v2 5/5] drivers/video: use vlfb_info consistently
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

dmxmYl9pbmZvIGlzIGFuIGFsaWFzIGZvciB2Z2FfY29uc29sZV9pbmZvLnUudmVzYV9sZmIsIHNv
IHRoaXMgY2hhbmdlIGlzCnB1cmVseSBjb3NtZXRpYy4gQnV0IHVzaW5nIHRoZSBzYW1lIG5hbWUg
aGVscHMgcmVhZGluZyB0aGUgY29kZS4KClNpZ25lZC1vZmYtYnk6IE1hcmVrIE1hcmN6eWtvd3Nr
aS1Hw7NyZWNraSA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNvbT4KQWNrZWQtYnk6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQogeGVuL2RyaXZlcnMv
dmlkZW8vdmVzYS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvdmlkZW8vdmVzYS5jIGIveGVuL2Ry
aXZlcnMvdmlkZW8vdmVzYS5jCmluZGV4IGYwN2QyOTMuLmU5OTE4YTcgMTAwNjQ0Ci0tLSBhL3hl
bi9kcml2ZXJzL3ZpZGVvL3Zlc2EuYworKysgYi94ZW4vZHJpdmVycy92aWRlby92ZXNhLmMKQEAg
LTQ5LDcgKzQ5LDcgQEAgdm9pZCBfX2luaXQgdmVzYV9lYXJseV9pbml0KHZvaWQpCiB7CiAgICAg
dW5zaWduZWQgaW50IHZyYW1fdm1vZGU7CiAKLSAgICB2Z2FfY29tcGF0ID0gISh2Z2FfY29uc29s
ZV9pbmZvLnUudmVzYV9sZmIuZ2JsX2NhcHMgJiAyKTsKKyAgICB2Z2FfY29tcGF0ID0gISh2bGZi
X2luZm8uZ2JsX2NhcHMgJiAyKTsKIAogICAgIGlmICggKHZsZmJfaW5mby5iaXRzX3Blcl9waXhl
bCA8IDgpIHx8ICh2bGZiX2luZm8uYml0c19wZXJfcGl4ZWwgPiAzMikgKQogICAgICAgICByZXR1
cm47Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
