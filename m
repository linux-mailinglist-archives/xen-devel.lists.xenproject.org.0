Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F3EB14A0
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 20:57:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8UFG-0002yk-QL; Thu, 12 Sep 2019 18:55:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UPIc=XH=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1i8UFF-0002yf-Bq
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 18:55:05 +0000
X-Inumbo-ID: d46c5c40-d58e-11e9-b299-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d46c5c40-d58e-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 18:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568314504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FVY8Pi0pgYpWhmFLAHvdRipX/IAei9vlXHKhWk8CoAA=;
 b=RFppFB3JUHYhf175xZL7U1YoyYnkK/IA6iulMoM+L5mwFIOQuGxOQVWe
 3MvyrzybVQ55TAp7W8dZG/l3LsEHoiieSgAivKBWvPKw8QMnXUeM0GFKA
 jhW90/2gsisi1ert433t9im3CxnfHyIbPe9SO0DHKLkpzzSH641EC+8td g=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: cX6dhoBTnn5XZ0mEWINip9EboKjK2XphIeDNzq5MoLDa80e9mTQddhQrK+1Vb+5KVCM/s2VFAj
 wZ8slZio8RtV2Syp7MjlVpA4IvEoMhGtYzqHJXmlcz+qn90cjcjxX2lQEq0HcmXJ+Lcj/Gv6ws
 EXDKPlyvOMHORzJSEHM8fxcp3UXR745gqTLHF/Zr7ERzMgvJol7sFZJ0ZgCXNBFzhIEJtwcQXL
 BZ+W07AP7QABKYt6diC8YpUKqDiKjj/3nV7j6MTLtpz8OeK59KpDZY2zNKdORWFJKU7M0bNvjn
 qDM=
X-SBRS: 2.7
X-MesageID: 5501318
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,498,1559534400"; 
   d="scan'208";a="5501318"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Thu, 12 Sep 2019 19:55:00 +0100
Message-ID: <20190912185500.21621-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190911200504.5693-9-andrew.cooper3@citrix.com>
References: <20190911200504.5693-9-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 8/8] x86/cpuid: Enable CPUID Faulting for the
 control domain by default
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
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGRvbWFpbiBidWlsZGVyIG5vIGxvbmdlciB1c2VzIGxvY2FsIENQVUlEIGluc3RydWN0aW9u
cyBmb3IgcG9saWN5CmRlY2lzaW9ucy4gIFRoaXMgcmVzb2x2ZXMgYSBrZXkgaXNzdWUgZm9yIFBW
SCBkb20wJ3MuICBIb3dldmVyLCBhcyBQViBkb20wJ3MKaGF2ZSBuZXZlciBoYWQgZmF1bHRpbmcg
ZW5mb3JjZWQsIGxlYXZlIGEgY29tbWFuZCBsaW5lIG9wdGlvbiB0byByZXN0b3JlIHRoZQpvbGQg
YmVoYXZpb3VyLgoKSW4gY3R4dF9zd2l0Y2hfbGV2ZWxsaW5nKCksIGludmVydCB0aGUgZmlyc3Qg
Y3B1X2hhc19jcHVpZF9mYXVsdGluZyBjb25kaXRpb24KdG8gcmVkdWNlIHRoZSBpbmRlbnRhdGlv
biBmb3IgdGhlIENQVUlEIGZhdWx0aW5nIGxvZ2ljLgoKQWR2ZXJ0aXNlIHZpcnR1YWxpc2VkIGZh
dWx0aW5nIHN1cHBvcnQgdG8gY29udHJvbCBkb21haW5zIHVubGVzcyB0aGUgb3B0LW91dApoYXMg
YmVlbiB1c2VkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KLS0tCkNDOiBKYW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+CkNDOiBX
ZWkgTGl1IDx3bEB4ZW4ub3JnPgpDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+CgpvcHRfZG9tMF9jcHVpZF9mYXVsdGluZyB3b3VsZCBpZGVhbGx5IGxpdmUgaW4gZG9t
MF9idWlsZC5jIG5leHQgdG8Kb3B0X2RvbTBfdmVyYm9zZSwgYnV0IHRoZSBmaWxlIGlzIGN1cnJl
bnRseSAuaW5pdAoKdjI6CiAqIEludHJvZHVjZSBhIGNvbW1hbmQgbGluZSBvcHRpb24gdG8gcmV0
YWluIG9sZCBiZWhhdmlvdXIuCiAqIEFkdmVydGlzZSB2aXJ0dWFsaXNlZCBmYXVsdGluZyBzdXBw
b3J0IHRvIGRvbTAgd2hlbiBpdCBpcyB1c2VkLgoKUkZDOiBUaGUgcHJldmlvdXMgbG9naWMgd2Fz
IHNsaWdodGx5IGJ1Z2d5IGluIHRoYXQgZXZlbiBQVkggZG9tMCdzIGhhZAp2aXJ0dWFsaXNlZCBm
YXVsdGluZyBzdXBwb3J0IGhpZGRlbiBmcm9tIHRoZW0uICBHaXZlbiB0aGF0IHRoaXMgY2FzZSBh
bHdheXMKaGl0cyB0aGUgQ1BVSUQgaW50ZXJjZXB0LCBob3cgbXVjaCBkbyB3ZSBjYXJlIGFib3V0
IHJldGFpbmluZyB0aGUgb2xkCmJlaGF2aW91cj8KLS0tCiB4ZW4vYXJjaC94ODYvY3B1L2NvbW1v
bi5jICAgfCA1OSArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgICB8ICAyICsrCiB4ZW4vYXJjaC94ODYvbXNyLmMg
ICAgICAgICAgfCAgMyArKy0KIHhlbi9pbmNsdWRlL2FzbS14ODYvc2V0dXAuaCB8ICAxICsKIDQg
ZmlsZXMgY2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEveGVuL2FyY2gveDg2L2NwdS9jb21tb24uYyBiL3hlbi9hcmNoL3g4Ni9jcHUvY29tbW9u
LmMKaW5kZXggOTM3ZDhlODJhOC4uYjhkNmM0OTY3ZSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2NwdS9jb21tb24uYworKysgYi94ZW4vYXJjaC94ODYvY3B1L2NvbW1vbi5jCkBAIC0xMCwxMiAr
MTAsMTUgQEAKICNpbmNsdWRlIDxhc20vaW8uaD4KICNpbmNsdWRlIDxhc20vbXBzcGVjLmg+CiAj
aW5jbHVkZSA8YXNtL2FwaWMuaD4KKyNpbmNsdWRlIDxhc20vc2V0dXAuaD4KICNpbmNsdWRlIDxt
YWNoX2FwaWMuaD4KICNpbmNsdWRlIDxwdWJsaWMvc3lzY3RsLmg+IC8qIGZvciBYRU5fSU5WQUxJ
RF97U09DS0VULENPUkV9X0lEICovCiAKICNpbmNsdWRlICJjcHUuaCIKICNpbmNsdWRlICJtY2hl
Y2sveDg2X21jYS5oIgogCitib29sIF9fcmVhZF9tb3N0bHkgb3B0X2RvbTBfY3B1aWRfZmF1bHRp
bmcgPSB0cnVlOworCiBib29sX3Qgb3B0X2FyYXQgPSAxOwogYm9vbGVhbl9wYXJhbSgiYXJhdCIs
IG9wdF9hcmF0KTsKIApAQCAtMTYxLDM4ICsxNjQsMzYgQEAgdm9pZCBjdHh0X3N3aXRjaF9sZXZl
bGxpbmcoY29uc3Qgc3RydWN0IHZjcHUgKm5leHQpCiB7CiAJY29uc3Qgc3RydWN0IGRvbWFpbiAq
bmV4dGQgPSBuZXh0ID8gbmV4dC0+ZG9tYWluIDogTlVMTDsKIAotCWlmIChjcHVfaGFzX2NwdWlk
X2ZhdWx0aW5nKSB7Ci0JCS8qCi0JCSAqIE5vIG5lZWQgdG8gYWx0ZXIgdGhlIGZhdWx0aW5nIHNl
dHRpbmcgaWYgd2UgYXJlIHN3aXRjaGluZwotCQkgKiB0byBpZGxlOyBpdCB3b24ndCBhZmZlY3Qg
YW55IGNvZGUgcnVubmluZyBpbiBpZGxlIGNvbnRleHQuCi0JCSAqLwotCQlpZiAobmV4dGQgJiYg
aXNfaWRsZV9kb21haW4obmV4dGQpKQotCQkJcmV0dXJuOwotCQkvKgotCQkgKiBXZSAqc2hvdWxk
KiBiZSBlbmFibGluZyBmYXVsdGluZyBmb3IgdGhlIGNvbnRyb2wgZG9tYWluLgotCQkgKgotCQkg
KiBVbmZvcnR1bmF0ZWx5LCB0aGUgZG9tYWluIGJ1aWxkZXIgKGhhdmluZyBvbmx5IGV2ZXIgYmVl
biBhCi0JCSAqIFBWIGd1ZXN0KSBleHBlY3RzIHRvIGJlIGFibGUgdG8gc2VlIGhvc3QgY3B1aWQg
c3RhdGUgaW4gYQotCQkgKiBuYXRpdmUgQ1BVSUQgaW5zdHJ1Y3Rpb24sIHRvIGNvcnJlY3RseSBi
dWlsZCBhIENQVUlEIHBvbGljeQotCQkgKiBmb3IgSFZNIGd1ZXN0cyAobm90YWJseSB0aGUgeHN0
YXRlIGxlYXZlcykuCi0JCSAqCi0JCSAqIFRoaXMgbG9naWMgaXMgZnVuZGltZW50YWxseSBicm9r
ZW4gZm9yIEhWTSB0b29sc3RhY2sKLQkJICogZG9tYWlucywgYW5kIGZhdWx0aW5nIGNhdXNlcyBQ
ViBndWVzdHMgdG8gYmVoYXZlIGxpa2UgSFZNCi0JCSAqIGd1ZXN0cyBmcm9tIHRoZWlyIHBvaW50
IG9mIHZpZXcuCi0JCSAqCi0JCSAqIEZ1dHVyZSBkZXZlbG9wbWVudCBwbGFucyB3aWxsIG1vdmUg
cmVzcG9uc2liaWxpdHkgZm9yCi0JCSAqIGdlbmVyYXRpbmcgdGhlIG1heGltdW0gZnVsbCBjcHVp
ZCBwb2xpY3kgaW50byBYZW4sIGF0IHdoaWNoCi0JCSAqIHRoaXMgcHJvYmxlbSB3aWxsIGRpc2Fw
cGVhci4KLQkJICovCi0JCXNldF9jcHVpZF9mYXVsdGluZyhuZXh0ZCAmJiAhaXNfY29udHJvbF9k
b21haW4obmV4dGQpICYmCi0JCQkJICAgKGlzX3B2X2RvbWFpbihuZXh0ZCkgfHwKLQkJCQkgICAg
bmV4dC0+YXJjaC5tc3JzLT4KLQkJCQkgICAgbWlzY19mZWF0dXJlc19lbmFibGVzLmNwdWlkX2Zh
dWx0aW5nKSk7CisJaWYgKCFjcHVfaGFzX2NwdWlkX2ZhdWx0aW5nKSB7CisJCWlmIChjdHh0X3N3
aXRjaF9tYXNraW5nKQorCQkJYWx0ZXJuYXRpdmVfdmNhbGwoY3R4dF9zd2l0Y2hfbWFza2luZywg
bmV4dCk7CiAJCXJldHVybjsKIAl9CiAKLQlpZiAoY3R4dF9zd2l0Y2hfbWFza2luZykKLQkJYWx0
ZXJuYXRpdmVfdmNhbGwoY3R4dF9zd2l0Y2hfbWFza2luZywgbmV4dCk7CisJLyoKKwkgKiBObyBu
ZWVkIHRvIGFsdGVyIHRoZSBmYXVsdGluZyBzZXR0aW5nIGlmIHdlIGFyZSBzd2l0Y2hpbmcKKwkg
KiB0byBpZGxlOyBpdCB3b24ndCBhZmZlY3QgYW55IGNvZGUgcnVubmluZyBpbiBpZGxlIGNvbnRl
eHQuCisJICovCisJaWYgKG5leHRkICYmIGlzX2lkbGVfZG9tYWluKG5leHRkKSkKKwkJcmV0dXJu
OworCisJLyoKKwkgKiBXZSAqc2hvdWxkKiBiZSBlbmFibGluZyBmYXVsdGluZyBmb3IgdGhlIGNv
bnRyb2wgZG9tYWluLgorCSAqCisJICogVGhlIGRvbWFpbiBidWlsZGVyIGhhcyBub3cgYmVlbiB1
cGRhdGVkIHRvIG5vdCBkZXBlbmQgb24gc2VlaW5nCisJICogaG9zdCBDUFVJRCB2YWx1ZXMuICBU
aGlzIG1ha2VzIGl0IGNvbXBhdGlibGUgd2l0aCBQVkggdG9vbHN0YWNrCisJICogZG9tYWlucywg
YW5kIGxldHMgdXMgZW5hYmxlIGZhdWx0aW5nIGJ5IGRlZmF1bHQgZm9yIGFsbCBQViBkb21haW5z
LgorCSAqCisJICogSG93ZXZlciwgYXMgUFYgY29udHJvbCBkb21haW5zIGhhdmUgbmV2ZXIgaGFk
IGZhdWx0aW5nIGVuZm9yY2VkIG9uCisJICogdGhlbSBiZWZvcmUsIHRoZXJlIG1pZ2h0IHBsYXVz
aWJseSBiZSBvdGhlciBkZXBlbmRlbmljZXMgb24gaG9zdAorCSAqIENQVUlEIGRhdGEuICBUaGVy
ZWZvcmUsIHdlIGhhdmUgbGVmdCBhbiBpbnRlcmltIGVzY2FwZSBoYXRjaCBpbiB0aGUKKwkgKiBm
b3JtIG9mIGBkb20wPW5vLWNwdWlkLWZhdWx0aW5nYCB0byByZXN0b3JlIHRoZSBvbGRlciBiZWhh
dmlvdXIuCisJICovCisJc2V0X2NwdWlkX2ZhdWx0aW5nKG5leHRkICYmIChvcHRfZG9tMF9jcHVp
ZF9mYXVsdGluZyB8fAorCQkJCSAgICAgIWlzX2NvbnRyb2xfZG9tYWluKG5leHRkKSkgJiYKKwkJ
CSAgIChpc19wdl9kb21haW4obmV4dGQpIHx8CisJCQkgICAgbmV4dC0+YXJjaC5tc3JzLT4KKwkJ
CSAgICBtaXNjX2ZlYXR1cmVzX2VuYWJsZXMuY3B1aWRfZmF1bHRpbmcpKTsKIH0KIAogYm9vbF90
IG9wdF9jcHVfaW5mbzsKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgYi94
ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCmluZGV4IGM2OTU3MDkyMGMuLjRiNzUxNjZkYjMgMTAw
NjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMKKysrIGIveGVuL2FyY2gveDg2L2Rv
bTBfYnVpbGQuYwpAQCAtMzA1LDYgKzMwNSw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX2Rv
bTBfcGFyYW0oY29uc3QgY2hhciAqcykKICNlbmRpZgogICAgICAgICBlbHNlIGlmICggKHZhbCA9
IHBhcnNlX2Jvb2xlYW4oInZlcmJvc2UiLCBzLCBzcykpID49IDAgKQogICAgICAgICAgICAgb3B0
X2RvbTBfdmVyYm9zZSA9IHZhbDsKKyAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29s
ZWFuKCJjcHVpZC1mYXVsdGluZyIsIHMsIHNzKSkgPj0gMCApCisgICAgICAgICAgICBvcHRfZG9t
MF9jcHVpZF9mYXVsdGluZyA9IHZhbDsKICAgICAgICAgZWxzZQogICAgICAgICAgICAgcmMgPSAt
RUlOVkFMOwogCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbXNyLmMgYi94ZW4vYXJjaC94ODYv
bXNyLmMKaW5kZXggZTY1OTYxZmNjYi4uODhiODgyYzhjYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
eDg2L21zci5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tc3IuYwpAQCAtMjYsNiArMjYsNyBAQAogCiAj
aW5jbHVkZSA8YXNtL2RlYnVncmVnLmg+CiAjaW5jbHVkZSA8YXNtL21zci5oPgorI2luY2x1ZGUg
PGFzbS9zZXR1cC5oPgogCiBERUZJTkVfUEVSX0NQVSh1aW50MzJfdCwgdHNjX2F1eCk7CiAKQEAg
LTkyLDcgKzkzLDcgQEAgaW50IGluaXRfZG9tYWluX21zcl9wb2xpY3koc3RydWN0IGRvbWFpbiAq
ZCkKICAgICAgICAgcmV0dXJuIC1FTk9NRU07CiAKICAgICAvKiBTZWUgY29tbWVudCBpbiBpbnRl
bF9jdHh0X3N3aXRjaF9sZXZlbGxpbmcoKSAqLwotICAgIGlmICggaXNfY29udHJvbF9kb21haW4o
ZCkgKQorICAgIGlmICggIW9wdF9kb20wX2NwdWlkX2ZhdWx0aW5nICYmIGlzX2NvbnRyb2xfZG9t
YWluKGQpICkKICAgICAgICAgbXAtPnBsYXRmb3JtX2luZm8uY3B1aWRfZmF1bHRpbmcgPSBmYWxz
ZTsKIAogICAgIGQtPmFyY2gubXNyID0gbXA7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20t
eDg2L3NldHVwLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L3NldHVwLmgKaW5kZXggMTVkNjM2MzAy
Mi4uODYxZDQ2ZDZhYyAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9zZXR1cC5oCisr
KyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc2V0dXAuaApAQCAtNjYsNiArNjYsNyBAQCBleHRlcm4g
Ym9vbCBvcHRfZG9tMF9zaGFkb3c7CiAjZW5kaWYKIGV4dGVybiBib29sIG9wdF9kb20wX3B2aDsK
IGV4dGVybiBib29sIG9wdF9kb20wX3ZlcmJvc2U7CitleHRlcm4gYm9vbCBvcHRfZG9tMF9jcHVp
ZF9mYXVsdGluZzsKIAogI2RlZmluZSBtYXhfaW5pdF9kb21pZCAoMCkKIAotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
