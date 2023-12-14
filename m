Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 568F5812AD6
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 09:56:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654353.1021171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhVY-0000b4-LI; Thu, 14 Dec 2023 08:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654353.1021171; Thu, 14 Dec 2023 08:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDhVY-0000Y1-I5; Thu, 14 Dec 2023 08:55:52 +0000
Received: by outflank-mailman (input) for mailman id 654353;
 Thu, 14 Dec 2023 08:55:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+dVB=HZ=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rDhVX-0000Xt-JB
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 08:55:51 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9327ec49-9a5e-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 09:55:49 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM8PR12MB5447.namprd12.prod.outlook.com (2603:10b6:8:36::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.28; Thu, 14 Dec 2023 08:55:45 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7068.033; Thu, 14 Dec 2023
 08:55:45 +0000
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
X-Inumbo-ID: 9327ec49-9a5e-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlGCrKewGqPoY+1r8Q7L6W/Q7eIWjDnBiVae7n2FRns07XbjCpcFrM9dPxdeCp0lFsFa2351Q2lTGV+dKFnwEZpa05+TIyby7LTfqunKfrdQn5/3S9OJgY45JF0KZraIUMAXnBOZPJbYI+9Nm+/5U8qTEVwCNJoxLxddCnR3lFLOvpF8ISVENaj6rKYzp5prtDe+nk+RvDAApcbwYSVn6hc/NMxDEkOdFC2QHhL1a29BmgzAvRyVVkOdiHRRjpBBSGcmAJP9kjXcGj7BD2XJbO0uz2T9RWjLyoy490vTyGMAR+LfJb0yIxIQXx3dNMbyD+h4gFpE0FPdUVee8PzaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9RaFfcQpcZv1hJ14RTSBhp6n9Z8IEpv9O/reChr86M=;
 b=EoaJz5Pq6d8ZLcmv4uc+FWUo8bwNihAcqlYkURr9ZL1+KOPDF5kKjlmJjpOy2R5jzCveUSibiFuUSw3MUNXijQoObtnoFSKcX5iG5XuIAOAO9AzxDsZBlVV6ZHVZWfD0aSN3dtb4oA7oxODXZ4R0+o2qEPQNkXPdvysrxCnQ9j05LSZWlL+d7lLOxPhp2L+NmzqKtwKnGyekQh5gTj/88xXBuU0xJFErYUaNMPD/FSoaUvVICWnRO5iBUses9UztE13Fq+qKRJ+E8hf/FsFXC9oYg27t/h/0XTbwuoV1n4tLHjr7UtCYhAPPpQmt4isW1EzRuz8mTKnfvnhPlAxXtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9RaFfcQpcZv1hJ14RTSBhp6n9Z8IEpv9O/reChr86M=;
 b=jD8djG9SsBTb5BdpkwOb+jqhq3pNkmUNr7OMDm4ko9pNB290QhoCJsJBT/MJ7fn2wY9qTwtAzIibk8jXTZQt6pfq0hVsuqxp0pO2XAXLGt2/wqBQ1EbHdCPY5Z0AFrCZb4jQKrIl+g8saqRvQJ1MPa9GWM/UZabZRVPVTrSyCRw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Daniel P .
 Smith" <dpsmith@apertussolutions.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Thread-Topic: [RFC XEN PATCH v3 2/3] x86/pvh: Add (un)map_pirq and setup_gsi
 for PVH dom0
Thread-Index:
 AQHaK4ebBv/EWT+No0GAUR8lU4172LCkNzqAgAGFPID//6gjAIABpqIA///CiwCAAi33AA==
Date: Thu, 14 Dec 2023 08:55:45 +0000
Message-ID:
 <BL1PR12MB58494259A9E37CD7133090D9E78CA@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231210164009.1551147-1-Jiqian.Chen@amd.com>
 <20231210164009.1551147-3-Jiqian.Chen@amd.com> <ZXcrX44ceUjzjtDh@macbook>
 <BL1PR12MB5849B1BDCBECD73353413869E78EA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <704cc051-7362-4691-a120-4effaf8dd1fc@suse.com>
 <BL1PR12MB584993E317AF28E675814FC6E78DA@BL1PR12MB5849.namprd12.prod.outlook.com>
 <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
In-Reply-To: <917ef38b-5aec-4c6a-803c-c0b2dcc74454@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5364.namprd12.prod.outlook.com
 (15.20.7113.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM8PR12MB5447:EE_
x-ms-office365-filtering-correlation-id: adc9bbac-b258-4e1e-c78d-08dbfc827599
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 0YeQtzAHe4G2UnR1AB9rLZ0EqKaii7s/e21loAv5v3XrSKXvuMgBRWwbZ7x+arMbNGLR41PH6WbABOudDuVxpMGEnbIS5E5owH3Q7Hdr53hSK6ADA8Umg0xK27ap/m2vkM8w2xZvoSvOjqly7HSLGWmQA9W3U5XoMCGJ/shd2eZv69zx8JcEnLgHwzKR3PXRwrL29Dzbe7f0fSsagvBceIAbBMNJXBIVEpBNkTxfjni1fRXK8UvErNO5MxmBJndii6g9ZRZILbMAtJ8fO/rsoXFAz4OitXXNarZQpJTa3RCMfaFFCKdVN19N2fXUFpO1dtNY/RiC3uZzv/KMT9/cho3rWyKIo9sLufdf62uOE/vyD7PL2rnIBUiW0QM3wqnOSCkKx9wPH8+y/DN1p0taWI0FirFGLoYF9YOHXctjg0h3Rj9g04Tz9rUbviLtk2jxwy6AMDdhLQRnNhyILyVYYS9XJ+YNEZfKUffnEdW2HFbWVMTtUpDrJSp5r3NIwRfCoreqNyncxTtsTV/+HBNWHZIDpwOUHl35JtP7oVPduxpyHpzlEuhq4VttGarIZK6W+cs5FLyns5/r76TYUuy0/VxLsTIPaoGok5gwWwseJqMMyT/3X9CrS6uSHVUUMybI
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(396003)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(9686003)(122000001)(26005)(38100700002)(8676002)(8936002)(52536014)(4326008)(316002)(2906002)(5660300002)(71200400001)(478600001)(53546011)(6506007)(7696005)(41300700001)(6916009)(54906003)(64756008)(66446008)(66476007)(66946007)(66556008)(76116006)(38070700009)(33656002)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dURNck1RTEdCNGN5dzA0NGQ5OXFldmloZ25CaG91WUlGblR1NlI0S2FLQyto?=
 =?utf-8?B?MU5aZ0RtdVJVVDk3bkZvTkRyYlA0UTExekRwSHczbXhMV1pvRXFhcHQzR2hE?=
 =?utf-8?B?bFN6OVBxMG5vdHIxeHliSzNraEY5MklERUhSRlBGejQ0MGMxMVIyNlB3QlJn?=
 =?utf-8?B?NTlsY1lXaXRPWm5vV1FMV2hOS29xWk1xa1luU2MzalpGY1pSSzY1YU9UY2Fa?=
 =?utf-8?B?K09MSkhLN2tiU0s1aHJYdXJuNC8wT2xiT1k4bG9MbGZGTy9WbnJ6Yk5Hbnpz?=
 =?utf-8?B?TG9SNnUxT2dhQ3BzdVowUVVkd1F4aWl3TEJtaWhjTGFTRGZESHR3NTh6YklR?=
 =?utf-8?B?bXhIamg0MVVIUkRhR0gzaEpRMmtLRDRBY291UFRWVGk1bFZIaXh0QXB6d1hl?=
 =?utf-8?B?aWRqUEdTMklCWkhoMGY5M0VUeW1JZk04NmZmSWIrMHp1blUveG9mY3U1a0t0?=
 =?utf-8?B?VTV6eVVqa3NlcERGcndKYVNwUHV2RXp4TTlZeVVKS3pTR1lMTEF1c3N0c3p0?=
 =?utf-8?B?bnVWQmdrZ1M3dTlrc1RUMTdxWWVocFU5K2lnRmFydWUxVTZPa2ZzcWFJbG9y?=
 =?utf-8?B?cndtbmJEazBhY1hXK0h6RFpEM3YxWitUWjh1cHluR3FjdDB2bFYxQVoxNjV3?=
 =?utf-8?B?TndJZ3ppVFlVU3BYWlhWZjNoelRJUE43SkFDZTBZdXdybXRrRjlTV25JYXE2?=
 =?utf-8?B?a3hFSk9na2Z1U2pqT3F1SDZsdjlSZnNrL253aC9JVjB5ZlRhZDJ4SWdMOStV?=
 =?utf-8?B?UGNXZ2c5NkVSM3hyOHpKM3p4MEx6a3FjRS84cDRGeWlVa3NiM05acVFXdks3?=
 =?utf-8?B?dUt2Yi91NjM3OERlWkUwai9hRUhzdSsyWHk2L3RFejkrYTlqZkVpTmM2TWN2?=
 =?utf-8?B?RWRzWG8wazd6cHFnZHRYdGx2bjhHTXlrTjlMNnQwT0JQUmprZkNmSGk0Z1dY?=
 =?utf-8?B?ZGlaUnZaYVFhYjBWM0VncHdVMlh6RHpxSWxvUHFjWkMwM0pRMWlLK05JT2U0?=
 =?utf-8?B?Tmd3SnIxcEVZQ0pYRTFYL250THZqRVo1TWsxYmUwZFF4Q3J4T2ViK212Ykh5?=
 =?utf-8?B?OGF4ODJxTU9RREVHeXh5blNUZDFIeTEwaHFKbzlzY3FuelQ5dFBCN2VjNWF0?=
 =?utf-8?B?bklad1BKOU05Sm9TQW5ZZXdjNURRa0JhQzIwT01NQXFqY2liYWp2UFJWb3Vv?=
 =?utf-8?B?WkUyK3loUUpMVnBzdWNzRzgwZXBqaGFibExNakxFZjdSTU1CRnZUTDhkaVhm?=
 =?utf-8?B?aUErZmJOZzgrY2txVU56RGlZeEZYU2E2SG9iSUpOOVNpUnNhSWxTdU9HOE5h?=
 =?utf-8?B?QjRGQzlxV0haK1MzMUVwd1diNWhEVitsUnN4ZTZJcFN5bWNCVmhmMTFVZHZy?=
 =?utf-8?B?OHRuNS84b05EQi9HbjVDOXBCWk5BdlE0RTFSZ1Bvb25QU1RlQ1VzQ0I1ejNL?=
 =?utf-8?B?ZDR6SFUvRWF6eW5zS1c0QUQxbEdoNHFTY0NWWVllM25EaTFQb3lQZ0Vod0Zp?=
 =?utf-8?B?QmhMckRGQUpGYVFSNGlvdUwwN3lQODRwWVdZS1VBSlBMM2owTVV3VFIvb3lS?=
 =?utf-8?B?MWVaVXFuZFY3emJJNUk3dThJL3JmNXNsckw1TElISjRCRzJlNE8rS2JrWlM1?=
 =?utf-8?B?MTlLQktzYVQ5dWRxVWxVeXArcDdsdzZ2MCt5TkZDaUdBdElIQUtNVitKTG9x?=
 =?utf-8?B?MHl4T3lWYi9YbHNnK0NESVRuUlFuamd6V2o2S3JoNGNkUFdkWWN1ZGp4WGZV?=
 =?utf-8?B?cmt0K3NzaDlob3hiaEJneHRQc3dROUFZMDUzLzRMQ1hZZHdKUnBaUTlSYklQ?=
 =?utf-8?B?TlJ5clJHQ1RZYm5JUjI4NUl5MVpBWG14dmlmWG4zK3FlU05ZbkQvYzcvTlRB?=
 =?utf-8?B?Q3lrcmhvTWhsSVYrOW9xTTgzN1ExWVpPbVYvWjduTlh1N2ZrQ2xSWS9MVUEr?=
 =?utf-8?B?ZlI1ZFBPQTNTVHZrRXFaT0lINnNwNCtMMitsQXdYTUVlSk1KNzAwTU9La05D?=
 =?utf-8?B?eHNxcXUwQy9zTlpZZ0MzK0lLR2ZIMFY1R3ZTSTdEUGxGbEFGN21Qc3lRK201?=
 =?utf-8?B?VWtGeDRKK2xhRUh5T3NrOFh6dEpmUHM0NklyTCtCWjBLRlZNTHVwVkl4c0pa?=
 =?utf-8?Q?pYX4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A42ED27F6895F342ACE27229990F4EEB@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adc9bbac-b258-4e1e-c78d-08dbfc827599
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Dec 2023 08:55:45.1655
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8+csyqVDvsl1HLmNeCBmeJANMDNjxQ9lec639s6PonpjoyBI7pIT9xSKFVdFdi4Vbsy312NMWFSKzRa5vj1IJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5447

T24gMjAyMy8xMi8xMyAxNTowMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDEzLjEyLjIwMjMg
MDM6NDcsIENoZW4sIEppcWlhbiB3cm90ZToNCj4+IE9uIDIwMjMvMTIvMTIgMTc6MzAsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDEyLjEyLjIwMjMgMDc6NDksIENoZW4sIEppcWlhbiB3cm90
ZToNCj4+Pj4gT24gMjAyMy8xMi8xMSAyMzozMSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+
Pj4+IE9uIE1vbiwgRGVjIDExLCAyMDIzIGF0IDEyOjQwOjA4QU0gKzA4MDAsIEppcWlhbiBDaGVu
IHdyb3RlOg0KPj4+Pj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+Pj4+
PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+Pj4+Pj4gQEAgLTcyLDggKzcy
LDExIEBAIGxvbmcgaHZtX3BoeXNkZXZfb3AoaW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh2b2lkKSBhcmcpDQo+Pj4+Pj4gIA0KPj4+Pj4+ICAgICAgc3dpdGNoICggY21kICkNCj4+Pj4+
PiAgICAgIHsNCj4+Pj4+PiArICAgIGNhc2UgUEhZU0RFVk9QX3NldHVwX2dzaToNCj4+Pj4+DQo+
Pj4+PiBJIHRoaW5rIGdpdmVuIHRoZSBuZXcgYXBwcm9hY2ggb24gdGhlIExpbnV4IHNpZGUgcGF0
Y2hlcywgd2hlcmUNCj4+Pj4+IHBjaWJhY2sgd2lsbCBjb25maWd1cmUgdGhlIGludGVycnVwdCwg
dGhlcmUncyBubyBuZWVkIHRvIGV4cG9zZQ0KPj4+Pj4gc2V0dXBfZ3NpIGFueW1vcmU/DQo+Pj4+
IFRoZSBsYXRlc3QgcGF0Y2godGhlIHNlY29uZCBwYXRjaCBvZiB2MyBvbiBrZXJuZWwgc2lkZSkg
ZG9lcyBzZXR1cF9nc2kgYW5kIG1hcF9waXJxIGZvciBwYXNzdGhyb3VnaCBkZXZpY2UgaW4gcGNp
YmFjaywgc28gd2UgbmVlZCB0aGlzIGFuZCBiZWxvdy4NCj4+Pj4NCj4+Pj4+DQo+Pj4+Pj4gICAg
ICBjYXNlIFBIWVNERVZPUF9tYXBfcGlycToNCj4+Pj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX3Vu
bWFwX3BpcnE6DQo+Pj4+Pj4gKyAgICAgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oY3VycmQp
ICkNCj4+Pj4+PiArICAgICAgICAgICAgYnJlYWs7DQo+Pj4+Pg0KPj4+Pj4gQWxzbyBKYW4gYWxy
ZWFkeSBwb2ludGVkIHRoaXMgb3V0IGluIHYyOiB0aGlzIGh5cGVyY2FsbCBuZWVkcyB0byBiZQ0K
Pj4+Pj4gbGltaXRlZCBzbyBhIFBWSCBkb20wIGNhbm5vdCBleGVjdXRlIGl0IGFnYWluc3QgaXRz
ZWxmLiAgSU9XOiByZWZ1c2UNCj4+Pj4+IHRoZSBoeXBlcmNhbGwgaWYgRE9NSURfU0VMRiBvciB0
aGUgcGFzc2VkIGRvbWlkIG1hdGNoZXMgdGhlIGN1cnJlbnQNCj4+Pj4+IGRvbWFpbiBkb21pZC4N
Cj4+Pj4gWWVzLCBJIHJlbWVtYmVyIEphbidzIHN1Z2dlc3Rpb24sIGJ1dCBzaW5jZSB0aGUgbGF0
ZXN0IHBhdGNoKHRoZSBzZWNvbmQgcGF0Y2ggb2YgdjMgb24ga2VybmVsIHNpZGUpIGhhcyBjaGFu
Z2UgdGhlIGltcGxlbWVudGF0aW9uLCBpdCBkb2VzIHNldHVwX2dzaSBhbmQgbWFwX3BpcnEgZm9y
IGRvbTAgaXRzZWxmLCBzbyBJIGRpZG4ndCBhZGQgdGhlIERPTUlEX1NFTEYgY2hlY2suDQo+Pj4N
Cj4+PiBBbmQgd2h5IGV4YWN0bHkgd291bGQgaXQgZG8gc3BlY2lmaWNhbGx5IHRoZSBtYXBfcGly
cT8gKEV2ZW4gdGhlIHNldHVwX2dzaQ0KPj4+IGxvb2tzIHF1ZXN0aW9uYWJsZSB0byBtZSwgYnV0
IHRoZXJlIG1pZ2h0IGJlIHJlYXNvbnMgdGhlcmUuKQ0KPj4gTWFwX3BpcnEgaXMgdG8gc29sdmUg
dGhlIGNoZWNrIGZhaWx1cmUgcHJvYmxlbS4gKHBjaV9hZGRfZG1fZG9uZS0+IHhjX2RvbWFpbl9p
cnFfcGVybWlzc2lvbi0+IFhFTl9ET01DVExfaXJxX3Blcm1pc3Npb24tPiBwaXJxX2FjY2Vzc19w
ZXJtaXR0ZWQtPmRvbWFpbl9waXJxX3RvX2lycS0+cmV0dXJuIGlycSBpcyAwKQ0KPj4gU2V0dXBf
Z3NpIGlzIGJlY2F1c2UgdGhlIGdzaSBpcyBuZXZlciBiZSB1bm1hc2tlZCwgc28gdGhlIGdzaSBp
cyBuZXZlciBiZSByZWdpc3RlcmVkKCB2aW9hcGljX2h3ZG9tX21hcF9nc2ktPiBtcF9yZWdpc3Rl
cl9nc2kgaXMgbmV2ZXIgYmUgY2FsbGVkKS4NCj4gDQo+IEFuZCBpdCB3YXMgcHJldmlvdXNseSBt
YWRlIHByZXR0eSBjbGVhciBieSBSb2dlciwgSSB0aGluaywgdGhhdCBkb2luZyBhICJtYXAiDQo+
IGp1c3QgZm9yIHRoZSBwdXJwb3NlIG9mIGdyYW50aW5nIHBlcm1pc3Npb24gaXMsIHdlbGwsIGF0
IGJlc3QgYSB0ZW1wb3JhcnkNCj4gd29ya2Fyb3VuZCBpbiB0aGUgZWFybHkgZGV2ZWxvcG1lbnQg
cGhhc2UuIElmIHRoZXJlJ3MgcHJlc2VudGx5IG5vIGh5cGVyY2FsbA0KPiB0byBfb25seV8gZ3Jh
bnQgcGVybWlzc2lvbiB0byBJUlEsIHdlIG5lZWQgdG8gYWRkIG9uZS4NCkNvdWxkIHlvdSBwbGVh
c2UgZGVzY3JpYmUgaXQgaW4gZGV0YWlsPyBEbyB5b3UgbWVhbiB0byBhZGQgYSBuZXcgaHlwZXJj
YWxsIHRvIGdyYW50IGlycSBhY2Nlc3MgZm9yIGRvbTAgb3IgZG9tVT8NCkl0IHNlZW1zIFhFTl9E
T01DVExfaXJxX3Blcm1pc3Npb24gaXMgdGhlIGh5cGVyY2FsbCB0byBncmFudCBpcnEgYWNjZXNz
IGZyb20gZG9tMCB0byBkb21VKHNlZSBYRU5fRE9NQ1RMX2lycV9wZXJtaXNzaW9uLT4gaXJxX3Bl
cm1pdF9hY2Nlc3MpLiBUaGVyZSBpcyBubyBuZWVkIHRvIGFkZCBoeXBlcmNhbGwgdG8gZ3JhbnQg
aXJxIGFjY2Vzcy4NCldlIGZhaWxlZCBoZXJlIChYRU5fRE9NQ1RMX2lycV9wZXJtaXNzaW9uLT4g
cGlycV9hY2Nlc3NfcGVybWl0dGVkLT5kb21haW5fcGlycV90b19pcnEtPnJldHVybiBpcnEgaXMg
MCkgaXMgYmVjYXVzZSB0aGUgUFZIIGRvbTAgZGlkbid0IHVzZSBQSVJRLCBzbyB3ZSBjYW4ndCBn
ZXQgaXJxIGZyb20gcGlycSBpZiAiY3VycmVudCIgaXMgUFZIIGRvbTAuDQpTbywgaXQgc2VlbXMg
dGhlIGxvZ2ljIG9mIFhFTl9ET01DVExfaXJxX3Blcm1pc3Npb24gaXMgbm90IHN1aXRhYmxlIHdo
ZW4gUFZIIGRvbTA/IE1heWJlIGl0IGRpcmVjdGx5IG5lZWRzIHRvIGdldCBpcnEgZnJvbSB0aGUg
Y2FsbGVyKGRvbVUpIGluc3RlYWQgb2YgImN1cnJlbnQiIGlmIHRoZSAiY3VycmVudCIgaGFzIG5v
IFBJUlEgZmxhZz8NCg0KPiBJbiBmYWN0ICJtYXAiIHdvdWxkIGxpa2VseSBiZXR0ZXIgbm90IGhh
dmUgZG9uZSB0d28gdGhpbmdzIGF0IGEgdGltZSBmcm9tIHRoZSB2ZXJ5IGJlZ2lubmluZyAuLi4N
Cj4gDQo+IEphbg0KDQotLSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

