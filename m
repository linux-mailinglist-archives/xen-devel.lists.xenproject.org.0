Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76EDE6E444
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 12:28:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoQ5w-0003Rk-2r; Fri, 19 Jul 2019 10:26:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoQ5u-0003Rc-0L
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 10:26:30 +0000
X-Inumbo-ID: a842c5dc-aa0f-11e9-8a81-57f238a6c03c
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a842c5dc-aa0f-11e9-8a81-57f238a6c03c;
 Fri, 19 Jul 2019 10:26:24 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 10:26:19 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 10:25:36 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 10:25:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MLeg1jinOfdcb0kaWzh8tyMdCahxmJlAN2e9DugfQHKU2PvFDPTFaL5COevYaDJsni+QwQvIKioO12ROXuXuLXw9zTF71S0E4r8CdcrUGs52qMU92uN2K8k+OoiX1nMuwr4nBmo/fSXADTpP1rCsVNeI8VKkR2u+s38JNCAP8sABqOteoMl62gPsCl2DlwXrCHjufxIH7Xh0nfPyLsAv95x56PCFma6a8sG19ZKh98uKAd5euC/xJk5tx+e+7ZCO+pOhGRZPXvwZ+xootMmicDuUYJvL3zFm6momLBSANTNEa/3VP0iU8hn5iuj7eyj+8rdhi4FSpvQQBkpixVUb8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7Fahs33I7eWZ5xhaETOj2uwvsx5JyU/d88qFO8+lz0=;
 b=SFNPved7zsyWaD51g5H1nlGvnQXgNijstIHxr0PQvWXI+q0IOF7GJ6mCeCDd2y7rkzycsTc5D+g2kFalCnmmGvQ5o9DnN0Vysntu4h5btoCXNNC1x0kH6Rdth92zYsxARl+l3nQjStcovoFgStZVOCA0JJ4oDjrRg6I2TL7lCi+Ro6i10cUbXSj2iTKFSo7OIw+/wVOg24VnGVHtlG2dshOD1/Sie0gYa29VC8V+PG1SFrtYfywYytBQEvHc4xfEd3ObHxvGs9UHJuq3/PEEdmkhInl0D/P7GJibcdz5bL+BVuguActTEBKg4Oteh/tZbU0Yj0YymR1DwA5etxf1cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2540.namprd18.prod.outlook.com (20.179.105.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 10:25:35 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 10:25:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 0/2] x86: port self-snoop related patches from Linux
Thread-Index: AQHVPhxNnJNJs28bvUi97D6rDr2HNA==
Date: Fri, 19 Jul 2019 10:25:35 +0000
Message-ID: <0ccb27d1-6612-d915-a898-8423ac3afdd0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0202CA0009.eurprd02.prod.outlook.com
 (2603:10a6:8:1::22) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97249bf5-f941-4be4-5fc0-08d70c336fba
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2540; 
x-ms-traffictypediagnostic: DM6PR18MB2540:
x-microsoft-antispam-prvs: <DM6PR18MB254048481C47079151CAD574B3CB0@DM6PR18MB2540.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(189003)(199004)(8676002)(99286004)(54906003)(31696002)(86362001)(305945005)(71190400001)(71200400001)(6916009)(7736002)(558084003)(6506007)(4326008)(2501003)(316002)(80792005)(386003)(8936002)(66476007)(64756008)(66446008)(81166006)(66946007)(68736007)(81156014)(66556008)(5660300002)(31686004)(52116002)(6512007)(2906002)(53936002)(26005)(102836004)(186003)(6486002)(476003)(2616005)(5640700003)(66066001)(36756003)(6116002)(3846002)(6436002)(14454004)(486006)(25786009)(2351001)(256004)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2540;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: rd6/LfcyMt6Sd/DpDv7oma/jyTaC4eH5dwph9p6xSBikqkCY0xNLjwSEsqxhironc1c+FKaVqEf0hkUjkhrAZuznjf3ZZ9RfMPSBFaeAGx/Neb/0Qo1RDSV4DkFzCam+DPQ483VdEHaLHxcjy7qYKOXPiYWtGaR+8FudygOZtoWFHE21on/WsWfd1CUIjFCKn2Ap3467xHQVWOTDZPVTX/pSdnJ5XVFIFc7lUIAdBMp7ybKuy1KFMYB2yj/iCr8S35oHPjzvE+yCBP685r/JnthyVPdQgcaC6BnnlkBORmWqKaCsk4QE6YzTyIjRqRwwaD2bjE59BJiakPskSG50ehkeQpmtAC2MtTAMmJ+pyXo7LvXOPisv1SYJLI8uhhH8Qc8W5eImmPKnorh1uz/nBsKJ0cxbIYOxsQ09300R2EU=
Content-ID: <0FC319B8E06989469B9858FE4AD1271F@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 97249bf5-f941-4be4-5fc0-08d70c336fba
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 10:25:35.4334 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2540
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v2 0/2] x86: port self-snoop related patches
 from Linux
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IGhhZCBzcG90dGVkIHRoZXNlIGdvaW5nIGluIHRoZXJlLCBhbmQgd2UgY2xlYXJseSB3
YW50IHRoZW0NCnRvby4NCg0KMTogeDg2L2NwdS9pbnRlbDogQ2xlYXIgY2FjaGUgc2VsZi1zbm9v
cCBjYXBhYmlsaXR5IGluIENQVXMgd2l0aCBrbm93biBlcnJhdGENCjI6IHg4Ni9tdHJyOiBTa2lw
IGNhY2hlIGZsdXNoZXMgb24gQ1BVcyB3aXRoIGNhY2hlIHNlbGYtc25vb3BpbmcNCg0KSmFuDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
