Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD37BED7F
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 10:35:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDPC9-0004fU-Hu; Thu, 26 Sep 2019 08:32:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8zHT=XV=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iDPC7-0004fP-Np
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 08:32:11 +0000
X-Inumbo-ID: 20e4d65d-e038-11e9-964a-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by localhost (Halon) with ESMTPS
 id 20e4d65d-e038-11e9-964a-12813bfff9fa;
 Thu, 26 Sep 2019 08:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569486729;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9p1/LC9jlMjqFdvjF737nLu9+yXjk/ifuLq0BNtKvmQ=;
 b=YLOevdvOl9UnLq/Ehf/zUVhwlgw/oVTYyVV8nwdnTijh6qi59lHAphcI
 xJC/Cqq5Jz2y380O2qN31mKJk15csL4m1KsoOvlQ41ixkBos5uQpI4auT
 7TUsnd8iKAfP1ejHj4w+t0G5OHwu82sgZdmVHPRNsyzoEa+4KedoThxXB 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: KuSXAL7s2hTj+3lOmxwbY4Dbl6SUW7WUJ+Ax3StXE6i3CMeLn/cGciUjz53trguEYQFkMhZhzu
 TAoUAZsxoYr/XctGVCVIG9Ezne20L/8eTv7+O5byWo2G0xZJY7aPkLhgCC48S5+Q2vdYIOgCps
 Ilat7tKrZldmqLPmP/auodoZGWaqOaWanaIItLzo+drMO17RPBBz+OCLxYzx4dwm7XDo2pcuNZ
 zK7rQfBllQaHpjxbrymwA8PyNzrKes/oiebrjKSPbxUfBxBxgasCyKFHsSglNqFQcuKAt0NJ5d
 0eU=
X-SBRS: 2.7
X-MesageID: 6328904
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,551,1559534400"; 
   d="scan'208";a="6328904"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Oleksandr' <olekstysh@gmail.com>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
Thread-Index: AQHVbg2Z91+gZvcE2UG2jzrPcpRppKc8HWgw///hpgCAACJVgIAAUp0AgAAmyFD//+LnAIAAHNEAgAES54A=
Date: Thu, 26 Sep 2019 08:32:04 +0000
Message-ID: <26bb0f534ead4da4a7aa88d519a65d97@AMSPEX02CL03.citrite.net>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
 <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
 <7d50ae35-2642-7fe5-89c7-c4ee09f263d0@gmail.com>
 <94de3adfac564f8e920bd04b3cf54734@AMSPEX02CL03.citrite.net>
 <5735846b-1a52-3260-39bd-e393c87dfb64@gmail.com>
 <f6b6185c-33b9-fca4-ec0b-f405ff7c3cea@gmail.com>
In-Reply-To: <f6b6185c-33b9-fca4-ec0b-f405ff7c3cea@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien
 Grall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>, David
 Scott <dave@recoil.org>, Anthony Perard <anthony.perard@citrix.com>, Ian
 Jackson <Ian.Jackson@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBPbGVrc2FuZHIgPG9sZWtzdHlz
aEBnbWFpbC5jb20+DQo+IFNlbnQ6IDI1IFNlcHRlbWJlciAyMDE5IDE5OjA3DQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPjsgJ0phbiBCZXVsaWNoJyA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IENjOiBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5k
ZXIuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgV2Vp
IExpdQ0KPiA8d2xAeGVuLm9yZz47IEtvbnJhZFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47
IERhdmlkIFNjb3R0IDxkYXZlQHJlY29pbC5vcmc+OyBUaW0gKFhlbi5vcmcpIDx0aW1AeGVuLm9y
Zz47IEdlb3JnZSBEdW5sYXANCj4gPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT47IFRhbWFzIEsg
TGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT47IElhbiBKYWNrc29uDQo+IDxJYW4uSmFja3Nv
bkBjaXRyaXguY29tPjsgQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+
OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IFZvbG9keW15ciBCYWJjaHVrIDxW
b2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+OyBKdWxpZW4gR3JhbGwNCj4gPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIHYxMyAwLzRdIGFkZCBwZXItZG9tYWluIElPTU1V
IGNvbnRyb2wNCj4gDQo+IA0KPiBIaSBQYXVsDQo+IA0KPiANCj4gPj4+DQo+ID4+PiBJIG1heSBt
aXN0YWtlLCBidXQgbG9va3MgbGlrZQ0KPiA+Pj4NCj4gPj4+IDgwZmYzZDMzOGRjOTMyNjBiNDFm
ZmVlZWJiMGY4NTJjMmVkZWY5Y2UgaW9tbXU6IHRpZHkgdXANCj4gPj4+IGlvbW11X3VzZV9oYXBf
cHQoKSBhbmQgbmVlZF9pb21tdV9wdF9zeW5jKCkgbWFjcm9zDQo+ID4+Pg0KPiA+Pj4gdHJpZ2dl
cnMgQVNTRVJUX1VOUkVBQ0hBQkxFIG9uIEFybSBpZiBubyBJT01NVSBoYXMgYmVlbiBmb3VuZCAo
SSBidWlsdA0KPiA+Pj4gd2l0aCBteSBwbGF0Zm9ybSdzIElPTU1VIGRyaXZlciBkaXNhYmxlZDog
IyBDT05GSUdfSVBNTVVfVk1TQSBpcyBub3QNCj4gPj4+IHNldCkgLg0KPiA+Pj4NCj4gPj4+IFNv
LCBpb21tdV9zZXR1cCgpIGNhbGxzIGNsZWFyX2lvbW11X2hhcF9wdF9zaGFyZSgpIHdpdGgNCj4g
Pj4+IGlvbW11X2hhcF9wdF9zaGFyZSBiZWluZyBzZXQgKENPTkZJR19JT01NVV9GT1JDRV9QVF9T
SEFSRT15KSB3aGljaCwNCj4gPj4+IGFjdHVhbGx5LCB0cmlnZ2VycyBBU1NFUlQuDQo+ID4+Pg0K
PiA+PiBIZXJlIGEgbWluaW1hbCBwYXRjaCwgbGVhdmluZyAnZm9yY2UgcHQgc2hhcmUnIGluIHBs
YWNlLiBEb2VzIHRoaXMNCj4gPj4gYXZvaWQgdGhlIHByb2JsZW0/DQo+ID4+DQo+ID4+IC0tLTg8
LS0tDQo+ID4+IGRpZmYgLS1naXQgYS94ZW4vY29tbW9uL3N5c2N0bC5jIGIveGVuL2NvbW1vbi9z
eXNjdGwuYw0KPiA+PiBpbmRleCBlODc2M2M3ZmRmLi5mODhhMjg1ZTdmIDEwMDY0NA0KPiA+PiAt
LS0gYS94ZW4vY29tbW9uL3N5c2N0bC5jDQo+ID4+ICsrKyBiL3hlbi9jb21tb24vc3lzY3RsLmMN
Cj4gPj4gQEAgLTI2OCw5ICsyNjgsMTEgQEAgbG9uZw0KPiA+PiBkb19zeXNjdGwoWEVOX0dVRVNU
X0hBTkRMRV9QQVJBTSh4ZW5fc3lzY3RsX3QpIHVfc3lzY3RsKQ0KPiA+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgcGktPm1heF9tZm4gPSBnZXRfdXBwZXJfbWZuX2JvdW5kKCk7DQo+ID4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBhcmNoX2RvX3BoeXNpbmZvKHBpKTsNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IGlmICggaW9tbXVfZW5hYmxlZCApDQo+ID4+ICvCoMKgwqDCoMKgwqDCoCB7DQo+ID4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBpLT5jYXBhYmlsaXRpZXMgfD0gWEVOX1NZU0NUTF9QSFlT
Q0FQX2RpcmVjdGlvOw0KPiA+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCBpb21tdV9oYXBfcHRfc2hh
cmUgKQ0KPiA+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBwaS0+Y2FwYWJpbGl0aWVzIHw9IFhF
Tl9TWVNDVExfUEhZU0NBUF9pb21tdV9oYXBfcHRfc2hhcmU7DQo+ID4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGlmICggaW9tbXVfaGFwX3B0X3NoYXJlICkNCj4gPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwaS0+Y2FwYWJpbGl0aWVzIHw9DQo+ID4+IFhFTl9TWVNDVExfUEhZ
U0NBUF9pb21tdV9oYXBfcHRfc2hhcmU7DQo+ID4+ICvCoMKgwqDCoMKgwqDCoCB9DQo+ID4+DQo+
ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIGNvcHlfdG9fZ3Vlc3QodV9zeXNjdGwsIG9wLCAx
KSApDQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FRkFVTFQ7DQo+ID4+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCBiL3hlbi9pbmNsdWRlL3hlbi9p
b21tdS5oDQo+ID4+IGluZGV4IDdjMzAwM2YzZjEuLjZhMTBhMjQxMjggMTAwNjQ0DQo+ID4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oDQo+ID4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9p
b21tdS5oDQo+ID4+IEBAIC02OCw4ICs2OCw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBjbGVhcl9p
b21tdV9oYXBfcHRfc2hhcmUodm9pZCkNCj4gPj4gwqAgew0KPiA+PiDCoCAjaWZuZGVmIGlvbW11
X2hhcF9wdF9zaGFyZQ0KPiA+PiDCoMKgwqDCoMKgIGlvbW11X2hhcF9wdF9zaGFyZSA9IGZhbHNl
Ow0KPiA+PiAtI2VsaWYgaW9tbXVfaGFwX3B0X3NoYXJlDQo+ID4+IC3CoMKgwqAgQVNTRVJUX1VO
UkVBQ0hBQkxFKCk7DQo+ID4+IMKgICNlbmRpZg0KPiA+PiDCoCB9DQo+ID4+IC0tLTg8LS0tDQo+
ID4+DQo+ID4+IMKgwqAgUGF1bA0KPiA+DQo+ID4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2gsIGJ1
dCBJIG5lZWQgc29tZSB0aW1lIHRvIGNoZWNrIGl0IChub3cgSSBoYXZlDQo+ID4gc29tZSB0cm91
YmxlcyB3aXRoIHN0YXJ0aW5nIGd1ZXN0IFZNKS4gSSB3aWxsIGluZm9ybSB5b3Ugb25jZSBJIGNo
ZWNrLg0KPiANCj4gDQo+IFdpdGggdGhlIHBhdGNoIGFwcGxpZWQsIHRoZSBpc3N1ZSBJIGhhdmUg
ZmFjZWQgKGR1cmluZyBYZW4gYm9vdCkgaXMgZ29uZQ0KPiBhd2F5LiBCdXQsIEkgaGF2ZW4ndCBh
bmFseXplZCB5b3VyICJwZXItZG9tYWluIElPTU1VIGNvbnRyb2wgc2VyaWVzIiB5ZXQNCj4gdG8g
aGF2ZSBvcGluaW9uIHJlZ2FyZGluZyB5b3VyIHBhdGNoIGl0c2VsZi4NCj4gDQo+IA0KPiBJIG5v
dGljZWQgdGhlIGZvbGxvd2luZzoNCj4gDQo+IFdoZW4gaW9tbXVfZW5hYmxlZCA9IGZhbHNlICht
eSBjYXNlLCB3aGVuIElPTU1VIGRyaXZlciBpcyBkaXNhYmxlKSwgSQ0KPiBjYW4ndCBjcmVhdGUg
Z3Vlc3QgVk0gaWYgImR0ZGV2IiBwcm9wZXJ0eSBpcyBwcmVzZW50IGFuZCBjb250YWlucyBETUEN
Cj4gbWFzdGVycyBpbiB0aGUgZG9tYWluIGNvbmZpZzoNCj4gDQo+IFBhcnNpbmcgY29uZmlnIGZy
b20gL3h0L2RvbS5jZmcvZG9tZC5jZmcNCj4gRVJST1I6IHBhc3N0aHJvdWdoIG5vdCBzdXBwb3J0
ZWQgb24gdGhpcyBwbGF0Zm9ybQ0KPiANCj4gRXZlbiBpZiBJIGFkZCBwYXNzdGhyb3VnaCA9ICJk
aXNhYmxlZCIsIGl0IHN0aWxsIGRlbmllczoNCj4gDQo+IFBhcnNpbmcgY29uZmlnIGZyb20gL3h0
L2RvbS5jZmcvZG9tZC5jZmcNCj4gRVJST1I6IHBhc3N0aHJvdWdoIGRpc2FibGVkIGJ1dCBkZXZp
Y2VzIGFyZSBzcGVjaWZpZWQNCj4gDQo+IExvb2tzIGxpa2UsIGNvcnJlY3QgYmVoYXZpb3IuLi4N
Cj4gDQoNClllcywgdGhhdCBhbGwgc2VlbXMgY29ycmVjdC4gUGFzc3Rocm91Z2ggc2hvdWxkIG5v
dCBiZSBkb25lIHdpdGhvdXQgYW4gSU9NTVUuDQoNCiAgUGF1bA0KDQo+IA0KPiAtLQ0KPiBSZWdh
cmRzLA0KPiANCj4gT2xla3NhbmRyIFR5c2hjaGVua28NCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
