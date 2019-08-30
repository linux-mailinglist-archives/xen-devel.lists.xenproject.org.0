Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E17A3BAD
	for <lists+xen-devel@lfdr.de>; Fri, 30 Aug 2019 18:11:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3jQr-0002WB-QJ; Fri, 30 Aug 2019 16:07:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0MMg=W2=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3jQq-0002W6-6H
 for xen-devel@lists.xenproject.org; Fri, 30 Aug 2019 16:07:24 +0000
X-Inumbo-ID: 40356e02-cb40-11e9-8980-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40356e02-cb40-11e9-8980-bc764e2007e4;
 Fri, 30 Aug 2019 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567181243;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=02yAdXTuEJXypZOd2HiVKN4Mrix6BCry7657Isfouhs=;
 b=fgex0thnE3KV4FiUpuwP0wHQg1ccxRbq9BtiRM+jHX3HuAsrWBPoyth7
 4fmaYOesC1HN68v/bqcJcWF+cX0G+Xxdf7SfYbrPri5TEhizAXuoo5aoO
 NfDTIY3DHiw6OSByd+Gw9YevtO/deONX49e4GmdedAfjw0gWtmhavFPkW 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: L0cP02NWvD5ZO5It3dh9ZwfHVoOeD8tY5giHP+oM/agf4bSeqwBFDD7knsrj32NxsSUqd17k4E
 yuYEbW5bjaAxl3UnZpH0aqH16rSusnd0IgqGA1UfAogWAFn4d38BBEoGUuqoUu4oCcEj2UBvt4
 zKWOZT1Ye1bR3BYJRP0UXJ4v+ijS4+1ftyGgmubMeAWwMC0b/ijZPZP0HwcHjHJ2iDSZv4fzVE
 qofBVTJO7Ak7ZfdyBopNy3iVpScvBR7/y6m9MNYKtPHF07yBDwzn3uWytkRtJedgLWVYN9hwb4
 QW0=
X-SBRS: 2.7
X-MesageID: 4957522
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,447,1559534400"; 
   d="scan'208";a="4957522"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [PATCH v7 5/6] iommu: tidy up iommu_use_hap_pt() and
 need_iommu_pt_sync() macros
Thread-Index: AQHVXw0cAzY6mu86QEmfR6Erg36S1qcTmOyAgABCcGA=
Date: Fri, 30 Aug 2019 16:07:18 +0000
Message-ID: <370d5fa4f84e43f8b89b9e7452036dab@AMSPEX02CL03.citrite.net>
References: <20190830082953.2192-1-paul.durrant@citrix.com>
 <20190830082953.2192-6-paul.durrant@citrix.com>
 <a76d459f-55dc-eee4-d6ee-b7cb9a4dd333@suse.com>
In-Reply-To: <a76d459f-55dc-eee4-d6ee-b7cb9a4dd333@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v7 5/6] iommu: tidy up iommu_use_hap_pt()
 and need_iommu_pt_sync() macros
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMwIEF1Z3VzdCAyMDE5IDE1OjA4DQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgQW5kcmV3
IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyBWb2xvZHlteXIgQmFiY2h1aw0KPiA8Vm9sb2R5bXlyX0Jh
YmNodWtAZXBhbS5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+
OyBJYW4gSmFja3Nvbg0KPiA8SWFuLkphY2tzb25AY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVs
bGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsaw0KPiA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9yZykgPHRpbUB4ZW4ub3JnPjsgV2Vp
IExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyA1LzZdIGlvbW11OiB0
aWR5IHVwIGlvbW11X3VzZV9oYXBfcHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkgbWFjcm9z
DQo+IA0KPiBPbiAzMC4wOC4yMDE5IDEwOjI5LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gLS0t
IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYw0KPiA+ICsrKyBiL3hlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2lvbW11LmMNCj4gPiBAQCAtNDksNyArNDksMTEgQEAgaW50OF90IF9faHdk
b21faW5pdGRhdGEgaW9tbXVfaHdkb21fcmVzZXJ2ZWQgPSAtMTsNCj4gPiAgICogZGVmYXVsdCB1
bnRpbCB3ZSBmaW5kIGEgZ29vZCBzb2x1dGlvbiB0byByZXNvbHZlIGl0Lg0KPiA+ICAgKi8NCj4g
PiAgYm9vbF90IF9fcmVhZF9tb3N0bHkgaW9tbXVfaW50cG9zdDsNCj4gPiAtYm9vbF90IF9fcmVh
ZF9tb3N0bHkgaW9tbXVfaGFwX3B0X3NoYXJlID0gMTsNCj4gPiArDQo+ID4gKyNpZm5kZWYgQ09O
RklHX0FSTQ0KPiA+ICtib29sIF9fcmVhZF9tb3N0bHkgaW9tbXVfaGFwX3B0X3NoYXJlID0gdHJ1
ZTsNCj4gPiArI2VuZGlmDQo+IA0KPiBUaGUgI2lkZWYgaGVyZSBzaG91bGQgYmUgaW4gbGluZSB3
aXRoIC4uLg0KPiANCj4gPiBAQCAtMTAyLDggKzEwNiwxMCBAQCBzdGF0aWMgaW50IF9faW5pdCBw
YXJzZV9pb21tdV9wYXJhbShjb25zdCBjaGFyICpzKQ0KPiA+ICAgICAgICAgICAgICBpb21tdV9o
d2RvbV9wYXNzdGhyb3VnaCA9IHZhbDsNCj4gPiAgICAgICAgICBlbHNlIGlmICggKHZhbCA9IHBh
cnNlX2Jvb2xlYW4oImRvbTAtc3RyaWN0Iiwgcywgc3MpKSA+PSAwICkNCj4gPiAgICAgICAgICAg
ICAgaW9tbXVfaHdkb21fc3RyaWN0ID0gdmFsOw0KPiA+ICsjaWZuZGVmIGlvbW11X2hhcF9wdF9z
aGFyZQ0KPiA+ICAgICAgICAgIGVsc2UgaWYgKCAodmFsID0gcGFyc2VfYm9vbGVhbigic2hhcmVw
dCIsIHMsIHNzKSkgPj0gMCApDQo+ID4gICAgICAgICAgICAgIGlvbW11X2hhcF9wdF9zaGFyZSA9
IHZhbDsNCj4gPiArI2VuZGlmDQo+IA0KPiAuLi4gdGhlIG9uZSBoZXJlLCBpLmUuIG5laXRoZXIg
c2hvdWxkIGJlIEFybS1zcGVjaWZpYy4gV2hhdCBhIHNwZWNpZmljDQo+IGFyY2hpdGVjdHVyZSB3
YW50cyBzaG91bGQgYmUgY29udHJvbGxlZCBpbiBhIHNpbmdsZSBwbGFjZSAoaW4gYSBoZWFkZXIp
Lg0KDQpBaCwgb2suIEkgb2J2aW91c2x5IG1pc3VuZGVyc3Rvb2Qgd2hhdCB5b3UgbWVhbnQuDQoN
Cj4gDQo+ID4gQEAgLTI2OCw2ICsyNzQsMTcgQEAgc3RydWN0IGRvbWFpbl9pb21tdSB7DQo+ID4g
ICNkZWZpbmUgaW9tbXVfc2V0X2ZlYXR1cmUoZCwgZikgICBzZXRfYml0KGYsIGRvbV9pb21tdShk
KS0+ZmVhdHVyZXMpDQo+ID4gICNkZWZpbmUgaW9tbXVfY2xlYXJfZmVhdHVyZShkLCBmKSBjbGVh
cl9iaXQoZiwgZG9tX2lvbW11KGQpLT5mZWF0dXJlcykNCj4gPg0KPiA+ICsvKiBBcmUgd2UgdXNp
bmcgdGhlIGRvbWFpbiBQMk0gdGFibGUgYXMgaXRzIElPTU1VIHBhZ2V0YWJsZT8gKi8NCj4gPiAr
I2RlZmluZSBpb21tdV91c2VfaGFwX3B0KGQpIFwNCj4gPiArICAgIChoYXBfZW5hYmxlZChkKSAm
JiBpc19pb21tdV9lbmFibGVkKGQpICYmIGlvbW11X2hhcF9wdF9zaGFyZSkNCj4gPiArDQo+ID4g
Ky8qIERvZXMgdGhlIElPTU1VIHBhZ2V0YWJsZSBuZWVkIHRvIGJlIGtlcHQgc3luY2hyb25pemVk
IHdpdGggdGhlIFAyTSAqLw0KPiA+ICsjaWZkZWYgQ09ORklHX0hBU19QQVNTVEhST1VHSA0KPiA+
ICsjZGVmaW5lIG5lZWRfaW9tbXVfcHRfc3luYyhkKSAgICAgKGRvbV9pb21tdShkKS0+bmVlZF9z
eW5jKQ0KPiA+ICsjZWxzZQ0KPiA+ICsjZGVmaW5lIG5lZWRfaW9tbXVfcHRfc3luYyhkKSAgICAg
KHsgKHZvaWQpZDsgZmFsc2U7IH0pDQo+IA0KPiAiZCIgd2FudHMgdG8gYmUgcGFyZW50aGVzaXpl
ZC4NCj4gDQoNCk9rLg0KDQo+IFdpdGggdGhlc2UgdGFrZW4gY2FyZSBvZiAocG9zc2libHkgd2hp
bGUgY29tbWl0dGluZykNCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4NCj4gDQoNClRoYW5rcy4NCg0KICBQYXVsDQoNCj4gSmFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
