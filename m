Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 792E26CDD1
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 14:05:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho57a-0001gS-VN; Thu, 18 Jul 2019 12:02:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho57Z-0001gM-8P
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 12:02:49 +0000
X-Inumbo-ID: f525f3df-a953-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f525f3df-a953-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 12:02:47 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 11:58:55 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 12:02:07 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 12:02:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VtqoT/joegEtzCn+Gsz/FuUTIzYij9PL8RZc2JXuwfyrSvVnzi/7fKs39/c6yHF1CGPNlSqmR1+tCszwdQBpyo7EhCuD+rab7+jqFJcBDl590+J+Pu/E1beTuLNwTM0LsXXzXB4XTrl5Hu26byeebhr7PdjU/SyP+/lklURYq/ViXc/uipFCzQ3rKYUyDb0KdeQBso5tDNU4Ncq0YXvwATasFlmkhEU/dxdK/PakzhBLka6vBTimYEFgPRxIcw0gBd2pjeSI2PTIrCwKRjlU7BrFMw0bpoi4+w8NxhhIjOcZe0FUNCScXQ3jBFK6LsWGZnYArg81bPuzUeTszz9vWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o7Fahs33I7eWZ5xhaETOj2uwvsx5JyU/d88qFO8+lz0=;
 b=KKh99Mpp/GYHCQvITS8fM5PR5qSx/6kG+qSQ+mZD0E4+BlJnbARw706+PLiMhrwQGXemR4N0awHB33wZGhoSXUG93Q9yeMuNVrSMNROICp4yo1TBpnm9nEu88ZfUqhqy4+C1ZqbcWcqYTUZhqJQGwUtuYd8GJueRgR0dPE7mrHLi3yaICosoTvyTOqdyy4v/vkvgaSckMwKPjvk30FqwfSt6+vo5T1Mot6oFqMS/JK83o5salZFSfE0BfLkdqpqAgwxd2i9UjvrI0WkggT8PfGz5MfNl7uJpDEH/bMLUA48UolheCYN9b/uhp+HxdBE4Z55bSf/pvesVh4YVB6ZqpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2681.namprd18.prod.outlook.com (20.179.107.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 12:02:06 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 12:02:06 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 0/2] x86: port self-snoop related patches from Linux
Thread-Index: AQHVPWCeOVbFKPQYpUu9z2i8gnFCCg==
Date: Thu, 18 Jul 2019 12:02:06 +0000
Message-ID: <31d4cb3f-6ff0-a13c-00ce-bced77c6dd78@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR04CA0028.eurprd04.prod.outlook.com
 (2603:10a6:10:12::41) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe9c5b53-00d0-427b-22c3-08d70b77c117
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2681; 
x-ms-traffictypediagnostic: DM6PR18MB2681:
x-microsoft-antispam-prvs: <DM6PR18MB2681E5493D221EE5A04F7484B3C80@DM6PR18MB2681.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(189003)(199004)(6506007)(4326008)(316002)(386003)(478600001)(66476007)(71190400001)(71200400001)(66946007)(5640700003)(2906002)(8676002)(2351001)(486006)(6512007)(476003)(2616005)(31696002)(6916009)(6486002)(6436002)(86362001)(256004)(558084003)(26005)(66066001)(66446008)(66556008)(31686004)(64756008)(186003)(14454004)(68736007)(36756003)(80792005)(81166006)(305945005)(52116002)(99286004)(81156014)(5660300002)(6116002)(3846002)(8936002)(102836004)(53936002)(54906003)(2501003)(7736002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2681;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NWAsEWBaWEikNzRnTc8WMXozm46IJQZc+hCOz+qve7Sy9bRJkm/AWY6r8iu9xpkGcIDTOwII45UGoj7uy5cx97kubCViKWTB2rRjQChzuQHaqWZi/yIKk5W3xp8UJ2CuwnPnrjzkbXmALmqROld42z71xt9+446r5ThzSe+XUOehpk5xglk1MP5kKVevcZKQKxUvVR7zImYa3vhDJapjZnHOYET2pWlI8lD7GY5P1HapPSslMO5K611L+EdDwXBfSTYDf31DCXY5mEn+Ung/gsrClXQoUlJuXw/rrcv9f5ePcxedIeMUZMVE+lHzAYDdbDkwSt2PlCE3gWL3XpkDKU3W7Bd2K4bE7dJ8ppWwL+amAZ6BUhq4QjlMO6/LT/6I3XEwrvBEI6wWBHtgH2LYP6JvAUfZiFSiJZscBAXfMJs=
Content-ID: <5FDA68BFC4663E4FB937807BB0B94A28@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9c5b53-00d0-427b-22c3-08d70b77c117
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 12:02:06.6915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2681
X-OriginatorOrg: suse.com
Subject: [Xen-devel] [PATCH 0/2] x86: port self-snoop related patches from
 Linux
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
