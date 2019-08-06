Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02053838C0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 20:41:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hv4LH-00044C-En; Tue, 06 Aug 2019 18:37:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3vC+=WC=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hv4LE-000447-Tc
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 18:37:49 +0000
X-Inumbo-ID: 494ee715-b879-11e9-8980-bc764e045a96
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (unknown
 [40.107.76.80]) by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 494ee715-b879-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 18:37:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eO05viA7y4t0jB1OJ7TxOL+XvIXZrkFZu3b3IiEgcYyYDR+Twn81HSZQ3+ikOPFriXeF21TNlZOvBkCEL2ABLLq2gWtTOWMFB5JLiCPc4SZdRC+Qd743G8JK2iNMwYC9zO4CpYKtR4/2Cr3lo7fA2UFfVokY3sBymzVW182RqDq4Nhft2SYA5Zaxxc2UmVeq3BzdA0VHSUzgmBcqvW39u48Zuxxzb4TzGNdgnYyh9DX1X1eq0X5dcULkEmDv8O6NaQ9DVuCUyX+zq2+mQy7BAoOaOStCnYZUsHJcbg4dSpQ5ODw94wF2eRCdDu+RtMKgrDvZU2bXBEsPyEsnEyTokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cwRaZ/X74YllNTIO55g5IATdN3MsU2KdOjMnMknFY4=;
 b=TOglyQ+3dWAXRH+Gb/OUvcY15YHlbOGnwl7llwEgeljACKz5fUb27Q30yG9NIWEfv9FogiLuOX3KDGNvSUSjF8hQJCYBSKucy8g4YPAY3jaAoFUa5VSO1gv7ddrkUl8h40VHQmp1NUNSfqJ7N7NeAK1Aec0cP9UyjjpQm7TwRTzoKTduVypzKktqcdHi7c4BlEmeCN9dgW+q6F6vl4l9j/UF4wGE8dc3c/zBhai+cjPyDjDy3OOxRNcDsP8COsSxSnNOp76E1L5gHJzbVfuQpY1jUhhrcGgKpPk9nXq6hE+21T+vnbAZ7KTCxU44Y5i/+gHISUCfw6aJi7iOF6UvyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3cwRaZ/X74YllNTIO55g5IATdN3MsU2KdOjMnMknFY4=;
 b=PBOLjDu6V0FrAug/wtxShtPaPXvyTW7klAQa5/79F72WXZ4KUd0KrLRNMDX02xcsNTAJAdQ1HdYueS6EXqcf5VC3BOkSRSAPhEtBkiwS+rPzZ57xX+RWVOBHQYmNL/5P/nz5bITFgwc/fAtweptqcW8AP5+y5pxlnuIELhFkRE8=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3226.namprd12.prod.outlook.com (20.179.105.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Tue, 6 Aug 2019 18:37:45 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::ddb6:7854:6d0c:3090]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::ddb6:7854:6d0c:3090%3]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 18:37:45 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] passthrough/amd: Drop "IOMMU not found" message
Thread-Index: AQHVS60UpmtD3GyXR0aOHOgRDYWsaqbudLUA
Date: Tue, 6 Aug 2019 18:37:45 +0000
Message-ID: <20190806183742.GC27866@amd.com>
References: <20190805164430.27121-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190805164430.27121-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0501CA0118.namprd05.prod.outlook.com
 (2603:10b6:803:42::35) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e130ee63-c749-4061-11b4-08d71a9d2c75
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR12MB3226; 
x-ms-traffictypediagnostic: DM6PR12MB3226:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB32269A256A80729D8BB8919DE5D50@DM6PR12MB3226.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(199004)(189003)(52314003)(66476007)(66946007)(14444005)(476003)(54906003)(64756008)(66556008)(36756003)(1076003)(256004)(66446008)(305945005)(2616005)(7736002)(486006)(3846002)(6116002)(186003)(68736007)(8676002)(316002)(81166006)(33656002)(6486002)(15650500001)(81156014)(6246003)(71200400001)(71190400001)(478600001)(52116002)(53936002)(25786009)(446003)(6512007)(386003)(6506007)(8936002)(14454004)(5660300002)(11346002)(86362001)(6436002)(66066001)(2906002)(6916009)(26005)(4326008)(76176011)(229853002)(99286004)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3226;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QnBTFMdmOuxXBGAAzOUZaBMAzrSWTq01FkS5malKLv9i5lOgCJBHoKio+dKlhWHIn/OVGYnX+aGYy/vs6BSYQ8aP8j2QAjmFKcI8OjTy0jK31eRdz1JKMtCgd8F0XyBAdp0v3EQ7vJj4vf70HOYhpAmztE0c8hMkZcfsbrEV1XQ82GIrrVvevugGOzvOFV4ObtTDnYfUT55NUn6ZKBjBo4rbCto2ZhloFeAOKO+lPNGH/UW5ki8rvLtjwWov2mv9lQJZ+PkgP4ryvbEwrhWfoK56UGRSa/B8AKvLviYDapgjLocaJV5zUnkWP3miTn45Tt+MpT9NMmHI0IxEbeyL+qq8Lyq6b4YngInUMrgu69og5H3shCM6LZ8dFJcnXFYgwwb2RKrzDU23jJEr6VRnR2YM7MufRYB+o8EkRQyM/pw=
Content-ID: <C11EEE67035D62468265FA0F50896F60@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e130ee63-c749-4061-11b4-08d71a9d2c75
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 18:37:45.6250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3226
Subject: Re: [Xen-devel] [PATCH] passthrough/amd: Drop "IOMMU not found"
 message
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
Cc: Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, "Woods,
 Brian" <Brian.Woods@amd.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBdWcgMDUsIDIwMTkgYXQgMDU6NDQ6MzBQTSArMDEwMCwgQW5keSBDb29wZXIgd3Jv
dGU6Cj4gU2luY2UgYy9zIDlmYTk0ZTEwNTg1ICJ4ODYvQUNQSTogYWxzbyBwYXJzZSBBTUQgSU9N
TVUgdGFibGVzIGVhcmx5IiwgdGhpcwo+IGZ1bmN0aW9uIGlzIHVuY29uZGl0aW9uYWxseSBjYWxs
ZWQgaW4gYWxsIGNhc2VzIHdoZXJlIGEgRE1BUiBBQ1BJIHRhYmxlCj4gZG9lc24ndCBleGlzdC4K
PiAKPiBBcyBhIGNvbnNlcXVuY2UsICJBTUQtVmk6IElPTU1VIG5vdCBmb3VuZCEiIGlzIHByaW50
ZWQgaW4gYWxsIGNhc2VzIHdoZXJlIGFuCj4gSU9NTVUgaXNuJ3QgcHJlc2VudCwgZXZlbiBvbiBu
b24tQU1EIHN5c3RlbXMuICBEcm9wIHRoZSBtZXNzYWdlIC0gaXQgaXNuJ3QKPiB0ZXJyaWJseSBp
bnRlcmVzdGluZyBhbnl3YXksIGFuZCBpcyBub3cgbWlzbGVhZGluZyBpcyBhIG51bWJlciBvZiBj
b21tb24KPiBjYXNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKQWNrZWQtYnk6IEJyaWFuIFdvb2RzIDxicmlhbi53b29kc0Bh
bWQuY29tPgoKPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IEND
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiBDQzogQm9yaXMgT3N0cm92c2t5IDxib3Jpcy5vc3Ryb3Zza3lAb3JhY2xl
LmNvbT4KPiBDQzogU3VyYXZlZSBTdXRoaWt1bHBhbml0IDxzdXJhdmVlLnN1dGhpa3VscGFuaXRA
YW1kLmNvbT4KPiBDQzogQnJpYW4gV29vZHMgPGJyaWFuLndvb2RzQGFtZC5jb20+Cj4gLS0tCj4g
IHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMgfCAxIC0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L2FtZC9wY2lfYW1kX2lvbW11LmMKPiBpbmRleCBiM2UxOTMzYjUzLi4zYmNmY2M4NDA0IDEwMDY0
NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMKPiAr
KysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9pb21tdS5jCj4gQEAgLTE1
NSw3ICsxNTUsNiBAQCBpbnQgX19pbml0IGFjcGlfaXZyc19pbml0KHZvaWQpCj4gIAo+ICAgICAg
aWYgKCAoYW1kX2lvbW11X2RldGVjdF9hY3BpKCkgIT0wKSB8fCAoaW9tbXVfZm91bmQoKSA9PSAw
KSApCj4gICAgICB7Cj4gLSAgICAgICAgcHJpbnRrKCJBTUQtVmk6IElPTU1VIG5vdCBmb3VuZCFc
biIpOwo+ICAgICAgICAgIGlvbW11X2ludHJlbWFwID0gMDsKPiAgICAgICAgICByZXR1cm4gLUVO
T0RFVjsKPiAgICAgIH0KPiAtLSAKPiAyLjExLjAKPiAKCi0tIApCcmlhbiBXb29kcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
