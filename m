Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92526A514
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 11:43:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnJxJ-0003od-Bm; Tue, 16 Jul 2019 09:41:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nepe=VN=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hnJxI-0003oY-4n
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 09:41:04 +0000
X-Inumbo-ID: cfb4d272-a7ad-11e9-896e-fba44a77460e
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfb4d272-a7ad-11e9-896e-fba44a77460e;
 Tue, 16 Jul 2019 09:40:58 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
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
IronPort-SDR: qwLGLJ/prbAIA6N1qebMakpzQSekGiuAh1qWSO6q8kDEubcovOxRMGNTVFubyT5Q29QPjoG5Jx
 nAgN9/11tuJyw/0oXdBJ13z+3U3j+LNTcq+zMCbCW/7HvDvYf/boZCYHi8K0H/LNirJJVbmdes
 QEfO+HZpTIXvZ/fo+fDij+OcPaNskD77nV2xQAJJOMaguRQDmsCEyCjN8ux1jagMFTB647YFb3
 1ogFOAnVWTBtGbytJ+emr2T22IaEe8JBeN92GN1GdRXyukPlU3oLC8bnNpA4yacNzzJyMvVGiV
 GkE=
X-SBRS: 2.7
X-MesageID: 3043442
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,497,1557201600"; 
   d="scan'208";a="3043442"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 1/4] iommu / x86: move call to scan_pci_devices() out
 of vendor code
Thread-Index: AQHVOwoI6rtYRz2llkClc6VhSqdxcqbLnowAgAFgFsA=
Date: Tue, 16 Jul 2019 09:40:52 +0000
Message-ID: <9451b88fe12c4193817d807dfa45c857@AMSPEX02CL03.citrite.net>
References: <20190715123710.1780-1-paul.durrant@citrix.com>
 <20190715123710.1780-2-paul.durrant@citrix.com>
 <20190715143916.njsdhhugibaquwhg@Air-de-Roger.citrite.net>
In-Reply-To: <20190715143916.njsdhhugibaquwhg@Air-de-Roger.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/4] iommu / x86: move call to
 scan_pci_devices() out of vendor code
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
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+Cj4gU2VudDogMTUgSnVseSAyMDE5IDE1OjM5Cj4gVG86IFBhdWwg
RHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+Cj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZzsgU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFu
aXRAYW1kLmNvbT47IEJyaWFuIFdvb2RzCj4gPGJyaWFuLndvb2RzQGFtZC5jb20+OyBLZXZpbiBU
aWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT47IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT47IEFuZHJldwo+IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUg
PHdsQHhlbi5vcmc+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzRdIGlvbW11IC8geDg2OiBt
b3ZlIGNhbGwgdG8gc2Nhbl9wY2lfZGV2aWNlcygpIG91dCBvZiB2ZW5kb3IgY29kZQo+IAo+IE9u
IE1vbiwgSnVsIDE1LCAyMDE5IGF0IDAxOjM3OjA3UE0gKzAxMDAsIFBhdWwgRHVycmFudCB3cm90
ZToKPiA+IEl0J3Mgbm90IHZlbmRvciBzcGVjaWZpYyBzbyBpdCBkb2Vzbid0IHJlYWxseSBiZWxv
bmcgdGhlcmUuCj4gPgo+ID4gU2Nhbm5pbmcgdGhlIFBDSSB0b3BvbG9neSBhbHNvIHJlYWxseSBk
b2Vzbid0IGhhdmUgbXVjaCB0byBkbyB3aXRoIElPTU1VCj4gPiBpbml0aWFsaXphdGlvbi4gSXQg
ZG9lc24ndCBkZXBlbmQgb24gdGhlcmUgZXZlbiBiZWluZyBhbiBJT01NVS4gVGhpcyBwYXRjaAo+
ID4gbW92ZXMgdG8gdGhlIGNhbGwgdG8gdGhlIGJlZ2lubmluZyBvZiBpb21tdV9oYXJkd2FyZV9z
ZXR1cCgpIGJ1dCBvbmx5Cj4gPiBwbGFjZXMgaXQgdGhlcmUgYmVjYXVzZSB0aGUgdG9wb2xvZ3kg
aW5mb3JtYXRpb24gd291bGQgYmUgb3RoZXJ3aXNlIHVudXNlZC4KPiA+Cj4gPiBTdWJzZXF1ZW50
IHBhdGNoZXMgd2lsbCBhY3R1YWxseSBtYWtlIHVzZSBvZiB0aGUgUENJIHRvcG9sb2d5IGR1cmlu
Zwo+ID4gKHg4NikgSU9NTVUgaW5pdGlhbGl6YXRpb24uCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
UGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPiAKPiBSZXZpZXdlZC1ieTog
Um9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gCgpUaGFua3MuCgo+IEkg
d291bGQgZXZlbiBjb25zaWRlciBtb3ZpbmcgdGhlIGNhbGwgdG8gc2Nhbl9wY2lfZGV2aWNlcyBp
bnRvCj4gcGNpX3NlZ21lbnRzX2luaXQgaW5zdGVhZCBvZiBkb2luZyBpdCBpbiB0aGUgSU9NTVUg
Y29kZSwgYXMgeW91Cj4gc3VnZ2VzdCBhYm92ZS4KClBvc3NpYmx5LCBhbHRob3VnaCB3aXRob3V0
IGFuIElPTU1VIGluIHRoZSBzeXN0ZW0gSSBkb24ndCB0aGluayB0aGVyZSBpcyBjdXJyZW50bHkg
YSBsb3Qgb2YgcG9pbnQgaW4gcG9wdWxhdGluZyB0aGUgcGRldiBsaXN0LgoKICBQYXVsCgo+IAo+
IFRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
