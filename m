Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3157D906B6
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 19:22:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyftc-0005Mi-GY; Fri, 16 Aug 2019 17:20:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Hd7z=WM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hyfta-0005Kw-F3
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 17:20:10 +0000
X-Inumbo-ID: 1807aaa4-c04a-11e9-a661-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1807aaa4-c04a-11e9-a661-bc764e2007e4;
 Fri, 16 Aug 2019 17:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565976007;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vqqUZfkqi6rOesIFm4OY0cU4TB825p2qI0rRNnqea64=;
 b=SwFDbbhtBhhj3W7dbLpotzHmUzTSmHrvmWkmN85wXtM8/WVpPB9g4sUE
 8h65Ea3OJEyHPnSx+N1uLBPwSm7YltdU+XWcsgchDZ345wTfXzeyMjp+f
 1Mw+7Y/J7vs7n+g46Sc+1CrPR/zud6NYljsTDaG5aqZ/LAbVmwHqxbw+M s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FGDqQ1CyjzMM4T3kt/5amzO/QH2jRw/xTkIrSG+D7R/knqe8eb9YyroB7pK9UXkA+Fj1gGV+FC
 YlX62Zd1dsIBfX0Hk6MP1cCm8G90pnEbNEXYa4SaOxpVducM6LZWIVxG4ddc6/lE9aDRpqZuY2
 C3SawzOZ2LhATwalzfTsCOusn2B4KRIgcB+H4mHC3uFNCZp9UjjOSXJHc3wMp9AZFOEvmfRUsJ
 SMMfcGLuSvgjS1MGORJuAMWV+1giG/u0BphG/gNEqMqTYdv7J1RKtVFkYrpKxO5OSWzDGtB/j6
 p3w=
X-SBRS: 2.7
X-MesageID: 4596320
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,394,1559534400"; 
   d="scan'208";a="4596320"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 16 Aug 2019 18:19:58 +0100
Message-ID: <20190816172001.3905-8-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190816172001.3905-1-paul.durrant@citrix.com>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v6 07/10] use is_iommu_enabled() where
 appropriate...
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Daniel
 De Graaf <dgdegra@tycho.nsa.gov>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4ucmF0aGVyIHRoYW4gdGVzdGluZyB0aGUgZ2xvYmFsIGlvbW11X2VuYWJsZWQgZmxhZyBhbmQg
b3BzIHBvaW50ZXIuCgpOb3cgdGhhdCB0aGVyZSBpcyBhIHBlci1kb21haW4gZmxhZyBpbmRpY2F0
aW5nIHdoZXRoZXIgdGhlIGRvbWFpbiBpcwpwZXJtaXR0ZWQgdG8gdXNlIHRoZSBJT01NVSAod2hp
Y2ggZGV0ZXJtaW5lcyB3aGV0aGVyIHRoZSBvcHMgcG9pbnRlciB3aWxsCmJlIHNldCksIG1hbnkg
dGVzdHMgb2YgdGhlIGdsb2JhbCBpb21tdV9lbmFibGVkIGZsYWcgYW5kIG9wcyBwb2ludGVyIGNh
bgpiZSB0cmFuc2xhdGVkIGludG8gdGVzdHMgb2YgdGhlIHBlci1kb21haW4gZmxhZy4gU29tZSBv
ZiB0aGUgb3RoZXIgdGVzdHMgb2YKcHVyZWx5IHRoZSBnbG9iYWwgaW9tbXVfZW5hYmxlZCBmbGFn
IGNhbiBhbHNvIGJlIHRyYW5zbGF0ZWQgaW50byB0ZXN0cyBvZgp0aGUgcGVyLWRvbWFpbiBmbGFn
LgoKTk9URTogVGhlIGNvbW1lbnQgaW4gaW9tbXVfc2hhcmVfcDJtX3RhYmxlKCkgaXMgYWxzbyBm
aXhlZDsgbmVlZF9pb21tdSgpCiAgICAgIGRpc2FwcGVhcmVkIHNvbWUgdGltZSBhZ28uIEFsc28s
IHdoaWxzdCB0aGUgc3R5bGUgb2YgdGhlICdpZicgaW4KICAgICAgZmxhc2tfaW9tbXVfcmVzb3Vy
Y2VfdXNlX3Blcm0oKSBpcyBmaXhlZCwgSSBoYXZlIG5vdCB0cmFuc2xhdGVkIGFueQogICAgICBp
bnN0YW5jZXMgb2YgdTMyIGludG8gdWludDMyX3QgdG8ga2VlcCBjb25zaXN0ZW5jeS4gSU1PIHN1
Y2ggYQogICAgICB0cmFuc2xhdGlvbiB3b3VsZCBiZSBiZXR0ZXIgZG9uZSBnbG9iYWxseSBmb3Ig
dGhlIHNvdXJjZSBtb2R1bGUgaW4KICAgICAgYSBzZXBhcmF0ZSBwYXRjaC4KICAgICAgVGhlIGNo
YW5nZSBpbiB0aGUgaW5pdGlhbGl6YXRpb24gb2YgdGhlICdoZCcgdmFyaWFibGUgaW4gaW9tbXVf
bWFwKCkKICAgICAgYW5kIGlvbW11X3VubWFwKCkgaXMgZG9uZSB0byBrZWVwIHRoZSBQViBzaGlt
IGJ1aWxkIGhhcHB5LiBXaXRob3V0CiAgICAgIHRoaXMgY2hhbmdlIGl0IHdpbGwgZmFpbCB0byBj
b21waWxlIHdpdGggZXJyb3JzIG9mIHRoZSBmb3JtOgoKaW9tbXUuYzozNjE6MzI6IGVycm9yOiB1
bnVzZWQgdmFyaWFibGUg4oCYaGTigJkgWy1XZXJyb3I9dW51c2VkLXZhcmlhYmxlXQogICAgIGNv
bnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11KGQpOwogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn4KClNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8
cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgpDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNv
bT4KQ2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4KQ2M6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgpDYzogIlJvZ2Vy
IFBhdSBNb25uw6kiIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KQ2M6IEp1biBOYWthamltYSA8anVu
Lm5ha2FqaW1hQGludGVsLmNvbT4KQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29t
PgpDYzogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBldS5jaXRyaXguY29tPgpDYzogU3Vy
YXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRAYW1kLmNvbT4KQ2M6IEJy
aWFuIFdvb2RzIDxicmlhbi53b29kc0BhbWQuY29tPgpDYzogRGFuaWVsIERlIEdyYWFmIDxkZ2Rl
Z3JhQHR5Y2hvLm5zYS5nb3Y+CgpQcmV2aW91c2x5IHBhcnQgb2Ygc2VyaWVzIGh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNy9tc2cwMjI2
Ny5odG1sCgp2NToKIC0gRml4IGxvZ2ljIGluIEFSTSBwMm1faW5pdCgpCiAtIE1ha2UgaW9tbXVf
ZG9fZG9tY3RsKCkgcmV0dXJuIC1FT1BOT1RTVVBQIHJhdGhlciB0aGFuIC1FTk9TWVMgaWYgdGhl
CiAgIElPTU1VIGlzIG5vdCBlbmFibGVkCiAtIEZpeCB0ZXN0IGluIHBjaV9lbmFibGVfYWNzKCkK
IC0gRml4IHRlc3QgaW4gZmxhc2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Blcm0oKQotLS0KIHhlbi9h
cmNoL2FybS9wMm0uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4
Ni9kb20wX2J1aWxkLmMgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9kb21j
dGwuYyAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCiB4ZW4vYXJjaC94ODYvaHZtL2h2bS5j
ICAgICAgICAgICAgICAgICAgICB8ICA2ICsrLS0KIHhlbi9hcmNoL3g4Ni9odm0vdmlvYXBpYy5j
ICAgICAgICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYyAgICAg
ICAgICAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3ZteC5jICAgICAgICAgICAg
ICAgIHwgIDIgKy0KIHhlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMgICAgICAgICAgICAgICAgIHwg
IDQgKy0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvaW9tbXVfZ3Vlc3QuYyB8ICAyICst
CiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jICAgICB8ICA0ICstLQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYyAgICAgICAgICAgICAgfCAgOCArKy0tLQogeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyAgICAgICAgICAgfCAzOSArKysrKysrKysrKystLS0t
LS0tLS0tLQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgICAgICAgICAgICAgfCAxNiAr
KysrKy0tLS0tCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyAgICAgICB8ICAy
ICstCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQveDg2L2h2bS5jICAgICB8ICAyICstCiB4
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYyAgICAgICB8ICAyICstCiB4ZW4veHNt
L2ZsYXNrL2hvb2tzLmMgICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKysrLS0tLS0tCiAxNyBm
aWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspLCA1OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMKaW5kZXggZTI4ZWEx
Yzg1YS4uN2YxNDQyOTMyYSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jCisrKyBiL3hl
bi9hcmNoL2FybS9wMm0uYwpAQCAtMTUzMSw3ICsxNTMxLDcgQEAgaW50IHAybV9pbml0KHN0cnVj
dCBkb21haW4gKmQpCiAgICAgICogc2hhcmVkIHdpdGggdGhlIENQVSwgWGVuIGhhcyB0byBtYWtl
IHN1cmUgdGhhdCB0aGUgUFQgY2hhbmdlcyBoYXZlCiAgICAgICogcmVhY2hlZCB0aGUgbWVtb3J5
CiAgICAgICovCi0gICAgcDJtLT5jbGVhbl9wdGUgPSBpb21tdV9lbmFibGVkICYmCisgICAgcDJt
LT5jbGVhbl9wdGUgPSBpc19pb21tdV9lbmFibGVkKGQpICYmCiAgICAgICAgICFpb21tdV9oYXNf
ZmVhdHVyZShkLCBJT01NVV9GRUFUX0NPSEVSRU5UX1dBTEspOwogCiAgICAgcmMgPSBwMm1fYWxs
b2NfdGFibGUoZCk7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jIGIveGVu
L2FyY2gveDg2L2RvbTBfYnVpbGQuYwppbmRleCBjNjk1NzA5MjBjLi5kMzgxNzg0ZWRkIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9kb20w
X2J1aWxkLmMKQEAgLTM1Niw3ICszNTYsNyBAQCB1bnNpZ25lZCBsb25nIF9faW5pdCBkb20wX2Nv
bXB1dGVfbnJfcGFnZXMoCiAgICAgICAgIGF2YWlsIC09IGQtPm1heF92Y3B1cyAtIDE7CiAKICAg
ICAvKiBSZXNlcnZlIG1lbW9yeSBmb3IgaW9tbXVfZG9tMF9pbml0KCkgKHJvdWdoIGVzdGltYXRl
KS4gKi8KLSAgICBpZiAoIGlvbW11X2VuYWJsZWQgKQorICAgIGlmICggaXNfaW9tbXVfZW5hYmxl
ZChkKSApCiAgICAgewogICAgICAgICB1bnNpZ25lZCBpbnQgczsKIApkaWZmIC0tZ2l0IGEveGVu
L2FyY2gveDg2L2RvbWN0bC5jIGIveGVuL2FyY2gveDg2L2RvbWN0bC5jCmluZGV4IDJkNDVlNWI4
YTguLmJlNGIyMDYwNjggMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9kb21jdGwuYworKysgYi94
ZW4vYXJjaC94ODYvZG9tY3RsLmMKQEAgLTcxNSw3ICs3MTUsNyBAQCBsb25nIGFyY2hfZG9fZG9t
Y3RsKAogICAgICAgICAgICAgYnJlYWs7CiAKICAgICAgICAgcmV0ID0gLUVTUkNIOwotICAgICAg
ICBpZiAoIGlvbW11X2VuYWJsZWQgKQorICAgICAgICBpZiAoIGlzX2lvbW11X2VuYWJsZWQoZCkg
KQogICAgICAgICB7CiAgICAgICAgICAgICBwY2lkZXZzX2xvY2soKTsKICAgICAgICAgICAgIHJl
dCA9IHB0X2lycV9jcmVhdGVfYmluZChkLCBiaW5kKTsKQEAgLTc0NCw3ICs3NDQsNyBAQCBsb25n
IGFyY2hfZG9fZG9tY3RsKAogICAgICAgICBpZiAoIHJldCApCiAgICAgICAgICAgICBicmVhazsK
IAotICAgICAgICBpZiAoIGlvbW11X2VuYWJsZWQgKQorICAgICAgICBpZiAoIGlzX2lvbW11X2Vu
YWJsZWQoZCkgKQogICAgICAgICB7CiAgICAgICAgICAgICBwY2lkZXZzX2xvY2soKTsKICAgICAg
ICAgICAgIHJldCA9IHB0X2lycV9kZXN0cm95X2JpbmQoZCwgYmluZCk7CmRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIveGVuL2FyY2gveDg2L2h2bS9odm0uYwppbmRleCAwMjll
ZWEzYjg1Li4xNzJjODYwYWNjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jCisr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKQEAgLTQ2NSw3ICs0NjUsNyBAQCB2b2lkIGh2bV9t
aWdyYXRlX3RpbWVycyhzdHJ1Y3QgdmNwdSAqdikKIAogdm9pZCBodm1fbWlncmF0ZV9waXJxKHN0
cnVjdCBodm1fcGlycV9kcGNpICpwaXJxX2RwY2ksIGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQogewot
ICAgIEFTU0VSVChpb21tdV9lbmFibGVkICYmCisgICAgQVNTRVJUKGlzX2lvbW11X2VuYWJsZWQo
di0+ZG9tYWluKSAmJgogICAgICAgICAgICAoaXNfaGFyZHdhcmVfZG9tYWluKHYtPmRvbWFpbikg
fHwgaHZtX2RvbWFpbl9pcnEodi0+ZG9tYWluKS0+ZHBjaSkpOwogCiAgICAgaWYgKCAocGlycV9k
cGNpLT5mbGFncyAmIEhWTV9JUlFfRFBDSV9NQUNIX01TSSkgJiYKQEAgLTQ5Niw3ICs0OTYsNyBA
QCB2b2lkIGh2bV9taWdyYXRlX3BpcnFzKHN0cnVjdCB2Y3B1ICp2KQogewogICAgIHN0cnVjdCBk
b21haW4gKmQgPSB2LT5kb21haW47CiAKLSAgICBpZiAoICFpb21tdV9lbmFibGVkIHx8ICFodm1f
ZG9tYWluX2lycShkKS0+ZHBjaSApCisgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSB8fCAh
aHZtX2RvbWFpbl9pcnEoZCktPmRwY2kgKQogICAgICAgIHJldHVybjsKIAogICAgIHNwaW5fbG9j
aygmZC0+ZXZlbnRfbG9jayk7CkBAIC0yMjY0LDcgKzIyNjQsNyBAQCBpbnQgaHZtX3NldF9jcjAo
dW5zaWduZWQgbG9uZyB2YWx1ZSwgYm9vbCBtYXlfZGVmZXIpCiAgICAgfQogCiAgICAgaWYgKCAo
KHZhbHVlIF4gb2xkX3ZhbHVlKSAmIFg4Nl9DUjBfQ0QpICYmCi0gICAgICAgICBpb21tdV9lbmFi
bGVkICYmIGh2bV9mdW5jcy5oYW5kbGVfY2QgJiYKKyAgICAgICAgIGlzX2lvbW11X2VuYWJsZWQo
ZCkgJiYgaHZtX2Z1bmNzLmhhbmRsZV9jZCAmJgogICAgICAgICAgKCFyYW5nZXNldF9pc19lbXB0
eShkLT5pb21lbV9jYXBzKSB8fAogICAgICAgICAgICFyYW5nZXNldF9pc19lbXB0eShkLT5hcmNo
LmlvcG9ydF9jYXBzKSB8fAogICAgICAgICAgIGhhc19hcmNoX3BkZXZzKGQpKSApCmRpZmYgLS1n
aXQgYS94ZW4vYXJjaC94ODYvaHZtL3Zpb2FwaWMuYyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlvYXBp
Yy5jCmluZGV4IDljMjVmNzJiNGQuLjlhZWVmMzJhMTQgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4
Ni9odm0vdmlvYXBpYy5jCisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdmlvYXBpYy5jCkBAIC01MzYs
NyArNTM2LDcgQEAgdm9pZCB2aW9hcGljX3VwZGF0ZV9FT0koc3RydWN0IGRvbWFpbiAqZCwgdTgg
dmVjdG9yKQogCiAgICAgICAgICAgICBlbnQtPmZpZWxkcy5yZW1vdGVfaXJyID0gMDsKIAotICAg
ICAgICAgICAgaWYgKCBpb21tdV9lbmFibGVkICkKKyAgICAgICAgICAgIGlmICggaXNfaW9tbXVf
ZW5hYmxlZChkKSApCiAgICAgICAgICAgICB7CiAgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2so
JmQtPmFyY2guaHZtLmlycV9sb2NrKTsKICAgICAgICAgICAgICAgICBodm1fZHBjaV9lb2koZCwg
dmlvYXBpYy0+YmFzZV9nc2kgKyBwaW4sIGVudCk7CmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYv
aHZtL3ZteC92bWNzLmMgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmMKaW5kZXggMTZmMTRh
YmU4Zi4uZWQyN2U4ZGVmNyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm1jcy5j
CisrKyBiL3hlbi9hcmNoL3g4Ni9odm0vdm14L3ZtY3MuYwpAQCAtMTA4Nyw3ICsxMDg3LDcgQEAg
c3RhdGljIGludCBjb25zdHJ1Y3Rfdm1jcyhzdHJ1Y3QgdmNwdSAqdikKICAgICAgICAgdm14X2Ns
ZWFyX21zcl9pbnRlcmNlcHQodiwgTVNSX0lBMzJfU1lTRU5URVJfQ1MsIFZNWF9NU1JfUlcpOwog
ICAgICAgICB2bXhfY2xlYXJfbXNyX2ludGVyY2VwdCh2LCBNU1JfSUEzMl9TWVNFTlRFUl9FU1As
IFZNWF9NU1JfUlcpOwogICAgICAgICB2bXhfY2xlYXJfbXNyX2ludGVyY2VwdCh2LCBNU1JfSUEz
Ml9TWVNFTlRFUl9FSVAsIFZNWF9NU1JfUlcpOwotICAgICAgICBpZiAoIHBhZ2luZ19tb2RlX2hh
cChkKSAmJiAoIWlvbW11X2VuYWJsZWQgfHwgaW9tbXVfc25vb3ApICkKKyAgICAgICAgaWYgKCBw
YWdpbmdfbW9kZV9oYXAoZCkgJiYgKCFpc19pb21tdV9lbmFibGVkKGQpIHx8IGlvbW11X3Nub29w
KSApCiAgICAgICAgICAgICB2bXhfY2xlYXJfbXNyX2ludGVyY2VwdCh2LCBNU1JfSUEzMl9DUl9Q
QVQsIFZNWF9NU1JfUlcpOwogICAgICAgICBpZiAoICh2bWV4aXRfY3RsICYgVk1fRVhJVF9DTEVB
Ul9CTkRDRkdTKSAmJgogICAgICAgICAgICAgICh2bWVudHJ5X2N0bCAmIFZNX0VOVFJZX0xPQURf
Qk5EQ0ZHUykgKQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4v
YXJjaC94ODYvaHZtL3ZteC92bXguYwppbmRleCAwMDYwMzEwZDc0Li4zYjNkNWI2MjUwIDEwMDY0
NAotLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYworKysgYi94ZW4vYXJjaC94ODYvaHZt
L3ZteC92bXguYwpAQCAtMTIxMCw3ICsxMjEwLDcgQEAgc3RhdGljIHZvaWQgdm14X2hhbmRsZV9j
ZChzdHJ1Y3QgdmNwdSAqdiwgdW5zaWduZWQgbG9uZyB2YWx1ZSkKICAgICAgICAgewogICAgICAg
ICAgICAgdi0+YXJjaC5odm0uY2FjaGVfbW9kZSA9IE5PUk1BTF9DQUNIRV9NT0RFOwogICAgICAg
ICAgICAgdm14X3NldF9ndWVzdF9wYXQodiwgKnBhdCk7Ci0gICAgICAgICAgICBpZiAoICFpb21t
dV9lbmFibGVkIHx8IGlvbW11X3Nub29wICkKKyAgICAgICAgICAgIGlmICggIWlzX2lvbW11X2Vu
YWJsZWQodi0+ZG9tYWluKSB8fCBpb21tdV9zbm9vcCApCiAgICAgICAgICAgICAgICAgdm14X2Ns
ZWFyX21zcl9pbnRlcmNlcHQodiwgTVNSX0lBMzJfQ1JfUEFULCBWTVhfTVNSX1JXKTsKICAgICAg
ICAgICAgIGh2bV9hc2lkX2ZsdXNoX3ZjcHUodik7IC8qIG5vIG5lZWQgdG8gZmx1c2ggY2FjaGUg
Ki8KICAgICAgICAgfQpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyBiL3hl
bi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMKaW5kZXggNmI4NDY4Yzc5My4uOTNkMDMxY2M2YyAxMDA2
NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYworKysgYi94ZW4vYXJjaC94ODYvbW0v
cDJtLWVwdC5jCkBAIC0yNjAsNyArMjYwLDcgQEAgc3RhdGljIGJvb2xfdCBlcHRfc3BsaXRfc3Vw
ZXJfcGFnZShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJtLAogICAgICAgICAqZXB0ZSA9ICplcHRfZW50
cnk7CiAgICAgICAgIGVwdGUtPnNwID0gKGxldmVsID4gMSk7CiAgICAgICAgIGVwdGUtPm1mbiAr
PSBpICogdHJ1bms7Ci0gICAgICAgIGVwdGUtPnNucCA9IChpb21tdV9lbmFibGVkICYmIGlvbW11
X3Nub29wKTsKKyAgICAgICAgZXB0ZS0+c25wID0gaXNfaW9tbXVfZW5hYmxlZChwMm0tPmRvbWFp
bikgJiYgaW9tbXVfc25vb3A7CiAgICAgICAgIGVwdGUtPnN1cHByZXNzX3ZlID0gMTsKIAogICAg
ICAgICBlcHRfcDJtX3R5cGVfdG9fZmxhZ3MocDJtLCBlcHRlLCBlcHRlLT5zYV9wMm10LCBlcHRl
LT5hY2Nlc3MpOwpAQCAtNzY2LDcgKzc2Niw3IEBAIGVwdF9zZXRfZW50cnkoc3RydWN0IHAybV9k
b21haW4gKnAybSwgZ2ZuX3QgZ2ZuXywgbWZuX3QgbWZuLAogICAgICAgICBuZXdfZW50cnkuc3Ag
PSAhIWk7CiAgICAgICAgIG5ld19lbnRyeS5zYV9wMm10ID0gcDJtdDsKICAgICAgICAgbmV3X2Vu
dHJ5LmFjY2VzcyA9IHAybWE7Ci0gICAgICAgIG5ld19lbnRyeS5zbnAgPSAoaW9tbXVfZW5hYmxl
ZCAmJiBpb21tdV9zbm9vcCk7CisgICAgICAgIG5ld19lbnRyeS5zbnAgPSBpc19pb21tdV9lbmFi
bGVkKGQpICYmIGlvbW11X3Nub29wOwogCiAgICAgICAgIC8qIHRoZSBjYWxsZXIgc2hvdWxkIHRh
a2UgY2FyZSBvZiB0aGUgcHJldmlvdXMgcGFnZSAqLwogICAgICAgICBuZXdfZW50cnkubWZuID0g
bWZuX3gobWZuKTsKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9pb21t
dV9ndWVzdC5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2d1ZXN0LmMKaW5k
ZXggN2YyZGQ2NjJhZi4uMWYyYmNmYmUxNSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvYW1kL2lvbW11X2d1ZXN0LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L2lvbW11X2d1ZXN0LmMKQEAgLTgyMSw3ICs4MjEsNyBAQCBpbnQgZ3Vlc3RfaW9tbXVfaW5pdChz
dHJ1Y3QgZG9tYWluKiBkKQogICAgIHN0cnVjdCBndWVzdF9pb21tdSAqaW9tbXU7CiAgICAgc3Ry
dWN0IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7CiAKLSAgICBpZiAoICFpc19odm1f
ZG9tYWluKGQpIHx8ICFpb21tdV9lbmFibGVkIHx8ICFpb21tdXYyX2VuYWJsZWQgfHwKKyAgICBp
ZiAoICFpc19odm1fZG9tYWluKGQpIHx8ICFpc19pb21tdV9lbmFibGVkKGQpIHx8ICFpb21tdXYy
X2VuYWJsZWQgfHwKICAgICAgICAgICFoYXNfdmlvbW11KGQpICkKICAgICAgICAgcmV0dXJuIDA7
CiAKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9kZXZpY2VfdHJlZS5jCmluZGV4IGQzMmIxNzI2NjQuLjEy
ZjJjNGMzZjIgMTAwNjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVl
LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYwpAQCAtMjksNyAr
MjksNyBAQCBpbnQgaW9tbXVfYXNzaWduX2R0X2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1
Y3QgZHRfZGV2aWNlX25vZGUgKmRldikKICAgICBpbnQgcmMgPSAtRUJVU1k7CiAgICAgc3RydWN0
IGRvbWFpbl9pb21tdSAqaGQgPSBkb21faW9tbXUoZCk7CiAKLSAgICBpZiAoICFpb21tdV9lbmFi
bGVkIHx8ICFoZC0+cGxhdGZvcm1fb3BzICkKKyAgICBpZiAoICFpc19pb21tdV9lbmFibGVkKGQp
ICkKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAKICAgICBpZiAoICFkdF9kZXZpY2VfaXNfcHJv
dGVjdGVkKGRldikgKQpAQCAtNzEsNyArNzEsNyBAQCBpbnQgaW9tbXVfZGVhc3NpZ25fZHRfZGV2
aWNlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2KQogICAgIGNv
bnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11KGQpOwogICAgIGludCByYzsK
IAotICAgIGlmICggIWlvbW11X2VuYWJsZWQgfHwgIWhkLT5wbGF0Zm9ybV9vcHMgKQorICAgIGlm
ICggIWlzX2lvbW11X2VuYWJsZWQoZCkgKQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAogICAg
IGlmICggIWR0X2RldmljZV9pc19wcm90ZWN0ZWQoZGV2KSApCmRpZmYgLS1naXQgYS94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9pby5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW8uYwppbmRl
eCA0MjkwYzdjNzEwLi5iMjkyZTc5MzgyIDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9pby5jCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvLmMKQEAgLTQzNCw3ICs0
MzQsNyBAQCBpbnQgcHRfaXJxX2NyZWF0ZV9iaW5kKAogICAgICAgICAgICAgaWYgKCB2Y3B1ICkK
ICAgICAgICAgICAgICAgICBwaXJxX2RwY2ktPmdtc2kucG9zdGVkID0gdHJ1ZTsKICAgICAgICAg
fQotICAgICAgICBpZiAoIHZjcHUgJiYgaW9tbXVfZW5hYmxlZCApCisgICAgICAgIGlmICggdmNw
dSAmJiBpc19pb21tdV9lbmFibGVkKGQpICkKICAgICAgICAgICAgIGh2bV9taWdyYXRlX3BpcnEo
cGlycV9kcGNpLCB2Y3B1KTsKIAogICAgICAgICAvKiBVc2UgaW50ZXJydXB0IHBvc3RpbmcgaWYg
aXQgaXMgc3VwcG9ydGVkLiAqLwpAQCAtODE3LDcgKzgxNyw3IEBAIGludCBodm1fZG9fSVJRX2Rw
Y2koc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBpcnEgKnBpcnEpCiAKICAgICBBU1NFUlQoaXNf
aHZtX2RvbWFpbihkKSk7CiAKLSAgICBpZiAoICFpb21tdV9lbmFibGVkIHx8ICghaXNfaGFyZHdh
cmVfZG9tYWluKGQpICYmICFkcGNpKSB8fAorICAgIGlmICggIWlzX2lvbW11X2VuYWJsZWQoZCkg
fHwgKCFpc19oYXJkd2FyZV9kb21haW4oZCkgJiYgIWRwY2kpIHx8CiAgICAgICAgICAhcGlycV9k
cGNpIHx8ICEocGlycV9kcGNpLT5mbGFncyAmIEhWTV9JUlFfRFBDSV9NQVBQRUQpICkKICAgICAg
ICAgcmV0dXJuIDA7CiAKQEAgLTg2OSw3ICs4NjksNyBAQCBzdGF0aWMgaW50IF9odm1fZHBjaV9t
c2lfZW9pKHN0cnVjdCBkb21haW4gKmQsCiAKIHZvaWQgaHZtX2RwY2lfbXNpX2VvaShzdHJ1Y3Qg
ZG9tYWluICpkLCBpbnQgdmVjdG9yKQogewotICAgIGlmICggIWlvbW11X2VuYWJsZWQgfHwKKyAg
ICBpZiAoICFpc19pb21tdV9lbmFibGVkKGQpIHx8CiAgICAgICAgICAoIWh2bV9kb21haW5faXJx
KGQpLT5kcGNpICYmICFpc19oYXJkd2FyZV9kb21haW4oZCkpICkKICAgICAgICByZXR1cm47CiAK
QEAgLTEwMDEsNyArMTAwMSw3IEBAIHZvaWQgaHZtX2RwY2lfZW9pKHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGludCBndWVzdF9nc2ksCiAgICAgY29uc3Qgc3RydWN0IGh2bV9pcnFfZHBjaSAq
aHZtX2lycV9kcGNpOwogICAgIGNvbnN0IHN0cnVjdCBodm1fZ2lycV9kcGNpX21hcHBpbmcgKmdp
cnE7CiAKLSAgICBpZiAoICFpb21tdV9lbmFibGVkICkKKyAgICBpZiAoICFpc19pb21tdV9lbmFi
bGVkKGQpICkKICAgICAgICAgcmV0dXJuOwogCiAgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4o
ZCkgKQpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKaW5kZXggZTYxZDNkMTM2OC4uMjdjNzVlMDc4NiAx
MDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYworKysgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCkBAIC0xNzksNyArMTc5LDcgQEAgdm9pZCBfX2h3ZG9t
X2luaXQgaW9tbXVfaHdkb21faW5pdChzdHJ1Y3QgZG9tYWluICpkKQogCiAgICAgY2hlY2tfaHdk
b21fcmVxcyhkKTsKIAotICAgIGlmICggIWlvbW11X2VuYWJsZWQgKQorICAgIGlmICggIWlzX2lv
bW11X2VuYWJsZWQoZCkgKQogICAgICAgICByZXR1cm47CiAKICAgICByZWdpc3Rlcl9rZXloYW5k
bGVyKCdvJywgJmlvbW11X2R1bXBfcDJtX3RhYmxlLCAiZHVtcCBpb21tdSBwMm0gdGFibGUiLCAw
KTsKQEAgLTI4NCw3ICsyODQsNyBAQCBpbnQgaW9tbXVfY29uc3RydWN0KHN0cnVjdCBkb21haW4g
KmQpCiAKIHZvaWQgaW9tbXVfZG9tYWluX2Rlc3Ryb3koc3RydWN0IGRvbWFpbiAqZCkKIHsKLSAg
ICBpZiAoICFpb21tdV9lbmFibGVkIHx8ICFkb21faW9tbXUoZCktPnBsYXRmb3JtX29wcyApCisg
ICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApCiAgICAgICAgIHJldHVybjsKIAogICAgIGlv
bW11X3RlYXJkb3duKGQpOwpAQCAtMjk2LDE2ICsyOTYsMTggQEAgaW50IGlvbW11X21hcChzdHJ1
Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4sIG1mbl90IG1mbiwKICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IHBhZ2Vfb3JkZXIsIHVuc2lnbmVkIGludCBmbGFncywKICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50ICpmbHVzaF9mbGFncykKIHsKLSAgICBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11
ICpoZCA9IGRvbV9pb21tdShkKTsKKyAgICBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZDsK
ICAgICB1bnNpZ25lZCBsb25nIGk7CiAgICAgaW50IHJjID0gMDsKIAotICAgIGlmICggIWlvbW11
X2VuYWJsZWQgfHwgIWhkLT5wbGF0Zm9ybV9vcHMgKQorICAgIGlmICggIWlzX2lvbW11X2VuYWJs
ZWQoZCkgKQogICAgICAgICByZXR1cm4gMDsKIAogICAgIEFTU0VSVChJU19BTElHTkVEKGRmbl94
KGRmbiksICgxdWwgPDwgcGFnZV9vcmRlcikpKTsKICAgICBBU1NFUlQoSVNfQUxJR05FRChtZm5f
eChtZm4pLCAoMXVsIDw8IHBhZ2Vfb3JkZXIpKSk7CiAKKyAgICBoZCA9IGRvbV9pb21tdShkKTsK
KwogICAgIGZvciAoIGkgPSAwOyBpIDwgKDF1bCA8PCBwYWdlX29yZGVyKTsgaSsrICkKICAgICB7
CiAgICAgICAgIHJjID0gaW9tbXVfY2FsbChoZC0+cGxhdGZvcm1fb3BzLCBtYXBfcGFnZSwgZCwg
ZGZuX2FkZChkZm4sIGkpLApAQCAtMzU2LDE1ICszNTgsMTcgQEAgaW50IGlvbW11X2xlZ2FjeV9t
YXAoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLCBtZm5fdCBtZm4sCiBpbnQgaW9tbXVfdW5t
YXAoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLCB1bnNpZ25lZCBpbnQgcGFnZV9vcmRlciwK
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmZsdXNoX2ZsYWdzKQogewotICAgIGNvbnN0
IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11KGQpOworICAgIGNvbnN0IHN0cnVj
dCBkb21haW5faW9tbXUgKmhkOwogICAgIHVuc2lnbmVkIGxvbmcgaTsKICAgICBpbnQgcmMgPSAw
OwogCi0gICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29wcyApCisgICAg
aWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApCiAgICAgICAgIHJldHVybiAwOwogCiAgICAgQVNT
RVJUKElTX0FMSUdORUQoZGZuX3goZGZuKSwgKDF1bCA8PCBwYWdlX29yZGVyKSkpOwogCisgICAg
aGQgPSBkb21faW9tbXUoZCk7CisKICAgICBmb3IgKCBpID0gMDsgaSA8ICgxdWwgPDwgcGFnZV9v
cmRlcik7IGkrKyApCiAgICAgewogICAgICAgICBpbnQgZXJyID0gaW9tbXVfY2FsbChoZC0+cGxh
dGZvcm1fb3BzLCB1bm1hcF9wYWdlLCBkLCBkZm5fYWRkKGRmbiwgaSksCkBAIC00MTMsNyArNDE3
LDcgQEAgaW50IGlvbW11X2xvb2t1cF9wYWdlKHN0cnVjdCBkb21haW4gKmQsIGRmbl90IGRmbiwg
bWZuX3QgKm1mbiwKIHsKICAgICBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9p
b21tdShkKTsKIAotICAgIGlmICggIWlvbW11X2VuYWJsZWQgfHwgIWhkLT5wbGF0Zm9ybV9vcHMg
fHwgIWhkLT5wbGF0Zm9ybV9vcHMtPmxvb2t1cF9wYWdlICkKKyAgICBpZiAoICFpc19pb21tdV9l
bmFibGVkKGQpIHx8ICFoZC0+cGxhdGZvcm1fb3BzLT5sb29rdXBfcGFnZSApCiAgICAgICAgIHJl
dHVybiAtRU9QTk9UU1VQUDsKIAogICAgIHJldHVybiBpb21tdV9jYWxsKGhkLT5wbGF0Zm9ybV9v
cHMsIGxvb2t1cF9wYWdlLCBkLCBkZm4sIG1mbiwgZmxhZ3MpOwpAQCAtNDQyLDggKzQ0Niw4IEBA
IGludCBpb21tdV9pb3RsYl9mbHVzaChzdHJ1Y3QgZG9tYWluICpkLCBkZm5fdCBkZm4sIHVuc2ln
bmVkIGludCBwYWdlX2NvdW50LAogICAgIGNvbnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0g
ZG9tX2lvbW11KGQpOwogICAgIGludCByYzsKIAotICAgIGlmICggIWlvbW11X2VuYWJsZWQgfHwg
IWhkLT5wbGF0Zm9ybV9vcHMgfHwKLSAgICAgICAgICFoZC0+cGxhdGZvcm1fb3BzLT5pb3RsYl9m
bHVzaCB8fCAhcGFnZV9jb3VudCB8fCAhZmx1c2hfZmxhZ3MgKQorICAgIGlmICggIWlzX2lvbW11
X2VuYWJsZWQoZCkgfHwgIWhkLT5wbGF0Zm9ybV9vcHMtPmlvdGxiX2ZsdXNoIHx8CisgICAgICAg
ICAhcGFnZV9jb3VudCB8fCAhZmx1c2hfZmxhZ3MgKQogICAgICAgICByZXR1cm4gMDsKIAogICAg
IGlmICggZGZuX2VxKGRmbiwgSU5WQUxJRF9ERk4pICkKQEAgLTQ3MCw4ICs0NzQsOCBAQCBpbnQg
aW9tbXVfaW90bGJfZmx1c2hfYWxsKHN0cnVjdCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBmbHVz
aF9mbGFncykKICAgICBjb25zdCBzdHJ1Y3QgZG9tYWluX2lvbW11ICpoZCA9IGRvbV9pb21tdShk
KTsKICAgICBpbnQgcmM7CiAKLSAgICBpZiAoICFpb21tdV9lbmFibGVkIHx8ICFoZC0+cGxhdGZv
cm1fb3BzIHx8Ci0gICAgICAgICAhaGQtPnBsYXRmb3JtX29wcy0+aW90bGJfZmx1c2hfYWxsIHx8
ICFmbHVzaF9mbGFncyApCisgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSB8fCAhaGQtPnBs
YXRmb3JtX29wcy0+aW90bGJfZmx1c2hfYWxsIHx8CisgICAgICAgICAhZmx1c2hfZmxhZ3MgKQog
ICAgICAgICByZXR1cm4gMDsKIAogICAgIC8qCkBAIC01NTYsOCArNTYwLDggQEAgaW50IGlvbW11
X2RvX2RvbWN0bCgKIHsKICAgICBpbnQgcmV0ID0gLUVOT0RFVjsKIAotICAgIGlmICggIWlvbW11
X2VuYWJsZWQgKQotICAgICAgICByZXR1cm4gLUVOT1NZUzsKKyAgICBpZiAoICFpc19pb21tdV9l
bmFibGVkKGQpICkKKyAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwogCiAjaWZkZWYgQ09ORklH
X0hBU19QQ0kKICAgICByZXQgPSBpb21tdV9kb19wY2lfZG9tY3RsKGRvbWN0bCwgZCwgdV9kb21j
dGwpOwpAQCAtNTc2LDkgKzU4MCw5IEBAIHZvaWQgaW9tbXVfc2hhcmVfcDJtX3RhYmxlKHN0cnVj
dCBkb21haW4qIGQpCiAgICAgQVNTRVJUKGhhcF9lbmFibGVkKGQpKTsKICAgICAvKgogICAgICAq
IGlvbW11X3VzZV9oYXBfcHQoZCkgY2Fubm90IGJlIHVzZWQgaGVyZSBiZWNhdXNlIGR1cmluZyBk
b21haW4KLSAgICAgKiBjb25zdHJ1Y3Rpb24gbmVlZF9pb21tdShkKSB3aWxsIGFsd2F5cyByZXR1
cm4gZmFsc2UgaGVyZS4KKyAgICAgKiBjb25zdHJ1Y3Rpb24gaGFzX2lvbW11X3B0KGQpIHdpbGwg
YWx3YXlzIHJldHVybiBmYWxzZSBoZXJlLgogICAgICAqLwotICAgIGlmICggaW9tbXVfZW5hYmxl
ZCAmJiBpb21tdV9oYXBfcHRfc2hhcmUgKQorICAgIGlmICggaXNfaW9tbXVfZW5hYmxlZChkKSAm
JiBpb21tdV9oYXBfcHRfc2hhcmUgKQogICAgICAgICBpb21tdV9nZXRfb3BzKCktPnNoYXJlX3Ay
bShkKTsKIH0KIApAQCAtNjA4LDEwICs2MTIsNyBAQCBpbnQgaW9tbXVfZ2V0X3Jlc2VydmVkX2Rl
dmljZV9tZW1vcnkoaW9tbXVfZ3JkbV90ICpmdW5jLCB2b2lkICpjdHh0KQogCiBib29sX3QgaW9t
bXVfaGFzX2ZlYXR1cmUoc3RydWN0IGRvbWFpbiAqZCwgZW51bSBpb21tdV9mZWF0dXJlIGZlYXR1
cmUpCiB7Ci0gICAgaWYgKCAhaW9tbXVfZW5hYmxlZCApCi0gICAgICAgIHJldHVybiAwOwotCi0g
ICAgcmV0dXJuIHRlc3RfYml0KGZlYXR1cmUsIGRvbV9pb21tdShkKS0+ZmVhdHVyZXMpOworICAg
IHJldHVybiBpc19pb21tdV9lbmFibGVkKGQpICYmIHRlc3RfYml0KGZlYXR1cmUsIGRvbV9pb21t
dShkKS0+ZmVhdHVyZXMpOwogfQogCiBzdGF0aWMgdm9pZCBpb21tdV9kdW1wX3AybV90YWJsZSh1
bnNpZ25lZCBjaGFyIGtleSkKZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Bj
aS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKaW5kZXggODk1MzZjYzA2Ny4uZGVl
NDdmZTA4YiAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMKQEAgLTU5NSw3ICs1OTUsNyBAQCBzdGF0aWMg
dm9pZCBwY2lfZW5hYmxlX2FjcyhzdHJ1Y3QgcGNpX2RldiAqcGRldikKICAgICB1MTYgY2FwLCBj
dHJsLCBzZWcgPSBwZGV2LT5zZWc7CiAgICAgdTggYnVzID0gcGRldi0+YnVzOwogCi0gICAgaWYg
KCAhaW9tbXVfZW5hYmxlZCApCisgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChwZGV2LT5kb21h
aW4pICkKICAgICAgICAgcmV0dXJuOwogCiAgICAgcG9zID0gcGNpX2ZpbmRfZXh0X2NhcGFiaWxp
dHkoc2VnLCBidXMsIHBkZXYtPmRldmZuLCBQQ0lfRVhUX0NBUF9JRF9BQ1MpOwpAQCAtODY0LDcg
Kzg2NCw3IEBAIHN0YXRpYyBpbnQgcGNpX2NsZWFuX2RwY2lfaXJxcyhzdHJ1Y3QgZG9tYWluICpk
KQogewogICAgIHN0cnVjdCBodm1faXJxX2RwY2kgKmh2bV9pcnFfZHBjaSA9IE5VTEw7CiAKLSAg
ICBpZiAoICFpb21tdV9lbmFibGVkICkKKyAgICBpZiAoICFpc19pb21tdV9lbmFibGVkKGQpICkK
ICAgICAgICAgcmV0dXJuIDA7CiAKICAgICBpZiAoICFpc19odm1fZG9tYWluKGQpICkKQEAgLTg5
Nyw3ICs4OTcsNyBAQCBzdGF0aWMgaW50IGRlYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpk
LCB1aW50MTZfdCBzZWcsIHVpbnQ4X3QgYnVzLAogICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Owog
ICAgIGludCByZXQgPSAwOwogCi0gICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRm
b3JtX29wcyApCisgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChkKSApCiAgICAgICAgIHJldHVy
biAtRUlOVkFMOwogCiAgICAgQVNTRVJUKHBjaWRldnNfbG9ja2VkKCkpOwpAQCAtMTM4Myw3ICsx
MzgzLDcgQEAgc3RhdGljIGludCBpb21tdV9hZGRfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQogICAgIEFTU0VSVChwY2lkZXZzX2xvY2tlZCgpKTsKIAogICAgIGhkID0gZG9tX2lvbW11KHBk
ZXYtPmRvbWFpbik7Ci0gICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29w
cyApCisgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChwZGV2LT5kb21haW4pICkKICAgICAgICAg
cmV0dXJuIDA7CiAKICAgICByYyA9IGhkLT5wbGF0Zm9ybV9vcHMtPmFkZF9kZXZpY2UocGRldi0+
ZGV2Zm4sIHBjaV90b19kZXYocGRldikpOwpAQCAtMTQxMiw3ICsxNDEyLDcgQEAgc3RhdGljIGlu
dCBpb21tdV9lbmFibGVfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQogICAgIEFTU0VSVChw
Y2lkZXZzX2xvY2tlZCgpKTsKIAogICAgIGhkID0gZG9tX2lvbW11KHBkZXYtPmRvbWFpbik7Ci0g
ICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29wcyB8fAorICAgIGlmICgg
IWlzX2lvbW11X2VuYWJsZWQocGRldi0+ZG9tYWluKSB8fAogICAgICAgICAgIWhkLT5wbGF0Zm9y
bV9vcHMtPmVuYWJsZV9kZXZpY2UgKQogICAgICAgICByZXR1cm4gMDsKIApAQCAtMTQyOCw3ICsx
NDI4LDcgQEAgc3RhdGljIGludCBpb21tdV9yZW1vdmVfZGV2aWNlKHN0cnVjdCBwY2lfZGV2ICpw
ZGV2KQogICAgICAgICByZXR1cm4gLUVJTlZBTDsKIAogICAgIGhkID0gZG9tX2lvbW11KHBkZXYt
PmRvbWFpbik7Ci0gICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29wcyAp
CisgICAgaWYgKCAhaXNfaW9tbXVfZW5hYmxlZChwZGV2LT5kb21haW4pICkKICAgICAgICAgcmV0
dXJuIDA7CiAKICAgICBmb3IgKCBkZXZmbiA9IHBkZXYtPmRldmZuIDsgcGRldi0+cGhhbnRvbV9z
dHJpZGU7ICkKQEAgLTE0NzEsNyArMTQ3MSw3IEBAIHN0YXRpYyBpbnQgYXNzaWduX2RldmljZShz
dHJ1Y3QgZG9tYWluICpkLCB1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLCB1MzIgZmxhZykKICAg
ICBzdHJ1Y3QgcGNpX2RldiAqcGRldjsKICAgICBpbnQgcmMgPSAwOwogCi0gICAgaWYgKCAhaW9t
bXVfZW5hYmxlZCB8fCAhaGQtPnBsYXRmb3JtX29wcyApCisgICAgaWYgKCAhaXNfaW9tbXVfZW5h
YmxlZChkKSApCiAgICAgICAgIHJldHVybiAwOwogCiAgICAgLyogUHJldmVudCBkZXZpY2UgYXNz
aWduIGlmIG1lbSBwYWdpbmcgb3IgbWVtIHNoYXJpbmcgaGF2ZSBiZWVuIApAQCAtMTUzNyw3ICsx
NTM3LDcgQEAgc3RhdGljIGludCBpb21tdV9nZXRfZGV2aWNlX2dyb3VwKAogICAgIGludCBpID0g
MDsKICAgICBjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHMgPSBoZC0+cGxhdGZvcm1fb3BzOwog
Ci0gICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAhb3BzIHx8ICFvcHMtPmdldF9kZXZpY2VfZ3Jv
dXBfaWQgKQorICAgIGlmICggIWlzX2lvbW11X2VuYWJsZWQoZCkgfHwgIW9wcy0+Z2V0X2Rldmlj
ZV9ncm91cF9pZCApCiAgICAgICAgIHJldHVybiAwOwogCiAgICAgZ3JvdXBfaWQgPSBvcHMtPmdl
dF9kZXZpY2VfZ3JvdXBfaWQoc2VnLCBidXMsIGRldmZuKTsKZGlmZiAtLWdpdCBhL3hlbi9kcml2
ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRk
L2lvbW11LmMKaW5kZXggNWQ3MjI3MGM1Yi4uMDFmMGJjNDY4OSAxMDA2NDQKLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmMKQEAgLTE3NTcsNyArMTc1Nyw3IEBAIHN0YXRpYyB2b2lkIGlvbW11X2Rv
bWFpbl90ZWFyZG93bihzdHJ1Y3QgZG9tYWluICpkKQogICAgICAgICB4ZnJlZShtcm1ycik7CiAg
ICAgfQogCi0gICAgQVNTRVJUKGlvbW11X2VuYWJsZWQpOworICAgIEFTU0VSVChpc19pb21tdV9l
bmFibGVkKGQpKTsKIAogICAgIC8qCiAgICAgICogV2UgY2FuJ3QgdXNlIGlvbW11X3VzZV9oYXBf
cHQgaGVyZSBiZWNhdXNlIGVpdGhlciBJT01NVSBzdGF0ZQpkaWZmIC0tZ2l0IGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvdnRkL3g4Ni9odm0uYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0
ZC94ODYvaHZtLmMKaW5kZXggNjY3NWRjYTAyNy4uZjc3YjM1ODE1YyAxMDA2NDQKLS0tIGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3g4Ni9odm0uYworKysgYi94ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC92dGQveDg2L2h2bS5jCkBAIC01MSw3ICs1MSw3IEBAIHZvaWQgaHZtX2RwY2lfaXNh
aXJxX2VvaShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaXNhaXJxKQogICAgIHN0cnVj
dCBodm1faXJxX2RwY2kgKmRwY2kgPSBOVUxMOwogCiAgICAgQVNTRVJUKGlzYWlycSA8IE5SX0lT
QUlSUVMpOwotICAgIGlmICggIWlvbW11X2VuYWJsZWQgKQorICAgIGlmICggIWlzX2lvbW11X2Vu
YWJsZWQoZCkgKQogICAgICAgICByZXR1cm47CiAKICAgICBzcGluX2xvY2soJmQtPmV2ZW50X2xv
Y2spOwpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gveDg2L2lvbW11LmMgYi94
ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYwppbmRleCBmZDA1MDc1YmI1Li45ODc5
NTU4YzE3IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYwor
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYwpAQCAtMTc4LDcgKzE3OCw3
IEBAIGludCBhcmNoX2lvbW11X3BvcHVsYXRlX3BhZ2VfdGFibGUoc3RydWN0IGRvbWFpbiAqZCkK
IAogdm9pZCBfX2h3ZG9tX2luaXQgYXJjaF9pb21tdV9jaGVja19hdXRvdHJhbnNsYXRlZF9od2Rv
bShzdHJ1Y3QgZG9tYWluICpkKQogewotICAgIGlmICggIWlvbW11X2VuYWJsZWQgKQorICAgIGlm
ICggIWlzX2lvbW11X2VuYWJsZWQoZCkgKQogICAgICAgICBwYW5pYygiUHJlc2VudGx5LCBpb21t
dSBtdXN0IGJlIGVuYWJsZWQgZm9yIFBWSCBoYXJkd2FyZSBkb21haW5cbiIpOwogfQogCmRpZmYg
LS1naXQgYS94ZW4veHNtL2ZsYXNrL2hvb2tzLmMgYi94ZW4veHNtL2ZsYXNrL2hvb2tzLmMKaW5k
ZXggNzkxYzFmNjZhZi4uNWEwZjJlNzIzZSAxMDA2NDQKLS0tIGEveGVuL3hzbS9mbGFzay9ob29r
cy5jCisrKyBiL3hlbi94c20vZmxhc2svaG9va3MuYwpAQCAtODg2LDcgKzg4Niw3IEBAIHN0YXRp
YyBpbnQgZmxhc2tfbWFwX2RvbWFpbl9tc2kgKHN0cnVjdCBkb21haW4gKmQsIGludCBpcnEsIGNv
bnN0IHZvaWQgKmRhdGEsCiAjZW5kaWYKIH0KIAotc3RhdGljIHUzMiBmbGFza19pb21tdV9yZXNv
dXJjZV91c2VfcGVybSh2b2lkKQorc3RhdGljIHUzMiBmbGFza19pb21tdV9yZXNvdXJjZV91c2Vf
cGVybShzdHJ1Y3QgZG9tYWluICpkKQogewogICAgIC8qIE9idGFpbiB0aGUgcGVybWlzc2lvbiBs
ZXZlbCByZXF1aXJlZCBmb3IgYWxsb3dpbmcgYSBkb21haW4KICAgICAgKiB0byB1c2UgYW4gYXNz
aWduZWQgZGV2aWNlLgpAQCAtODk5LDcgKzg5OSw3IEBAIHN0YXRpYyB1MzIgZmxhc2tfaW9tbXVf
cmVzb3VyY2VfdXNlX3Blcm0odm9pZCkKICAgICAgKi8KICAgICB1MzIgcGVybSA9IFJFU09VUkNF
X19VU0VfTk9JT01NVTsKIAotICAgIGlmIChpb21tdV9lbmFibGVkKQorICAgIGlmICggaXNfaW9t
bXVfZW5hYmxlZChkKSApCiAgICAgICAgIHBlcm0gPSAoIGlvbW11X2ludHJlbWFwID8gUkVTT1VS
Q0VfX1VTRV9JT01NVSA6CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUkVTT1VS
Q0VfX1VTRV9JT01NVV9OT0lOVFJFTUFQICk7CiAgICAgcmV0dXJuIHBlcm07CkBAIC05MTAsNyAr
OTEwLDcgQEAgc3RhdGljIGludCBmbGFza19tYXBfZG9tYWluX2lycSAoc3RydWN0IGRvbWFpbiAq
ZCwgaW50IGlycSwgY29uc3Qgdm9pZCAqZGF0YSkKICAgICB1MzIgc2lkLCBkc2lkOwogICAgIGlu
dCByYyA9IC1FUEVSTTsKICAgICBzdHJ1Y3QgYXZjX2F1ZGl0X2RhdGEgYWQ7Ci0gICAgdTMyIGRw
ZXJtID0gZmxhc2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Blcm0oKTsKKyAgICB1MzIgZHBlcm0gPSBm
bGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVybShkKTsKIAogICAgIGlmICggaXJxID49IG5yX3N0
YXRpY19pcnFzICYmIGRhdGEgKSB7CiAgICAgICAgIHJjID0gZmxhc2tfbWFwX2RvbWFpbl9tc2ko
ZCwgaXJxLCBkYXRhLCAmc2lkLCAmYWQpOwpAQCAtOTc2LDcgKzk3Niw3IEBAIHN0YXRpYyBpbnQg
Zmxhc2tfYmluZF9wdF9pcnEgKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCB4ZW5fZG9tY3RsX2Jp
bmRfcHRfaXJxICpiCiAgICAgaW50IHJjID0gLUVQRVJNOwogICAgIGludCBpcnE7CiAgICAgc3Ry
dWN0IGF2Y19hdWRpdF9kYXRhIGFkOwotICAgIHUzMiBkcGVybSA9IGZsYXNrX2lvbW11X3Jlc291
cmNlX3VzZV9wZXJtKCk7CisgICAgdTMyIGRwZXJtID0gZmxhc2tfaW9tbXVfcmVzb3VyY2VfdXNl
X3Blcm0oZCk7CiAKICAgICByYyA9IGN1cnJlbnRfaGFzX3Blcm0oZCwgU0VDQ0xBU1NfUkVTT1VS
Q0UsIFJFU09VUkNFX19BREQpOwogICAgIGlmICggcmMgKQpAQCAtMTA0OSw3ICsxMDQ5LDcgQEAg
c3RhdGljIGludCBmbGFza19pb21lbV9wZXJtaXNzaW9uKHN0cnVjdCBkb21haW4gKmQsIHVpbnQ2
NF90IHN0YXJ0LCB1aW50NjRfdCBlbmQKIAogICAgIGRhdGEuc3NpZCA9IGRvbWFpbl9zaWQoY3Vy
cmVudC0+ZG9tYWluKTsKICAgICBkYXRhLmRzaWQgPSBkb21haW5fc2lkKGQpOwotICAgIGRhdGEu
dXNlX3Blcm0gPSBmbGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVybSgpOworICAgIGRhdGEudXNl
X3Blcm0gPSBmbGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVybShkKTsKIAogICAgIHJldHVybiBz
ZWN1cml0eV9pdGVyYXRlX2lvbWVtX3NpZHMoc3RhcnQsIGVuZCwgX2lvbWVtX2hhc19wZXJtLCAm
ZGF0YSk7CiB9CkBAIC0xMDc0LDcgKzEwNzQsNyBAQCBzdGF0aWMgaW50IGZsYXNrX3BjaV9jb25m
aWdfcGVybWlzc2lvbihzdHJ1Y3QgZG9tYWluICpkLCB1aW50MzJfdCBtYWNoaW5lX2JkZiwgdQog
ICAgIGlmICggYWNjZXNzICYmIChlbmQgPj0gMHgxMCAmJiBzdGFydCA8IDB4MjgpICkKICAgICAg
ICAgcGVybSA9IFJFU09VUkNFX19TRVRVUDsKICAgICBlbHNlCi0gICAgICAgIHBlcm0gPSBmbGFz
a19pb21tdV9yZXNvdXJjZV91c2VfcGVybSgpOworICAgICAgICBwZXJtID0gZmxhc2tfaW9tbXVf
cmVzb3VyY2VfdXNlX3Blcm0oZCk7CiAKICAgICBBVkNfQVVESVRfREFUQV9JTklUKCZhZCwgREVW
KTsKICAgICBhZC5kZXZpY2UgPSAodW5zaWduZWQgbG9uZykgbWFjaGluZV9iZGY7CkBAIC0xMjk5
LDcgKzEyOTksNyBAQCBzdGF0aWMgaW50IGZsYXNrX2Fzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFp
biAqZCwgdWludDMyX3QgbWFjaGluZV9iZGYpCiAgICAgdTMyIGRzaWQsIHJzaWQ7CiAgICAgaW50
IHJjID0gLUVQRVJNOwogICAgIHN0cnVjdCBhdmNfYXVkaXRfZGF0YSBhZDsKLSAgICB1MzIgZHBl
cm0gPSBmbGFza19pb21tdV9yZXNvdXJjZV91c2VfcGVybSgpOworICAgIHUzMiBkcGVybSA9IGZs
YXNrX2lvbW11X3Jlc291cmNlX3VzZV9wZXJtKGQpOwogCiAgICAgaWYgKCAhZCApCiAgICAgICAg
IHJldHVybiBmbGFza190ZXN0X2Fzc2lnbl9kZXZpY2UobWFjaGluZV9iZGYpOwpAQCAtMTM1OCw3
ICsxMzU4LDcgQEAgc3RhdGljIGludCBmbGFza19hc3NpZ25fZHRkZXZpY2Uoc3RydWN0IGRvbWFp
biAqZCwgY29uc3QgY2hhciAqZHRwYXRoKQogICAgIHUzMiBkc2lkLCByc2lkOwogICAgIGludCBy
YyA9IC1FUEVSTTsKICAgICBzdHJ1Y3QgYXZjX2F1ZGl0X2RhdGEgYWQ7Ci0gICAgdTMyIGRwZXJt
ID0gZmxhc2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Blcm0oKTsKKyAgICB1MzIgZHBlcm0gPSBmbGFz
a19pb21tdV9yZXNvdXJjZV91c2VfcGVybShkKTsKIAogICAgIGlmICggIWQgKQogICAgICAgICBy
ZXR1cm4gZmxhc2tfdGVzdF9hc3NpZ25fZHRkZXZpY2UoZHRwYXRoKTsKQEAgLTE1NDMsNyArMTU0
Myw3IEBAIHN0YXRpYyBpbnQgZmxhc2tfaW9wb3J0X3Blcm1pc3Npb24oc3RydWN0IGRvbWFpbiAq
ZCwgdWludDMyX3Qgc3RhcnQsIHVpbnQzMl90IGVuCiAKICAgICBkYXRhLnNzaWQgPSBkb21haW5f
c2lkKGN1cnJlbnQtPmRvbWFpbik7CiAgICAgZGF0YS5kc2lkID0gZG9tYWluX3NpZChkKTsKLSAg
ICBkYXRhLnVzZV9wZXJtID0gZmxhc2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Blcm0oKTsKKyAgICBk
YXRhLnVzZV9wZXJtID0gZmxhc2tfaW9tbXVfcmVzb3VyY2VfdXNlX3Blcm0oZCk7CiAKICAgICBy
ZXR1cm4gc2VjdXJpdHlfaXRlcmF0ZV9pb3BvcnRfc2lkcyhzdGFydCwgZW5kLCBfaW9wb3J0X2hh
c19wZXJtLCAmZGF0YSk7CiB9Ci0tIAoyLjIwLjEuMi5nYjIxZWJiNjcxCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
