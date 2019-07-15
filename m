Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4256B695F5
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 17:02:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn2R4-000782-6n; Mon, 15 Jul 2019 14:58:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hn2R2-00077x-Oh
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:58:36 +0000
X-Inumbo-ID: 053a6076-a711-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 053a6076-a711-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 14:58:36 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 14:58:33 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 14:58:28 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 14:58:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGc7eQWq5bGiJZhxg4/8uJkldH1m/6JimDBWnzvhoXjM7hkObhMyzAheS4IHk07FtsL9HER0bElb9/HzyFBFuVQzmfXWgOdvWGn8douBVzBVcMC5KowKtlppOyuZ4TglXryCHJtUO2ykem3BlqRfCpYon1gb1558W9PDpS97cvz38UqwbtRuuQMqyAYcvwgcXIwiAkTPRdjkUnrSUFEEl9v14nZBna0H7IPfZJzNKnmddoLYDo3DfEw5jeF0XL/b5lcBq1d+wD7hmuIKbIs4ss5EMmJcD0NxL5cePtgSpV6Ct689vWgf8B9bYARSSLjZ/g2zP5+M8fjsZH8xfor2oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v9q41QWM79Z8pjkdZeeHnv1m7jdQI2EwiupSSfFZClc=;
 b=XNJWE0tqUCFmirRxhpNVzcN1EOJ3hkN96DOo88oR/xzUzBBGLzNkL0aymI72BFOiBa2yCoFfiLlF8XXeMofBGuMC+b/d7VPJowQHAA0AWt/dTTH/0/ji0vwKbU1LQQp0wmlp/IXKbr4NIUVe8ipjlOfP7Aj6TtAWa6R8ma7o5W00P0TdPJjzezg5IYduFHlt4Sk/6v9XINUTf6AtLyuNB9gEdV6HJKmIpA9AAn5xCDKWuriBQYNLUzkWcrx2n0y8Wsv+FQpZzjeOqUTnwcYcc1TpGCxcEQpsKmR+mwKr2IuPjKDYFZZwdmlnhNtHVI2AnqOYDd8yKATJkULQUkHe2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3370.namprd18.prod.outlook.com (10.255.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 15 Jul 2019 14:58:27 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 14:58:27 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v3 0/2] x86/traps: improve show_trace()'s top-of-stack
 handling
Thread-Index: AQHVOx3CfkQ+dmu4aky7/jQAldKDBQ==
Date: Mon, 15 Jul 2019 14:58:27 +0000
Message-ID: <48d6972c-c15a-6f74-1726-ff4154f04c4d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR02CA0001.eurprd02.prod.outlook.com
 (2603:10a6:6:15::14) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a3daad1-c124-43e0-fa54-08d70934e48e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3370; 
x-ms-traffictypediagnostic: DM6PR18MB3370:
x-microsoft-antispam-prvs: <DM6PR18MB33708A3C8F4C7E8D6B9CFE8EB3CF0@DM6PR18MB3370.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(346002)(396003)(39860400002)(376002)(199004)(189003)(8676002)(558084003)(52116002)(256004)(6916009)(86362001)(80792005)(66946007)(5660300002)(31696002)(186003)(2616005)(3846002)(6116002)(476003)(25786009)(64756008)(66446008)(66476007)(66556008)(386003)(6506007)(486006)(305945005)(7736002)(2501003)(2906002)(71190400001)(8936002)(71200400001)(31686004)(81156014)(6486002)(68736007)(81166006)(478600001)(66066001)(6512007)(26005)(102836004)(14454004)(36756003)(4326008)(53936002)(99286004)(6436002)(316002)(5640700003)(2351001)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3370;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HPIQ8kLyzlkcFxq2i2J5xzZf+Ze72K32KRmbXZDudhFI6cL0Kdp2Q01P+hEuCD5nnmK6c1Z9M+28ogGM1rptc3RNWlPRznfIUQiDaavzUVwqgnSIL7GoTnvNEoaDSq3yfFZ8ryMh+yyIcXZLjPdBeviZczHWbjxpu4/f5/jS+xJweP9/U77XnHEpzl/qjlE0zC3dRVGMNCraLzsW69mdIIIfxtNxI6kP9a0uObnMQBGNB6Td/BBO6k98X1U9Ga2hwZ2wqFoGxTbVzP8m3L1tcF+8X9Kd2/fllVKsu3KXVkKC6cQWwvIqnm7cNvTkA9uJdk7LTnRcWhLP5RaSgXCJSgadALM2cS9j2Psd2eej1pqq1+XxYHAzFQFY5AWt3tqrw+RFZ7mHfqkwVI3R9hvLJYDq0ikoPPjUXs0k0s8unEg=
Content-ID: <82AAAD7B5DE2134590DE9A03A99574C2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a3daad1-c124-43e0-fa54-08d70934e48e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 14:58:27.5218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3370
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v3 0/2] x86/traps: improve show_trace()'s
 top-of-stack handling
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

MTogZ3VhcmQgdG9wLW9mLXN0YWNrIHJlYWRzDQoyOiB3aWRlbiBjb25kaXRpb24gZm9yIGxvZ2dp
bmcgdG9wLW9mLXN0YWNrDQoNClRoZSBpc3N1ZSBwYXRjaCAyIGZpeGVzIChhIGN1cmlvdXMgbGFj
ayBvZiBhbiBpbnRlcm1lZGlhdGUgY2FsbCBzdGFjaw0KZW50cnkpIHdhcyBvYnNlcnZlZCBpbiBw
cmFjdGljZTsgcGF0Y2ggMSBpcyBhIHJlc3VsdCBvZiBtZSBqdXN0IGxvb2tpbmcNCmF0IHRoZSBj
b2RlLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
