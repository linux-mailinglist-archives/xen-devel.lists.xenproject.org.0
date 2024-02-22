Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B848685F17A
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 07:24:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684189.1063900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd2Tl-0001Ow-NU; Thu, 22 Feb 2024 06:22:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684189.1063900; Thu, 22 Feb 2024 06:22:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd2Tl-0001MY-JW; Thu, 22 Feb 2024 06:22:45 +0000
Received: by outflank-mailman (input) for mailman id 684189;
 Thu, 22 Feb 2024 06:22:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F9EN=J7=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rd2Tj-0001MN-Tj
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 06:22:44 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7d3ce6e-d14a-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 07:22:40 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM6PR12MB4958.namprd12.prod.outlook.com (2603:10b6:5:20a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 06:22:37 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa%5]) with mapi id 15.20.7316.018; Thu, 22 Feb 2024
 06:22:37 +0000
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
X-Inumbo-ID: c7d3ce6e-d14a-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tva159OzZ62B3CGu9Rt6nCKkJ3JyOo0q7UB0gG9Uw8I5duhFj/ketWaTNjAGJT0tf6FLeDd6Jfax7pVa9KutW6Jrp6783ZbErcI3zbbfKy2opF6ZnTfjt1KTnRVQi/RcWvFwsgZ7Laj0GMKAVuJAvcNHMdAPwQhV/jWdByMFxTFMl8aBZjZKZtNlUmGgwOti65jqyXbljminLFheIgTk1Wd5vsD3x6tlTCrgq4KWGf1Qd/7PJ7eP9lD2pu/lbUQlfzLHnMXhq+N0QBc0G0R5FMJKdReKF1cBxvtPOihE7jvZvgt/T5zo7wjGGLkvw2oN9jTDvSsh/4GljaJOSeLZVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8JDNaLthTdtyHVQWbnOQqPmvGWO/rBfwadANohq0Tg=;
 b=ViSCMAa2rx8HrKMLD0KYNlkvsEmHr0YTTi3yK8eKP3Gq0n8Zj9AnZDmBJhFnTYIpn0Brf3++qrkQSbNw5u6PUSKhAZoxSyiia6pWfsXbi7hDnBsUe5jr7s1J6woWXhz6pQVxsfw+xnYX/0ONxCPx4vT96FfDI8YAgDzNsPleybW+jUS16k6gHdn4I9ZgvF77Tcamq7BTbNF8X6qVRod7Tt5WOerBtWp0RhaxdYNB7pX76c3hfDypg9bC3Kwf0u3vJ64XNPyNKVVG8XAhz7GCzS2EUPgfgqD7MWA0jx/a75BmylZz2fe9okgaMhX6ZtIm5q0R8la+Chwh4QlBltVLyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8JDNaLthTdtyHVQWbnOQqPmvGWO/rBfwadANohq0Tg=;
 b=sXt9gKDPsYqQhtN4eEQ6ppQvniuImFrMpeass8rCi6+/QdZZ5u3gj2zZsPbq4bj0L2WcMwLIFmbfL36/csEDwJMuBlxewuAD0onKcpdxv2lf2liVkrBNQNXCPzhWH0eODlE3k04ZyufF3kOmk8j7Tr4HYVSrunU9HMJeq4t7+UE=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen
 Gross <jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v5 1/5] xen/vpci: Clear all vpci status of device
Thread-Topic: [RFC XEN PATCH v5 1/5] xen/vpci: Clear all vpci status of device
Thread-Index: AQHaRR6lSBH6S20cFEGVGIBPBL8sdbECeg+AgBQujAA=
Date: Thu, 22 Feb 2024 06:22:37 +0000
Message-ID:
 <BL1PR12MB58493E40588F4A7BF351B596E7562@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
 <20240112061317.418658-2-Jiqian.Chen@amd.com>
 <9b4ce4c7-6f4e-47ec-b3a4-0b417cd2660c@amd.com>
In-Reply-To: <9b4ce4c7-6f4e-47ec-b3a4-0b417cd2660c@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL0PR12MB5539.namprd12.prod.outlook.com
 (15.20.7292.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM6PR12MB4958:EE_
x-ms-office365-filtering-correlation-id: d2d31197-489f-4e9b-275b-08dc336ea9fe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fhHbksfbiB05iFKxhPpR/xSd8997RE6Bk+Ki87T0AFhdclkSJIJ/YahKiQaTz7xg2l8KqqYAcYjlNwtQMQzsDzJYHJJRv1yaB8YFdwMG9uyoZxW4p3aoXvcN2PW7uM8AC+xPUaMnSgqvHa/8gtI9sinhUUVY9EAObdeDY+Ib0CRwQx7KgA8ehkijCRJJS51vtu8dimSB9+Vg2jj2oTonq7cVgfKYmFxvAGCw/2vsOvc9gFroUUVqPydpgUNfPLjy+SFwtAklu4wflE12GVpMMTaK1kn7kHJ95ZjX+681DgIz0YLh6FOD7Wq81OK1d/EhPZLyGidVPEL5MfwDXxDSczeg/jYgm/ivJv7g2uZhD+Qqu1ZXqia5EoVmu3/U0Dv5FHRWgqrvSsKpsWJUeIk/q30kMfgTvY2chOgbGZwQUhCWaaqsux+HQunQWLVNjqxcKwZaIjjY2bNvVDMKcYMAZOCDxjlFcbTaZnPN/rWUC95jzYZA+Q0IcKPsAA4Mu07P0w49aAB79XAcsQf7+aFHNO9J/eLCtOyMS/ywgliYZTG14NLag62tYVndp/ieysUIsnJPgM6Ca4oQxwqz0TqOHFfg3epRqaaljUwYLN5oi5M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UnlpMXk5QXhnQXdlamJMTGh5ZDN5Z3VBb2tLT1hBL1o5WGJHOWxWRmZsVlBZ?=
 =?utf-8?B?MkJZSngycWd5cEtFcVhEeGpjYTRiVTR5ZExGZHlnNGpQTTl3UkJkY0djakVi?=
 =?utf-8?B?L2Y3QmRoRlRDcW5waVo0NXdxS053bHBEQnlJT1Y5T2xRVGIvdkk0OW1sYk0w?=
 =?utf-8?B?VWFKbTdnSitpNmNtRjM4NktHaElOWVU1WThMZ3g2bnY5OWRjU3g4SnZOdnph?=
 =?utf-8?B?THBQbjM3NzNwS2crU3dzVG9FRGtPWGJQVTlZa1NNM3k5U1JWeHBjbWpLdy85?=
 =?utf-8?B?QUpsUUdlS2ZMUDk0YVQ4VnJBTElWWkNUY2Q0NDZoeit6enFJb29EYmlabm11?=
 =?utf-8?B?dnFvbkZwL2IzSTFUOEpPZ0Naa0d6SnJmeSs1N0ZGb2JqbGRXT0hVbjdiS3Zo?=
 =?utf-8?B?dFF0Z3gwTkp3WlgrcENhSlI5akZ1eStzN2pTY1JrUGJqZXRHSTNJd2NQZDh1?=
 =?utf-8?B?dzN3Y2NwWnorWGNSWHViN094Zmh1TVRHTlZrSGdPOVFzR3VhYmtGdUhHWnBr?=
 =?utf-8?B?cTQ2bTQvdk5Sby9Mb0tkUXphZVdibXZHRVl0dEJQaHB3YitGYm9kNWREa3dM?=
 =?utf-8?B?N3psM05MK0RIV1FJK0hrd25Gb0JpMnI5dFZ6VmhUcmNKM2dyTWh1emNYRmk2?=
 =?utf-8?B?dGsydVcrU1JtQkxFM0FRcHQwb1NwZGhzWGxhd0N2TmgwRXZaWmlGT3pQNG9T?=
 =?utf-8?B?My9OOG9hV2FlTWorMUVTLzVvQ3JjK1lJdXNWSThGR0VQcHQzbnRvMnF3eFoy?=
 =?utf-8?B?a1QrRG9MNmcya1NhMkEzME9vMFA0OEJNQ09LT2FYZDI0eGRlYUtYUVpyVnNx?=
 =?utf-8?B?cTFMUTRLZ2xYcXduZndLNGdVMFEybTZTcmJ0dzRJM2NjaGxkZTZsbjBnMmY1?=
 =?utf-8?B?UlFQZXZURmozT0NrRzNWWTIrV1dIcWRsazhSalJGQ21UenFkS2prU3A4OXE2?=
 =?utf-8?B?R0J1WnJJa3o0cHRjV29PbFc1OE44ajdLbHMwczJtbW5EdWNob1I0YkNpOGc4?=
 =?utf-8?B?QmJRL3FxVy81QzFIcjc4eTRidTk4eEpmYm1KcDNsMkhncE1kWVkza2p1Nzl1?=
 =?utf-8?B?aGpvd0pJczhjQXVyY1VzZ2p0eVlieWFQTnVOUWxkRU1lanFudmdJTzdFa0Z0?=
 =?utf-8?B?c3lpU2tsOGpwWnpkcS9rc2RrSGxLNU42WlB6MHlQdVI4MGJseVFQOEo5YWZU?=
 =?utf-8?B?WnBCTE1WYWxwdDlYMGRhWDY3NDRFNW1NOEl4VnZRNHcvV3FlUGhxK2xaMUtM?=
 =?utf-8?B?WmlKeUFyNGlNUG9rcmd0bUpNcDZ4V0hZSGJQaHZYS0JxMU1SYmtrOEFCR2VO?=
 =?utf-8?B?a1FndWM2clRBUTJ2VnhMSVkzelJqeGVOcjZIM2hXM21CT01PTDNweGFVV1hZ?=
 =?utf-8?B?MVpXNWYrU1V0alVXMkNtVkhRc1dwWCtONlRYcWh1RksvZWEwSWJiLzNaY2NJ?=
 =?utf-8?B?YVhVTGVaQ21qNm45aEZEdEZLV2RRQlJGTnVsZ3dUc0llRkhDd21GdXNyRmhn?=
 =?utf-8?B?U01nVjdXeVQ1TDl4bHJQUVM1S29HZk5yMUtaOFZYVzJGNCt0eDZRZzJSUHhi?=
 =?utf-8?B?VUdBMEtDbHZPWElZSWx6QVo0Q3JWNkxYYktsbWdUeGVzbzhKSmtlb1Q4T2V0?=
 =?utf-8?B?MWtkWEd6L0dBbzdYNHFkUGdHd0w0TUYxT2RLaUlpUXBFbGVoa2ZPNzhQd0E2?=
 =?utf-8?B?YVQrN0ZDSTBybmNISmd0Ym8wS1ZNamRmQSttb0pqbnFLYjRYbXFDTXpwbHBI?=
 =?utf-8?B?enllWS9McXAvTjR5QkdRNk9IdDNkYU9qaXV1WEFkelN5Mmx2NXFFNE9SL29x?=
 =?utf-8?B?ZmxIRFZWbmlRMC9GZFRuazJZcDB6bzBTSjN1RTNBY21PRmh6ZjZwMVpZWmZi?=
 =?utf-8?B?bG9sM1VrU21RcVptQXZTSkdycnpqQTZLOEUrTXUzMHZHY2FDdG5hZCtzTGtz?=
 =?utf-8?B?bEJJTHM3VjBpY0ZBTUJPaExwSFJtdHVVQU5xMFpHa3R5WHJsWEVwSjBaV2pY?=
 =?utf-8?B?YW9rUGRTVnJyUkxCSWc2a2d6Yll1akFmSFRqWlFiUm1KQ2Fydk5DV1RCWFRU?=
 =?utf-8?B?SVhoTkJrYWtuQUtVVlF3MFBEZlNzUW9yYktaNU1ldmo0eGhaQ1FHTGhEWEcw?=
 =?utf-8?Q?qh64=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C57769D79BA4074ABB5A2552915C6BC8@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2d31197-489f-4e9b-275b-08dc336ea9fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2024 06:22:37.0982
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qqb6ee6Dajw6zqXD1t6y0KIhuhIyLk/g6VI0EbY0kX/RKULgWjbmz1Cxr3zsz7bHW4RwFybQ3VpTBaudthRwNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4958

SGkgU3Rld2FydCwNCg0KT24gMjAyNC8yLzEwIDAyOjAyLCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3Jv
dGU6DQo+IE9uIDEvMTIvMjQgMDE6MTMsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gV2hlbiBhIGRl
dmljZSBoYXMgYmVlbiByZXNldCBvbiBkb20wIHNpZGUsIHRoZSB2cGNpIG9uIFhlbg0KPj4gc2lk
ZSB3b24ndCBnZXQgbm90aWZpY2F0aW9uLCBzbyB0aGUgY2FjaGVkIHN0YXRlIGluIHZwY2kgaXMN
Cj4+IGFsbCBvdXQgb2YgZGF0ZSBjb21wYXJlIHdpdGggdGhlIHJlYWwgZGV2aWNlIHN0YXRlLg0K
Pj4gVG8gc29sdmUgdGhhdCBwcm9ibGVtLCBhZGQgYSBuZXcgaHlwZXJjYWxsIHRvIGNsZWFyIGFs
bCB2cGNpDQo+PiBkZXZpY2Ugc3RhdGUuIFdoZW4gdGhlIHN0YXRlIG9mIGRldmljZSBpcyByZXNl
dCBvbiBkb20wIHNpZGUsDQo+PiBkb20wIGNhbiBjYWxsIHRoaXMgaHlwZXJjYWxsIHRvIG5vdGlm
eSB2cGNpLg0KPj4NCj4+IENvLWRldmVsb3BlZC1ieTogSHVhbmcgUnVpIDxyYXkuaHVhbmdAYW1k
LmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4uQ2hlbkBhbWQuY29t
Pg0KPiANCj4gUmV2aWV3ZWQtYnk6IFN0ZXdhcnQgSGlsZGVicmFuZCA8c3Rld2FydC5oaWxkZWJy
YW5kQGFtZC5jb20+DQpUaGFua3MsIEkgd2lsbCBhZGQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0K
PiBJZiB5b3Ugc2VuZCBhbm90aGVyIHZlcnNpb24sIHRoZSBSRkMgdGFnIG1heSBiZSBkcm9wcGVk
Lg0KRG9lcyBvbmx5IHRoaXMgb25lIHBhdGNoLCBvciBhbGwgcGF0Y2hlcyBvZiB0aGlzIHNlcmll
cywgbmVlZCB0byBkcm9wIFJGQyB0YWc/DQoNCj4gDQo+IE9uZSB0aGluZyB0byBrZWVwIGFuIGV5
ZSBvdXQgZm9yIGJlbG93IChub3QgcmVxdWVzdGluZyBhbnkgY2hhbmdlcykuDQpUaGFua3MgZm9y
IHJlbWluZGluZyBtZSwgSSB3aWxsIGFsd2F5cyBrZWVwIHJlYmFzaW5nIG15IGNvZGUgZnJvbSBs
YXRlc3Qgc3RhZ2luZyBicmFuY2ggYmVmb3JlIHNlbmRpbmcgbmV3IHZlcnNpb24uDQoNCj4gDQo+
PiAtLS0NCj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2
ZXJzL3ZwY2kvdnBjaS5jDQo+PiBpbmRleCA3MmVmMjc3YzRmOGUuLmM2ZGYyYzZhOTU2MSAxMDA2
NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYw0KPj4gQEAgLTEwNyw2ICsxMDcsMTYgQEAgaW50IHZwY2lfYWRkX2hhbmRs
ZXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gIA0KPj4gICAgICByZXR1cm4gcmM7DQo+PiAg
fQ0KPj4gKw0KPj4gK2ludCB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZShzdHJ1Y3QgcGNpX2RldiAq
cGRldikNCj4+ICt7DQo+PiArICAgIEFTU0VSVChwY2lkZXZzX2xvY2tlZCgpKTsNCj4+ICsgICAg
QVNTRVJUKHJ3X2lzX3dyaXRlX2xvY2tlZCgmcGRldi0+ZG9tYWluLT5wY2lfbG9jaykpOw0KPj4g
Kw0KPj4gKyAgICB2cGNpX3JlbW92ZV9kZXZpY2UocGRldik7DQo+PiArICAgIHJldHVybiB2cGNp
X2FkZF9oYW5kbGVycyhwZGV2KTsNCj4gDQo+IE5vdGUgdGhhdCB0aGVzZSB0d28gZnVuY3Rpb25z
IG1heSBiZSByZW5hbWVkIHNvb24gYnkgdGhlIHBhdGNoIGF0IFsxXS4NCj4gV2hpY2hldmVyIHBh
dGNoIGdvZXMgaW4gbGF0ZXIgd2lsbCBuZWVkIHRvIGJlIHJlYmFzZWQgdG8gYWNjb3VudCBmb3Ig
dGhlDQo+IHJlbmFtZS4NCj4gDQo+IFsxXSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2Fy
Y2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMjQtMDIvbXNnMDAxMzQuaHRtbA0KPiANCj4+ICt9DQo+
PiArDQo+PiAgI2VuZGlmIC8qIF9fWEVOX18gKi8NCj4+ICANCj4+ICBzdGF0aWMgaW50IHZwY2lf
cmVnaXN0ZXJfY21wKGNvbnN0IHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpyMSwNCj4gDQoNCi0tIA0K
QmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

