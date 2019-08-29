Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F131CA15D0
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:22:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3HXJ-0004Qn-Ga; Thu, 29 Aug 2019 10:20:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+tTk=WZ=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i3HXI-0004QA-3v
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:20:12 +0000
X-Inumbo-ID: 951d9bec-ca46-11e9-b95f-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 951d9bec-ca46-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 10:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567074012;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Huztp4eJSzJxkNKIiHQyNMhz3RAEQoldUupETdzxow=;
 b=TZj1vrkj9CP2fkj43lEonBp75VGCE3blTJs/StBjN9+Luqqj5Sw3omeY
 c0Mv+lgCR95kIpnSPS8BQ949Be85aA7sP3HMjlHjhbVGxskMtC0YWb+fa
 LE0wZeAP5eDJS7KgnhAy+DozkQtaT2dTS0WN3moEZsbp5nNL+cr/QySYV o=;
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
IronPort-SDR: EDWssxsMZeQnASIRw6t5/wtMDdl5AsICWbOXIRmRMr5+Re4YKVDab6X75Eqfb3Q5v5UCyHkY5j
 6zbLUxRD9Mdvd/OQCjifnEJZ2n3V25o94BdoB6CZhivhHr2WpwpUwJEWyz6t/b3g5jo+z3dFLp
 e2TWliTFlWxnLpR6XSy/ZDKvpZ27KnVfizMDExxuzYchETTbJO2b1VK9hpzqYT7/awhEbu9T+z
 wQulhGuHGk38MZi10zV55x0G/7gArwq0ImaBi7LW2ltIap85QswO0696ib22qhDs7l0LjrRQoR
 a08=
X-SBRS: 2.7
X-MesageID: 4885404
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="4885404"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH 3/6] remove late (on-demand) construction of
 IOMMU page tables
Thread-Index: AQHVRuOcaRJ86WB7wUWdfnF755Z/qabvZ0eAgAhNFVCAABIMcIACsp0ggBQvXICAA2JiQP//5NqAgAAoenA=
Date: Thu, 29 Aug 2019 10:20:06 +0000
Message-ID: <33c48f9e1bde4b179a625e1831e980cd@AMSPEX02CL03.citrite.net>
References: <20190730134419.2739-1-paul.durrant@citrix.com>
 <20190730134419.2739-4-paul.durrant@citrix.com>
 <1383f85e-bc08-c0be-bb02-f68b76ac1be5@suse.com>
 <0134b70d04b942b4b3ce65fd2340ff0c@AMSPEX02CL03.citrite.net>
 <b7ed5929dd864aefa93bb8572a7b5193@AMSPEX02CL03.citrite.net>
 <0854e0578b7445dbb7ac2e65ed81153b@AMSPEX02CL03.citrite.net>
 <b1036f3e-a2a4-306b-d37b-190936978ce5@suse.com>
 <4fe23438a0bf4248accdf0367c754662@AMSPEX02CL03.citrite.net>
 <355e06d7-06dc-14c2-7a4c-8310ea108492@suse.com>
In-Reply-To: <355e06d7-06dc-14c2-7a4c-8310ea108492@suse.com>
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
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI5IEF1Z3VzdCAyMDE5IDEwOjUyDQo+IFRvOiBQYXVsIER1
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
ZSB0YWJsZXMNCj4gDQo+IE9uIDI5LjA4LjIwMTkgMTE6MzMsIFBhdWwgRHVycmFudCB3cm90ZToN
Cj4gPiBUQkggSSd2ZSBzZWVuIHN1ZmZpY2llbnQgbnVtYmVycyBvZiBkb21haW4gY3JlYXRlIGZh
aWx1cmVzIHdoZW4gdXNpbmcNCj4gPiBhdXRvLWJhbGxvb25pbmcgdGhhdCBJIHN0b3BwZWQgdXNp
bmcgaXQgc29tZSB0aW1lIGFnbyAoYmVzaWRlcyB0aGUgZmFjdA0KPiA+IHRoYXQgaXQncyBzbG93
KS4gSWYgeW91J3JlIGhhcHB5IHdpdGggdGhlIHNpbXBsaXN0aWMNCj4gPiBkb3VibGUtdGhlLXBh
Z2UtdGFibGUtcmVzZXJ2YXRpb24gY2FsY3VsYXRpb24gdGhlbiBJIGNhbiBhZGQgdGhhdCBidXQN
Cj4gPiBJTU8gaXQgd291bGQgYmUgYmV0dGVyIHRvIGFkZCBhbm90aGVyIHBhdGNoIHRvIGp1c3Qg
cmVtb3ZlIGF1dG8tYmFsbG9vbmluZy4NCj4gDQo+IEknZCBub3QgYmUgb3Zlcmx5IGhhcHB5LCBi
dXQgSSBjb3VsZCBsaXZlIHdpdGggdGhpcy4gQnV0IHRoaXMgbmVlZHMNCj4gY29uc2VudCBieSBv
dGhlcnMsIG5vdCB0aGUgbGVhc3QgdGhlIHRvb2wgc3RhY2sgbWFpbnRhaW5lcnMuDQo+IA0KDQpP
ay4gSSdsbCBkZWFsIHdpdGggdGhhdCBsYXRlci4gTG9va2luZyBhZ2FpbiB0aG91Z2gsIEknbSBu
b3Qgc3VyZSB3aGF0IHlvdSBtZWFuIGJ5ICd0aGUgYW1vdW50IHJlc2VydmVkIGZvciBwYWdlIHRh
Ymxlcyc/IERvIHlvdSBtZWFuICdzaGFkb3dfbWVta2InIG9yIHNvbWV0aGluZyBlbHNlPw0KDQog
IFBhdWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
