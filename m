Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B84BD12A16D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 13:47:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijjZ3-0003Xb-IC; Tue, 24 Dec 2019 12:45:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zdcS=2O=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ijjZ1-0003XW-W5
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 12:45:28 +0000
X-Inumbo-ID: 3d880c26-264b-11ea-a1e1-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d880c26-264b-11ea-a1e1-bc764e2007e4;
 Tue, 24 Dec 2019 12:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1577191520;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RABxJAD09Xcvfv32cg3ovNKRC/mOqJQa6CUEM2fEOtw=;
 b=iKlHXETjP0aDMuf/q+ao8pMRwBfBGrjM1aGIZ1A8tbETfnxModwcWDGw
 vXweKbop69jJbi+ckqmtDr1JFPMTCeGAHls1dXc67yeaKzTpt8YrPWxEE
 y9mUi3l6VCHTvNS+70x8Zbj9XUynAKAeArTMTiSOkJ9xuBzLbOayuW65B 0=;
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
IronPort-SDR: rqMozP5ekMuFiJXrxy9M+BCZSgZbcdW/jlyyvv+BlgLmgffSi3ZZS/b+togxw/ccR7jXdYUlKa
 FiwAgQB/aCeRyr2Gu1jzh78W25K1PtB0at0FlFKACFTBc4PfWjJ51hjA/oD3ArpZg8g6rDWiPm
 +nM3hVjl8Ft9EO5janvOroONGUTeLgFVM7dnjEJIRJrG7xm5Z7/Eqbg+ylCFvCi/HA5wlEHuZ8
 7imZH1vIwgx3upv1d39FIIkYPHSNG/8xZI5TCU3vl9glMXK1LoOjcvV/8lfKAa2Vea8hKfK7y5
 N54=
X-SBRS: 2.7
X-MesageID: 10123062
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,351,1571716800"; d="scan'208";a="10123062"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 24 Dec 2019 13:44:53 +0100
Message-ID: <20191224124453.47183-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH] x86/flush: use APIC ALLBUT destination
 shorthand when possible
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

SWYgdGhlIGZsdXNoIG1hc2sgbWF0Y2hlcyB0aGUgbWFzayBvZiBvbmxpbmUgQ1BVcyB1c2UgdGhl
IEFQSUMgQUxMQlVUCmRlc3RpbmF0aW9uIHNob3J0aGFuZCBpbiBvcmRlciB0byBzZW5kIGFuIElQ
SSB0byBhbGwgQ1BVcyBvbiB0aGUKc3lzdGVtIGV4Y2VwdCB0aGUgY3VycmVudCBvbmUuIFRoaXMg
Y2FuIG9ubHkgYmUgc2FmZWx5IHVzZWQgd2hlbiBubwpDUFUgaG90cGx1ZyBvciB1bnBsdWcgb3Bl
cmF0aW9ucyBhcmUgdGFraW5nIHBsYWNlLCBubyBvZmZsaW5lIENQVXMgb3IKdGhvc2UgaGF2ZSBi
ZWVuIG9ubGluZWQgYW5kIHBhcmtlZCBhbmQgZmluYWxseSB3aGVuIGFsbCBDUFVzIGluIHRoZQpz
eXN0ZW0gaGF2ZSBiZWVuIGFjY291bnRlZCBmb3IgKGllOiB0aGUgbnVtYmVyIG9mIENQVXMgZG9l
c24ndCBleGNlZWQKTlJfQ1BVUyBhbmQgQVBJQyBJRHMgYXJlIGJlbG93IE1BWF9BUElDUykuCgpU
aGlzIGlzIHNwZWNpYWxseSBiZW5lZmljaWFsIHdoZW4gdXNpbmcgdGhlIFBWIHNoaW0sIHNpbmNl
IHVzaW5nIHRoZQpzaG9ydGhhbmQgYXZvaWRzIHBlcmZvcm1pbmcgYW4gQVBJQyByZWdpc3RlciB3
cml0ZSAob3IgbXVsdGlwbGUgb25lcwppZiB1c2luZyB4QVBJQyBtb2RlKSBmb3IgZWFjaCBkZXN0
aW5hdGlvbiBpbiB0aGUgZmx1c2ggbWFzay4KClRoZSBsb2NrIHRpbWUgb24gYSAzMiB2Q1BVIGd1
ZXN0IHVzaW5nIHRoZSBzaGltIHdpdGhvdXQgdGhlIHNob3J0aGFuZAppczoKCkdsb2JhbCBsb2Nr
IGZsdXNoX2xvY2s6IGFkZHI9ZmZmZjgyZDA4MDRiMjFjMCwgbG9ja3ZhbD1mNjAyZjYwMiwgbm90
IGxvY2tlZAogIGxvY2s6MjI4NDU1OTM4KDc5NDA2MDY1NTczMTM1KSwgYmxvY2s6MjA1OTA4NTgw
KDU1NjQxNjYwNTc2MTUzOSkKCkF2ZXJhZ2UgbG9jayB0aW1lOiAzNDc1NzducwoKV2hpbGUgdGhl
IHNhbWUgZ3Vlc3QgdXNpbmcgdGhlIHNob3J0aGFuZDoKCkdsb2JhbCBsb2NrIGZsdXNoX2xvY2s6
IGFkZHI9ZmZmZjgyZDA4MDRiNDFjMCwgbG9ja3ZhbD1kOWM0ZDliYywgY3B1PTEyCiAgbG9jazox
ODkwNzc1KDQxNjcxOTE0ODA1NCksIGJsb2NrOjE2NjM5NTgoMjUwMDE2MTI4Mjk0OSkKCkF2ZXJh
Z2UgbG9jayB0aW1lOiAyMjAzOTVucwoKQXBwcm94aW1hdGVseSBhIDEvMyBpbXByb3ZlbWVudCBp
biB0aGUgbG9jayB0aW1lLgoKU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Ci0tLQogeGVuL2FyY2gveDg2L2FjcGkvYm9vdC5jICB8ICAxICsKIHhl
bi9hcmNoL3g4Ni9tcHBhcnNlLmMgICAgfCAgNSArKysrKwogeGVuL2FyY2gveDg2L3NtcC5jICAg
ICAgICB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogeGVuL2lu
Y2x1ZGUvYXNtLXg4Ni9zbXAuaCB8ICAyICsrCiA0IGZpbGVzIGNoYW5nZWQsIDQ4IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvYWNwaS9ib290
LmMgYi94ZW4vYXJjaC94ODYvYWNwaS9ib290LmMKaW5kZXggMTU1NDJhOWJkZi4uODhlMWE4OWZm
MCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2FjcGkvYm9vdC5jCisrKyBiL3hlbi9hcmNoL3g4
Ni9hY3BpL2Jvb3QuYwpAQCAtMTAzLDYgKzEwMyw3IEBAIGFjcGlfcGFyc2VfeDJhcGljKHN0cnVj
dCBhY3BpX3N1YnRhYmxlX2hlYWRlciAqaGVhZGVyLCBjb25zdCB1bnNpZ25lZCBsb25nIGVuZCkK
IAkJCSAgICAgICBwcm9jZXNzb3ItPmxhcGljX2ZsYWdzICYgQUNQSV9NQURUX0VOQUJMRUQKIAkJ
CSAgICAgICA/IEtFUk5fV0FSTklORyAiV0FSTklORzogIiA6IEtFUk5fSU5GTywKIAkJCSAgICAg
ICBwcm9jZXNzb3ItPmxvY2FsX2FwaWNfaWQsIHByb2Nlc3Nvci0+dWlkKTsKKwkJY3B1X292ZXJm
bG93ID0gdHJ1ZTsKIAkJLyoKIAkJICogTXVzdCBub3QgcmV0dXJuIGFuIGVycm9yIGhlcmUsIHRv
IHByZXZlbnQKIAkJICogYWNwaV90YWJsZV9wYXJzZV9lbnRyaWVzKCkgZnJvbSB0ZXJtaW5hdGlu
ZyBlYXJseS4KZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tcHBhcnNlLmMgYi94ZW4vYXJjaC94
ODYvbXBwYXJzZS5jCmluZGV4IGYwNTdkOTE2MmYuLjhkNzczOWZiZjQgMTAwNjQ0Ci0tLSBhL3hl
bi9hcmNoL3g4Ni9tcHBhcnNlLmMKKysrIGIveGVuL2FyY2gveDg2L21wcGFyc2UuYwpAQCAtNjYs
NiArNjYsOSBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9faW5pdGRhdGEgZGlzYWJsZWRfY3B1czsK
IC8qIEJpdG1hc2sgb2YgcGh5c2ljYWxseSBleGlzdGluZyBDUFVzICovCiBwaHlzaWRfbWFza190
IHBoeXNfY3B1X3ByZXNlbnRfbWFwOwogCisvKiBSZWNvcmQgd2hldGhlciBDUFVzIGhhdmVuJ3Qg
YmVlbiBhZGRlZCBkdWUgdG8gb3ZlcmZsb3dzLiAqLworYm9vbCBfX3JlYWRfbW9zdGx5IGNwdV9v
dmVyZmxvdzsKKwogdm9pZCBfX2luaXQgc2V0X25yX2NwdV9pZHModW5zaWduZWQgaW50IG1heF9j
cHVzKQogewogCXVuc2lnbmVkIGludCB0b3RfY3B1cyA9IG51bV9wcm9jZXNzb3JzICsgZGlzYWJs
ZWRfY3B1czsKQEAgLTE2MCw2ICsxNjMsNyBAQCBzdGF0aWMgaW50IE1QX3Byb2Nlc3Nvcl9pbmZv
X3goc3RydWN0IG1wY19jb25maWdfcHJvY2Vzc29yICptLAogCQlwcmludGtfb25jZShYRU5MT0df
V0FSTklORwogCQkJICAgICJXQVJOSU5HOiBOUl9DUFVTIGxpbWl0IG9mICV1IHJlYWNoZWQgLSBp
Z25vcmluZyBmdXJ0aGVyIHByb2Nlc3NvcnNcbiIsCiAJCQkgICAgbnJfY3B1X2lkcyk7CisJCWNw
dV9vdmVyZmxvdyA9IHRydWU7CiAJCXJldHVybiAtRU5PU1BDOwogCX0KIApAQCAtMTY3LDYgKzE3
MSw3IEBAIHN0YXRpYyBpbnQgTVBfcHJvY2Vzc29yX2luZm9feChzdHJ1Y3QgbXBjX2NvbmZpZ19w
cm9jZXNzb3IgKm0sCiAJICAgICYmIGdlbmFwaWMubmFtZSA9PSBhcGljX2RlZmF1bHQubmFtZSkg
ewogCQlwcmludGtfb25jZShYRU5MT0dfV0FSTklORwogCQkJICAgICJXQVJOSU5HOiBDUFVzIGxp
bWl0IG9mIDggcmVhY2hlZCAtIGlnbm9yaW5nIGZ1dGhlciBwcm9jZXNzb3JzXG4iKTsKKwkJY3B1
X292ZXJmbG93ID0gdHJ1ZTsKIAkJcmV0dXJuIC1FTk9TUEM7CiAJfQogCmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvc21wLmMgYi94ZW4vYXJjaC94ODYvc21wLmMKaW5kZXggNmZiMzlhMGEyNC4u
NDI3YzMzZGI5ZCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L3NtcC5jCisrKyBiL3hlbi9hcmNo
L3g4Ni9zbXAuYwpAQCAtOCw2ICs4LDcgQEAKICAqCWxhdGVyLgogICovCiAKKyNpbmNsdWRlIDx4
ZW4vY3B1Lmg+CiAjaW5jbHVkZSA8eGVuL2lycS5oPgogI2luY2x1ZGUgPHhlbi9zY2hlZC5oPgog
I2luY2x1ZGUgPHhlbi9kZWxheS5oPgpAQCAtMTIzLDYgKzEyNCwxMSBAQCB2b2lkIHNlbmRfSVBJ
X3NlbGZfbGVnYWN5KHVpbnQ4X3QgdmVjdG9yKQogICAgIF9fZGVmYXVsdF9zZW5kX0lQSV9zaG9y
dGN1dChBUElDX0RFU1RfU0VMRiwgdmVjdG9yLCBBUElDX0RFU1RfUEhZU0lDQUwpOwogfQogCitz
dGF0aWMgdm9pZCBzZW5kX0lQSV9hbGxidXRzZWxmKHVuc2lnbmVkIGludCB2ZWN0b3IpCit7Cisg
ICAgX19kZWZhdWx0X3NlbmRfSVBJX3Nob3J0Y3V0KEFQSUNfREVTVF9BTExCVVQsIHZlY3Rvciwg
QVBJQ19ERVNUX1BIWVNJQ0FMKTsKK30KKwogdm9pZCBzZW5kX0lQSV9tYXNrX2ZsYXQoY29uc3Qg
Y3B1bWFza190ICpjcHVtYXNrLCBpbnQgdmVjdG9yKQogewogICAgIHVuc2lnbmVkIGxvbmcgbWFz
ayA9IGNwdW1hc2tfYml0cyhjcHVtYXNrKVswXTsKQEAgLTIyNywxNCArMjMzLDQ3IEBAIHZvaWQg
Zmx1c2hfYXJlYV9tYXNrKGNvbnN0IGNwdW1hc2tfdCAqbWFzaywgY29uc3Qgdm9pZCAqdmEsIHVu
c2lnbmVkIGludCBmbGFncykKICAgICBpZiAoIChmbGFncyAmIH5GTFVTSF9PUkRFUl9NQVNLKSAm
JgogICAgICAgICAgIWNwdW1hc2tfc3Vic2V0KG1hc2ssIGNwdW1hc2tfb2YoY3B1KSkgKQogICAg
IHsKKyAgICAgICAgYm9vbCBjcHVzX2xvY2tlZCA9IGZhbHNlOworCiAgICAgICAgIHNwaW5fbG9j
aygmZmx1c2hfbG9jayk7CiAgICAgICAgIGNwdW1hc2tfYW5kKCZmbHVzaF9jcHVtYXNrLCBtYXNr
LCAmY3B1X29ubGluZV9tYXApOwogICAgICAgICBjcHVtYXNrX2NsZWFyX2NwdShjcHUsICZmbHVz
aF9jcHVtYXNrKTsKICAgICAgICAgZmx1c2hfdmEgICAgICA9IHZhOwogICAgICAgICBmbHVzaF9m
bGFncyAgID0gZmxhZ3M7Ci0gICAgICAgIHNlbmRfSVBJX21hc2soJmZsdXNoX2NwdW1hc2ssIElO
VkFMSURBVEVfVExCX1ZFQ1RPUik7CisKKyAgICAgICAgLyoKKyAgICAgICAgICogUHJldmVudCBh
bnkgQ1BVIGhvdHt1bn1wbHVnIHdoaWxlIHNlbmRpbmcgdGhlIElQSXMgaWYgd2UgYXJlIHRvIHVz
ZQorICAgICAgICAgKiBhIHNob3J0aGFuZCwgYWxzbyByZWZ1c2UgdG8gdXNlIGEgc2hvcnRoYW5k
IGlmIG5vdCBhbGwgQ1BVcyBhcmUKKyAgICAgICAgICogb25saW5lIG9yIGhhdmUgYmVlbiBwYXJr
ZWQuCisgICAgICAgICAqLworICAgICAgICBpZiAoIHN5c3RlbV9zdGF0ZSA+IFNZU19TVEFURV9z
bXBfYm9vdCAmJiAhY3B1X292ZXJmbG93ICYmCisgICAgICAgICAgICAgKGNwdXNfbG9ja2VkID0g
Z2V0X2NwdV9tYXBzKCkpICYmCisgICAgICAgICAgICAgKHBhcmtfb2ZmbGluZV9jcHVzIHx8Cisg
ICAgICAgICAgICAgIGNwdW1hc2tfZXF1YWwoJmNwdV9vbmxpbmVfbWFwLCAmY3B1X3ByZXNlbnRf
bWFwKSkgKQorICAgICAgICB7CisgICAgICAgICAgICBjcHVtYXNrX2NvcHkodGhpc19jcHUoc2Ny
YXRjaF9jcHVtYXNrKSwgJmNwdV9vbmxpbmVfbWFwKTsKKyAgICAgICAgICAgIGNwdW1hc2tfY2xl
YXJfY3B1KGNwdSwgdGhpc19jcHUoc2NyYXRjaF9jcHVtYXNrKSk7CisgICAgICAgIH0KKyAgICAg
ICAgZWxzZQorICAgICAgICB7CisgICAgICAgICAgICBpZiAoIGNwdXNfbG9ja2VkICkKKyAgICAg
ICAgICAgIHsKKyAgICAgICAgICAgICAgICBwdXRfY3B1X21hcHMoKTsKKyAgICAgICAgICAgICAg
ICBjcHVzX2xvY2tlZCA9IGZhbHNlOworICAgICAgICAgICAgfQorICAgICAgICAgICAgY3B1bWFz
a19jbGVhcih0aGlzX2NwdShzY3JhdGNoX2NwdW1hc2spKTsKKyAgICAgICAgfQorCisgICAgICAg
IGlmICggY3B1bWFza19lcXVhbCgmZmx1c2hfY3B1bWFzaywgdGhpc19jcHUoc2NyYXRjaF9jcHVt
YXNrKSkgKQorICAgICAgICAgICAgc2VuZF9JUElfYWxsYnV0c2VsZihJTlZBTElEQVRFX1RMQl9W
RUNUT1IpOworICAgICAgICBlbHNlCisgICAgICAgICAgICBzZW5kX0lQSV9tYXNrKCZmbHVzaF9j
cHVtYXNrLCBJTlZBTElEQVRFX1RMQl9WRUNUT1IpOworCiAgICAgICAgIHdoaWxlICggIWNwdW1h
c2tfZW1wdHkoJmZsdXNoX2NwdW1hc2spICkKICAgICAgICAgICAgIGNwdV9yZWxheCgpOworCisg
ICAgICAgIGlmICggY3B1c19sb2NrZWQgKQorICAgICAgICAgICAgcHV0X2NwdV9tYXBzKCk7CiAg
ICAgICAgIHNwaW5fdW5sb2NrKCZmbHVzaF9sb2NrKTsKICAgICB9CiB9CmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L3NtcC5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9zbXAuaAppbmRl
eCBkYmVlZDJmZDQxLi4zZGY0MTg1NzQ0IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2
L3NtcC5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvc21wLmgKQEAgLTg0LDYgKzg0LDggQEAg
ZXh0ZXJuIGNwdW1hc2tfdCAqKnNvY2tldF9jcHVtYXNrOwogI2RlZmluZSBnZXRfY3B1X2N1cnJl
bnQoY3B1KSBcCiAgICAgKGdldF9jcHVfaW5mb19mcm9tX3N0YWNrKCh1bnNpZ25lZCBsb25nKXN0
YWNrX2Jhc2VbY3B1XSktPmN1cnJlbnRfdmNwdSkKIAorZXh0ZXJuIGJvb2wgY3B1X292ZXJmbG93
OworCiAjZW5kaWYgLyogIV9fQVNTRU1CTFlfXyAqLwogCiAjZW5kaWYKLS0gCjIuMjQuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
