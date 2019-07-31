Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAD07C3B6
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 15:38:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsol5-0004j4-RS; Wed, 31 Jul 2019 13:35:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UN8Z=V4=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1hsol4-0004iv-DP
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 13:35:10 +0000
X-Inumbo-ID: 027833c5-b398-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 027833c5-b398-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 13:35:09 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 13:35:04 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 13:22:19 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 13:22:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXmU9TNhwJ6rfJnWOU3n1znjnthRW7JhfvwUPEpY45UdIyqLadVCmI9cMpKDqH85om6ElkIPT4MImF7sX9Y9YL6YyTuv+5s3Z2PuViHRRaEEhLW/D9QegKNf906HK/LLmYeM0DC1wpcKhFIRO+82RN6WOdyP/lOmWZwBBHH8MwsXxBafTnczronqJlU0QI+7mgBjArjXLe9og3UPUuGgTWVzAiMGjonHROLdzv19/VuRUXJXe1qgepqOxhEDU6sZFJG5gziZzubUwHa0ccmGxGItd5V/5kuHcT6LO8Eq9k1WWtnSfODKDegoCCRAaQG3MjwfA1JGyp6p0QqRX44SmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OBQZti58U38TZopuAZXY8DP/o5qR7ZzF/+115oLd+38=;
 b=nh/zPt/Us8TpcnGtgz6bEseGuqeKG/pbqGt0aQEEEdOOeD5zuehexj73yXW5itIrhXNrlZh8RO+tEv0aMn/XQ/ZvF5XkL9eGlIx7qDhzeifWdDl7/NjrhH0KV8ZaX7EGi/fTWdVwv4xkhOQO859ErOIcaAy4AaNVHPKU7LI5OEQAsVdWqHtYnGtQO3Qcv+r7A2IQnXipxgMv6G52j6JMnQUxJjspYchFxuFJUYoscQG4aK7/S+UtPEeogfbqUjiE0rvHyHWXZ/NseTfraShFSPReDNnwReioWyE+GKq03oB+i96z270q5DrHBa8/tzbBPazH6ZXeKz4CFHMf7k4HVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3106.namprd18.prod.outlook.com (10.255.154.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.14; Wed, 31 Jul 2019 13:22:16 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::ad30:31ad:5576:bb56%7]) with mapi id 15.20.2136.010; Wed, 31 Jul 2019
 13:22:16 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Speculative mitigation facilities report wrong status v3
Thread-Index: AQHVR6L4rYZnjszFsEKi3E/8s3Q2qw==
Date: Wed, 31 Jul 2019 13:22:16 +0000
Message-ID: <20190731132149.20749-1-jnwang@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SG2PR02CA0108.apcprd02.prod.outlook.com
 (2603:1096:4:92::24) To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.22.0
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d3420823-2419-4f0c-5b4f-08d715ba1b63
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3106; 
x-ms-traffictypediagnostic: BY5PR18MB3106:
x-microsoft-antispam-prvs: <BY5PR18MB310668BB12898BDCB84B657ABEDF0@BY5PR18MB3106.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:214;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(189003)(199004)(71200400001)(66446008)(64756008)(66556008)(102836004)(26005)(66946007)(14454004)(99286004)(66066001)(5660300002)(86362001)(8676002)(8936002)(186003)(52116002)(71190400001)(4326008)(25786009)(107886003)(3846002)(386003)(478600001)(53936002)(2501003)(6116002)(81166006)(256004)(81156014)(6506007)(66476007)(7736002)(68736007)(6436002)(2906002)(2351001)(305945005)(36756003)(6486002)(5640700003)(6512007)(486006)(1076003)(316002)(54906003)(2616005)(50226002)(476003)(6916009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3106;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DJZM+eGyXagsjqbfL1Bey6hj24gtPLUdskFRzZVTu5Gtmfivu0cZ6pQMN4j5uwZwbiCRX2FUUjgreIyUtydHtg23uab2PMYd475kFzhKWIZr1FgFAxXP/ONDi95esEozpg+w9NNUGMe2n8G7FedT0x80KDaXikRMEqTJCtjT1MI/jtXQv4sFiyFOLpnaOciVe6QKwTpaqr6R/c58suez2Rbj8YhB6/oWILvWFMxXShsJ04YaZq9XFQMISTDmJrXh3nVdwibwgEDbzi4vj1KP3OFYegc6Q/nn/C0gKP7SJQ++39LM7ZePE69Iyez9yISGuF+/bKgTawZDNlICgE0IdB7x+XFWaSMoBiGI/VgZ3qMTR7CWqdv1QhUdV/+OKNI9fKNSQWw4POtShY+3rZul44sapHx6Uoo+rK79e8cpFLQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: d3420823-2419-4f0c-5b4f-08d715ba1b63
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:22:16.5180 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jnwang@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3106
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH] Speculative mitigation facilities report wrong
 status v3
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
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 Jin Nan Wang <jnwang@suse.com>, "wl@xen.org" <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgY2hlY2sgYWJvdXQgWDg2X0ZFQVRVUkVfTURfQ0xFQVIgdG8gYXZvaWQgdG8gcHJpbnQg
Ik5vbmUiLgoKU2lnbmVkLW9mZi1ieTogSmFtZXMgV2FuZyA8am53YW5nQHN1c2UuY29tPgotLS0K
IHhlbi9hcmNoL3g4Ni9zcGVjX2N0cmwuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvc3BlY19jdHJsLmMgYi94ZW4vYXJj
aC94ODYvc3BlY19jdHJsLmMKaW5kZXggY2FkYTlhMDU4ZS4uNDY4YTg0NzU5OCAxMDA2NDQKLS0t
IGEveGVuL2FyY2gveDg2L3NwZWNfY3RybC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9zcGVjX2N0cmwu
YwpAQCAtMzY2LDYgKzM2Niw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwcmludF9kZXRhaWxzKGVu
dW0gaW5kX3RodW5rIHRodW5rLCB1aW50NjRfdCBjYXBzKQogICAgIHByaW50aygiICBTdXBwb3J0
IGZvciBIVk0gVk1zOiVzJXMlcyVzJXNcbiIsCiAgICAgICAgICAgIChib290X2NwdV9oYXMoWDg2
X0ZFQVRVUkVfU0NfTVNSX0hWTSkgfHwKICAgICAgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVB
VFVSRV9TQ19SU0JfSFZNKSB8fAorICAgICAgICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJF
X01EX0NMRUFSKSAgIHx8CiAgICAgICAgICAgICBvcHRfZWFnZXJfZnB1KSAgICAgICAgICAgICAg
ICAgICAgICAgICAgID8gIiIgICAgICAgICAgICAgICA6ICIgTm9uZSIsCiAgICAgICAgICAgIGJv
b3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TQ19NU1JfSFZNKSAgICAgID8gIiBNU1JfU1BFQ19DVFJM
IiA6ICIiLAogICAgICAgICAgICBib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfU0NfUlNCX0hWTSkg
ICAgICA/ICIgUlNCIiAgICAgICAgICAgOiAiIiwKQEAgLTM3Nyw2ICszNzgsNyBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgcHJpbnRfZGV0YWlscyhlbnVtIGluZF90aHVuayB0aHVuaywgdWludDY0X3Qg
Y2FwcykKICAgICBwcmludGsoIiAgU3VwcG9ydCBmb3IgUFYgVk1zOiVzJXMlcyVzJXNcbiIsCiAg
ICAgICAgICAgIChib290X2NwdV9oYXMoWDg2X0ZFQVRVUkVfU0NfTVNSX1BWKSB8fAogICAgICAg
ICAgICAgYm9vdF9jcHVfaGFzKFg4Nl9GRUFUVVJFX1NDX1JTQl9QVikgfHwKKyAgICAgICAgICAg
IGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9NRF9DTEVBUikgIHx8CiAgICAgICAgICAgICBvcHRf
ZWFnZXJfZnB1KSAgICAgICAgICAgICAgICAgICAgICAgICAgID8gIiIgICAgICAgICAgICAgICA6
ICIgTm9uZSIsCiAgICAgICAgICAgIGJvb3RfY3B1X2hhcyhYODZfRkVBVFVSRV9TQ19NU1JfUFYp
ICAgICAgID8gIiBNU1JfU1BFQ19DVFJMIiA6ICIiLAogICAgICAgICAgICBib290X2NwdV9oYXMo
WDg2X0ZFQVRVUkVfU0NfUlNCX1BWKSAgICAgICA/ICIgUlNCIiAgICAgICAgICAgOiAiIiwKLS0g
CjIuMjIuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
