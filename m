Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF507A9FA
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:46:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSQW-00057E-OI; Tue, 30 Jul 2019 13:44:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3sDM=V3=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hsSQU-00056a-Je
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:44:26 +0000
X-Inumbo-ID: 2510b1f2-b2d0-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2510b1f2-b2d0-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 13:44:25 +0000 (UTC)
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
IronPort-SDR: lOhpXlgMWhK5RSGMPD2l/LQjTw4WQIvJB4BoAQPVfNU9ixmzW+0Cyibapn0u2ngieWcLyvW3hh
 seAIS5Ds+L5JhJpOEUQw6Su62ObCnT1esqsciV8LPgjMza0jdMA63mw8XLdmNoERH7x+PNHajM
 4RRJ/2wJT2mvBApsHxpFEWAbl4Aw6Jwp/dYuI3crNieM7l9wilbt5ajzXDdBvrhWeBheby7NBN
 gTCjw9bz0qTz6Ghl4K8jlVY5ghj54XysbkoLuxbGIA+C5hH7MeRKMc21AtqIL1FAjIV+zfrj/V
 1Zc=
X-SBRS: 2.7
X-MesageID: 3760803
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3760803"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Tue, 30 Jul 2019 14:44:18 +0100
Message-ID: <20190730134419.2739-6-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.20.1.2.gb21ebb671
In-Reply-To: <20190730134419.2739-1-paul.durrant@citrix.com>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/6] iommu: tidy up iommu_us_hap_pt() and
 need_iommu_pt_sync() macros
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim
 Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlcyBtYWNyb3MgcmVhbGx5IG91Z2h0IHRvIGxpdmUgaW4gdGhlIGNvbW1vbiB4ZW4vaW9tbXUu
aCBoZWFkZXIgcmF0aGVyCnRoZW4gYmVpbmcgZGlzdHJpYnV0ZWQgYW1vbmdzdCBhcmNoaXRlY3R1
cmUgc3BlY2lmaWMgaW9tbXUgaGVhZGVycyBhbmQKeGVuL3NjaGVkLmguIFRoaXMgcGF0Y2ggbW92
ZXMgdGhlbSB0aGVyZS4KCk5PVEU6IERpc2FibGluZyAnc2hhcmVwdCcgaW4gdGhlIGNvbW1hbmQg
bGluZSBpb21tdSBvcHRpb25zIHNob3VsZCByZWFsbHkKICAgICAgYmUgaGFyZCBlcnJvciBvbiBB
Uk0gKGFzIG9wcG9zZWQgdG8ganVzdCBiZWluZyBpZ25vcmVkKSwgc28gYXZvaWQKICAgICAgcGFy
c2luZyB0aGF0IG9wdGlvbiBpZiBDT05GSUdfQVJNIGlzIHNldC4KClNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgpDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KQ2M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4K
Q2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgpDYzogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4KQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KQ2M6IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgpDYzogV2VpIExpdSA8d2xA
eGVuLm9yZz4KQ2M6IFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNv
bT4KQ2M6ICJSb2dlciBQYXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+Ci0tLQogeGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYyB8IDIgKysKIHhlbi9pbmNsdWRlL2FzbS1hcm0v
aW9tbXUuaCAgICAgfCAzIC0tLQogeGVuL2luY2x1ZGUvYXNtLXg4Ni9pb21tdS5oICAgICB8IDQg
LS0tLQogeGVuL2luY2x1ZGUveGVuL2lvbW11LmggICAgICAgICB8IDcgKysrKysrKwogeGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmggICAgICAgICB8IDYgLS0tLS0tCiA1IGZpbGVzIGNoYW5nZWQsIDkg
aW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKaW5k
ZXggMzA5NzZiNDQwNi4uNjc4NTVlZWVkNSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCkBAIC0x
MDIsOCArMTAyLDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNlX2lvbW11X3BhcmFtKGNvbnN0
IGNoYXIgKnMpCiAgICAgICAgICAgICBpb21tdV9od2RvbV9wYXNzdGhyb3VnaCA9IHZhbDsKICAg
ICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJkb20wLXN0cmljdCIsIHMsIHNz
KSkgPj0gMCApCiAgICAgICAgICAgICBpb21tdV9od2RvbV9zdHJpY3QgPSB2YWw7CisjaWZuZGVm
IENPTkZJR19BUk0KICAgICAgICAgZWxzZSBpZiAoICh2YWwgPSBwYXJzZV9ib29sZWFuKCJzaGFy
ZXB0Iiwgcywgc3MpKSA+PSAwICkKICAgICAgICAgICAgIGlvbW11X2hhcF9wdF9zaGFyZSA9IHZh
bDsKKyNlbmRpZgogICAgICAgICBlbHNlCiAgICAgICAgICAgICByYyA9IC1FSU5WQUw7CiAKZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL2FzbS1h
cm0vaW9tbXUuaAppbmRleCBlNTA1MDYzNmQ3Li43N2E5NGIyOWViIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS9hc20tYXJtL2lvbW11LmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLWFybS9pb21tdS5o
CkBAIC0yMCw5ICsyMCw2IEBAIHN0cnVjdCBhcmNoX2lvbW11CiAgICAgdm9pZCAqcHJpdjsKIH07
CiAKLS8qIEFsd2F5cyBzaGFyZSBQMk0gVGFibGUgYmV0d2VlbiB0aGUgQ1BVIGFuZCB0aGUgSU9N
TVUgKi8KLSNkZWZpbmUgaW9tbXVfdXNlX2hhcF9wdChkKSAoaXNfaW9tbXVfZW5hYmxlZChkKSkK
LQogY29uc3Qgc3RydWN0IGlvbW11X29wcyAqaW9tbXVfZ2V0X29wcyh2b2lkKTsKIHZvaWQgaW9t
bXVfc2V0X29wcyhjb25zdCBzdHJ1Y3QgaW9tbXVfb3BzICpvcHMpOwogCmRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11LmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2lvbW11LmgK
aW5kZXggNmQwMjRkNWMwZS4uMjVkMmFlZTlhOSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9pb21tdS5oCisrKyBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaW9tbXUuaApAQCAtNzksMTAg
Kzc5LDYgQEAgc3RydWN0IGlvbW11X2luaXRfb3BzIHsKIAogZXh0ZXJuIGNvbnN0IHN0cnVjdCBp
b21tdV9pbml0X29wcyAqaW9tbXVfaW5pdF9vcHM7CiAKLS8qIEFyZSB3ZSB1c2luZyB0aGUgZG9t
YWluIFAyTSB0YWJsZSBhcyBpdHMgSU9NTVUgcGFnZXRhYmxlPyAqLwotI2RlZmluZSBpb21tdV91
c2VfaGFwX3B0KGQpIFwKLSAgICAoaGFwX2VuYWJsZWQoZCkgJiYgaXNfaW9tbXVfZW5hYmxlZChk
KSAmJiBpb21tdV9oYXBfcHRfc2hhcmUpCi0KIHZvaWQgaW9tbXVfdXBkYXRlX2lyZV9mcm9tX2Fw
aWModW5zaWduZWQgaW50IGFwaWMsIHVuc2lnbmVkIGludCByZWcsIHVuc2lnbmVkIGludCB2YWx1
ZSk7CiB1bnNpZ25lZCBpbnQgaW9tbXVfcmVhZF9hcGljX2Zyb21faXJlKHVuc2lnbmVkIGludCBh
cGljLCB1bnNpZ25lZCBpbnQgcmVnKTsKIGludCBpb21tdV9zZXR1cF9ocGV0X21zaShzdHJ1Y3Qg
bXNpX2Rlc2MgKik7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCBiL3hlbi9p
bmNsdWRlL3hlbi9pb21tdS5oCmluZGV4IDRiNjg3MTkzNmMuLjQ1ZWM2Y2ZlNDQgMTAwNjQ0Ci0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5o
CkBAIC0yNjgsNiArMjY4LDEzIEBAIHN0cnVjdCBkb21haW5faW9tbXUgewogI2RlZmluZSBpb21t
dV9zZXRfZmVhdHVyZShkLCBmKSAgIHNldF9iaXQoZiwgZG9tX2lvbW11KGQpLT5mZWF0dXJlcykK
ICNkZWZpbmUgaW9tbXVfY2xlYXJfZmVhdHVyZShkLCBmKSBjbGVhcl9iaXQoZiwgZG9tX2lvbW11
KGQpLT5mZWF0dXJlcykKIAorLyogQXJlIHdlIHVzaW5nIHRoZSBkb21haW4gUDJNIHRhYmxlIGFz
IGl0cyBJT01NVSBwYWdldGFibGU/ICovCisjZGVmaW5lIGlvbW11X3VzZV9oYXBfcHQoZCkgXAor
ICAgIChoYXBfZW5hYmxlZChkKSAmJiBpc19pb21tdV9lbmFibGVkKGQpICYmIGlvbW11X2hhcF9w
dF9zaGFyZSkKKworLyogRG9lcyB0aGUgSU9NTVUgcGFnZXRhYmxlIG5lZWQgdG8gYmUga2VwdCBz
eW5jaHJvbml6ZWQgd2l0aCB0aGUgUDJNICovCisjZGVmaW5lIG5lZWRfaW9tbXVfcHRfc3luYyhk
KSAgICAgKGRvbV9pb21tdShkKS0+bmVlZF9zeW5jKQorCiBpbnQgX19tdXN0X2NoZWNrIGlvbW11
X3N1c3BlbmQodm9pZCk7CiB2b2lkIGlvbW11X3Jlc3VtZSh2b2lkKTsKIHZvaWQgaW9tbXVfY3Jh
c2hfc2h1dGRvd24odm9pZCk7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBi
L3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IDUzOGJlNzEyMGIuLjY1NjhmMmI4NWIgMTAw
NjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oCkBAIC05NjMsMTIgKzk2Myw2IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19od2RvbV9w
aW5uZWRfdmNwdShjb25zdCBzdHJ1Y3QgdmNwdSAqdikKICAgICAgICAgICAgIGNwdW1hc2tfd2Vp
Z2h0KHYtPmNwdV9oYXJkX2FmZmluaXR5KSA9PSAxKTsKIH0KIAotI2lmZGVmIENPTkZJR19IQVNf
UEFTU1RIUk9VR0gKLSNkZWZpbmUgbmVlZF9pb21tdV9wdF9zeW5jKGQpIChkb21faW9tbXUoZCkt
Pm5lZWRfc3luYykKLSNlbHNlCi0jZGVmaW5lIG5lZWRfaW9tbXVfcHRfc3luYyhkKSBmYWxzZQot
I2VuZGlmCi0KIHN0YXRpYyBpbmxpbmUgYm9vbCBpc192Y3B1X29ubGluZShjb25zdCBzdHJ1Y3Qg
dmNwdSAqdikKIHsKICAgICByZXR1cm4gIXRlc3RfYml0KF9WUEZfZG93biwgJnYtPnBhdXNlX2Zs
YWdzKTsKLS0gCjIuMjAuMS4yLmdiMjFlYmI2NzEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
