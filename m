Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34A2161A27
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3lN1-0000iR-BC; Mon, 17 Feb 2020 18:43:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sxmF=4F=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j3lMz-0000hW-9q
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 18:43:49 +0000
X-Inumbo-ID: 6898f1bb-51b5-11ea-8038-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6898f1bb-51b5-11ea-8038-12813bfff9fa;
 Mon, 17 Feb 2020 18:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581965019;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rG8KLMeN06AJxdotn6i7hM/KmkebutaAnlDONowQjhw=;
 b=eAYZbMzlRNewwslS8fgsC6Ae6JgNQ0zUwLKRq5EIWtKWBInH4UyTMFVa
 TAEhOlxPx5JCWYyECw6JeQ6xh1p15fU3VGcMS/RNEkTqLSa11Qa9lCiJA
 8JNGMdI0E4xZTpk0YI3PGT56nJtYnDYKs9Pkkb2vR3vkZQYY1btIK532i A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: TD5CMsJuxOKjuqygVLYHDDocyC5WLDc+97MjO5N0kR0AxqqiKjzSqhmfOd7yvGwulMNaCogCHB
 IH+2kBIA1tsZ3O5nX9yzRROThONTMRhpCnXmhISKUsrG0Ll7BIx+lh8j1d4eoj+Li6Nz6adrX0
 nNZvHlTJ7ltZPNLFSSrCitsT2jY2kERDI3+yzoEKWDycnLvEiFBJCsQ0HaCFJQ1RgyW9icuNMo
 YYl6AyBmxjhSyAr9AO723Cb+hVLwTGXAT9LsjYVZN3hBDGFMoZwZsThxcBhH9WA72eF0TTtX4u
 cNA=
X-SBRS: 2.7
X-MesageID: 12569860
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,453,1574139600"; d="scan'208";a="12569860"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 17 Feb 2020 19:43:22 +0100
Message-ID: <20200217184324.73762-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217184324.73762-1-roger.pau@citrix.com>
References: <20200217184324.73762-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 4/6] x86: track when in #NMI context
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGhlbHBlcnMgdG8gdHJhY2sgd2hlbiBydW5uaW5nIGluICNNQyBjb250ZXh0LiBUaGlzIGlz
IG1vZGVsZWQKYWZ0ZXIgdGhlIGluX2lycSBoZWxwZXJzLCBidXQgZG9lcyBub3Qgc3VwcG9ydCBy
ZWVudHJ5LgoKTm90ZSB0aGF0IHRoZXJlIGFyZSBubyB1c2VycyBvZiBpbl9tYygpIGludHJvZHVj
ZWQgYnkgdGhlIGNoYW5nZSwKZnVydGhlciB1c2VycyB3aWxsIGJlIGFkZGVkIGJ5IGZvbGxvd3Vw
IGNoYW5nZXMuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvdHJhcHMuYyAgICAgICAgICB8ICA2ICsrKysrKwog
eGVuL2luY2x1ZGUvYXNtLXg4Ni9oYXJkaXJxLmggfCAxOCArKysrKysrKysrKysrKysrKy0KIDIg
ZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni90cmFwcy5jIGIveGVuL2FyY2gveDg2L3RyYXBzLmMKaW5kZXggM2Ri
YzY2YmI2NC4uZjRmMmMxM2FlOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3RyYXBzLmMKKysr
IGIveGVuL2FyY2gveDg2L3RyYXBzLmMKQEAgLTE2OTIsOSArMTY5MiwxMyBAQCB2b2lkIGRvX25t
aShjb25zdCBzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykKICAgICBib29sIGhhbmRsZV91bmtu
b3duID0gZmFsc2U7CiAKICAgICB0aGlzX2NwdShubWlfY291bnQpKys7CisgICAgbm1pX2VudGVy
KCk7CiAKICAgICBpZiAoIG5taV9jYWxsYmFjayhyZWdzLCBjcHUpICkKKyAgICB7CisgICAgICAg
IG5taV9leGl0KCk7CiAgICAgICAgIHJldHVybjsKKyAgICB9CiAKICAgICAvKgogICAgICAqIEFj
Y2Vzc2luZyBwb3J0IDB4NjEgbWF5IHRyYXAgdG8gU01NIHdoaWNoIGhhcyBiZWVuIGFjdHVhbGx5
CkBAIC0xNzIwLDYgKzE3MjQsOCBAQCB2b2lkIGRvX25taShjb25zdCBzdHJ1Y3QgY3B1X3VzZXJf
cmVncyAqcmVncykKICAgICAgICAgaWYgKCAhKHJlYXNvbiAmIDB4YzApICYmIGhhbmRsZV91bmtu
b3duICkKICAgICAgICAgICAgIHVua25vd25fbm1pX2Vycm9yKHJlZ3MsIHJlYXNvbik7CiAgICAg
fQorCisgICAgbm1pX2V4aXQoKTsKIH0KIAogbm1pX2NhbGxiYWNrX3QgKnNldF9ubWlfY2FsbGJh
Y2sobm1pX2NhbGxiYWNrX3QgKmNhbGxiYWNrKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9oYXJkaXJxLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRpcnEuaAppbmRleCBhZjNl
YWI2YTRkLi44YmNhZTk5ZWFjIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRp
cnEuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2hhcmRpcnEuaApAQCAtMiwxMiArMiwxNCBA
QAogI2RlZmluZSBfX0FTTV9IQVJESVJRX0gKIAogI2luY2x1ZGUgPHhlbi9jYWNoZS5oPgorI2lu
Y2x1ZGUgPHhlbi9saWIuaD4KKyNpbmNsdWRlIDx4ZW4vc21wLmg+CiAjaW5jbHVkZSA8eGVuL3R5
cGVzLmg+CiAKIHR5cGVkZWYgc3RydWN0IHsKIAl1bnNpZ25lZCBpbnQgX19zb2Z0aXJxX3BlbmRp
bmc7CiAJdW5zaWduZWQgaW50IF9fbG9jYWxfaXJxX2NvdW50OwotCXVuc2lnbmVkIGludCBfX25t
aV9jb3VudDsKKwlib29sIGluX25taTsKIAl1bnNpZ25lZCBpbnQgbWNfY291bnQ7CiAJYm9vbF90
IF9fbXdhaXRfd2FrZXVwOwogfSBfX2NhY2hlbGluZV9hbGlnbmVkIGlycV9jcHVzdGF0X3Q7CkBA
IC0yMyw2ICsyNSwyMCBAQCB0eXBlZGVmIHN0cnVjdCB7CiAjZGVmaW5lIG1jX2VudGVyKCkJKG1j
X2NvdW50KHNtcF9wcm9jZXNzb3JfaWQoKSkrKykKICNkZWZpbmUgbWNfZXhpdCgpCShtY19jb3Vu
dChzbXBfcHJvY2Vzc29yX2lkKCkpLS0pCiAKKyNkZWZpbmUgaW5fbm1pKCkJX19JUlFfU1RBVChz
bXBfcHJvY2Vzc29yX2lkKCksIGluX25taSkKKworc3RhdGljIGlubGluZSB2b2lkIG5taV9lbnRl
cih2b2lkKQoreworICAgIEFTU0VSVCghaW5fbm1pKCkpOworICAgIGluX25taSgpID0gdHJ1ZTsK
K30KKworc3RhdGljIGlubGluZSB2b2lkIG5taV9leGl0KHZvaWQpCit7CisgICAgQVNTRVJUKGlu
X25taSgpKTsKKyAgICBpbl9ubWkoKSA9IGZhbHNlOworfQorCiB2b2lkIGFja19iYWRfaXJxKHVu
c2lnbmVkIGludCBpcnEpOwogCiBleHRlcm4gdm9pZCBhcGljX2ludHJfaW5pdCh2b2lkKTsKLS0g
CjIuMjUuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
