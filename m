Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA596E746
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 16:26:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoToY-0000vi-W4; Fri, 19 Jul 2019 14:24:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hoToX-0000vb-5v
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 14:24:49 +0000
X-Inumbo-ID: f167901e-aa30-11e9-bfb2-6b1896c4b41d
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f167901e-aa30-11e9-bfb2-6b1896c4b41d;
 Fri, 19 Jul 2019 14:24:45 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 19 Jul 2019 14:24:34 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 19 Jul 2019 14:23:45 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 19 Jul 2019 14:23:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m4lCzwmHHfyMsY7q51wtxRjxKoJb7to+o+oDXWyg/CufP2BJqn7FX9Uxehjpiim3uLuTjo7hq7Dm4jk8lD+GmGhVvYtQ6o7FSoy5SZ1CZ76xWOTkCvhnNGzW64kTiK/GAMmVaSICyKmZbGisChu5ea5zkOMY8dw8sTHBY77J4NaT4q4UyBQhzRBCxSlGapEnU4CNhwu5hNjMTUjTnf7n6FF1u6KhwGC6mofESy/4vwdBl+S7ZGKzw2fNGgsBE7189Yf8bW2IkNELjU3LYrFoUZNurFbQWuU05jOvyLc2vuFrbh8Y3/j/zTR6jLmVhEvCT/28IsjiNjQfBYKBBL1n9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=smBfI6z4ckUuVaxrLWMmsIUpaDZ1NDl2WA3ZW12q7fA=;
 b=RT+v0p2vf7HXeFIkiXviJb1VVIU0uPUtMJ/EYjDQraNWnku2toelXYtcV8Ys5KNoI/6fceJ2EzX9MURqOVjIzFSCpV4eleZ6vN7BV4jFsoeReUXxjBXXSfEUV6A6ghcK5AAGLCmoMj06QfBEGMuiQuqtFSPS2tO2IyfOPxuAA+lLHoqoTQebh+g81YDZXXZRNFlFqWElo+P/Sr6mk8ywQdHawoNKCbmKzaOQUB80IOyrKdfu1Sqc2W7/5eNcI5JIhBjvSKlPAhFNM6MaGpZHXWmj4bnSySYwlHNyJLwJc+Ojjw+lKUP7XsQ8Rw5D9NwSdOe+Hoifq9vmvIbKHlRxzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2540.namprd18.prod.outlook.com (20.179.105.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Fri, 19 Jul 2019 14:23:44 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Fri, 19 Jul 2019
 14:23:44 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: preparations for 4.12.1
Thread-Index: AQHVPj2SYnjK2Jp9JUOJM4bdl2JgJA==
Date: Fri, 19 Jul 2019 14:23:44 +0000
Message-ID: <b1008379-a9cf-f7ab-b34b-da463ec5f074@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0306.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::30) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 216a86ed-1869-47d6-ab72-08d70c54b488
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2540; 
x-ms-traffictypediagnostic: DM6PR18MB2540:
x-microsoft-antispam-prvs: <DM6PR18MB25400BDF515D5309F12554F3B3CB0@DM6PR18MB2540.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 01039C93E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(366004)(346002)(376002)(136003)(39860400002)(189003)(199004)(8676002)(99286004)(54906003)(31696002)(305945005)(86362001)(7116003)(71200400001)(6916009)(7736002)(71190400001)(4326008)(2501003)(316002)(80792005)(6506007)(386003)(558084003)(66446008)(81166006)(8936002)(66556008)(66476007)(64756008)(66946007)(81156014)(68736007)(5660300002)(31686004)(52116002)(6512007)(2906002)(53936002)(26005)(102836004)(186003)(6486002)(476003)(2616005)(5640700003)(66066001)(36756003)(6116002)(3846002)(6436002)(14454004)(486006)(25786009)(2351001)(256004)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2540;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: s58yMlw8yM2h0nOHyj9xw5uJiQ7HiK/lAtWYCEOTzUYItt3jsc+uc6Z5DpZW3mn67n3h/1oHTy/a9SHCSd9FOZU6hrcy5d0+dqmiiB1R/9WWw9WOI8XtlLpo4FvyMUSUrHePGVWks2oM09Gzqul0w0UDKep0RphPXYX5at1SleLsZdQm4b7O1AWCATvVCdrJuG9Dtg6AMgf/pdpHoGId549r7AWnRCTOnkNlApcV6NpmCrlbqaMxLgy5Sq2GXojfVR7ZuI+n5mK2gRcDHLHUMlbrxE8Huf923jDd7XeoWY0AokTuHzTj7zqrKN0fpilypHhU/I+ePdqUWf2EFhYB+63PC3ifRSQwPfoJyBfNOQadnawHwN1W30s/aTvORdUHo8OeduxqA2d7OGKe5IYF+Lc22p8oBY/2BAdlRefLAe0=
Content-ID: <CD30D35805CB2743B91B3137BBE242D9@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 216a86ed-1869-47d6-ab72-08d70c54b488
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2019 14:23:44.2945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2540
X-OriginatorOrg: suse.com
Subject: [Xen-devel] preparations for 4.12.1
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Lars Kurth <lars.kurth@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsLA0KDQp0aGUgcmVsZWFzZSBpcyBkdWUgaW4gZWFybHkgQXVndXN0LiBQbGVhc2UgcG9pbnQg
b3V0IGJhY2twb3J0cyB5b3UNCmZpbmQgbWlzc2luZyBmcm9tIHRoZSByZXNwZWN0aXZlIHN0YWdp
bmcgYnJhbmNoLCBidXQgd2hpY2ggeW91DQpjb25zaWRlciByZWxldmFudC4gVGhlIG9uZSBjb21t
aXQgSSd2ZSBxdWV1ZWQgYWxyZWFkeSBvbiB0b3Agb2YNCndoYXQgd2FzIGp1c3QgcHVzaGVkIGlz
DQoNCmVjMmFiNDkxYjUJeDg2L2VwdDogcGFzcyBjb3JyZWN0IGxldmVsIHRvIHAybV9lbnRyeV9t
b2RpZnkNCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
