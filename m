Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C7D7FD95
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 17:31:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htZU4-0002FJ-3L; Fri, 02 Aug 2019 15:28:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htZU2-0002F8-Jv
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 15:28:42 +0000
X-Inumbo-ID: 319e1e46-b53a-11e9-a814-27c0d6d9437d
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 319e1e46-b53a-11e9-a814-27c0d6d9437d;
 Fri, 02 Aug 2019 15:28:38 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 15:28:34 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 15:25:24 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 15:25:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bi6RTKUYhSEIEVOJCuP1bpd+REG1DvzZU/WplM/D8HiKCyhWJPg85GJ8YMqEl7vFyJep91uBnoKFfK397+sjYxaEZzWtBvxi5qxK3Pq4GfRJc5O8psR8d65VU3FeKEZH+GM9stHeOyjpPPpDgy8An/vtUBghKgYHN7CaZZp0CDrchUVax7DCqFqMaGhx1FxPsB4IWPx1kYeTgC+23cl4Y4mpbFJT6mWyUUgKX0UgFWjP+TBH9aJxiDVUOVdYF4i/aBrXu5MPF3S8fFF/6MJje/8BpBgHqbIX8+M0wxjeX9KMqiLL/ynDGfWEnB8lrIOvA7Id+WKgbNS8d6IHWoAJ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wqw8KwJ7LqDkeWmmZiQ27tWGx7DRrS9p8iUmAvg82eA=;
 b=iT+XVvx/0bo0hCFSFyCYDDiqOH1H4jVe7aMkXPYlnKsrEBlej+IXEXadXsYCfx+gIqrqsHpR+jh1QiEWVYa5n8zYIKCh0RBkGs/NsStpU2s4+SsgmPHYkFIcImx5dhZjNKfUhFGqq3YijSj9BnMlfl87y2CEEBtyUpRFCNUwZwbioLJEMIgXKWmVQuJnRyZsaqCKMaV1JNiAcTvsPg9HHjgdAGOjO37TVQqStjxq7ieRfYG9pVJeQkbcUoYXZ31lItMQNYtKrM/X3ZKD96ZJVOsO3YwpNxU+HvdD/4w4Yme8weMFh0+a267XDPNzKAetRCqhWtYrcnQXDkXbBpj+gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2426.namprd18.prod.outlook.com (20.179.104.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Fri, 2 Aug 2019 15:25:24 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 15:25:24 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Chao Gao <chao.gao@intel.com>
Thread-Topic: [PATCH v8 11/16] microcode: pass a patch pointer to
 apply_microcode()
Thread-Index: AQHVSUaBQotCatj0TUeaiX8Xt1rNBA==
Date: Fri, 2 Aug 2019 15:25:23 +0000
Message-ID: <da512634-6da2-669b-21b2-72ab17f3685a@suse.com>
References: <1564654971-31328-1-git-send-email-chao.gao@intel.com>
 <1564654971-31328-12-git-send-email-chao.gao@intel.com>
In-Reply-To: <1564654971-31328-12-git-send-email-chao.gao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0049.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::13) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3939296c-fd0e-4fa5-bd93-08d7175da367
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2426; 
x-ms-traffictypediagnostic: DM6PR18MB2426:
x-microsoft-antispam-prvs: <DM6PR18MB2426928B22A87E5862308F29B3D90@DM6PR18MB2426.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(376002)(136003)(366004)(346002)(396003)(189003)(199004)(8676002)(99286004)(14454004)(26005)(305945005)(256004)(7736002)(8936002)(478600001)(3846002)(6116002)(31696002)(66446008)(5660300002)(66946007)(4744005)(64756008)(66556008)(66476007)(6916009)(66066001)(86362001)(186003)(36756003)(11346002)(2616005)(53936002)(386003)(476003)(6486002)(446003)(6436002)(6512007)(102836004)(486006)(52116002)(53546011)(81156014)(81166006)(71190400001)(71200400001)(25786009)(54906003)(80792005)(6246003)(316002)(31686004)(68736007)(229853002)(2906002)(6506007)(76176011)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2426;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: al26yDNNhSNt5P2AQkrl22AeAJqifc5oVbQ7OWRftu8wVOA3RfDScjOUJifjMNAQxEFYWQrFc8xqTBYXkBlW/ERmIDpz1Hz2a9K7M0nBudSOBC0nsWLR0jw23FWzUFpiS/ffZi++2ThMOmtdQ9T/EFVNUuO+qQP23TrGnadsWVCzub6mgSpSF/R9Q6anfpICVRYzkWmYJtUXRYM3CMAONfhq1VWb6A2TJ9gGxaXWJwpLDrB00ukdgHe4t6pRoK65jHn+futvh8nQI8ECsYw7jglTowflhnKNUt8/EyHXhLc4TNamCFYkoR7osK23lgfvF4pSF2JzqqS+9K2TY8lHpPSo8i10pzz92XUqpui1+zDq7zNG9deYVGvWTyvKX7RM4r9Td50pvAYDoavxcb7xYlUY9124ywGmIvaXi4QdoiE=
Content-ID: <DD5BDECD42E2CE47B218C73E83CDF006@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3939296c-fd0e-4fa5-bd93-08d7175da367
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 15:25:23.9995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2426
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v8 11/16] microcode: pass a patch pointer to
 apply_microcode()
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDguMjAxOSAxMjoyMiwgQ2hhbyBHYW8gd3JvdGU6DQo+IGFwcGx5X21pY3JvY29kZSgp
J3MgYWx3YXlzIGxvYWRpbmcgdGhlIGNhY2hlZCB1Y29kZSBwYXRjaCBmb3JjZXMNCj4gYSBwYXRj
aCB0byBiZSBzdG9yZWQgYmVmb3JlIGJlaW5nIGxvYWRpbmcuIE1ha2UgYXBwbHlfbWljcm9jb2Rl
KCkNCj4gYWNjZXB0IGEgcGF0Y2ggcG9pbnRlciB0byByZW1vdmUgdGhlIGxpbWl0YXRpb24gc28g
dGhhdCBhIHBhdGNoDQo+IGNhbiBiZSBzdG9yZWQgYWZ0ZXIgYSBzdWNjZXNzZnVsIGxvYWRpbmcu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29tPg0KDQpS
ZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
