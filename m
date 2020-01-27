Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFC314A63F
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 15:36:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw5TX-0001Sk-Ej; Mon, 27 Jan 2020 14:34:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x5IB=3Q=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iw5TW-0001Se-Ht
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 14:34:50 +0000
X-Inumbo-ID: 2c144978-4112-11ea-9fd7-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c144978-4112-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580135690;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j3yGfAOUhZPugNbrny2xka/4HNVhlA2LDTQGd82Szh0=;
 b=TtjONi3o/JItkt4BG/MkTiyOO2xonmLkQY44lK/HWz8vLZaEe7Uj4RUl
 M9o5hCEofRfj+oK5XEW63bLiabGvEx98XJX1nvZZ9Rwbe8aOCHJSErKmG
 zFaUhTzHU6196Eep6eloyCDA0bOGg0nV3z2086bQsBYp0szUK6uFxaD9m 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Q87zzMkvxa2qc9hV/hbIkh1smzrKxHFPwcbd7Pi8LdOAUvtnJ/N1h81/aOpB4n3alDCn2nxAOt
 E93LawGMm4NRvxJRY8oVYGUgrlg9rcu2JV9DuQFEflKySiHDe3IIrg7BVKZNq8P70Ifitn7Ghd
 bUveLkBbXE2Bvn/kXYi1UZTgd6MO6pcpn8PNvkrFzKl/uqe3/GxWA/jKU1rn0iJrOF0pYeLbC/
 G5x/s89jei55P3eM7H58mPP4djYnSE304U6sGE5gZcE+/nCPsDlF1uygEYtbwbr906qIU722uf
 7qw=
X-SBRS: 2.7
X-MesageID: 11664967
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,370,1574139600"; d="scan'208";a="11664967"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Date: Mon, 27 Jan 2020 14:34:27 +0000
Message-ID: <20200127143444.25538-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 00/17] Support CPUID/MSR data in migration
 streams
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVyZSBpcyB2MiBvZiB0aGUgd29yayB0byBwbHVtYiBDUFVJRC9NU1IgZGF0YSBpbnRvIHRoZSBt
aWdyYXRpb24gc3RyZWFtLgoKUGF0Y2hlcyAxIGFuZCAyIGFyZSBjbGVhbnVwLiAgMy04IGFyZSBj
b25jZXJuZWQgd2l0aCBpbnRyb2R1Y2luZyB0aGUKU1RBVElDX0RBVEFfRU5EIHJlY29yZC4gIDkt
MTEgYXJlIHNvbWUgbGlieGwgd29yayB0byByZXBvc2l0aW9uIENQVUlECmNvbnN0cnVjdGlvbiBk
dXJpbmcgZG9tYWluIGNyZWF0ZS4gIDEyLTE0IGFyZSB0aGUgaW50cm9kdWN0aW9uIG9mIHRoZQpY
ODZfe0NQVUlELE1TUn1fREFUQSByZWNvcmRzLCBhbmQgMTUtMTcgYXJlIHRoZSBmaW5hbCBhZGp1
c3RtZW50cyBpbiBsaWJ4YyBhbmQKbGlieGwgdG8gdXNlIHRoZW0uCgpUaGlzIHNlcmllcyBkb2Vz
IGhhdmUgYSBuZXQgY2hhbmdlIGluIGJlaGF2aW91ciBmb3IgQ1BVSUQgaGFuZGluZyBpbiBtaWdy
YXRlZApkb21haW5zLiAgU2VlIHBhdGNoIDE2IGZvciBkZXRhaWxzLgoKU29tZSBhY2tzIGFyZSBj
YXJyaWVkIGZvcndhcmRzIGZyb20gdGhlIHYxIHJldmlldy4gIE90aGVycyBhcmUgbm90LiAgVGhl
Cm1ham9yaXR5IGNoYW5nZSBoYXMgYmVlbiB0byBzaHVmZmxlIHRoZSBvcmRlciBvZiBhY3Rpb25z
IHRvIGhvcGVmdWxseSBtYWtlIHRoZQpsb2dpYyBtdWNoIG1vcmUgY2xlYXIgdG8gZm9sbG93LgoK
fkFuZHJldwoKQW5kcmV3IENvb3BlciAoMTcpOgogIHRvb2xzL2xpYnhsOiBSZW1vdmUgbGlieGxf
Y3B1aWRfe3NldCxhcHBseV9wb2xpY3l9KCkgZnJvbSB0aGUgQVBJCiAgdG9vbHMvbGlieGw6IFNp
bXBsaWZ5IGNhbGxiYWNrIGhhbmRsaW5nIGluIGxpYnhsLXNhdmUtaGVscGVyCiAgdG9vbHMvbWln
cmF0aW9uOiBEcm9wIElIRFJfVkVSU0lPTiBjb25zdGFudCBmcm9tIGxpYnhjIGFuZCBweXRob24K
ICBkb2NzL21pZ3JhdGlvbiBTcGVjaWZ5IG1pZ3JhdGlvbiB2MyBhbmQgU1RBVElDX0RBVEFfRU5E
CiAgcHl0aG9uL21pZ3JhdGlvbjogVXBkYXRlIHZhbGlkYXRpb24gbG9naWMgdG8gdW5kZXJzdGFu
ZCBhIHYzIHN0cmVhbQogIGxpYnhjL3Jlc3RvcmU6IFN1cHBvcnQgdjMgc3RyZWFtcyBhbmQgaGFu
ZGxlIFNUQVRJQ19EQVRBX0VORAogIGxpYnhjL3Jlc3RvcmU6IFNUQVRJQ19EQVRBX0VORCBpbmZl
cmVuY2UgZm9yIHYyIGNvbXBhdGliaWxpdHkKICBsaWJ4Yy9zYXZlOiBXcml0ZSBhIHYzIHN0cmVh
bQogIHRvb2xzL2xpYnhsOiBQcm92aWRlIGEgc3RhdGljX2RhdGFfZG9uZSBjYWxsYmFjayBmb3Ig
ZG9tYWluIHJlc3RvcmUKICB0b29scy9saWJ4bDogUGx1bWIgYSByZXN0b3JlIGJvb2xlYW4gZG93
biBpbnRvIGxpYnhsX19idWlsZF9wcmUoKQogIHRvb2xzL2xpYnhsOiBSZS1wb3NpdGlvbiBDUFVJ
RCBoYW5kbGluZyBkdXJpbmcgZG9tYWluIGNvbnN0cnVjdGlvbgogIGRvY3MvbWlncmF0aW9uOiBT
cGVjaWZ5IFg4Nl97Q1BVSUQsTVNSfV9QT0xJQ1kgcmVjb3JkcwogIGxpYnhjL3Jlc3RvcmU6IEhh
bmRsZSBYODZfe0NQVUlELE1TUn1fREFUQSByZWNvcmRzCiAgbGlieGMvc2F2ZTogV3JpdGUgWDg2
X3tDUFVJRCxNU1J9X0RBVEEgcmVjb3JkcwogIHRvb2xzL2xpYnhbY2xdOiBQbHVtYiAnbWlzc2lu
ZycgdGhyb3VnaCBzdGF0aWNfZGF0YV9kb25lKCkgdXAgaW50byBsaWJ4bAogIHRvb2xzL2xpYnhj
OiBSZXN0b3JlIENQVUlEL01TUiBkYXRhIGZvdW5kIGluIHRoZSBtaWdyYXRpb24gc3RyZWFtCiAg
ZG9jcy94bC5jZmc6IFJld3JpdGUgY3B1aWQ9IHNlY3Rpb24KCiBkb2NzL21hbi94bC5jZmcuNS5w
b2QuaW4gICAgICAgICAgICAgICAgICAgfCAgNzQgKysrKysrKysrKysrKy0tLS0tCiBkb2NzL3Nw
ZWNzL2xpYnhjLW1pZ3JhdGlvbi1zdHJlYW0ucGFuZG9jICAgfCAgODEgKysrKysrKysrKysrKysr
KysrLQogdG9vbHMvbGlieGMvaW5jbHVkZS94ZW5ndWVzdC5oICAgICAgICAgICAgIHwgIDExICsr
KwogdG9vbHMvbGlieGMveGNfY3B1aWRfeDg2LmMgICAgICAgICAgICAgICAgIHwgICA4ICstCiB0
b29scy9saWJ4Yy94Y19zcl9jb21tb24uYyAgICAgICAgICAgICAgICAgfCAgIDMgKwogdG9vbHMv
bGlieGMveGNfc3JfY29tbW9uLmggICAgICAgICAgICAgICAgIHwgIDM1ICsrKysrKysrLQogdG9v
bHMvbGlieGMveGNfc3JfY29tbW9uX3g4Ni5jICAgICAgICAgICAgIHwgMTIwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCiB0b29scy9saWJ4Yy94Y19zcl9jb21tb25feDg2LmggICAgICAg
ICAgICAgfCAgMjUgKysrKysrCiB0b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlLmMgICAgICAgICAg
ICAgICAgfCAgNjEgKysrKysrKysrKysrKystCiB0b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4
Nl9odm0uYyAgICAgICAgfCAgMTAgKysrCiB0b29scy9saWJ4Yy94Y19zcl9yZXN0b3JlX3g4Nl9w
di5jICAgICAgICAgfCAgMjcgKysrKysrKwogdG9vbHMvbGlieGMveGNfc3Jfc2F2ZS5jICAgICAg
ICAgICAgICAgICAgIHwgIDIwICsrKystCiB0b29scy9saWJ4Yy94Y19zcl9zYXZlX3g4Nl9odm0u
YyAgICAgICAgICAgfCAgIDYgKysKIHRvb2xzL2xpYnhjL3hjX3NyX3NhdmVfeDg2X3B2LmMgICAg
ICAgICAgICB8ICAxNCArKystCiB0b29scy9saWJ4Yy94Y19zcl9zdHJlYW1fZm9ybWF0LmggICAg
ICAgICAgfCAgIDQgKy0KIHRvb2xzL2xpYnhsL2xpYnhsLmggICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyNiArKysrKystCiB0b29scy9saWJ4bC9saWJ4bF9jcHVpZC5jICAgICAgICAgICAgICAg
ICAgfCAgIDYgKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jICAgICAgICAgICAgICAgICB8
ICAzNyArKysrKysrKy0KIHRvb2xzL2xpYnhsL2xpYnhsX2RtLmMgICAgICAgICAgICAgICAgICAg
ICB8ICAgMiArLQogdG9vbHMvbGlieGwvbGlieGxfZG9tLmMgICAgICAgICAgICAgICAgICAgIHwg
IDIwICsrKy0tCiB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oICAgICAgICAgICAgICAgfCAg
MTAgKystCiB0b29scy9saWJ4bC9saWJ4bF9ub2NwdWlkLmMgICAgICAgICAgICAgICAgfCAgIDYg
Ky0KIHRvb2xzL2xpYnhsL2xpYnhsX3NhdmVfaGVscGVyLmMgICAgICAgICAgICB8ICAxNiArKy0t
CiB0b29scy9saWJ4bC9saWJ4bF9zYXZlX21zZ3NfZ2VuLnBsICAgICAgICAgfCAgIDMgKy0KIHRv
b2xzL3B5dGhvbi9zY3JpcHRzL2NvbnZlcnQtbGVnYWN5LXN0cmVhbSB8ICAxMyArKystCiB0b29s
cy9weXRob24vc2NyaXB0cy92ZXJpZnktc3RyZWFtLXYyICAgICAgfCAgIDIgKy0KIHRvb2xzL3B5
dGhvbi94ZW4vbWlncmF0aW9uL2xpYnhjLnB5ICAgICAgICB8ICA3NCArKysrKysrKysrKysrKysr
LS0KIDI3IGZpbGVzIGNoYW5nZWQsIDYzNSBpbnNlcnRpb25zKCspLCA3OSBkZWxldGlvbnMoLSkK
Ci0tIAoyLjExLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
