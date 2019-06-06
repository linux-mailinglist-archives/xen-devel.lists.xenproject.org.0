Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 315D237292
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 13:14:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYqIv-0005BE-Aj; Thu, 06 Jun 2019 11:11:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ATwH=UF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hYqIt-0005B9-Ju
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 11:11:31 +0000
X-Inumbo-ID: d5617e2f-884b-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d5617e2f-884b-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 11:11:29 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=SoftFail smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: SoftFail (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com is inclined to not designate
 162.221.158.21 as permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 include:spf.citrix.com
 include:spf2.citrix.com include:ironport.citrix.com
 exists:%{i}._spf.mta.salesforce.com ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: SVTP+SKI1px8KCkKsXiO+V/ch91fC6bM8vr3JaQ6iv75RO78wRMHIfweiJxX9/Y20vctnO+uhf
 HBs3RireX9hrokGc7u7xTVGvcN6izNgFDrli3niMVjePugg2LCf1cpFo6mOZPiorAkSMBs0vpA
 BGwgHTzl+y7ZpgH6d4EJ3MXJYBPj6UgmeSWOpgAmW+pJHnza7S2ZERCRgQz33WRVc/o3BPaZsm
 /JXGMEATP37QXIpHxUTnq2VRY58dzGBFqJ6Ky5G7UubvNqsGOtXruGKRBppdxYZoRmj+4wQ+DS
 j34=
X-SBRS: -0.9
X-MesageID: 1389844
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,559,1557201600"; 
   d="scan'208";a="1389844"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH v2 03/12] pci: make PCI_SBDF return a
 pci_sbdf_t
Thread-Index: AQHVHEat2EWOrJMpPE+UVYYSe0+AlqaOeHHw
Date: Thu, 6 Jun 2019 11:11:25 +0000
Message-ID: <d0590126d33a4ca69da45b09d6038cb5@AMSPEX02CL03.citrite.net>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-4-roger.pau@citrix.com>
In-Reply-To: <20190606090146.77381-4-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 03/12] pci: make PCI_SBDF return a
 pci_sbdf_t
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgW21haWx0bzp4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZ10gT24gQmVoYWxmIE9mIFJvZ2Vy
IFBhdSBNb25uZQ0KPiBTZW50OiAwNiBKdW5lIDIwMTkgMTA6MDINCj4gVG86IHhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5j
b20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1
DQo+IDx3bEB4ZW4ub3JnPjsgS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFj
bGUuY29tPjsgR2VvcmdlIER1bmxhcA0KPiA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgQW5k
cmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IElhbiBKYWNrc29uDQo+IDxJ
YW4uSmFja3NvbkBjaXRyaXguY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyBKdWxp
ZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPjsgSmFuDQo+IEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPjsgUm9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU3Vi
amVjdDogW1hlbi1kZXZlbF0gW1BBVENIIHYyIDAzLzEyXSBwY2k6IG1ha2UgUENJX1NCREYgcmV0
dXJuIGEgcGNpX3NiZGZfdA0KPiANCj4gQW5kIGZpeCBpdCdzIG9ubHkgY2FsbGVyLg0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoN
ClJldmlld2VkLWJ5OiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPg0KDQo+
IC0tLQ0KPiBDYzogS2V2aW4gVGlhbiA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+IENjOiBBbmRy
ZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBDYzogR2VvcmdlIER1bmxh
cCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPg0KPiBDYzogSWFuIEphY2tzb24gPGlhbi5q
YWNrc29uQGV1LmNpdHJpeC5jb20+DQo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5j
b20+DQo+IENjOiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPg0KPiBDYzogS29u
cmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPg0KPiBDYzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KPiBDYzogVGltIERlZWdhbiA8
dGltQHhlbi5vcmc+DQo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPiAtLS0NCj4gQ2hhbmdl
cyBzaW5jZSB2MToNCj4gIC0gTmV3IGluIHRoaXMgdmVyc2lvbi4NCj4gLS0tDQo+ICB4ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC92dGQvZG1hci5jIHwgMyArKy0NCj4gIHhlbi9pbmNsdWRlL3hlbi9w
Y2kuaCAgICAgICAgICAgICAgfCAzICsrLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2RtYXIuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMN
Cj4gaW5kZXggOWNjODYyM2U1My4uNTlhNDZjZDFjNiAxMDA2NDQNCj4gLS0tIGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvdnRkL2RtYXIuYw0KPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC92dGQvZG1hci5jDQo+IEBAIC0xMTE1LDcgKzExMTUsOCBAQCBzdGF0aWMgaW50IF9faW5pdCBw
YXJzZV9ybXJyX3BhcmFtKGNvbnN0IGNoYXIgKnN0cikNCj4gDQo+ICAgICAgICAgICAgICAvKiBL
ZWVwIHNiZGYncyBldmVuIGlmIHRoZXkgZGlmZmVyIGFuZCBsYXRlciByZXBvcnQgYW4gZXJyb3Iu
ICovDQo+ICAgICAgICAgICAgICBkZXZfY291bnQgPSB1c2VyX3JtcnJzW25yX3JtcnJdLmRldl9j
b3VudDsNCj4gLSAgICAgICAgICAgIHVzZXJfcm1ycnNbbnJfcm1ycl0uc2JkZltkZXZfY291bnRd
ID0gUENJX1NCREYoc2VnLCBidXMsIGRldiwgZnVuYyk7DQo+ICsgICAgICAgICAgICB1c2VyX3Jt
cnJzW25yX3JtcnJdLnNiZGZbZGV2X2NvdW50XSA9DQo+ICsgICAgICAgICAgICAgICBQQ0lfU0JE
RihzZWcsIGJ1cywgZGV2LCBmdW5jKS5zYmRmOw0KPiANCj4gICAgICAgICAgICAgIHVzZXJfcm1y
cnNbbnJfcm1ycl0uZGV2X2NvdW50Kys7DQo+ICAgICAgICAgICAgICBzID0gc3RtcDsNCj4gZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaCBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0K
PiBpbmRleCBmNDkwOGFiZDhiLi45ZWE0MTc4OWQwIDEwMDY0NA0KPiAtLS0gYS94ZW4vaW5jbHVk
ZS94ZW4vcGNpLmgNCj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oDQo+IEBAIC0zNCw3ICsz
NCw4IEBADQo+ICAjZGVmaW5lIFBDSV9ERVZGTjIoYmRmKSAoKGJkZikgJiAweGZmKQ0KPiAgI2Rl
ZmluZSBQQ0lfQkRGKGIsZCxmKSAgKCgoKGIpICYgMHhmZikgPDwgOCkgfCBQQ0lfREVWRk4oZCxm
KSkNCj4gICNkZWZpbmUgUENJX0JERjIoYixkZikgICgoKChiKSAmIDB4ZmYpIDw8IDgpIHwgKChk
ZikgJiAweGZmKSkNCj4gLSNkZWZpbmUgUENJX1NCREYocyxiLGQsZikgKCgoKHMpICYgMHhmZmZm
KSA8PCAxNikgfCBQQ0lfQkRGKGIsZCxmKSkNCj4gKyNkZWZpbmUgUENJX1NCREYocyxiLGQsZikg
XA0KPiArICAgICgocGNpX3NiZGZfdCkgeyAuc2JkZiA9ICgoKHMpICYgMHhmZmZmKSA8PCAxNikg
fCBQQ0lfQkRGKGIsZCxmKSB9KQ0KPiAgI2RlZmluZSBQQ0lfU0JERjIocyxiZGYpICgoKChzKSAm
IDB4ZmZmZikgPDwgMTYpIHwgKChiZGYpICYgMHhmZmZmKSkNCj4gICNkZWZpbmUgUENJX1NCREYz
KHMsYixkZikgKCgoKHMpICYgMHhmZmZmKSA8PCAxNikgfCBQQ0lfQkRGMihiLCBkZikpDQo+IA0K
PiAtLQ0KPiAyLjIwLjEgKEFwcGxlIEdpdC0xMTcpDQo+IA0KPiANCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlz
dA0KPiBYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
