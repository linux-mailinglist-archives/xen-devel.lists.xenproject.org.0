Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C77974BB1
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 12:36:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqb3y-0001jB-LX; Thu, 25 Jul 2019 10:33:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqb3x-0001j4-Pm
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 10:33:29 +0000
X-Inumbo-ID: a1fb704a-aec7-11e9-920e-0f8936a340b2
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1fb704a-aec7-11e9-920e-0f8936a340b2;
 Thu, 25 Jul 2019 10:33:25 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 10:33:25 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 10:31:57 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 10:31:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vvum0LesHGvWSzUSZwHU0v++4hAVOz68MYuADxyeg1ZDbTIHUzwUHUXj+NMbLff+8lcP2WISA3TyQ9t+iOeGbCM5nx6vZEKlH/+2d1A4vlHVsFm+bwP9C+CmFQVMlR3v6bg/LCs7UyOC5pwdVjUSJ2ZTaCqI6Yd2A+MuFSZANwbBjhGN+tDhiHBSNXDxa16TTKAvyFI6yxcD0U+mRxVPSFNHmBtTdJ1tUR0W21xOxD70B7EMl8QYIdMk5Ve1n0ZOq1+JFu6uKUSHl1Y/+VhfqX4/RO83z3LGfXIII47LrQWcTn8/JwLBogJJphXBzbQCjEhpisBImFNoXAyYEbZ80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9xeqswhPiqSbhcFYOcsNCXkcudz9EAftUrJJVobCW4=;
 b=LVtG+TCv+bhNWDlpVSC2GoDm40D4yDksLWaP+NDqjopue2dqCARspk5l0/oClL6CbyKotzUi81eiXC9lVrRZgl48wq8sbHlFeCJ2X/bzHvE9gKBRO/AZ1I/VAylvuISYH91bOoSblG8vgAaaX5Vp05jjlAycKT0CmQImtwNvoJtRJiByTR4RQYl8IHCn+h4OGE8g+31XlOP3M5U++GxH/Fg22FOWcbhcBxxSrEBcYE7arWfy44vrYZFB6qBE7hrKvX+5kWZtuJ4zw/LC9JDMJK6CBiIw5rJHA0bfGIHD9SoFyztIL4BdThtTgT9BLVOuL3jR7ZO0i5kTlP1AuFIDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2985.namprd18.prod.outlook.com (20.179.48.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.13; Thu, 25 Jul 2019 10:31:57 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 10:31:57 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH 1/3] x86: Drop CONFIG_ACPI_SLEEP
Thread-Index: AQHVQkdIZaW3GIh0LU+DNDVy9IxU46bbI8kA
Date: Thu, 25 Jul 2019 10:31:57 +0000
Message-ID: <fce9a03f-2a1e-da55-36d2-b559a1c3eb79@suse.com>
References: <20190724174256.5295-1-andrew.cooper3@citrix.com>
 <20190724174256.5295-2-andrew.cooper3@citrix.com>
In-Reply-To: <20190724174256.5295-2-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0077.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::17) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d91d3ee-19ab-48ae-ac4b-08d710eb5193
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2985; 
x-ms-traffictypediagnostic: DM6PR18MB2985:
x-microsoft-antispam-prvs: <DM6PR18MB2985913D34DD7853F871F718B3C10@DM6PR18MB2985.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:210;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(189003)(199004)(8676002)(6436002)(14454004)(6512007)(81166006)(2906002)(68736007)(81156014)(8936002)(3846002)(478600001)(6116002)(31686004)(7736002)(54906003)(80792005)(558084003)(36756003)(66066001)(6486002)(229853002)(6506007)(53546011)(316002)(6916009)(486006)(52116002)(99286004)(186003)(26005)(76176011)(66946007)(446003)(476003)(2616005)(11346002)(102836004)(31696002)(6246003)(386003)(4326008)(71200400001)(71190400001)(66446008)(86362001)(305945005)(256004)(5660300002)(66476007)(66556008)(64756008)(53936002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2985;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: aYrCy0gvGMmiaJ9aKFjUvljqobAXgO6fHcx69OEVP9Rad2xPGbXgDuQrC1iSd/M+DcQwGYSHZ0/HVEeB0MuS618twQEC0ApD9JiP7/QnprvgL64LvxkgrxkwO9MnrL47JBZ5TsmIJu1YC5EQkatFdN0oJr5wvKcDbZsMMESvZ4rWVQ+R348zym4xRcrIv9AVmP98VuCqqsN8JWC8NpKC9l/x27LecgtXFHmtUqCk2Iqg1vBgA8cihouxurywgDIS5C6w1tKB3FEI8J2lwjPzf10hnfsWQMQJ/1wLHnZYNXV0WkH7aG0IXXGhIwIYRH8wwz5UOhndJUDueU6bP48lBVFYPxc4AOKVb2QhI1sSRuyNakB9qmbKbH86IMOC4TpJUbGkEMrjONqZwwjuSHnBkIeDhh1RTjP0V3HidMtxQ+4=
Content-ID: <E9AB03B32E719E41A31AC3A251A5FA74@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d91d3ee-19ab-48ae-ac4b-08d710eb5193
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 10:31:57.0984 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2985
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/3] x86: Drop CONFIG_ACPI_SLEEP
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMjAxOSAxOTo0MiwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gVGhpcyBvcHRpb24g
aXMgaGFyZGNvZGVkIHRvIDEsIGFuZCB0aGUgI2lmZGVmLWFyeSBkb2Vzbid0IGV4Y2x1ZGUgd2Fr
ZXVwLlMsDQo+IHdoaWNoIG1ha2VzIGl0IHVzZWxlc3MgY29kZSBub2lzZS4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNClJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
