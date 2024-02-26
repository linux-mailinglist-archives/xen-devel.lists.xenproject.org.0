Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D4F8669E3
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 07:05:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685259.1065696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reU61-00055i-Th; Mon, 26 Feb 2024 06:04:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685259.1065696; Mon, 26 Feb 2024 06:04:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reU61-00052W-Pt; Mon, 26 Feb 2024 06:04:13 +0000
Received: by outflank-mailman (input) for mailman id 685259;
 Mon, 26 Feb 2024 06:04:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dckQ=KD=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1reU60-00052Q-0r
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 06:04:12 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9cb9d64-d46c-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 07:04:08 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by LV2PR12MB5917.namprd12.prod.outlook.com (2603:10b6:408:175::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 06:04:01 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::debf:178c:f5df:5efa%5]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 06:04:01 +0000
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
X-Inumbo-ID: d9cb9d64-d46c-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bBSrLIHo3R5UUwBkElMiUPVv1elX2nl8ALqF/lt1EZFEIEmAV6qRo/pbkUh/I+y7kiUlk1lzZK++XA/Oa/4QZEw1YihC/I4g7Vb03XhhJx8aveTPp8FI1Mlnq01reasF8TdlbcQ/LxY/8SDD8gn74j72tyS9rQcTSewxlC/RJNwH/Bd1wjsSZ9XJ7/w5La7GPSG2ZM9H9BFwdRpkHPPiPRS5VAaGsBQlQ1Do4NSyLASGr37AOrBop8eLIDiWTkkQbCjxGGL876tpe7xHXOUwUFsNj2aP2n3D7Z9w2TEBbGTlssSkVUe/Frv69bnMYafttnHxRj4gnAiS+AyxxLLpiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q1uDBRPAeRQ7Hl1rBOx0+UzHvS6fO69g6G8GdJbVNWs=;
 b=AKdHyI0S7zVpyYRt6KO4IyKo/MG93CUrarU1IIH0iLOig/gXxEAn/CWtY7oDcqRcCa73XL9E/SwscKhi9cX5eb1zRwIdBDBnhVyi+pyLAkOnrMWYIF1Z/RM+bbubydrChI1yuz4aaBqzsvPm0FGJ4BCMc398g0ekr4Rsd+dutfzEyFUiDxunKHLClxOOvNrSVYqS96DXaru9OUE5wlvNJyt/L5dt089QNoEvIkpNb2a1GLuF1/lpn7zgXS6r1YsWMeE/eN5adGOBQifbyKyZ8Kn33BAcSvG0WUTzXigAyVdFXcnwcrGBSODKIqmrqppjuXywBk53bh+eJR8TZMVYkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q1uDBRPAeRQ7Hl1rBOx0+UzHvS6fO69g6G8GdJbVNWs=;
 b=u6lD0LizyC5oGIYIGn0udNdDezlsIGOkCV+zZCAyVoC+UOBIT/TeIrsAoY7/BPN6N78Ncni+qlfbZyJpoDQ4AtHz7mMaTmhSbx/keG/LvvBiIDHdoaZguelcmw1vYrEoFc+Mwscw6dNKfLaQwl57sEj+i69R0wKwENlaX0XPfDQ=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, "Daniel P . Smith" <dpsmith@apertussolutions.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v5 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Thread-Topic: [RFC XEN PATCH v5 3/5] x86/pvh: Add PHYSDEVOP_setup_gsi for PVH
 dom0
Thread-Index: AQHaRR62LJvUheASc0e0D+dOwe/lNLEXWJqAgAWWDwA=
Date: Mon, 26 Feb 2024 06:04:01 +0000
Message-ID:
 <BL1PR12MB58498142AF67EB5CE27F72AEE75A2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240112061317.418658-1-Jiqian.Chen@amd.com>
 <20240112061317.418658-4-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2402221642530.754277@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2402221642530.754277@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: MN0PR12MB6150.namprd12.prod.outlook.com
 (15.20.7292.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|LV2PR12MB5917:EE_
x-ms-office365-filtering-correlation-id: 008e39a6-bbe2-402f-656d-08dc3690baa2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 nEknTQk3Xxi8YTQh13y6bjzD8CLeHgUvk+NqNifc3hXcsqNfsoTG+5fvMOTE5tiisG20GpITFjW3eIJ9qsc5nqeztY7hvJxXLKfMfvE+SJMpNOafodPoAUeMD2rHib+4cI75Eu/zKW4Hiyq9yRsznsF+V3P3i6QGN0SKFlAWUzmnk77rn0XepbpfrGKNrWk5ApUrffVtFxpbzub+fVaoRv1nlXMoFrUbW/a2VvxqcjOQTpN2+YbI/apOROJ5kEZGZn0H4Z/ENikj9hbVNtxOZdkCPIFPY4CGP4JbXsh5FL7/u2OEb+ckrSJEcQSxr18uIgPL8mrqE6D+7bYjp0gWBlzDBFDLRQ+hlO8chaiXh3McoV3GuHPeblbkk2TBbQTUV93xsZJrEUiV72UynqmA7056SBtpTVowpeScHOAT8aZQbv9cW5nkZVFCANMZgJXPotTkjkiZA1PdY6+R56avQneVOv5XR03CT3dIYiHNX0PGBGfk5Kg5o0UVcud9H9dSX7emAPjocj6JR2S/JYdl5xyhvuJPRLLkZxw93WnPOds/TN9jcK7sq8VWea8TGievipxvzVMHa/xH64VHd/oPo2YZ5jxWsixR5JZhHRjOUMZ4lUpbIl8jLMDa3+EXmL07YPVYCQDy331mCzlJ7/ms75BiA9TPCO0Kq2KsoL+tf3GijaCOC3jhEIZBoL/GW5jMAxoOSHOEUSbL26ORvnCvI/YSuHQwSdGoSA/Ea4Xc1sM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?S0MyVGNka1Y3dzNJSkpTS05iYVNFanJTVFk0bGl6akRmaU9lNTlZOWVxWXJG?=
 =?utf-8?B?Z2pMQWhSbmU1SWFaSVplZUhRMXRiOUtWMmJOc00raEtNdnprS052bUlnRkFF?=
 =?utf-8?B?Yjc3ak5ISzNiUnd0eEJtK3N3SGkwWWQ5bXdjREc1WldHVGgveVUvM0NQTUlz?=
 =?utf-8?B?aVNTNUJaWncxdUJzQVFjZ3pDTzRlWjBRU0NIRHNXRTR5OWpHSzZva3ZHUFRB?=
 =?utf-8?B?UDdLZUtYZjZGeGNDeHZsVTdhSmJpUUxZSVliaVc0Snlqb2lXUHMrZ2RBWjQ0?=
 =?utf-8?B?Zzg2K1Z1MjdZMnZmdFB4Nk11NHFGcFJLa1k3SkdWU3oxTjZhMVlJUWVFSm80?=
 =?utf-8?B?clFJT0M2dUFhcTJBSDVmazZxb0V5WmtkN2dqQk00UU1JUncvMUZObHNEamhY?=
 =?utf-8?B?bWJIN1YrS3VqWlArbGkxZUR3NFhtNzQvLzZoeCsyMXFHT3dOZ2hTOXRGZHg0?=
 =?utf-8?B?UzN6ZjYwMSsxLzk4cW5JbkZhN1gvVFU3NThHSWI4QTg5VmhBckMxa0RnbVdh?=
 =?utf-8?B?Vy9kZ1RkUEQybDBmMHFFaGprbHBoNUZVd0JTYXJJYVZ2MFVEalhOWCtLcmNm?=
 =?utf-8?B?d1g5clMxQjc4bUliZnlsSlhlS05Gd2FiWmlvUGFKWk9IbHhQdmtrVlhpVEVW?=
 =?utf-8?B?UUhhV3dJMGlMWDhJRTlSYTJXTWZ6bDdPaHlVcWxqcEVJQlNoMDU0OXlBZmN1?=
 =?utf-8?B?OUpIUjNVNml5RWgrTmZ2dStMeitPcHZuMlhHekNYSWpBemxZWGZydjZXV1Zm?=
 =?utf-8?B?QzExU0MrT2F6MGRHOHRBeVpiL2Z6NXBZaGlvN2tQZDFQTnRSUGdTZ3NMUEdm?=
 =?utf-8?B?TWlqVzJKejZUb3JJMURGNUdGbVZZbXFhSGhwN2cvR21RUmdnZG9jNm9PNitn?=
 =?utf-8?B?YWJ1WDQvanUwWEVHaVF4aE9YamNPSXZUc2JLdUlFM21NWS9SbDN3cFgxT055?=
 =?utf-8?B?c2QvTDVXVnZCTXBuR1VlMGJSWUdOUWRGTDN2M2c0cU0vMlk3dTkvd1RkVzI1?=
 =?utf-8?B?SndtNllJRklGTEhqQ3MraTFPVDkvWHBoMlJuVUV1ZmRxTC9QNkJsdmhURWpW?=
 =?utf-8?B?Mm1iVDRleHdOZTJCVENFVUZ5bFdoKzZQV3A5WTh5MTYzbzZ1Z2NTaEJ5VERW?=
 =?utf-8?B?dnZHNGFrUWRWdUNncWlkRy9TNDE4ZHYxOUhHUTl6ZHBWZk9iYWZOODBpUUx1?=
 =?utf-8?B?bDBPU2wyelhhRFUyYitTYm1QNkhkblVHdU1XR29uck9Tb3c2S0JwNXFXKzlq?=
 =?utf-8?B?YVppWk1YQVBTbElKTFhvZzlvNGxKY2Nvck1Kd1llak9keWE1U1Uzc2FIQ3Rz?=
 =?utf-8?B?cTQwSHVRVTBkNnRxVlR5dmJTT095czREb1VBTlpuTGJ1V20zdXRSUFp0ZmhL?=
 =?utf-8?B?cFN4L1RhRXFQaUhXTU5BZmRMZ1U1WUlMYmllU3ZpTXYyd1NiWlZScGFuSld6?=
 =?utf-8?B?VVVHd0pXNFBRSHlYL1dDdm1paGVXcUx1TkNYN3d2L1BudXNsSFNkdkE4UHJE?=
 =?utf-8?B?WnYzdi8xTlpRbDhaSVFzblp2OVJPK3BtRUx6MTY4WEowTTRPSnpra3NKNDJq?=
 =?utf-8?B?TUtHRTZlUnlNQUwrKzFEc2h0dmtNbkxLdDM2eGM0TjRBajVuWTMzUXFPK1B6?=
 =?utf-8?B?anZTMElQeTdWcVZSUVlrTG5ST0NlVkQvWk91KzhXMEZLZ2crczc2TWZpK20w?=
 =?utf-8?B?emFObjZDaDY1Qk85ZlV0a0ZoVUNPOEpWNXFsa2owUXY1UG5LUzJhRVNRWWhp?=
 =?utf-8?B?eEdDNXFaWDV6UTZQQXlqaTkxajJjc1lSMXNkWGxJY1ZtZmY4ZHhrQTFBNnVK?=
 =?utf-8?B?cTBNdWtRanVoNUlOV3JBbmgyeVd2b25MR1FnVFBSb3lmRi9tNXJydFVEcHVH?=
 =?utf-8?B?bFBmOFhmZUo0WW0zbU0yaXI3cGVjK2E1eG9Fa1MvekpVRFJEM2Z1d2Q5SXZU?=
 =?utf-8?B?U2xpSnY2NkExZXRwWkhENm45SitJWXJLdFVmVzdEbHE2VDQyVEpISEJ2MnJL?=
 =?utf-8?B?QWZWRHBVV2pJMzVlSkJrQXd6cEkrY0l1dE8xbmVlaGVRQitSMVF0a2NsUHAz?=
 =?utf-8?B?TG91UUdodGFBdWdxb0s3TlFEWFVGMGtoMTF2Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <900B64BC21E6E44693ADC0C7128D7816@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 008e39a6-bbe2-402f-656d-08dc3690baa2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 06:04:01.3922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EV0vYhUcyPT9+ZnMN3lMfzApd1iFesOrmXdoWoh+QxFYTU73vA6QCkWUUGMgi/qiINu13oVuB6volb4foAM/Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5917

DQpPbiAyMDI0LzIvMjMgMDg6NDQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gRnJp
LCAxMiBKYW4gMjAyNCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBPbiBQVkggZG9tMCwgdGhlIGdz
aXMgZG9uJ3QgZ2V0IHJlZ2lzdGVyZWQsIGJ1dA0KPj4gdGhlIGdzaSBvZiBhIHBhc3N0aHJvdWdo
IGRldmljZSBtdXN0IGJlIGNvbmZpZ3VyZWQgZm9yIGl0IHRvDQo+PiBiZSBhYmxlIHRvIGJlIG1h
cHBlZCBpbnRvIGEgaHZtIGRvbVUuDQo+PiBPbiBMaW51eCBrZXJuZWwgc2lkZSwgaXQgY2FsbGVz
IFBIWVNERVZPUF9zZXR1cF9nc2kgZm9yDQo+PiBwYXNzdGhyb3VnaCBkZXZpY2VzIHRvIHJlZ2lz
dGVyIGdzaSB3aGVuIGRvbTAgaXMgUFZILg0KPj4gU28sIGFkZCBQSFlTREVWT1Bfc2V0dXBfZ3Np
IGZvciBhYm92ZSBwdXJwb3NlLg0KPj4NCj4+IENvLWRldmVsb3BlZC1ieTogSHVhbmcgUnVpIDxy
YXkuaHVhbmdAYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVuIDxKaXFpYW4u
Q2hlbkBhbWQuY29tPg0KPj4gLS0tDQo+PiAgeGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwuYyB8
IDYgKysrKysrDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jIGIveGVuL2FyY2gveDg2L2h2
bS9oeXBlcmNhbGwuYw0KPj4gaW5kZXggNDkzOTk4YjQyZWM1Li40NmY1MWVlNDU5ZjYgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+PiArKysgYi94ZW4vYXJj
aC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+PiBAQCAtNzYsNiArNzYsMTIgQEAgbG9uZyBodm1fcGh5
c2Rldl9vcChpbnQgY21kLCBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHZvaWQpIGFyZykNCj4+ICAg
ICAgY2FzZSBQSFlTREVWT1BfdW5tYXBfcGlycToNCj4+ICAgICAgICAgIGJyZWFrOw0KPj4gIA0K
Pj4gKyAgICBjYXNlIFBIWVNERVZPUF9zZXR1cF9nc2k6DQo+PiArICAgICAgICBpZiAoICFpc19o
YXJkd2FyZV9kb21haW4oY3VycmQpICkNCj4+ICsgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNV
UFA7DQo+PiArICAgICAgICBBU1NFUlQoIWhhc19waXJxKGN1cnJkKSk7DQo+IA0KPiBEbyB3ZSBy
ZWFsbHkgbmVlZCB0aGlzIGFzc2VydD8gSSB1bmRlcnN0YW5kIHRoYXQgdGhlIHVzZSBjYXNlIHJp
Z2h0IG5vdw0KPiBpcyBmb3IgIWhhc19waXJxKGN1cnJkKSBidXQgaW4gZ2VuZXJhbCBpdCBkb2Vz
bid0IHNlZW0gdG8gbWUgdGhhdA0KPiBQSFlTREVWT1Bfc2V0dXBfZ3NpIGFuZCAhaGFzX3BpcnEg
c2hvdWxkIGJlIHRpZWQgdG9nZXRoZXIuDQpNYWtlIHNlbnNlLCB0aGFua3MgZm9yIGV4cGxhbmF0
aW9uLCBJIHdpbGwgZGVsZXRlIHRoaXMgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiBBc2lkZSBm
cm9tIHRoYXQsIGl0IGxvb2tzIGZpbmUuDQo+IA0KPiANCj4+ICsgICAgICAgIGJyZWFrOw0KPj4g
Kw0KPj4gICAgICBjYXNlIFBIWVNERVZPUF9lb2k6DQo+PiAgICAgIGNhc2UgUEhZU0RFVk9QX2ly
cV9zdGF0dXNfcXVlcnk6DQo+PiAgICAgIGNhc2UgUEhZU0RFVk9QX2dldF9mcmVlX3BpcnE6DQo+
PiAtLSANCj4+IDIuMzQuMQ0KPj4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4N
Cg==

