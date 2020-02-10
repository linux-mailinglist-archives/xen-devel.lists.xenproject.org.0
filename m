Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A13C158172
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 18:32:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1CsA-0006hi-FG; Mon, 10 Feb 2020 17:29:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rnvo=36=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1Cs9-0006h6-AA
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 17:29:25 +0000
X-Inumbo-ID: e151bc44-4c2a-11ea-852a-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e151bc44-4c2a-11ea-852a-bc764e2007e4;
 Mon, 10 Feb 2020 17:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581355764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WCEo9Ows5qPa/HxrFk2RxBO14wcSrhNPhC7c9qZxXX4=;
 b=cOl/ZB1zs2Ww6nXszwlu7DA13CAKMuOBUDsRKGuUq+KmmaQPfdKzDjYb
 Tkgm7JUqanJJGSpo0L1TAcCFgS5OZeO3vz5E2x77PCsNG4qbdC7OFECPS
 nYWEAHwvOL2St7MrvcwWl0rfWnrGiBG48QxyhB8jGwXif4nMIaoci3Xi7 4=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xzv3IqIuzsoPgS9+mgcfMmdVQGTi9CJSHDwt6VUns90BRkkcB/faWRQJsz5GOG3LEDLgfUEh2V
 rT1kuE0qmWsb9SBh2EFL18H+PL/er0+i89xpW3mq6NTOhXgim0JtkM5YQUM3VcSVP0EWhNM7tf
 9ziFvLm8OCeRIzOkqM/qstRU9weycXrHdRkmINROSr65nCKQEtYbXxxsoxtLfcX3HbeKSZ1pIm
 X1ucDFT4qU4am2XIvGf2SMhjHeBLZRKY+3gogObYY7Wjt9oaIjAxoiLKSFXdoDFS8N+j7H7xkU
 uNk=
X-SBRS: 2.7
X-MesageID: 12589345
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,425,1574139600"; d="scan'208";a="12589345"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 10 Feb 2020 18:28:28 +0100
Message-ID: <20200210172829.43604-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210172829.43604-1-roger.pau@citrix.com>
References: <20200210172829.43604-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 6/7] xen/guest: prepare hypervisor ops to use
 alternative calls
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRhcHQgdGhlIGh5cGVydmlzb3Igb3BzIGZyYW1ld29yayBzbyBpdCBjYW4gYmUgdXNlZCB3aXRo
IHRoZQphbHRlcm5hdGl2ZSBjYWxscyBmcmFtZXdvcmsuIFNvIGZhciBubyBob29rcyBhcmUgbW9k
aWZpZWQgdG8gbWFrZSB1c2UKb2YgdGhlIGFsdGVybmF0aXZlcyBwYXRjaGluZywgYXMgdGhleSBh
cmUgbm90IGluIGFueSBob3QgcGF0aC4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoK
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0t
LQpDaGFuZ2VzIHNpbmNlIHYzOgogLSBOZXcgaW4gdGhpcyB2ZXJzaW9uLgotLS0KIHhlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCAgMiArLQogeGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydmlzb3IuYyAgICB8IDQxICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogeGVuL2Fy
Y2gveDg2L2d1ZXN0L3hlbi94ZW4uYyAgICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDIz
IGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVy
di5jCmluZGV4IGZhYmM2MmIwZDYuLjcwZjRjZDVhZTAgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMKKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9o
eXBlcnYuYwpAQCAtMTk5LDcgKzE5OSw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlODIwX2ZpeHVw
KHN0cnVjdCBlODIwbWFwICplODIwKQogICAgICAgICBwYW5pYygiVW5hYmxlIHRvIHJlc2VydmUg
SHlwZXItViBoeXBlcmNhbGwgcmFuZ2VcbiIpOwogfQogCi1zdGF0aWMgY29uc3Qgc3RydWN0IGh5
cGVydmlzb3Jfb3BzIG9wcyA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMg
X19pbml0ZGF0YSBvcHMgPSB7CiAgICAgLm5hbWUgPSAiSHlwZXItViIsCiAgICAgLnNldHVwID0g
c2V0dXAsCiAgICAgLmFwX3NldHVwID0gYXBfc2V0dXAsCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwpp
bmRleCA1ZmQ0MzNjOGQ0Li42NDdjZGIxMzY3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2aXNvci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKQEAg
LTI0LDUyICsyNCw1MyBAQAogI2luY2x1ZGUgPGFzbS9jYWNoZS5oPgogI2luY2x1ZGUgPGFzbS9n
dWVzdC5oPgogCi1zdGF0aWMgY29uc3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpfX3JlYWRfbW9z
dGx5IG9wczsKK3N0YXRpYyBzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgX19yZWFkX21vc3RseSBvcHM7
CiAKIGNvbnN0IGNoYXIgKl9faW5pdCBoeXBlcnZpc29yX3Byb2JlKHZvaWQpCiB7CisgICAgY29u
c3Qgc3RydWN0IGh5cGVydmlzb3Jfb3BzICpmbnM7CisKICAgICBpZiAoICFjcHVfaGFzX2h5cGVy
dmlzb3IgKQogICAgICAgICByZXR1cm4gTlVMTDsKIAotICAgIG9wcyA9IHhnX3Byb2JlKCk7Ci0g
ICAgaWYgKCBvcHMgKQotICAgICAgICByZXR1cm4gb3BzLT5uYW1lOworICAgIGZucyA9IHhnX3By
b2JlKCk7CisgICAgaWYgKCAhZm5zICkKKyAgICAgICAgLyoKKyAgICAgICAgICogRGV0ZWN0aW9u
IG9mIEh5cGVyLVYgbXVzdCBjb21lIGFmdGVyIFhlbiB0byBhdm9pZCBmYWxzZSBwb3NpdGl2ZSBk
dWUKKyAgICAgICAgICogdG8gdmlyaWRpYW4gc3VwcG9ydAorICAgICAgICAgKi8KKyAgICAgICAg
Zm5zID0gaHlwZXJ2X3Byb2JlKCk7CiAKLSAgICAvKgotICAgICAqIERldGVjdGlvbiBvZiBIeXBl
ci1WIG11c3QgY29tZSBhZnRlciBYZW4gdG8gYXZvaWQgZmFsc2UgcG9zaXRpdmUgZHVlCi0gICAg
ICogdG8gdmlyaWRpYW4gc3VwcG9ydAotICAgICAqLwotICAgIG9wcyA9IGh5cGVydl9wcm9iZSgp
OwotICAgIGlmICggb3BzICkKLSAgICAgICAgcmV0dXJuIG9wcy0+bmFtZTsKKyAgICBpZiAoIGZu
cyApCisgICAgICAgIG9wcyA9ICpmbnM7CiAKLSAgICByZXR1cm4gTlVMTDsKKyAgICByZXR1cm4g
b3BzLm5hbWU7CiB9CiAKIHZvaWQgX19pbml0IGh5cGVydmlzb3Jfc2V0dXAodm9pZCkKIHsKLSAg
ICBpZiAoIG9wcyAmJiBvcHMtPnNldHVwICkKLSAgICAgICAgb3BzLT5zZXR1cCgpOworICAgIGlm
ICggb3BzLnNldHVwICkKKyAgICAgICAgb3BzLnNldHVwKCk7CiB9CiAKIGludCBoeXBlcnZpc29y
X2FwX3NldHVwKHZvaWQpCiB7Ci0gICAgaWYgKCBvcHMgJiYgb3BzLT5hcF9zZXR1cCApCi0gICAg
ICAgIHJldHVybiBvcHMtPmFwX3NldHVwKCk7CisgICAgaWYgKCBvcHMuYXBfc2V0dXAgKQorICAg
ICAgICByZXR1cm4gb3BzLmFwX3NldHVwKCk7CiAKICAgICByZXR1cm4gMDsKIH0KIAogdm9pZCBo
eXBlcnZpc29yX3Jlc3VtZSh2b2lkKQogewotICAgIGlmICggb3BzICYmIG9wcy0+cmVzdW1lICkK
LSAgICAgICAgb3BzLT5yZXN1bWUoKTsKKyAgICBpZiAoIG9wcy5yZXN1bWUgKQorICAgICAgICBv
cHMucmVzdW1lKCk7CiB9CiAKIHZvaWQgX19pbml0IGh5cGVydmlzb3JfZTgyMF9maXh1cChzdHJ1
Y3QgZTgyMG1hcCAqZTgyMCkKIHsKLSAgICBpZiAoIG9wcyAmJiBvcHMtPmU4MjBfZml4dXAgKQot
ICAgICAgICBvcHMtPmU4MjBfZml4dXAoZTgyMCk7CisgICAgaWYgKCBvcHMuZTgyMF9maXh1cCAp
CisgICAgICAgIG9wcy5lODIwX2ZpeHVwKGU4MjApOwogfQogCiAvKgpkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC94ZW4veGVuLmMK
aW5kZXggM2NmOGY2NjdhMS4uZjE1MWIwNzU0OCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2d1
ZXN0L3hlbi94ZW4uYworKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QveGVuL3hlbi5jCkBAIC0zMjQs
NyArMzI0LDcgQEAgc3RhdGljIHZvaWQgX19pbml0IGU4MjBfZml4dXAoc3RydWN0IGU4MjBtYXAg
KmU4MjApCiAgICAgICAgIHB2X3NoaW1fZml4dXBfZTgyMChlODIwKTsKIH0KIAotc3RhdGljIGNv
bnN0IHN0cnVjdCBoeXBlcnZpc29yX29wcyBvcHMgPSB7CitzdGF0aWMgY29uc3Qgc3RydWN0IGh5
cGVydmlzb3Jfb3BzIF9faW5pdGRhdGEgb3BzID0gewogICAgIC5uYW1lID0gIlhlbiIsCiAgICAg
LnNldHVwID0gc2V0dXAsCiAgICAgLmFwX3NldHVwID0gYXBfc2V0dXAsCi0tIAoyLjI1LjAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
