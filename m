Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8948068908
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 14:40:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn0EJ-0003iB-DU; Mon, 15 Jul 2019 12:37:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gpPh=VM=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hn0EH-0003h1-DI
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 12:37:17 +0000
X-Inumbo-ID: 4731efe4-a6fd-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4731efe4-a6fd-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 12:37:16 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=paul.durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 paul.durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="paul.durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: t2qcsdtfxrmXX0vUb22rUGkcSLe0En//fgcrSsOnVVlUqSSRhH2a24rhaD7rMweJ61e6JMz835
 Ex/DTXsxKlvzE1N85Qw6SgMu+8zoiZ//RQ5iMGRLNeuaLopfBA+M+ejQY+S0vQN8J166exWvew
 z4mYvF0s04EkeO3Zb8coQ0aBSltGUtZncGmbLBd4aF5guiIQxKJk/Sx66chFvUQX8jIOPp4V8d
 EvvOJDjHxFRyeufKdGZTEuQH2P80SUHfdK05Ch3hEh1TQNycrPlTKthbbw03s4HSjfX7uslfG+
 3DI=
X-SBRS: 2.7
X-MesageID: 2995666
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,493,1557201600"; 
   d="scan'208";a="2995666"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Mon, 15 Jul 2019 13:37:09 +0100
Message-ID: <20190715123710.1780-4-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190715123710.1780-1-paul.durrant@citrix.com>
References: <20190715123710.1780-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v2 3/4] iommu: introduce iommu_groups
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
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29tZSBkZXZpY2VzIG1heSBzaGFyZSBhIHNpbmdsZSBQQ0llIGluaXRpYXRvciBpZCwgZS5nLiBp
ZiB0aGV5IGFyZSBhY3R1YWxseQpsZWdhY3kgUENJIGRldmljZXMgYmVoaW5kIGEgYnJpZGdlLCBh
bmQgaGVuY2UgRE1BIGZyb20gc3VjaCBkZXZpY2VzIHdpbGwKYmUgc3ViamVjdCB0byB0aGUgc2Ft
ZSBhZGRyZXNzIHRyYW5zbGF0aW9uIGluIHRoZSBJT01NVS4gSGVuY2UgdGhlc2UgZGV2aWNlcwpz
aG91bGQgYmUgdHJlYXRlZCBhcyBhIHVuaXQgZm9yIHRoZSBwdXJwb3NlcyBvZiBhc3NpZ25tZW50
LiBUaGVyZSBhcmUgYWxzbwpvdGhlciByZWFzb25zIHdoeSBtdWx0aXBsZSBkZXZpY2VzIHNob3Vs
ZCBiZSB0cmVhdGVkIGFzIGEgdW5pdCwgZS5nLiB0aG9zZQpzdWJqZWN0IHRvIGEgc2hhcmVkIFJN
UlIgb3IgdGhvc2UgZG93bnN0cmVhbSBvZiBhIGJyaWRnZSB0aGF0IGRvZXMgbm90CnN1cHBvcnQg
QUNTLgoKVGhpcyBwYXRjaCBpbnRyb2R1Y2VzIGEgbmV3IHN0cnVjdCBpb21tdV9ncm91cCB0byBh
Y3QgYXMgYSBjb250YWluZXIgZm9yCmRldmljZXMgdGhhdCBzaG91bGQgYmUgdHJlYXRlZCBhcyBh
IHVuaXQsIGFuZCBidWlsZHMgYSBsaXN0IG9mIHRoZW0gYXMKUENJIGRldmljZXMgYXJlIHNjYW5u
ZWQuIFRoZSBpb21tdV9vcHMgYWxyZWFkeSBpbXBsZW1lbnQgYSBtZXRob2QsCmdldF9kZXZpY2Vf
Z3JvdXBfaWQoKSwgdGhhdCBpcyBzZWVtaW5nbHkgaW50ZW5kZWQgdG8gcmV0dXJuIHRoZSBpbml0
aWF0b3IKaWQgZm9yIGEgZ2l2ZW4gU0JERiBzbyB1c2UgdGhpcyBhcyB0aGUgbWVjaGFuaXNtIGZv
ciBncm91cCBhc3NpZ25tZW50IGluCnRoZSBmaXJzdCBpbnN0YW5jZS4gQXNzaWdubWVudCBiYXNl
ZCBvbiBzaGFyZWQgUk1SUiBvciBsYWNrIG9mIEFDUyB3aWxsIGJlCmRlYWx0IHdpdGggaW4gc3Vi
c2VxdWVudCBwYXRjaGVzLCBhcyB3aWxsIG1vZGlmaWNhdGlvbnMgdG8gdGhlIGRldmljZQphc3Np
Z25tZW50IGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBj
aXRyaXguY29tPgotLS0KQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KQ2M6IEFu
ZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CkNjOiBHZW9yZ2UgRHVubGFw
IDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+CkNjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4KQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
CkNjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+CkNjOiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CkNjOiBUaW0gRGVlZ2Fu
IDx0aW1AeGVuLm9yZz4KQ2M6IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cgp2MjoKIC0gTW92ZSBjb2Rl
IGludG8gbmV3IGRyaXZlcnMvcGFzc3Rocm91Z2gvZ3JvdXBzLmMKIC0gRHJvcCB0aGUgZ3JvdXAg
aW5kZXguCiAtIEhhbmRsZSBmYWlsdXJlIHRvIGdldCBncm91cCBpZC4KIC0gRHJvcCB0aGUgZ3Jv
dXAgZGV2cyBsaXN0LgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlICAgIHwg
IDEgKwogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvZ3JvdXBzLmMgICAgfCA5MSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYv
aW9tbXUuYyB8ICA4ICsrKy0KIHhlbi9pbmNsdWRlL3hlbi9pb21tdS5oICAgICAgICAgICAgIHwg
IDcgKysrCiB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICAgICAgICB8ICAyICsKIDUgZmls
ZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9ncm91cHMuYwoKZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL01ha2VmaWxlIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
TWFrZWZpbGUKaW5kZXggZDUwYWIxODhjOC4uOGE3NzExMDE3OSAxMDA2NDQKLS0tIGEveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvTWFrZWZpbGUKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gv
TWFrZWZpbGUKQEAgLTQsNiArNCw3IEBAIHN1YmRpci0kKENPTkZJR19YODYpICs9IHg4Ngogc3Vi
ZGlyLSQoQ09ORklHX0FSTSkgKz0gYXJtCiAKIG9iai15ICs9IGlvbW11Lm8KK29iai0kKENPTkZJ
R19IQVNfUENJKSArPSBncm91cHMubwogb2JqLSQoQ09ORklHX0hBU19QQ0kpICs9IHBjaS5vCiBv
YmotJChDT05GSUdfSEFTX0RFVklDRV9UUkVFKSArPSBkZXZpY2VfdHJlZS5vCiAKZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vwcy5jIGIveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvZ3JvdXBzLmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMWEy
ZjQ2MWM4NwotLS0gL2Rldi9udWxsCisrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2dyb3Vw
cy5jCkBAIC0wLDAgKzEsOTEgQEAKKy8qCisgKiBDb3B5cmlnaHQgKGMpIDIwMTkgQ2l0cml4IFN5
c3RlbXMgSW5jLgorICoKKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2Fu
IHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CisgKiBpdCB1bmRlciB0aGUgdGVybXMgb2Yg
dGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hlZCBieQorICogdGhlIEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBvZiB0aGUgTGljZW5zZSwg
b3IKKyAqIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uCisgKgorICogVGhpcyBw
cm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWws
CisgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3
YXJyYW50eSBvZgorICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxB
UiBQVVJQT1NFLiAgU2VlIHRoZQorICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1v
cmUgZGV0YWlscy4KKyAqLworCisjaW5jbHVkZSA8eGVuL2lvbW11Lmg+CisjaW5jbHVkZSA8eGVu
L3JhZGl4LXRyZWUuaD4KKworc3RydWN0IGlvbW11X2dyb3VwIHsKKyAgICB1bnNpZ25lZCBpbnQg
aWQ7Cit9OworCitzdGF0aWMgc3RydWN0IHJhZGl4X3RyZWVfcm9vdCBpb21tdV9ncm91cHM7CisK
K3ZvaWQgX19pbml0IGlvbW11X2dyb3Vwc19pbml0KHZvaWQpCit7CisgICAgcmFkaXhfdHJlZV9p
bml0KCZpb21tdV9ncm91cHMpOworfQorCitzdGF0aWMgc3RydWN0IGlvbW11X2dyb3VwICphbGxv
Y19pb21tdV9ncm91cCh1bnNpZ25lZCBpbnQgaWQpCit7CisgICAgc3RydWN0IGlvbW11X2dyb3Vw
ICpncnAgPSB4emFsbG9jKHN0cnVjdCBpb21tdV9ncm91cCk7CisKKyAgICBpZiAoICFncnAgKQor
ICAgICAgICByZXR1cm4gTlVMTDsKKworICAgIGdycC0+aWQgPSBpZDsKKworICAgIGlmICggcmFk
aXhfdHJlZV9pbnNlcnQoJmlvbW11X2dyb3VwcywgaWQsIGdycCkgKQorICAgIHsKKyAgICAgICAg
eGZyZWUoZ3JwKTsKKyAgICAgICAgZ3JwID0gTlVMTDsKKyAgICB9CisKKyAgICByZXR1cm4gZ3Jw
OworfQorCitzdGF0aWMgc3RydWN0IGlvbW11X2dyb3VwICpnZXRfaW9tbXVfZ3JvdXAodW5zaWdu
ZWQgaW50IGlkKQoreworICAgIHN0cnVjdCBpb21tdV9ncm91cCAqZ3JwID0gcmFkaXhfdHJlZV9s
b29rdXAoJmlvbW11X2dyb3VwcywgaWQpOworCisgICAgaWYgKCAhZ3JwICkKKyAgICAgICAgZ3Jw
ID0gYWxsb2NfaW9tbXVfZ3JvdXAoaWQpOworCisgICAgcmV0dXJuIGdycDsKK30KKworaW50IGlv
bW11X2dyb3VwX2Fzc2lnbihzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdm9pZCAqYXJnKQoreworICAg
IGNvbnN0IHN0cnVjdCBpb21tdV9vcHMgKm9wcyA9IGlvbW11X2dldF9vcHMoKTsKKyAgICB1bnNp
Z25lZCBpbnQgaWQ7CisgICAgc3RydWN0IGlvbW11X2dyb3VwICpncnA7CisKKyAgICBpZiAoICFv
cHMtPmdldF9kZXZpY2VfZ3JvdXBfaWQgKQorICAgICAgICByZXR1cm4gMDsKKworICAgIGlkID0g
b3BzLT5nZXRfZGV2aWNlX2dyb3VwX2lkKHBkZXYtPnNlZywgcGRldi0+YnVzLCBwZGV2LT5kZXZm
bik7CisgICAgaWYgKCBpZCA8IDAgKQorICAgICAgICByZXR1cm4gLUVOT0RBVEE7CisKKyAgICBn
cnAgPSBnZXRfaW9tbXVfZ3JvdXAoaWQpOworICAgIGlmICggIWdycCApCisgICAgICAgIHJldHVy
biAtRU5PTUVNOworCisgICAgaWYgKCBpb21tdV92ZXJib3NlICkKKyAgICAgICAgcHJpbnRrKFhF
TkxPR19JTkZPICJBc3NpZ24gJTA0eDolMDJ4OiUwMnguJXUgLT4gSU9NTVUgZ3JvdXAgJXhcbiIs
CisgICAgICAgICAgICAgICBwZGV2LT5zZWcsIHBkZXYtPmJ1cywgUENJX1NMT1QocGRldi0+ZGV2
Zm4pLAorICAgICAgICAgICAgICAgUENJX0ZVTkMocGRldi0+ZGV2Zm4pLCBncnAtPmlkKTsKKwor
ICAgIHBkZXYtPmdycCA9IGdycDsKKworICAgIHJldHVybiAwOworfQorCisvKgorICogTG9jYWwg
dmFyaWFibGVzOgorICogbW9kZTogQworICogYy1maWxlLXN0eWxlOiAiQlNEIgorICogYy1iYXNp
Yy1vZmZzZXQ6IDQKKyAqIGluZGVudC10YWJzLW1vZGU6IG5pbAorICogRW5kOgorICovCmRpZmYg
LS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC94ODYvaW9tbXUuYyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jCmluZGV4IGE3NDM4YzljMjUuLjkwZmM3NTA0NTYgMTAw
NjQ0Ci0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jCisrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3g4Ni9pb21tdS5jCkBAIC00Myw3ICs0MywxMyBAQCBpbnQgX19p
bml0IGlvbW11X2hhcmR3YXJlX3NldHVwKHZvaWQpCiAgICAgICAgIC8qIHgyYXBpYyBzZXR1cCBt
YXkgaGF2ZSBwcmV2aW91c2x5IGluaXRpYWxpc2VkIHRoZSBzdHJ1Y3QuICovCiAgICAgICAgIEFT
U0VSVChpb21tdV9vcHMuaW5pdCA9PSBpb21tdV9pbml0X29wcy0+b3BzLT5pbml0KTsKIAotICAg
IHJldHVybiBpb21tdV9pbml0X29wcy0+c2V0dXAoKTsKKyAgICByYyA9IGlvbW11X2luaXRfb3Bz
LT5zZXR1cCgpOworICAgIGlmICggcmMgKQorICAgICAgICByZXR1cm4gcmM7CisKKyAgICBpb21t
dV9ncm91cHNfaW5pdCgpOworCisgICAgcmV0dXJuIHBjaV9wZGV2c19pdGVyYXRlKGlvbW11X2dy
b3VwX2Fzc2lnbiwgTlVMTCk7CiB9CiAKIGludCBpb21tdV9lbmFibGVfeDJhcGljKHZvaWQpCmRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL3hlbi9pb21t
dS5oCmluZGV4IDQ4Zjg3NDgwYTcuLmM5M2Y1ODBmZGMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRl
L3hlbi9pb21tdS5oCisrKyBiL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oCkBAIC0zMTcsNiArMzE3
LDEzIEBAIERFQ0xBUkVfUEVSX0NQVShib29sX3QsIGlvbW11X2RvbnRfZmx1c2hfaW90bGIpOwog
ZXh0ZXJuIHN0cnVjdCBzcGlubG9jayBpb21tdV9wdF9jbGVhbnVwX2xvY2s7CiBleHRlcm4gc3Ry
dWN0IHBhZ2VfbGlzdF9oZWFkIGlvbW11X3B0X2NsZWFudXBfbGlzdDsKIAorI2lmZGVmIENPTkZJ
R19IQVNfUENJCisKK3ZvaWQgaW9tbXVfZ3JvdXBzX2luaXQodm9pZCk7CitpbnQgaW9tbXVfZ3Jv
dXBfYXNzaWduKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB2b2lkICphcmcpOworCisjZW5kaWYgLyog
Q09ORklHX0hBU19QQ0kgKi8KKwogI2VuZGlmIC8qIF9JT01NVV9IXyAqLwogCiAvKgpkaWZmIC0t
Z2l0IGEveGVuL2luY2x1ZGUveGVuL3BjaS5oIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCmluZGV4
IDc5ZWIyNTQxN2IuLmUxZjg4N2FmMWMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2ku
aAorKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKQEAgLTc5LDYgKzc5LDggQEAgc3RydWN0IHBj
aV9kZXYgewogICAgIHN0cnVjdCBsaXN0X2hlYWQgYWxsZGV2c19saXN0OwogICAgIHN0cnVjdCBs
aXN0X2hlYWQgZG9tYWluX2xpc3Q7CiAKKyAgICBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdycDsKKwog
ICAgIHN0cnVjdCBsaXN0X2hlYWQgbXNpX2xpc3Q7CiAKICAgICBzdHJ1Y3QgYXJjaF9tc2l4ICpt
c2l4OwotLSAKMi4xMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
