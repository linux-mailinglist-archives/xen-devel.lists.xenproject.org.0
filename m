Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66D8F708
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 00:33:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyOGO-0007ld-NV; Thu, 15 Aug 2019 22:30:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6icJ=WL=amd.com=brian.woods@srs-us1.protection.inumbo.net>)
 id 1hyOGN-0007lY-FH
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 22:30:31 +0000
X-Inumbo-ID: 49a1f86a-bfac-11e9-a661-bc764e2007e4
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (unknown
 [40.107.77.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49a1f86a-bfac-11e9-a661-bc764e2007e4;
 Thu, 15 Aug 2019 22:30:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ccs44e2KIGlKzYQF5FV25zI3eo2YDnnu1jxsH0Byrq9rsm4qc9gL6dya2nhICsHkJZnvPYt6RnSqXymNW6moDXevmRNtmVmEMuY+DBQ8VrLc87eMPChOXZeYLC8tySkYGT/PteOkqqdjJ184Li2ftO5hBp9I6QCa3f6mjIKDdrtK7svimi2T+ZnfTXaRjNMIkUapGrQRk2v+ERLVS+X6YMKUeLRNenPkzls7naec7bkDs48Gcaz87QEFZ1bR+7UVInI7n7BR8Eb/zhsADDySvLv4bToZfxhrv6iSpdbwmjPfmW2H9cy8VoPkv+UaQlqNyI+lmGT7/yYFnJJ8IAk5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAZRPY+Tip73c68G1q9qjeA2kAMzIxx4CHamGd7GxmE=;
 b=mZuPwbD3FNgUHRzWtxMWZ07B9gJFpUsviw8wIPvAynh0NztzJ/EcZlI8voPSqnU7D7bTNO8LpTb6t3rrH1WeDMoahLuP1vpL+Ma95U84/ttbKlerGSykZjQASG5Py7eZx6WCLebygK170suobvwHlvObXQc+USnoHSIBNllHIUBJ8Xjr/5PiJrVWmpQq8bemylUx8XvUinqZN92HRPfHGb5Ykc2GLW9/OKtqXG53vg39cXCjvBL5A3gJoMU+N6ApfWM9JLH2V38eKmbBkdlvt9INDYzzkovIkopS1oAiaBLL/sXNuGzP8pZPSan8kCbYVrAFVvhB367RZJyRjc95yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xAZRPY+Tip73c68G1q9qjeA2kAMzIxx4CHamGd7GxmE=;
 b=0YIbMwVSKE+i4twCfTHIMQ+QMz6VdblJNuvwEOjBsMWAM0Hda0O7LycELgg8iLttGAx/tnkKDktd65hO4FCouY7mJ6HeNTEdk52AiEUfzo9rP+1a7J8D6rGh968eFLLhIatikV6vzEhS/gCgl0obQLV6pojKvPmrOdPFT70gTfs=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB4252.namprd12.prod.outlook.com (10.141.184.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Thu, 15 Aug 2019 22:30:28 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::ddb6:7854:6d0c:3090]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::ddb6:7854:6d0c:3090%3]) with mapi id 15.20.2157.021; Thu, 15 Aug 2019
 22:30:28 +0000
From: "Woods, Brian" <Brian.Woods@amd.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v5 00/10] AMD IOMMU: further improvements
Thread-Index: AQHVTFerOTnOqyqtc0+kQpYiykkBxab82WGA
Date: Thu, 15 Aug 2019 22:30:28 +0000
Message-ID: <20190815223025.GA29402@amd.com>
References: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
In-Reply-To: <5a4d4a61-a543-c657-8458-cbc6b5a8a633@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0201CA0029.namprd02.prod.outlook.com
 (2603:10b6:803:2e::15) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f58769a6-fdcd-42ee-514f-08d721d02c97
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB4252; 
x-ms-traffictypediagnostic: DM6PR12MB4252:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB4252943C385BE764997782D9E5AC0@DM6PR12MB4252.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(199004)(189003)(8676002)(316002)(5024004)(4326008)(6436002)(256004)(71200400001)(71190400001)(26005)(229853002)(102836004)(6506007)(52116002)(6246003)(386003)(14454004)(6512007)(6486002)(76176011)(186003)(86362001)(478600001)(99286004)(54906003)(53936002)(476003)(6916009)(66556008)(5660300002)(66476007)(11346002)(1076003)(486006)(2616005)(66446008)(3846002)(7736002)(64756008)(81166006)(36756003)(446003)(81156014)(66066001)(305945005)(25786009)(2906002)(6116002)(66946007)(33656002)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB4252;
 H:DM6PR12MB3515.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lydnw+AbYHoPAiIHczDLPo6LyKbusEHqL7rW1QvIZIcPWUqMNnenxNZzsW9GHW5fL8EM320a4m8zyw/0usNBPLTQJ57F5yJ2dL+Jyi7HbpInCHrjyyY2Rf9aoPXiwDPwaIgySRhQKkeJEsRaAVdaTHazc/+I/1d3RCKSAHfq3bsJbf4dHAV45ThzvWwtzcLg8B3E23FDAoNZEqmWtoXcPrpis5znVz318y/MOzGFM4d+NGRqCP785LYc0c2pqnz7PXIEMvYnpQka7kFqTVvaUIVofRXaI8WaTvZj6gFpw8pIVLhE3JGXfw6FdsR0N7DZEFtSao9TYMSztiaGeRl9k97xTQshBNe1IBQw03vUyOXXS4F0zjUFozVZ3QZk+/DKj1LZmm3Gc+HRomQoqbE5LNCbHXgcM3Cb73ZEzOnQLs0=
Content-ID: <DDEF6783DFD32547A150FEEDDF985D1D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f58769a6-fdcd-42ee-514f-08d721d02c97
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 22:30:28.3281 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VpcM1ceIWfQ0c2YpPiFRTKS/HphGHKFWozV0zTta+GhQi8Ux/EgEkhjYvYE/Q8r/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4252
Subject: Re: [Xen-devel] [PATCH v5 00/10] AMD IOMMU: further improvements
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Woods,
 Brian" <Brian.Woods@amd.com>, "Suthikulpanit,
 Suravee" <Suravee.Suthikulpanit@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBBdWcgMDYsIDIwMTkgYXQgMDM6MDU6MzZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT25seSB0aGUgZmlyc3QgcGF0Y2ggaGVyZSBpcyBsZWZ0IGZyb20gdjQsIGV2ZXJ5dGhp
bmcgZWxzZSBpcyBuZXcsCj4geWV0IHN0aWxsIHJlbGF0ZWQuIFRoZSBtYWluIGdvYWwgaXMgdG8g
cmVkdWNlIHRoZSBodWdlIG1lbW9yeQo+IG92ZXJoZWFkIHRoYXQgd2UndmUgbm90aWNlZC4gT24g
dGhlIHdheSB0aGVyZSBhIG51bWJlciBvZiBvdGhlcgo+IHRoaW5ncyB3ZXJlIG9uY2UgYWdhaW4g
bm90aWNlZC4gVW5mb3J0dW5hdGVseSBiZWZvcmUgSSB3YXMgYWJsZSB0bwo+IGFsc28gdGVzdCB0
aGUgbGFzdCB0d28gcGF0Y2hlcyB0aGVyZSwgbXkgUm9tZSBib3ggYnJva2UgYWdhaW4uCj4gSGVu
Y2UgdGhlc2UgdHdvIHBhdGNoZXMgaGF2ZSBiZWVuIHRlc3RlZCBvbiBhIChsZXNzIGFmZmVjdGVk
KQo+IEZhbTE1IHN5c3RlbSBvbmx5Lgo+IAo+IDAxOiBtaXNjZWxsYW5lb3VzIERURSBoYW5kbGlu
ZyBhZGp1c3RtZW50cwo+IDAyOiBkcm9wIHN0cmF5ICJlbHNlIgo+IDAzOiBkb24ndCBmcmVlIHNo
YXJlZCBJUlQgbXVsdGlwbGUgdGltZXMKPiAwNDogaW50cm9kdWNlIGEgInZhbGlkIiBmbGFnIGZv
ciBJVlJTIG1hcHBpbmdzCj4gMDU6IGxldCBjYWxsZXJzIG9mIGFtZF9pb21tdV9hbGxvY19pbnRy
ZW1hcF90YWJsZSgpIGhhbmRsZSBlcnJvcnMKPiAwNjogZG9uJ3QgYmxpbmRseSBhbGxvY2F0ZSBp
bnRlcnJ1cHQgcmVtYXBwaW5nIHRhYmxlcwo+IDA3OiBtYWtlIHBoYW50b20gZnVuY3Rpb25zIHNo
YXJlIGludGVycnVwdCByZW1hcHBpbmcgdGFibGVzCj4gMDg6IHg4Ni9QQ0k6IHJlYWQgTVNJLVgg
dGFibGUgZW50cnkgY291bnQgZWFybHkKPiAwOTogcmVwbGFjZSBJTlRSRU1BUF9FTlRSSUVTCj4g
MTA6IHJlc3RyaWN0IGludGVycnVwdCByZW1hcHBpbmcgdGFibGUgc2l6ZXMKPiAKPiBGdWxsIHNl
dCBvZiBwYXRjaGVzIG9uY2UgYWdhaW4gYXR0YWNoZWQgaGVyZSBkdWUgdG8gc3RpbGwgdW5yZXNv
bHZlZAo+IGVtYWlsIGlzc3VlcyBvdmVyIGhlcmUuCj4gCj4gSmFuCj4gCgpJIGRvbid0IHRoaW5r
IEkgaGF2ZSBlbm91Z2ggdGltZSBoZXJlIGxlZnQgdG8gcmV2aWV3IHRoZXNlLCBidXQgSSd2ZQp0
ZXN0ZWQgdGhlbSB2aWEgUENJIGRldmljZSBwYXNzdGhyb3VnaCBvbiBhbiBBTUQgUm9tZSBzeXN0
ZW0uCgotLSAKQnJpYW4gV29vZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
