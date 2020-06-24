Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A02206D4B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jun 2020 09:08:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnzVN-0000zd-Gb; Wed, 24 Jun 2020 07:07:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iWQw=AF=nxp.com=peng.fan@srs-us1.protection.inumbo.net>)
 id 1jnzVM-0000zY-5Z
 for xen-devel@lists.xenproject.org; Wed, 24 Jun 2020 07:07:32 +0000
X-Inumbo-ID: 5e04580a-b5e9-11ea-bb8b-bc764e2007e4
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.82]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e04580a-b5e9-11ea-bb8b-bc764e2007e4;
 Wed, 24 Jun 2020 07:07:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/DYzwdMnvJ2TPy+wic8LeTaaEdVhKVZjgfIDTRm3AgCDZ8e0bK7UtIstzj4VPdJHuCIEVxibAtCKMs8QN4XqivMbMehIGlUkHagVEAn65uqgMiAd+yF3RmRpBTNllzNV2jrzbXHiKh84vA9PamVG5vEu0iEah2VcEmtwD4SJGyG1Y3KV5EZJR1hkiVlwMkOhhADUVaxJzyn1r81cxAHcfW5jx7qXneMogeX0jYYOWdZ7rZEHjNQ0FutHoPRzAUAfc+HoYlwYqJ2rpRm/DzzvakG7JY8nKRX+zsJkRsx8tG0vZWT0fl38KA4l73eWz1qAvlEoJenIPSoR4rNw1s6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhVCZHsTYAQ2sHAe79K3MDMengfDLUcty7W8L0dBlC4=;
 b=jXdIvLQfI/OGSCOjFbB6OEoCnv1WVRe/+eOexceVzmett4dfRPRjMIDCSzyCI2X+UekcQgu6Ae+ZMUfAIG5dHK1/rkSo0sA5tJhc0Ho13ItYzl/d9WBvixdJuO3yBTB1FeSKCYAHqEE/sxFBVXP8wjcxmo4bfi85+58RnsQkLfsqQQlknAVW/SfuxHw1SsekTnHcA5OLEWZUmhBBpvtJN3+H30u0/mlfw4cnxpRD1iy4o6oCW/dZcmZP/nNEZgMFW8G/+cKOZiyDFahvzG8UmKwvNbjGYd2HqH1mph0aOqlE+HadG0Z4gVOpXy3VJnHVmfVNO6HF/AnS+Z7HGxHrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhVCZHsTYAQ2sHAe79K3MDMengfDLUcty7W8L0dBlC4=;
 b=EVlnsduajgQ0q1FLE3tajHZxdCWuiRDnhCCmLQjqQqUzRWw+qlXDSqkO0ggTwHwzjNz/H8j/vGyl+mbV/1UKa+er0DH66dAfg3BjWpyr499lZvlf0j1I8vthZGTQ0weaTHL8ww54kgmKQqJRiuU1yQr4nKUPDxyeGtFlImi46IY=
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2872.eurprd04.prod.outlook.com (2603:10a6:4:98::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 07:07:28 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::2d36:b569:17c:7701%4]) with mapi id 15.20.3109.027; Wed, 24 Jun 2020
 07:07:28 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: RE: UEFI support in ARM DomUs
Thread-Topic: UEFI support in ARM DomUs
Thread-Index: AQHWN5exllox/cqJUUS0HFcLChNz8ajHt2rggADieACAAAFjAIAVVnEAgACes4CAAHgUgIAADcUAgAFjwoCABFLagIAABoCAgAABwICAADaWgIAAfiIAgABGNACAAZ5agIAADjmA
Date: Wed, 24 Jun 2020 07:07:28 +0000
Message-ID: <DB6PR0402MB27601E1DDED18CDBF3D6A18188950@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <DB6PR0402MB276072324DC3E1E9BD9A96BE88890@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <c3856c1f-52bf-92fd-5226-4b09229e2127@epam.com>
 <alpine.DEB.2.21.2006040829390.6774@sstabellini-ThinkPad-T480s>
 <d6b39cd7-eeaa-f82b-df62-051f9f715968@epam.com>
 <54dcfce1-c401-0581-8620-dc8790209a87@xen.org>
 <alpine.DEB.2.21.2006181444460.14005@sstabellini-ThinkPad-T480s>
 <CAJ=z9a1NtCr1MM7oUBUH3hgc8SL_K9jERy+NQ6pLzxNpGPpXzw@mail.gmail.com>
 <alpine.DEB.2.21.2006191020110.12730@sstabellini-ThinkPad-T480s>
 <c5905f40-6d0a-358f-35e4-239e88ace7d8@epam.com>
 <94bfe57c-c1be-62b4-3799-b90415264487@xen.org>
 <4ece84cf-dd68-6eb4-a0e2-e9008d264ba5@epam.com>
 <1a44c645-8c9a-93ce-8466-35c87eb4fca5@xen.org>
 <alpine.DEB.2.21.2006221419200.8121@sstabellini-ThinkPad-T480s>
 <271a4db0-5ce5-ba25-65e7-107c040f5069@epam.com>
 <a122102d-c023-0379-5d2c-b7b08d262844@epam.com>
In-Reply-To: <a122102d-c023-0379-5d2c-b7b08d262844@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 97110725-8bda-4bd0-b5f0-08d8180d4166
x-ms-traffictypediagnostic: DB6PR0402MB2872:
x-microsoft-antispam-prvs: <DB6PR0402MB2872A4675ED33FB75F52025E88950@DB6PR0402MB2872.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0444EB1997
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mThc62YMrQgp85/jKRdWrRoAk4HabB37fpGie+hkj9eU9n7IcQSmKhxo5dT14qlzFOWelWXfleJ16hDj6hL9jA/93RL1Zc6qn/6yocvtjG07EUYL0E8m9NDDn6V0bisE7xFS/EhKOF3zPfbp35MnRrcJsBuhfpqbMuEX/LnO9nS+qaBVRkHFwh3+aAUjXiALvFa5BfsR1zEiwz6DPsmIq9T7TGalhJ7QpG+IMjQIrxXPi79OVCqjqPDBuy1pBkCwkl4gb++y7Xzvn8OMZ8QC+jRImu6l/IxOi6v/b4Ybz+EzihpesWKvWnWCVFZeG7WWjH2z8NoYtSmA0UPBwiB4/ALkzhj2H5PuYKeQ5wbSONsPLgVZ7QHs0pWL8Y0DAvEOu7g4AG4FEJcZAHTZfLeVBw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB6PR0402MB2760.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(66556008)(66476007)(66946007)(64756008)(54906003)(33656002)(4326008)(26005)(7696005)(6506007)(186003)(53546011)(8676002)(8936002)(45080400002)(55016002)(316002)(83080400001)(478600001)(966005)(2906002)(52536014)(76116006)(83380400001)(9686003)(66446008)(7416002)(110136005)(71200400001)(5660300002)(86362001)(44832011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 2j4jyMbYo3nBeBtPVJ5O2S7k14otNi7e8BY+LJ0p7DY2jhbQAfWIVq2WDSIZ1DXUjissH63twQgpQ991Dnte1s0fWL13cK9VI8IMwMBGdZdcPCtfq3XuIOUGCzuhy2d6LEOp2SpMjiQk0pRVCjk13iF5x00nPjUcscXmLsujnxaCuFMVM9x9CwNJZ9N6ih1DH5m99Go0A5+dN+sYqVzgzdGuJbMAtpAZbse9wQeNCYiJj3TI/WJTnKbfIfJbLaAbzFusKgXVH6FAJMmtB12TGY1AafItEXhER70fTMNZk3RGGayB/f2QZ52DVlnxc4TBwiaVGORo1McCqUF1u1D/pkgonSHVTXhOJH7lOyAjFrByuTC//Qx4KDetTFAf1IKyY6Kg9cHja21lDHTE7ZKK/RlzCifxlXjHEn0xyZnNuDtb5aNiYKRkjrqeS1aOKKP44y+ORl+idSdo0tB3iVvU/gDJqFR0eqIRgqbSFOWhea4HUU0evX7a1t0+0jVHbTjG
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97110725-8bda-4bd0-b5f0-08d8180d4166
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2020 07:07:28.3227 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QUrnNIBP6Lg2ZRoIrkKgZ6PuVKbkrZ29xq+HjiUVtR24Acq5MmlhRtBtSgrxTSniDMZHJw319JfR6vV69uxkeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2872
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
 Juergen Gross <jgross@suse.com>, Oleksandr Andrushchenko <andr2000@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBTdWJqZWN0OiBSZTogVUVGSSBzdXBwb3J0IGluIEFSTSBEb21Vcw0KPiANCj4gDQo+IE9uIDYv
MjMvMjAgODozMSBBTSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+ID4NCj4gPiBP
biA2LzIzLzIwIDQ6MjAgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gPj4gT24gTW9u
LCAyMiBKdW4gMjAyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+Pj4+Pj4gRm9yIHRoZSBmaXJz
dCBwYXJ0IChfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fKSBJIHRoaW5rIHdlIGNhbg0KPiA+Pj4+
Pj4gcHJvdmlkZSBpdCB2aWENCj4gPj4+Pj4+DQo+ID4+Pj4+PiBDRkxBR1Mgb3Igc29tZXRoaW5n
LiBUaGlzIGNhbiBhbHNvIGJlIGRvbmUgZm9yIHRoZSBsb2NhdGlvbiBvZg0KPiA+Pj4+Pj4gWGVu
IGhlYWRlcnMuDQo+ID4+Pj4+IF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gc2hvdWxkIHdvcmsg
dGhyb3VnaCB0aGUgQ0ZMQUdTLiBBbg0KPiA+Pj4+PiBhbHRlcm5hdGl2ZSB3b3VsZCBiZSB0byBh
bGxvdyB0aGUgdXNlciB0byBzcGVjaWZ5IHRocm91Z2ggdGhlIEtjb25maWcuDQo+ID4+Pj4gWW91
IG1lYW4gc3BlY2lmeWluZyB2aWEgS2NvbmZpZyBzb21ldGhpbmcgbGlrZSAiMHgwMDA0MGQwMCI/
DQo+ID4+PiBQb3NzaWJseSB5ZXMuDQo+ID4+Pg0KPiA+Pj4+IEFuZCB3aGF0IGFib3V0IHRoZSBo
ZWFkZXJzPyBIb3cgd2lsbCB3ZSBwcm92aWRlIHRoZWlyIGxvY2F0aW9uIGlmDQo+ID4+Pj4gd2Ug
ZGVjaWRlIG5vdCB0byBpbmNsdWRlIHRob3NlDQo+ID4+Pj4NCj4gPj4+PiBpbiB0aGUgdHJlZT8N
Cj4gPj4+IEkgd291bGQgZG8gdGhyb3VnaCBLY29uZmlnIGFzIHdlbGwuDQo+ID4+IElmIHdlIHNw
ZWNpZnkgdGhlIGV4dGVybmFsIGxvY2F0aW9uIG9mIHRoZSBYZW4gaGVhZGVycyB2aWEgS2NvbmZp
ZywNCj4gPj4gaXQgc2VlbXMgdG8gbWUgdGhhdCB3ZSBzaG91bGQgYmUgYWJsZSB0byBkZXRlY3Qg
dGhlIGludGVyZmFjZSB2ZXJzaW9uDQo+ID4+IGF1dG9tYXRpY2FsbHkgZnJvbSBhbnkgTWFrZWZp
bGUgYXMgcGFydCBvZiB0aGUgYnVpbGQuIE5vIG5lZWQgdG8gYXNrDQo+ID4+IHRoZSB1c2VyLg0K
PiA+Pg0KPiA+PiBIb3dldmVyLCBpZiBPbGVrc2FuZHIgaXMgdGhpbmtpbmcgb2YgdXNpbmcgdGhl
IFhlbiBoZWFkZXJzIGZvciB0aGUNCj4gPj4gaHlwZXJjYWxscyBkZWZpbml0aW9ucywgdGhlbiBJ
IHRoaW5rIHdlIG1pZ2h0IG5vdCBuZWVkIGV4dGVybmFsDQo+ID4+IGhlYWRlcnMgYXQgYWxsIGJl
Y2F1c2UgdGhhdCBpcyBhIHN0YWJsZSBpbnRlcmZhY2UsIGFzIEp1bGllbiB3cm90ZS4NCj4gPj4g
V2UgY291bGQganVzdCBkZWZpbmUgb3VyIG93biBmZXcgaGVhZGVycyBmb3IganVzdCB3aGF0IHlv
dSBuZWVkIGxpa2UgTGludXgNCj4gZG9lcy4NCj4gPg0KPiA+IFRoaXMgaXMgYSBnb29kIGlkZWE6
IEknbGwgdHJ5IHRvIGdldCB0aGUgbWluaW1hbCBzZXQgb2YgaGVhZGVycyBmcm9tDQo+ID4gTGlu
dXgNCj4gPg0KPiA+IGluc3RlYWQgb2YgWGVuIGFzIHRob3NlIHNlZW0gdG8gYmUgd2VsbCBwcmVw
YXJlZCBmb3Igc3VjaCBhIHVzZS1jYXNlLg0KPiA+IFRoaXMNCj4gPg0KPiA+IHdheSB3ZSdsbCBo
YXZlIGhlYWRlcnMgaW4gVS1ib290IHRyZWUgYW5kIGd1YXJhbnRlZSB0aGF0IHdlIGhhdmUgYQ0K
PiA+IG1pbmltYWwNCj4gPg0KPiA+IHN1YnNldCB3aGljaCBpcyBlYXNpZXIgdG8gbWFpbnRhaW4u
IEknbGwga2VlcCB5b3UgdXBkYXRlZCBvbiB0aGUNCj4gPiBwcm9ncmVzcw0KPiANCj4gV2UndmUg
bWFuYWdlZCB0byBzdHJpcCB0aGUgaGVhZGVycyBhbmQgcmVtb3ZlIF9fWEVOX18gYW5kIHRoZSBy
ZXN0DQo+IGRlZmluaXRpb25zDQo+IA0KPiB3ZSB3ZXJlIHRhbGtpbmcgYWJvdXQuIFNvLCB0aGVz
ZSBhcmUgbm93IHRoZSBtaW5pbWFsIHJlcXVpcmVkIHNldCBvZiBoZWFkZXJzDQo+IA0KPiB0aGF0
IGFsbG93cyBVLWJvb3QgdG8gYnVpbGQgc2VyaWFsIGFuZCBibG9jayBkcml2ZXJzLiBQbGVhc2Ug
dGFrZSBhIGxvb2sgYXQgWzFdDQo+IA0KPiBQdWxsIHJlcXVlc3QgZm9yIGNvbW1lbnRzIGlzIGF0
IFsyXQ0KDQpUaGUgVS1Cb290IG5ldyBtZXJnZSB3aW5kb3cgd2lsbCBiZSBvcGVuIGluIDIwMjAv
Ny8xLCBzbyBJJ2Qgc3VnZ2VzdA0KdGhlIHBhdGNoc2V0IGdvZXMgdG8gVS1Cb290IG1haWwgbGlz
dCBmb3IgZGlzY3Vzc2lvbiBpZiB5b3Ugd2FubmEgdGhlIHBhdGNoZXMNCmdvbm5hIG1lcmdlZCBz
b29uLg0KDQpSZWdhcmRzLA0KUGVuZy4NCg0KPiANCj4gPg0KPiA+Pg0KPiA+PiBJZiB5b3UgY2Fu
IGRvIHRoYXQsIEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIGJlY2F1c2Ugd2UgZGVjb3VwbGUN
Cj4gPj4gdGhlIFVCb290IGJ1aWxkIGZyb20gdGhlIFhlbiBidWlsZCBjb21wbGV0ZWx5LiBXZSBk
b24ndCBldmVuIG5lZWQgdGhlDQo+ID4+IFhlbiB0cmVlIGNoZWNrZWQgb3V0IHRvIGJ1aWxkIFVC
b290LiBJdCB3b3VsZCBiZSBhIGh1Z2UgYWR2YW50YWdlDQo+ID4+IGJlY2F1c2UgaXQgbWFrZXMg
aXQgZmFyIGVhc2llciB0byBidWlsZC10ZXN0IGNoYW5nZXMgZm9yIG90aGVycyBpbg0KPiA+PiB0
aGUgY29tbXVuaXR5IHRoYXQgZG9uJ3Qga25vdyBhYm91dCBYZW4gYW5kIGFsc28gaXQgYmVjb21l
cyBmYXINCj4gPj4gZWFzaWVyIHRvIGludGVncmF0ZSBpbnRvIGFueSBidWlsZCBzeXN0ZW0uDQo+
IA0KPiBbMV0NCj4gaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNv
bS8/dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLg0KPiBjb20lMkZhbmRyMjAwMCUyRnUtYm9vdCUy
RnRyZWUlMkZwdmJsb2NrX3Vwc3RyZWFtX3YxJmFtcDtkYXRhPTANCj4gMiU3QzAxJTdDcGVuZy5m
YW4lNDBueHAuY29tJTdDNDA3ZDhhZjI0YTM2NDgzZmJkY2UwOGQ4MTgwNWVkODgNCj4gJTdDNjg2
ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzI4NTc2MTAyMTk3NQ0K
PiAxNjQmYW1wO3NkYXRhPTV2V2ZCYkxTY0lDWFBaV1UlMkJVM2I3RHlPTmNneFQ4aUlDc3hyd1Vi
T1JaWSUNCj4gM0QmYW1wO3Jlc2VydmVkPTANCj4gDQo+IFsyXQ0KPiBodHRwczovL2V1cjAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXRodWIu
DQo+IGNvbSUyRnhlbi10cm9vcHMlMkZ1LWJvb3QlMkZwdWxsJTJGMiZhbXA7ZGF0YT0wMiU3QzAx
JTdDcGVuZy5mYQ0KPiBuJTQwbnhwLmNvbSU3QzQwN2Q4YWYyNGEzNjQ4M2ZiZGNlMDhkODE4MDVl
ZDg4JTdDNjg2ZWExZDNiYzJiNA0KPiBjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2Mzcy
ODU3NjEwMjE5NzUxNjQmYW1wO3NkYXRhPSUyDQo+IEZtWGhlRXZLc3NMamphRktzSEJCYnFoJTJC
NzJqSDN1UW5FN2NwTjBKM2s4SSUzRCZhbXA7cmVzZXJ2ZWQ9MA0K

