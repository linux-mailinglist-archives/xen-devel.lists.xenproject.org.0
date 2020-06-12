Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1691F7746
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 13:27:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjhpu-0007Fg-3a; Fri, 12 Jun 2020 11:27:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r1CT=7Z=epam.com=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1jjhpr-0007Fb-SH
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:27:00 +0000
X-Inumbo-ID: a0898c98-ac9f-11ea-b5bd-12813bfff9fa
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.45]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a0898c98-ac9f-11ea-b5bd-12813bfff9fa;
 Fri, 12 Jun 2020 11:26:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fAHOoK/6mc6X5BxqU38WwPZ3QlHgLsgvEQ4mRh5C5KJlYXXOMiY8J8ukUfioHrUb3EcJM5L2/WmppyXJhSnZXJdyDE/Oon68Epgkz4r4oYVEYokzKSlJ+zn5J9xo8Wk0kB5EHUyN/l7sAmSFd9W1bzPerNUy6DqFGk28pRusoLgp9Ow8ki7fX+GatVZy7QbL5O1MFY4n//uf4IuHN0lPImBfsbOj2s0SmbHhhBiDDu/qTb1TpbZJdai6yk7JWDxWEj3+ZxY/8pp9mWP2+Z8zw7S2M4dFrn9h0YI5qzc3rWeGG8HgqIdLzCUOaWy6ZLn1NgPTnT56vaL2uMAihvSmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFfnlUpI8o5/vSbuI2ryo6sev5aXsq0V8sy+/YxNbao=;
 b=OECxCewL1DKGuf1++LFcaV8RoqmRWahaMgcFxHk81U38cUK3lrS+ZEXlOVjp1/cCigvy5Gb65ja6BdUwL/kDDuQ/hTb07d7f4gRRII1JbK7WU1K6ZOnGQFcH4zsXDFedjuXBWjeiObjSQG+4HZYfyKwcgrl8PZUOI+nf2AXophSdJykszVNUkRbZlVTGA6PT1nS8HaRtr/iNCmHNrpbDJ8vbit/NmWrepPfT1lGKU8f5w1CqJmFs0bvQ5ZkOAJvzRPjT0ome67g+V1Eo0KJ6rD07cfFQ+v0uh706gYJN2U60g4cmgs21g7AGzyihkGPR03Wy9KtUKdu+C9mB1u84/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFfnlUpI8o5/vSbuI2ryo6sev5aXsq0V8sy+/YxNbao=;
 b=alTkLReREzBKw+qBOcEXHX8Sff+GnXrDUwpyqckqeL8vDqZ4OhJErtYTT5gE41wcx1qLYtqvb4qikCqe88edrEq7whVGx8ME4wlLK/6hU2anoR87KbwRy/kvuXKCgrkPW3M9+udVTU0bJ5HyAnrD0EnC9ACp/3bnhQpOqcBpebCYh9fu3WEatHiUoflju4UIgQvbsOMYs4B+7y/U039kbM1xMPwwHe80Gz9d5ga7sEITR9GW5982R3DMphEBbFAAOd/AWRzmgwLUp4DtjiPSVablTjbpcAKds+l68jQIsYxXrtQ2jHt/YrQg/brK5LVL6dgKJyOQawJSZbgPU3UvDA==
Received: from DB3PR0302MB3401.eurprd03.prod.outlook.com (2603:10a6:8:c::18)
 by DB3PR0302MB3323.eurprd03.prod.outlook.com (2603:10a6:8:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.23; Fri, 12 Jun
 2020 11:26:57 +0000
Received: from DB3PR0302MB3401.eurprd03.prod.outlook.com
 ([fe80::8de:8e70:b9fe:f290]) by DB3PR0302MB3401.eurprd03.prod.outlook.com
 ([fe80::8de:8e70:b9fe:f290%2]) with mapi id 15.20.3088.023; Fri, 12 Jun 2020
 11:26:57 +0000
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "jgross@suse.com" <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Subject: Re: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
Thread-Topic: [RFC PATCH v1 1/6] sched: track time spent in IRQ handler
Thread-Index: AQHWQE+STyWApsQdk0CG54zgwiPygKjUZV2AgAByxQA=
Date: Fri, 12 Jun 2020 11:26:56 +0000
Message-ID: <7ec7b6568afb3df41f8407015c198b1ccb341c5b.camel@epam.com>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-2-volodymyr_babchuk@epam.com>
 <0ce0bbf8-fd15-e87b-727c-56dd7c09cdcb@suse.com>
In-Reply-To: <0ce0bbf8-fd15-e87b-727c-56dd7c09cdcb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.3 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9727df84-5de2-4af7-9ced-08d80ec38413
x-ms-traffictypediagnostic: DB3PR0302MB3323:
x-microsoft-antispam-prvs: <DB3PR0302MB33236CBFC07425E6E64124D6E6810@DB3PR0302MB3323.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 565+wiXbg7AU50in0QQhTbioD0j6G312moWlbHUfp92RFK1D712fZuixZdz3Y2VA64F9v8aH2iy215s/bcGViDm2YSSphq3e3v2kiezVgdTh6GgIF5p5LjcpqFe+WsRKa3qILuCzH2BrAXR33S78jLP1amw+JXVgq0Vc4XJjsRn/m64OGJx7xTMH95er5sXZsh/n8qumvKLDWrda/rG8DkVRi2jieiAWzJNHFVTkZdkY1gCvIrgf3+LcMWaxD28P0rIPRxWZb3/dNSLWXmnrjatPaQfMD9zozfRj6K123MJ5Y0oFv+fzmi8J89iBU7ftss9QGjviVsRdavbehp4XRQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB3PR0302MB3401.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(8936002)(76116006)(186003)(83380400001)(36756003)(66446008)(86362001)(2906002)(66946007)(64756008)(26005)(66476007)(5660300002)(66556008)(4744005)(91956017)(53546011)(2616005)(4326008)(316002)(54906003)(7416002)(6512007)(55236004)(71200400001)(6506007)(8676002)(6486002)(478600001)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: NR0Nda5tT98d7tqfnGjtUtR9Zq1NzQLG2uW/6dJtKMOvJO5FqHNaBXPM+PUiJDKOIGMtT3uCA5p032e1JtUlSFlo+0K8Rj/Ql5wbDO0z/O9dDvWVEB7hd6rGFnCU0+xzNPldf3bvMeApTpv+L9oytptY4zENaXzFgZiFIHmPbnKsj/NsJApzJqurv34RCDVCHg+332MyiY84GMxIjJB9PgWazSEBTNejdADput/efxPUJ2p5UpC0Kpim0b/Ls3SMpvDcLFxDXbMeGsR7vntVZ63ZNhVTQQGhpjvMiyyuuoI/GCpDExPlkrsRcmvlmJgsbCgZ1jbysdR08mvDcvvuLHby7vHoS/bykc8eZxAKvROu55tx9hK6NFhDaWiwGAv6qMJZdmwrQLHaTtSdYz3j9WLGs9vJ3SRHFGUaMxDgeoaHZwplbuAQfbnhmBqvQ10fkegVqWciSkTrd/Rq+pKdDL9f88XyFhG1Y5DKB3ThwK8=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EE4C0E7E1227E744867BD4DA521170B0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9727df84-5de2-4af7-9ced-08d80ec38413
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 11:26:56.9055 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4uXbUY1uE34enZN8SzsRiVsVmjq1Rf7xVlXrMFg0oxGS6kgl7LVbeuuQXoQGKPuwGbGsDnL5p3eAD6oyNJv4zgcN21gyrymc6ch25UJ/eBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0302MB3323
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
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dfaggioli@suse.com" <dfaggioli@suse.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVyZ2VuLA0KDQp0aGFua3MgZm9yIHRoZSByZXZpZXcNCg0KT24gRnJpLCAyMDIwLTA2LTEy
IGF0IDA2OjM2ICswMjAwLCBKw7xyZ2VuIEdyb8OfIHdyb3RlOg0KDQo+IE9uIDEyLjA2LjIwIDAy
OjIyLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCg0KWy4uLl0NCg0KPiA+ICt2b2lkIHZjcHVf
ZW5kX2lycV9oYW5kbGVyKHZvaWQpDQo+ID4gK3sNCj4gPiArICAgIGludCBkZWx0YTsNCj4gPiAr
DQo+ID4gKyAgICBpZiAoaXNfaWRsZV92Y3B1KGN1cnJlbnQpKQ0KPiA+ICsgICAgICAgIHJldHVy
bjsNCj4gPiArDQo+ID4gKyAgICBBU1NFUlQoY3VycmVudC0+aXJxX25lc3RpbmcpOw0KPiA+ICsN
Cj4gPiArICAgIGlmICggLS1jdXJyZW50LT5pcnFfbmVzdGluZyApDQo+ID4gKyAgICAgICAgcmV0
dXJuOw0KPiA+ICsNCj4gPiArICAgIC8qIFdlIGFzc3VtZSB0aGF0IGlycSBoYW5kbGluZyB0aW1l
IHdpbGwgbm90IG92ZXJmbG93IGludCAqLw0KPiANCj4gVGhpcyBhc3N1bXB0aW9uIG1pZ2h0IG5v
dCBob2xkIGZvciBsb25nIHJ1bm5pbmcgVk1zLg0KDQpCYXNpY2FsbHksIHRoaXMgdmFsdWUgaG9s
ZHMgdGltZSBzcGFuIGJldHdlZW4gY2FsbHMgdG8gc2NoZWR1bGUoKS4gVGhpcw0KdmFyaWFibGUg
Z2V0cyB6ZXJvZWQgb3V0IGV2ZXJ5IHRpbWUgc2NoZWR1bGVyIHJlcXVlc3RzIGZvciB0aW1lDQph
ZGp1c3RtZW50IHZhbHVlLiBTbywgaXQgc2hvdWxkIG5vdCBkZXBlbmQgb24gdG90YWwgVk0gcnVu
IHRpbWUuIA0KDQo=

