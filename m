Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A0914D551
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 04:04:59 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix04Z-00078t-IW; Thu, 30 Jan 2020 03:00:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9GH4=3T=suse.com=jfehlig@srs-us1.protection.inumbo.net>)
 id 1ix04Y-000789-BJ
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 03:00:50 +0000
X-Inumbo-ID: af360f02-430c-11ea-89e7-12813bfff9fa
Received: from m4a0073g.houston.softwaregrp.com (unknown [15.124.2.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af360f02-430c-11ea-89e7-12813bfff9fa;
 Thu, 30 Jan 2020 03:00:47 +0000 (UTC)
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0073g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 30 Jan 2020 02:58:34 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 30 Jan 2020 03:00:05 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.8.11) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 30 Jan 2020 03:00:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iO/vtEu+yWx3fIbecJMnC4Jsl1u+rH1CzbXO5G0mYG3+e+/b1BLLoEESYsMDRR1K5a+nBMARPhpj25vcnXm9/+26jxciTKqZSxtqt+dxpM+KYiKbGzmgdf65HnaHDcOmhWCPRUMLr6k0uDsXZwcQjkD5ULEfpjfwjWk8Cw9ZvFJ4lQ9lyfWKgZvwDBXgyEziTA/16LbsIwU3yQbVR4WbqWPPzGqcsl18qvMsyfd2DoFCBm0vawsSyz27ezHe44YgJLsH+F9maaEEd2MGyLDVwnqPA7R8TtyjCdxjcbRMWVz0+REcw738IEvzUA4qcJcHtmqRdLsyxB8SGA9Hb2V35w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mv90QfEziFCzBOz0lUHZIpLsOJbmnUbuPlQC2YaapHc=;
 b=HpB3xioSl4a2fBc+WaS3rpVf5wIq/dSzocnPFRvJqpCoXcgkSaIensidcVj2/SMI02wpDXnlB8+hFsY1GE5ssnx0Hller1ooSydOqeHILW+o1k9x/GlXyN6lqroUHckzPeY1lviEJAjteGYmkuAy5AmdnABfF5/1Cmwtj6xT+Dp1RcKMIxzprjUPMzY4QQGrJeX7DzSW3e9LvE3GM/a2zQ1YFL0ZvHlwoJLnM4EqBNMeP4Fo6IU3UfpQVrkZwCOK71DgXsmsBQ+YHQ+/ZcY6w3SAVUfw4HbQYW3tCJm24Gf8rKZzIjWkjbW/FQZzLUDCIxN7Pf8NAhiiwMXF1wU6ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) by
 BY5PR18MB3411.namprd18.prod.outlook.com (10.255.139.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2665.22; Thu, 30 Jan 2020 03:00:02 +0000
Received: from BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::e837:42bb:9b5f:45c4]) by BY5PR18MB3315.namprd18.prod.outlook.com
 ([fe80::e837:42bb:9b5f:45c4%7]) with mapi id 15.20.2665.027; Thu, 30 Jan 2020
 03:00:02 +0000
Received: from [192.168.0.4] (75.169.4.203) by
 BYAPR06CA0063.namprd06.prod.outlook.com (2603:10b6:a03:14b::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2686.27 via Frontend
 Transport; Thu, 30 Jan 2020 03:00:01 +0000
From: Jim Fehlig <jfehlig@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <JGross@suse.com>,
 Kevin Stange <kevin@steadfast.net>, xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] libvirt support for scheduler credit2
Thread-Index: AQHV0Hvtf6QEb3pbvkm9aw4Pu75O/af1WQ4AgAE77wCACvOOgIABCTSA
Date: Thu, 30 Jan 2020 03:00:02 +0000
Message-ID: <4b3d8830-3e44-425e-4f3b-b88cd536454b@suse.com>
References: <ed20195d-3272-6ce8-d3b4-a17e459733c2@steadfast.net>
 <1e150c03-13fc-edd8-90a9-71ac669965f3@suse.com>
 <30aa7949-0294-bfff-cef3-5d8406f8ada8@suse.com>
 <6edf0c3952593890d6f43970754ce486d9f871b5.camel@suse.com>
In-Reply-To: <6edf0c3952593890d6f43970754ce486d9f871b5.camel@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0063.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::40) To BY5PR18MB3315.namprd18.prod.outlook.com
 (2603:10b6:a03:196::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jfehlig@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [75.169.4.203]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4cd0b4fd-0f3f-4baf-c7a5-08d7a5307fb2
x-ms-traffictypediagnostic: BY5PR18MB3411:
x-ld-processed: 856b813c-16e5-49a5-85ec-6f081e13b527,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB341123FDCF60BC3C266BD4FCC6040@BY5PR18MB3411.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 02981BE340
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(199004)(189003)(2616005)(956004)(966005)(5660300002)(66556008)(66476007)(66946007)(64756008)(81156014)(66446008)(81166006)(71200400001)(8676002)(2906002)(8936002)(86362001)(16576012)(36756003)(16526019)(316002)(478600001)(31686004)(31696002)(52116002)(53546011)(186003)(26005)(110136005)(4744005)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3411;
 H:BY5PR18MB3315.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ut37FkIpYOeJEfkhOZdNcwTxhENfSbilkWJY6NH3HWqNggKTuCHEDLmqmeZK0mAO5KKwlrwldILsQBsDQKueYR07twPfMJl7ERh/zmmVCwy6vlp2UiGESiR3WjEKLqjGUou26XJ6QyJFbSU8jXqXUT7u0xvZndBr1T56uhUVUg2whfvT22tNcB0ZgqDasLCY9vvXum8Zj7EZ+VXAk350zDVP0jzWaQ1kkzh9skzPgIZuKvwO4z8bn/gZPLZgo6s+wTigra+Iid7lvJ/V1CqpV+kw+b6eDXjIm2/T8c+cxvMPzgTh/MnOsCgeo3yIMtnPAVK9TLgzWO82agp9Y0gLsFmk7oB7Mcsty3jUey9RjaJNmjPzEVfQUffk5MLNInlFrfgDW9OGMWWgyrCnYeQO8dDdPQz5oHZ8ab8KpiHwJW8g2z9v0hadMoywlT/mrpBBstUCOj8ckEOwWbop4UWJnrF9SeehLI29P1TRYC4LKGoQMXJmM/6r/8Xs9vtZqDL/Umh/BilE+eA8KDZeV5ArYQ==
x-ms-exchange-antispam-messagedata: irZEZy+m4NhwS0e2ty7Y/X8sFwJL3Qx7XLGSBTvDB7CEhWRDfpOBqFLwqcU1xQCYcWx/OSTkNXz/DjKrWBq9/T7fJ+sgAjOok8pV65i9Py5WkuTXhFXd7TYHV7Im4Hsn9+13cXODrwktIUstkV31bQ==
Content-ID: <18DDF9572C00B64AA05C4FFCAE5C5D1B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cd0b4fd-0f3f-4baf-c7a5-08d7a5307fb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2020 03:00:02.4265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AN66x0uleUtEDYHCA9FdNNG/V4j80Wn5VU+oLkpZyWPJ0/Why0kT+TiyGT16zuYa97k5O2VZKbPVYa4YPAdk3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3411
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] libvirt support for scheduler credit2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8yOS8yMCA0OjEwIEFNLCBEYXJpbyBGYWdnaW9saSB3cm90ZToNCj4gT24gV2VkLCAyMDIw
LTAxLTIyIGF0IDE4OjU2ICswMDAwLCBKaW0gRmVobGlnIHdyb3RlOg0KPj4gT24gMS8yMS8yMCAx
MDowNSBBTSwgSsO8cmdlbiBHcm/DnyB3cm90ZToNCj4+PiBPbiAyMS4wMS4yMCAxNzo1NiwgS2V2
aW4gU3RhbmdlIHdyb3RlOg0KPj4+Pg0KPj4+PiBTaW5jZSBYZW4gNC4xMiwgY3JlZGl0MiBpcyB0
aGUgZGVmYXVsdCBzY2hlZHVsZXIsIGJ1dCBhdCBsZWFzdCBhcw0KPj4+PiBvZg0KPj4+PiBsaWJ2
aXJ0IDUuMS4wIHZpcnNoIGRvZXNuJ3QgYXBwZWFyIHRvIHVuZGVyc3RhbmQgY3JlZGl0MiBhbmQN
Cj4+Pj4gcHJvZHVjZXMNCj4+Pj4gdGhpcyBzb3J0IG9mIG91dHB1dDoNCj4+DQo+PiBZb3Ugd291
bGQgc2VlIHRoZSBzYW1lIHdpdGggbGlidmlydC5naXQgbWFzdGVyLCBzb3JyeS4gQVRNIHRoZQ0K
Pj4gbGlidmlydCBsaWJ4bA0KPj4gZHJpdmVyIGlzIHVuYXdhcmUgb2YgdGhlIGNyZWRpdDIgc2No
ZWR1bGVyLg0KPj4NCj4gUmlnaHQuIEkgSnVzdCBzZW50IHRoZSBwYXRjaDoNCj4gaHR0cHM6Ly93
d3cucmVkaGF0LmNvbS9hcmNoaXZlcy9saWJ2aXItbGlzdC8yMDIwLUphbnVhcnkvbXNnMDEyOTIu
aHRtbA0KDQpUaGFua3MhIEkgdHdlYWtlZCBpdCBhIGJpdCBhbmQgY29tbWl0dGVkIHRvIGxpYnZp
cnQuZ2l0DQoNCmh0dHBzOi8vbGlidmlydC5vcmcvZ2l0Lz9wPWxpYnZpcnQuZ2l0O2E9Y29tbWl0
O2g9ODQ5MDUyZWM2MWUxODc4MDcxM2JlYzE3MTc0OGU4NTllMzJkZmQ2ZA0KDQpSZWdhcmRzLA0K
SmltDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
