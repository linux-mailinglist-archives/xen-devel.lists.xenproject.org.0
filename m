Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 895D0FF629
	for <lists+xen-devel@lfdr.de>; Sun, 17 Nov 2019 00:51:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iW7n6-0005S6-P5; Sat, 16 Nov 2019 23:47:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=inei=ZI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iW7n5-0005S1-BP
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2019 23:47:43 +0000
X-Inumbo-ID: 7acc3c94-08cb-11ea-9631-bc764e2007e4
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7acc3c94-08cb-11ea-9631-bc764e2007e4;
 Sat, 16 Nov 2019 23:47:42 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 1268A325;
 Sat, 16 Nov 2019 18:47:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 16 Nov 2019 18:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=rhYJEy
 //Z1zO+nCuVadJpb11s1YaB1WF1kFYupP/SyU=; b=mMXPqRUpTMFFdB04Vxj20g
 p7gRzlGyK1FBD2zx8x7n7jpaSgFl8D3poCuw9F3V8GJYNVR8mWkjDr8Afwk7lC3r
 0sp1o2aDBBENioscVltva2VETgmxVshEv9TlHG6pQVYK6yoh8oCy4o1FO327fZYb
 K859T0JSlkDBMnGKKht6dumKrYkZaEA/mameHZ2T/DC+JdsrpGyWgXE2M3h0Ru/R
 nXQcS3v+wkOj4OGsqTDefB710MXxMDZ+bhYo7z15yJbLGTosknswNyWmUtBDoFjX
 AOg3kPQLlKv0KOmNbxODWpkAoD5SBSrbhchYWg9HTBNJp6haFi+fSvZsqiYwamRQ
 ==
X-ME-Sender: <xms:nIrQXdxKub0_phOu08NpdjaAfxkyEXjHzfzFBQnSQ7pGP6TJ5zYWcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudegtddgudefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffogggtohfgsehtkeertdertdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:nIrQXds9mB0SSad35Zmv27lC0dQgx49zHKA4pS32PtCRE7LddMuNag>
 <xmx:nIrQXYAUUBqy_7dNbODb7-3sVudlW7DVwuv7rIPcc6_GHTpVaZ-vlg>
 <xmx:nIrQXXGhT4S1TWBh-vjBak4lbTUbxvfIZ8iFqT_YKOZ4xBXE89f_iQ>
 <xmx:nIrQXVtkunLVuI7v9RQ2tXl7tgKuP2OpcqVG-hDxJOvJFeH2NMOc1g>
Received: from localhost.localdomain (ip5b412221.dynamic.kabel-deutschland.de
 [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 654FA306005E;
 Sat, 16 Nov 2019 18:47:39 -0500 (EST)
From: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Date: Sun, 17 Nov 2019 00:47:16 +0100
Message-Id: <20191116234717.1458-1-marmarek@invisiblethingslab.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Organization: Invisible Things Lab
Subject: [Xen-devel] [PATCH for-4.13] efi: do not use runtime services table
 with efi=no-rs
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
Cc: Juergen Gross <jgross@suse.com>, Roman Shaposhnik <roman@zededa.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QmVmb3JlIGRmY2NjYzY2MzEgImVmaTogdXNlIGRpcmVjdG1hcCB0byBhY2Nlc3MgcnVudGltZSBz
ZXJ2aWNlcyB0YWJsZSIKYWxsIHVzYWdlcyBvZiBlZmlfcnMgcG9pbnRlciB3ZXJlIGd1YXJkZWQg
YnkgZWZpX3JzX2VudGVyKCksIHdoaWNoCmltcGxpY2l0bHkgcmVmdXNlZCB0byBvcGVyYXRlIHdp
dGggZWZpPW5vLXJzIChieSBjaGVja2luZyBpZgplZmlfbDRfcGd0YWJsZSBpcyBOVUxMIC0gd2hp
Y2ggaXMgdGhlIGNhc2UgZm9yIGVmaT1uby1ycykuIFRoZSBzYWlkCmNvbW1pdCAocmUpbW92ZWQg
dGhhdCBjYWxsIGFzIHVubmVlZGVkIGZvciBqdXN0IHJlYWRpbmcgY29udGVudCBvZgplZmlfcnMg
c3RydWN0dXJlIC0gdG8gYXZvaWQgdW5uZWNlc3NhcnkgcGFnZSB0YWJsZXMgc3dpdGNoLiBCdXQg
aXQKbmVnbGVjdGVkIHRvIGNoZWNrIGlmIGVmaV9ycyBhY2Nlc3MgaXMgbGVnYWwuCgpGaXggdGhp
cyBieSBhZGRpbmcgZXhwbGljaXQgY2hlY2sgZm9yIHJ1bnRpbWUgc2VydmljZSBiZWluZyBlbmFi
bGVkIGluCnRoZSBjYXNlcyB0aGF0IGRvIG5vdCB1c2UgZWZpX3JzX2VudGVyKCkuCgpSZXBvcnRl
ZC1ieTogUm9tYW4gU2hhcG9zaG5payA8cm9tYW5AemVkZWRhLmNvbT4KRml4ZXM6IGRmY2NjYzY2
MzEgImVmaTogdXNlIGRpcmVjdG1hcCB0byBhY2Nlc3MgcnVudGltZSBzZXJ2aWNlcyB0YWJsZSIK
U2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZp
c2libGV0aGluZ3NsYWIuY29tPgotLS0KQ2M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KLS0tCiB4ZW4vY29tbW9uL2VmaS9ydW50aW1lLmMgfCA2ICsrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZWZpL3J1bnRpbWUu
YyBiL3hlbi9jb21tb24vZWZpL3J1bnRpbWUuYwppbmRleCAyMmZkNmM5YjUzLi4xMmRhNmE1MjVh
IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL2VmaS9ydW50aW1lLmMKKysrIGIveGVuL2NvbW1vbi9l
ZmkvcnVudGltZS5jCkBAIC0yMTEsNiArMjExLDggQEAgaW50IGVmaV9nZXRfaW5mbyh1aW50MzJf
dCBpZHgsIHVuaW9uIHhlbnBmX2VmaV9pbmZvICppbmZvKQogICAgICAgICBicmVhazsKICAgICBj
YXNlIFhFTl9GV19FRklfUlRfVkVSU0lPTjoKICAgICB7CisgICAgICAgIGlmICggIWVmaV9lbmFi
bGVkKEVGSV9SUykgKQorICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwogICAgICAgICBp
bmZvLT52ZXJzaW9uID0gZWZpX3JzLT5IZHIuUmV2aXNpb247CiAgICAgICAgIGJyZWFrOwogICAg
IH0KQEAgLTYxMyw2ICs2MTUsOCBAQCBpbnQgZWZpX3J1bnRpbWVfY2FsbChzdHJ1Y3QgeGVucGZf
ZWZpX3J1bnRpbWVfY2FsbCAqb3ApCiAgICAgICAgICAgICBicmVhazsKICAgICAgICAgfQogCisg
ICAgICAgIGlmICggIWVmaV9lbmFibGVkKEVGSV9SUykgKQorICAgICAgICAgICAgcmV0dXJuIC1F
T1BOT1RTVVBQOwogICAgICAgICBpZiAoIChlZmlfcnMtPkhkci5SZXZpc2lvbiA+PiAxNikgPCAy
ICkKICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKICAgICAgICAgc3RhdGUgPSBlZmlf
cnNfZW50ZXIoKTsKQEAgLTYzMSw2ICs2MzUsOCBAQCBpbnQgZWZpX3J1bnRpbWVfY2FsbChzdHJ1
Y3QgeGVucGZfZWZpX3J1bnRpbWVfY2FsbCAqb3ApCiAgICAgICAgIGlmICggb3AtPm1pc2MgKQog
ICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAKKyAgICAgICAgaWYgKCAhZWZpX2VuYWJsZWQo
RUZJX1JTKSApCisgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7CiAgICAgICAgIGlmICgg
KGVmaV9ycy0+SGRyLlJldmlzaW9uID4+IDE2KSA8IDIgKQogICAgICAgICAgICAgcmV0dXJuIC1F
T1BOT1RTVVBQOwogICAgICAgICAvKiBYWFggZmFsbCB0aHJvdWdoIGZvciBub3cgKi8KLS0gCjIu
MjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
