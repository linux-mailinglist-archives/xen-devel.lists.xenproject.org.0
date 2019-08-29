Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 877DCA150C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 11:36:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Go2-00086x-9S; Thu, 29 Aug 2019 09:33:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+tTk=WZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3Go0-00086s-Sv
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:33:24 +0000
X-Inumbo-ID: 0b9d6d8a-ca40-11e9-8980-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b9d6d8a-ca40-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 09:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567071204;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VaoM9xJF6EOgpuAN+waePvSC43QxpWLzGMI0iX6jqPM=;
 b=OH41p5f1xprxU4DFvbZmqFYU+EbafOsbKZzIzKieHRJlO8Qkfd4SlyjI
 kk7/MpSB8kKHOMfoa/rZngVuGcTArlbwpfU+iL3t55mfPsfeMl4jGhBDI
 KFr4ibH/vXCOpfiHwUoqtBjX9LK7zN910vXacCkZ+FcqrRYAqwc1LpiQt 4=;
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
IronPort-SDR: PpaG/prZw+1fnjkTBdhZvm2smRbBy1DJl0Nv7lAMcD7OhZuPsaaYbEeMBDUgQgjClcIFVXXRDr
 g6sDb622/HQ5bXWLKMdU9MrLabFZkz45lOvs1ygx01MwzxOIZjFeMkgn2BtW2NMVxk+lK98cLP
 iOW31CdokdpsCe0tzCeA/DWunZvkXXZmalXPJr+7aLlEuH69aNwI98O/taOr2Mc2QsfQocOV79
 /PcwdVN7xp5tlS/UBDILX4zC78FWG03FKsjyXy7TBoVMb1xkkSCclM4T/ilTRWJecRyiRT6GeV
 B/s=
X-SBRS: 2.7
X-MesageID: 4883846
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="4883846"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
Thread-Index: AQHVRuOcaRJ86WB7wUWdfnF755Z/qabvZ0eAgAhNFVCAABIMcIACsp0ggBQvXICAA2JiQA==
Date: Thu, 29 Aug 2019 09:33:18 +0000
Message-ID: <4fe23438a0bf4248accdf0367c754662@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
 <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
 <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
 <b7ed5929dd864aefa93bb8572a7b5193@AMSPEX02CL03.citrite.net>
 <0854e0578b7445dbb7ac2e65ed81153b@AMSPEX02CL03.citrite.net>
 <b1036f3e-a2a4-306b-d37b-190936978ce5@suse.com>
In-Reply-To: <b1036f3e-a2a4-306b-d37b-190936978ce5@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
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
Cc: 'Petre Pircalabu' <ppircalabu@bitdefender.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Razvan Cojocaru' <rcojocaru@bitdefender.com>,
 'Konrad Rzeszutek Wilk' <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 'JulienGrall' <julien.grall@arm.com>, 'Tamas K Lengyel' <tamas@tklengyel.com>,
 "'xen-devel@lists.xenproject.org'" <xen-devel@lists.xenproject.org>,
 'Alexandru Isaila' <aisaila@bitdefender.com>, Ian
 Jackson <Ian.Jackson@citrix.com>,
 'VolodymyrBabchuk' <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI3IEF1Z3VzdCAyMDE5IDA4OjQ5DQo+IFRvOiBQYXVsIER1
cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogJ0p1bGllbkdyYWxsJyA8anVs
aWVuLmdyYWxsQGFybS5jb20+OyAnQWxleGFuZHJ1IElzYWlsYScgPGFpc2FpbGFAYml0ZGVmZW5k
ZXIuY29tPjsgJ1BldHJlDQo+IFBpcmNhbGFidScgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29t
PjsgJ1JhenZhbiBDb2pvY2FydScgPHJjb2pvY2FydUBiaXRkZWZlbmRlci5jb20+OyBBbmRyZXcg
Q29vcGVyDQo+IDxBbmRyZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2Vv
cmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24NCj4gPElhbi5KYWNrc29uQGNpdHJp
eC5jb20+OyBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgJ1ZvbG9keW15
ckJhYmNodWsnDQo+IDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT47ICdTdGVmYW5vIFN0YWJl
bGxpbmknIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgJ3hlbi0NCj4gZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcnIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyAnS29ucmFkIFJ6
ZXN6dXRlayBXaWxrJw0KPiA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47ICdUYW1hcyBLIExlbmd5
ZWwnIDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+OyAn
V2VpDQo+IExpdScgPHdsQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFU
Q0ggMy82XSByZW1vdmUgbGF0ZSAob24tZGVtYW5kKSBjb25zdHJ1Y3Rpb24gb2YgSU9NTVUgcGFn
ZSB0YWJsZXMNCj4gDQo+IE9uIDE0LjA4LjIwMTkgMTE6MzksIFBhdWwgRHVycmFudCB3cm90ZToN
Cj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogWGVuLWRldmVsIDx4
ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVoYWxmIE9mIFBhdWwg
RHVycmFudA0KPiA+PiBTZW50OiAxMiBBdWd1c3QgMjAxOSAxNzoyNg0KPiA+PiBUbzogJ0phbiBC
ZXVsaWNoJyA8amJldWxpY2hAc3VzZS5jb20+DQo+ID4+IENjOiAnUGV0cmUgUGlyY2FsYWJ1JyA8
cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+OyAnU3RlZmFubyBTdGFiZWxsaW5pJyA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47DQo+ID4+ICdXZWkgTGl1JyA8d2xAeGVuLm9yZz47ICdSYXp2YW4g
Q29qb2NhcnUnIDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPjsgJ0tvbnJhZCBSemVzenV0ZWsg
V2lsaycNCj4gPj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBBbmRyZXcgQ29vcGVyIDxBbmRy
ZXcuQ29vcGVyM0BjaXRyaXguY29tPjsgVGltIChYZW4ub3JnKSA8dGltQHhlbi5vcmc+Ow0KPiA+
PiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGNpdHJpeC5jb20+OyAnSnVsaWVuIEdyYWxs
JyA8anVsaWVuLmdyYWxsQGFybS5jb20+OyAnVGFtYXMgSyBMZW5neWVsJw0KPiA+PiA8dGFtYXNA
dGtsZW5neWVsLmNvbT47IElhbiBKYWNrc29uIDxJYW4uSmFja3NvbkBjaXRyaXguY29tPjsgJ0Fs
ZXhhbmRydSBJc2FpbGEnDQo+ID4+IDxhaXNhaWxhQGJpdGRlZmVuZGVyLmNvbT47ICd4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcnIDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+
Ow0KPiA+PiAnVm9sb2R5bXlyQmFiY2h1aycgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsg
Um9nZXIgUGF1IE1vbm5lIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPj4gU3ViamVjdDogUmU6
IFtYZW4tZGV2ZWxdIFtQQVRDSCAzLzZdIHJlbW92ZSBsYXRlIChvbi1kZW1hbmQpIGNvbnN0cnVj
dGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcw0KPiA+Pg0KPiA+Pj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4gW3NuaXBdDQo+ID4+Pj4NCj4gPj4+PiBPbiAzMC4wNy4yMDE5IDE1OjQ0
LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+Pj4+IE5PVEU6IFRoaXMgcGF0Y2ggd2lsbCBjYXVz
ZSBhIHNtYWxsIGFtb3VudCBvZiBleHRyYSByZXNvdXJjZSB0byBiZSB1c2VkDQo+ID4+Pj4+ICAg
ICAgICAgdG8gYWNjb21tb2RhdGUgSU9NTVUgcGFnZSB0YWJsZXMgdGhhdCBtYXkgbmV2ZXIgYmUg
dXNlZCwgc2luY2UgdGhlDQo+ID4+Pj4+ICAgICAgICAgcGVyLWRvbWFpbiBJT01NVSBmbGFnIGVu
YWJsZSBmbGFnIGlzIGN1cnJlbnRseSBzZXQgdG8gdGhlIHZhbHVlDQo+ID4+Pj4+ICAgICAgICAg
b2YgdGhlIGdsb2JhbCBpb21tdV9lbmFibGUgZmxhZy4gQSBzdWJzZXF1ZW50IHBhdGNoIHdpbGwg
YWRkIGFuDQo+ID4+Pj4+ICAgICAgICAgb3B0aW9uIHRvIHRoZSB0b29sc3RhY2sgdG8gYWxsb3cg
aXQgdG8gYmUgdHVybmVkIG9mZiBpZiB0aGVyZSBpcw0KPiA+Pj4+PiAgICAgICAgIG5vIGludGVu
dGlvbiB0byBhc3NpZ24gcGFzc3Rocm91Z2ggaGFyZHdhcmUgdG8gdGhlIGRvbWFpbi4NCj4gPj4+
Pg0KPiA+Pj4+IEluIHBhcnRpY3VsYXIgaWYgdGhlIGRlZmF1bHQgb2YgdGhpcyBpcyBnb2luZyB0
byBiZSAidHJ1ZSIgKEkNCj4gPj4+PiBkaWRuJ3QgbG9vayBhdCB0aGF0IHBhdGNoIHlldCwgYnV0
IHRoZSB3b3JkaW5nIGFib3ZlIG1ha2VzIG1lDQo+ID4+Pj4gYXNzdW1lIHNvKSwgaW4gYXV0by1i
YWxsb29uaW5nIG1vZGUgd2l0aG91dCBzaGFyZWQgcGFnZSB0YWJsZXMNCj4gPj4+PiBtb3JlIG1l
bW9yeSBzaG91bGQgaW1vIGJlIGJhbGxvb25lZCBvdXQgb2YgRG9tMCBub3cuIEl0IGhhcw0KPiA+
Pj4+IGFsd2F5cyBiZWVuIGEgYnVnIHRoYXQgSU9NTVUgcGFnZSB0YWJsZXMgd2VyZW4ndCBhY2Nv
dW50ZWQgZm9yLA0KPiA+Pj4+IGJ1dCBpdCB3b3VsZCBiZWNvbWUgZXZlbiBtb3JlIHByb21pbmVu
dCB0aGVuLg0KPiA+Pj4NCj4gPj4+IFVsdGltYXRlbHksIG9uY2UgdGhlIHdob2xlIHNlcmllcyBp
cyBhcHBsaWVkLCB0aGVuIG5vdGhpbmcgbXVjaCBzaG91bGQgY2hhbmdlIGZvciB0aG9zZSBzcGVj
aWZ5aW5nDQo+ID4+PiBwYXNzdGhyb3VnaCBoL3cgaW4gYW4geGwuY2ZnLiBUaGUgbWFpbiBkaWZm
ZXJlbmNlIHdpbGwgYmUgdGhhdCBoL3cgY2Fubm90IGJlIHBhc3NlZCB0aHJvdWdoIHRvIGENCj4g
Pj4+IGRvbWFpbiB0aGF0IHdhcyBub3Qgb3JpZ2luYWxseSBjcmVhdGVkIHdpdGggSU9NTVUgcGFn
ZXRhYmxlcy4NCj4gPj4+IFdpdGggcGF0Y2hlcyBhcHBsaWVkIHVwIHRvIHRoaXMgcG9pbnQgdGhl
biwgeWVzLCBldmVyeSBkb21haW4gd2lsbCBnZXQgSU9NTVUgcGFnZSB0YWJsZXMuIEkgZ3Vlc3MN
Cj4gPj4gSSdsbA0KPiA+Pj4gdGFrZSBhIGxvb2sgYXQgdGhlIGF1dG8tYmFsbG9vbmluZyBjb2Rl
IGFuZCBzZWUgd2hhdCBuZWVkcyB0byBiZSBkb25lLg0KPiA+Pj4NCj4gPj4NCj4gPj4gT2ssIEkn
dmUgaGFkIGEgbG9vay4uLg0KPiA+Pg0KPiA+PiBJIGNvdWxkIG1ha2UgYSByb3VnaCBjYWxjdWxh
dGlvbiBpbiBsaWJ4bF9kb21haW5fbmVlZF9tZW1vcnkoKSBiYXNlZCBvbiB0aGUgZG9tYWluJ3Mg
bWF4X21lbWtiIGFuZA0KPiBhbg0KPiA+PiBhc3N1bXB0aW9uIG9mIGEgNCBsZXZlbCB0cmFuc2xh
dGlvbiB3aXRoIDUxMiBQVEVzIHBlciBsZXZlbCwgb3Igd291bGQgcHJlZmVyIHN1Y2ggZ3Vlc3Rp
bWF0aW9uIHRvDQo+IGJlDQo+ID4+IG92ZXJyaWRhYmxlIHVzaW5nIGFuIHhsLmNmZyBwYXJhbWV0
ZXIgaW4gYSBicm9hZGx5IHNpbWlsYXIgd2F5IHRvIHNoYWRvd19tZW1rYj8NCj4gPj4NCj4gPg0K
PiA+IEkgdGhpbmsgSSdtIGdvaW5nIHRvIHNheSBubyB0byB0aGlzIGFueXdheSBzaW5jZSwgYXMg
eW91IHNheSwgdGhlIG92ZXJoZWFkIGFzIG5ldmVyIGJlZW4gYWNjb3VudGVkDQo+IGZvciBhbmQg
aGF2aW5nIHRvIG1ha2UgYXNzdW1wdGlvbnMgYWJvdXQgdGhlIElPTU1VIHRhYmxlIHN0cnVjdHVy
ZSBpcyBub3QgdmVyeSBhdHRyYWN0aXZlLiBHaXZlbiB0aGF0DQo+IGFueSBpc3N1ZSBpcyBnb2lu
ZyB0byBiZSB0cmFuc2llbnQgKGkuZS4gdW50aWwgcGF0Y2ggIzYgaXMgY29tbWl0dGVkKSBJIGRv
bid0IHRoaW5rIGZpeGluZyBhdXRvLQ0KPiBiYWxsb29uaW5nIG91Z2h0IHRvIGJlIGluIHNjb3Bl
IGZvciB0aGlzIHNlcmllcy4NCj4gDQo+IEknbSBhZnJhaWQgSSBkaXNhZ3JlZTogVGhlIHNlcmll
cyBleHRlbmRzIGEgcHJlLWV4aXN0aW5nIHByb2JsZW0NCj4gYWZmZWN0aW5nIHNvbWUgZ3Vlc3Rz
IHRvIGFsbCBvbmVzIChhdCBsZWFzdCBieSBkZWZhdWx0KS4NCg0KVEJIIEkndmUgc2VlbiBzdWZm
aWNpZW50IG51bWJlcnMgb2YgZG9tYWluIGNyZWF0ZSBmYWlsdXJlcyB3aGVuIHVzaW5nIGF1dG8t
YmFsbG9vbmluZyB0aGF0IEkgc3RvcHBlZCB1c2luZyBpdCBzb21lIHRpbWUgYWdvIChiZXNpZGVz
IHRoZSBmYWN0IHRoYXQgaXQncyBzbG93KS4gSWYgeW91J3JlIGhhcHB5IHdpdGggdGhlIHNpbXBs
aXN0aWMgZG91YmxlLXRoZS1wYWdlLXRhYmxlLXJlc2VydmF0aW9uIGNhbGN1bGF0aW9uIHRoZW4g
SSBjYW4gYWRkIHRoYXQgYnV0IElNTyBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8gYWRkIGFub3RoZXIg
cGF0Y2ggdG8ganVzdCByZW1vdmUgYXV0by1iYWxsb29uaW5nLg0KDQogUGF1bA0KDQo+IA0KPiBK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
