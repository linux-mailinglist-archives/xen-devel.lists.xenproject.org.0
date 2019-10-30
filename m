Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE48EA30C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2019 19:10:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iPsNM-0003WM-1U; Wed, 30 Oct 2019 18:07:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Jdra=YX=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iPsNK-0003Vu-KL
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2019 18:07:18 +0000
X-Inumbo-ID: 166f0c6a-fb40-11e9-9534-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 166f0c6a-fb40-11e9-9534-12813bfff9fa;
 Wed, 30 Oct 2019 18:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572458829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P/tWRk2cOtLmXv60XzYIKvBrBGH4GRbB2zSPylTKM0U=;
 b=VB9wEycNOijacbC+opC6oAq736zLk1z9cZXpBNPtrm3wYgIquzIhy+iN
 Lr+1y5cd2PFBcwI1/4tmO8NDydpoAeSJIS0FVr73vkp9kyKlf0Tj5/ndn
 4LJPNSVVSnxnQr28DncasOdZGA8CludtIr/ZIBtwH2g6NOAu1VMtHfJat Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Tiz3CLHX1RmgY1rM08k31LitEJgdTRDT8ev81P6y5tpVRMrofnygERdGx5fAx+ljKXrNgsVEwZ
 UwF/2bt5rhSlia2uovKGySXkQEUrO5I/ELRlfgsWa2L5Xicm7c615Zn57fG1xV2l+aUjmE76ul
 hGrt6kS1U2+3OsAlkc4Iv+n0W4T5mTfRqQCzMKkyiEVRrkLGmOaAk13KQMlsMcN92EoH2fJ6Do
 nRU3NGf+OuQNz7O23YMNeGwe5zDvgz+ob1d4gWIKkyMtTLGYYulmvIA1Pbd9oeTbf5iOG4Y7zs
 wV4=
X-SBRS: 2.7
X-MesageID: 7739500
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,248,1569297600"; 
   d="scan'208";a="7739500"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 30 Oct 2019 18:07:02 +0000
Message-ID: <20191030180704.261320-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030180704.261320-1-anthony.perard@citrix.com>
References: <20191030180704.261320-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 4/6] libxl: Introduce
 libxl__ev_slowlock_dispose
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hpY2ggYWxsb3cgdG8gY2FuY2VsIHRoZSBsb2NrIG9wZXJhdGlvbiB3aGlsZSBpdCBpcyBpbiBB
Y3RpdmUgc3RhdGUuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJh
cmRAY2l0cml4LmNvbT4KLS0tCgpOb3RlczoKICAgIHYyOgogICAgLSBSZW5hbWVkIGxpYnhsX19l
dl9xbXBsb2NrX2Rpc3Bvc2UgdG8gbGlieGxfX2V2X3Nsb3dsb2NrX2Rpc3Bvc2UKICAgIC0gVGhp
cyBuZXcgQVBJIHdhcyBwYXJ0IG9mIHRoZSBwYXRjaCAiSW50cm9kdWNlIGxpYnhsX19ldl9xbXBs
b2NrIiBpbiB2MS4KCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jIHwgNiArKysrKysKIHRv
b2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmggfCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCA5IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jIGIv
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYwppbmRleCA5NTIwYWMzNjE0OWUuLmIyMDg0MTU3
ZTRjZCAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuYworKysgYi90b29s
cy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5jCkBAIC03NjUsNiArNzY1LDEyIEBAIHZvaWQgbGlieGxf
X2V2X3Nsb3dsb2NrX3VubG9jayhsaWJ4bF9fZ2MgKmdjLCBsaWJ4bF9fZXZfc2xvd2xvY2sgKmxv
Y2spCiAgICAgZXZfc2xvd2xvY2tfaW5pdF9pbnRlcm5hbChsb2NrLCBsb2NrLT51c2VyZGF0YV91
c2VyaWQpOwogfQogCit2b2lkIGxpYnhsX19ldl9zbG93bG9ja19kaXNwb3NlKGxpYnhsX19nYyAq
Z2MsIGxpYnhsX19ldl9zbG93bG9jayAqbG9jaykKK3sKKyAgICBsaWJ4bF9fZXZfY2hpbGRfa2ls
bF9kZXJlZ2lzdGVyKGxvY2stPmFvLCAmbG9jay0+Y2hpbGQsIFNJR0tJTEwpOworICAgIGxpYnhs
X19ldl9zbG93bG9ja191bmxvY2soZ2MsIGxvY2spOworfQorCiAvKgogICogTG9jYWwgdmFyaWFi
bGVzOgogICogbW9kZTogQwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwu
aCBiL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKaW5kZXggYTBmOTkyNTJjMzljLi45Yjg0
ZGRkZDNiN2QgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2ludGVybmFsLmgKKysrIGIv
dG9vbHMvbGlieGwvbGlieGxfaW50ZXJuYWwuaApAQCAtMzkzLDYgKzM5Myw4IEBAIHN0cnVjdCBs
aWJ4bF9fZXZfY2hpbGQgewogICogIGxpYnhsX19ldl9zbG93bG9ja19sb2NrOiBJZGxlIC0+IEFj
dGl2ZQogICogICAgTWF5IGNhbGwgY2FsbGJhY2sgc3luY2hyb25vdXNseS4KICAqICBsaWJ4bF9f
ZXZfc2xvd2xvY2tfdW5sb2NrOiBMb2NrQWNxdWlyZWQvSWRsZSAtPiBJZGxlCisgKiAgbGlieGxf
X2V2X3Nsb3dsb2NrX2Rpc3Bvc2U6IElkbGUvQWN0aXZlL0xvY2tBY3F1aXJlZCAtPiBJZGxlCisg
KiAgICBUaGUgY2FsbGJhY2sgd2lsbCBub3QgYmUgY2FsbGVkIGFueW1vcmUuCiAgKiAgY2FsbGJh
Y2s6ICAgICBXaGVuIGNhbGxlZDogQWN0aXZlIC0+IExvY2tBY3F1aXJlZCAob24gZXJyb3I6IElk
bGUpCiAgKiAgICBUaGUgY2FsbGJhY2sgaXMgb25seSBjYWxsZWQgb25jZS4KICAqLwpAQCAtNDEx
LDYgKzQxMyw3IEBAIHN0cnVjdCBsaWJ4bF9fZXZfc2xvd2xvY2sgewogX2hpZGRlbiB2b2lkIGxp
YnhsX19ldl9kZXZsb2NrX2luaXQobGlieGxfX2V2X3Nsb3dsb2NrICopOwogX2hpZGRlbiB2b2lk
IGxpYnhsX19ldl9zbG93bG9ja19sb2NrKGxpYnhsX19lZ2MgKiwgbGlieGxfX2V2X3Nsb3dsb2Nr
ICopOwogX2hpZGRlbiB2b2lkIGxpYnhsX19ldl9zbG93bG9ja191bmxvY2sobGlieGxfX2djICos
IGxpYnhsX19ldl9zbG93bG9jayAqKTsKK19oaWRkZW4gdm9pZCBsaWJ4bF9fZXZfc2xvd2xvY2tf
ZGlzcG9zZShsaWJ4bF9fZ2MgKiwgbGlieGxfX2V2X3Nsb3dsb2NrICopOwogCiAvKgogICogUU1Q
IGFzeW5jaHJvbm91cyBjYWxscwotLSAKQW50aG9ueSBQRVJBUkQKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
