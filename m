Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB7D868511
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 01:40:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685848.1067242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1relWD-000484-It; Tue, 27 Feb 2024 00:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685848.1067242; Tue, 27 Feb 2024 00:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1relWD-00045q-FJ; Tue, 27 Feb 2024 00:40:25 +0000
Received: by outflank-mailman (input) for mailman id 685848;
 Tue, 27 Feb 2024 00:40:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uNB2=KE=nxp.com=peng.fan@srs-se1.protection.inumbo.net>)
 id 1relWC-00045i-DN
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 00:40:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2611::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id caa8da27-d508-11ee-8a58-1f161083a0e0;
 Tue, 27 Feb 2024 01:40:23 +0100 (CET)
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by GVXPR04MB9734.eurprd04.prod.outlook.com (2603:10a6:150:112::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Tue, 27 Feb
 2024 00:40:20 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1232:ed97:118f:72fd]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::1232:ed97:118f:72fd%4]) with mapi id 15.20.7316.034; Tue, 27 Feb 2024
 00:40:20 +0000
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
X-Inumbo-ID: caa8da27-d508-11ee-8a58-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3L2n/B8cLHJ0tKhxHg2UXa912ftH/ZnXQN6WES+P6zqrzDdT8PSXoDFMKjDoPPExxxmDnpblVp6dH45z938NmBbM81bc1Dgi+f4pJuxon0yRj2oWZLY5FrVeY28/ML7eHfKra/2MKP04cFtjsBV86PFZHuYaZN5QYhJWnsU2I4T265JTylHdv7CBv+ehcedvTV3e5yuomAFf6nWhEbzHiQQNA7AjrQpYK8AGZpOLTkcXUJkljOZEJ4xGVaoJ+rmZmZn8gYWUASt2++y886eMj9G/iLQPVVY3oRJAiXQX2iplGna8KQ2nGV8hJrUPwp4lflOZswtsoXmtqJ8FzvpkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pd5dneSFqnwjQ7kRPh0WYjn0rt78AoXtKsG++ZtjS8k=;
 b=SaTLsxLvfCPzFKpUZH1qGZDEl76ADsYq5RMXjPG15kAR5H/5jTqIYlDVJwFZAhO5679SjuVlyM2uXSMPMIT6/JR3z64G0DsZIASScbGAjNIOs7xU6KTSIxQFz71EGViYEfWNgYKaCEStZcpP1qPHbafsGJ9Obbr4ouQHmW/28WEyTk6SY8x/JCRclbGgFhqaKjdmFeSiOuX0Ems+kLXnRDqwV8oz5SQ9fdVO8pllqNHJmMwBN4R/OUnwF/tpchhtueiGJwZNE8zprQ5tFD4JxbxzzLsEPwaZ6obQ00SFyWkSOCko2lNX5CvGI5RAOgj/8oDLZ0LSSXEGPMOQ8uDvbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd5dneSFqnwjQ7kRPh0WYjn0rt78AoXtKsG++ZtjS8k=;
 b=cvTpzS9aftJrdUfcDGCSEwfiZVy1J5/5F4dLsx0JWdyy4IoxEvzQHrOf212Y/2w47w15Z2BJGwidkHbxBau/OXl8ypUpp3b2aEdayOQM3vyXcm2F1rCR4/8U1wZblujhCRbGtKAxh39Exd7ucP7HXHy+4fsl090LoLcrkQzy7ek=
From: Peng Fan <peng.fan@nxp.com>
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
CC: Julien Grall <julien@xen.org>, "vikram.garhwal@amd.com"
	<vikram.garhwal@amd.com>, Leo Yan <leo.yan@linaro.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Stewart Hildebrand <stewart.hildebrand@amd.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: RE: question about virtio-vsock on xen
Thread-Topic: question about virtio-vsock on xen
Thread-Index: AdpmUSXKZvg8Aft6RRu9smUwoggtbwAUAHAAACuPlYAARFRfYAAj+0EAAAkpkYA=
Date: Tue, 27 Feb 2024 00:40:20 +0000
Message-ID:
 <DU0PR04MB941733E93504EA7EA3A20B6788592@DU0PR04MB9417.eurprd04.prod.outlook.com>
References:
 <DU0PR04MB941734DA793D87B7FF3A491488552@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2402231332580.754277@ubuntu-linux-20-04-desktop>
 <ee69684a-5aad-417a-8522-1cd1b5322bbe@epam.com>
 <DU0PR04MB94175684F8B7678A7B885559885A2@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <e391b7fc-bf6f-4c3a-b444-5b320466294c@epam.com>
In-Reply-To: <e391b7fc-bf6f-4c3a-b444-5b320466294c@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|GVXPR04MB9734:EE_
x-ms-office365-filtering-correlation-id: 3c03585d-7c05-43cc-5f5a-08dc372cad05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rKn4p94G5Q5Wl9Xm0gCLgK2ajT5eF8iyF6wlEIq21VirItOK6avs+JafkShPPkPrEton/uW5zjbLE8/O0zKQvNDHzZj/5QZ4JJCmdcYC7QIXNsBEq36Sn8UG31fcY274VwX0yY5p/sg73mEydq8ySAmF4yFJD9FggVQ5eEgrsa3ia1TEiv2idOpjLfa+ic9qhK7jcjff8UQUh+wPI6qg1HaIfvEvHoz68qYjt4iWOdFOYihmcT2Q67qSgs08TRMmk9tmsjXo4/1eQuihvCrExVpS+aUX8VOBPEJdKaSsMOiqFmzHHTWInDyTokFJXrgUoIj1++WVaWpwFFzwwjzZnoiwEH8kcDc6UlrnvgJimhq/iuBB+VzJ3tvMedxT8r4fq4cdzDnDfEwP0cktzBc5VFV9C5xAhjMfdZbV9jSXWRnPXhI72czFwG3EqRJ7Ec1pFd+7onBo8bvSdII4ApFy4dgozcd7749D1xe0w50NtCEv82eUuIcnCkeYOatJLtxDpkU2fZBrVywRsF7x2skYG/SLH4oY470KFRjNZONh4XRVxjqW9+CSEaKKEMHUWQRFCANw3IAI0NHADvia2pUed802sJ0AkGwqysldHwVRao0f0up4TRVgA9AOxbMOCj9cHQmIkqcqdDNViCZM9xv6ZvpW7yr+6OCoYyGCtAJPv6iJF7YKs6iR0/3+VBAN9xUcBVQOYOBMimaMe6kaPKaobg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?L0dTdG1yL2d0b0IzeUFza1V2NENXTmhublNzVDRlcUFkcU4vWUc3OUt5Sk9P?=
 =?utf-8?B?S2NJQ2R4K1ZLQlpGSjRlRE1MNDI0bmU5R3NLRW5SYmVzanVWUmRuWVVFZ1J5?=
 =?utf-8?B?bFNLazMwU3Y3aWdGK1lJVjhIZXJjSUt1ZHVaeW9JQTMrajdxQTFYVFFzcDRP?=
 =?utf-8?B?R2VWNHJ1QXh4ZVZvZkpPdWxKWnloYWgxT3N3dTQxZFBiRjU3VVRNK0RDeHhm?=
 =?utf-8?B?WVluNnI2aExtN00yZW5MY3hiRG16TittZ2ZoSFlic1pjajNtcVAzNU9ib1pS?=
 =?utf-8?B?TGFZUUZTYW1Ca1Z4Snl3aWJZK3Y2QURiUXNLNVhzMEVUMitHM0VTSDE5bVow?=
 =?utf-8?B?aWtVUVNPaVo0Ymh4S3pKYzlNaEhrYkFjQXI3N2xraDV6RzAxQVlWL1lvQUhI?=
 =?utf-8?B?WGFhY3FIR2cycjlUM2tTUnI5bzd0anE0c1JNcEs5UFU1OEhsRFpPQ1NhOTYv?=
 =?utf-8?B?eWpNTVFHOFUrU1Q5cUdsa0pBTTVTMy9wQ282WHFqSzRzeXBiajJTOEgyNG5o?=
 =?utf-8?B?eGtmOVovbitPSXE1NWZyZzgyK2FTeUVDb1BSZCsyRTJvK0laYWNGeGova1l2?=
 =?utf-8?B?UGo1UGc2cTVLL1NYM0tKK0lDcGgwN1kwRWh2akMrUVVpTDV2NHBKZ3E4OXd5?=
 =?utf-8?B?aEZOaXFPd0Q3dTQyU25BOXl4WmxtcnNON24rM3lhTzNRTXVWMWgzdmV6QnRC?=
 =?utf-8?B?MXBYcUIwOWo3ekhaZ1B2dURsR3ZHUEk4RjMxUTh0dnBCSXBqUHladXMwMStH?=
 =?utf-8?B?UXBFbzVVVlM2NStjejFHT2NraWx4azR1U2U1OXNZa1UrN1ZjYXJjQms2S1E0?=
 =?utf-8?B?OUhuTTBaUTBJWGx0Y0FqS2xqOXZkNTB0ZDE1R0pHeDVpbGprNzh6TU0rbzNh?=
 =?utf-8?B?ZkJ6VUZzRzdjaWV0V29zSEFEYzZYQzhIQVRoNTZFVnQxUHlhUVdNNVZ2bks3?=
 =?utf-8?B?cE9lSXdTL0Y1Zmd2UUxVay9TSDFGeHBaVDBlNnVhdGFjVk9iVVFKUHlxS0hH?=
 =?utf-8?B?dmdqMlVjbjA0ajFWQTVXcXpHMmQ2TFJzYmZHL1JGNjFiWXNHbTVXMHNrVFly?=
 =?utf-8?B?TUlkbStOWW4vRkZwdGk4SUFjVVZvOHRwN3hZNFQvVitWenhGbFNsTWNNNjAr?=
 =?utf-8?B?aGNsT2E5VitOSVlwNU55WDhLOEdMUmFVUXdPdlU2NHBSSld2dkI4d3MxNzFV?=
 =?utf-8?B?NGJCV0ZoZXF0TE13NXhxdUN0TUY2cFJWR1pDM3hZZHZ3ejB0SlgvSzVFNHMw?=
 =?utf-8?B?RUkxRFlSMWlRbis3Nk1udW5ERWdHSVhaejh6ejg0NXdFT1dKRVRsWEFham9S?=
 =?utf-8?B?SEExVWNjZVZWV0VDcFNibVMzL0M1aW1sN0l2Z2FaSjdtU3AzZHV4WFFwRjBB?=
 =?utf-8?B?U3psZkpEOWRQTWhYMEE2cUY2cWdTYWs3M2kxb1AxNTRCR2FXaXM0Sm5xQmw3?=
 =?utf-8?B?MFV4R091eUx4WWMvUFY2ZXhBSTBmbFlLejBRSWp4NHdFcitNR09kbng4Zll0?=
 =?utf-8?B?TWxIYzN3b3FINEhrYWlhZG94UnZySllXV2YzeDVJeTgzdk5MUEVWNHAyY09I?=
 =?utf-8?B?Y1J4Ri9HRTNlZmRuSUR3T1EvL1R3V2ZndzZPeTFmdEtaNUk2WGRPbWR0UmJy?=
 =?utf-8?B?Z0pCN2lQaHpwR1crbGUyT2Q5WDA0NU9UVEtQRlIvMmRBMWJXZlpwT3FJV2tk?=
 =?utf-8?B?dFZ5NmhoQ3owcjd6UHpDZ2gxSzkyUDdpVlF0QURBOHN6dGlNYVNwQWlSVUdT?=
 =?utf-8?B?OE10TnZuTjJCWjRJQlRJQUVEK0V1aUwyUTZrYXg2WXM3cFA4VFZ0WkhKaWU4?=
 =?utf-8?B?QnphZEE3NUN1WUQzSjNHWXRGU1dYcUM5RDgzTE4zTFl2dzBOS2FCS2pQU282?=
 =?utf-8?B?Qk82bHlqbkx2QUNTUEVOS2hJNElOZ3hDa3lQeDBnWEdyYzBjd0VUdmpUUWEz?=
 =?utf-8?B?U2lUb290NlNsWU5UQVZjcFc4ZEdLcTlyY0x6YS84dXdLYjV1bVJvcnFhVk9F?=
 =?utf-8?B?TTVRbkUzZXlXUjlvMFc2Zm1MMHJTYVl2UWFtYVYwTTc3V3FYWmR2cHlRWDJL?=
 =?utf-8?B?VE9DUHVtL3AxTHZXNkdYZmg2b1lzNHBrc3ZYbkQvajN0RTBZRzNSeHJKK0xw?=
 =?utf-8?Q?c+TM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c03585d-7c05-43cc-5f5a-08dc372cad05
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 00:40:20.0394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0b1afxBe6YQsTJ0Cyfpv4ft9vDGt5j+6NWH3JwjohYfSLepwSIKT8h0M0VC6H7oSHTQPN6RErr12iRnYDJxx1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9734

PiBTdWJqZWN0OiBSZTogcXVlc3Rpb24gYWJvdXQgdmlydGlvLXZzb2NrIG9uIHhlbg0KPiANCj4g
DQo+IA0KPiBPbiAyNi4wMi4yNCAwNTowOSwgUGVuZyBGYW4gd3JvdGU6DQo+ID4gSGkgT2xla3Nh
bmRyLA0KPiANCj4gSGVsbG8gUGVuZw0KPiANCj4gDQo+IFtzbmlwXQ0KPiANCj4gPj4NCj4gPj4g
ICAgIC4uLiBQZW5nLCB3ZSBoYXZlIHZob3N0LXZzb2NrIChhbmQgdmhvc3QtbmV0KSBYZW4gUG9D
LiBBbHRob3VnaA0KPiA+PiBpdCBpcyBub24tIHVwc3RyZWFtYWJsZSBpbiBpdHMgY3VycmVudCBz
aGFwZSAoYmFzZWQgb24gb2xkIExpbnV4DQo+ID4+IHZlcnNpb24sIHJlcXVpcmVzIHNvbWUgcmV3
b3JrIGFuZCBwcm9wZXIgaW50ZWdyYXRpb24sIG1vc3QgbGlrZWx5DQo+ID4+IHJlcXVpcmVzIGlu
dm9sdmluZyBRZW11IGFuZCBwcm90b2NvbCBjaGFuZ2VzIHRvIHBhc3MgYW4gYWRkaXRpb25hbA0K
PiA+PiBpbmZvIHRvIHZob3N0KSwgaXQgd29ya3Mgd2l0aCBMaW51eA0KPiA+PiB2NS4xMCArIHBh
dGNoZWQgUWVtdSB2Ny4wLCBzbyB5b3UgY2FuIHJlZmVyIHRvIHRoZSBZb2N0byBtZXRhIGxheWVy
DQo+ID4+IHdoaWNoIGNvbnRhaW5zIGtlcm5lbCBwYXRjaGVzIGZvciB0aGUgZGV0YWlscyBbMV0u
DQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBwb2ludGVyLCBJIGFtIHJlYWRpbmcgdGhlIGNvZGUu
DQo+ID4NCj4gPj4NCj4gPj4gSW4gYSBudXRzaGVsbCwgYmVmb3JlIGFjY2Vzc2luZyB0aGUgZ3Vl
c3QgZGF0YSB0aGUgaG9zdCBtb2R1bGUgbmVlZHMNCj4gPj4gdG8gbWFwIGRlc2NyaXB0b3JzIGlu
IHZpcnRpbyByaW5ncyB3aGljaCBjb250YWluIGVpdGhlciBndWVzdCBncmFudA0KPiA+PiBiYXNl
ZCBETUEgYWRkcmVzc2VzIChieSB1c2luZyBYZW4gZ3JhbnQgbWFwcGluZ3MpIG9yIGd1ZXN0DQo+
ID4+IHBzZXVkby1waHlzaWNhbCBhZGRyZXNzZXMgKGJ5IHVzaW5nIFhlbiBmb3JlaWduIG1hcHBp
bmdzKS4gQWZ0ZXINCj4gPj4gYWNjZXNzaW5nIHRoZSBndWVzdCBkYXRhIHRoZSBob3N0IG1vZHVs
ZSBuZWVkcyB0byB1bm1hcCB0aGVtLg0KPiA+DQo+ID4gT2ssIEkgdGhvdWdodCAgdGhlIGN1cnJl
bnQgeGVuIHZpcnRpbyBjb2RlIGFscmVhZHkgbWFwIGV2ZXJ5IHJlYWR5Lg0KPiA+DQo+IA0KPiBJ
dCBkb2VzLCBhcyB5b3Ugc2FpZCB0aGUgdmlydGlvLWJsay1wY2kgd29ya2VkIGluIHlvdXIgZW52
aXJvbm1lbnQuIEJ1dA0KPiB2aG9zdCgtdnNvY2spIGlzIGEgc3BlY2lhbCBjYXNlLCB1bmxpa2Ug
Zm9yIHZpcnRpby1ibGstcGNpIHdoZXJlIHRoZSB3aG9sZQ0KPiBiYWNrZW5kIHJlc2lkZXMgaW4g
UWVtdSwgaGVyZSB3ZSBoYXZlIGEgc3BsaXQgbW9kZWwuIEFzIEkgdW5kZXJzdGFuZCB0aGUNCj4g
UWVtdSBwZXJmb3JtcyBvbmx5IGluaXRpYWwgc2V0dXAvY29uZmlndXJhdGlvbiB0aGVuIG9mZmxv
YWRzIHRoZSBJL08NCj4gcHJvY2Vzc2luZyB0byBhIHNlcGFyYXRlIGVudGl0eSB3aGljaCBpcyB0
aGUgTGludXggbW9kdWxlIGluIHRoYXQgcGFydGljdWxhcg0KPiBjYXNlLg0KDQpUaGFua3MgZm9y
IHNoYXJpbmcgbWUgdGhlIGluZm9ybWF0aW9uLiBJIG5lZWQgdG8gbGVhcm4gbW9yZSBzdHVmZjop
DQoNClRoYW5rcywNClBlbmcuDQo=

