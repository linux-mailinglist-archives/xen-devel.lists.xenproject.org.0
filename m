Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 655706B6A8
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 08:30:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hndQE-0003b1-20; Wed, 17 Jul 2019 06:28:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hndQC-0003au-4Y
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 06:28:12 +0000
X-Inumbo-ID: 0b8b95f1-a85c-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0b8b95f1-a85c-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 06:28:10 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 06:24:18 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 06:27:18 +0000
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 06:27:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a8e46oiaWTQvlriGrnern+vZJyVveXtRCLTKLcgBbQTHl8m09spWsyXTrxtWJ6LUEflpxwOob5f4oHP+yVejz0qM4dSJihXV9HMobqxYK+oo5p9HHKWPeTYqR5oq027kTl+k5gp/58wySJtq9U/z6MbYPxHkLGqcQ1asS48bYWTMEwtznJQvhr4KNFzS2maCE9S1CeYvvAWUoVLW1JwcdLS20eo2nx+mUGK5RBnZQ/JhIdNGIJzqL52Ls/czyp8JWvRdim3Ndr0dRxe3wOENM8ZkZpPW9LmDk7vmWVXENJkUv+FZsRawwpntb3lygDBXZ8fNbImsb6xNE6gwLXyMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8r7xaf7bQWB9j8bmZgRv6boeOFgdq/32Dei3jLKgCc0=;
 b=EB0JN8HNSfTMca74/42VJZe/8d6D7gLmqcXVZbCEdDfbihwy444+wf1CyirOlmRY2PSc8RsDT4wB3DgTts6VUJ+4rRoLPMC2anT7I4PrsnqEf2G+49+3vTqLXk5H07XrcS++nRGK65HOX+oZ0ZGv9KWFVISI5UVubSpBKuDWiO0hqXwYHzCcw4nATQbKT64v8ZccprJAu+m6xvW967fQ1aZr7zMULZsGzYz3sSJNKF7qQKfE4KAlyybdzJhczbsCVkNnK2FavGnGZQgNHrmWnQK/92m3ELhsR4sddWSYSApRKtf52n80d8/NERoSfF3oFrGRP2QvI6S5P8XrXOdqlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6SPR01MB0022.namprd18.prod.outlook.com (20.176.117.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 06:27:17 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 06:27:17 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v10 00/13] x86emul: remaining AVX512 support
Thread-Index: AQHVPGitoYi7y3FyzEusN/wrf9ZEuw==
Date: Wed, 17 Jul 2019 06:27:17 +0000
Message-ID: <0ccca19e-7bbb-ab1e-c0bb-a568b02874e0@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR06CA0043.eurprd06.prod.outlook.com
 (2603:10a6:10:120::17) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43def4e6-82e0-47ae-c37c-08d70a7fd049
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6SPR01MB0022; 
x-ms-traffictypediagnostic: DM6SPR01MB0022:
x-microsoft-antispam-prvs: <DM6SPR01MB00223EF45D60D10550FB1B3CB3C90@DM6SPR01MB0022.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(189003)(199004)(68736007)(71200400001)(53936002)(52116002)(386003)(81166006)(6512007)(81156014)(8936002)(186003)(6506007)(36756003)(4744005)(99286004)(71190400001)(316002)(26005)(6486002)(2501003)(5640700003)(478600001)(102836004)(25786009)(6436002)(256004)(64756008)(31696002)(476003)(66556008)(2616005)(66476007)(4326008)(14444005)(486006)(54906003)(7736002)(86362001)(66946007)(305945005)(66446008)(2906002)(5660300002)(14454004)(66066001)(6116002)(3846002)(80792005)(6916009)(31686004)(8676002)(2351001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6SPR01MB0022;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: f3hjANEPplMSZyobATdjbStKkTp6/C7Di6+tmmjxCqx5wiwP3OcId7Na5/rAQvwih8KFeLQ4vCOPSLJQNZ6u5l+zbEKoaAovhn8y+54J9goKUT1msa045ixijStE5Jm9xic/CE8/xI5w85cnVycX/6aFQ0MPuouBA7OEseIS6HdVE+zXWLmyO4V2oZMG9omQVWSXUxZBFtzNkKGFKpxRNF4aluA43IbmO4xQlqaNfxlw7uoXCbej8id1h/5qO5WTdzocETSbsEh4niY2E67YGXrLhph2fVS8DpGyPE2G7MT4pOSjnd+puM5Ley/K/GP2JnwKaNeQHVZ0PNORb/h4hHnFd9Otl9Y6m5OYiiQuneTd5lqCAjQh6TEF+hVXDsOIanmFK22Sgg3+tINqjx6atM2kbOhk3JwT4IEZFrkPQbg=
Content-ID: <577A05E7FD23DE4083E50FB1C0E590CA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 43def4e6-82e0-47ae-c37c-08d70a7fd049
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 06:27:17.0272 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6SPR01MB0022
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH v10 00/13] x86emul: remaining AVX512 support
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Roger
 Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MDE6IHN1cHBvcnQgb2YgQVZYNTEyKiBwb3B1bGF0aW9uIGNvdW50IGluc25zDQowMjogc3VwcG9y
dCBvZiBBVlg1MTJfSUZNQSBpbnNucw0KMDM6IHN1cHBvcnQgcmVtYWluaW5nIEFWWDUxMl9WQk1J
MiBpbnNucw0KMDQ6IHN1cHBvcnQgQVZYNTEyXzRGTUFQUyBpbnNucw0KMDU6IHN1cHBvcnQgQVZY
NTEyXzRWTk5JVyBpbnNucw0KMDY6IHN1cHBvcnQgQVZYNTEyX1ZOTkkgaW5zbnMNCjA3OiBzdXBw
b3J0IFZQQ0xNVUxRRFEgaW5zbnMNCjA4OiBzdXBwb3J0IFZBRVMgaW5zbnMNCjA5OiBzdXBwb3J0
IEdGTkkgaW5zbnMNCjEwOiByZXN0b3JlIG9yZGVyaW5nIHdpdGhpbiBtYWluIHN3aXRjaCBzdGF0
ZW1lbnQNCjExOiBhZGQgYW4gQUVTL1ZBRVMgdGVzdCBjYXNlIHRvIHRoZSBoYXJuZXNzDQoxMjog
YWRkIGEgU0hBIHRlc3QgY2FzZSB0byB0aGUgaGFybmVzcw0KMTM6IGFkZCBhIFBDTE1VTC9WUENM
TVVMIHRlc3QgY2FzZSB0byB0aGUgaGFybmVzcw0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
