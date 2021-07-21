Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 493163D19C3
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 00:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159568.293464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6Kja-0004J9-1i; Wed, 21 Jul 2021 22:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159568.293464; Wed, 21 Jul 2021 22:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6KjZ-0004GU-Up; Wed, 21 Jul 2021 22:30:33 +0000
Received: by outflank-mailman (input) for mailman id 159568;
 Wed, 21 Jul 2021 22:30:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IfpH=MN=starlab.io=scott.davis@srs-us1.protection.inumbo.net>)
 id 1m6KjY-0004GI-Jr
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 22:30:32 +0000
Received: from GCC02-DM3-obe.outbound.protection.outlook.com (unknown
 [40.107.91.124]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4d8ee44-f3bc-44f3-8c17-07319508af3d;
 Wed, 21 Jul 2021 22:30:29 +0000 (UTC)
Received: from MN2PR09MB5258.namprd09.prod.outlook.com (2603:10b6:208:220::11)
 by MN2PR09MB5212.namprd09.prod.outlook.com (2603:10b6:208:217::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 22:30:25 +0000
Received: from MN2PR09MB5258.namprd09.prod.outlook.com
 ([fe80::191d:a0d3:24d:989f]) by MN2PR09MB5258.namprd09.prod.outlook.com
 ([fe80::191d:a0d3:24d:989f%6]) with mapi id 15.20.4331.034; Wed, 21 Jul 2021
 22:30:24 +0000
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
X-Inumbo-ID: f4d8ee44-f3bc-44f3-8c17-07319508af3d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/XmaAM1JS1O2TG/3yATnk7FEtRjtXj1bqhlikAlFNzzWAsVeCIvMgjWxeciIJRbq8P8kNE6UhQcjLyGywQ3bAa9NPHHGjHTohyA8gfbigptYceYjT3Y71v1dooT4yHH4VD5K4XA4DavcEXPrXoNyOttp0ZltZMhmwn5f2s7GjFOd6wHKGnVphJulnK6BnuvT8eFhpiVf3waWW6VmFoALIajJ5qjurY4qekkdjWmtZhsqj6OS9Ny2kS6EkDhl7k5NPQF0ivzMEZ7V1rzkaPi1KXF2iCrAtesnf/WMYrLSEZ86tWTbr/MHdfsfiC1Q0pU3Tka22vGC1gk5wLkLVF05w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNOLrlnNGUcqK4MGZRZFcF7QTzCrlvG8mVdIQd2HIYw=;
 b=Mco6XDkxJG9Yb5xgmksLk5WfnAc5tzi+tOTD84BxmosGzdmWj4DVDz1iDPRJNRQ+yWRmKrbm5Ns7YK94eLJtcu2pchxyqbZbrefJ8Qvcwse//fQqiQTSZH43NCHFj4z+Fw8Kue37Bbbqv8Q412EAe+6GIAg/XiBCvFpp1Nx9AWKM2kCXtHM7u9e9Od9N8AotAjzBDPMurMfSvkWm4VWuTnk/DpeZtzAyXtcWpgeyJ2I+ewC53rcGynPMgE+ZowP8MIvhTf+4GCHcHQ3TnNPO5P9zVaFHRxn6DPtvmOkkJdo61Yz0lLQnEFJBpaCdPojvhGvKf1t1WgHRF7JPE1uqNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starlab.io; dmarc=pass action=none header.from=starlab.io;
 dkim=pass header.d=starlab.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=starlab.io;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNOLrlnNGUcqK4MGZRZFcF7QTzCrlvG8mVdIQd2HIYw=;
 b=mZwFgpJwCvj9H1Yqb5lI2heax8W+tbQc69Xs34Sg8az8cJ3pIxQUJ2v2s0EnRno+N/gDjnPb+wOHmoSUhxWeDpsj60bYdBCmbfv74rjXwoiN6GvKPewAkK/Bl7KqdxXcL801jlS9cGHrnwwN9YIculnWOqjw89n/vXZDKQ2Ajro=
From: Scott Davis <scott.davis@starlab.io>
To: Julien Grall <julien@xen.org>, Jason Andryuk <jandryuk@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Nick Rosbrook <rosbrookn@ainfosec.com>, Anthony
 PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg
Thread-Topic: [PATCH] tools/xl: Add stubdomain_cmdline option to xl.cfg
Thread-Index: AQHXfZDNgVrtHzLC8keYeUzq7QcR26tNF7mAgACqFQA=
Date: Wed, 21 Jul 2021 22:30:24 +0000
Message-ID: <DF05B6D6-A0B1-4951-9F3B-2B647B1E41BF@starlab.io>
References:
 <6562806d7430431dc154af2c6e4a5232725fc136.1626800539.git.scott.davis@starlab.io>
 <c8a1120b-0a4e-60ef-66c0-5c33ab988a54@xen.org>
In-Reply-To: <c8a1120b-0a4e-60ef-66c0-5c33ab988a54@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=starlab.io;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a6e5ca0-8d73-49e0-23d6-08d94c97225c
x-ms-traffictypediagnostic: MN2PR09MB5212:
x-microsoft-antispam-prvs:
 <MN2PR09MB5212A19F3700A1AC5B9A4C2691E39@MN2PR09MB5212.namprd09.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 2JnEBLSRduxlFN1EH/eIwTvrCuZMtwgfVO8EM8TuDfVyOiHiAtSix57b9qq39Dsj+NWXrnnKtnlkhcIaYMPybuNOb7EIXw0vtm8QZ2yaFl/AzKTpxm7fsEpzUwSsmnDJLAp7QeMd13gWjJM2N/ttF1QisKfxYntWTqKap5VMwhDguldKeSxMMnu53As8MYBe2I/8KP1mQzaTSvwUIrLAM6I4YF1dGIuQbORkkHIk1kGV+75Q+2exvy62+tMTtVDSGAYqpO9e+HBOa/kt0TtMUELdiDBFdpt3SDqAYH+HFmRclK2gkyD4PmvAYYTQh3S+Bp8h6la05GbvWnpx5YAWajsGTI3bqZOzfUeU0pTRexvw4iuHYaHEoD8g1Dp1ZnhcVJKNC5YvvW0L5YyXM6kMMSh3meDzfvr5RE8Cd/tq1cDhCf+iQAj2hZvUuyqWxmbqZoSfCtQBgL1Re/q5wfz5ZPFwb1KKyi/JdNu+31IPxeazDErMn3tA7ptfeqsI4ij2YwM5Jxa8t9TAQ/87jum8Cg2Jkn+/t3o6ZzpDVY7ZW787LEaRiU+pHZf05MpXHnlryPgKzj+yYH6eWPCDKvAWhkC2zVTnsALCX7elpCt7XEIqP+PxfI7jGIC8uZeptKpFvD69hrhC6lMCKlK8TOY5rTvaD7oHM6ePSTdlgCj4eKnqGUIgsjjmGi9suExw2X5pUy4VVDFuDnJP2t5X29o1yGyuEcY1pPx5mPjvDr3osWo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR09MB5258.namprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(376002)(39830400003)(346002)(6486002)(26005)(38100700002)(8936002)(6512007)(2906002)(54906003)(53546011)(36756003)(6506007)(316002)(122000001)(186003)(8676002)(110136005)(5660300002)(4326008)(66946007)(64756008)(66556008)(66446008)(66476007)(33656002)(2616005)(71200400001)(44832011)(86362001)(478600001)(76116006)(45980500001)(38070700004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OGtJd29BVDEyS2tGSGVFNHVlUTNmR1A2YS9NYnR5R2t5MW1iWGNkN3RCc2N0?=
 =?utf-8?B?djd0Q05UZ3hUVVQ5SE9DaGlSa2RvOU1hQnR6SVE3Q3hIeVJWUS9yRXp1Z3RG?=
 =?utf-8?B?UlAyOHJBV3ZYRDB6YTVtdjhjVVFnVThZcm9OWEl6ODMvaHlZSTVXZ1JGZGw0?=
 =?utf-8?B?R1M4UHMrZXRaOTcybjhwT01Rdk82M1dHY21TSVJPUUFnK0M5UysvYTZ3b3Nm?=
 =?utf-8?B?K1pyZGkzS1NuWUFybW04eWRQaHp2TCtmSnFhN01EbUZSeFNaV3kva1NmUkl2?=
 =?utf-8?B?UU9VS21UeFkyNFJuR1RNQkJ0YWJ1ZE8rYTBnV0xFOTIwTXVVQW9mbXE0ZGkw?=
 =?utf-8?B?dUc4SFFvcHpRSXR4U1ZKRnpjR0h0NTQ5OVAvMVFRZzBvNEFoYjFXeG1QRVNn?=
 =?utf-8?B?VE5YRFVKRXpoS2RNME5tT3U5TDJxaExPMVFaUGhqc2RyU0Zjd2FzbGMvMWp1?=
 =?utf-8?B?SlpyMHlWR3EvRFBjVHJDVlU3ZGJuUW9iUkIyRjB5WWhpWElTVHkxMythTmdD?=
 =?utf-8?B?YWJId000OEk5Z0FGcGhxZnVFUmh5b0dZeG5keXY1T3VUdWRuV1ArZmhlNjZv?=
 =?utf-8?B?MTdNYVQwZnZGNDhpTzRYTWZwZkhveis0REZXN0FyMWp3djJZYjFjUk9ZN3NE?=
 =?utf-8?B?bVV2SXJPMTNhWUlPK3QrMDNpSEJzbXZWWUVSN2VyUHdUQW1NRUdtQm9LUGpq?=
 =?utf-8?B?ZWhOL3FFOGNuckhGcGYvTFNkRDJ0MURQMG5KTytBVEl3d1VZVU9PODdMeDJN?=
 =?utf-8?B?aVYzZXNxbkZoOERaa2Vsc3YzY25zR2FPdnNtV2FXSS9zNEVudTMrdDk3emRk?=
 =?utf-8?B?WnNESWg2R0pHWE1JS2krNWQ4YzhiMTNNeDJGSmhKQnFMRVhNWDdKN2FmMW51?=
 =?utf-8?B?NHQxYXZWM2dVbTEwLzZ0eGxZNDNQUGEycWVXZjlPU0M4Y21LeFF3NGEvWmZZ?=
 =?utf-8?B?Vyt4VHFvRHVENTNDN0VEcXZlbHVsVjZFdmpuaGQyMHRYOUZ2Qlh2a2RRMElm?=
 =?utf-8?B?L0swMEhnamVhSEVaQnlrQXJ4Qm5XcDFielh1Um9hbWtHUngwRVZnY3BIQ1Nk?=
 =?utf-8?B?bmxSMk9NRU9rRC82V24zQmJZRVh6cTRSQ1loVzRaNTdRYnUyM0lVMTVoMEJi?=
 =?utf-8?B?S1R0ZHFNNGQwUTRhRm9nUEQ0WXlzNUhiOSt5QzUvRk5TTS9WeWtoaDZ0VVQ4?=
 =?utf-8?B?TXBCRXlxdWQzRTdybHJ5OFhuNkNaZnhzR1hpL0l2N0J4alBMS0ZMT2ExdVN5?=
 =?utf-8?B?bjU0TGlKS1FiVUpJYS8zZXV6U3VudEFESUx1Z1k2WXVNMXVQaFBkV3FJT1V4?=
 =?utf-8?B?Q21pemdXMzlpa05vR0VxTk12NUJ6VmFpVTdtb0FTc0JTd3hmaTlvNEViQ2lt?=
 =?utf-8?B?akR3akVibW9jVkc1dXR6bURoTzBwVnIwcDRqVm1oNVhHSkV6UUE5YUIwVTNG?=
 =?utf-8?B?aFltclhmbnUwUjgwT0p2TGIrVXhBb2RvcHU0bjEycnlRTE1uYTlhTTdJOHAz?=
 =?utf-8?B?UTdpNUdKMTZNQlgyVGxUbGhabFBoaXh6R0pVWkQ3RlZudUtidnNCTCtUa3lt?=
 =?utf-8?B?d1ZDalR2M1E5MzN5aUNQd0dmOHp4LzloZFBiaG92M2VrQkQ1bTdCNHV6OWox?=
 =?utf-8?B?OUlXSnJ5UElzWDJaMFVWWE9sTmZ2VG9DYnlKSk0rNmRFTDMyQ1dwcVBNWWpJ?=
 =?utf-8?B?MTMrNGNCVGh4WDliWVc5VFMrWkN2QTc2SksySjFtYzdTaytpeW9vQlRybEpY?=
 =?utf-8?Q?OOT0x+zQP67wXBz2PvQB0qQQr6CfXy/eqAaCBu8?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <317A1053D392A0439A29DCF6DB9FD51E@namprd09.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starlab.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR09MB5258.namprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6e5ca0-8d73-49e0-23d6-08d94c97225c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 22:30:24.9135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5e611933-986f-4838-a403-4acb432ce224
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR09MB5212

VGhhbmtzIGZvciB0aGUgZmVlZGJhY2ssIGFsbC4NCg0KT24gNy8yMS8yMSwgNDoyMSBBTSwgSnVs
aWVuIEdyYWxsIHdyb3RlOg0KPiBNYXkgSSBhc2sgd2h5IGVtYmVkZGluZyB0aGUgY29tbWFuZCBs
aW5lIGluIHRoZSBrZXJuZWwgd291bGQgbm90IGJlIGENCj4gc29sdXRpb24/IERvIHlvdSBleHBl
Y3QgaXQgdG8gY2hhbmdlIGZyb20gc3R1YmRvbSB0byBzdHViZG9tPw0KDQpPZiBjb3Vyc2UuIEZv
ciBDcnVjaWJsZSwgd2UncmUgdXNpbmcgYSBjb21tb24ga2VybmVsIGFuZCBpbml0cmFtZnMgZm9y
IA0Kc3R1YmRvbWFpbnMgYW5kIGRyaXZlciBkb21haW5zLiBUaGUgY29tbWFuZCBsaW5lIGxldHMg
dXMgdGVsbCBlYWNoIGRvbWFpbiANCnR5cGUgaG93IHRvIGNvbmZpZ3VyZSBpdHNlbGYgb24gYm9v
dCB2aWEgdGhlIHRvb2wgc3RhY2suDQoNCj4gUGxlYXNlIGFkZCBhIExJQlhMX0hBVkVfLi4uIGlu
IGluY2x1ZGUvbGlieGwuaC4gVGhpcyBpcyB1c2VkIGJ5IGV4dGVybmFsDQo+IHRvb2xzdGFjayAo
ZS5nLiBsaWJ2aXJ0KSB0byBrbm93IHdoZXRoZXIgYSBnaXZlbiB2ZXJzaW9uIG9mIGxpYnhsDQo+
IHByb3ZpZGUgdGhlIGZpZWxkLg0KDQpBY2suIEl0IGFwcGVhcnMgdGhlcmUgd2FzIG5vdCBhbiBl
bnRyeSBhZGRlZCB0aGVyZSBmb3IgdGhlIG90aGVyIA0KTGludXgtYmFzZWQgInN0dWJkb21haW5f
KiIgZmllbGRzIHdoZW4gdGhleSB3ZXJlIGluc2VydGVkIGxhc3QgeWVhciwgc28gSSANCndpbGwg
YWRkIGEgc2luZ2xlIGVudHJ5IGluIHYyIHRvIGNvdmVyIHRob3NlIHRocmVlIChtZW1rYiwga2Vy
bmVsLCBhbmQgDQpyYW1kaXNrKSBwbHVzIGNtZGxpbmUsIHVubGVzcyB0aGVyZSBpcyBhbiBvYmpl
Y3Rpb24uDQoNCk9uIDcvMjEvMjEsIDg6NDIgQU0sIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IEkg
dGhpbmsgdGhpcyBvcHRpb24gYWN0dWFsbHkgc2V0cyB0aGUgc3RyaW5nLCBzbyB5b3Ugd2FudCAi
U2V0DQo+IEI8U1RSSU5HPiBhcyB0aGUgZGV2aWNlLW1vZGVsIHN0dWJkb21haW4ga2VybmVsIGNv
bW1hbmQgbGluZS4iIG9yDQo+IHNvbWV0aGluZyBlcXVpdmFsZW50Pw0KDQpBY2suIEFzIHlvdSBs
YXRlciBub3RlZCwgSSBjb3BpZWQgdGhlICJBcHBlbmQiIHdvcmRpbmcgZnJvbSB0aGUgY21kbGlu
ZSANCm9wdGlvbiBvbiB0aGUgYXNzdW1wdGlvbiB0aGF0IHhsIHdhcyBsZWF2aW5nIHJvb20gZm9y
IGl0c2VsZiB0byBhZGQgb3RoZXIgDQppdGVtcyB0byB0aGUgY29tbWFuZCBsaW5lIGluIHRoZSBm
dXR1cmUuIFdpbGwgdXNlICJTZXQiIGluIHYyIGZvciBjbGFyaXR5LCANCnRob3VnaC4NCg0KR29v
ZCBkYXksDQoNCi1TY290dCBEYXZpcyANCg0K

