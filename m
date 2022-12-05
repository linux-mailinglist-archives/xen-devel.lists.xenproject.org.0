Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84833642779
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 12:28:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453462.711075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29do-00064P-Q8; Mon, 05 Dec 2022 11:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453462.711075; Mon, 05 Dec 2022 11:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29do-00062X-NM; Mon, 05 Dec 2022 11:28:08 +0000
Received: by outflank-mailman (input) for mailman id 453462;
 Mon, 05 Dec 2022 11:28:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IUlJ=4D=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1p29dn-00062R-Sr
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 11:28:07 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2601c3e-748f-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 12:28:05 +0100 (CET)
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9686.eurprd08.prod.outlook.com (2603:10a6:102:2e2::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 11:28:03 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1245:e53:a5ec:66fd%8]) with mapi id 15.20.5880.011; Mon, 5 Dec 2022
 11:28:03 +0000
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
X-Inumbo-ID: e2601c3e-748f-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxQlkzY4F5FyItBAW5HWFNe4/Cn1ONZYrnMpFwNj99NTQDxjvjd9zMVU6aCOMT1SLEHrnHEweQGRMPO/BllrDdmIn28U/wlzhhXKoNt1uEfvws5hUGMpSKGjjZZ7WSAb0h8YR5domgIDiSkRWIQ/53XOXaedXgnA0gn3Zd7T0AkyOPYzl7DVznOpAQUOH1ksP+luVhIK2Wlv8cUFz+rFwXQBtmJs/uXEjHFIba/G+DEVgfVH4KvccTQRTwI5D9AwlMVAsGlrRKUVz4BFnhLnJVcOky9GHVXF1kcmHLKQKt4IQ9s7mOVrMvrDub050sxLzOoC4ThqD1PgoKza3kOEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3oKg/179sd2a6fSka7qYkzsJV655Ts+SVU/h7BNdwM=;
 b=i6FBFw8/AtaPYdaVxnpFwE2yyRMP+EOvqz7/Mbbjod9aE5Y7fMvcnVzAQbeLez1t5pyD4qaiimWOJtzvX2eSWvBUxPFrXSmh4mdpGFieUEas7wlHiSJGwp2QMgIadbw5XcYOjP78ENH6zw0ZUe85oZ0hxkk25KzKYfu/duyKtsfoUEB7YL0Y/TIu0KW3H4AD+vP75e/pDzEOa4cdy3zNww+DPQZauRsGVNpUNNeSneGPSJtoyCck/UABqRJfsQSsU6fPrS2tboj/Za6MVAnB4jc0dCAp/tPxl5velFRYjrzRPpw4A39abtxACgzy6HREZHYfK69N3m5cyfldRhdjhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3oKg/179sd2a6fSka7qYkzsJV655Ts+SVU/h7BNdwM=;
 b=9jWodHQLFH3Dn7zuXTIv3wyG0/MCZ8IZWvkGOm4/7k12POq1jwRSnQgR0TSgAgv5WJW+5ETLkIB/n8XAVhjynuqvbmP6NKgDADb1sfRAWczEuRAo/+TVYUYZfnkfSwaXEmxTNRyk/09r0nHNF4mldsfkhXkNT00/SkQBkI50uhU=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <jgrall@amazon.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: RE: [PATCH v2] process/release-technician-checklist: Explain how the
 banner in README is generated
Thread-Topic: [PATCH v2] process/release-technician-checklist: Explain how the
 banner in README is generated
Thread-Index: AQHZADhFhRdqD5Su4EO+T+vPnuMlg65PXSeAgAmHn8CABlJugIAAAE2g
Date: Mon, 5 Dec 2022 11:28:02 +0000
Message-ID:
 <AS8PR08MB79910DD6A46EB01C61E0C3C592189@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221124190850.35344-1-julien@xen.org>
 <6819d05e-d1ab-fc3e-7795-bac650df3bc4@suse.com>
 <AS8PR08MB7991D653E57C71D2B4D4B0C992149@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <4e89184f-2e47-8205-1af5-7b2bb5431926@xen.org>
In-Reply-To: <4e89184f-2e47-8205-1af5-7b2bb5431926@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D78EF33ECBBDD64996EE3C135A566B05.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR08MB7991:EE_|PAWPR08MB9686:EE_
x-ms-office365-filtering-correlation-id: 32228c31-8a2f-414d-4cb9-08dad6b3c5b0
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 WF0UhWvGUyNO+bMbRpPt1liPBDciHNsjg+FFTRSURbGaC+w6X4Yk28+KA91D/E/hNkjGEMa4j8kw4hteTpIqxScqMvfNR7tmzQiOOcQbhA27vms05MQ4stJ8JR9HU7PdmAz2m1q7NFtHbtEaU8/mDcxO0jPoTUN+V+Aq8RR1yMOTh2SqrDvqBsbYJqT0P+/NcD/GDoXA6hVlkO6kBsKBhz6WZY+jZUWHmYghNmRXHS45b6Nbp8pcnvcrEgT5B4F+vxd0at8br5mKnh4B5Io7i24uUeq9OAh5rL6EKPPi23YFPeH+KtakPJTfx2OCQEn1vAlLbcqrlKBKhdmx2rlswv1sHqlPuJQVi8nHwdjVTupVOaJhGQEgbcrtoGd2HBWozQpNSQ8MA0vj9mQfCC1hT9ibNZcbI7KObUGExHP2VJmFTpfLMu4WnZdA/OmGWVIpPjvuqThMXJjx6MjIC0WgeBzFxQjQpMe8xjaFEqCM/zYLNxDhrTYRSI1zZdYTUA5+r1ECHUgMXFI8bahcwgyQUY4/T4REwCv467tXgzGZWIndVmEaxhXxK2Gllr9zcr3TEYEGc7KDeCYqjZukTnbdUBpI0E+wlj+6s4F+KUVx4RfxIxAd4Ecur2CnPNtM1tQSDHZPEITdwDEyGITDGCRQXAQ9Ju2PWLq1GDFqtlkx4tJ+49g3VA2NDgMXRdTdLERpWEW0yBSNuJqrJSAiEfIKB6uzw8ex7DNiR8w+331ukc4=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(451199015)(8936002)(9686003)(122000001)(5660300002)(4744005)(186003)(38100700002)(52536014)(316002)(478600001)(6506007)(86362001)(55016003)(71200400001)(26005)(41300700001)(54906003)(110136005)(38070700005)(76116006)(7696005)(966005)(66946007)(4326008)(8676002)(33656002)(66446008)(66476007)(64756008)(66556008)(2906002)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWgwanpKbGdrbVhVWlBsVnZFOGN0REt6UWFRRnZQZVRuR2xTcWVMeEhDdHdm?=
 =?utf-8?B?VnBQcFNueG8vamZNMmFBZ1ZwT3J1RmRkZHpqeWs3aHpPM2lZZWlMbk1RV1U5?=
 =?utf-8?B?MVFVNThEUUltSXhackxMRTJmalRvSXAxOUNjOVJua2ZYSU9wSFk5dGRJeW1n?=
 =?utf-8?B?bVZQVmZ5R2ZwTTRmM1kxT0JRRDlCSjllS2hwRkkrTWNnSUJpakVhMmJHT3ZE?=
 =?utf-8?B?STM1bkVETmZSMDZuTUV1VTdvZ2FzUTZXc0tDcm9lUzhleTZLZ0sycHo4eExD?=
 =?utf-8?B?UTZjQllDOEVhaTZIWW1SeWhOaVpZbkhzbTlET2pES01PaUFuT1cyR2lCNGFa?=
 =?utf-8?B?a20yc25ScEx6RnprZ2ZxWkIvcHBjczRublBhWlhXUHZ6TmFhQndlblZaeTE3?=
 =?utf-8?B?bWdNN2xWclpaaDZxeVVLWkhtU0d4Tm1yalFEZjhkRVA1SVhmbWxNL1JpemVL?=
 =?utf-8?B?VzJDTGVuTTladksxakxxUEdoQVp6N0VRY0o3cGRBdk52cUEvZDY1YXoxcG9q?=
 =?utf-8?B?cE93WG1teWV5VUdCVHVRTUZJUzlJenVyaTB1M21UdXYxaWpncW95UmU5VjV4?=
 =?utf-8?B?aHppcXgxNWJmdEY1Nkd6ZW9YS0txd0gwdDJBc21LYUdNQTZvSE5KL2o3dDB6?=
 =?utf-8?B?QUM0czd0ZGJSWFh2aUV4L0wvdEdINm1wQWExNlJMQmZYWjJwSlppUDhqTE4x?=
 =?utf-8?B?b0J3dHc5TldZOGNVUUM5RGxCVnQ2Unh5b3Z0R1VyOFIwcGxTQjNMTWpsMk4r?=
 =?utf-8?B?QWtGNURtT0ZxZjRHTTBWYi9jZzlDeEpaVnRVK1V3OFBJdmNteTFnaTNmaFVV?=
 =?utf-8?B?cFRHSUxXdC9BV05HME96RDRxVGhrbnFTOVRiVy9GQURqUDEzcWtIQWh6OHp2?=
 =?utf-8?B?NDBRWUNXeCs3K1c2MmNwQmJ5ZjhEeEk2cTNqV0VSaTNSV0t2UHAxUGkvTWlE?=
 =?utf-8?B?QitWSEVwS0xKM1ppUmtBWW9HTUVpeVo5eks3WTRDTkdIVmJJYVBPMkxkTkE4?=
 =?utf-8?B?dWZhNkVtbFFQQnIrbUROWjNHclY4R210emxFZ25aaUtLN3VnQ2lFSUpiWHV5?=
 =?utf-8?B?ZjhQYytsUEVWcWNyN1pmU240Z1kvS294Qk1Hb1Q4NWhvVVlDWUFYbXo0dC9O?=
 =?utf-8?B?UzNYMm9wN3dWQWpUcHpoRW5YSTNCQlRJZ3lvRTc4TE9TRTVRZnFtNUpnb3BH?=
 =?utf-8?B?dk1VeUVzVy95N0w5N2pmSWFObTNpYmtZUEVCWTh4VzVub3JIMU9kSTk5SDhY?=
 =?utf-8?B?L21DcnczdFdROVNpQlp1UmthczVZUHQvVld5N3NBc2JSNXc0QUEwUHVnNVBz?=
 =?utf-8?B?aGtZam9GS3hGNWxqeHdPV3JwQzFCNWVmUGx0OUNHRmJYQ09vaTFzZHQva0FD?=
 =?utf-8?B?L2QyY0lIbk03ejJwVUhIOVNOc2RPZFkwMHdSVi9RUnl4Qk42U2dPNlNQMjVP?=
 =?utf-8?B?NkNHOHByenFhSi9NMzBJNm04NEplSDdRd1hNNTFnSDk2NGNOTW5vZEh0TnJZ?=
 =?utf-8?B?ZThvek53eXNPS0swWGtXMlpKMUlRZCt4aTRtNzQxMTNPM0p3Q2pGLzVvZXIr?=
 =?utf-8?B?c0I0MmhjMjhyRUozdzR5WFptQjYxbFRMVnVCSk4zWTNhSEtNdGxmY1h5azZ5?=
 =?utf-8?B?VEpqcXRXbnJNUzFLdldwc3ZVa1BNRk1DMVY5aVpISnlUU3A1TlljRHhXZTcw?=
 =?utf-8?B?c1VPUzFvcitFMjhkR0dYdkdHN1VvV2lIQTBZNmljS2gwM3RYM055eEdlcmpD?=
 =?utf-8?B?bUg0MXJ5VnNlendEMFRwUlZUU1dNcW16dXdmdTJXTHEvN1dUUjhCQ2szS2ZN?=
 =?utf-8?B?Wi9hQ0tzcnd1dzM0eVo2aHVIWkZ3LzlEalNxMEk5YkdkR25VM0NnMEMxeG9z?=
 =?utf-8?B?eXNTdzZndTNySW9pL1hVVnZkcDBxWjZHRldjZkxzejJvTHFSWC9zbzZwS2Ny?=
 =?utf-8?B?YkRtL2dEU3ZHYklWWU9uV3ZNRVFIbHVhQitkVkVVTVd5Mk9sSnJRcG5WVGdT?=
 =?utf-8?B?RmljVkRqWkxNQnppWXBBSzI2WS9sZklqMXBvUnY3ODNsd296TldpcHlvZkRH?=
 =?utf-8?B?dDAwMkVvakFYUCtpeEF1d1lKcTIzeWYxNmZ4b1MvNGNPY0Q4azRjTDNMd0xo?=
 =?utf-8?Q?V3UA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7991.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32228c31-8a2f-414d-4cb9-08dad6b3c5b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2022 11:28:02.9877
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cya4V+zadX/sHrDLUpqmMqD4scumIvD4pjrqC1Tq+CDXSSF/VrKr5U3SrgHMjZ7cNjao3QhlNFPox7cseX0YAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9686

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIHByb2Nl
c3MvcmVsZWFzZS10ZWNobmljaWFuLWNoZWNrbGlzdDogRXhwbGFpbiBob3cgdGhlDQo+IGJhbm5l
ciBpbiBSRUFETUUgaXMgZ2VuZXJhdGVkDQo+ID4+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQo+ID4NCj4gPiBSZWxlYXNlLWFja2VkLWJ5OiBIZW5yeSBXYW5nIDxI
ZW5yeS5XYW5nQGFybS5jb20+DQo+IA0KPiBUaGFua3MgZm9yIHRoZSByZWxlYXNlLWFja2VkLWJ5
LiBIb3dldmVyLCBJIGhhdmUgbm8gcGxhbiB0byBwb3J0IHRoaXMNCj4gcGF0Y2ggdG8gNC4xNyAo
SU1ITywgYSByZWxlYXNlIHRlY2huaWNpYW4gc2hvdWxkIGFsd2F5cyByZWFkIHRoZQ0KPiB1bnN0
YWJsZSBjaGVja2xpc3QpLg0KDQpObyBwcm9ibGVtLiBTb3JyeSBmb3IgdGhlIG5vaXNlIDopDQoN
ClNwZWFraW5nIG9mIHRoZSBjaGVja2xpc3QgYW5kIG1heWJlIGl0IGlzIHNsaWdodGx5IG9mZiB0
b3BpYzogV2lsbCBpdCBib3RoZXINCnlvdSBvciBvdGhlciBtYWludGFpbmVycyBpZiBJIHNlbmQg
YSBwYXRjaCB0byByZW1vdmUgdGhlICJxZW11LWl3aiINCnNlY3Rpb24gaW4gdGhlIGJyYW5jaCBs
aXN0PyBBY2NvcmRpbmcgdG8gdGhlIGRpc2N1c3Npb24gd2l0aCBJYW4gWzFdLCBJIHRoaW5rDQp0
aGlzIGNhbiBiZSBzYWZlbHkgZHJvcHBlZCwgYW5kIEkgYW0gYXNraW5nIGJlY2F1c2UgSSB0aGlu
ayB0aGlzIGluZGVlZA0KY2F1c2VzIHNvbWUgY29uZnVzaW9uIGluIHRoZSA0LjE3IGJyYW5jaGlu
ZyBwcm9jZXNzLg0KDQpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsLzI1NDgy
LjEwMDA2LjE0MDE1NS45ODQ2MjlAY2hpYXJrLmdyZWVuZW5kLm9yZy51ay8NCg0KS2luZCByZWdh
cmRzLA0KSGVucnkNCg0KPiANCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

