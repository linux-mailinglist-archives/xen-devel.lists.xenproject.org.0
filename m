Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14E618BB8D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 16:49:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jExOu-00062R-Sz; Thu, 19 Mar 2020 15:48:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e0hQ=5E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jExOt-00061x-G1
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 15:48:03 +0000
X-Inumbo-ID: 02afb058-69f9-11ea-bc33-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02afb058-69f9-11ea-bc33-12813bfff9fa;
 Thu, 19 Mar 2020 15:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584632881;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/deMyZ1X51RFAWtQH00mG2VTaZBC1SapOIz0tDOVyz0=;
 b=gYCbqCnDg8ZuWGxAmGvvNZnGGDikJc2VBqN6SMHhKg8ryZGVsetX1xP7
 OELMqIJVoH7Viy8s1QvSwvcZkIBgQhX8dmfOiQ/800rcJYkPhO5m7KRbx
 UjBCpi/H3GeGVhcjLJgnGsXHr1/MXR3Sikv6Ayq6/aVSooVdaAa10bYPU g=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: sdEaNROCAacL+dUv7/aRh+i7/SWFUeRJDFWoaMI3n3cZbQjLHNxrdo111d7U6ytXe91+W6DO5B
 9luOQ0hDHwJtTtBMQF4UV5eTC6GLnhhMClVm6b69/D0K4QhZPWU14mY1sl56aSrouYXaIeLbXF
 ibJJ+tIUS5vc3TzfqryMgTFd1crQpAdZ44NqrrvQD06KQ4dItHUqaLL9KztKG60dy/cEF+8ceM
 QJvAy4I/Ev6004FtzyST8x5ZMLKEom4s73D7/AM8cU7rAL5dHnJJ3QECgGDZk42MZh/3UJyA/2
 nPw=
X-SBRS: 2.7
X-MesageID: 14489694
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,572,1574139600"; d="scan'208";a="14489694"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 19 Mar 2020 16:47:15 +0100
Message-ID: <20200319154716.34556-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200319154716.34556-1-roger.pau@citrix.com>
References: <20200319154716.34556-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v7 2/3] x86/tlb: allow disabling the TLB clock
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

VGhlIFRMQiBjbG9jayBpcyBoZWxwZnVsIHdoZW4gcnVubmluZyBYZW4gb24gYmFyZSBtZXRhbCBi
ZWNhdXNlIHdoZW4KZG9pbmcgYSBUTEIgZmx1c2ggZWFjaCBDUFUgaXMgSVBJJ2VkIGFuZCBjYW4g
a2VlcCBhIHRpbWVzdGFtcCBvZiB0aGUKbGFzdCBmbHVzaC4KClRoaXMgaXMgbm90IHRoZSBjYXNl
IGhvd2V2ZXIgd2hlbiBYZW4gaXMgcnVubmluZyB2aXJ0dWFsaXplZCwgYW5kIHRoZQp1bmRlcmx5
aW5nIGh5cGVydmlzb3IgcHJvdmlkZXMgbWVjaGFuaXNtIHRvIGFzc2lzdCBpbiBwZXJmb3JtaW5n
IFRMQgpmbHVzaGVzOiBYZW4gaXRzZWxmIGZvciBleGFtcGxlIG9mZmVycyBhIEhWTU9QX2ZsdXNo
X3RsYnMgaHlwZXJjYWxsIGluCm9yZGVyIHRvIHBlcmZvcm0gYSBUTEIgZmx1c2ggd2l0aG91dCBo
YXZpbmcgdG8gSVBJIGVhY2ggQ1BVLiBXaGVuCnVzaW5nIHN1Y2ggbWVjaGFuaXNtcyBpdCdzIG5v
IGxvbmdlciBwb3NzaWJsZSB0byBrZWVwIGEgdGltZXN0YW1wIG9mCnRoZSBmbHVzaGVzIG9uIGVh
Y2ggQ1BVLCBhcyB0aGV5IGFyZSBwZXJmb3JtZWQgYnkgdGhlIHVuZGVybHlpbmcKaHlwZXJ2aXNv
ci4KCk9mZmVyIGEgYm9vbGVhbiBpbiBvcmRlciB0byBzaWduYWwgWGVuIHRoYXQgdGhlIHRpbWVz
dGFtcGVkIFRMQgpzaG91bGRuJ3QgYmUgdXNlZC4gVGhpcyBhdm9pZHMga2VlcGluZyB0aGUgdGlt
ZXN0YW1wcyBvZiB0aGUgZmx1c2hlcywKYW5kIGFsc28gZm9yY2VzIE5FRURfRkxVU0ggdG8gYWx3
YXlzIHJldHVybiB0cnVlLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2UgaW50ZW5kZWQsIGFzIHRoaXMg
Y2hhbmdlIGRvZXNuJ3QgaW50cm9kdWNlIGFueQp1c2VyIHRoYXQgZGlzYWJsZXMgdGhlIHRpbWVz
dGFtcGVkIFRMQi4KClNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBj
aXRyaXguY29tPgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KQWNrZWQtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvZmx1c2h0bGIu
YyAgICAgICAgfCAxOSArKysrKysrKysrKysrLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20teDg2L2Zs
dXNodGxiLmggfCAxNyArKysrKysrKysrKysrKysrLQogMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9mbHVz
aHRsYi5jIGIveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKaW5kZXggYzgxZTUzYzBhZS4uMjJiMmU4
NDMyOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2ZsdXNodGxiLmMKKysrIGIveGVuL2FyY2gv
eDg2L2ZsdXNodGxiLmMKQEAgLTMyLDYgKzMyLDkgQEAKIHUzMiB0bGJmbHVzaF9jbG9jayA9IDFV
OwogREVGSU5FX1BFUl9DUFUodTMyLCB0bGJmbHVzaF90aW1lKTsKIAorLyogU2lnbmFscyB3aGV0
aGVyIHRoZSBUTEIgZmx1c2ggY2xvY2sgaXMgaW4gdXNlLiAqLworYm9vbCBfX3JlYWRfbW9zdGx5
IHRsYl9jbGtfZW5hYmxlZCA9IHRydWU7CisKIC8qCiAgKiBwcmVfZmx1c2goKTogSW5jcmVtZW50
IHRoZSB2aXJ0dWFsIFRMQi1mbHVzaCBjbG9jay4gUmV0dXJucyBuZXcgY2xvY2sgdmFsdWUuCiAg
KiAKQEAgLTgyLDEyICs4NSwxMyBAQCBzdGF0aWMgdm9pZCBwb3N0X2ZsdXNoKHUzMiB0KQogc3Rh
dGljIHZvaWQgZG9fdGxiX2ZsdXNoKHZvaWQpCiB7CiAgICAgdW5zaWduZWQgbG9uZyBmbGFncywg
Y3I0OwotICAgIHUzMiB0OworICAgIHUzMiB0ID0gMDsKIAogICAgIC8qIFRoaXMgbm9uLXJlZW50
cmFudCBmdW5jdGlvbiBpcyBzb21ldGltZXMgY2FsbGVkIGluIGludGVycnVwdCBjb250ZXh0LiAq
LwogICAgIGxvY2FsX2lycV9zYXZlKGZsYWdzKTsKIAotICAgIHQgPSBwcmVfZmx1c2goKTsKKyAg
ICBpZiAoIHRsYl9jbGtfZW5hYmxlZCApCisgICAgICAgIHQgPSBwcmVfZmx1c2goKTsKIAogICAg
IGlmICggdXNlX2ludnBjaWQgKQogICAgICAgICBpbnZwY2lkX2ZsdXNoX2FsbCgpOwpAQCAtOTks
NyArMTAzLDggQEAgc3RhdGljIHZvaWQgZG9fdGxiX2ZsdXNoKHZvaWQpCiAgICAgZWxzZQogICAg
ICAgICB3cml0ZV9jcjMocmVhZF9jcjMoKSk7CiAKLSAgICBwb3N0X2ZsdXNoKHQpOworICAgIGlm
ICggdGxiX2Nsa19lbmFibGVkICkKKyAgICAgICAgcG9zdF9mbHVzaCh0KTsKIAogICAgIGxvY2Fs
X2lycV9yZXN0b3JlKGZsYWdzKTsKIH0KQEAgLTEwNyw3ICsxMTIsNyBAQCBzdGF0aWMgdm9pZCBk
b190bGJfZmx1c2godm9pZCkKIHZvaWQgc3dpdGNoX2NyM19jcjQodW5zaWduZWQgbG9uZyBjcjMs
IHVuc2lnbmVkIGxvbmcgY3I0KQogewogICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MsIG9sZF9jcjQ7
Ci0gICAgdTMyIHQ7CisgICAgdTMyIHQgPSAwOwogCiAgICAgLyogVGhyb3VnaG91dCB0aGlzIGZ1
bmN0aW9uIHdlIG1ha2UgdGhpcyBhc3N1bXB0aW9uOiAqLwogICAgIEFTU0VSVCghKGNyNCAmIFg4
Nl9DUjRfUENJREUpIHx8ICEoY3I0ICYgWDg2X0NSNF9QR0UpKTsKQEAgLTExNSw3ICsxMjAsOCBA
QCB2b2lkIHN3aXRjaF9jcjNfY3I0KHVuc2lnbmVkIGxvbmcgY3IzLCB1bnNpZ25lZCBsb25nIGNy
NCkKICAgICAvKiBUaGlzIG5vbi1yZWVudHJhbnQgZnVuY3Rpb24gaXMgc29tZXRpbWVzIGNhbGxl
ZCBpbiBpbnRlcnJ1cHQgY29udGV4dC4gKi8KICAgICBsb2NhbF9pcnFfc2F2ZShmbGFncyk7CiAK
LSAgICB0ID0gcHJlX2ZsdXNoKCk7CisgICAgaWYgKCB0bGJfY2xrX2VuYWJsZWQgKQorICAgICAg
ICB0ID0gcHJlX2ZsdXNoKCk7CiAgICAgaHZtX2ZsdXNoX2d1ZXN0X3RsYnMoKTsKIAogICAgIG9s
ZF9jcjQgPSByZWFkX2NyNCgpOwpAQCAtMTY4LDcgKzE3NCw4IEBAIHZvaWQgc3dpdGNoX2NyM19j
cjQodW5zaWduZWQgbG9uZyBjcjMsIHVuc2lnbmVkIGxvbmcgY3I0KQogICAgIGlmICggY3I0ICYg
WDg2X0NSNF9QQ0lERSApCiAgICAgICAgIGludnBjaWRfZmx1c2hfYWxsX25vbmdsb2JhbHMoKTsK
IAotICAgIHBvc3RfZmx1c2godCk7CisgICAgaWYgKCB0bGJfY2xrX2VuYWJsZWQgKQorICAgICAg
ICBwb3N0X2ZsdXNoKHQpOwogCiAgICAgbG9jYWxfaXJxX3Jlc3RvcmUoZmxhZ3MpOwogfQpkaWZm
IC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9mbHVzaHRsYi5oIGIveGVuL2luY2x1ZGUvYXNt
LXg4Ni9mbHVzaHRsYi5oCmluZGV4IDU3OWRjNTY4MDMuLjcyNDQ1NWFlMGMgMTAwNjQ0Ci0tLSBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvZmx1c2h0bGIuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2
L2ZsdXNodGxiLmgKQEAgLTIxLDEwICsyMSwyMSBAQCBleHRlcm4gdTMyIHRsYmZsdXNoX2Nsb2Nr
OwogLyogVGltZSBhdCB3aGljaCBlYWNoIENQVSdzIFRMQiB3YXMgbGFzdCBmbHVzaGVkLiAqLwog
REVDTEFSRV9QRVJfQ1BVKHUzMiwgdGxiZmx1c2hfdGltZSk7CiAKLSNkZWZpbmUgdGxiZmx1c2hf
Y3VycmVudF90aW1lKCkgdGxiZmx1c2hfY2xvY2sKKy8qIFRMQiBjbG9jayBpcyBpbiB1c2UuICov
CitleHRlcm4gYm9vbCB0bGJfY2xrX2VuYWJsZWQ7CisKK3N0YXRpYyBpbmxpbmUgdWludDMyX3Qg
dGxiZmx1c2hfY3VycmVudF90aW1lKHZvaWQpCit7CisgICAgLyogUmV0dXJuaW5nIDAgZnJvbSB0
bGJmbHVzaF9jdXJyZW50X3RpbWUgd2lsbCBhbHdheXMgZm9yY2UgYSBmbHVzaC4gKi8KKyAgICBy
ZXR1cm4gdGxiX2Nsa19lbmFibGVkID8gdGxiZmx1c2hfY2xvY2sgOiAwOworfQogCiBzdGF0aWMg
aW5saW5lIHZvaWQgcGFnZV9zZXRfdGxiZmx1c2hfdGltZXN0YW1wKHN0cnVjdCBwYWdlX2luZm8g
KnBhZ2UpCiB7CisgICAgLyogQXZvaWQgdGhlIHdyaXRlIGlmIHRoZSBUTEIgY2xvY2sgaXMgZGlz
YWJsZWQuICovCisgICAgaWYgKCAhdGxiX2Nsa19lbmFibGVkICkKKyAgICAgICAgcmV0dXJuOwor
CiAgICAgLyoKICAgICAgKiBQcmV2ZW50IHN0b3JpbmcgYSBzdGFsZSB0aW1lIHN0YW1wLCB3aGlj
aCBjb3VsZCBoYXBwZW4gaWYgYW4gdXBkYXRlCiAgICAgICogdG8gdGxiZmx1c2hfY2xvY2sgcGx1
cyBhIHN1YnNlcXVlbnQgZmx1c2ggSVBJIGhhcHBlbiBiZXR3ZWVuIHRoZQpAQCAtNjcsNiArNzgs
MTAgQEAgc3RhdGljIGlubGluZSB2b2lkIHRsYmZsdXNoX2ZpbHRlcihjcHVtYXNrX3QgKm1hc2ss
IHVpbnQzMl90IHBhZ2VfdGltZXN0YW1wKQogewogICAgIHVuc2lnbmVkIGludCBjcHU7CiAKKyAg
ICAvKiBTaG9ydC1jaXJjdWl0OiB0aGVyZSdzIG5vIG5lZWQgdG8gaXRlcmF0ZSBpZiB0aGUgY2xv
Y2sgaXMgZGlzYWJsZWQuICovCisgICAgaWYgKCAhdGxiX2Nsa19lbmFibGVkICkKKyAgICAgICAg
cmV0dXJuOworCiAgICAgZm9yX2VhY2hfY3B1ICggY3B1LCBtYXNrICkKICAgICAgICAgaWYgKCAh
TkVFRF9GTFVTSChwZXJfY3B1KHRsYmZsdXNoX3RpbWUsIGNwdSksIHBhZ2VfdGltZXN0YW1wKSAp
CiAgICAgICAgICAgICBfX2NwdW1hc2tfY2xlYXJfY3B1KGNwdSwgbWFzayk7Ci0tIAoyLjI1LjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
