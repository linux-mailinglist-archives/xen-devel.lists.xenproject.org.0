Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22F96BDB3
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 15:54:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnkLm-00004y-RW; Wed, 17 Jul 2019 13:52:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnkLl-00004s-Nt
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 13:52:05 +0000
X-Inumbo-ID: 0d241978-a89a-11e9-81f7-d316d3c28ce9
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d241978-a89a-11e9-81f7-d316d3c28ce9;
 Wed, 17 Jul 2019 13:52:02 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 13:48:10 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 13:52:00 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 13:52:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ayolk0XQl9UKTXxA4/cKbvHneKmuHUzPINnjvXZ3qbuzxr+aINDKHdVtQx1whfNoWanqS+8Dkk9sSV439HZuzppxWE02QUNgAH8C8INfSZyPkQauepvJWkCXwy9DW0GVsIlNSCydEP59EK5sqiZY1hmrYMBt8G5bz8/KD+1gJ1lr6BNilj04V2Xh1U4WgL4JXyo7aqYnojFOQSxh6WK7FiTF2PFgohrI5kcGRhDVp8F0ZvYQz0rdVUjL7njtBO4TApxa4F9zrIXOZSNHX+N0YTBrWi3U9ZAMOD8HsGqQcCWtEw1S71VDVdCKUiencRMQrKekIdCVSCk+/j8ntDAjYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jB6at1FX3eTlIe/tWh7xRSPaxljPJjuIt4ONpoVmKSw=;
 b=f2hEUdnl5erfUsaF2ra4UeszKGCGKwGjyh/qNia8xJmoaEY4j17cd2tn77ZviBJ6hsl6WzFL0Qh5uFPhtOS+RjslZpOy44Ocw2M/T9mRv7MDMjCns9CD7Frp4UvnuahD06vA/p3vZJhBrxHXGxKz2dLPmWK5eU/aqymY2gwJWkf2nPdZV2GROpj24oFpTz5zir5c8aAxj/9MUpN4UmMrgBaU9aQJfTfxWIZVb5lRRnlRO1z3GT7eJEbHxiDDNFT6OHiXRFdeqNfDDFfripWwC6MlWjqNTTJ/Db0JQZMq8Vbpjo94rYX6iYcJmZNZ9skQckrGGlIuxNA6SVrAl+biMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2489.namprd18.prod.outlook.com (20.179.105.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Wed, 17 Jul 2019 13:51:58 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 13:51:58 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Tamas K Lengyel <tamas@tklengyel.com>
Thread-Topic: [PATCH v5 4/4] x86/mem_sharing: compile mem_sharing subsystem
 only when kconfig is enabled
Thread-Index: AQHVPKbNTRo7ZKkOLkGRPc+FPfvM2g==
Date: Wed, 17 Jul 2019 13:51:58 +0000
Message-ID: <e5f95af8-7469-82cf-c046-0642d8762a19@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0416.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::20) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff014606-cae7-4c86-6835-08d70abdefe1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2489; 
x-ms-traffictypediagnostic: DM6PR18MB2489:
x-microsoft-antispam-prvs: <DM6PR18MB24894C670DEB585925D0E419B3C90@DM6PR18MB2489.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(199004)(189003)(2616005)(386003)(476003)(25786009)(8936002)(86362001)(81156014)(81166006)(26005)(102836004)(6506007)(186003)(478600001)(316002)(99286004)(14454004)(80792005)(31696002)(68736007)(52116002)(6116002)(3846002)(71190400001)(305945005)(6246003)(36756003)(71200400001)(2906002)(256004)(66066001)(6512007)(229853002)(558084003)(8676002)(6916009)(6436002)(6486002)(53936002)(5660300002)(31686004)(66476007)(66946007)(66446008)(66556008)(64756008)(7736002)(4326008)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2489;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: moEyYKZ5JpZnFNwIO58jG5WZJx0LEpRrzx5vXCx5s+OjmQ2t0vx3ThaEsOH3Q4RqBdVmSFO5NPYmK063FT5NNb04DtzTz2vKNd1au+/Wg8jr+9JkrNJcqdRTah6WwmIomZCvjyaUIs374RV+URqRokjs1KIiZNGPDhZkWlbroeAsbJTj9f/hNSvFOKj+U80Ms0pqTtBhKbYFapsNY6eDHIpTKvXzP7mmfFUdUszWP2OntZYYHPk2968b9WuG8Dxz5q7sVX4x3DIWrqf36WRoOW+rsqZ7FFFaiKmLMChIFgRp8dj0sc/AHmeWeQXhinfJvgQEogN2qy1OZVR9KFnyuqjtMZtIRdC4wUYx9YsPOhI1XrHv+9QsctZjc/w70pF9uaYDkC19ya2VraxzQrpatZwnByWPf5+OcF6ME5wtqvs=
Content-ID: <5E83FA20D26ADD4A816FEFF8045F86B1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ff014606-cae7-4c86-6835-08d70abdefe1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 13:51:58.7906 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2489
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v5 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBEaXNhYmxlIGl0IGJ5IGRlZmF1bHQgYXMgaXQgaXMgb25seSBhbiBleHBlcmltZW50YWwgc3Vi
c3lzdGVtLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xl
bmd5ZWwuY29tPg0KDQpUaGlzIHdpbGwgbm93IG5lZWQgcmUtYmFzaW5nLCBhcyB0aGUgb3RoZXIg
Y2hhbmdlIChhZGRpbmcgZnVydGhlcg0KQ09ORklHX0hBU19NRU1fU0hBUklORykgaGFzIGp1c3Qg
Z29uZSBpbi4gSSdtIHNvcnJ5IGZvciB0aGUgZXh0cmENCnJvdW5kIHRyaXAgbmVlZGVkLg0KDQpK
YW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
