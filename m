Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ED14EAA4
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 16:31:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heKXk-0000nQ-VE; Fri, 21 Jun 2019 14:29:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/TYs=UU=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1heKXj-0000nL-Ax
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 14:29:31 +0000
X-Inumbo-ID: faa05b05-9430-11e9-8980-bc764e045a96
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4a::626])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id faa05b05-9430-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 14:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ZeRUHuwLXSt1P6nPM0PW7h8PCmQeQbHPIgA5ubyCfY=;
 b=htZiL5FNr5BXv9ni94YHBaWmVj8d+x0OMii30C/8Pt08O6JmsW3rpOpVwPr4y0X3WMlHbfthGHFcl1FjQQLkxtmuG6uJsrxvKj3uzGEIbCuqKAs1nQ9uRtmyMxuwL3w/guaD0syUiIgSbuXo5pElIT05ngMr7d6zhjoWDNL2utY=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3913.namprd12.prod.outlook.com (10.255.174.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Fri, 21 Jun 2019 14:29:28 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::9dea:57a2:93ff:57b0%3]) with mapi id 15.20.1987.014; Fri, 21 Jun 2019
 14:29:28 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH 3/5] x86/AMD: make C-state handling independent of Dom0
Thread-Index: AQHVEWGY1Hj53pTSVUKs8yFFp/PPUKaVMFSAgAFTMICACvrJgIABLSsAgABMloCAAtzcgIAAg8cA
Date: Fri, 21 Jun 2019 14:29:28 +0000
Message-ID: <20190621142925.GA19049@amd.com>
References: <5CE68CD30200007800231B01@prv1-mh.provo.novell.com>
 <5CE68F830200007800231B3B@prv1-mh.provo.novell.com>
 <483c4bbc-4915-48a3-9295-4d5a2bf6a02e@citrix.com>
 <5CFFA1B9020000780023704E@prv1-mh.provo.novell.com>
 <20190618172245.GA16087@amd.com>
 <5D09D43802000078002397E7@prv1-mh.provo.novell.com>
 <20190619155447.GA20907@amd.com>
 <5D0C7B3B0200007800239F12@prv1-mh.provo.novell.com>
In-Reply-To: <5D0C7B3B0200007800239F12@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DM6PR02CA0122.namprd02.prod.outlook.com
 (2603:10b6:5:1b4::24) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bd9bb28-5e63-4cf6-acbd-08d6f654dde9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3913; 
x-ms-traffictypediagnostic: DM6PR12MB3913:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3913CB96855AF89EDF8F064EE5E70@DM6PR12MB3913.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0075CB064E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(396003)(39860400002)(346002)(366004)(376002)(189003)(199004)(66556008)(71190400001)(486006)(33656002)(25786009)(66066001)(8936002)(11346002)(6306002)(5660300002)(186003)(6436002)(6512007)(476003)(2616005)(54906003)(81156014)(71200400001)(6246003)(6916009)(8676002)(81166006)(4326008)(1076003)(446003)(76176011)(86362001)(7736002)(3846002)(305945005)(478600001)(256004)(6486002)(53936002)(2906002)(386003)(72206003)(6116002)(14444005)(26005)(53546011)(36756003)(68736007)(66946007)(966005)(99286004)(73956011)(6506007)(52116002)(14454004)(64756008)(66476007)(102836004)(66446008)(316002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3913;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0VYQ7iL3hkj1hXv6ycrUjE1owaB5/gvjQPkE7+OJ4+qCQP8wjsRct8/ZrkbTh6TNvnXx5bpeuqy1J4nBrpRAEIZh21yeuG2iZeVZaHyRN6Q16xdt8135uPtMyldwVLxYsy/cbCnmrQwIjfgONdRJts3Wa9gHUxFsqvdQVS+bPJEkvNoQ6EkIFugvhYerqMCTck+TfMFMN5Hav8kUbSbVxFiwKCrmeKNSnnDm1t8b2765F+vO4Ynyk5Pal4E18BRGd9P1hjMFP17Jw4VnZA/GEXmsY2VIPybgsvGMBWCMv2gQfQZrswdb3J5zZbtRNEzkuIXwbcmMCnd/HC79zx/WEDalRlpvqQUiX9GeQC3NhOVuoQ/WzAWVIDbJifkG8TVDvJnRxSvZ94A2F5OhNgAC1zgslhaQQKTo2On/7fwvkoY=
Content-ID: <DA658C5CC41F09429931D6FEA44DBAB8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd9bb28-5e63-4cf6-acbd-08d6f654dde9
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2019 14:29:28.2617 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3913
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

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTI6Mzc6NDdBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gPj4+IE9uIDE5LjA2LjE5IGF0IDE3OjU0LCA8QnJpYW4uV29vZHNAYW1kLmNvbT4gd3Jv
dGU6Cj4gPiBPbiBXZWQsIEp1biAxOSwgMjAxOSBhdCAxMjoyMDo0MEFNIC0wNjAwLCBKYW4gQmV1
bGljaCB3cm90ZToKPiA+PiA+Pj4gT24gMTguMDYuMTkgYXQgMTk6MjIsIDxCcmlhbi5Xb29kc0Bh
bWQuY29tPiB3cm90ZToKPiA+PiA+IE9uIFR1ZSwgSnVuIDExLCAyMDE5IGF0IDA2OjQyOjMzQU0g
LTA2MDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+ID4+ID4+PiBPbiAxMC4wNi4xOSBhdCAxODoy
OCwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdyb3RlOgo+ID4+ID4+ID4gT24gMjMvMDUv
MjAxOSAxMzoxOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPj4gPj4gPj4gVEJEOiBDYW4gd2Ugc2V0
IGxvY2FsX2FwaWNfdGltZXJfYzJfb2sgdG8gdHJ1ZT8gSSBjYW4ndCBzZWVtIHRvIGZpbmQgYW55
Cj4gPj4gPj4gPj4gICAgICBzdGF0ZW1lbnQgaW4gdGhlIEJLREcgLyBQUFIgYXMgdG8gd2hldGhl
ciB0aGUgTEFQSUMgdGltZXIgY29udGludWVzCj4gPj4gPj4gPj4gICAgICBydW5uaW5nIGluIEND
Ni4KPiA+PiA+PiA+IAo+ID4+ID4+ID4gVGhpcyBvdWdodCB0byBiZSBlYXN5IHRvIGRldGVybWlu
ZS4gIEdpdmVuIHRoZSBkZXNjcmlwdGlvbiBvZiBDQzYKPiA+PiA+PiA+IGZsdXNoaW5nIHRoZSBj
YWNoZSBhbmQgcG93ZXIgZ2F0aW5nIHRoZSBjb3JlLCBJJ2Qgc2F5IHRoZXJlIGlzIGEKPiA+PiA+
PiA+IHJlYXNvbmFibGUgY2hhbmNlIHRoYXQgdGhlIExBUElDIHRpbWVyIHN0b3BzIGluIENDNi4K
PiA+PiA+PiAKPiA+PiA+PiBCdXQgInJlYXNvbmFibGUgY2hhbmNlIiBpc24ndCBlbm91Z2ggZm9y
IG15IHRhc3RlIGhlcmUuIEFuZCBmcm9tCj4gPj4gPj4gd2hhdCB5b3UgZGVkdWNlLCB0aGUgYW5z
d2VyIHRvIHRoZSBxdWVzdGlvbiB3b3VsZCBiZSAibm8iLCBhbmQKPiA+PiA+PiBoZW5jZSBzaW1w
bHkgbm8gY2hhbmdlIHRvIGJlIG1hZGUgYW55d2hlcmUuIChJIGRvIHRoaW5rIHRob3VnaAo+ID4+
ID4+IHRoYXQgaXQncyBtb3JlIGNvbXBsaWNhdGVkIHRoYW4gdGhpcywgYmVjYXVzZSBpaXJjIG11
Y2ggYWxzbyBkZXBlbmRzCj4gPj4gPj4gb24gd2hhdCB0aGUgZmlybXdhcmUgYWN0dWFsbHkgZG9l
cy4pCj4gPj4gPiAKPiA+PiA+IFRoZSBMQVBJQyB0aW1lciBuZXZlciBzdG9wcyBvbiB0aGUgY3Vy
cmVudGx5IHBsYXRmb3JtcyAoTmFwbGVzIGFuZAo+ID4+ID4gUm9tZSkuICBUaGlzIGlzIGEga25v
d2xlZGdhYmxlIEhXIGVuZ2luZWVyIHNvLgo+ID4+IAo+ID4+IFRoYW5rcyAtIEkndmUgdGFrZW4g
bm90ZSB0byBzZXQgdGhlIHZhcmlhYmxlIGFjY29yZGluZ2x5IHRoZW4uCj4gPj4gCj4gPj4gPj4g
Pj4gVEJEOiBXZSBtYXkgd2FudCB0byB2ZXJpZnkgdGhhdCBITFQgaW5kZWVkIGlzIGNvbmZpZ3Vy
ZWQgdG8gZW50ZXIgQ0M2Lgo+ID4+ID4+ID4gCj4gPj4gPj4gPiBJIGNhbid0IGFjdHVhbGx5IHNw
b3QgYW55dGhpbmcgd2hpY2ggdGFsa3MgYWJvdXQgSExUIGRpcmVjdGx5LiAgVGhlCj4gPj4gPj4g
PiBjbG9zZXN0IEkgY2FuIHBvc3QgaXMgQ0ZPSCAoY2FjaGUgZmx1c2ggb24gaGFsdCkgd2hpY2gg
aXMgYW4KPiA+PiA+PiA+IGF1dG8tdHJhbnNpdGlvbiBmcm9tIENDMSB0byBDQzYgYWZ0ZXIgYSBz
cGVjaWZpYyB0aW1lb3V0LCBidXQgdGhlCj4gPj4gPj4gPiB3b3JkaW5nIHN1Z2dlc3RzIHRoYXQg
bXdhaXQgd291bGQgYWxzbyB0YWtlIHRoaXMgcGF0aC4KPiA+PiA+PiAKPiA+PiA+PiBXZWxsLCBJ
IGhhZCBjb21lIGFjcm9zcyBhIHNlY3Rpb24gZGVzY3JpYmluZyBob3cgSExUIGNhbiBiZQo+ID4+
ID4+IGNvbmZpZ3VyZWQgdG8gYmUgdGhlIHNhbWUgYWN0aW9uIGFzIHRoZSBJL08gcG9ydCByZWFk
IGZyb20gb25lCj4gPj4gPj4gb2YgdGhlIHRocmVlIHBvcnRzIGludm9sdmVkIGluIEMtc3RhdGUg
bWFuYWdlbWVudAo+ID4+ID4+IChDU3RhdGVCYXNlQWRkciswLi4uMikuIEJ1dCBJIGNhbid0IHNl
ZW0gdG8gZmluZCB0aGlzIGFnYWluLgo+ID4+ID4+IAo+ID4+ID4+IEFzIHRvIE1XQUlUIGJlaGF2
aW5nIHRoZSBzYW1lLCBJIGRvbid0IHRoaW5rIEkgY2FuIHNwb3QgcHJvb2YKPiA+PiA+PiBvZiB5
b3VyIGludGVycHJldGF0aW9uIG9yIHByb29mIG9mIEJyaWFuJ3MuCj4gPj4gPiAKPiA+PiA+IEl0
J3Mgbm90IHJlYWxseSBkb2N1bWVudGVkIGNsZWFybHkuICBJIGdvdCBteSBpbmZvcm1hdGlvbiBm
cm9tIHRoZSBIVwo+ID4+ID4gZW5naW5lZXJzLiAgSSd2ZSBhbHJlYWR5IHBvc3RlZCB3aGF0IGlu
Zm9ybWF0aW9uIEkga25vdyBzbyBJIHdvbid0Cj4gPj4gPiByZXBlYXQgaXQuCj4gPj4gCj4gPj4g
QXQgbGVhc3QgYSBwb2ludGVyIHRvIHdoZXJlIHlvdSBoYWQgc3RhdGVkIHRoaXMgd291bGQgaGF2
ZSBiZWVuCj4gPj4gbmljZS4gSWlyYyB0aGVyZSdzIG5vIHByb21vdGlvbiBpbnRvIENDNiBpbiB0
aGF0IGNhc2UsIGluIGNvbnRyYXN0Cj4gPj4gdG8gQW5kcmV3J3MgcmVhZGluZyBvZiB0aGUgZG9j
Lgo+ID4gCj4gPiAmbXdhaXRfdjFfcGF0Y2hzZXQKPiAKPiBIbW0sIEkndmUgbG9va2VkIHRocm91
Z2ggdGhlIHBhdGNoIGRlc2NyaXB0aW9ucyB0aGVyZSBhZ2FpbiwgYnV0IEkKPiBjYW4ndCBmaW5k
IGFueSBleHBsaWNpdCBzdGF0ZW1lbnQgdG8gdGhlIGVmZmVjdCBvZiB0aGVyZSBiZWluZyBubwo+
IHByb21vdGlvbiBpbnRvIGRlZXBlciBzdGF0ZXMgd2hlbiB1c2luZyBNV0FJVC4KPiAKPiBKYW4K
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAx
OS0wMi9tc2cwMjAwNy5odG1sCgpTaW5jZSB5b3UncmUgdW5kZXIgTkRBLCBJIGNhbiBzZW5kIHlv
dSB0aGUgZW1haWwgSSByZWNlaXZlZCBmcm9tIHRoZSBIVwplbmdpbmVlcmluZyBidXQgYXMgYSBi
YXNpYyByZWNhcDoKCklmIHRoZSBIVyBpcyBjb25maWd1cmVkIHRvIHVzZSBDQzYgZm9yIEhMVCAo
Q0M2IGlzIGVuYWJsZWQgYW5kIHNvbWUKb3RoZXIgTkRBIGJpdHMgd2hpY2ggZ2V0cyBPUidkIHdp
dGggZmlybXdhcmUgc28geW91IGNhbiBvbmx5CmZ1bmN0aW9uYWxseSBDQzYgb24gSExUIG9mZiwg
YnV0IGNhbid0IG1ha2Ugc3VyZSBpdCdzIG9uKSwgdGhlbiB0aGUKZmxvdyBpczoKMSkgSExUCjIp
IHRpbWVyCjMpIGZsdXNoIHRoZSBjYWNoZXMgZXRjCjQpIENDNgoKVGhpcyBjYW4gYmUgaW50ZXJy
dXB0ZWQgdGhvdWdoLiAgVGhlIEhXIGVuZ2luZWVyIHNhaWQgdGhhdCB3aGlsZSB0aGV5CmFyZW4n
dCB0aGUgc2FtZSAoYXMgSU8gYmFzZWQgQy1zdGF0ZXMpLCB0aGV5IGVuZCB1cCBhdCB0aGUgc2Ft
ZSBwbGFjZS4KClRoZSB3aG9sZSByZWFzb24gSExUIHdhcyBzZWxlY3RlZCB0byBiZSB1c2VkIGlu
IG15IHBhdGNoZXMgaXMgYmVjYXVzZQp3ZSBjYW4ndCBsb29rIGluIHRoZSBDU1QgdGFibGUgZnJv
bSBYZW4gYW5kIGl0J3MgYWx3YXlzIHNhZmUgdG8gdXNlLApldmVuIGlmIENDNiBpcyBkaXNhYmxl
ZCBpbiBCSU9TICh3aGljaCB3ZSBjYW4ndCB0ZWxsKS4gIEF0IHRoaXMgcG9pbnQsCkknbSByZXBl
YXRpbmcgb3VyIGNvbnZlcnNpb24gd2UgaGFkIGluIG15IHYxIHBhdGNoIHNldC4gIElmIHlvdSBu
ZWVkCmFueSBmdXJ0aGVyIGluZm8sIGxldCBtZSBrbm93LgoKLS0gCkJyaWFuIFdvb2RzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
