Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 862BA15ADBF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 17:54:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1vDY-0007rI-AP; Wed, 12 Feb 2020 16:50:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zgzp=4A=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j1vDX-0007rB-DH
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2020 16:50:27 +0000
X-Inumbo-ID: c0a7f81c-4db7-11ea-aa99-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0a7f81c-4db7-11ea-aa99-bc764e2007e4;
 Wed, 12 Feb 2020 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581526220;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A8A4YcGEwCHyN5RyjKGgu0qvGUIlWT2lJI+ijAfUIYo=;
 b=XeJ+eKWXQOxpJzpRjIAS+D5owpRU0E2KwU/zZFuta40rb6uh1Hr1m/HD
 zNGBW//cxIFY/puuRADAf4nfDThZ2ahgrwC+Hrr1M24PgGkSve8x/d9TX
 y6W/pCmFivbt1ttNeRtk/Q23Xnk96UiZ462mTazSAhtqdtpdSk3E9uYat E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: rxm2s/Gk8BAiJyORJUslDYBM+LZHs4Py98igfSygahMtLBjzhBheTClKV/h6T/2B0YzMECKLU0
 Y5L2npRr9SjYDKj2PRnwJ+LmqcqbQLRqyeJ6O4tOO5T5jE8fKsMuP2RiNkN1ZRr/dBXthleolM
 iG+pOov3uGr9HX3zx94YTCu+fF5v/lsiqA9MPSBpqwhmI2lXzTbpAOzz/L/P10AKgAcFntXPgZ
 n+/R28XKPEp2+A6Egc8kbPI/4L5A4VipoCtQvwGK2uCF+2VXEoQd7Hd3PkArs7NOJOdAWQDGyJ
 nuA=
X-SBRS: 2.7
X-MesageID: 12353169
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="12353169"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 12 Feb 2020 17:49:48 +0100
Message-ID: <20200212164949.56434-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200212164949.56434-1-roger.pau@citrix.com>
References: <20200212164949.56434-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 2/3] x86/smp: use a dedicated scratch cpumask in
 send_IPI_mask
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Sander
 Eikelenboom <linux@eikelenboom.it>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNpbmcgc2NyYXRjaF9jcHVtYXNrIGluIHNlbmRfSVBJX21hayBpcyBub3Qgc2FmZSBiZWNhdXNl
IGl0IGNhbiBiZQpjYWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGhlbmNlIFhlbiB3
b3VsZCBoYXZlIHRvIG1ha2Ugc3VyZQphbGwgdGhlIHVzZXJzIG9mIHRoZSBzY3JhdGNoIGNwdW1h
c2sgZGlzYWJsZSBpbnRlcnJ1cHRzIHdoaWxlIHVzaW5nCml0LgoKSW5zdGVhZCBpbnRyb2R1Y2Ug
YSBuZXcgY3B1bWFzayB0byBiZSB1c2VkIGJ5IHNlbmRfSVBJX21hc2ssIGFuZApkaXNhYmxlIGlu
dGVycnVwdHMgd2hpbGUgdXNpbmcuCgpGaXhlczogNTUwMGQyNjVhMmE4ICgneDg2L3NtcDogdXNl
IEFQSUMgQUxMQlVUIGRlc3RpbmF0aW9uIHNob3J0aGFuZCB3aGVuIHBvc3NpYmxlJykKUmVwb3J0
ZWQtYnk6IFNhbmRlciBFaWtlbGVuYm9vbSA8bGludXhAZWlrZWxlbmJvb20uaXQ+ClNpZ25lZC1v
ZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgotLS0KIHhlbi9h
cmNoL3g4Ni9zbXAuYyAgICAgfCAxNCArKysrKysrKysrKysrLQogeGVuL2FyY2gveDg2L3NtcGJv
b3QuYyB8ICA5ICsrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zbXAuYyBiL3hlbi9hcmNo
L3g4Ni9zbXAuYwppbmRleCA5YmM5MjU2MTZhLi4zODRjM2JhOTI0IDEwMDY0NAotLS0gYS94ZW4v
YXJjaC94ODYvc21wLmMKKysrIGIveGVuL2FyY2gveDg2L3NtcC5jCkBAIC01OSw2ICs1OSw3IEBA
IHN0YXRpYyB2b2lkIHNlbmRfSVBJX3Nob3J0Y3V0KHVuc2lnbmVkIGludCBzaG9ydGN1dCwgaW50
IHZlY3RvciwKICAgICBhcGljX3dyaXRlKEFQSUNfSUNSLCBjZmcpOwogfQogCitERUNMQVJFX1BF
Ul9DUFUoY3B1bWFza192YXJfdCwgc2VuZF9pcGlfY3B1bWFzayk7CiAvKgogICogc2VuZF9JUElf
bWFzayhjcHVtYXNrLCB2ZWN0b3IpOiBzZW5kcyBAdmVjdG9yIElQSSB0byBDUFVzIGluIEBjcHVt
YXNrLAogICogZXhjbHVkaW5nIHRoZSBsb2NhbCBDUFUuIEBjcHVtYXNrIG1heSBiZSBlbXB0eS4K
QEAgLTY3LDcgKzY4LDggQEAgc3RhdGljIHZvaWQgc2VuZF9JUElfc2hvcnRjdXQodW5zaWduZWQg
aW50IHNob3J0Y3V0LCBpbnQgdmVjdG9yLAogdm9pZCBzZW5kX0lQSV9tYXNrKGNvbnN0IGNwdW1h
c2tfdCAqbWFzaywgaW50IHZlY3RvcikKIHsKICAgICBib29sIGNwdXNfbG9ja2VkID0gZmFsc2U7
Ci0gICAgY3B1bWFza190ICpzY3JhdGNoID0gdGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrKTsKKyAg
ICBjcHVtYXNrX3QgKnNjcmF0Y2ggPSB0aGlzX2NwdShzZW5kX2lwaV9jcHVtYXNrKTsKKyAgICB1
bnNpZ25lZCBsb25nIGZsYWdzOwogCiAgICAgLyoKICAgICAgKiBUaGlzIGNhbiBvbmx5IGJlIHNh
ZmVseSB1c2VkIHdoZW4gbm8gQ1BVIGhvdHBsdWcgb3IgdW5wbHVnIG9wZXJhdGlvbnMKQEAgLTgx
LDcgKzgzLDE1IEBAIHZvaWQgc2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGlu
dCB2ZWN0b3IpCiAgICAgICAgICBsb2NhbF9pcnFfaXNfZW5hYmxlZCgpICYmIChjcHVzX2xvY2tl
ZCA9IGdldF9jcHVfbWFwcygpKSAmJgogICAgICAgICAgKHBhcmtfb2ZmbGluZV9jcHVzIHx8CiAg
ICAgICAgICAgY3B1bWFza19lcXVhbCgmY3B1X29ubGluZV9tYXAsICZjcHVfcHJlc2VudF9tYXAp
KSApCisgICAgeworICAgICAgICAvKgorICAgICAgICAgKiBzZW5kX0lQSV9tYXNrIGNhbiBiZSBj
YWxsZWQgZnJvbSBpbnRlcnJ1cHQgY29udGV4dCwgYW5kIGhlbmNlIHdlCisgICAgICAgICAqIG5l
ZWQgdG8gZGlzYWJsZSBpbnRlcnJ1cHRzIGluIG9yZGVyIHRvIHByb3RlY3QgdGhlIHBlci1jcHUK
KyAgICAgICAgICogc2VuZF9pcGlfY3B1bWFzayB3aGlsZSBiZWluZyB1c2VkLgorICAgICAgICAg
Ki8KKyAgICAgICAgbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOwogICAgICAgICBjcHVtYXNrX29yKHNj
cmF0Y2gsIG1hc2ssIGNwdW1hc2tfb2Yoc21wX3Byb2Nlc3Nvcl9pZCgpKSk7CisgICAgfQogICAg
IGVsc2UKICAgICB7CiAgICAgICAgIGlmICggY3B1c19sb2NrZWQgKQpAQCAtODksNiArOTksNyBA
QCB2b2lkIHNlbmRfSVBJX21hc2soY29uc3QgY3B1bWFza190ICptYXNrLCBpbnQgdmVjdG9yKQog
ICAgICAgICAgICAgcHV0X2NwdV9tYXBzKCk7CiAgICAgICAgICAgICBjcHVzX2xvY2tlZCA9IGZh
bHNlOwogICAgICAgICB9CisgICAgICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKICAgICAgICAg
Y3B1bWFza19jbGVhcihzY3JhdGNoKTsKICAgICB9CiAKQEAgLTk3LDYgKzEwOCw3IEBAIHZvaWQg
c2VuZF9JUElfbWFzayhjb25zdCBjcHVtYXNrX3QgKm1hc2ssIGludCB2ZWN0b3IpCiAgICAgZWxz
ZQogICAgICAgICBhbHRlcm5hdGl2ZV92Y2FsbChnZW5hcGljLnNlbmRfSVBJX21hc2ssIG1hc2ss
IHZlY3Rvcik7CiAKKyAgICBsb2NhbF9pcnFfcmVzdG9yZShmbGFncyk7CiAgICAgaWYgKCBjcHVz
X2xvY2tlZCApCiAgICAgICAgIHB1dF9jcHVfbWFwcygpOwogfQpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L3NtcGJvb3QuYyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKaW5kZXggZTgzZTQ1NjRh
NC4uODJlODkyMDFiMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcGJvb3QuYworKysgYi94
ZW4vYXJjaC94ODYvc21wYm9vdC5jCkBAIC01Nyw2ICs1Nyw5IEBAIERFRklORV9QRVJfQ1BVX1JF
QURfTU9TVExZKGNwdW1hc2tfdmFyX3QsIGNwdV9jb3JlX21hc2spOwogREVGSU5FX1BFUl9DUFVf
UkVBRF9NT1NUTFkoY3B1bWFza192YXJfdCwgc2NyYXRjaF9jcHVtYXNrKTsKIHN0YXRpYyBjcHVt
YXNrX3Qgc2NyYXRjaF9jcHUwbWFzazsKIAorREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkoY3B1
bWFza192YXJfdCwgc2VuZF9pcGlfY3B1bWFzayk7CitzdGF0aWMgY3B1bWFza190IHNlbmRfaXBp
X2NwdTBtYXNrOworCiBjcHVtYXNrX3QgY3B1X29ubGluZV9tYXAgX19yZWFkX21vc3RseTsKIEVY
UE9SVF9TWU1CT0woY3B1X29ubGluZV9tYXApOwogCkBAIC05MzAsNiArOTMzLDggQEAgc3RhdGlj
IHZvaWQgY3B1X3NtcGJvb3RfZnJlZSh1bnNpZ25lZCBpbnQgY3B1LCBib29sIHJlbW92ZSkKICAg
ICAgICAgRlJFRV9DUFVNQVNLX1ZBUihwZXJfY3B1KGNwdV9jb3JlX21hc2ssIGNwdSkpOwogICAg
ICAgICBpZiAoIHBlcl9jcHUoc2NyYXRjaF9jcHVtYXNrLCBjcHUpICE9ICZzY3JhdGNoX2NwdTBt
YXNrICkKICAgICAgICAgICAgIEZSRUVfQ1BVTUFTS19WQVIocGVyX2NwdShzY3JhdGNoX2NwdW1h
c2ssIGNwdSkpOworICAgICAgICBpZiAoIHBlcl9jcHUoc2VuZF9pcGlfY3B1bWFzaywgY3B1KSAh
PSAmc2VuZF9pcGlfY3B1MG1hc2sgKQorICAgICAgICAgICAgRlJFRV9DUFVNQVNLX1ZBUihwZXJf
Y3B1KHNlbmRfaXBpX2NwdW1hc2ssIGNwdSkpOwogICAgIH0KIAogICAgIGNsZWFudXBfY3B1X3Jv
b3RfcGd0KGNwdSk7CkBAIC0xMDM0LDcgKzEwMzksOCBAQCBzdGF0aWMgaW50IGNwdV9zbXBib290
X2FsbG9jKHVuc2lnbmVkIGludCBjcHUpCiAKICAgICBpZiAoICEoY29uZF96YWxsb2NfY3B1bWFz
a192YXIoJnBlcl9jcHUoY3B1X3NpYmxpbmdfbWFzaywgY3B1KSkgJiYKICAgICAgICAgICAgY29u
ZF96YWxsb2NfY3B1bWFza192YXIoJnBlcl9jcHUoY3B1X2NvcmVfbWFzaywgY3B1KSkgJiYKLSAg
ICAgICAgICAgY29uZF9hbGxvY19jcHVtYXNrX3ZhcigmcGVyX2NwdShzY3JhdGNoX2NwdW1hc2ss
IGNwdSkpKSApCisgICAgICAgICAgIGNvbmRfYWxsb2NfY3B1bWFza192YXIoJnBlcl9jcHUoc2Ny
YXRjaF9jcHVtYXNrLCBjcHUpKSAmJgorICAgICAgICAgICBjb25kX2FsbG9jX2NwdW1hc2tfdmFy
KCZwZXJfY3B1KHNlbmRfaXBpX2NwdW1hc2ssIGNwdSkpKSApCiAgICAgICAgIGdvdG8gb3V0Owog
CiAgICAgcmMgPSAwOwpAQCAtMTE3NSw2ICsxMTgxLDcgQEAgdm9pZCBfX2luaXQgc21wX3ByZXBh
cmVfYm9vdF9jcHUodm9pZCkKICAgICBjcHVtYXNrX3NldF9jcHUoY3B1LCAmY3B1X3ByZXNlbnRf
bWFwKTsKICNpZiBOUl9DUFVTID4gMiAqIEJJVFNfUEVSX0xPTkcKICAgICBwZXJfY3B1KHNjcmF0
Y2hfY3B1bWFzaywgY3B1KSA9ICZzY3JhdGNoX2NwdTBtYXNrOworICAgIHBlcl9jcHUoc2VuZF9p
cGlfY3B1bWFzaywgY3B1KSA9ICZzZW5kX2lwaV9jcHUwbWFzazsKICNlbmRpZgogCiAgICAgZ2V0
X2NwdV9pbmZvKCktPnVzZV9wdl9jcjMgPSBmYWxzZTsKLS0gCjIuMjUuMAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
