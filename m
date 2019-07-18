Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A7F6D11C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:28:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho8I0-0003p6-M4; Thu, 18 Jul 2019 15:25:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho8Hz-0003ox-8S
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:25:47 +0000
X-Inumbo-ID: 4d06f5c0-a970-11e9-8222-03aea344cde4
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4d06f5c0-a970-11e9-8222-03aea344cde4;
 Thu, 18 Jul 2019 15:25:42 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 15:21:48 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 15:25:28 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 15:25:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSu5G51lGv4RBpZH/ZlGnHGucG3lZb8axQUpaZtq2xgyVr6SzManJJ1EVHq5gtwzEjyu9RgRYFKKNdaJlahtn/camBWIHZaV6+94DKk/S3Uyy5W8EBJmHGxT3Murhq2RG6ijJwwVELBAXL1F6n6nFl2T5590OuiDN/xL4zfvdcHKTk1wdCNbHBMUH26X8+f55q8GKQ021XSYwjB8LZEzS6tptu9zINjzVe+438AItE1354r97BgMjA71syykkacE9fgFj1HVFhT8j4qXR+V69X+dQA+B7pxIqjfsZ26bW9ZVCza3+tj3IdfAHG5A5UWl+M1VArFUHDaRIqR5P9ffUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vnDeeRkfXWLo6eKw1Yn/kfmJK7d8ZP9tcnK9E8tHcI=;
 b=jEjsDqevQNhDDLoipVOaKhrtfAt/54gMhaCpZKzGbDdIw2tfl3JwcHku8bGdL9ny1uoU5B1UcCOpNMq/e9vtAZvrBLQfeToNZhWpH9+cJMW0XJ7F3Wd56R8yJp3BN7xpKB6TuzSYCZle9PEPNOtYHwCLxeUGB5VRaWPbLHE/GKexxkwXKaqwoWh5fXolL0sCTB096ajSI+bY+MzcnmV/yQ8H011AOHiPTAiMOlXjsM6A2m5R8b4d3D3EXuwKWxBmTHPdbVaD3NNtbjcCSgg3mo17iWV0LYViAaZcOHbrYpVQKc4JaXxJfA/+6wUn9RVl09j6MDIx1fvBcDjfeu2R5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2891.namprd18.prod.outlook.com (20.179.52.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.14; Thu, 18 Jul 2019 15:25:27 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 15:25:27 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86emul: Ignore ssse3-{aes,pclmul}.[hc] as well
Thread-Index: AQHVPXsass2KMSL9gUugg+Gg/9ZW9abQfxMA
Date: Thu, 18 Jul 2019 15:25:27 +0000
Message-ID: <c98e26fa-c1db-f50f-5e89-726d1e6ac74a@suse.com>
References: <20190718151119.17270-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190718151119.17270-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0125.eurprd07.prod.outlook.com
 (2603:10a6:6:16::18) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a570243-cab1-47e1-92c0-08d70b942927
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2891; 
x-ms-traffictypediagnostic: DM6PR18MB2891:
x-microsoft-antispam-prvs: <DM6PR18MB2891026903EA24826DB4F2B7B3C80@DM6PR18MB2891.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(189003)(199004)(53936002)(52116002)(486006)(31686004)(6916009)(6246003)(11346002)(478600001)(31696002)(66066001)(3846002)(6116002)(316002)(5660300002)(102836004)(386003)(86362001)(26005)(558084003)(6506007)(4326008)(53546011)(229853002)(2616005)(76176011)(25786009)(54906003)(7736002)(305945005)(6436002)(71190400001)(71200400001)(8676002)(14454004)(68736007)(8936002)(6486002)(80792005)(66946007)(6512007)(256004)(446003)(66446008)(64756008)(66556008)(66476007)(186003)(99286004)(2906002)(81156014)(476003)(81166006)(36756003)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2891;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: KFKG8AZyVZQ0jd4wN9mQqQFIw+ngQp4H4TkzWuvXsnSGbCX5s3jIPbK5oaRd+uOLWBLcPNDgIPzfx97wH0P5A8uwCzbT1/l0UXmhgmpZ0DGkmx7CZ20uzvaF3iTXPHT+KZkw+GovrLgr2Now67YspVgCI+mutj7T74ZcKKm+tGhFD+Oyut/XURaRsqC5cmo55KyEuF8TlIsgIJvxZDPzmPcE2T45c9xXZyg2zAoVkaTlDwJjytzmuAKvXz7ikfWIy4OU5Rr7k2s/6kOFo9CSJSuj244EtJ9yulUOQgp/0xSAqrpcUlK4xERZG0uE937hXFcIRe1q8lvinKyUJOjpRs5Oo5QcAulxT0mPHdaltq+gHU2bNbu8IzTC+gbVxIncymhoDlB2sujzGFrzFzYdCkCFtI/gCap/YRqESGVHcmw=
Content-ID: <69D5BB8663913D40B939F9657C61646A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a570243-cab1-47e1-92c0-08d70b942927
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 15:25:27.0928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2891
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86emul: Ignore ssse3-{aes,
 pclmul}.[hc] as well
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

T24gMTguMDcuMjAxOSAxNzoxMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCg0KQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCg0KSSdtIHNvcnJ5IGZvciBub3QgaGF2
aW5nIHBhaWQgYXR0ZW50aW9uIHdoZW4gYWRkaW5nIHRoZXNlLg0KDQpKYW4NCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
