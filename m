Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B5C1F7757
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 13:34:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjhwS-0008HE-FN; Fri, 12 Jun 2020 11:33:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjhwQ-0008H9-H1
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:33:46 +0000
X-Inumbo-ID: 930c4096-aca0-11ea-bca7-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 930c4096-aca0-11ea-bca7-bc764e2007e4;
 Fri, 12 Jun 2020 11:33:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jaTlyD4RZQVmVKuY3oMe7yOeHt3eKTqbkHswK9tqzS1d4n3IWOFdZsLRlFwujMvZNkz2gz+q+cD3yM1ILnPa/Mw8jEVFO+fGfWP3ddbWqADLf9+DJbOB2PQrxBwv5l1y3/CqWjcVALqe7+ioCmomrY7qQRz7V6xiYDZPa+CWwtqEKGdIvSe7M4Sq41SbrX7Pi1RMXt0PuvKjVy+jATMSxAWtDIoIR0qQIyGdnyELBKxNPpItlILtZpPtyU1EHcYCIK/ScQGz4MSBovljM1bQ5+NR/0RtZOBeC1L/T9rt0ujcCmEHneEecpRyRQ4HFiPB+zNNp/BPKUFm59t0YXcAww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LvR7rgrlC19l7lRbfXikcp4dB6ECnlEC1sPyXN88I8=;
 b=dpYKBTdfxPQdC6lY/A5hFmFLIJiNvZ4vTMUyUEM+xUn59rygIileZIepSzUHKfZPFec5WbRz1jDdAC8U60w3ls1M/R1LV6ZNVovO5plJRpdg6hXeuS4o1xzGYEIFR+DrXn8H1hEP+8oE0QPeLOsMPiBFBqJzTKxgVyWhn3/ocWoo76P6oLO8cNJ6AMg4IikwNTBg0i/113J3QL3qA5HdOYouflIDFnbEREK/PmoTtRKt2i8bXIAKUqLd40r0E+OmPQWwqofslga5Yv8+lVLRsdXep3PVmIpGxatfI727o25v5xb4DtY4C1OOoyyaS+lNmEm5FAUuiH+AqzHSfCAy7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9LvR7rgrlC19l7lRbfXikcp4dB6ECnlEC1sPyXN88I8=;
 b=prbI9bACCP0+YmaI/bX5WpQ1UKo/Jx4clqaUyf92DyLFJs3RVjBaIPfh1EgqJui6dDl68Mg915etmZ5GuBDwieveHssNEBDzOCNFRA4k8EvCO0rpSbOKHNCultrMIAsFbX87JHj6AOAoj048AqboNn7ptAq+yfhSi4hN1JE9E+hfTGmXokPc7BPJvvgbXTJucKbLkjrN5RBg9VVJ0liA18+lr3CXDQ3N8D1IkxOjPzns59uBocwo00KzDRm/5+PUJ24iZT8B+h4snC6QqRr9EqgOYil5taPexjBABV3gOzahkD4Ltwux8dh0MUdZYY+mwsVTOfhaEQBm0DXIBuoXfA==
Received: from DB3PR0302MB3401.eurprd03.prod.outlook.com (2603:10a6:8:c::18)
 by DB3PR0302MB3340.eurprd03.prod.outlook.com (2603:10a6:8:a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 11:33:44 +0000
Received: from DB3PR0302MB3401.eurprd03.prod.outlook.com
 ([fe80::8de:8e70:b9fe:f290]) by DB3PR0302MB3401.eurprd03.prod.outlook.com
 ([fe80::8de:8e70:b9fe:f290%2]) with mapi id 15.20.3088.023; Fri, 12 Jun 2020
 11:33:44 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "jgross@suse.com" <jgross@suse.com>, "julien@xen.org" <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
Thread-Topic: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
Thread-Index: AQHWQE+STyWApsQdk0CG54zgwiPygKjUZV2AgAByxQCAAADXAIAAAQ+A
Date: Fri, 12 Jun 2020 11:33:44 +0000
Message-ID: <5bd54018f5e045816d25f686124395a1f27a2122.camel@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-2-volodymyr_babchuk@epam.com>
 <0ce0bbf8-fd15-e87b-727c-56dd7c09cdcb@suse.com>
 <7ec7b6568afb3df41f8407015c198b1ccb341c5b.camel@epam.com>
 <fcedf156-4ed6-c56a-482d-df2f867f7b3e@xen.org>
In-Reply-To: <fcedf156-4ed6-c56a-482d-df2f867f7b3e@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1636f430-5880-41c8-a416-08d80ec476e4
x-ms-traffictypediagnostic: DB3PR0302MB3340:
x-microsoft-antispam-prvs: <DB3PR0302MB3340A1608D9D6B9E55F09D70E6810@DB3PR0302MB3340.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7/2R1LjC0qPTxIkXO2YH8EW8ajEVv4UayKII4t/XhgYmjoyIfgN90V0OzMUThDJazofMaBPY49hUzBObC2DqknOhFO/2nu13AvhykVag8QJIM0U0rMUXS38vl3FufGRQgZU8FxSZ43MiaWc+6ux14dA82migMQIqS93X6HbJVJ70jZVUtQBIXgWYwDh1q2gR5vIWylxzjuOLbN+5o6tlVVqGsGLJ0SrXiCT6vGdA34Ij55vOc0QOT2LGCvXtA0+60Fp+KB1gP1CdBQ9Vf14em496TZc3AP1JUOKlZt/cGgrZrYnS0ck8nxAykAucH8F5QT4S351qs1VQnSgBZvBm6A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR0302MB3401.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(366004)(346002)(396003)(376002)(7416002)(110136005)(86362001)(66574014)(8936002)(83380400001)(54906003)(4326008)(316002)(66556008)(91956017)(55236004)(66476007)(64756008)(6486002)(478600001)(186003)(76116006)(6512007)(26005)(6506007)(66446008)(53546011)(5660300002)(8676002)(2616005)(66946007)(36756003)(2906002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: HjoO+YKOCUzZ5rFeZ1PuRrD2UuyxFJvx45lPy/F/L7ZYzTxqLU+spSorsSqfridYu1gkyhYbu3Kkhd89gKsUUDZhd7Eajbgx89r2f3U/ywLEy13BnGUbSNdYMGGjsYhgaWulWJyxN1BCeUeuh5XmBMun2flh77ApOvuOYNA/fEpCRneD574ynHgVE6LntNhaQdSN+I49be3NAFjFaVKt6JhJD/mBPkxEzDpT2zbAVZjSGJHNi7taJXsHvQcTvUHKi57TWlagrGkBFiPyHifN7updeZQfiUFDtkwJ3yTTmwmbJW9o9A23KaP5DksHYF0zGQ7r2K2SskspD6YCSN9GpySsemlQIhgULIFzVVjYgcwCBDKVLbhd0tPNdDcrarREN3qPTRZFAYIDFGgTOdf5FfUKO1/pzyYsOZ8BeKEr2ru8Pcjo4i8ua3njpet3U/nUFeIhnI0IPQqDrqVDB1RMzFd02bfibeTXQXx0YdSVPM7iJ+yKZcAPnV8LHiqSbkjl
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF3FECCCEB36F14FBEA647D82A84705D@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1636f430-5880-41c8-a416-08d80ec476e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 11:33:44.2850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GOZaBEBWVBvTy3q20WXybW3MNuOTfZsMhlPpwdPg74nlaIXa/2j9eC+OKQpgtCMJOFWfxjhDhd6gzq/69JMyZA7tqMvBvrMk2dTqRQrCx8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB3340
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiBGcmksIDIwMjAtMDYtMTIgYXQgMTI6MjkgKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToN
Cj4gDQo+IE9uIDEyLzA2LzIwMjAgMTI6MjYsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPiA+
IEhpIEp1cmdlbiwNCj4gPiANCj4gPiB0aGFua3MgZm9yIHRoZSByZXZpZXcNCj4gPiANCj4gPiBP
biBGcmksIDIwMjAtMDYtMTIgYXQgMDY6MzYgKzAyMDAsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+
ID4gDQo+ID4gPiBPbiAxMi4wNi4yMCAwMjoyMiwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+
ID4gDQo+ID4gWy4uLl0NCj4gPiANCj4gPiA+ID4gK3ZvaWQgdmNwdV9lbmRfaXJxX2hhbmRsZXIo
dm9pZCkNCj4gPiA+ID4gK3sNCj4gPiA+ID4gKyAgICBpbnQgZGVsdGE7DQo+ID4gPiA+ICsNCj4g
PiA+ID4gKyAgICBpZiAoaXNfaWRsZV92Y3B1KGN1cnJlbnQpKQ0KPiA+ID4gPiArICAgICAgICBy
ZXR1cm47DQo+ID4gPiA+ICsNCj4gPiA+ID4gKyAgICBBU1NFUlQoY3VycmVudC0+aXJxX25lc3Rp
bmcpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgaWYgKCAtLWN1cnJlbnQtPmlycV9uZXN0aW5n
ICkNCj4gPiA+ID4gKyAgICAgICAgcmV0dXJuOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsgICAgLyog
V2UgYXNzdW1lIHRoYXQgaXJxIGhhbmRsaW5nIHRpbWUgd2lsbCBub3Qgb3ZlcmZsb3cgaW50ICov
DQo+ID4gPiANCj4gPiA+IFRoaXMgYXNzdW1wdGlvbiBtaWdodCBub3QgaG9sZCBmb3IgbG9uZyBy
dW5uaW5nIFZNcy4NCj4gPiANCj4gPiBCYXNpY2FsbHksIHRoaXMgdmFsdWUgaG9sZHMgdGltZSBz
cGFuIGJldHdlZW4gY2FsbHMgdG8gc2NoZWR1bGUoKS4gVGhpcw0KPiA+IHZhcmlhYmxlIGdldHMg
emVyb2VkIG91dCBldmVyeSB0aW1lIHNjaGVkdWxlciByZXF1ZXN0cyBmb3IgdGltZQ0KPiA+IGFk
anVzdG1lbnQgdmFsdWUuIFNvLCBpdCBzaG91bGQgbm90IGRlcGVuZCBvbiB0b3RhbCBWTSBydW4g
dGltZS4NCj4gVGhpcyBpcyBhc3N1bWluZyB0aGF0IHRoZSBzY2hlZHVsZXIgd2lsbCBiZSBjYWxs
ZWQuIFdpdGggdGhlIE5VTEwgDQo+IHNjaGVkdWxlciBpbiBwbGFjZSwgdGhlcmUgaXMgYSBmYWly
IGNoYW5jZSB0aGlzIG1heSBuZXZlciBiZSBjYWxsZWQuDQo+IA0KPiBTbyBJIHRoaW5rIHVzaW5n
IGEgNjQtYml0IHZhbHVlIGlzIGxpa2VseSBzYWZlci4NCg0KV2VsbCwgSSB3YW50ZWQgdG8gdXNl
IDY0LWJpdCB2YWx1ZSBpbiB0aGUgZmlyc3QgcGxhY2UuIEJ1dCBJIGdvdCB0aGUNCmltcHJlc3Np
b24gdGhhdCBhdG9taWNfdCBzdXBwb3J0cyBvbmx5IDMyLWJpdCB2YWx1ZXMuIEF0IGxlYXN0LCB0
aGlzIGlzDQp3aGF0IEknbSBzZWVpbmcgaW4gYXRvbWljLmgNCg0KQW0gSSB3cm9uZz8NCg0KPiBD
aGVlcnMsDQo+IA0K

