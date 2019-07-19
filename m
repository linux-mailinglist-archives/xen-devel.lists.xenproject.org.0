Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1218F6E34D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 11:20:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoOzU-0005xR-Hx; Fri, 19 Jul 2019 09:15:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoOzT-0005xM-SV
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 09:15:47 +0000
X-Inumbo-ID: c995edb4-aa05-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c995edb4-aa05-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 09:15:45 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 09:15:39 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 09:15:31 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 09:15:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YFiaja5rFD6gvRaXxSLRZmQAdRiKXmntCYmw0v9gdwepzs5AIo7VRud4Jd+ge5cmfAmNiikemVzat9rIexmLBngSfPK21DnyFpVWYjiqyXXOFabQ4JL3409QRiU3ZMofw9CIj9OHNGaSwKGI1m3WzWyjr3IfvDMC8X55Rttt0vEdX5VvedMAyqcKCdTBsr8/zdNJS0bcWS9kBNHOJl0niv0VOerGl/+jxXfYMdGhPyGnoLaEeQWHemcn1cUdR5Xr6LQM+bpta4sOGSM9nIJh25WRNPFcnDIRAccCIIqZ7Oq7oJqxw6tHUbXlJUicwyr6T73NMTWpBDwgk8Hxsc/aIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CRiyAreXnhueVaJ/t7tsKeZUMSo6izWvonuoDQD+BCM=;
 b=GGzUBS+9YnmrrhdgN8SrinW6gQuBI3NL4Vx5h4hB6kvSAaSpl4AaBRyz8BubNd+cvMPet8LSfhDYroDi0XD6iGkP0YVO4f/TJz4swRs1DdiCjihTVpnECL7ovrqPvgccdxK/nTBrWYYgli9pIltJjhsAUJdkyQlaqlUA0eWOyOsIncz+0RjxH5027YHi+1Dwp0d+6bHcVmrvU5zW4BKA9KHHsF++ooCNibIuz7EO6WYenSKVQT+g31FzDH1uqmSUuF9vh/fSq8+E8kMFa9qLpItM+xjDupL+vMrr8NAgfBbg9uSSqnMyJo/BlWYRojcdP0GQeoZLd4Jye6+oVJgOXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2475.namprd18.prod.outlook.com (20.179.104.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Fri, 19 Jul 2019 09:15:30 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 09:15:30 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/2] ./CODING_STYLE adjustments
Thread-Index: AQHVPhKCMtjEssnYN0Ov1f+FtlV/vA==
Date: Fri, 19 Jul 2019 09:15:30 +0000
Message-ID: <f1a5d1b0-564e-8f04-f43e-f5c68466751b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0357.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::33) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 59f1cc8a-ffca-4ca3-042d-08d70c29a513
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:DM6PR18MB2475; 
x-ms-traffictypediagnostic: DM6PR18MB2475:
x-microsoft-antispam-prvs: <DM6PR18MB2475945939D8E2C968001EB0B3CB0@DM6PR18MB2475.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(189003)(199004)(52116002)(81156014)(81166006)(14454004)(6916009)(4326008)(80792005)(186003)(5660300002)(31696002)(66066001)(558084003)(6512007)(478600001)(66946007)(2906002)(66556008)(66446008)(64756008)(66476007)(54906003)(86362001)(316002)(6486002)(6436002)(68736007)(305945005)(8676002)(3846002)(476003)(2616005)(5640700003)(2351001)(99286004)(71200400001)(71190400001)(7736002)(8936002)(31686004)(36756003)(486006)(102836004)(6506007)(386003)(6116002)(26005)(53936002)(25786009)(256004)(2501003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2475;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LET4e2oFm3QrlTx6+WRwvia3tHUuhkajbNb+IqcOBv5Y8cmzHpji33tREFTMD9RZWGTDz+qQE/JpSZNPZv0Sj++IWRvpXr9ISoa2i6HFR1TGZV1PlEpxq2V7vc/l3eLqYfmi7MceRPCsfZDlRSqNqz+4cmlLm55fWfKAv353aRIhL7fvTODXjYYpV22gDfSOR07MaEucHTUmYDLob4ssdLtTKd8XWzRRSrojGwsuGaPjot34wpTJ/owfKGhZl3hVUM+2rse5DY7s1yL/AtRH1frh79ob5ReJFowgB2GptfgU5KQ1d07coNgowiOq00amUHhFsjIz9y/WCIaz7gohAvwxnLtoChrQxQLa6qYEOqFD1equ376WZxKKB/6rKB9nv3F9ayVkMX/hmDFw9tz228KTvTx8N92lSPg188msVyM=
Content-ID: <6E03159E55212E4E838C913C72F2B339@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 59f1cc8a-ffca-4ca3-042d-08d70c29a513
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 09:15:30.0512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2475
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH 0/2] ./CODING_STYLE adjustments
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGF0Y2ggMSB3YXMgc2VudCBiZWZvcmUsIGlpcmMgd2l0aG91dCBldmVyIGhhdmluZyBoZWFyZCBi
YWNrIGFueXRoaW5nLg0KUGF0Y2ggMiBpcyBhIHJlc3VsdCBvZiBhIHJlY2VudCBvYnNlcnZhdGlv
biBvZiBUYW1hcy4NCg0KMTogZXhwbGljaXRseSBjYWxsIG91dCBsYWJlbCBpbmRlbnRhdGlvbg0K
MjogbGlzdCBmdXJ0aGVyIGJyYWNlIHBsYWNlbWVudCBleGNlcHRpb25zDQoNCkphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
