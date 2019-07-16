Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 331C36A2AA
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:07:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnHWm-0007nq-4R; Tue, 16 Jul 2019 07:05:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnHWj-0007nl-V6
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:05:29 +0000
X-Inumbo-ID: 1748048e-a798-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1748048e-a798-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 07:05:28 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:05:28 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:03:05 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:03:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxYr2vulpOTIDv4KuUPyTxZq+ttJ2yd2tplIzIg1Iqbti5taBJDfJ8te6w8/stNfVNay1u18QFvnP78e9eih+8rrnMonQRVJZw68wHjItE5sov8S15HImWmpm8B9ZcYLR/1XOQH6jvfTghnjpyL4M7nHXFEbf3jboFfMXYMyyUK2H5OTVgippDhFq/kga1eqjeySLAMYHWV+Uma2+R2uPj6A4XGab+vrvh7JO3dqDS0FvLh7MPUMKo9Jc3vXtNtK0sA5n97dbR+fRLiJMNn3hMmzCGwCZhnngQTZJNpYQRqxMpfmhjcJvtUoXZ9ezvkEiL3L+gINY2wS6Qk6BhNwIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SYvxEuQLOu0lyK2FtjnBl0KAVRSwQa9eT0uuLWfEsAE=;
 b=fN4qRkfhuQqb/2G+jGG/v9KGlNzoY3+Ub2/FyLssUzuriPo94SE/CfhZWuNdAtXzKvp+/l2u6pWtXap2W2IzHpE2RgKCd4SeQvDXPNuXobFP1fhO6fZlGc76ZByviRthDEow0MVzDk6JG67CX2uDbQsVPqKkdolWMr84s/xTK8Dp+pjZqLtUAdqk14Z0AzuMhdU4oOI9VD+U6VQQpqIW2wkmjAaWvw4sKb7lCmBzQHV1P1FVEy/uzOm2MkjaBLzNGCdsYndmfSt+aRvzRjCfHv1cclV/AYfB63v2rdyDyDkJxemSsNSkytVc36eAwegC2EO1E8yIlFx8AuvjBWfLnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3210.namprd18.prod.outlook.com (10.255.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Tue, 16 Jul 2019 07:03:04 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:03:04 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/suspend: Don't save/restore %cr8
Thread-Index: AQHVOzCCL4NU7PpQg0qA3GejtET0YqbM0psA
Date: Tue, 16 Jul 2019 07:03:03 +0000
Message-ID: <0eb835ad-b1af-c616-5e68-7738ce4db266@suse.com>
References: <20190715171034.29709-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190715171034.29709-1-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0601CA0031.eurprd06.prod.outlook.com
 (2603:10a6:4:17::17) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cee1846b-2cc2-4238-06d5-08d709bba5a1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3210; 
x-ms-traffictypediagnostic: DM6PR18MB3210:
x-microsoft-antispam-prvs: <DM6PR18MB3210E7382F46E01EC63088DDB3CE0@DM6PR18MB3210.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(189003)(199004)(66946007)(66476007)(15650500001)(66446008)(64756008)(5660300002)(66066001)(14454004)(6916009)(386003)(6436002)(71190400001)(6506007)(52116002)(53936002)(53546011)(4744005)(68736007)(31696002)(102836004)(71200400001)(25786009)(6512007)(86362001)(80792005)(256004)(6116002)(36756003)(2616005)(8676002)(81156014)(11346002)(6246003)(316002)(2906002)(446003)(8936002)(186003)(26005)(478600001)(6486002)(66556008)(476003)(7736002)(4326008)(54906003)(486006)(305945005)(31686004)(76176011)(99286004)(229853002)(14444005)(81166006)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3210;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iQMKvE7ddHnpKIf5iECdlRg0NZOzU7fVkQAAzNpMLcOUlaFibZLTfWmdG1suLt/PT7f8SOJG5PHpTTtGQg+rq//gp6XBEQTzKs/OuMCrwvMep0RLe/5YGKa+gsfBlNui5vi2Tckg81MkZbETQ3fGnb6iXFSPJAzNaTdZsJJrmDPQigY/oIMr7bdPNJG9Vyu3mKgYYEvjRUE4Ekw9HiSgCH6vmuPwBSeKmI8lEYC+pemJIOao0EoryPECOkqPHyKX9Fh9iYwaWJuP7aT7/l4y1X9MmH6HHKUQ95MotR68RG2UI+V79seG48kp7kdqASd6H+jcjT9LJSxZIVsZLxpoquGkLt11FU+68xv/pG1vqn+mFXLHJUoalv3QP5y6B/WDZVPleDycgXNfrLcG08xItVgvRp2YSfOPIqp4Tbi4V10=
Content-ID: <E18364B994338447B33887C9384DA13A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: cee1846b-2cc2-4238-06d5-08d709bba5a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:03:03.9731 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3210
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/suspend: Don't save/restore %cr8
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
Cc: Juergen Gross <JGross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxOToxMCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gJWNyOCBpcyBhbiBh
bGlhcyBvZiBBUElDX1RBU0tQUkksIHdoaWNoIGlzIGhhbmRsZWQgYnkNCj4gbGFwaWNfe3N1c3Bl
bmQscmVzdW1lfSgpIHdpdGggdGhlIHJlc3Qgb2YgdGhlIExvY2FsIEFQSUMgc3RhdGUuICBTYXZp
bmcNCj4gYW5kIHJlc3RvcmluZyB0aGUgVFBSIHN0YXRlIGluIGlzb2xhdGlvbiBpcyBub3QgYSBj
bGV2ZXIgaWRlYS4NCj4gDQo+IERyb3AgaXQgYWxsLg0KPiANCj4gV2hpbGUgZWRpdGluZyB3YWtl
dXBfcHJvdC5TLCB0cmltIGl0cyBpbmNsdWRlIGxpc3QgdG8ganVzdCB0aGUgaGVhZGVycw0KPiB3
aGljaCBhcmUgdXNlZCwgd2hpY2ggaXMgcHJlY2ljZWx5IG5vbmUgb2YgdGhlbS4NCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoN
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
