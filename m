Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3950E474209
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 13:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246661.425386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6Zy-0005ZQ-N8; Tue, 14 Dec 2021 12:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246661.425386; Tue, 14 Dec 2021 12:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx6Zy-0005X5-Jd; Tue, 14 Dec 2021 12:06:46 +0000
Received: by outflank-mailman (input) for mailman id 246661;
 Tue, 14 Dec 2021 12:06:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWHN=Q7=renesas.com=yoshihiro.shimoda.uh@srs-se1.protection.inumbo.net>)
 id 1mx6Zw-0003Iz-V5
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 12:06:45 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20723.outbound.protection.outlook.com
 [2a01:111:f403:700c::723])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4cc0f9a9-5cd6-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 13:06:44 +0100 (CET)
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3436.jpnprd01.prod.outlook.com (2603:1096:404:d7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Tue, 14 Dec
 2021 12:06:41 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::b0dd:ed1e:5cfc:f408%3]) with mapi id 15.20.4778.018; Tue, 14 Dec 2021
 12:06:41 +0000
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
X-Inumbo-ID: 4cc0f9a9-5cd6-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nMKwrQMcZWpYGtU3QfzqYxGUlnNK1BYK7v0g+NFOsdHtbn9SxdX9n7xS7J13P7jWifukKU4BCnIsPqkBNOvJ/9mp+dEHtwaR+ppI3PNdtbjTbi5cAOulm9Ecr0Zxc3cVu6CXhpc/of2qN+bDD4gkaM4rYrmIUKO8jJgC4EyWolh2PNssRr13KGTK3EPYqGoGy9T8aVEG3JVMFbIj4Zgjdt6WtV+7lGH5givNIasS0AQZeqbcdN9H65ikbUDGHvifJOCjdTn+mDm/quUKLJvToHOLNcfQbVDrRe7fogr8Qpx/RL+pYcjWGqa5xa95WS72W8oaRrMGbX3RYcTPHze1Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3W5IVQyfR/x1Llh/Gab+PDEOaMjzQAq4z29MrhmMMvs=;
 b=AhqLfxQ7s4oG6xUrrCq1AG7lR2IJxcTVLa1ee/RfcLhwNccB37zaOtJPu3W4Xkx4V3pKKrLWl6bAEJ0Vw1oCjsYGMNW3SromSoRXb31gRaHCLs7D2GnxlqkL167ri0q3vaOyM6UiSl0JkXeExEM2pzeC8DA/Yoz4adwlFAwBlNI/t5Jpk7wckzGJYfwM8IjJlOmmxAp9ozRYV2GgyxIA7AwY3U5cQAqRAO35QfJcIuNf1bgSHg7UH10cdjcF391sUwSeCTF7aLiZdQUArsKfBIi33kLQxKFvcULvsq/A2G9GjSiSUUD61/c+8kKhWP/hOOvx+Q6cFCZx+zB6vIgxNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3W5IVQyfR/x1Llh/Gab+PDEOaMjzQAq4z29MrhmMMvs=;
 b=asITbfTo/Ii4Evet3kzVhSn4eFGkmW6KhNG09eIHc2U0ynLXQo62VGTAo6A9bdkASfI+yYq14kFq4XQq6uDE5b2bVm+MbsPGHKLVhJUljoXN6LpjjQWpEmEQ/78XFzEqRC3L5TDLRguCy5xAgjXAtmKl8stUIcKGru9W/mqXiXc=
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>
Subject: RE: [PATCH 05/10] iommu/ipmmu-vmsa: Calculate context registers'
 offset instead of a macro
Thread-Topic: [PATCH 05/10] iommu/ipmmu-vmsa: Calculate context registers'
 offset instead of a macro
Thread-Index: AQHX47d6LazdN1mBlEi6ZMYdv27fAawx+SqA
Date: Tue, 14 Dec 2021 12:06:41 +0000
Message-ID:
 <TY2PR01MB369220015BE41FEB9CAC24B8D8759@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <1638035505-16931-1-git-send-email-olekstysh@gmail.com>
 <1638035505-16931-6-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1638035505-16931-6-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bd7b52ee-c005-476a-4564-08d9befa3073
x-ms-traffictypediagnostic: TY2PR01MB3436:EE_
x-microsoft-antispam-prvs:
 <TY2PR01MB34365A853ACCCC6DA2E3F8ADD8759@TY2PR01MB3436.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 FdLmc8y+mldlBL6ykmKuSY3SQ44tS0Ut9J7LjYIRYlJw2CYqxJsfA/vU9jX5BTGz5gXDOsDa/PnaV6pxCn+DzwVHi+pl2yy5+uy9525I1GknCcfPE4w/zxLDwVtugTBXr8vN2SW4Uh7miqL28hp3n3qzmrf6duc3oEk7azlvTARCZUBmD1zj/u8tTqa/n1KZgeYrCtwM87/O/yk/FP6GxO1ITDZlpymUrQN4Kvsy3WGZwho1M9Ox9n/bju5E1NDvozw24OnouKrxOE40vhPC+06o9KE4Kec81xWAa6C1WacaM4xppuCzw3Rdo1lMKqHX8LVFBFg8r02GdUhgI1vaY4d7Nf0hLl/S8DizPjIe+nTrR0QfYcEpadSZTxwNyFcX7w3HGkLSjONhZdRKUDYgMXf68VWqWW/YNQLtCBOiQpEQ6PvknVQVbi33maLz/MSxGqE/YbtpzZTe4SsEINA8T5FNUyWo9VnDJkbWfs308xFSzot3yho9rY/1jPEGxxWYcmIHHU2pQ9glbTU/z55vyz7VIHj205ySMv/kJAdAtv5nPZQiFadrYJV8CYhOMwrn3JKS5tQNstMV4J5fx3u5tafJC9aTrkZHYURcqQNSRjz/ABr6c3BwZQmkY3gteYAPpUDGQ3RSwKR+LJJi1LrjZg2wx601RHfxFbK4X0ia2G+dBMw83tLffRSO2XwYJX55X8tavz1SwdS6kH1hi3BswQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(66574015)(54906003)(83380400001)(110136005)(6506007)(38100700002)(508600001)(186003)(8676002)(5660300002)(55016003)(64756008)(71200400001)(66476007)(66556008)(66946007)(38070700005)(76116006)(66446008)(122000001)(52536014)(4326008)(86362001)(7696005)(2906002)(8936002)(33656002)(26005)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Rng2UmkxSGl0U3V1OE5DaUlmRTcrN2NQamQrYmhla2JnL09IWi9rd290VHlD?=
 =?utf-8?B?NklpQTVydEQ3YUVTczdTYnE4U2tta2t2TG5DWTI1TzQ2THVqaUVQbnFDUWt5?=
 =?utf-8?B?dkJuNHQ4ZUtXR0Z6bUxFc251VFlZM284S1Rpajdxam04QnZmOXJtUjZPM1p6?=
 =?utf-8?B?RzF1dXZySTRObmhucXo2aFRLSWk5T05sQXlrNTErOVNNVi92dmdpYmNpRVRT?=
 =?utf-8?B?QVVpVHpvaWEyVjJhSGJ2dzNFMHpQWGw0Wld5K016VjdVRFlrYzFtWmpTQ1kv?=
 =?utf-8?B?U1FBdEdZUjVYMlZ2TkFTRDQ4UVpiUU5ockJMOW41bWhCa0hXYm0xeDN0NTJU?=
 =?utf-8?B?aENQWnhBZ28rNHhCdkFpYmU0OTNWOHkrN0J1WmJXcWVEenAwcWhWdFlMYkdT?=
 =?utf-8?B?V2JqWXBJVkRYTm5hL3k3OUJLUlEvbWNOMkFoZno2YUhzUmdYNVdIbSt0NEo4?=
 =?utf-8?B?VGw2WFByVTB6V0ZLVHJxekRzcERKS0JqWEd2Q3hHemE4aHZhR3Z6VWZwbTZl?=
 =?utf-8?B?NzhBWTY0Uk1UWHQzekZVS0tIeTl5QVlUdy9iS2J6dm5wa0NwMDVYVHltK3JO?=
 =?utf-8?B?ZjJWaEk5NWIzTnZBZUt1bVlKQVVQbGR5RmdZaUZreFJ5VTcxb21WbW9VR05W?=
 =?utf-8?B?ZktNdXZiNllrV2ZVaEFQeENnR0MxenFMa2d3YW1oa1lWL1BuemtkVU90Y2hW?=
 =?utf-8?B?OXhyd3RzdnFCMjB5WTAvam0wdmtHYnVhN05aTUpPTWdTdm1jV0VGLzMwelQ4?=
 =?utf-8?B?aWtWbHFiQUx1TjZDUzNnRUlsbmpsNEJjb2Z5S1FBVVdKOHMwaloyMm5SVHhN?=
 =?utf-8?B?cUpSOWdOVWJHYmxmRWZsSFRLdjFEaEN1dC9zQXJoSW5PWnNjV2JmTVBPVmw0?=
 =?utf-8?B?Z3dvYmEzRnU2bGVIdU05WmJoSTFZc1NlWWVlbHFid3c4QlcwY1pJcnNldU44?=
 =?utf-8?B?NjRPZmZ1a2oxOGRlMlcya3RiaXRpMFJIQnVkZnV0UHR5N3A2eEpyWGFZS1ph?=
 =?utf-8?B?OWE1WFgzeDNWVEk0N0RYR25STXJvLzF1Slk0M3NWNGNQRERHOFByeTZySkp4?=
 =?utf-8?B?eHZlREozUkF6Tm14Q21KcDNUdWRBMys0clJpUW04emltc2w2Yyt2bGRybnEx?=
 =?utf-8?B?ekh4Tm4raXFBK240UEVLUG5rN2RaMlc1ckQ1Vi9RbXJIdHNiRzZzRkRhblEy?=
 =?utf-8?B?WGRRWXYwZCt0eVVmeDIvRjNreWdXd09vVkxvbS9USDB6RDZyQmNrMlljWWJu?=
 =?utf-8?B?RjJUM1UxRC9LeWUwbUxyelNqOUVlbTRmUkpDQkJDSDVpb3BaZ3JQbVRaalhR?=
 =?utf-8?B?YmlkRStlSUZjMFhoZGxmMWxhaStGZVBKYTcvZXZpakdiZ0h5THRtZFc5SHVh?=
 =?utf-8?B?SVJDMlhEWFRKTzhCTVI4bzhjaUNYalRhd1lKcG9zOU5PajZWOTlSdUtXeFVJ?=
 =?utf-8?B?dFFNL2NuNTE4OE9HZTlXMXlIcDB0QnZ6L3ZqZDhLamlqY0NLVnltUDFqLzF6?=
 =?utf-8?B?WExEVXI3YmMzdDBVS1hWZmt5RUYyV0ZsRVlyZ1QyRGlKMUt3S2pwSWxqOUVo?=
 =?utf-8?B?Z1lPS2c2UjJWMmZKNGY2eVVualpISFc3WmJReUJMc0l5THpxMjI1ZmVmUTRD?=
 =?utf-8?B?dkMwWmZTc3R2RTBYV29GcFl6TFRoZmNXd3NNeENiWk1FYXo3Y29XR0V6K3pa?=
 =?utf-8?B?bDFPREIwQWpvUWU1RW16SERKMmNPY1h6aER3eEZFQ2hSZFdIdEg5aUQxalJr?=
 =?utf-8?B?VnBVSW8yMXB3MFpyWkFrcStVVzlITE5yTVB5aTQvSHF5eHd3RkxsWnZGYlR2?=
 =?utf-8?B?cVJkcll5NFVvUUxuWkdOOElTREhzY0QycmdBb2Q5Q3RuMXQrUktHdEpIMGhH?=
 =?utf-8?B?SEpIRnFWNXpiNXdHdjFpTUJOTGx2VElwVXZjOWNPeVVBT0pCOVBwc1dmYVFP?=
 =?utf-8?B?b1dqMWEzcXZmdE1hYVU0VVJJS3FISWp4cmc2TEVzR2t6VEVEakFPemhxZnFR?=
 =?utf-8?B?WjhtRjZadm42eVo1VkpHMHNLaWQxQ1Blb2Q5czZkai9mSGtqYnlxMklyTGRO?=
 =?utf-8?B?WnVXRXh5Wi93NjQ5TU9EM0ZKZHZtZ3Rvci9zM0UwVXpWbi9hV2FXMnpsM3Nu?=
 =?utf-8?B?QlNFbmgxRlJ5VGZHZkJpOGNlWXRZenQ4YXl0L21Xdk9reDBMaldxeXl4RTdj?=
 =?utf-8?B?S2ROZVI4dkNkZVJDNVpPTjdKYi9nWTh3MnJxYzJWTnNJQm5EbEMzdzhFSGU1?=
 =?utf-8?B?TDdHWmNxaFAyVE56M2UzSXB3bzBReHRkT1FSTHhiQ2pjR014WHpkVHo0MC82?=
 =?utf-8?B?VjlGUnFlYWFnUTZwVEk2MDQwQlBwZCtNSENxcW5TdmF5OUhlYi9mUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7b52ee-c005-476a-4564-08d9befa3073
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2021 12:06:41.2478
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CvopMt6+L+B6nZf/AMjGCGgx7TexZiBJrHLx1gXun5qDcHUwud1DgEXGnbgHyoRhTCafUQq/WGGOJn4E1Kc3fwyuYqiAkUl20cZmPuPFLYAeRUZTi8+Q5Ufdj8kTwZwq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3436

SGVsbG8gT2xla3NhbmRyLXNhbiwNCg0KPiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbywgU2Vu
dDogU3VuZGF5LCBOb3ZlbWJlciAyOCwgMjAyMSAyOjUyIEFNDQo+IA0KPiBGcm9tOiBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+IA0KPiBUaGlz
IGlzIGEgbm9uLXZlcmJhdGltIHBvcnQgb2YgY29ycmVzcG9uZGluZyBMaW51eCB1cHN0ZWFtIGNv
bW1pdDoNCj4gM2RjMjhkOWY1OWVhYWU0MTQ2MTU0MmIyN2FmZTcwMzM5MzQ3ZWJiMw0KPiANCj4g
T3JpZ2luYWwgY29tbWl0IG1lc3NhZ2U6DQo+ICBjb21taXQgM2RjMjhkOWY1OWVhYWU0MTQ2MTU0
MmIyN2FmZTcwMzM5MzQ3ZWJiMw0KPiAgQXV0aG9yOiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9zaGlo
aXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ICBEYXRlOiAgIFdlZCBOb3YgNiAxMTozNTo0
OCAyMDE5ICswOTAwDQo+IA0KPiAgIGlvbW11L2lwbW11LXZtc2E6IENhbGN1bGF0ZSBjb250ZXh0
IHJlZ2lzdGVycycgb2Zmc2V0IGluc3RlYWQgb2YgYSBtYWNybw0KPiANCj4gICBTaW5jZSB3ZSB3
aWxsIGhhdmUgY2hhbmdlZCBtZW1vcnkgbWFwcGluZyBvZiB0aGUgSVBNTVUgaW4gdGhlIGZ1dHVy
ZSwNCj4gICB0aGlzIHBhdGNoIHVzZXMgaXBtbXVfZmVhdHVyZXMgdmFsdWVzIGluc3RlYWQgb2Yg
YSBtYWNybyB0bw0KPiAgIGNhbGN1bGF0ZSBjb250ZXh0IHJlZ2lzdGVycyBvZmZzZXQuIE5vIGJl
aGF2aW9yIGNoYW5nZS4NCj4gDQo+ICAgU2lnbmVkLW9mZi1ieTogWW9zaGloaXJvIFNoaW1vZGEg
PHlvc2hpaGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KPiAgIFJldmlld2VkLWJ5OiBHZWVy
dCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiAgIFJldmlld2VkLWJ5
OiBOaWtsYXMgU8O2ZGVybHVuZCA8bmlrbGFzLnNvZGVybHVuZCtyZW5lc2FzQHJhZ25hdGVjaC5z
ZT4NCj4gICBTaWduZWQtb2ZmLWJ5OiBKb2VyZyBSb2VkZWwgPGpyb2VkZWxAc3VzZS5kZT4NCj4g
DQo+ICoqKioqKioqKioNCj4gDQo+IFRoaXMgaXMgYSBwcmVyZXEgd29yayBuZWVkZWQgdG8gYWRk
IHN1cHBvcnQgZm9yIFM0IHNlcmllcyBlYXNpbHkNCj4gaW4gdGhlIGZ1dHVyZS4NCj4gDQo+IEFs
bW9zdCB0aGUgc2FtZSBjaGFuZ2UgYXMgb3JpZ2luYWwgY29tbWl0IG1ha2VzLCBidXQgd2l0aG91
dCB1cGRhdGluZw0KPiBzdHJ1Y3QgaXBtbXVfZmVhdHVyZXNfZGVmYXVsdCB3aGljaCBYZW4gZHJp
dmVyIGRvZXNuJ3QgaGF2ZSAodGhlcmUgaXMNCj4gbm8gc3VwcG9ydCBvZiBvbGQgQXJtMzIgYmFz
ZWQgR2VuMiBTb0NzKS4NCj4gDQo+IE5vIGNoYW5nZSBpbiBiZWhhdmlvci4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFt
LmNvbT4NCg0KVGhhbmsgeW91IGZvciB0aGUgcGF0Y2ghDQoNClJldmlld2VkLWJ5OiBZb3NoaWhp
cm8gU2hpbW9kYSA8eW9zaGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQoNCkJlc3QgcmVn
YXJkcywNCllvc2hpaGlybyBTaGltb2RhDQoNCg==

