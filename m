Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ECE6A335
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 09:47:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnI8z-0002Xc-8o; Tue, 16 Jul 2019 07:45:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LiPz=VN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnI8x-0002XS-N9
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 07:44:59 +0000
X-Inumbo-ID: 9a96214e-a79d-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9a96214e-a79d-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 07:44:58 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 16 Jul 2019 07:41:05 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 16 Jul 2019 07:43:29 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 16 Jul 2019 07:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mF/aWkpL/XUTdRoCNwIpIQ4yaoOfhlV5UQ0Y8g7/a7ya+QuRp+MVKhEnOoJVmSNdAt/bXuwq+DY7YFk+DIjD/1qeQpqDBGQgSRv2yuBH96FLlXEimxHlZ5Dw11E2+j/TdKPEEHfarPcrP1v2L8t0tej++q8HYj8XQhPoC8rymkWRtrECaQSAJ9nzQBnw6g/Bjucy8O7qc4VmHGxsfjjYNLBw75C163JSb5EpuJm42D0ZlW2JUMSecBgx1gRhbJX3lzU57irzLveqeAamCSL+49sP3CwFM80Q4eIogcV+AgUoK0P/JMPyS1D6KblINuRFQIROh6J1m2TC4nb3qTNPhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybRJuXWKhFezR7nBnLlUiUoVPERKAmS8rHtqDLOKRK4=;
 b=dKxh2fIcPs2ZceswfS5HM+sS8MOU0Pinb1dqal0iyXsANyG7rP1xGhl9R1pVP/jjb5YMhO5SEKfI9owAb3LysIJ5qufdUOkXE7+jNsBR6X0dQHgQsQ7SEod7ORYfnHVZ5M6aPiAll71+FiMiyhzHrt947Xg5JCkP9MMKVMpL4tlcuhoZwAkSB1DSd4wecDeXCjhpqBkZNM6KAsyKgbRx8VSo8I7rlr1oH6hNCodk/KJHmzki8/O3KMcTWTpDyTeCeMkM6gimrQhhRT4nLimHuBvCmnZCRTyhuqwA8tfGcQlG9fB5bQrcVVVdexu5KjkreeTT1N7rszLGFcliHdKnYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6SPR01MB0052.namprd18.prod.outlook.com (20.178.229.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.13; Tue, 16 Jul 2019 07:43:28 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 16 Jul 2019
 07:43:28 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v4 10/13] x86/IRQ: drop redundant cpumask_empty() from
 move_masked_irq()
Thread-Index: AQHVO6oom1TvgiYc9Uinigs089keTA==
Date: Tue, 16 Jul 2019 07:43:28 +0000
Message-ID: <43977168-1b35-47b8-9829-09a167c6c2e3@suse.com>
References: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
In-Reply-To: <5cda711a-b417-76e9-d113-ea838463f225@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:46::33) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 825ddda6-6244-474b-a35d-08d709c14ab2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6SPR01MB0052; 
x-ms-traffictypediagnostic: DM6SPR01MB0052:
x-microsoft-antispam-prvs: <DM6SPR01MB005233E78809DD157292280FB3CE0@DM6SPR01MB0052.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(199004)(189003)(6116002)(6436002)(25786009)(478600001)(31686004)(6486002)(3846002)(86362001)(52116002)(8936002)(68736007)(8676002)(446003)(76176011)(386003)(102836004)(6506007)(186003)(31696002)(14454004)(2351001)(26005)(66556008)(66066001)(2616005)(11346002)(476003)(305945005)(71190400001)(2906002)(54906003)(6512007)(71200400001)(53936002)(2501003)(316002)(99286004)(66446008)(256004)(4326008)(7736002)(80792005)(66946007)(64756008)(486006)(36756003)(6916009)(5660300002)(81156014)(66476007)(14444005)(81166006)(5640700003)(4744005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6SPR01MB0052;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: oO7dCDx1V0oKxQNXSSCMWh6rq+lPCMI+K9hiaiMRDmVppHKkzWTaz3j+o3Og500xtCOKD8jongmtc3+ifplnMVz75mg0T5g9gBJpIqHpkJKCL6i9cLkVctEv5akzc1VRn1EqRMBl6uKXG03j6idkLK5KBwEF3BZ3JrRu05B5Ui2D0nJUf/ig4/uootygh24KG1/DkZc0ZzK/O0Hiu9yoZl8GawGHvOwsyNW0iO3VLXBDhgGABer3GQBsBhuHMGg60UsG0eqx7OAWKqN9xEQ4F33LtvCfaYvOSGh2aqdEBOUrY3f0U1YDTS8PtZPMxXYmPNs3DI5K94qD9MLlkrNbsLm+KuQr8qM0xewDVeNPIjuXzO5QLjMF6C4CUp0ccXsC+5MuoEz7aG+yZAycbj9aGmwqj3Jndwqkfgf5KHEWKnY=
Content-ID: <CF1B94B77C442F4F95EF6107A8660DD9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 825ddda6-6244-474b-a35d-08d709c14ab2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 07:43:28.3893 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0052
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v4 10/13] x86/IRQ: drop redundant
 cpumask_empty() from move_masked_irq()
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

VGhlIHN1YnNlcXVlbnQgY3B1bWFza19pbnRlcnNlY3RzKCkgY292ZXJzIHRoZSAiZW1wdHkiIGNh
c2UgcXVpdGUgZmluZS4NCg0KU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPg0KQWNrZWQtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
DQoNCi0tLSBhL3hlbi9hcmNoL3g4Ni9pcnEuYw0KKysrIGIveGVuL2FyY2gveDg2L2lycS5jDQpA
QCAtNjU4LDkgKzY1OCw2IEBAIHZvaWQgbW92ZV9tYXNrZWRfaXJxKHN0cnVjdCBpcnFfZGVzYyAq
ZGUNCiAgICAgIA0KICAgICAgZGVzYy0+c3RhdHVzICY9IH5JUlFfTU9WRV9QRU5ESU5HOw0KICAN
Ci0gICAgaWYgKHVubGlrZWx5KGNwdW1hc2tfZW1wdHkocGVuZGluZ19tYXNrKSkpDQotICAgICAg
ICByZXR1cm47DQotDQogICAgICBpZiAoIWRlc2MtPmhhbmRsZXItPnNldF9hZmZpbml0eSkNCiAg
ICAgICAgICByZXR1cm47DQogIA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
