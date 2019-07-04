Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691B5FA7F
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2019 17:02:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hj3Cc-0007LT-Um; Thu, 04 Jul 2019 14:59:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SvFn=VB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hj3Cb-0007KD-GV
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2019 14:59:13 +0000
X-Inumbo-ID: 481191ee-9e6c-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 481191ee-9e6c-11e9-8980-bc764e045a96;
 Thu, 04 Jul 2019 14:59:11 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  4 Jul 2019 14:59:10 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 4 Jul 2019 14:54:42 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 4 Jul 2019 14:54:42 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3105.namprd18.prod.outlook.com (10.255.136.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Thu, 4 Jul 2019 14:54:41 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Thu, 4 Jul 2019
 14:54:41 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 11/23] x86emul: support of AVX512* population count
 insns
Thread-Index: AQHVL/8+w7wOwPiMakCGalDz/ydOwKa6jtGDgAAB+QA=
Date: Thu, 4 Jul 2019 14:54:41 +0000
Message-ID: <e95d1c2c-feea-b8cc-0fca-a005668f269f@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
 <745c685a-a614-6067-946d-c89fe98cb589@suse.com>
 <3240eb2e-ff32-bfc6-fa49-0cc8bb84582d@citrix.com>
In-Reply-To: <3240eb2e-ff32-bfc6-fa49-0cc8bb84582d@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DBBPR09CA0041.eurprd09.prod.outlook.com
 (2603:10a6:10:d4::29) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82e78da2-3f13-4c34-d17a-08d7008f8b37
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3105; 
x-ms-traffictypediagnostic: BY5PR18MB3105:
x-microsoft-antispam-prvs: <BY5PR18MB31051397F68656314B6D143AB3FA0@BY5PR18MB3105.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0088C92887
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(199004)(189003)(52116002)(110136005)(305945005)(316002)(76176011)(8936002)(7736002)(6116002)(81166006)(81156014)(8676002)(2501003)(66946007)(86362001)(66446008)(102836004)(66556008)(66476007)(72206003)(64756008)(53546011)(386003)(11346002)(256004)(486006)(53936002)(6506007)(2616005)(446003)(6436002)(31696002)(99286004)(476003)(3846002)(14454004)(54906003)(186003)(73956011)(80792005)(5660300002)(31686004)(478600001)(68736007)(2906002)(229853002)(71200400001)(71190400001)(6512007)(6246003)(25786009)(4326008)(66066001)(26005)(36756003)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3105;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DdjJfwYe/L+dMeps5GY+7mmgI0a5MGvF4Id7L9UhdSN2D7HMdk7U7PQjXhlmqyNh/QXufm5D+607Hu1jrVQ+0F+y26AAxV5tCzr2XJJuUP2QuydEpifJ5/CdFalCgxD/lVR6bfRGu5VdkmXowXtg9YHBNlzFnlC+I4d214V4u/je6El4bf8YvkAGx9TakiBtVB8dfye/V9WPScOVkSoX0pIlToI08Vs/WSgIx8CaSDDTnkIT4SeXtK1FWAUMUT9tOJVgI7T2Vc0hlwZDthP+mVMiFtPttQDIixPZTeDJ4CqOzZzQFn47VFu1TLyOkamF+f6ABP/Zm6LXZpuvEufuOL2MMPWg3kNJ9CRbGjgWjHEecS8FHVkVSn9V47YHXELbLb4ZGaF0swgw4wH5Enb3bGFPBDsagpCr9pErkEl31fE=
Content-ID: <4C23CA7DF6921E4AA52942618FC14FA6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e78da2-3f13-4c34-d17a-08d7008f8b37
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2019 14:54:41.3558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3105
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v9 11/23] x86emul: support of AVX512*
 population count insns
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
Cc: Wei Liu <wl@xen.org>, RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDcuMjAxOSAxNjo0NywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDEvMDcvMjAx
OSAxMjoyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiAtLS0gYS94ZW4vdG9vbHMvZ2VuLWNwdWlk
LnB5DQo+PiArKysgYi94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5DQo+PiBAQCAtMjY4LDcgKzI2OCw3
IEBAIGRlZiBjcnVuY2hfbnVtYmVycyhzdGF0ZSk6DQo+PiAgICAgICAgICAgICMgQVZYNTEyIGV4
dGVuc2lvbnMgYWN0aW5nIG9uIHZlY3RvcnMgb2YgYnl0ZXMvd29yZHMgYXJlIG1hZGUNCj4+ICAg
ICAgICAgICAgIyBkZXBlbmRlbnRzIG9mIEFWWDUxMkJXIChhcyB0byByZXF1aXJpbmcgd2lkZXIg
dGhhbiAxNi1iaXQgbWFzaw0KPj4gICAgICAgICAgICAjIHJlZ2lzdGVycyksIGRlc3BpdGUgdGhl
IFNETSBub3QgZm9ybWFsbHkgbWFraW5nIHRoaXMgY29ubmVjdGlvbi4NCj4+IC0gICAgICAgIEFW
WDUxMkJXOiBbQVZYNTEyX0JGMTYsIEFWWDUxMl9WQk1JLCBBVlg1MTJfVkJNSTJdLA0KPj4gKyAg
ICAgICAgQVZYNTEyQlc6IFtBVlg1MTJfQkYxNiwgQVZYNTEyX0JJVEFMRywgQVZYNTEyX1ZCTUks
IEFWWDUxMl9WQk1JMl0sDQo+IA0KPiBCSVRBTEcgc2hvdWxkIGJlIGFmdGVyIFZCTUkyLCBiZWNh
dXNlIGV2ZXJ5dGhpbmcgaW4gdGhpcyB0YWJsZSBpcw0KPiBvcmRlcmVkIGJ5IGJpdCBudW1iZXIu
DQoNCkFzIHNhaWQgYmVmb3JlIC0gdGhlcmUncyBubyBvcmRlcmluZyBieSBiaXQgbnVtYmVyIHBv
c3NpYmxlIGhlcmUuDQpUaGUgaW5kaXZpZHVhbCBmZWF0dXJlcyBtYXkgbGl2ZSBvbiBkaWZmZXJl
bnQgKHN1YilsZWF2ZXMuIEJ5DQp3aGF0IHlvdSBzYXkgQkYxNiBzaG91bGRuJ3QgYmUgZmlyc3Qu
IFRoZSBsaXN0IGhlcmUgY2xlYXJseSBpcw0Kc29ydGVkIGFscGhhYmV0aWNhbGx5LCBhbmQgaW1v
IHRoYXQncyB0aGUgb25seSBmdXR1cmUgcHJvb2Ygc29ydGluZw0KcG9zc2libGUgKGFuZCBhbHNv
IGZvciBBVlg1MTJGLCB3aGVyZSBJIGhhZCBwcmV2aW91c2x5IG9mZmVyZWQgdG8NCnB1dCB0b2dl
dGhlciBhIHBhdGNoIHRvIHN3aXRjaCB0byBhbHBoYWJldGljYWwgb3JkZXJpbmcsIGlmIG9ubHkg
d2UNCmNvdWxkIGFncmVlIG9uIHRoYXQpLg0KDQo+IFdpdGggdGhpcyBmaXhlZCwgQWNrZWQtYnk6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQoNCkFzIHBlciBhYm92
ZSBJJ20gbm90IGdvaW5nIHRvIGFwcGx5IHRoaXMgd2l0aG91dCBoZWFyaW5nIGJhY2sgZnJvbQ0K
eW91Lg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
