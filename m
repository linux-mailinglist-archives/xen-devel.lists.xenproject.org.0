Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAB690905
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 21:55:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyiG9-0000yk-S8; Fri, 16 Aug 2019 19:51:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Tg6x=WM=cs.rochester.edu=ejohns48@srs-us1.protection.inumbo.net>)
 id 1hyiG8-0000ya-Kw
 for xen-devel@lists.xenproject.org; Fri, 16 Aug 2019 19:51:36 +0000
X-Inumbo-ID: 405b5ba8-c05f-11e9-8bb9-12813bfff9fa
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (unknown
 [40.107.81.94]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 405b5ba8-c05f-11e9-8bb9-12813bfff9fa;
 Fri, 16 Aug 2019 19:51:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEPMz5BZiZIFOfKFvUNKFsb8zVcM2w2m3ubefJHXD4ffkfE+4+CRMLraYjqlgWg14bt1lIBaYQisF/JY5AXtFrPPZgQKJ85M0PfQL11CFNTb5eCWok0TUVt7/IANfawFNixyVZhfrdTAKU21jSnmh66poygV+I1/kk0B1KaEMMsgq0H+mVpBWt8/CQS6rQ9rmFfP31R+Sr2yYfzTfMGni/5Rg+xZpE1l4wEcYgEHDm8uup6a8xNJ6MqxYvozxZmG8/P8bnk5bTzeK1Y3CQp0D+pQInR51sF3E53WDD5Xz4Av0MPMnyhAnmeggvAXWnXsxi7QKS9Upr0KLOmw9xmZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KsxQaqHV9NnifNU/b4XAwdcqnaWFY46RHPI/WhkYVE=;
 b=Tyra+5Y8z775GZ4CDL5C32byQz9dqBLRFg1amEC3dG3K+OX4rb7Xncj//wipnbiwbhxztZh+FpU/vtfS3s61H6eSr4VkpTSMAnI0JG1gKvfWm9U3OnZLyNUMvSjrDHiHGeGmarvSzLB1CWXqgzgNq02I7hQ8XjCleX8gTyqAjK0wjtgbH3Q3CiPYUe5Y1cGv1afh+mDyTfRdMbCqdFk1XJMhIb88NY896XSuwoPknN2RJ3qBpVm8Loo+hkbvhOdgDDfKOABSG8llUdBiWsD4i7f1tafRo01A94VF5O+MJvAKscl3SkB5yzQG+sdmSvanMAKyj5XqyCsPkwrM6am9Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs.rochester.edu; dmarc=pass action=none
 header.from=cs.rochester.edu; dkim=pass header.d=cs.rochester.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.rochester.edu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KsxQaqHV9NnifNU/b4XAwdcqnaWFY46RHPI/WhkYVE=;
 b=TI/Y+AepJG/r/GNqDtr1wvQ1UMHAEQVstugUN4Q3lEcwP3YQeFVN5u0laHqtv7Sm0fBYQnbsrvHFff/x5eQtNc9Upcx2q9oc/wHO3BhIb43bCPhLgUYJreEzw78b69XuOo2iuSZXbo0PIh/3d1pEJH9+NWoIPppU0w4FVF7RE4g=
Received: from DM6PR07MB6396.namprd07.prod.outlook.com (20.179.69.208) by
 DM6PR07MB7274.namprd07.prod.outlook.com (10.141.8.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 19:51:33 +0000
Received: from DM6PR07MB6396.namprd07.prod.outlook.com
 ([fe80::5165:4092:7216:5c1c]) by DM6PR07MB6396.namprd07.prod.outlook.com
 ([fe80::5165:4092:7216:5c1c%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 19:51:33 +0000
From: "Johnson, Ethan" <ejohns48@cs.rochester.edu>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: More questions about Xen memory layout/usage, access to guest
 memory
Thread-Index: AQHVVGwBqHs+h+C1MEiqJCnmi4iK9w==
Date: Fri, 16 Aug 2019 19:51:33 +0000
Message-ID: <15a4c482-1207-1d8a-fd2a-dc4f25956c27@cs.rochester.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:208:91::11) To DM6PR07MB6396.namprd07.prod.outlook.com
 (2603:10b6:5:157::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ejohns48@cs.rochester.edu; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [192.5.53.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fb69260-0f6f-4843-ff2d-08d7228323a9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR07MB7274; 
x-ms-traffictypediagnostic: DM6PR07MB7274:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR07MB727487215467533C1804C604E4AF0@DM6PR07MB7274.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(42606007)(346002)(396003)(39860400002)(366004)(376002)(199004)(189003)(53754006)(6116002)(8676002)(14444005)(5640700003)(386003)(6436002)(256004)(6306002)(6512007)(25786009)(2501003)(966005)(186003)(88552002)(71190400001)(305945005)(71200400001)(2906002)(7736002)(66476007)(64756008)(66946007)(66446008)(66556008)(3846002)(53936002)(6486002)(86362001)(14454004)(66066001)(5660300002)(8936002)(81156014)(75432002)(26005)(81166006)(6506007)(31686004)(52116002)(316002)(2351001)(2616005)(476003)(486006)(31696002)(99286004)(786003)(102836004)(478600001)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR07MB7274;
 H:DM6PR07MB6396.namprd07.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: cs.rochester.edu does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aUKX9EFWbSBrSNh+rzLT7l2SAw3owUW06DYKxXrVVEXqAf41YTUr3eKLuvaVL6jWQ4++3qqEfje1egZdg+crgO4mKVbQqw1eSiFezY6PMGONdeogxpAYSWkKTlCZ3O1kuZDiOR3X4mlDqv4fStKkpUrurgYFsYFFoXa99C5AuPicTmgWzmhjB/jZZ/MEfUKS7FBgHzPVsAa0sNUxAC5Ep5TvKuFN1491iNgMMT8uRhKRfFi9eR0EPWoEbBA0rJuOHZ8g0gPmTvtzq+RSXJ+lw8yHkDsSjT+vo0afmuM30oanzqqgr/FMfR1gsy6UrcDLE6ip3HXhEVbDm+ZBvZUEqJxWcK4VdFc8r3QbU3AhsB7GwC4i6BxZHnDBe/Qkxwka6q7Pz/h+hQt4+XPrBAjz0w0IVZoj9TyVzMkOqDBOQWQ=
x-ms-exchange-transport-forked: True
Content-ID: <BA1F63E2DF88B148B60B980FF9FB95F8@namprd07.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: cs.rochester.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb69260-0f6f-4843-ff2d-08d7228323a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 19:51:33.2137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 374e17f4-cf11-4ce2-b3ef-5de76bf4ce41
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4qWSJIU0usboXFyCkvbgJqEyiscipsPhgEcXoTdCv1K6GZ3ByDy/GgEFt0VFgDEVjJkrUJGAjgNjSFHkW5LXt1jg/ku1U4h5nDyxHsz7050=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR07MB7274
Subject: [Xen-devel] More questions about Xen memory layout/usage,
 access to guest memory
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQpJIGhhdmUgc29tZSBmb2xsb3ctdXAgcXVlc3Rpb25zIGFib3V0IFhlbidzIHVz
YWdlIGFuZCBsYXlvdXQgb2YgbWVtb3J5LCANCmJ1aWxkaW5nIG9uIHRoZSBvbmVzIEkgYXNrZWQg
aGVyZSBhIGZldyB3ZWVrcyBhZ28gKHdoaWNoIHdlcmUgcXVpdGUgDQpoZWxwZnVsbHkgYW5zd2Vy
ZWQ6IHNlZSANCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4t
ZGV2ZWwvMjAxOS0wNy9tc2cwMTUxMy5odG1sIA0KZm9yIHJlZmVyZW5jZSkuIEZvciBjb250ZXh0
IG9uIHdoeSBJJ20gYXNraW5nIHRoZXNlIHF1ZXN0aW9ucywgSSdtIHVzaW5nIA0KWGVuIGFzIGEg
cmVzZWFyY2ggcGxhdGZvcm0gZm9yIGVuZm9yY2luZyBub3ZlbCBtZW1vcnkgcHJvdGVjdGlvbiBz
Y2hlbWVzIA0Kb24gaHlwZXJ2aXNvcnMgYW5kIGd1ZXN0cy4NCg0KMS4gWGVuIGl0c2VsZiBsaXZl
cyBpbiB0aGUgbWVtb3J5IHJlZ2lvbiBmcm9tIChvbiB4ODYtNjQpIDB4ZmZmZiA4MDAwIA0KMDAw
MCAwMDAwIC0gMHhmZmZmIDg3NzcgZmZmZiBmZmZmLCByZWdhcmRsZXNzIG9mIHdoZXRoZXIgaXQn
cyBpbiBQViBtb2RlIA0Kb3IgSFZNL1BWSC4gQ2xlYXJseSwgaW4gUFYgbW9kZSBhIHNlcGFyYXRl
IHNldCBvZiBwYWdlIHRhYmxlcyAoaS5lLiBDUjMgDQpyb290IHBvaW50ZXIpIG11c3QgYmUgdXNl
ZCBmb3IgZWFjaCBndWVzdC4gSXMgdGhhdCBhbHNvIHRydWUgb2YgdGhlIGhvc3QgDQoobm9uLWV4
dGVuZGVkLCBpLmUuIENSMyBpbiBWTVggcm9vdCBtb2RlKSBwYWdlIHRhYmxlcyB3aGVuIGFuIEhW
TS9QVkggDQpndWVzdCBpcyBydW5uaW5nPyBPciBpcyB0aGUgZG9tMCBwYWdlIHRhYmxlIGxlZnQg
aW4gcGxhY2UsIGFzc3VtaW5nIHRoZSANCmRvbTAgaXMgUFYsIHdoZW4gYW4gSFZNL1BWSCBndWVz
dCBpcyBydW5uaW5nLCBzaW5jZSBleHRlbmRlZCBwYWdpbmcgaXMgDQpub3cgYmVpbmcgdXNlZCB0
byBwcm92aWRlIHRoZSBndWVzdCdzIHZpZXcgb2YgbWVtb3J5PyBEb2VzIHRoaXMgY2hhbmdlIA0K
aWYgdGhlIGRvbTAgaXMgUFZIPw0KDQpPciwgdG8gYXNrIHRoaXMgZnJvbSBhbm90aGVyIGFuZ2xl
OiBpcyB0aGVyZSBldmVyIGFueXRoaW5nICpidXQqIFhlbiANCmxpdmluZyBpbiB0aGUgaG9zdC12
aXJ0dWFsIGFkZHJlc3Mgc3BhY2Ugd2hlbiBhbiBIVk0vUFZIIGd1ZXN0IGlzIA0KYWN0aXZlPyBB
bmQgaXMgdGhlIGFuc3dlciB0byB0aGlzIGRpZmZlcmVudCBkZXBlbmRpbmcgb24gd2hldGhlciB0
aGUgDQpIVk0vUFZIIGd1ZXN0IGlzIGEgZG9tVSB2cy4gYSBQVkggZG9tMD8NCg0KMi4gRG8gdGhl
IG1hcHBpbmdzIGluIFhlbidzIHNsaWNlIG9mIHRoZSBob3N0LXZpcnR1YWwgYWRkcmVzcyBzcGFj
ZSANCmRpZmZlciBhdCBhbGwgYmV0d2VlbiB0aGUgaG9zdCBwYWdlIHRhYmxlcyBjb3JyZXNwb25k
aW5nIHRvIGRpZmZlcmVudCANCmd1ZXN0cz8gSWYgdGhlIG1hcHBpbmdzIGFyZSBpbiBmYWN0IHRo
ZSBzYW1lLCBkb2VzIFhlbiB0aGVyZWZvcmUgc2hhcmUgDQpsb3dlci1sZXZlbCBwYWdlIHRhYmxl
IHBhZ2VzIGJldHdlZW4gdGhlIHBhZ2UgdGFibGVzIGNvcnJlc3BvbmRpbmcgdG8gDQpkaWZmZXJl
bnQgZ3Vlc3RzPyBJcyBhbnkgb2YgdGhpcyBkaWZmZXJlbnQgZm9yIFBWIHZzLiBIVk0vUFZIPw0K
DQozLiBVbmRlciB3aGF0IGNpcmN1bXN0YW5jZXMsIGFuZCBmb3Igd2hhdCBwdXJwb3NlcywgZG9l
cyBYZW4gdXNlIGl0cyANCmFiaWxpdHkgdG8gYWNjZXNzIGd1ZXN0IG1lbW9yeSB0aHJvdWdoIGl0
cyBkaXJlY3QgbWFwIG9mIGhvc3QtcGh5c2ljYWwgDQptZW1vcnk/IFNpbWlsYXJseSwgdG8gd2hh
dCBleHRlbnQgZG9lcyB0aGUgZG9tMCAob3Igb3RoZXIgc3VjaCANCnByaXZpbGVnZWQgZG9tYWlu
KSB1dGlsaXplICJmb3JlaWduIG1lbW9yeSBtYXBzIiB0byByZWFjaCBpbnRvIGFub3RoZXIgDQpn
dWVzdCdzIG1lbW9yeT8gSSB1bmRlcnN0YW5kIHRoYXQgdGhpcyBpcyBuZWNlc3Nhcnkgd2hlbiBj
cmVhdGluZyBhIA0KZ3Vlc3QsIGZvciBsaXZlIG1pZ3JhdGlvbiwgYW5kIGZvciBRRU1VIHRvIGVt
dWxhdGUgc3R1ZmYgZm9yIEhWTSBndWVzdHM7IA0KYnV0IGZvciBQVkgsIGlzIGl0IGV2ZXIgbmVj
ZXNzYXJ5IGZvciBYZW4gb3IgdGhlIGRvbTAgdG8gImZvcmNpYmx5IiANCmFjY2VzcyBhIGd1ZXN0
J3MgbWVtb3J5Pw0KDQooSSBhc2sgYmVjYXVzZSB0aGUgcmVzZWFyY2ggcHJvamVjdCBJJ20gd29y
a2luZyBvbiBpcyBzZWVraW5nIHRvIHByb3RlY3QgDQpndWVzdHMgZnJvbSBhIGNvbXByb21pc2Vk
IGh5cGVydmlzb3IgYW5kIGRvbTAsIHNvIEkgbmVlZCB0byBsaW1pdCANCm91dHNpZGUgYWNjZXNz
IHRvIGEgZ3Vlc3QncyBtZW1vcnkgdG8gZXhwbGljaXRseSBzaGFyZWQgcGFnZXMgdGhhdCB0aGUg
DQpndWVzdCB3aWxsIHRyZWF0IGFzIHVudHJ1c3RlZCAtIG5vdCBzdG9yaW5nIGFueSBzZWNyZXRz
IHRoZXJlLCB2ZXR0aW5nIA0KaW5wdXQgYXMgbmVjZXNzYXJ5LCBldGMuKQ0KDQo0LiBXaGF0IGZh
Y2lsaXRpZXMvcHJvY2Vzc2VzIGRvZXMgWGVuIHByb3ZpZGUgZm9yIFBWKEgpIGd1ZXN0cyB0byAN
CmV4cGxpY2l0bHkvdm9sdW50YXJpbHkgc2hhcmUgbWVtb3J5IHBhZ2VzIHdpdGggWGVuIGFuZCBv
dGhlciBkb21haW5zIA0KKGRvbTAsIGV0Yy4pPyBGcm9tIHdoYXQgSSBjYW4gZ2F0aGVyIGZyb20g
dGhlIGRvY3VtZW50YXRpb24sIGl0IHNvdW5kcyANCmxpa2UgImdyYW50IHRhYmxlcyIgYXJlIGlu
dm9sdmVkIGluIHRoaXMgLSBpcyB0aGF0IGhvdyBhIFBWLWF3YXJlIGd1ZXN0IA0KaXMgZXhwZWN0
ZWQgdG8gc2V0IHVwIHNoYXJlZCBtZW1vcnkgcmVnaW9ucyBmb3IgY29tbXVuaWNhdGlvbiB3aXRo
IG90aGVyIA0KZG9tYWlucyAocmluZyBidWZmZXJzLCBldGMuKT8gRG9lcyBhIFBWKEgpIGd1ZXN0
IG5lZWQgdG8gdm9sdW50YXJpbHkgDQplc3RhYmxpc2ggYWxsIGV4dGVybmFsIGFjY2VzcyB0byBp
dHMgcGFnZXMsIG9yIGlzIHRoZXJlIGV2ZXIgYSBzaXR1YXRpb24gDQp3aGVyZSBpdCdzIHRoZSBv
dGhlciB3YXkgYXJvdW5kIC0gd2hlcmUgWGVuIGl0c2VsZiBlc3RhYmxpc2hlcy9kZWZpbmVzIGEg
DQpyZWdpb24gYXMgc2hhcmVkIGFuZCB0aGUgZ3Vlc3QgaXMgcmVzcG9uc2libGUgZm9yIHRyZWF0
aW5nIGl0IGFjY29yZGluZ2x5Pw0KDQpBZ2FpbiwgdGhpcyBtb3N0bHkgYm9pbHMgZG93biB0bzog
dW5kZXIgd2hhdCBjaXJjdW1zdGFuY2VzLCBpZiBldmVyLCANCmRvZXMgWGVuIGV2ZXIgImZvcmNl
IiBhY2Nlc3MgdG8gYW55IHBhcnQgb2YgYSBndWVzdCdzIG1lbW9yeT8gDQooUGFydGljdWxhcmx5
IGZvciBQVihIKS4gQ2xlYXJseSB0aGF0IG11c3QgaGFwcGVuIGZvciBIVk0gc2luY2UsIGJ5IA0K
ZGVmaW5pdGlvbiwgdGhlIGd1ZXN0IGlzIHVuYXdhcmUgdGhlcmUncyBhIGh5cGVydmlzb3IgY29u
dHJvbGxpbmcgaXRzIA0Kd29ybGQgYW5kIGVtdWxhdGluZyBoYXJkd2FyZSBiZWhhdmlvciwgYW5k
IHRodXMgaXMgaW4gbm8gcG9zaXRpb24gdG8gDQpjb29wZXJhdGl2ZWx5L3ZvbHVudGFyaWx5IGdp
dmUgdGhlIGh5cGVydmlzb3IgYW5kIGRvbTAgYWNjZXNzIHRvIGl0cyANCm1lbW9yeS4pDQoNClRo
YW5rcyBhZ2FpbiBpbiBhZHZhbmNlIGZvciBhbnkgaGVscCBhbnlvbmUgY2FuIG9mZmVyIQ0KDQpT
aW5jZXJlbHksDQpFdGhhbiBKb2huc29uDQoNCi0tIA0KRXRoYW4gSi4gSm9obnNvbg0KQ29tcHV0
ZXIgU2NpZW5jZSBQaEQgc3R1ZGVudCwgU3lzdGVtcyBncm91cCwgVW5pdmVyc2l0eSBvZiBSb2No
ZXN0ZXINCmVqb2huczQ4QGNzLnJvY2hlc3Rlci5lZHUNCmV0aGFuam9obnNvbkBhY20ub3JnDQpQ
R1AgcHVibGljIGtleSBhdmFpbGFibGUgZnJvbSBwdWJsaWMgZGlyZWN0b3J5IG9yIG9uIHJlcXVl
c3QNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
