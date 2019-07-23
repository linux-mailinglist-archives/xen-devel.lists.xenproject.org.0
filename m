Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA2071651
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 12:39:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpsAV-0000na-3C; Tue, 23 Jul 2019 10:37:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpsAT-0000nV-Sx
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 10:37:13 +0000
X-Inumbo-ID: d381e33a-ad35-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d381e33a-ad35-11e9-8980-bc764e045a96;
 Tue, 23 Jul 2019 10:37:12 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 10:37:00 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 10:34:03 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 10:34:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JPvzlmk+4cKFy988buevKXdw000RWbsqfM8NAsgkhxoO+WK7cTcilr3cf438IGZsHmAotq+df3uOKpBeJBYYrjiMUyUD88J9/ZV1jdAMUBgfMSAhRGpbTYHY+6/75NWiv+6BSKOpHHM8kEECNzfp3RLllX3TJGuVzE9LG6cEdnFPN2qCZ0XtGdJuchHYzcLAoNY+7ly8k51weQC/8pNwsVehcwE7ycv08A+i3lszCmDXMUnCptGvhrpay9VNdROKaXmCanfhuEcEtyCucgW0uPHmHilMtg5bNjfsN2ZwcrZKoFVSSo6FdniYq/1WgNFrF4Ry0GFNzR7T4S0QSzB1Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s+sDxl2WyN48fLkgkJNK2zomwqIo+VQIuAvc+Cn+G78=;
 b=TnRyceqC/OppWx0VVSmfydAtr5nBEb/TUPGhkGdv+PvC2LPth01LVf/tM0r7lYwGS3cxC8h+K85iyK8cnudOKd/aqX1mfkSOK7Sn8cR38cLDNZ9FPPg9khaZjk+XeTTqkNHvXz23CtwiwyeBQY6tGczIy5JCz6O4RJpJx1Y1klw/vGqKrrV4kt9umhQ96RrhvdvjdJ8PXAIW8o/C+iEjm19ytEN3EkEvyLMQs0nUvpjBR3DxQQGYDs6H2H2EVGh8HlkMUYMkxrViUzptBuzXhdIMdg6Vmbiu1iJkmkqChZzhhcwivtxrbm2fFO4hFO6hw4Gc1nH1btWQ1NGWULC9QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2553.namprd18.prod.outlook.com (20.179.105.217) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Tue, 23 Jul 2019 10:34:02 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 10:34:02 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [PATCH] x86/iommu: add comment regarding setting of need_sync
Thread-Index: AQHVQKSdo2s0sTEFEkmyyPZwdZ6nF6bYAvqA
Date: Tue, 23 Jul 2019 10:34:01 +0000
Message-ID: <534f1b02-7ca6-78bc-2eb1-71300ab24fc6@suse.com>
References: <20190722154552.73458-1-roger.pau@citrix.com>
In-Reply-To: <20190722154552.73458-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0354.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:d::30) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c8a92c79-88ea-4a0d-0a6a-08d70f594750
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2553; 
x-ms-traffictypediagnostic: DM6PR18MB2553:
x-microsoft-antispam-prvs: <DM6PR18MB2553D3F4DD647ED57A576C01B3C70@DM6PR18MB2553.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(189003)(199004)(6512007)(86362001)(6486002)(14454004)(31696002)(2906002)(6436002)(81166006)(81156014)(6246003)(6116002)(31686004)(8936002)(36756003)(68736007)(3846002)(53936002)(4326008)(229853002)(66066001)(71200400001)(71190400001)(5660300002)(102836004)(476003)(446003)(66446008)(316002)(66556008)(66476007)(64756008)(76176011)(256004)(66946007)(478600001)(7736002)(2616005)(25786009)(11346002)(6916009)(80792005)(8676002)(486006)(386003)(6506007)(53546011)(558084003)(186003)(99286004)(52116002)(26005)(305945005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2553;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lFsh7GQrWarQ/2zo/NXVskHDvfnH7bYlpNQse8qt6CNOdAZnDY8I04976jXyQ7I+w+6Nc3ydKSFO1RJtMTUzt9Gy2/Kb9M3vlaFg2WLE1OrasUH1eN6+FcgtGAOr2FEw+fSwEiwq5WxEe5Su3Vi7OVDdSxTE2sYRwxhBDrbg3ndWZVRMBpcsDuYxCxDRluM8pZGmpNuZnHyQ8U07qeb0Q67MbmQ3YH6bnDPyP7weaV99ZtKhWSREHRzAps6Oj0PowlA7xu1p/Un5sCgXdhtPMtbthHbkyzXosWB8w4ngQS8D6p15OM7Yftb/JLCwVaJHZwEX+NKLvQi425ty0Fgww03KX8qom/lnm1gNPfEU7JJ+j8bsnlAprat7JL3tnatH27BdllfcVatjn9zp66gLViErQvWEDbihT6YNIPFdpL4=
Content-ID: <ED26C030840F2542A9EF8F2E5BA0A0B7@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a92c79-88ea-4a0d-0a6a-08d70f594750
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 10:34:02.0077 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2553
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/iommu: add comment regarding setting of
 need_sync
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

T24gMjIuMDcuMjAxOSAxNzo0NSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBDbGFyaWZ5IHdo
eSByZWxheGVkIGhhcmR3YXJlIGRvbWFpbnMgZG9uJ3QgbmVlZCBpb21tdSBwYWdlLXRhYmxlDQo+
IHN5bmNpbmcuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4NCg0KQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
