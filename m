Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E85018D525
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 15:41:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxtUY-0007J1-2g; Wed, 14 Aug 2019 13:39:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GkAm=WK=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hxtUW-0007Hf-9d
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 13:39:04 +0000
X-Inumbo-ID: e053c3f2-be98-11e9-9bff-431c95180d45
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e053c3f2-be98-11e9-9bff-431c95180d45;
 Wed, 14 Aug 2019 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565789942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tVnMUTfU9E5g4ilJLpfpJUYHbuuEvgxulFxYsi92zC8=;
 b=ByUe/YKNax+rXnJaH9aJhZfpr2630NsBn6rxDw8D2b9/hr6VC3pBygR4
 nzrbN91+ZTAmccm+oAkahgzeHaFlMBEBVPCTRvBt7H8MqzBe5nGUNUq4M
 5o999dJ/EljDnKdRoTmyjjAtDFh9HVwGefc2uHVQTlll+EipEwrBHi+YJ A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zpU3YKTrupSetv710isCiPBKZufZy4xbhwIXKG8NDj/28v8ZudWOoZMTHZMUvKQjXaANo1j5gq
 yYHAynTYrNTrJInA3g6y3Jn1E0apLb8UWNt3ePBekWooyGOcLhvmSx3We5riIEnYzmhpyvkuVQ
 CMvrcPTJkBLO6d5gYzYg9r/9u2XibvDI4s7Nx2mRIRK9p55l0NMbpnOIv5hBbdW+zqtPom8gl6
 YGyymh4XQPa1kvQCHZh5bSjdZhXKCTjBVF2JmUzXYM7eiHj/G8cFdwzpLpzDnfEYkqfAbXpExu
 nVs=
X-SBRS: 2.7
X-MesageID: 4435850
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,385,1559534400"; 
   d="scan'208";a="4435850"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 14 Aug 2019 14:38:42 +0100
Message-ID: <20190814133852.20491-1-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 00/10] use stashed domain create flags...
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uYW5kIGFkZCBwZXItZG9tYWluIElPTU1VIGNvbnRyb2wKClRoaXMgaXMgYSBjb21iaW5hdGlv
biBvZiBteSBwcmV2aW91c2x5IHNlcGFyYXRlIHNlcmllcyBbMV0gYW5kIFsyXS4KClsxXSBodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDcv
bXNnMDIyNTMuaHRtbApbMl0gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9o
dG1sL3hlbi1kZXZlbC8yMDE5LTA3L21zZzAyMjY3Lmh0bWwKClBhdWwgRHVycmFudCAoMTApOgog
IHg4Ni9odm0vZG9tYWluOiByZW1vdmUgdGhlICdoYXBfZW5hYmxlZCcgZmxhZwogIHg4Ni9kb21h
aW46IHJlbW92ZSB0aGUgJ29vc19vZmYnIGZsYWcKICBkb21haW46IHJlbW92ZSB0aGUgJ2lzX3hl
bnN0b3JlJyBmbGFnCiAgeDg2L2RvbWFpbjogcmVtb3ZlIHRoZSAnczNfaW50ZWdyaXR5JyBmbGFn
CiAgZG9tYWluOiBpbnRyb2R1Y2UgWEVOX0RPTUNUTF9DREZfaW9tbXUgZmxhZwogIHVzZSBpc19p
b21tdV9lbmFibGVkKCkgd2hlcmUgYXBwcm9wcmlhdGUuLi4KICByZW1vdmUgbGF0ZSAob24tZGVt
YW5kKSBjb25zdHJ1Y3Rpb24gb2YgSU9NTVUgcGFnZSB0YWJsZXMKICBtYWtlIHBhc3N0aHJvdWdo
L3BjaS5jOmRlYXNzaWduX2RldmljZSgpIHN0YXRpYwogIGlvbW11OiB0aWR5IHVwIGlvbW11X3Vz
ZV9oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkgbWFjcm9zCiAgaW50cm9kdWNlIGEg
J3Bhc3N0aHJvdWdoJyBjb25maWd1cmF0aW9uIG9wdGlvbiB0byB4bC5jZmcuLi4KCiBkb2NzL21h
bi94bC5jZmcuNS5wb2QuaW4gICAgICAgICAgICAgICAgICB8ICA1MiArKysrKysrCiB0b29scy9s
aWJ4bC9saWJ4bC5oICAgICAgICAgICAgICAgICAgICAgICB8ICAgNSArCiB0b29scy9saWJ4bC9s
aWJ4bF9jcmVhdGUuYyAgICAgICAgICAgICAgICB8ICAyMiArKysKIHRvb2xzL2xpYnhsL2xpYnhs
X3R5cGVzLmlkbCAgICAgICAgICAgICAgIHwgICA3ICsKIHRvb2xzL3hsL3hsX3BhcnNlLmMgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDM4ICsrKysrCiB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAg
ICAgICAgICAgICAgICAgICB8ICAxMSArLQogeGVuL2FyY2gvYXJtL3AybS5jICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDQgKy0KIHhlbi9hcmNoL2FybS9zZXR1cC5jICAgICAgICAgICAgICAg
ICAgICAgIHwgICAzICsKIHhlbi9hcmNoL3g4Ni9kb20wX2J1aWxkLmMgICAgICAgICAgICAgICAg
IHwgICA0ICstCiB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgICAgICAgICAgICB8ICAy
NCArLS0KIHhlbi9hcmNoL3g4Ni9kb21jdGwuYyAgICAgICAgICAgICAgICAgICAgIHwgICA0ICst
CiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5jICAgICAgICAgICAgICAgICAgICB8ICAgNiArLQogeGVu
L2FyY2gveDg2L2h2bS9tdHJyLmMgICAgICAgICAgICAgICAgICAgfCAgIDUgKy0KIHhlbi9hcmNo
L3g4Ni9odm0vdmlvYXBpYy5jICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYv
aHZtL3ZteC92bWNzLmMgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2FyY2gveDg2L2h2bS92
bXgvdm14LmMgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9tZW1fc2hh
cmluZy5jICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jICAg
ICAgICAgICAgICAgICB8ICAgNCArLQogeGVuL2FyY2gveDg2L21tL3BhZ2luZy5jICAgICAgICAg
ICAgICAgICAgfCAgIDYgKy0KIHhlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMgICAgICAg
ICAgIHwgICA3ICstCiB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L25vbmUuYyAgICAgICAgICAgICB8
ICAgMiArLQogeGVuL2FyY2gveDg2L3NldHVwLmMgICAgICAgICAgICAgICAgICAgICAgfCAgIDUg
Ky0KIHhlbi9hcmNoL3g4Ni90Ym9vdC5jICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiB4
ZW4vYXJjaC94ODYveDg2XzY0L21tLmMgICAgICAgICAgICAgICAgICB8ICAgMiArLQogeGVuL2Nv
bW1vbi9kb21haW4uYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNDAgKysrKy0KIHhlbi9jb21t
b24vZG9tY3RsLmMgICAgICAgICAgICAgICAgICAgICAgIHwgICAyICstCiB4ZW4vY29tbW9uL21l
bW9yeS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgNCArLQogeGVuL2NvbW1vbi92bV9ldmVu
dC5jICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9pb21tdV9ndWVzdC5jIHwgICAyICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZp
Y2VfdHJlZS5jICAgICB8ICAxOCArLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMgICAg
ICAgICAgICAgIHwgICA4ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jICAgICAg
ICAgICB8IDE3NCArKysrKysrLS0tLS0tLS0tLS0tLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYyAgICAgICAgICAgICB8IDExOSArKysrKysrLS0tLS0tLS0KIHhlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3Z0ZC9pb21tdS5jICAgICAgIHwgIDEyICstCiB4ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC92dGQveDg2L2h2bS5jICAgICB8ICAgMiArLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
eDg2L2lvbW11LmMgICAgICAgfCAgOTcgKy0tLS0tLS0tLS0tCiB4ZW4vaW5jbHVkZS9hc20tYXJt
L2lvbW11LmggICAgICAgICAgICAgICB8ICAgMyAtCiB4ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFp
bi5oICAgICAgICAgICAgICB8ICAgMyAtCiB4ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4u
aCAgICAgICAgICB8ICAgNyAtCiB4ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11LmggICAgICAgICAg
ICAgICB8ICAgNCAtCiB4ZW4vaW5jbHVkZS9hc20teDg2L3BhZ2luZy5oICAgICAgICAgICAgICB8
ICAgMiArLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9zaGFkb3cuaCAgICAgICAgICAgICAgfCAgIDIg
Ky0KIHhlbi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaCAgICAgICAgICAgICAgIHwgIDEwICstCiB4
ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgICAgICAgICAgICB8ICA0MSArKy0tLQogeGVu
L2luY2x1ZGUveGVuL3NjaGVkLmggICAgICAgICAgICAgICAgICAgfCAgMjUgKystLQogeGVuL2lu
Y2x1ZGUveHNtL2R1bW15LmggICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KIHhlbi94c20vZmxh
c2svaG9va3MuYyAgICAgICAgICAgICAgICAgICAgIHwgIDE4ICstLQogNDcgZmlsZXMgY2hhbmdl
ZCwgMzk3IGluc2VydGlvbnMoKyksIDQyMSBkZWxldGlvbnMoLSkKLS0tCkNjOiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzogQW50aG9ueSBQRVJBUkQgPGFudGhv
bnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiBCcmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNv
bT4KQ2M6IERhbmllbCBEZSBHcmFhZiA8ZGdkZWdyYUB0eWNoby5uc2EuZ292PgpDYzogR2Vvcmdl
IER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogSWFuIEphY2tzb24gPGlh
bi5qYWNrc29uQGV1LmNpdHJpeC5jb20+CkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+CkNjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgpDYzogSnVuIE5ha2Fq
aW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPgpDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBp
bnRlbC5jb20+CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5j
b20+CkNjOiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPgpDYzog
UmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgpDYzogIlJvZ2VyIFBh
dSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KQ2M6IFN1cmF2ZWUgU3V0aGlrdWxwYW5pdCA8c3VyYXZl
ZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+CkNjOiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVu
Z3llbC5jb20+CkNjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KQ2M6IFZvbG9keW15ciBCYWJj
aHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Ci0tIAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
