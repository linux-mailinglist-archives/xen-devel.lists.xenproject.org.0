Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3901082D93
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 10:12:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huuWb-0007fO-Tp; Tue, 06 Aug 2019 08:08:53 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jalH=WC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huuWa-0007fJ-Hv
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 08:08:52 +0000
X-Inumbo-ID: 6c72b63e-b821-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6c72b63e-b821-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 08:08:51 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  6 Aug 2019 08:08:44 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 6 Aug 2019 08:00:31 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 6 Aug 2019 08:00:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pohg2THYS7wOowCriGip7Wjm+qVyhyZqMe4CdJhmt7Garq86j0htMvj6a6iJ5l0dgkk549RvhnLigCRBGd3BZnCcHnl6HPTG+DvHHCZlFdXNxcW5I1eBc4YWiunvy1xyrC3oXnBLACyvjjUQrBa2Eg0PNgHVrvMhuaVmnqFSbIyTC9VOIdpPGoo3ZBpdRJMtqKHTuK1k3RecJ01/jyQVk6u0en1YhL4qPTG6IR0agMJ3E/EklGxls839hyMySCFr0xqrDS+fszVcuiQa24kCLbB4tQKEUoCMsbBs9h2eU9sLBNR9LH/OSZGrU6hyGaszHcTjA1D3mViJ3yXxP0ENdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEhqiDFdsijSOaN4Yxk8npucZ1SEKJQONdKgxX9eE1M=;
 b=khrzTNmkBY6KmppnC/IpIjaH5MDQFqSbhOeankKDkc6LsHTy/0aXp7jewyPtPDjsJOEThHI5DF9K2QlCiGwnkbgoHstP+ZQcmn1xUHbUwiDSLjCqk+cfZi2RVUzxV1uJx1akUtOrxcxzm3D9iWP1W6EHz5YKLrxqEVYpYVFfDCDq1S2p4BzvEfWr8JxoCrnYbxzkBtkECWQMxaxRh/IxvjT+H3ES2krV2KJpYBFgroH90FIduNCKLrd3Qb7WPj2moO2NEk4JULmd7nxxIveKh2mGM/niIml1wophHusM/zNmHN1YB0MicsZxmjPFLpw2Pov5LAKRvZrFeRbXoC/nsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2655.namprd18.prod.outlook.com (20.179.84.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.16; Tue, 6 Aug 2019 08:00:30 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Tue, 6 Aug 2019
 08:00:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] [PATCH] passthrough/amd: Drop "IOMMU not found"
 message
Thread-Index: AQHVS60yXw5dFtHTpU+nYvOivnxFyKbtwqeA
Date: Tue, 6 Aug 2019 08:00:30 +0000
Message-ID: <deae1508-3596-5244-8486-4f9d631c7fcb@suse.com>
References: <20190805164430.27121-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190805164430.27121-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::22) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7bb3406a-d4c7-4e1e-04c5-08d71a44264d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2655; 
x-ms-traffictypediagnostic: MN2PR18MB2655:
x-microsoft-antispam-prvs: <MN2PR18MB2655AFBB0235B379A3FDDE21B3D50@MN2PR18MB2655.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0121F24F22
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(136003)(39860400002)(366004)(396003)(189003)(199004)(52314003)(6486002)(15650500001)(36756003)(66946007)(66066001)(102836004)(26005)(81166006)(4326008)(14454004)(54906003)(81156014)(8676002)(316002)(8936002)(229853002)(6246003)(2906002)(64756008)(3846002)(7736002)(305945005)(68736007)(25786009)(2616005)(476003)(446003)(11346002)(99286004)(66556008)(6116002)(66476007)(80792005)(478600001)(14444005)(31686004)(186003)(76176011)(66446008)(5660300002)(71200400001)(256004)(4744005)(71190400001)(486006)(86362001)(6506007)(386003)(31696002)(6436002)(6916009)(53936002)(52116002)(53546011)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2655;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nbW3JA+9SQwXTGOdE6MqugBCut8SDWjQaauPxlI0loz79bTKE4wU4MeS/30FroGiUhPCaBepg+OnsEFgpDbecn5nN0vYvDXRNgYRcxOnkaMgWDiUEHnKRWpnN/nxL248duo0OaAJGTxCy55o58KMA/WHY4EZaylKHW+aLvrwdtD9nByUbTEXjTsKlN1JIxCz4R7S30U0Z3mRTu8O0C7Pmtigoap+G/Eah/wIrPJaOGG42P8Y+N97zsQ3l6HJnRB1lXmCBE0PwcAWStV0gbYCIkKT6Fnq16H9J1IyoqS3LZHcjVept/5CqcmdnaH54sF8SiM7ANuOBZJBraZE3YSby9o1Mqjnag91rBjZMs+a0FI+/pAmrV6n33qa6zaP1JdqKDL6x3RMcobhMAIx1VPr2iqM3YcN2Ke8W5uTXBXNGZM=
Content-ID: <EFE934719DBB8F42853A0FB1D48FAF4B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb3406a-d4c7-4e1e-04c5-08d71a44264d
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2019 08:00:30.5560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2655
X-OriginatorOrg: suse.com
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
Cc: Wei Liu <wl@xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxODo0NCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gU2luY2UgYy9zIDlm
YTk0ZTEwNTg1ICJ4ODYvQUNQSTogYWxzbyBwYXJzZSBBTUQgSU9NTVUgdGFibGVzIGVhcmx5Iiwg
dGhpcw0KPiBmdW5jdGlvbiBpcyB1bmNvbmRpdGlvbmFsbHkgY2FsbGVkIGluIGFsbCBjYXNlcyB3
aGVyZSBhIERNQVIgQUNQSSB0YWJsZQ0KPiBkb2Vzbid0IGV4aXN0Lg0KPiANCj4gQXMgYSBjb25z
ZXF1bmNlLCAiQU1ELVZpOiBJT01NVSBub3QgZm91bmQhIiBpcyBwcmludGVkIGluIGFsbCBjYXNl
cyB3aGVyZSBhbg0KPiBJT01NVSBpc24ndCBwcmVzZW50LCBldmVuIG9uIG5vbi1BTUQgc3lzdGVt
cy4NCg0KT2gsIEkgZGlkbid0IGV2ZW4gbm90aWNlIHRoaXMgeWV0Lg0KDQo+ICBEcm9wIHRoZSBt
ZXNzYWdlIC0gaXQgaXNuJ3QNCj4gdGVycmlibHkgaW50ZXJlc3RpbmcgYW55d2F5LCBhbmQgaXMg
bm93IG1pc2xlYWRpbmcgaXMgYSBudW1iZXIgb2YgY29tbW9uDQo+IGNhc2VzLg0KDQpQbHVzIHRo
ZXJlJ3Mgbm8gVlQtZCBzaWRlIGVxdWl2YWxlbnQgbWVzc2FnZS4NCg0KQWNrZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
