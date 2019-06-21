Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3B74EC01
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 17:29:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heLQs-00067v-Bw; Fri, 21 Jun 2019 15:26:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/TYs=UU=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1heLQq-00067q-VT
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 15:26:29 +0000
X-Inumbo-ID: ef8bc8cd-9438-11e9-8980-bc764e045a96
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (unknown
 [40.107.73.72]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef8bc8cd-9438-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 15:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6BxiGcydu1DNr8xEI7yl0HijB1u82AnEFXADb8pdSQ=;
 b=hQYJWapCEGI2p27FkAvK9KTXxqzDM8xObn5xR3us6EfFcdV6yKVmEMPdsTubKczlgHVvP+duwVOegePod1FN3nfpelRP5El+5646QafYK01CZS/2kQDAG9pNAsCrGjyQzQoQoAC0xUlOXa7ozRgQXVtZysBrFRAuA7WcLt43/IM=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3915.namprd12.prod.outlook.com (10.255.174.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.10; Fri, 21 Jun 2019 15:26:26 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0%3]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 15:26:26 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH 3/5] x86/AMD: make C-state handling independent of Dom0
Thread-Index: AQHVEWGY1Hj53pTSVUKs8yFFp/PPUKaVMFSAgAFTMICACvrJgIABLSsAgABMloCAAtzcgIAAL/SAgABbWQCAAAhjgA==
Date: Fri, 21 Jun 2019 15:26:25 +0000
Message-ID: <20190621152623.GB19049@amd.com>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68F830200007800231B3B@prv1-mh.provo.novell.com>
 <483c4bbc-4915-48a3-9295-4d5a2bf6a02e@citrix.com>
 <5CFFA1B9020000780023704E@prv1-mh.provo.novell.com>
 <20190618172245.GA16087@amd.com>
 <5D09D43802000078002397E7@prv1-mh.provo.novell.com>
 <20190619155447.GA20907@amd.com>
 <5D0C7B3B0200007800239F12@prv1-mh.provo.novell.com>
 <20190621142925.GA19049@amd.com>
 <5D0CF016020000780023A30D@prv1-mh.provo.novell.com>
In-Reply-To: <5D0CF016020000780023A30D@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM6PR13CA0052.namprd13.prod.outlook.com
 (2603:10b6:5:134::29) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2960720f-fd9d-4518-af2c-08d6f65cd2e0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3915; 
x-ms-traffictypediagnostic: DM6PR12MB3915:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3915A33DB11FA4891ABC3276E5E70@DM6PR12MB3915.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(376002)(396003)(346002)(39860400002)(366004)(189003)(199004)(68736007)(71200400001)(6306002)(6486002)(966005)(66066001)(66946007)(33656002)(66476007)(229853002)(5660300002)(64756008)(81156014)(25786009)(66556008)(2906002)(6506007)(476003)(14444005)(54906003)(256004)(66446008)(52116002)(186003)(316002)(3846002)(6246003)(6116002)(486006)(26005)(6436002)(102836004)(2616005)(446003)(6512007)(386003)(73956011)(4326008)(53546011)(11346002)(8676002)(71190400001)(76176011)(86362001)(478600001)(1076003)(8936002)(72206003)(53936002)(305945005)(81166006)(99286004)(36756003)(6916009)(14454004)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3915;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: yN6aaA19vURj5QMkjdl0Pj59BE9aTQvstwHkevtRkuiBoSMFFxmOmsUhCUXlteO45jRMyhuNT5NPWm3xS+dr6dc8ldpuP0KoCVtYiKU8VjS5xDRhEowH6q/3gHsMm46/PTLR/w2fG4jZhpXypnYkqC+AwBIusHisY0MjAux0aRbrnMe9t0YtY7ysA9X7NEJpeydskXqp00XJG/jJ+f7glzLS/uFEfnGdKavdaDy+3l9WrNdw0D2A2Xns8uSvU34bYJ6Z1+4nTZTPo3j0N/Br+u9bk0/QLcEg/proc8VflSDQJWkJhnZHY8K4QPOdGEgdWLsH4RmLPkbUzi3+uZ8UhfJNrRZEU7RMkh82xuEuzqVOUqPQcnLwil4K/YZlZ0YHqRrhGYM9GonxqpHXMLXPkF1ByKvHgvZhJA6HucWvWKI=
Content-ID: <2E7368A4B13E35409802EEF7B5085734@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2960720f-fd9d-4518-af2c-08d6f65cd2e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 15:26:25.9215 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3915
Subject: Re: [Xen-devel] [PATCH 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMDg6NTY6MjJBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDIxLjA2LjE5IGF0IDE2OjI5LCA8QnJpYW4uV29vZHNAYW1kLmNvbT4gd3Jv
dGU6Cj4gPiBPbiBGcmksIEp1biAyMSwgMjAxOSBhdCAxMjozNzo0N0FNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMTkuMDYuMTkgYXQgMTc6NTQsIDxCcmlhbi5Xb29kc0Bh
bWQuY29tPiB3cm90ZToKPiA+PiA+IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDEyOjIwOjQwQU0g
LTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+ID4+ID4+PiBPbiAxOC4wNi4xOSBhdCAxOToy
MiwgPEJyaWFuLldvb2RzQGFtZC5jb20+IHdyb3RlOgo+ID4+ID4+ID4gT24gVHVlLCBKdW4gMTEs
IDIwMTkgYXQgMDY6NDI6MzNBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4gPj4g
Pj4+IE9uIDEwLjA2LjE5IGF0IDE4OjI4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gPj4gPj4gPj4gPiBPbiAyMy8wNS8yMDE5IDEzOjE4LCBKYW4gQmV1bGljaCB3cm90ZToK
PiA+PiA+PiA+PiA+PiBUQkQ6IFdlIG1heSB3YW50IHRvIHZlcmlmeSB0aGF0IEhMVCBpbmRlZWQg
aXMgY29uZmlndXJlZCB0byBlbnRlciBDQzYuCj4gPj4gPj4gPj4gPiAKPiA+PiA+PiA+PiA+IEkg
Y2FuJ3QgYWN0dWFsbHkgc3BvdCBhbnl0aGluZyB3aGljaCB0YWxrcyBhYm91dCBITFQgZGlyZWN0
bHkuICBUaGUKPiA+PiA+PiA+PiA+IGNsb3Nlc3QgSSBjYW4gcG9zdCBpcyBDRk9IIChjYWNoZSBm
bHVzaCBvbiBoYWx0KSB3aGljaCBpcyBhbgo+ID4+ID4+ID4+ID4gYXV0by10cmFuc2l0aW9uIGZy
b20gQ0MxIHRvIENDNiBhZnRlciBhIHNwZWNpZmljIHRpbWVvdXQsIGJ1dCB0aGUKPiA+PiA+PiA+
PiA+IHdvcmRpbmcgc3VnZ2VzdHMgdGhhdCBtd2FpdCB3b3VsZCBhbHNvIHRha2UgdGhpcyBwYXRo
Lgo+ID4+ID4+ID4+IAo+ID4+ID4+ID4+IFdlbGwsIEkgaGFkIGNvbWUgYWNyb3NzIGEgc2VjdGlv
biBkZXNjcmliaW5nIGhvdyBITFQgY2FuIGJlCj4gPj4gPj4gPj4gY29uZmlndXJlZCB0byBiZSB0
aGUgc2FtZSBhY3Rpb24gYXMgdGhlIEkvTyBwb3J0IHJlYWQgZnJvbSBvbmUKPiA+PiA+PiA+PiBv
ZiB0aGUgdGhyZWUgcG9ydHMgaW52b2x2ZWQgaW4gQy1zdGF0ZSBtYW5hZ2VtZW50Cj4gPj4gPj4g
Pj4gKENTdGF0ZUJhc2VBZGRyKzAuLi4yKS4gQnV0IEkgY2FuJ3Qgc2VlbSB0byBmaW5kIHRoaXMg
YWdhaW4uCj4gPj4gPj4gPj4gCj4gPj4gPj4gPj4gQXMgdG8gTVdBSVQgYmVoYXZpbmcgdGhlIHNh
bWUsIEkgZG9uJ3QgdGhpbmsgSSBjYW4gc3BvdCBwcm9vZgo+ID4+ID4+ID4+IG9mIHlvdXIgaW50
ZXJwcmV0YXRpb24gb3IgcHJvb2Ygb2YgQnJpYW4ncy4KPiA+PiA+PiA+IAo+ID4+ID4+ID4gSXQn
cyBub3QgcmVhbGx5IGRvY3VtZW50ZWQgY2xlYXJseS4gIEkgZ290IG15IGluZm9ybWF0aW9uIGZy
b20gdGhlIEhXCj4gPj4gPj4gPiBlbmdpbmVlcnMuICBJJ3ZlIGFscmVhZHkgcG9zdGVkIHdoYXQg
aW5mb3JtYXRpb24gSSBrbm93IHNvIEkgd29uJ3QKPiA+PiA+PiA+IHJlcGVhdCBpdC4KPiA+PiA+
PiAKPiA+PiA+PiBBdCBsZWFzdCBhIHBvaW50ZXIgdG8gd2hlcmUgeW91IGhhZCBzdGF0ZWQgdGhp
cyB3b3VsZCBoYXZlIGJlZW4KPiA+PiA+PiBuaWNlLiBJaXJjIHRoZXJlJ3Mgbm8gcHJvbW90aW9u
IGludG8gQ0M2IGluIHRoYXQgY2FzZSwgaW4gY29udHJhc3QKPiA+PiA+PiB0byBBbmRyZXcncyBy
ZWFkaW5nIG9mIHRoZSBkb2MuCj4gPj4gPiAKPiA+PiA+ICZtd2FpdF92MV9wYXRjaHNldAo+ID4+
IAo+ID4+IEhtbSwgSSd2ZSBsb29rZWQgdGhyb3VnaCB0aGUgcGF0Y2ggZGVzY3JpcHRpb25zIHRo
ZXJlIGFnYWluLCBidXQgSQo+ID4+IGNhbid0IGZpbmQgYW55IGV4cGxpY2l0IHN0YXRlbWVudCB0
byB0aGUgZWZmZWN0IG9mIHRoZXJlIGJlaW5nIG5vCj4gPj4gcHJvbW90aW9uIGludG8gZGVlcGVy
IHN0YXRlcyB3aGVuIHVzaW5nIE1XQUlULgo+ID4gCj4gPiBodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDIvbXNnMDIwMDcuaHRtbCAKPiAK
PiBUaGFua3MuIFllcywgaXQgbWF5IGJlIGltcGxpZWQgZnJvbSB0aGVyZSwgYnV0IHRvIG1lIGl0
J3Mgc3RpbGwgbm90Cj4gZXhwbGljaXQuIEFsc28gcmVjYWxsIHRoYXQgaXQgd2FzIEFuZHJldyBv
cmlnaW5hbGx5IGFza2luZyBpZiBhbnkKPiBwcm9tb3Rpb24gZnJvbSBDQzEgaXMgcG9zc2libGUu
IEknbSBmaW5lIHdpdGggeW91IHRlbGxpbmcgbWUgaXQncwo+IG5vdCwgYnV0IEFuZHJldyBtYXkg
c3RpbGwgd2FudCB5b3UgcG9pbnRpbmcgaGltIGF0IHdoZXJlIHRoaXMKPiBpcyB3cml0dGVuIGRv
d24uCj4gCj4gPiBTaW5jZSB5b3UncmUgdW5kZXIgTkRBLCBJIGNhbiBzZW5kIHlvdSB0aGUgZW1h
aWwgSSByZWNlaXZlZCBmcm9tIHRoZSBIVwo+ID4gZW5naW5lZXJpbmcgYnV0IGFzIGEgYmFzaWMg
cmVjYXA6Cj4gPiAKPiA+IElmIHRoZSBIVyBpcyBjb25maWd1cmVkIHRvIHVzZSBDQzYgZm9yIEhM
VCAoQ0M2IGlzIGVuYWJsZWQgYW5kIHNvbWUKPiA+IG90aGVyIE5EQSBiaXRzIHdoaWNoIGdldHMg
T1InZCB3aXRoIGZpcm13YXJlIHNvIHlvdSBjYW4gb25seQo+ID4gZnVuY3Rpb25hbGx5IENDNiBv
biBITFQgb2ZmLCBidXQgY2FuJ3QgbWFrZSBzdXJlIGl0J3Mgb24pLCB0aGVuIHRoZQo+ID4gZmxv
dyBpczoKPiA+IDEpIEhMVAo+ID4gMikgdGltZXIKPiA+IDMpIGZsdXNoIHRoZSBjYWNoZXMgZXRj
Cj4gPiA0KSBDQzYKPiA+IAo+ID4gVGhpcyBjYW4gYmUgaW50ZXJydXB0ZWQgdGhvdWdoLiAgVGhl
IEhXIGVuZ2luZWVyIHNhaWQgdGhhdCB3aGlsZSB0aGV5Cj4gPiBhcmVuJ3QgdGhlIHNhbWUgKGFz
IElPIGJhc2VkIEMtc3RhdGVzKSwgdGhleSBlbmQgdXAgYXQgdGhlIHNhbWUgcGxhY2UuCj4gPiAK
PiA+IFRoZSB3aG9sZSByZWFzb24gSExUIHdhcyBzZWxlY3RlZCB0byBiZSB1c2VkIGluIG15IHBh
dGNoZXMgaXMgYmVjYXVzZQo+ID4gd2UgY2FuJ3QgbG9vayBpbiB0aGUgQ1NUIHRhYmxlIGZyb20g
WGVuIGFuZCBpdCdzIGFsd2F5cyBzYWZlIHRvIHVzZSwKPiA+IGV2ZW4gaWYgQ0M2IGlzIGRpc2Fi
bGVkIGluIEJJT1MgKHdoaWNoIHdlIGNhbid0IHRlbGwpLiAgQXQgdGhpcyBwb2ludCwKPiA+IEkn
bSByZXBlYXRpbmcgb3VyIGNvbnZlcnNpb24gd2UgaGFkIGluIG15IHYxIHBhdGNoIHNldC4gIElm
IHlvdSBuZWVkCj4gPiBhbnkgZnVydGhlciBpbmZvLCBsZXQgbWUga25vdy4KPiAKPiBUaGFua3Ms
IEkgcmVjYWxsIGFsbCBvZiB0aGlzLiBJIGRvbid0IHNlZSB0aG91Z2ggaG93IGl0J3MgcmVsYXRl
ZCB0byB0aGUKPiBxdWVzdGlvbiBvZiB3aGV0aGVyIHRoZSBDUFUgd291bGQgcmVhbGx5IHJlbWFp
biBpbiBDMSB3aGVuIHVzaW5nCj4gTVdBSVQgKGkuZS4gZ29pbmcgYmFjayB0byBBbmRyZXcncyBv
cmlnaW5hbCBmaW5kaW5nIG9mIHByb21vdGlvbiBmcm9tCj4gQ0MxIHRvIENDNikuIE5vdyBJIGRv
IHJlYWxpemUgdGhhdCBDMSAhPSBDQzEsIGJ1dCB0aGlzIGRvZXNuJ3QgaGVscAo+IGNsYXJpZnlp
bmcgdGhpbmdzIGluIGFueSB3YXkuCj4gCj4gSmFuCj4gCj4gCgpOb3RlOiB0aGlzIGlzIGZvciBO
YXBsZXMgYW5kIFJvbWUgb25seS4KCkkgd2FzIGFuc3dlcmluZyB0aGUgSExUIHF1ZXN0aW9uLiAg
QnV0IG13YWl0IGNhbiBPTkxZIGJlIHVzZWQgZm9yCkNDMS9DMSBzaW5jZSB3ZSBkb24ndCBzdXBw
b3J0IHVzaW5nIG13YWl0IGZvciBDQzYvQzIgc2luY2UgaXQgc2h1dHMKZG93biB0aGUgY2FjaGUg
YW5kIG13YWl0IG1vbml0b3JzIHRoYXQuICBUaGVyZSBpcyBubyBwcm9tb3Rpb24gZnJvbQpDMS9D
QzEgdG8gQzIvQ0M2IHdpdGggbXdhaXQgc2luY2UgaXQgd291bGQgbG9zZSBpdCdzIG1ldGhvZCBv
ZiB3YWtpbmcKdXAuICBXaGVuIHlvdSBlbnRyeSBDMS9DQzEgdXNpbmcgbXdhaXQsIGl0IHN0YXlz
IGluIEMxL0NDMS4gIEkgd2lsbAplbWFpbCBhIEhXIGVuZ2luZWVyIGNvbmZpcm1pbmcgdGhpcyBi
dXQgSSdkIGJlIGV4dHJlbWVseSBzdXJwcmlzZWQgaXQKeW91IGNvdWxkIGJlIHByb21vdGVkIGZy
b20gQzEvQ0M2IHRvIEMyL0NDNiB3aGVuIHVzaW5nIG13YWl0LgoKLS0gCkJyaWFuIFdvb2RzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
