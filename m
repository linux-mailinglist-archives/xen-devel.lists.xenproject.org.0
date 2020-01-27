Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BA114AB1D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 21:25:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwAsx-0003N1-PG; Mon, 27 Jan 2020 20:21:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5IB=3Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iwAsw-0003Mw-PC
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 20:21:26 +0000
X-Inumbo-ID: 9755ec20-4142-11ea-acc1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9755ec20-4142-11ea-acc1-bc764e2007e4;
 Mon, 27 Jan 2020 20:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580156485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t66ED8Brbp3tAEhsInxFtGAnkVTpTpZe78KO2ukSmKA=;
 b=QmYn+rduHa9qF7HPiUllj6BU9vDTo8GEpdDgDYdo6JGWXnun+rhP3cm1
 Y0Xba7BfsXGfhH5B5vve5TKtw+nTGBUSYxs/1ff0xfEOfuOHu97kxy8Xg
 mang80yAELHB1dYeE+vLm3Trx9HOQquMjQOLmgu83O1hOOCm3SKaUsMNH c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oyq5yt+KyEh9a71sXN+sglLo2EsCavXu91PtMxkkALYg6lYkEDGG6YerTv1589O4Zs1TTEkHLU
 9WLkilbI9LSo9EYma2WuZ6Fd+pcyk8TMeMlkR8HI96jAP4VcOCSfHM+y+pfyyWT0XAt/RMzW3E
 +kiArF37u3VcYRPeyg/N6HvtaSDr6DVDj7/RRQ65xCRKlLEvlTZwGz12M9zx6IsQGQvFP+DXy4
 gtHbO/B+UJcZ7/DXBDfHJfMhT6yQ7eabrYpgyncU3giL2MvHr8p2U+i9G9TfDkevwkSKkY1+/5
 4ok=
X-SBRS: 2.7
X-MesageID: 12118636
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,371,1574139600"; d="scan'208";a="12118636"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 20:21:21 +0000
Message-ID: <20200127202121.2961-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH RFC] x86/amd: Avoid cpu_has_hypervisor
 evaluating true on native hardware
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
 Igor Druzhinin <igor.druzhinin@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q3VycmVudGx5IHdoZW4gYm9vdGluZyBuYXRpdmUgb24gQU1EIGhhcmR3YXJlLCBjcHVpZG1hc2tf
ZGVmYXVsdHMuXzFjZCBnZXRzCmNvbmZpZ3VyZWQgd2l0aCB0aGUgSFlQRVJWSVNPUiBiaXQgYmVm
b3JlIG5hdGl2ZSBDUFVJRCBpcyBzY2FubmVkIGZvciBmZWF0dXJlCmJpdHMuCgpUaGlzIHJlc3Vs
dHMgaW4gY3B1X2hhc19oeXBlcnZpc29yIGJlY29taW5nIHNldCBhcyBwYXJ0IG9mIGlkZW50aWZ5
X2NwdSgpLCBhbmQKZW5kcyB1cCBhcHBlYXJpbmcgaW4gdGhlIHJhdyBhbmQgaG9zdCBDUFUgcG9s
aWNpZXMuICBOb3RoaW5nIGhhcyByZWFsbHkgY2FyZWQKaW4gdGhlIHBhc3QuCgpBbHRlciBhbWRf
aW5pdF9sZXZlbGxpbmcoKSB0byBleGNsdWRlIHRoZSBIWVBFUlZJU09SIGJpdCBmcm9tCmNwdW1h
c2tfZGVmYXVsdHMsIGFuZCB1cGRhdGUgZG9tYWluX2NwdV9wb2xpY3lfY2hhbmdlZCgpIHRvIGFs
bG93IGl0IHRvIGJlCmV4cGxpY2l0bHkgZm9yd2FyZGVkLgoKVGhpcyBpbiB0dXJuIGhpZ2hsaWdo
dGVkIHRoYXQgZG9tMCBjb25zdHJ1Y3Rpb24gd2FzIGFzeW1ldHJpYyB3aXRoIGRvbVUKY29uc3Ry
dWN0aW9uLCBieSBub3QgaGF2aW5nIGFueSBjYWxscyB0byBkb21haW5fY3B1X3BvbGljeV9jaGFu
Z2VkKCkuICBFeHRlbmQKYXJjaF9kb21haW5fY3JlYXRlKCkgdG8gYWx3YXlzIGNhbGwgZG9tYWlu
X2NwdV9wb2xpY3lfY2hhbmdlZCgpLgoKUmVwb3J0ZWQtYnk6IElnb3IgRHJ1emhpbmluIDxpZ29y
LmRydXpoaW5pbkBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPgotLS0KQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNl
LmNvbT4KQ0M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+CkNDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KQ0M6IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRy
aXguY29tPgoKV2l0aG91dCB0aGlzIGZpeCwgdGhlcmUgaXMgYXBwYXJlbnRseSBhIHByb2JsZW0g
d2l0aCBSb2dlcidzICJbUEFUQ0ggdjMgNy83XQp4ODYvdGxiOiB1c2UgWGVuIEwwIGFzc2lzdGVk
IFRMQiBmbHVzaCB3aGVuIGF2YWlsYWJsZSIgb24gbmF0aXZlIEFNRCBoYXJkd2FyZS4KSSBoYXZl
bid0IGludmVzdGdpYXRlZCB0aGUgaXNzdWUgd2l0aCB0aGF0IHBhdGNoIHNwZWNpZmljYWxseSwg
YmVjYXVzZQpjcHVfaGFzX2h5cGVydmlzb3IgYmVpbmcgd3JvbmcgaXMgb2J2aW91c2x5IGEgYnVn
LgoKVGhpcyBpcyBvbmUgb2YgdHdvIHBvc3NpYmxlIGFwcHJvYWNoZXMsIGFuZCBib3RoIGhhdmUg
dGhlaXIgZG93bnNpZGVzLiAgVGhpcwpvbmUgdGFrZXMgYW4gZXh0cmEgaGl0IG9uIGNvbnRleHQg
c3dpdGNoZXMgYmV0d2VlbiBQViB2Y3B1cyBhbmQgaWRsZS9odm0sIGFzCnRoZXkgd2lsbCB1c3Vh
bGx5IGRpZmZlciBpbiBIWVBFUlZJU09SIGJpdC4KClRoZSBvdGhlciBhcHByb2FjaCBpcyB0byBv
cmRlciB0aGluZ3MgbW9yZSBjYXJlZnVsbHkgc28gbGV2ZWxsaW5nIGlzCmNvbmZpZ3VyZWQgYWZ0
ZXIgc2Nhbm5pbmcgZm9yIGNwdWlkIGJpdHMsIGJ1dCB0aGF0IGhhcyB0aGUgZG93bnNpZGUgdGhh
dCBpdCBpcwp2ZXJ5IGVhc3kgdG8gcmVncmVzcy4KClRob3VnaHRzIG9uIHdoaWNoIGlzIHRoZSBs
ZWFzdC1iYWQgYXBwcm9hY2ggdG8gdGFrZT8gIEhhdmluZyB3cml0dGVuIHRoaXMKcGF0Y2gsIEkn
bSBub3cgZXJyaW5nIG9uIHRoZSBzaWRlIG9mIGRvaW5nIGl0IHRoZSBvdGhlciB3YXkuCi0tLQog
eGVuL2FyY2gveDg2L2NwdS9hbWQuYyAgICAgICB8IDMgLS0tCiB4ZW4vYXJjaC94ODYvZG9tYWlu
LmMgICAgICAgIHwgMiArKwogeGVuL2FyY2gveDg2L2RvbWN0bC5jICAgICAgICB8IDkgKysrKysr
KystCiB4ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oIHwgMiArKwogNCBmaWxlcyBjaGFuZ2Vk
LCAxMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L3g4Ni9jcHUvYW1kLmMgYi94ZW4vYXJjaC94ODYvY3B1L2FtZC5jCmluZGV4IDhiNWYwZjJlNGMu
LjA5MDZiMjM1ODIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKKysrIGIveGVu
L2FyY2gveDg2L2NwdS9hbWQuYwpAQCAtMjk3LDkgKzI5Nyw2IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBub2lubGluZSBhbWRfaW5pdF9sZXZlbGxpbmcodm9pZCkKIAkJCWVjeCB8PSBjcHVmZWF0X21h
c2soWDg2X0ZFQVRVUkVfT1NYU0FWRSk7CiAJCWVkeCB8PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRV
UkVfQVBJQyk7CiAKLQkJLyogQWxsb3cgdGhlIEhZUEVSVklTT1IgYml0IHRvIGJlIHNldCB2aWEg
Z3Vlc3QgcG9saWN5LiAqLwotCQllY3ggfD0gY3B1ZmVhdF9tYXNrKFg4Nl9GRUFUVVJFX0hZUEVS
VklTT1IpOwotCiAJCWNwdWlkbWFza19kZWZhdWx0cy5fMWNkID0gKCh1aW50NjRfdCllY3ggPDwg
MzIpIHwgZWR4OwogCX0KIApkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWFpbi5jIGIveGVu
L2FyY2gveDg2L2RvbWFpbi5jCmluZGV4IDI4ZmVmYTFmODEuLjMxNmI4MDE1OTcgMTAwNjQ0Ci0t
LSBhL3hlbi9hcmNoL3g4Ni9kb21haW4uYworKysgYi94ZW4vYXJjaC94ODYvZG9tYWluLmMKQEAg
LTY2NSw2ICs2NjUsOCBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21haW4gKmQs
CiAgICAgICovCiAgICAgZC0+YXJjaC54ODdfZmlwX3dpZHRoID0gY3B1X2hhc19mcHVfc2VsID8g
MCA6IDg7CiAKKyAgICBkb21haW5fY3B1X3BvbGljeV9jaGFuZ2VkKGQpOworCiAgICAgcmV0dXJu
IDA7CiAKICBmYWlsOgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2RvbWN0bC5jIGIveGVuL2Fy
Y2gveDg2L2RvbWN0bC5jCmluZGV4IDVlZDYzYWMxMGEuLjA2MjdlYjRlMDYgMTAwNjQ0Ci0tLSBh
L3hlbi9hcmNoL3g4Ni9kb21jdGwuYworKysgYi94ZW4vYXJjaC94ODYvZG9tY3RsLmMKQEAgLTQ4
LDcgKzQ4LDcgQEAgc3RhdGljIGludCBnZGJzeF9ndWVzdF9tZW1faW8oZG9taWRfdCBkb21pZCwg
c3RydWN0IHhlbl9kb21jdGxfZ2Ric3hfbWVtaW8gKmlvcCkKIH0KICNlbmRpZgogCi1zdGF0aWMg
dm9pZCBkb21haW5fY3B1X3BvbGljeV9jaGFuZ2VkKHN0cnVjdCBkb21haW4gKmQpCit2b2lkIGRv
bWFpbl9jcHVfcG9saWN5X2NoYW5nZWQoc3RydWN0IGRvbWFpbiAqZCkKIHsKICAgICBjb25zdCBz
dHJ1Y3QgY3B1aWRfcG9saWN5ICpwID0gZC0+YXJjaC5jcHVpZDsKICAgICBzdHJ1Y3QgdmNwdSAq
djsKQEAgLTEwNiw2ICsxMDYsMTMgQEAgc3RhdGljIHZvaWQgZG9tYWluX2NwdV9wb2xpY3lfY2hh
bmdlZChzdHJ1Y3QgZG9tYWluICpkKQogICAgICAgICAgICAgICAgICAgICBlY3ggPSAwOwogICAg
ICAgICAgICAgICAgIGVkeCA9IGNwdWZlYXRfbWFzayhYODZfRkVBVFVSRV9BUElDKTsKIAorICAg
ICAgICAgICAgICAgIC8qCisgICAgICAgICAgICAgICAgICogSWYgdGhlIEh5cGVydmlzb3IgYml0
IGlzIHNldCBpbiB0aGUgcG9saWN5LCB3ZSBjYW4gYWxzbworICAgICAgICAgICAgICAgICAqIGZv
cndhcmQgaXQgaW50byByZWFsIENQVUlELgorICAgICAgICAgICAgICAgICAqLworICAgICAgICAg
ICAgICAgIGlmICggcC0+YmFzaWMuaHlwZXJ2aXNvciApCisgICAgICAgICAgICAgICAgICAgIGVj
eCB8PSBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfSFlQRVJWSVNPUik7CisKICAgICAgICAgICAg
ICAgICBtYXNrIHw9ICgodWludDY0X3QpZWN4IDw8IDMyKSB8IGVkeDsKICAgICAgICAgICAgICAg
ICBicmVhazsKICAgICAgICAgICAgIH0KZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
ZG9tYWluLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCmluZGV4IGEzYWU1ZDlhMjAu
LjgxNzA2NWJmODEgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmgKKysr
IGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaApAQCAtNjI0LDYgKzYyNCw4IEBAIHN0cnVj
dCBndWVzdF9tZW1vcnlfcG9saWN5CiB2b2lkIHVwZGF0ZV9ndWVzdF9tZW1vcnlfcG9saWN5KHN0
cnVjdCB2Y3B1ICp2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZ3Vl
c3RfbWVtb3J5X3BvbGljeSAqcG9saWN5KTsKIAordm9pZCBkb21haW5fY3B1X3BvbGljeV9jaGFu
Z2VkKHN0cnVjdCBkb21haW4gKmQpOworCiBib29sIHVwZGF0ZV9ydW5zdGF0ZV9hcmVhKHN0cnVj
dCB2Y3B1ICopOwogYm9vbCB1cGRhdGVfc2Vjb25kYXJ5X3N5c3RlbV90aW1lKHN0cnVjdCB2Y3B1
ICosCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHZjcHVfdGltZV9p
bmZvICopOwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
