Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 107B515359D
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 17:53:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izNtT-0000Sg-Ed; Wed, 05 Feb 2020 16:51:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TaP3=3Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1izNtR-0000S9-D2
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 16:51:13 +0000
X-Inumbo-ID: b1dc2e78-4837-11ea-915c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1dc2e78-4837-11ea-915c-12813bfff9fa;
 Wed, 05 Feb 2020 16:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580921464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=4Oa6M4WM6CGr9S2ZAmXGocXyWxGoZB+1v9DkZxuf6vk=;
 b=em/wVdcDJlKk7OTQfnsPVE5AwFYR+eerDePxIdSG8JM8EljE7eGNw9qO
 jFgo3aF/woy2tQeAAV2LhBFGc8SRMUzCfsTXDElob8cplG9lJQ7oHzc+z
 tt4+LGd7Wid7bZAIMabE1UhVg461/wPWAqnK7H790ODPOCP6AHtGdSpfn 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: kgo0xgdk/kqQRdU5w13717eY8Du0SX/rid1Uwwtq3KGFfMNrRtJv6nNZOkzq3j+zU5D2eK3dzj
 f19Z88yFny6+x3vI1mAflFPBz9NNXVjyDzv74PoB7ot30DyoHGfBvvu7vIqhBIssTOSSBZM1Lx
 sF1F/fiidjWa5D+wKJYSrDdOgk7NqWcUH7mdINg1ZucU9RsRi3v9t0enmr/vnYlPhEaVjz8b+O
 pU9aLdQbdMRcZMleLAsXaTNaxhIePOOrzeKh8Swq2Py0J6nBdMn5vSYUavLeN9oppjZPCtwXIx
 Q+A=
X-SBRS: 2.7
X-MesageID: 12001776
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,406,1574139600"; d="scan'208";a="12001776"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Wed, 5 Feb 2020 16:50:55 +0000
Message-ID: <20200205165056.11734-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200205165056.11734-1-andrew.cooper3@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/6] tools/libx[cl]: Don't use
 HVM_PARAM_PAE_ENABLED as a function parameter
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIHNvbGUgdXNlIG9mIEhWTV9QQVJBTV9QQUVfRU5BQkxFRCBpcyBhcyBhIG5vbi1zdGFuZGFy
ZCBjYWxsaW5nIGNvbnZlbnRpb24KZm9yIHhjX2NwdWlkX2FwcGx5X3BvbGljeSgpLiAgUGFzcyBQ
QUUgYXMgYSByZWd1bGFyIHBhcmFtZXRlciBpbnN0ZWFkLgoKTGVhdmUgYSByYXRoZXIgYmV0dGVy
IGV4cGxhaW5hdGlvbiBvZiB3aHkgb25seSBIVk0gZ3Vlc3RzIGhhdmUgYSBjaG9pY2UgaW4gUEFF
CnNldHRpbmcuCgpObyBmdW5jdGlvbmFsIGNoYW5nZS4KClNpZ25lZC1vZmYtYnk6IEFuZHJldyBD
b29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Ci0tLQpDQzogSWFuIEphY2tzb24gPElh
bi5KYWNrc29uQGNpdHJpeC5jb20+CkNDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogQW50aG9u
eSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogdG9vbHMvbGlieGMvaW5j
bHVkZS94ZW5jdHJsLmggfCAgMiArLQogdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgICAgfCAx
NSArKysrKy0tLS0tLS0tLS0KIHRvb2xzL2xpYnhsL2xpYnhsX2NwdWlkLmMgICAgIHwgMTQgKysr
KysrKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5jdHJsLmggYi90b29s
cy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaAppbmRleCAzMTFkZjFlZjBmLi40ZWI0ZjRjMmM2IDEw
MDY0NAotLS0gYS90b29scy9saWJ4Yy9pbmNsdWRlL3hlbmN0cmwuaAorKysgYi90b29scy9saWJ4
Yy9pbmNsdWRlL3hlbmN0cmwuaApAQCAtMTgwNyw3ICsxODA3LDcgQEAgaW50IHhjX2NwdWlkX3Nl
dCh4Y19pbnRlcmZhY2UgKnhjaCwKIGludCB4Y19jcHVpZF9hcHBseV9wb2xpY3koeGNfaW50ZXJm
YWNlICp4Y2gsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRvbWlkLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1aW50MzJfdCAqZmVhdHVyZXNldCwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX2ZlYXR1cmVzKTsKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IG5yX2ZlYXR1cmVzLCBib29sIHBhZSk7CiBp
bnQgeGNfbWNhX29wKHhjX2ludGVyZmFjZSAqeGNoLCBzdHJ1Y3QgeGVuX21jICptYyk7CiBpbnQg
eGNfbWNhX29wX2luamVjdF92Mih4Y19pbnRlcmZhY2UgKnhjaCwgdW5zaWduZWQgaW50IGZsYWdz
LAogICAgICAgICAgICAgICAgICAgICAgICAgeGNfY3B1bWFwX3QgY3B1bWFwLCB1bnNpZ25lZCBp
bnQgbnJfY3B1cyk7CmRpZmYgLS1naXQgYS90b29scy9saWJ4Yy94Y19jcHVpZF94ODYuYyBiL3Rv
b2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCmluZGV4IDI1NDBhYTFlMWMuLjRlNzRhN2VkM2IgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL2xpYnhjL3hjX2NwdWlkX3g4Ni5jCisrKyBiL3Rvb2xzL2xpYnhjL3hj
X2NwdWlkX3g4Ni5jCkBAIC00NTUsNyArNDU1LDggQEAgaW50IHhjX2NwdWlkX3NldCgKIH0KIAog
aW50IHhjX2NwdWlkX2FwcGx5X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3QgZG9t
aWQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVpbnQzMl90ICpmZWF0dXJlc2V0
LCB1bnNpZ25lZCBpbnQgbnJfZmVhdHVyZXMpCisgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHVpbnQzMl90ICpmZWF0dXJlc2V0LCB1bnNpZ25lZCBpbnQgbnJfZmVhdHVyZXMsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcGFlKQogewogICAgIGludCByYzsKICAgICB4Y19k
b21pbmZvX3QgZGk7CkBAIC01NzksOCArNTgwLDYgQEAgaW50IHhjX2NwdWlkX2FwcGx5X3BvbGlj
eSh4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3QgZG9taWQsCiAgICAgfQogICAgIGVsc2UKICAg
ICB7Ci0gICAgICAgIHVpbnQ2NF90IHZhbDsKLQogICAgICAgICAvKgogICAgICAgICAgKiBUb3Bv
bG9neSBmb3IgSFZNIGd1ZXN0cyBpcyBlbnRpcmVseSBjb250cm9sbGVkIGJ5IFhlbi4gIEZvciBu
b3csIHdlCiAgICAgICAgICAqIGhhcmRjb2RlIEFQSUNfSUQgPSB2Y3B1X2lkICogMiB0byBnaXZl
IHRoZSBpbGx1c2lvbiBvZiBubyBTTVQuCkBAIC02MzUsMTQgKzYzNCwxMCBAQCBpbnQgeGNfY3B1
aWRfYXBwbHlfcG9saWN5KHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21pZCwKICAgICAg
ICAgfQogCiAgICAgICAgIC8qCi0gICAgICAgICAqIEhWTV9QQVJBTV9QQUVfRU5BQkxFRCBpcyBh
IHBhcmFtZXRlciB0byB0aGlzIGZ1bmN0aW9uLCBzdGFzaGVkIGluCi0gICAgICAgICAqIFhlbi4g
IE5vdGhpbmcgZWxzZSBoYXMgZXZlciB0YWtlbiBub3RpY2Ugb2YgdGhlIHZhbHVlLgorICAgICAg
ICAgKiBQQUUgdXNlZCB0byBiZSBhIHBhcmFtZXRlciBwYXNzZWQgdG8gdGhpcyBmdW5jdGlvbiBi
eQorICAgICAgICAgKiBIVk1fUEFSQU1fUEFFX0VOQUJMRUQuICBJdCBpcyBub3cgcGFzc2VkIG5v
cm1hbGx5LgogICAgICAgICAgKi8KLSAgICAgICAgcmMgPSB4Y19odm1fcGFyYW1fZ2V0KHhjaCwg
ZG9taWQsIEhWTV9QQVJBTV9QQUVfRU5BQkxFRCwgJnZhbCk7Ci0gICAgICAgIGlmICggcmMgKQot
ICAgICAgICAgICAgZ290byBvdXQ7Ci0KLSAgICAgICAgcC0+YmFzaWMucGFlID0gdmFsOworICAg
ICAgICBwLT5iYXNpYy5wYWUgPSBwYWU7CiAKICAgICAgICAgLyoKICAgICAgICAgICogVGhlc2Ug
c2V0dGluZ3MgYXJlIG5lY2Vzc2FyeSB0byBjYXVzZSBlYXJsaWVyIEhWTV9QQVJBTV9ORVNURURI
Vk0gLwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfY3B1aWQuYyBiL3Rvb2xzL2xpYnhs
L2xpYnhsX2NwdWlkLmMKaW5kZXggNDlkM2NhNWIyNi4uOGM0OWUzNDEyNSAxMDA2NDQKLS0tIGEv
dG9vbHMvbGlieGwvbGlieGxfY3B1aWQuYworKysgYi90b29scy9saWJ4bC9saWJ4bF9jcHVpZC5j
CkBAIC00MTYsOCArNDE2LDIwIEBAIHZvaWQgbGlieGxfX2NwdWlkX2xlZ2FjeShsaWJ4bF9jdHgg
KmN0eCwgdWludDMyX3QgZG9taWQsCiAgICAgbGlieGxfY3B1aWRfcG9saWN5X2xpc3QgY3B1aWQg
PSBpbmZvLT5jcHVpZDsKICAgICBpbnQgaTsKICAgICBjaGFyICpjcHVpZF9yZXNbNF07CisgICAg
Ym9vbCBwYWUgPSB0cnVlOworCisgICAgLyoKKyAgICAgKiBQQUUgaXMgYSBYZW4tY29udHJvbGxl
ZCBmb3IgUFYgZ3Vlc3RzIChpdCBpcyB0aGUgJ3AnIHRoYXQgY2F1c2VzIHRoZQorICAgICAqIGRp
ZmZlcmVuY2UgYmV0d2VlbiB0aGUgeGVuLTMuMC14ODZfMzIgYW5kIHhlbi0zLjAteDg2XzMycCBB
QklzKS4gIEl0IGlzCisgICAgICogbWFuZGF0b3J5IGFzIFhlbiBpcyBydW5uaW5nIGluIDY0Yml0
IG1vZGUuCisgICAgICoKKyAgICAgKiBQVkggZ3Vlc3RzIGRvbid0IGhhdmUgYSB0b3AtbGV2ZWwg
UEFFIGNvbnRyb2wsIGFuZCBpcyB0cmVhdGVkIGFzCisgICAgICogYXZhaWxhYmxlLgorICAgICAq
LworICAgIGlmIChpbmZvLT50eXBlID09IExJQlhMX0RPTUFJTl9UWVBFX0hWTSkKKyAgICAgICAg
cGFlID0gbGlieGxfZGVmYm9vbF92YWwoaW5mby0+dS5odm0ucGFlKTsKIAotICAgIHhjX2NwdWlk
X2FwcGx5X3BvbGljeShjdHgtPnhjaCwgZG9taWQsIE5VTEwsIDApOworICAgIHhjX2NwdWlkX2Fw
cGx5X3BvbGljeShjdHgtPnhjaCwgZG9taWQsIE5VTEwsIDAsIHBhZSk7CiAKICAgICBpZiAoIWNw
dWlkKQogICAgICAgICByZXR1cm47Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
