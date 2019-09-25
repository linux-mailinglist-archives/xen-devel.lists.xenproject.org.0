Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B93B7BDA5C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 11:00:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD36c-0000pu-Ik; Wed, 25 Sep 2019 08:57:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6irf=XU=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1iD36b-0000pp-Mv
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 08:57:01 +0000
X-Inumbo-ID: 6fa87c56-df72-11e9-bf31-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by localhost (Halon) with ESMTPS
 id 6fa87c56-df72-11e9-bf31-bc764e2007e4;
 Wed, 25 Sep 2019 08:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1569401821;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=61Zkg3KQAu+TtqSXetY19ybCSJlY+BFos5/K62BU1YY=;
 b=f1lbJWS6aIcxLtLxXfRnZeldr5uKYdlQT6PGKaIStyWfI02st41cbJAd
 UoR8dTR0B2a45mYH8soXX47Pi+wDmOEfKKQ8Sj1gkxfKPEUJU8Dce6kvW
 C6YeSB1utred95DjhpqJIeL3SlTCoDFbY+/m+C87+dxKDG808/zlsVw5z 8=;
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
IronPort-SDR: 0mPjF4KRV3FF6haxAO1jdpWkRrn4PU4syrt/neZaszzgtsXb2TjYGEge5YzHnmK6EHwKfJGSxO
 NfWeFUtCiy2FDYDidM/J25RExv7K3asjrLNjXqU5k6Jls4W71WS6rODH2L5aRbbFOQiDSINeJW
 TZLkRPh/CURQR6TjI0Cum7H0mm/QbN8NLp6PX7LTejokYnkd6PTy4/GHWaMOTivjVgaKt3O5sa
 rG02L0wOfyv+KnlhQgEFIJka6LzgYMe8Ak8rAqg0/u6gnR3fLM7/ljoeau0X+YSf7Ez0m8qta2
 sa4=
X-SBRS: 2.7
X-MesageID: 6101779
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,547,1559534400"; 
   d="scan'208";a="6101779"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v13 0/4] add per-domain IOMMU control
Thread-Index: AQHVbg2Z91+gZvcE2UG2jzrPcpRppKc8HWgw///hpgCAACJVgA==
Date: Wed, 25 Sep 2019 08:56:55 +0000
Message-ID: <23dec58404634921a595653f8a5ea504@AMSPEX02CL03.citrite.net>
References: <20190918104113.3294-1-paul.durrant@citrix.com>
 <013c45a9490e413cb97abb02cef960bc@AMSPEX02CL03.citrite.net>
 <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
In-Reply-To: <dcfdf2ab-8c64-ee63-637f-b0517087e8b5@suse.com>
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, David Scott <dave@recoil.org>, "Tim
 \(Xen.org\)" <tim@xen.org>, George Dunlap <George.Dunlap@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI1IFNlcHRlbWJlciAyMDE5IDA5OjUxDQo+IFRvOiBQYXVs
IER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBQZXRyZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIu
Y29tPjsgQW5kcmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IEFudGhv
bnkgUGVyYXJkIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcA0KPiA8
R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPjsgSWFuIEphY2tzb24gPElhbi5KYWNrc29uQGNpdHJp
eC5jb20+OyBSb2dlciBQYXUgTW9ubmUNCj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgVm9sb2R5
bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0uY29tPjsgU3RlZmFubyBTdGFiZWxs
aW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsgS29ucmFkUnplc3p1dGVrIFdpbGsgPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+OyBEYXZpZCBTY290dA0KPiA8ZGF2ZUByZWNvaWwub3JnPjsg
VGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPjsgVGltIChYZW4ub3JnKSA8dGlt
QHhlbi5vcmc+OyBXZWkgTGl1DQo+IDx3bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1k
ZXZlbF0gW1BBVENIIHYxMyAwLzRdIGFkZCBwZXItZG9tYWluIElPTU1VIGNvbnRyb2wNCj4gDQo+
IE9uIDI1LjA5LjIwMTkgMTA6NDAsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBQaW5nPyBJIGRv
bid0IHRoaW5rIHRoaXMgc2VyaWVzIGlzIGF3YWl0aW5nIGFueSBtb3JlIGFja3MuDQo+IA0KPiBJ
IGRpZCBlbnVtZXJhdGUgdGhlIG90aGVyIGRheSBvbiBpcmMgd2hhdCBpcyBzdGlsbCBtaXNzaW5n
IGFjY29yZGluZw0KPiB0byBteSByZWNvcmRzLg0KDQpPaCwgSSBtdXN0IGhhdmUgZHJvcHBlZCBv
ZmYgYW4gbWlzc2VkIHRoYXQuIENvbm5lY3Rpdml0eSBjYW4gYmUgc29tZXdoYXQgZmxha2V5IGhl
cmUgaW4gdGhlIG9mZmljZSA6LSgNCg0KPiBXb3VsZCB5b3UgbWluZCBwb2ludGluZyBtZSBhdCBh
IGxpYnhsIG1haW50YWluZXIgYWNrDQo+IGZvciBwYXRjaCAxPyBJIHRoaW5rIEkndmUgbWFuYWdl
ZCB0byBzcG90IHRoZSBtaXNzaW5nIG9uZSBmb3IgcGF0Y2ggMywNCj4gd2hpY2ggaHVuZyBvZmYg
YSAiUkVQT1NUIiB0aHJlYWQuIEFuZCBJIHJlYWxpemUgSSB3YXMgd3JvbmdseSBsb29raW5nDQo+
IGZvciBhIHRvb2wgc3RhY2sgbWFpbnRhaW5lciBhY2sgZm9yIHBhdGNoIDQsIHdoZW4gYSBsaWJ4
bCBvbmUgaXMNCj4gc3VmZmljaWVudCBhbmQgYWxyZWFkeSB0aGVyZS4NCg0KSSB0aG91Z2h0IEkn
ZCBoYWQgYW4gdG9vbHN0YWNrIGFjayBvbiBwYXRjaCAjMSBidXQgbm93IHRoYXQgSSBsb29rIGFn
YWluLCB5b3UncmUgcmlnaHQuLi4gaXQncyBzdGlsbCBtaXNzaW5nLiBJJ2xsIGNoYXNlIHRoYXQg
b25lLg0KDQpUaGFua3MsDQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
