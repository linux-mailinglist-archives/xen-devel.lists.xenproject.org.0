Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 110CD74EA6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 14:58:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdHO-00048t-3D; Thu, 25 Jul 2019 12:55:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqdHM-00048o-CC
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 12:55:28 +0000
X-Inumbo-ID: 76a1e1b8-aedb-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 76a1e1b8-aedb-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 12:55:26 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 12:55:23 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 12:54:48 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 12:54:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJvRjrtOXtcEQuT1wVqTRorEprSv70bgzxWJsjsWwXjgIrFnkKj5XYoO7H4k/L8bxxEnZHcTIcF6tD90isuftw9FYHjdvY2P8Pc7lWLnEfddvNYy3enG1fBAaXEi0ZE1ZIdTzBM3Dvw7s1nA4mSXbohlFhBUz3Uks8ytIIWk46m43bdgNTC44znQoO3xl1vBjJlLKsfBN+64WhZY6V7QJlw9kwY5hEr5Nc03g9mfMS3kFoS+hlNtK21YMYB4sCRXuJU1essrprxyRw5SYRoF8mAuYtOIyGdiYgJ02/wY4qwBYKrCQ5qIOC1sXpr6sL2Kef6kmAa1deSECFkZFlc2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gm6gcjV0VndUKfHSUorVG0AEp7/WRznLySsqr0y0UL4=;
 b=Rh2IzEbH+LFiN/1FqvnmQlObyS4stnWSDYJIpN0p990h90Poa5vzjA149jWCQj3tnDCJMsNclvV5YKVU4coteOCF+dTKckwngU9rd0f0KFQjfbbfIjMl3IwUzJgZZjN2Z0qTBJMQ33v9Vm2n+EsnRFiV5XDw8HjDDXvIMnSCfb3MEXNshpN8OF0rhnd84Cr2ac73dv6OCCAy5kNkxXa68wRtxrWZj/F6MEjj7UgeFrTUOJIdIqFm6JEMref43WzNOGMdzzHkResGJaBDMmt/Wlhuw+n3xKMHflw8GmAh0hxeg9Iq4FYLd0EAoiuNdynCzuK2Rg4zcpW1y8qGCgjiNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3363.namprd18.prod.outlook.com (10.255.139.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 12:54:47 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 12:54:47 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Fredy P. <fredy.pulido@savoirfairelinux.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] CPU frequency throttling based on the temperature
Thread-Index: AQHVQiidALk+x0uDw0GmzsE7VlPwJabZ1pPngAANq/uAAARaX4ABYPjhgAACXQA=
Date: Thu, 25 Jul 2019 12:54:46 +0000
Message-ID: <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
In-Reply-To: <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0114.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::30) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e1e6786-d331-49f0-11f1-08d710ff4598
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3363; 
x-ms-traffictypediagnostic: BY5PR18MB3363:
x-microsoft-antispam-prvs: <BY5PR18MB336389A305468F00970972C4B3C10@BY5PR18MB3363.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(346002)(376002)(396003)(39860400002)(199004)(189003)(5660300002)(6506007)(53546011)(386003)(6436002)(102836004)(26005)(76176011)(99286004)(52116002)(14454004)(478600001)(31686004)(71190400001)(71200400001)(4326008)(81166006)(446003)(11346002)(2616005)(476003)(66446008)(110136005)(3846002)(25786009)(54906003)(316002)(4744005)(486006)(66556008)(66476007)(66946007)(68736007)(229853002)(186003)(64756008)(6486002)(8676002)(2906002)(81156014)(8936002)(36756003)(53936002)(7736002)(6246003)(305945005)(6116002)(66066001)(86362001)(6512007)(256004)(31696002)(80792005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3363;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ulWR4aDss9WfweqJqFkSOgt/ucVJHcoqb8Unek/yxsvxZaBnk9azqZtyDGHybpqr6Xf6bTLK98ZIaRw9JwQbj3XI3Mcrkexv/PL6ftZXvRLyWzCf42UjTLtkuIUqkKvL/uLXIpcwMo51vlLoooXyDGY3bg0oTMj8ugQsLxOzJ1yinsJkItNFvzI+Gl27HMe5NtLSRJJ43FNS+RciZFep6fOVhcBa9AkOPxQ6pOIhyc1Sm6ewmRw3aBVtbZtXAK6SXDsOg++hXa8HQ74R9JvS/bgXbEo6jx35JU1KP9F73JQuDpLDhqKBoQ/fQEvCs07KfYKDyT4Y2ugs/tvVwZOQnfOwkUWaJwqWPJznVSY9fRsnnrfrEhOhO6KKfXTmHuPSWx28a+sWDa5IQN+MMI32iNpqj16isMgdb0ex7z6WpDg=
Content-ID: <05E31FC86E0E904493202C96CDC84274@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e1e6786-d331-49f0-11f1-08d710ff4598
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 12:54:46.9651 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3363
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxNDo0NCwgIEZyZWR5IFAuICB3cm90ZToNCj4gT24gV2VkLCAyMDE5LTA3
LTI0IGF0IDE3OjQxICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+PiBXaGF0IGhh
cmR3YXJlIGludGVyZmFjZSBkb2VzIHRoZXJtYWxkIChvciB0aGUgZHJpdmVyIGluIExpbnV4IGlm
DQo+Pj4+IHRoZXJlJ3Mgb25lKSB1c2UgdG8gZ2V0IHRoZSB0ZW1wZXJhdHVyZSBkYXRhPw0KPiAN
Cj4gSW4gb3VyIGluaXRpYWwgUE9DIHVzaW5nIFhlbiA0LjgueCB3ZSB3aGVyZSB1c2luZyBMaW51
eCBjb3JldGVtcCBkcml2ZXINCj4gcmVhZGluZyBieSBleGFtcGxlIC9jbGFzcy9zeXMvaHdtb24v
aHdtb24wL3RlbXAzX2lucHV0IGJ1dCBpdCBnb3QNCj4gZGVwcmVjYXRlZCBhdCBjb21taXQgNzJl
MDM4NDUwZDNkNWRlMWEzOWYwY2ZhMmQyYjBmOWIzZDQzYzZjNg0KDQpIbW0sIEkgd291bGRuJ3Qg
Y2FsbCB0aGlzIGRlcHJlY2F0aW9uLCBidXQgYSByZWdyZXNzaW9uLiBJIHdvdWxkDQpzYXkgd2Ug
d2FudCB0byByZS1leHBvc2UgdGhpcyBsZWFmIHRvIERvbTAsIHRoZSBtb3JlIHRoYXQgdGhlDQpj
b21taXQgYWxzbyBvbmx5IG1lbnRpb25zIHVucHJpdmlsZWdlZCBkb21haW5zLiBBbmRyZXc/DQoN
Ckphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
