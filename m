Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CC119314
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 21:52:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOp2V-000676-H6; Thu, 09 May 2019 19:49:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/9x=TJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hOp2U-00066v-LR
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 19:49:10 +0000
X-Inumbo-ID: 82bd7907-7293-11e9-8980-bc764e045a96
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 82bd7907-7293-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 19:49:09 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id DAB272AD78;
 Thu,  9 May 2019 15:49:08 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 09 May 2019 15:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=rPR+EZnTnBfR2E2Qh
 v7TsO5AaXKBrxw8tRcjNzXVCgU=; b=7qhlPEeKmBM/A8ZQhgrYlv1MOaTVU4Dqn
 FX+J3JUdelydSJ0+21d47H1Owgoc765D+2UItc+g6l+evdwOS9N1HPeDk8Rh0vhm
 jebXK93+ns6hQxxfJUuitpGBcy2DKR3RrzBOcLmDOGSTGC3fIohGDGnmd/2L19xi
 asQar3JXkYLGJUEiM55p+45qTUEPZ4FSpZcvisGOlRxJdMNsdHndMaspm+/zCh3o
 cnAAiBR5ulCNbOHSNelLcdlKzuChMfjI0lP3Ioq6tEtCXSQzubGOQCjGgTGB2b3N
 jskmDpEJlrUmLPdpTnWudexQ5AMqq7S/FuKmZkQ/iG4aHqZbtxJdg==
X-ME-Sender: <xms:NITUXDA8EciFqfBLLfdtzuqWNudzjZNqZpiIQspfQv_dT0TmphpbeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkeeigdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenog
 fthfevqddqjfgurhdqufhushhpvggtthdqlhhoficuldehmdenucfjughrpefhvffufffk
 ofgjfhggjghftgfgsehtkeertdertdejnecuhfhrohhmpeforghrvghkucforghrtgiihi
 hkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvght
 hhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepughomhdtrdhinhhfohenucfkph
 epledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghr
 vghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghruf
 hiiigvpedt
X-ME-Proxy: <xmx:NITUXAcejdy9G6D1cJK0SRB-qEsyF18256lHEXhBWmYUv8XBKQq6rA>
 <xmx:NITUXDplcyM2WCHk2NBYot8Toc-bx7BfIyqjH-752ttqPpYxLCiUag>
 <xmx:NITUXM5tQod453h8Ew5-qf2zmHYOwgy-c53635nPYAkcCEIr5hdYlw>
 <xmx:NITUXHY-bSM2ueKNm0qzIUxzE973pgy6ObhWIfLcksFciP4rCKsivA>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 11AB3103D0;
 Thu,  9 May 2019 15:49:06 -0400 (EDT)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Thu,  9 May 2019 21:48:55 +0200
Message-Id: <706a1e5f87ae789197fba3a268b18183fd4b8e5b.1557431250.git-series.marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
In-Reply-To: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
References: <cover.1ff4fbcf3cedbe34db420b46be69328b299f325e.1557431250.git-series.marmarek@invisiblethingslab.com>
Subject: [Xen-devel] [PATCH v2 4/5] xen: fix handling framebuffer located
 above 4GB
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gc29tZSBtYWNoaW5lcyAoZm9yIGV4YW1wbGUgVGhpbmtwYWQgUDUyKSwgVUVGSSBHT1AgcmVw
b3J0cwpmcmFtZWJ1ZmZlciBsb2NhdGVkIGFib3ZlIDRHQiAoMHg0MDAwMDAwMDAwIG9uIHRoYXQg
bWFjaGluZSkuIFRoaXMKYWRkcmVzcyBkb2VzIG5vdCBmaXQgaW4ge3hlbixkb20wfV92Z2FfY29u
c29sZV9pbmZvLnUudmVzYV9sZmIubGZiX2Jhc2UKZmllbGQsIHdoaWNoIGlzIDMyYml0LiBUaGUg
b3ZlcmZsb3cgaGVyZSBjYXVzZSBhbGwga2luZCBvZiBtZW1vcnkKY29ycnVwdGlvbiB3aGVuIGFu
eXRoaW5nIHRyaWVzIHRvIHdyaXRlIHNvbWV0aGluZyBvbiB0aGUgc2NyZWVuLApzdGFydGluZyB3
aXRoIHplcm9pbmcgdGhlIHdob2xlIGZyYW1lYnVmZmVyIGluIHZlc2FfaW5pdCgpLgoKRml4IHRo
aXMgc2ltaWxhciB0byBob3cgaXQncyBkb25lIGluIExpbnV4OiBhZGQgZXh0X2xmYl9iYXNlIGZp
ZWxkIGF0CnRoZSBlbmQgb2YgdGhlIHN0cnVjdHVyZSwgdG8gaG9sZCB1cHBlciAzMmJpdHMgb2Yg
dGhlIGFkZHJlc3MuIFNpbmNlIHRoZQpmaWVsZCBpcyBhZGRlZCBhdCB0aGUgZW5kIG9mIHRoZSBz
dHJ1Y3R1cmUsIGl0IHdpbGwgd29yayB3aXRoIG9sZGVyCkxpbnV4IHZlcnNpb25zIHRvbyAob3Ro
ZXIgdGhhbiB1c2luZyBwb3NzaWJseSB0cnVuY2F0ZWQgYWRkcmVzcyAtIG5vCndvcnNlIHRoYW4g
d2l0aG91dCB0aGlzIGNoYW5nZSkuIFRoYW5rcyB0byBBQkkgY29udGFpbmluZyBzaXplIG9mIHRo
ZQpzdHJ1Y3R1cmUgKHN0YXJ0X2luZm8uY29uc29sZS5kb20wLmluZm9fc2l6ZSksIExpbnV4IGNh
biBkZXRlY3Qgd2hlbgp0aGlzIGZpZWxkIGlzIHByZXNlbnQgYW5kIHVzZSBpdCBhcHByb3ByaWF0
ZWx5IHRoZW4uCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVja2kgPG1h
cm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgogLSBndWFy
ZCBleHRfbGZiX2Jhc2Ugd2l0aCAjaWYgX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXywgYnV0IGFs
d2F5cwogICBpbmNsdWRlIHdoZSBidWlsZGluZyBYZW4gaXRzZWxmCiAtIGFkZCBhIGhlbHBlciBm
dW5jdGlvbiBmb3IgbGZiX2Jhc2UKLS0tCiB4ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmggfCAg
MSArCiB4ZW4vZHJpdmVycy92aWRlby92ZXNhLmMgICAgfCAxMyArKysrKysrKystLS0tCiB4ZW4v
aW5jbHVkZS9wdWJsaWMveGVuLmggICAgfCAgNCArKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2Vm
aS9lZmktYm9vdC5oIGIveGVuL2FyY2gveDg2L2VmaS9lZmktYm9vdC5oCmluZGV4IDU3ODlkMmMu
LjdhMTNhMzAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaAorKysgYi94
ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKQEAgLTU1MCw2ICs1NTAsNyBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgZWZpX2FyY2hfdmlkZW9faW5pdChFRklfR1JBUEhJQ1NfT1VUUFVUX1BST1RPQ09M
ICpnb3AsCiAgICAgICAgIHZnYV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5ieXRlc19wZXJfbGlu
ZSA9CiAgICAgICAgICAgICAobW9kZV9pbmZvLT5QaXhlbHNQZXJTY2FuTGluZSAqIGJwcCArIDcp
ID4+IDM7CiAgICAgICAgIHZnYV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5sZmJfYmFzZSA9IGdv
cC0+TW9kZS0+RnJhbWVCdWZmZXJCYXNlOworICAgICAgICB2Z2FfY29uc29sZV9pbmZvLnUudmVz
YV9sZmIuZXh0X2xmYl9iYXNlID0gZ29wLT5Nb2RlLT5GcmFtZUJ1ZmZlckJhc2UgPj4gMzI7CiAg
ICAgICAgIHZnYV9jb25zb2xlX2luZm8udS52ZXNhX2xmYi5sZmJfc2l6ZSA9CiAgICAgICAgICAg
ICAoZ29wLT5Nb2RlLT5GcmFtZUJ1ZmZlclNpemUgKyAweGZmZmYpID4+IDE2OwogICAgIH0KZGlm
ZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZpZGVvL3Zlc2EuYyBiL3hlbi9kcml2ZXJzL3ZpZGVvL3Zl
c2EuYwppbmRleCBjOTI0OTdlLi5mMDdkMjkzIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy92aWRl
by92ZXNhLmMKKysrIGIveGVuL2RyaXZlcnMvdmlkZW8vdmVzYS5jCkBAIC00MCw2ICs0MCwxMSBA
QCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9mb250X2hlaWdodChjb25zdCBjaGFyICpzKQogfQog
Y3VzdG9tX3BhcmFtKCJmb250IiwgcGFyc2VfZm9udF9oZWlnaHQpOwogCitzdGF0aWMgaW5saW5l
IHBhZGRyX3QgbGZiX2Jhc2Uodm9pZCkKK3sKKyAgICByZXR1cm4gKHBhZGRyX3QpKHZsZmJfaW5m
by5leHRfbGZiX2Jhc2UpIDw8IDMyIHwgdmxmYl9pbmZvLmxmYl9iYXNlOworfQorCiB2b2lkIF9f
aW5pdCB2ZXNhX2Vhcmx5X2luaXQodm9pZCkKIHsKICAgICB1bnNpZ25lZCBpbnQgdnJhbV92bW9k
ZTsKQEAgLTk3LDE1ICsxMDIsMTUgQEAgdm9pZCBfX2luaXQgdmVzYV9pbml0KHZvaWQpCiAgICAg
bGZicC50ZXh0X2NvbHVtbnMgPSB2bGZiX2luZm8ud2lkdGggLyBmb250LT53aWR0aDsKICAgICBs
ZmJwLnRleHRfcm93cyA9IHZsZmJfaW5mby5oZWlnaHQgLyBmb250LT5oZWlnaHQ7CiAKLSAgICBs
ZmJwLmxmYiA9IGxmYiA9IGlvcmVtYXAodmxmYl9pbmZvLmxmYl9iYXNlLCB2cmFtX3JlbWFwKTsK
KyAgICBsZmJwLmxmYiA9IGxmYiA9IGlvcmVtYXAobGZiX2Jhc2UoKSwgdnJhbV9yZW1hcCk7CiAg
ICAgaWYgKCAhbGZiICkKICAgICAgICAgcmV0dXJuOwogCiAgICAgbWVtc2V0KGxmYiwgMCwgdnJh
bV9yZW1hcCk7CiAKLSAgICBwcmludGsoWEVOTE9HX0lORk8gInZlc2FmYjogZnJhbWVidWZmZXIg
YXQgJSN4LCBtYXBwZWQgdG8gMHglcCwgIgorICAgIHByaW50ayhYRU5MT0dfSU5GTyAidmVzYWZi
OiBmcmFtZWJ1ZmZlciBhdCAlIiBQUklwYWRkciAiLCBtYXBwZWQgdG8gMHglcCwgIgogICAgICAg
ICAgICAidXNpbmcgJXVrLCB0b3RhbCAldWtcbiIsCi0gICAgICAgICAgIHZsZmJfaW5mby5sZmJf
YmFzZSwgbGZiLAorICAgICAgICAgICBsZmJfYmFzZSgpLCBsZmIsCiAgICAgICAgICAgIHZyYW1f
cmVtYXAgPj4gMTAsIHZyYW1fdG90YWwgPj4gMTApOwogICAgIHByaW50ayhYRU5MT0dfSU5GTyAi
dmVzYWZiOiBtb2RlIGlzICVkeCVkeCV1LCBsaW5lbGVuZ3RoPSVkLCBmb250ICV1eCV1XG4iLAog
ICAgICAgICAgICB2bGZiX2luZm8ud2lkdGgsIHZsZmJfaW5mby5oZWlnaHQsCkBAIC0xNjcsNyAr
MTcyLDcgQEAgdm9pZCBfX2luaXQgdmVzYV9tdHJyX2luaXQodm9pZCkKIAogICAgIC8qIFRyeSBh
bmQgZmluZCBhIHBvd2VyIG9mIHR3byB0byBhZGQgKi8KICAgICBkbyB7Ci0gICAgICAgIHJjID0g
bXRycl9hZGQodmxmYl9pbmZvLmxmYl9iYXNlLCBzaXplX3RvdGFsLCB0eXBlLCAxKTsKKyAgICAg
ICAgcmMgPSBtdHJyX2FkZChsZmJfYmFzZSgpLCBzaXplX3RvdGFsLCB0eXBlLCAxKTsKICAgICAg
ICAgc2l6ZV90b3RhbCA+Pj0gMTsKICAgICB9IHdoaWxlICggKHNpemVfdG90YWwgPj0gUEFHRV9T
SVpFKSAmJiAocmMgPT0gLUVJTlZBTCkgKTsKIH0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1
YmxpYy94ZW4uaCBiL3hlbi9pbmNsdWRlL3B1YmxpYy94ZW4uaAppbmRleCBjY2RmZmMwLi4xNzUy
MjUyIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKKysrIGIveGVuL2luY2x1
ZGUvcHVibGljL3hlbi5oCkBAIC05MjMsNiArOTIzLDEwIEBAIHR5cGVkZWYgc3RydWN0IGRvbTBf
dmdhX2NvbnNvbGVfaW5mbyB7CiAgICAgICAgICAgICAvKiBNb2RlIGF0dHJpYnV0ZXMgKG9mZnNl
dCAweDAsIFZFU0EgY29tbWFuZCAweDRmMDEpLiAqLwogICAgICAgICAgICAgdWludDE2X3QgbW9k
ZV9hdHRyczsKICNlbmRpZgorI2lmIF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gPj0gMHgwMDA0
MGQwMCB8fCBkZWZpbmVkKF9fWEVOX18pCisgICAgICAgICAgICAvKiBoaWdoIDMyIGJpdHMgb2Yg
bGZiX2Jhc2UgKi8KKyAgICAgICAgICAgIHVpbnQzMl90IGV4dF9sZmJfYmFzZTsKKyNlbmRpZgog
ICAgICAgICB9IHZlc2FfbGZiOwogICAgIH0gdTsKIH0gZG9tMF92Z2FfY29uc29sZV9pbmZvX3Q7
Ci0tIApnaXQtc2VyaWVzIDAuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
