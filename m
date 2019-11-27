Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C223B10ACA3
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 10:34:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZtfR-0008Qw-FE; Wed, 27 Nov 2019 09:31:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dC4D=ZT=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1iZtfP-0008Qp-QE
 for xen-devel@lists.xen.org; Wed, 27 Nov 2019 09:31:24 +0000
X-Inumbo-ID: ac140298-10f8-11ea-a3af-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.47]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ac140298-10f8-11ea-a3af-12813bfff9fa;
 Wed, 27 Nov 2019 09:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGJC/2gN1xDkrxVeXw9vK+z6Sb2YLbNqAD1ViDEw0C1BdSaYfkZo3LTx2Llun+1McfSUW+I+UlVrLu13aqNtbU8eX6QY8aaVD8A1x7p1nn8uQ38hc2kO8CEiy8rZ3YwtXzORY7B/wlboZp0wdGpv+bWJIjvHE+WrocxLWDj2O+XhJZutSXXVluFma+msozMJfU/PIyujecW9llz2KGw1Ftr+wjHckAKHTDiCrrmdRBGmKT5PpsUv+ezqlJpi1IO81BNO8/r70QixkHFlmUBOIVnekdFETuNgfnQfvV/WsC0I06J6sVLWVpsAO964x9K/x8puTRDL0HnPecLlt6JRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emVlMHBQr2jjqOnrf7Ay+4eMDwZHwZMHNXh+O63vkFA=;
 b=GpZNLkOYHTUhakdz4qZkXQeRDdsxnGrcQurynvAga8QKrprqcVK9PGcTjl9scYDtLaOoKRd3gj1/MUpokx/XR7hjXsbWY+qvLg+jkxlXhmogA8AbbwugBzHcBVLEP2XSbyqbJkC0tgd7Kb9Ii+ik+oLuBGd+H9nlk3I0Zvmjfo/1F8/hTVnIgE7MEkWWzd2h+dF8YFyw9HlHwqNQR/Aiczkbj349rWY6lWimTXtjN+c/14CIanbfWbTXJ/EJTLD0V/ziA88gs5krd0LLC0LeWgWEfacZjkKuzZQvwZXQNrwvqOFyAmMYc51Ig8LCrNwkCHzmsK6eU88N0AEMvrYFrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=emVlMHBQr2jjqOnrf7Ay+4eMDwZHwZMHNXh+O63vkFA=;
 b=bwd17CZ21egUEU+sA0Pv5qGPPHv0O6Byolcn/zc2ZyKqZbCPw4yGVr9O+ddSoIwyYNc2TnkYACWEQa0sdNGIK9hfCkQQ8XLNI886dRIT610ZD9lXI+9k1yc3bfH33OnTqeB+5UIYJ7TYRnLXdA90XttxZ+m0E0qQPercn2lb6h8=
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5475.eurprd04.prod.outlook.com (20.178.113.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Wed, 27 Nov 2019 09:31:20 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2474.023; Wed, 27 Nov 2019
 09:31:20 +0000
From: Peng Fan <peng.fan@nxp.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Thread-Topic: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
Thread-Index: AQHVoQigeBpkjI1AYkOsm95VpW/YYaeXj4KAgAZiwICAAAEwAIAAKeCAgAAMKICAAF/UAIAAPyvQ
Date: Wed, 27 Nov 2019 09:31:20 +0000
Message-ID: <AM0PR04MB4481C1F43E0827D5652148F488440@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20191122080226.6817-1-peng.fan@nxp.com>
 <alpine.DEB.2.21.1911221105360.11302@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1911261241260.8205@sstabellini-ThinkPad-T480s>
 <942a60db-fd30-a63e-25b1-e6b739b17c4e@xen.org>
 <alpine.DEB.2.21.1911261306370.8205@sstabellini-ThinkPad-T480s>
 <e98515e2-8e2e-569a-557e-523e9f134bef@xen.org>
 <13d490f1-cd9e-e2aa-d118-2c96cf03eb9b@suse.com>
In-Reply-To: <13d490f1-cd9e-e2aa-d118-2c96cf03eb9b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peng.fan@nxp.com; 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0ec4bd00-e7ea-4b17-1ef1-08d7731c8f9e
x-ms-traffictypediagnostic: AM0PR04MB5475:|AM0PR04MB5475:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB54758A7C8441915BA8F8E01188440@AM0PR04MB5475.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 023495660C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(199004)(189003)(52314003)(76116006)(6506007)(53546011)(14454004)(71200400001)(26005)(64756008)(6436002)(186003)(6306002)(9686003)(55016002)(102836004)(86362001)(54906003)(25786009)(110136005)(71190400001)(11346002)(446003)(2906002)(7696005)(66556008)(8936002)(3846002)(99286004)(66446008)(66476007)(66946007)(6116002)(5660300002)(66066001)(45080400002)(6246003)(14444005)(256004)(44832011)(74316002)(7736002)(305945005)(478600001)(76176011)(316002)(8676002)(81166006)(229853002)(4326008)(33656002)(966005)(81156014)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB5475;
 H:AM0PR04MB4481.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VWu9bRmLRcO8iHZyBx19+HupYIiYc26SmnC6iImQWdssN7QbadRZzJG3sTTXcIZYgk4wRMuklS33NSc8r18ROQaCjRrsCfMyo4DSkngq2qYKBV5ztI5S2orLXh3dZ7LR3OXLoAKbv2HhBMxb+RAeD29G8Hk+W8DQtOS8N/JEG/4yfroDDjoTp6LDjdeDmS+TBxL4509//3ulM6cktYPF9IoEDzGifqouRUyawPCneM7o5eWwDF8ThSq6OFmVdSJ2LPnyAVmi6TH6mxUiKNzZh3pDjyRqE7NkkzUx9/JtCwd2jHJtKEFUWnqk55iMWu5EEwxuyU89qUdtqnCl6Po7gkRVAfiO2gvGizVp/MEH610Ee+th5JTYi/p4bi1oeLEHGZou0F8ySNHswEeWbi/uf7mPsWEhFKbH0cZqXL3aMSPlmJ4RZvsriwRWl+xxtIPm
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec4bd00-e7ea-4b17-1ef1-08d7731c8f9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2019 09:31:20.0798 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0KDY+8AiksWUuy/DZLEgvwLV3yROzQsLuwhItkhKBd+zRFPpTz7pdTc88vjZmWMb+aOaRlC2/yt/ejHyrUxDQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5475
Subject: Re: [Xen-devel] [PATCH V2] arch: arm: vgic-v3: fix GICD_ISACTIVER
 range
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
Cc: "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Alice Guo <alice.guo@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gW1BBVENIIFYyXSBhcmNoOiBhcm06IHZnaWMtdjM6
IGZpeCBHSUNEX0lTQUNUSVZFUg0KPiByYW5nZQ0KPiANCj4gT24gMjcuMTEuMTkgMDE6MDEsIEp1
bGllbiBHcmFsbCB3cm90ZToNCj4gPiBIaSwNCj4gPg0KPiA+IE9uIDI2LzExLzIwMTkgMjM6MTcs
IFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gPj4gT24gVHVlLCAyNiBOb3YgMjAxOSwgSnVs
aWVuIEdyYWxsIHdyb3RlOg0KPiA+Pj4gSGksDQo+ID4+Pg0KPiA+Pj4gT24gMjYvMTEvMjAxOSAy
MDo0MywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiA+Pj4+ICsgSnVlcmdlbg0KPiA+Pj4+
DQo+ID4+Pj4gSSBtaXNzZWQgdGhhdCB5b3Ugd2VyZW4ndCBpbiBDQyB0byB0aGUgb3JpZ2luYWwg
cGF0Y2gsIHNvcnJ5Lg0KPiA+Pj4+IEkgdGhpbmsgdGhpcyBwYXRjaCBzaG91bGQgZ28gaW4sIGFz
IG90aGVyd2lzZSBMaW51eCA1LjQgY291bGQgcnVuDQo+ID4+Pj4gaW50byBwcm9ibGVtcy4gSXQg
aXMgYWxzbyBhIHByZXR0eSBzdHJhaWdodGZvcndhcmQgNCBsaW5lcyBwYXRjaC4NCj4gPj4+DQo+
ID4+PiA1LjUgKG9yIDUuNikgaXMgbm90IGdvaW5nIHRvIHJ1biBvbiBYZW4gZm9yIG90aGVyIHJl
YXNvbnMgKHN0aWxsIGluDQo+ID4+PiB0aGUgdkdJQykuLi4gU28gSSB3b3VsZCBub3QgdmlldyB0
aGlzIGFzIGNyaXRpY2FsLg0KPiA+Pg0KPiA+PiA1LjUgaXMgbm90IG91dCB5ZXQsIGluIGZhY3Qs
IHRoZSBkZXYgd2luZG93IGhhcyBqdXN0IG9wZW5lZC4gSXNuJ3QNCj4gPj4geW91ciBzdGF0ZW1l
bnQgYSBiaXQgcHJlbWF0dXJlPw0KPiA+DQo+ID4gVGhlIEdJQ3Y0LjEgd29yayBbMV0gaXMgZ29p
bmcgdG8gcHJldmVudCBMaW51eCBib290aW5nIG9uIGFsbCBjdXJyZW50DQo+ID4gdmVyc2lvbnMg
b2YgWGVuLiBXaGlsZSBJIGNhbid0IGNvbmZpcm0gdGhpcyBpcyBnb2luZyB0byBiZSBtZXJnZWQg
aW4NCj4gPiA1LjUsIEkgY2FuIHRlbGwgeW91IHRoaXMgd2lsbCBicmVhay4NCj4gPg0KPiA+Pg0K
PiA+PiBJbiBhbnkgY2FzZSwgZXZlbiBpZiBwb3RlbnRpYWwgZnV0dXJlIExpbnV4IHJlbGVhc2Vz
IGNvdWxkIGhhdmUgb3RoZXINCj4gPj4gYWRkaXRpb25hbCBpc3N1ZXMsIEkgZG9uJ3QgdGhpbmsg
aXQgc2hvdWxkIGNoYW5nZSBvdXIgY3VycmVudCB2aWV3IG9uDQo+ID4+IHRoaXMgc3BlY2lmaWMg
aXNzdWUgd2hpY2ggYWZmZWN0cyA1LjQsIGp1c3QgcmVsZWFzZWQuDQo+ID4NCj4gPiBUaGUgcGF0
Y2ggaXMgZGVmaW5pdGVseSBub3QgYXMgc3RyYWlnaHRmb3J3YXJkIGFzIHlvdSBtYXkgdGhpbmsu
DQo+ID4gUGxlYXNlIHJlZmVyIHRvIHRoZSBkaXNjdXNzaW9uIHdlIGhhZCBvbiB0aGUgZmlyc3Qg
dmVyc2lvbi4gSSB2b2ljZWQNCj4gPiBjb25jZXJuIGFib3V0IHRoaXMgYXBwcm9hY2ggYW5kIGdh
dmUgcG9pbnQgd2hhdCBjb3VsZCBnbyB3cm9uZyB3aXRoDQo+IGhhcHBlbi4NCj4gPg0KPiA+IFRo
aXMgcGF0Y2ggbWF5IGJlIGJldHRlciB0aGFuIHRoZSBjdXJyZW50IHN0YXRlIChpLmUgY3Jhc2hp
bmcpLCBidXQNCj4gPiB0aGlzIHdhc24ndCB0ZXN0ZWQgZW5vdWdoIHRvIGNvbmZpcm0gdGhpcyBp
cyB0aGUgY29ycmVjdCB0aGluZ3MgdG8gZG8NCj4gPiBhbmQgbm8gb3RoZXIgYnVnIHdpbGwgYXBw
ZWFyIChJIGRvbid0IGJlbGlldmUgcmVhZGluZyBJKkFDVElWRVIgd2FzDQo+ID4gZXZlciB0ZXN0
ZWQgYmVmb3JlKS4NCj4gPg0KPiA+IEl0IGlzIGFuIGFubm95aW5nIGJ1ZywgYnV0IHRoaXMgaXMg
b25seSBhZmZlY3RpbmcgNS40IHdoaWNoIGhhcyBqdXN0DQo+ID4gYmVlbiByZWxlYXNlZC4gSXQg
ZmVlbHMgdG8gbWUgdGhpcyBpcyBhIGZhaXJseSByaXNreSBjaG9pY2UgdG8gbWVyZ2UNCj4gPiBp
dCBxdXRpZSBsYXRlIGluIHRoZSByZWxlYXNlIHdpdGhvdXQgYSBnb29kIGdyYXBzIG9mIHRoZSBw
cm9ibGVtIChzZWUgYWJvdmUpLg0KPiA+DQo+ID4gU28gSSB3b3VsZCBkZWZpbml0bHksIHByZWZl
ciBpZiB0aGlzIHBhdGNoIGlzIGdldHRpbmcgdGhyb3VnaCBiYWNrcG9ydA0KPiA+IG9uY2Ugd2Ug
Z2V0IG1vcmUgdGVzdGluZy4NCj4gPg0KPiA+IFdlIGNhbiBzdGlsbCBkb2N1bWVudCB0aGUgYnVn
IGluIHRoZSByZWxlYXNlIG5vdGUgYW5kIHBvaW50IHBlb3BsZSB0bw0KPiA+IHRoZSBwYXRjaC4N
Cj4gPg0KPiA+IEFueXdheSwgdGhpcyBpcyBKdWVyZ2VuIGNob2ljZSBoZXJlLiBCdXQgYXQgbGVh
c3Qgbm93IGhlIGhhcyB0aGUgZnVsbA0KPiA+IHBpY3R1cmUuLi4NCj4gPg0KPiA+IENoZWVycywN
Cj4gPg0KPiA+IFsxXQ0KPiA+IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmx3bi4NCj4gPg0KPiBuZXQlMkZBcnRpY2xlcyUy
RjgwMDQ5NCUyRiZhbXA7ZGF0YT0wMiU3QzAxJTdDcGVuZy5mYW4lNDBueHAuY28NCj4gbSU3Q2Rj
YQ0KPiA+DQo+IGRmYjM5MjQwNzQ5ZWU2NzVlMDhkNzcyZmNkM2JhJTdDNjg2ZWExZDNiYzJiNGM2
ZmE5MmNkOTljNWMzMDE2Mw0KPiA1JTdDMCU3DQo+ID4NCj4gQzAlN0M2MzcxMDQzMDI1MTk5OTY1
OTImYW1wO3NkYXRhPTdKdjJJaEk4SFpnQlRTdVl6a0VwbEZ5aFgxbHptdg0KPiBkNzN4YjUNCj4g
PiAyZDZFUlZRJTNEJmFtcDtyZXNlcnZlZD0wDQo+ID4NCj4gDQo+IFRoYW5rcywgSnVsaWVuLCBm
b3Igc2hhcmluZyB5b3VyIG9waW5pb24uDQo+IA0KPiBXaXRoIHRoYXQgc3RhdGVtZW50IEknZCBs
aWtlIHRvIGRlZmVyIHRoaXMgcGF0Y2ggdG8gNC4xNC4NCg0KQnV0IHdpdGhvdXQgdGhpcyBwYXRj
aCwgNS40IGtlcm5lbCB3aWxsIGNyYXNoLiBTbyB5b3UgcHJlZmVyDQp3ZSBkZXZlbG9wIHRoZSBz
b2x1dGlvbiBhcyBKdWxpZW4gc3VnZ2VzdGVkIGZvciA0LjEzPw0KDQpUaGFua3MsDQpQZW5nLg0K
DQo+IA0KPiANCj4gSnVlcmdlbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
