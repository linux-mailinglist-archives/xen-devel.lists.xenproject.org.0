Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B008D40D45E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 10:19:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188216.337300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQmbU-0001tD-GW; Thu, 16 Sep 2021 08:18:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188216.337300; Thu, 16 Sep 2021 08:18:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQmbU-0001qD-D1; Thu, 16 Sep 2021 08:18:44 +0000
Received: by outflank-mailman (input) for mailman id 188216;
 Thu, 16 Sep 2021 08:18:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URfn=OG=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1mQmbS-0001pr-RM
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 08:18:42 +0000
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bd00c04-7db4-4bfd-9247-0a586f7a2b9c;
 Thu, 16 Sep 2021 08:18:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 01:18:37 -0700
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 16 Sep 2021 01:18:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 16 Sep 2021 01:18:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 16 Sep 2021 01:18:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 16 Sep 2021 01:18:37 -0700
Received: from BN9PR11MB5433.namprd11.prod.outlook.com (2603:10b6:408:11e::13)
 by BN6PR11MB1458.namprd11.prod.outlook.com (2603:10b6:405:d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 16 Sep
 2021 08:18:36 +0000
Received: from BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df]) by BN9PR11MB5433.namprd11.prod.outlook.com
 ([fe80::ddb7:fa7f:2cc:45df%8]) with mapi id 15.20.4523.016; Thu, 16 Sep 2021
 08:18:36 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 9bd00c04-7db4-4bfd-9247-0a586f7a2b9c
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202671594"
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="202671594"
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,297,1624345200"; 
   d="scan'208";a="434418387"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7GYBkMeVM1XkZ813CXLbv9YQJWCEh3X2Z31aXgZ5efBllZoQX9MxaREuHjnxXKh30NtrvBBcUCmokNUvQA7mhGkiof0gQvSl9QrKeFTGVrb970PbxHy//9jpZR4ofPpqJTqR92KKVJz/An2lu2KDadsBP9xyFfhcr2dtHB4R3VUCwUmEaNxJ/6FYXC2yt1StTGFlyi0Im8uVeCtewIpRCcYy18tHxWhQvCUIyOAHV/zc0jE8PU3c0atfgbLt+1b1VETAX9tEVe5yeWLzUlaw13XGGjEvdbY8A/oogKol1YlYlOiBEDZrjvdC5pOLxv2xThnRCmlZcSzJW7eE8LKAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kR67ruO5MPOO583+5PiBZ7zctYx+2qamf/UvRNENmYM=;
 b=kWtzGvbGU2yovDoOSCzdUGLc/M+1frO1JddjZgabdBfnbAHdXkDMXPfqdASN3m8t7raHnZh/iDsua4lOyvqqGEPgAn8dkpDK/6UNfiL6u2XgzFJtS+yizHwtApi+rmP87y3RXlqsY3P6/+LbnsSwcg2ghY5zmDJQ8J52aF9nAudWhiKTrLhIdCVWiiluVTjFJJhhTcV5KoODphZWU38TREDb3fwEVd9/kfNK4uTGVcyslYUSAp3R8rE8Pz5e16mb9eNf08WllCJYennBVibQAsZU4oI6DtqN7Vd/b/FfnmV34yq/mf7g/K/W6RDYoEBVTR3ZlnR0O1dXnSJrhcXnhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kR67ruO5MPOO583+5PiBZ7zctYx+2qamf/UvRNENmYM=;
 b=kXvIs9dFLzdkWxTrmiBy1xaEEQr8EMGaP2IirciwToeUCBBwdVhaBpORU6LFFt+zPNg3cB4Qid+XZWN35h1DcyXRDfWVkl9N19ZnhvSmP2irsg1w/8nNB+PQGMO7ivqYdI1bxUg+mDuBs1NHyx9kUQJxZHdj54JaiH/2FdKxtic=
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Paul Durrant <paul@xen.org>
Subject: RE: [PATCH 2/4] VT-d: consider hidden devices when unmapping
Thread-Topic: [PATCH 2/4] VT-d: consider hidden devices when unmapping
Thread-Index: AQHXqhHtqP8x4M7szkGHc+SOfkqrHKumTyiA
Date: Thu, 16 Sep 2021 08:18:36 +0000
Message-ID: <BN9PR11MB5433706BE0A6C4B915D3707D8CDC9@BN9PR11MB5433.namprd11.prod.outlook.com>
References: <6b7fa64a-bd6b-353c-30cb-ec25b850cbed@suse.com>
 <5cf392cf-09a2-b23c-2a25-610c64f20707@suse.com>
In-Reply-To: <5cf392cf-09a2-b23c-2a25-610c64f20707@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d913a09d-8687-4367-c886-08d978ea94b0
x-ms-traffictypediagnostic: BN6PR11MB1458:
x-microsoft-antispam-prvs: <BN6PR11MB1458FE161BD3EB24C93D89B78CDC9@BN6PR11MB1458.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: htuuwxeLhVx67d9GyX0nENu581tlpo1TsIKEAcwkCiqOpKRDSQ6jeGqOIFxrsNYV+Eq7IzYueNrOrhuGnGag6lSxVU4N0FYq2RHGmGENBPUZdSEWtLoMh5d7WF7sN/0NAFe0U+nBOm/PV5JP7j2pk1F1fAgZx2qXeXS3Exrhdjd53WXKzlX9s1YyyZ3Xld5CRIrOBhVAGBUWeZKBGvFvl2dvQmAE4JjBK9A91MYyOvn3OYxrib3riGIm+V0EoDRI2OG2bqOVZqzpYcDAWX03d6waunG/kYcz2MTa9O9jllkG4kL2Itxi+m3gd3Xr87ibD3ehQNY9/teBYd5H9NjU6YEd/Geeyja/jCzuIlmINNKeLCJVvxF5WOQu/sQ7jTan+Mds9z/BFEBTZp/hJ5WcjuRck5Xn7cT8/2XvpeNn8J4ALn33ZeoLDbuvGyh7ciUUCbNXdf6BDKVDoQf6wDFz8qWpMJb+FTGs3Mr/iU+MLgyreEjt68Y4T9gS8Ccfccj5Sb/FIud07GOc7hmtAfdTtaZWkXdjAanePpJrF9vg2wywE7tj3vV/xS0cgBmy0lW+i6QvvEKoxDELYqRMTmO7PicAPBdJyuRQ7Qt4c3m+tixxOlBJ0c+eX0ySBG+PRXUwUbr63/Hay3sy/grSSqJFXOpc/qzU2A19BESfsCiEdzp2WNGB9bOUZpoFp8WHxdEzEl7r3OSm4W0TI3CQnsqd+w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5433.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(316002)(110136005)(122000001)(86362001)(38070700005)(508600001)(55016002)(9686003)(8936002)(71200400001)(8676002)(26005)(52536014)(5660300002)(6506007)(186003)(7696005)(2906002)(76116006)(4326008)(66556008)(66446008)(66476007)(64756008)(66946007)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aFZLZHRyUHZlRW93RDdkRGJRaHkzWFRRN0x4QmhiR2NGek9ha1pFRHNJenJD?=
 =?utf-8?B?bnpZc2dwWnJ2Rm1TUE1WU3NxalhDOXB3SGE1eUZzZG54b1BQcTFBVUlnOExv?=
 =?utf-8?B?anZZdjRJa2l0WkRKekZERFhsR1B6Ymo4UXRNUDRjOVp4N3A1dTJEMkdhZ3BW?=
 =?utf-8?B?WWc1bmt1UXJnNTdXZTlsOEIyTUxnSlA4dVJCS3lJamFEM1NXS0gwbHVZVWhm?=
 =?utf-8?B?RmdRdTdKbzM4SHBvM2J5SldmMnBaSTRBU0RqbWpNYnVMRmd6dklZbldMK3lr?=
 =?utf-8?B?eCtra2h1NGhaTGdiQk13bmpLZUZwcFBLRVduektIYVZYVnpwTCtyMVc5eWZx?=
 =?utf-8?B?dlVpeTQ3SVhlZENHTlpSb3Jnek5ab3NMSTFLMnlRR05nRWxrK0puakdtVlpK?=
 =?utf-8?B?akxMaUprR000Y1hEekVHdjBOK3Y3KzVGak1Idjhxemxib1ZLb2Z4d3drRlQw?=
 =?utf-8?B?U0xnVjZPeGpTSGZGQkllNDNqakozQXpoS011UUlHZDRJcjZ0TzRHWHR4QjBY?=
 =?utf-8?B?cjc4cVRkMlZlTFMzN3FQL002MUhsaHRuYVJXdnZkMVRMNDFVUFp3ZkdQNjJo?=
 =?utf-8?B?NVRjeFFGZlE4SFUvbW5QSnhuWlIyamxTbWd6S01XRUptMnlRVlhOS0tzRE9J?=
 =?utf-8?B?R1Y2N3ZCZFE2THlodWZHZklZMThkTkN2UWhSSm1lYjgxZWhDdTMwRlpBZ2g0?=
 =?utf-8?B?elU0MlhiRVY3T0lzNVhhZVhGanhtdmhwbHg4cjRtM2Nnb2c1THk5UEFqTFN5?=
 =?utf-8?B?WUx0UFgvblRsTUl6aVV1bGdpWVVZQ3BOQ3l2WHJUbkE0K3RTODNneUFlMmxm?=
 =?utf-8?B?ZU9vU1pQMUFQYzhKZ2FIeXplTnJnL1RVTUx3b3JVVVZ6dER3YkczUTZOSHBk?=
 =?utf-8?B?WE80c21MRmYvcXowbDhDRzIrb0diWU91VHBBUDQveGYvaVZRV0E2eVlNQ2R6?=
 =?utf-8?B?N21JdDJib0JWSEVhQ0JXNC8wOTJ4WkVZb3gveDF5NFZpMW5kamtuRHRiMkZS?=
 =?utf-8?B?WmVZSURtOGRkVTdya0dZTmxRSzArT1p2RW9OdW00NkVMUkhFZzhhSDNMTlJL?=
 =?utf-8?B?M2lLYnFCdWdBOGxSNnhmZGh1eGlmTFdaNTFzNFQybnRJSUhMeXFhSmpxRVZW?=
 =?utf-8?B?UWxnUlF1RC9VcGk0VDMvTWpQRnB2RUNiQ29kSjJjSFdvYUcvM2NFY2VwQlI4?=
 =?utf-8?B?cDhDTU5yZXl1cGFkVXoxSXMwa2hETjkrRUcrSkZJUE9ERmN2M2I0ZzJCbURo?=
 =?utf-8?B?dUYyQysyaytncW0yaUxudkROeXprSTFoSmFXS2lybnI0S0hMdjRvampxOEJi?=
 =?utf-8?B?SVZVS1ltcW1JSG51VUw0N0JJdGhPMDloMmY2emxjbS9Sem1TMDlYekFDTFFK?=
 =?utf-8?B?cjIxdGpCNitnanBqOVRMdGxoeUhmbXV3QURZT25uYnlUNGtjUUNsZkswUUcw?=
 =?utf-8?B?QkR3aThnUDlhL3VRelNiOElYSTZIcDFqWUxpRjB4QmFwOUJtU0R3MDhrWDVZ?=
 =?utf-8?B?cE1uanVUU2xIazBjWmZoNEpSK1B5S08xZXhaTlRmZGRJcWEyMEViMk5oL3hm?=
 =?utf-8?B?Wi9CcUNtTVhZS3ZRT1NxSmtNaXF2Qkh6SWl1U05rTUppZ0todlR5bmFFcHMx?=
 =?utf-8?B?RFZwSnZNR0tlWTcvTTJpTjhBV21tdkhEOUs4UlpESG1hQjJ2OGtvQUtWbjFR?=
 =?utf-8?B?c3pYR3dDZFFqV0R5ME5BdmY4WnFKdmljUHdYMnZOb0pVMW0yY0J2MzJxV2VC?=
 =?utf-8?Q?bB7hhH480korymM6R0VYBsIhDGK1s+Pn+9pav9Q?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5433.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d913a09d-8687-4367-c886-08d978ea94b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 08:18:36.1227
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4PidYB8JM+ntYMZtv9mhoIHwrUZbgREKHqlUgFLkKoarq33dx9gKPKhXrtVj8Ub70JvJsNU/50tmzX5t3QALA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1458
X-OriginatorOrg: intel.com

PiBGcm9tOiBKYW4gQmV1bGljaA0KPiBTZW50OiBXZWRuZXNkYXksIFNlcHRlbWJlciAxNSwgMjAy
MSA1OjEzIFBNDQo+IA0KPiBXaGV0aGVyIHRvIGNsZWFyIGFuIElPTU1VJ3MgYml0IGluIHRoZSBk
b21haW4ncyBiaXRtYXAgc2hvdWxkIGRlcGVuZCBvbg0KPiBhbGwgZGV2aWNlcyB0aGUgZG9tYWlu
IGNhbiBjb250cm9sLiBGb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiB0aGlzDQo+IGluY2x1ZGVzIGhp
ZGRlbiBkZXZpY2VzLCB3aGljaCBhcmUgYXNzb2NpYXRlZCB3aXRoIERvbVhFTi4NCj4gDQo+IFdo
aWxlIHRvdWNoaW5nIHJlbGF0ZWQgbG9naWMsIGNvbnZlcnQgImZvdW5kIiB0byAiYm9vbCIuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IA0K
PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiArKysgYi94ZW4v
ZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYw0KPiBAQCAtMTY1Nyw3ICsxNjU3LDcgQEAg
c3RhdGljIGludCBkb21haW5fY29udGV4dF91bm1hcChzdHJ1Y3QgZA0KPiAgICAgIHN0cnVjdCB2
dGRfaW9tbXUgKmlvbW11ID0gZHJoZCA/IGRyaGQtPmlvbW11IDogTlVMTDsNCj4gICAgICBpbnQg
cmV0Ow0KPiAgICAgIHU4IHNlZyA9IHBkZXYtPnNlZywgYnVzID0gcGRldi0+YnVzLCB0bXBfYnVz
LCB0bXBfZGV2Zm4sIHNlY2J1czsNCj4gLSAgICBpbnQgZm91bmQgPSAwOw0KPiArICAgIGJvb2wg
Zm91bmQ7DQo+IA0KPiAgICAgIHN3aXRjaCAoIHBkZXYtPnR5cGUgKQ0KPiAgICAgIHsNCj4gQEAg
LTE3MzcsMjMgKzE3MzcsMzMgQEAgc3RhdGljIGludCBkb21haW5fY29udGV4dF91bm1hcChzdHJ1
Y3QgZA0KPiAgICAgICAgICByZXR1cm4gcmV0Ow0KPiANCj4gICAgICAvKg0KPiAtICAgICAqIGlm
IG5vIG90aGVyIGRldmljZXMgdW5kZXIgdGhlIHNhbWUgaW9tbXUgb3duZWQgYnkgdGhpcyBkb21h
aW4sDQo+IC0gICAgICogY2xlYXIgaW9tbXUgaW4gaW9tbXVfYml0bWFwIGFuZCBjbGVhciBkb21h
aW5faWQgaW4gZG9taWRfYml0bXANCj4gKyAgICAgKiBJZiBubyBvdGhlciBkZXZpY2VzIHVuZGVy
IHRoZSBzYW1lIGlvbW11IG93bmVkIGJ5IHRoaXMgZG9tYWluLA0KPiArICAgICAqIGNsZWFyIGlv
bW11IGluIGlvbW11X2JpdG1hcCBhbmQgY2xlYXIgZG9tYWluX2lkIGluIGRvbWlkX2JpdG1hcC4N
Cg0Kd2hhdCBpcyBjaGFuZ2VkIGFib3ZlPw0KDQo+ICAgICAgICovDQo+IC0gICAgZm9yX2VhY2hf
cGRldiAoIGRvbWFpbiwgcGRldiApDQo+ICsgICAgZm9yICggZm91bmQgPSBmYWxzZTsgOyBkb21h
aW4gPSBkb21feGVuICkNCg0KaG9uZXN0eSBzcGVha2luZyBJIGhhZCB0byByZWFkIHNldmVyYWwg
dGltZXMgdG8gdW5kZXJzdGFuZCB0aGUgYnJlYWsNCmNvbmRpdGlvbiBvZiB0aGlzIGxvb3AuIEl0
J2QgYmUgZWFzaWVyIHRvIHVuZGVyc3RhbmQgaWYgcHV0dGluZyBmb3JfZWFjaF8NCnBkZXYoKXt9
IGludG8gYSBmdW5jdGlvbiBhbmQgdGhlbjoNCg0KCWZvdW5kID0gZnVuYyhkb21haW4pOw0KCWlm
ICghZm91bmQgJiYgaXNfaGFyZHdhcmVfZG9tYWluKGRvbWFpbikpDQoJCWZvdW5kID0gZnVuYyhk
b21feGVuKTsNCg0KPiAgICAgIHsNCj4gLSAgICAgICAgaWYgKCBwZGV2LT5zZWcgPT0gc2VnICYm
IHBkZXYtPmJ1cyA9PSBidXMgJiYgcGRldi0+ZGV2Zm4gPT0gZGV2Zm4gKQ0KPiAtICAgICAgICAg
ICAgY29udGludWU7DQo+IC0NCj4gLSAgICAgICAgZHJoZCA9IGFjcGlfZmluZF9tYXRjaGVkX2Ry
aGRfdW5pdChwZGV2KTsNCj4gLSAgICAgICAgaWYgKCBkcmhkICYmIGRyaGQtPmlvbW11ID09IGlv
bW11ICkNCj4gKyAgICAgICAgZm9yX2VhY2hfcGRldiAoIGRvbWFpbiwgcGRldiApDQo+ICAgICAg
ICAgIHsNCj4gLSAgICAgICAgICAgIGZvdW5kID0gMTsNCj4gLSAgICAgICAgICAgIGJyZWFrOw0K
PiArICAgICAgICAgICAgaWYgKCBwZGV2LT5zZWcgPT0gc2VnICYmIHBkZXYtPmJ1cyA9PSBidXMg
JiYgcGRldi0+ZGV2Zm4gPT0gZGV2Zm4gKQ0KPiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0K
PiArDQo+ICsgICAgICAgICAgICBkcmhkID0gYWNwaV9maW5kX21hdGNoZWRfZHJoZF91bml0KHBk
ZXYpOw0KPiArICAgICAgICAgICAgaWYgKCBkcmhkICYmIGRyaGQtPmlvbW11ID09IGlvbW11ICkN
Cj4gKyAgICAgICAgICAgIHsNCj4gKyAgICAgICAgICAgICAgICBmb3VuZCA9IHRydWU7DQo+ICsg
ICAgICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgICAgICB9DQo+ICAgICAgICAgIH0NCj4g
Kw0KPiArICAgICAgICAvKg0KPiArICAgICAgICAgKiBIaWRkZW4gZGV2aWNlcyBhcmUgYXNzb2Np
YXRlZCB3aXRoIERvbVhFTiBidXQgdXNhYmxlIGJ5IHRoZQ0KPiArICAgICAgICAgKiBoYXJkd2Fy
ZSBkb21haW4uIEhlbmNlIHRoZXkgbmVlZCBjb25zaWRlcmluZyBoZXJlIGFzIHdlbGwuDQo+ICsg
ICAgICAgICAqLw0KPiArICAgICAgICBpZiAoIGZvdW5kIHx8ICFpc19oYXJkd2FyZV9kb21haW4o
ZG9tYWluKSApDQo+ICsgICAgICAgICAgICBicmVhazsNCj4gICAgICB9DQo+IA0KPiAtICAgIGlm
ICggZm91bmQgPT0gMCApDQo+ICsgICAgaWYgKCAhZm91bmQgKQ0KPiAgICAgIHsNCj4gICAgICAg
ICAgY2xlYXJfYml0KGlvbW11LT5pbmRleCwgJmRvbV9pb21tdShkb21haW4pLQ0KPiA+YXJjaC52
dGQuaW9tbXVfYml0bWFwKTsNCj4gICAgICAgICAgY2xlYW51cF9kb21pZF9tYXAoZG9tYWluLCBp
b21tdSk7DQo+IA0KDQo=

