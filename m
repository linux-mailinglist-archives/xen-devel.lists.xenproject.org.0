Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CEE4BD5F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 17:58:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdcvH-0004kX-PA; Wed, 19 Jun 2019 15:54:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3it4=US=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hdcvF-0004kS-RU
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 15:54:53 +0000
X-Inumbo-ID: 9351e88f-92aa-11e9-8980-bc764e045a96
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe52::615])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9351e88f-92aa-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 15:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P/BWpSNjFRXCXY3YE1/1yppqBrHOGH7cApdf8t+N0R8=;
 b=Jos7FT4fsKLvTm8oyyCEzNIh9cWvPUctz1bX52q7+/legaILe/jPRxUxjFQZBrvGxSrYbfPaNFTkLexeYwugY0zEBoSxKfhEegLGIMBQjwr/+7Apc6FiUg0eHHjr8G9/Ob18gTLcPbGn8StlL0mLK2Nze8KjQjYhnQB8OpTRw6M=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB2986.namprd12.prod.outlook.com (20.178.29.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.11; Wed, 19 Jun 2019 15:54:50 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0%3]) with mapi id 15.20.1987.014; Wed, 19 Jun 2019
 15:54:50 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH 3/5] x86/AMD: make C-state handling independent of Dom0
Thread-Index: AQHVEWGY1Hj53pTSVUKs8yFFp/PPUKaVMFSAgAFTMICACvrJgIABLSsAgACgaIA=
Date: Wed, 19 Jun 2019 15:54:50 +0000
Message-ID: <20190619155447.GA20907@amd.com>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68F830200007800231B3B@prv1-mh.provo.novell.com>
 <483c4bbc-4915-48a3-9295-4d5a2bf6a02e@citrix.com>
 <5CFFA1B9020000780023704E@prv1-mh.provo.novell.com>
 <20190618172245.GA16087@amd.com>
 <5D09D43802000078002397E7@prv1-mh.provo.novell.com>
In-Reply-To: <5D09D43802000078002397E7@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM5PR1301CA0021.namprd13.prod.outlook.com
 (2603:10b6:4:2a::34) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9113e002-81b5-4b47-5478-08d6f4ce760f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2986; 
x-ms-traffictypediagnostic: DM6PR12MB2986:
x-microsoft-antispam-prvs: <DM6PR12MB2986198F3B8EDFBFFD65A037E5E50@DM6PR12MB2986.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0073BFEF03
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(376002)(366004)(136003)(346002)(189003)(199004)(33656002)(72206003)(66066001)(6436002)(305945005)(229853002)(36756003)(186003)(86362001)(66946007)(73956011)(53936002)(256004)(66446008)(66476007)(6512007)(14444005)(3846002)(64756008)(66556008)(6916009)(81156014)(81166006)(71200400001)(71190400001)(7736002)(4326008)(8676002)(6486002)(2906002)(316002)(478600001)(25786009)(53546011)(5660300002)(6506007)(6116002)(76176011)(102836004)(8936002)(99286004)(11346002)(26005)(386003)(446003)(2616005)(6246003)(1076003)(54906003)(486006)(68736007)(476003)(52116002)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2986;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VfGoJKte7LF9PZ6s4x1zWHcKp+CvhgLq6UlIt/y0dbsSI6/RpI/a4eFff9jYL2+r122R8kDvGuVuXqrFrmrOsaIevxYBR4D4zQMNydB4Vkp9vfVe7K4IYsxmuH7uK3ZpJA7EoCSQfEDSjb+Jn1x1iQeuMC4uUwqsz4wxqVEIVW4Z6024z2zyG14BEJRLfonjLp8wXa/5HskyGvRk/E5jzaNnhmsLLYyxN2auJTiUIhlm359CxVqiBFw02Nnrn4YVjprFNnABWZVR5t1jgPz9bxyh8swtBlSoYyo8m/T9xGPjIM8wWwMr7xllh4PPOic9kVUa2XR1tlrxkQG0f9jUuPejznYwsCW9uIcGZqFvXjMBE9d4eb1DBkkLUt5BOR9Wv1xchD4lanseGdxP8O4smvM7O10KjdQuyULSICeE5wA=
Content-ID: <C3602881D6EA3347A20CA09954DFD3E5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9113e002-81b5-4b47-5478-08d6f4ce760f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2019 15:54:50.3498 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2986
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

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMTI6MjA6NDBBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE4LjA2LjE5IGF0IDE5OjIyLCA8QnJpYW4uV29vZHNAYW1kLmNvbT4gd3Jv
dGU6Cj4gPiBPbiBUdWUsIEp1biAxMSwgMjAxOSBhdCAwNjo0MjozM0FNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMTAuMDYuMTkgYXQgMTg6MjgsIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPiA+PiA+IE9uIDIzLzA1LzIwMTkgMTM6MTgsIEphbiBCZXVs
aWNoIHdyb3RlOgo+ID4+ID4+IFRCRDogQ2FuIHdlIHNldCBsb2NhbF9hcGljX3RpbWVyX2MyX29r
IHRvIHRydWU/IEkgY2FuJ3Qgc2VlbSB0byBmaW5kIGFueQo+ID4+ID4+ICAgICAgc3RhdGVtZW50
IGluIHRoZSBCS0RHIC8gUFBSIGFzIHRvIHdoZXRoZXIgdGhlIExBUElDIHRpbWVyIGNvbnRpbnVl
cwo+ID4+ID4+ICAgICAgcnVubmluZyBpbiBDQzYuCj4gPj4gPiAKPiA+PiA+IFRoaXMgb3VnaHQg
dG8gYmUgZWFzeSB0byBkZXRlcm1pbmUuICBHaXZlbiB0aGUgZGVzY3JpcHRpb24gb2YgQ0M2Cj4g
Pj4gPiBmbHVzaGluZyB0aGUgY2FjaGUgYW5kIHBvd2VyIGdhdGluZyB0aGUgY29yZSwgSSdkIHNh
eSB0aGVyZSBpcyBhCj4gPj4gPiByZWFzb25hYmxlIGNoYW5jZSB0aGF0IHRoZSBMQVBJQyB0aW1l
ciBzdG9wcyBpbiBDQzYuCj4gPj4gCj4gPj4gQnV0ICJyZWFzb25hYmxlIGNoYW5jZSIgaXNuJ3Qg
ZW5vdWdoIGZvciBteSB0YXN0ZSBoZXJlLiBBbmQgZnJvbQo+ID4+IHdoYXQgeW91IGRlZHVjZSwg
dGhlIGFuc3dlciB0byB0aGUgcXVlc3Rpb24gd291bGQgYmUgIm5vIiwgYW5kCj4gPj4gaGVuY2Ug
c2ltcGx5IG5vIGNoYW5nZSB0byBiZSBtYWRlIGFueXdoZXJlLiAoSSBkbyB0aGluayB0aG91Z2gK
PiA+PiB0aGF0IGl0J3MgbW9yZSBjb21wbGljYXRlZCB0aGFuIHRoaXMsIGJlY2F1c2UgaWlyYyBt
dWNoIGFsc28gZGVwZW5kcwo+ID4+IG9uIHdoYXQgdGhlIGZpcm13YXJlIGFjdHVhbGx5IGRvZXMu
KQo+ID4gCj4gPiBUaGUgTEFQSUMgdGltZXIgbmV2ZXIgc3RvcHMgb24gdGhlIGN1cnJlbnRseSBw
bGF0Zm9ybXMgKE5hcGxlcyBhbmQKPiA+IFJvbWUpLiAgVGhpcyBpcyBhIGtub3dsZWRnYWJsZSBI
VyBlbmdpbmVlciBzby4KPiAKPiBUaGFua3MgLSBJJ3ZlIHRha2VuIG5vdGUgdG8gc2V0IHRoZSB2
YXJpYWJsZSBhY2NvcmRpbmdseSB0aGVuLgo+IAo+ID4+ID4+IFRCRDogV2UgbWF5IHdhbnQgdG8g
dmVyaWZ5IHRoYXQgSExUIGluZGVlZCBpcyBjb25maWd1cmVkIHRvIGVudGVyIENDNi4KPiA+PiA+
IAo+ID4+ID4gSSBjYW4ndCBhY3R1YWxseSBzcG90IGFueXRoaW5nIHdoaWNoIHRhbGtzIGFib3V0
IEhMVCBkaXJlY3RseS4gIFRoZQo+ID4+ID4gY2xvc2VzdCBJIGNhbiBwb3N0IGlzIENGT0ggKGNh
Y2hlIGZsdXNoIG9uIGhhbHQpIHdoaWNoIGlzIGFuCj4gPj4gPiBhdXRvLXRyYW5zaXRpb24gZnJv
bSBDQzEgdG8gQ0M2IGFmdGVyIGEgc3BlY2lmaWMgdGltZW91dCwgYnV0IHRoZQo+ID4+ID4gd29y
ZGluZyBzdWdnZXN0cyB0aGF0IG13YWl0IHdvdWxkIGFsc28gdGFrZSB0aGlzIHBhdGguCj4gPj4g
Cj4gPj4gV2VsbCwgSSBoYWQgY29tZSBhY3Jvc3MgYSBzZWN0aW9uIGRlc2NyaWJpbmcgaG93IEhM
VCBjYW4gYmUKPiA+PiBjb25maWd1cmVkIHRvIGJlIHRoZSBzYW1lIGFjdGlvbiBhcyB0aGUgSS9P
IHBvcnQgcmVhZCBmcm9tIG9uZQo+ID4+IG9mIHRoZSB0aHJlZSBwb3J0cyBpbnZvbHZlZCBpbiBD
LXN0YXRlIG1hbmFnZW1lbnQKPiA+PiAoQ1N0YXRlQmFzZUFkZHIrMC4uLjIpLiBCdXQgSSBjYW4n
dCBzZWVtIHRvIGZpbmQgdGhpcyBhZ2Fpbi4KPiA+PiAKPiA+PiBBcyB0byBNV0FJVCBiZWhhdmlu
ZyB0aGUgc2FtZSwgSSBkb24ndCB0aGluayBJIGNhbiBzcG90IHByb29mCj4gPj4gb2YgeW91ciBp
bnRlcnByZXRhdGlvbiBvciBwcm9vZiBvZiBCcmlhbidzLgo+ID4gCj4gPiBJdCdzIG5vdCByZWFs
bHkgZG9jdW1lbnRlZCBjbGVhcmx5LiAgSSBnb3QgbXkgaW5mb3JtYXRpb24gZnJvbSB0aGUgSFcK
PiA+IGVuZ2luZWVycy4gIEkndmUgYWxyZWFkeSBwb3N0ZWQgd2hhdCBpbmZvcm1hdGlvbiBJIGtu
b3cgc28gSSB3b24ndAo+ID4gcmVwZWF0IGl0Lgo+IAo+IEF0IGxlYXN0IGEgcG9pbnRlciB0byB3
aGVyZSB5b3UgaGFkIHN0YXRlZCB0aGlzIHdvdWxkIGhhdmUgYmVlbgo+IG5pY2UuIElpcmMgdGhl
cmUncyBubyBwcm9tb3Rpb24gaW50byBDQzYgaW4gdGhhdCBjYXNlLCBpbiBjb250cmFzdAo+IHRv
IEFuZHJldydzIHJlYWRpbmcgb2YgdGhlIGRvYy4KPiAKPiBKYW4KPiAKCiZtd2FpdF92MV9wYXRj
aHNldAoKLS0gCkJyaWFuIFdvb2RzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
