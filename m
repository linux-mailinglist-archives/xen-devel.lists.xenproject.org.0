Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 204BF82A61E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 03:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665856.1036145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNkym-0007ot-UJ; Thu, 11 Jan 2024 02:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665856.1036145; Thu, 11 Jan 2024 02:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNkym-0007n4-RZ; Thu, 11 Jan 2024 02:39:36 +0000
Received: by outflank-mailman (input) for mailman id 665856;
 Thu, 11 Jan 2024 02:39:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXkz=IV=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rNkyl-0007my-6f
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 02:39:35 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a6ddb22a-b02a-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 03:39:33 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DM4PR12MB6063.namprd12.prod.outlook.com (2603:10b6:8:b1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Thu, 11 Jan
 2024 02:39:29 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::bafd:1985:94e6:ef33]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::bafd:1985:94e6:ef33%6]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 02:39:29 +0000
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
X-Inumbo-ID: a6ddb22a-b02a-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ntm+qRM3TeL9dWuE+kgYSDSSFLNuOaStvqBqT5OPz3vwj937NTl2n/2n/d80xucgefax4yiOggVoEU5Aub34jgYcHg4TCa7rBLYXndxhalb4Zm1pcmG7g+CeI3zI3RgBOwmBU0EuJvmLOBIWesA/MPRx/4ZjJof/dgtrCIIn98cJxWaKRvnLc7tqAEP8uBZMUYa8xNNCYaFEe3FSxuVJOqfNBpCr+lpnYwJsVRc5jnwYfXBxYOonx8ZWKTYPxuiFPIMbPl/S7S43RphGnAoxKUJ4Bt44FazmF+lFe52/SygTvYGoCrTZNF7R0SDyxuI7EnHBTEHweJ8LUsI9FAs0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8H3k6dyh5KZVFqoEmtbTHt4mAO1M8enfs8gISBH+lA=;
 b=Aik0LWEeKTl0Ur4P7enoamTjuXdhEpfyEL+CnDtanOhTxvqTXH75nsCEeBn+OU/VLyndP48CgmPdpnM8aDIXy6DEDd12CpQa6q7ofkS4WiijZEyTjP+nm3dVcqNMWF7PItU57Wq65Eehe+x1yuLOpk9OICSXuh0ArUT9u2Ch5JeQkmyCSvta3cf4T7HyJo33Pa6v1gBv9W2hkewrnttMFrX+yNoLN7Vr/L9/80UnuwraGzI8VqMga5zrqnxIhg5dY2GzYd+Ovw0CF61kHJiWsQisrbS2ZB0JbILDmXNNyBBj5i6c2m0GkYE1JZ1cljaM/5g4nQhSrsJuzDH5GE/hdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O8H3k6dyh5KZVFqoEmtbTHt4mAO1M8enfs8gISBH+lA=;
 b=pZLmZaewa+hcMiVpxXc+BVT5WYydUW0f2D5SLfFVx4ie7Zb5vHRIT8h9noueJVucQVJwANU/g/Rm/FUh20Z5f9A86Sb4buDALjFkc1CNJl1mOlz0m+X20tRxDR5fqnuVeZ70ve8H2scBUg3t4CCYbOpGPgrFaWRrL6pvJn1Gj7k=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Thread-Topic: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Thread-Index: AQHaP6Y1pt0ckfKChE+VsjXCWSj8+LDTgncAgADyZIA=
Date: Thu, 11 Jan 2024 02:39:29 +0000
Message-ID:
 <BL1PR12MB5849FF293A115D986256D4A4E7682@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-5-Jiqian.Chen@amd.com>
 <a9d7a073-7857-4567-9528-413d96a99d91@amd.com>
In-Reply-To: <a9d7a073-7857-4567-9528-413d96a99d91@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA1PR12MB7567.namprd12.prod.outlook.com
 (15.20.7181.004)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DM4PR12MB6063:EE_
x-ms-office365-filtering-correlation-id: a6c28c43-c668-4f41-b0d9-08dc124e88c9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 u4RgzsmOcrw6HxON9HFSfcDMBiT5H6BFpNFHAmBfhK50ikKsTsgZn79kiBffgI5d+KEYW5IcqUkUOpWy+0ez9/1wPgW6gEvInFcEMQpftKPg/4FUD3VJW89LFWiR4L+Ua7rVqy7PNpmSkeNIc/A6IUCvrsNroK5Q/dbXZknk726EiLDdKIDZHtPZ0V3PXgAlU/Z7dZqmVRb/QlY+gd2m8/n776Xl/INyLaGnHt3LWwfmgouyg822gAv64UPsFuMPEjqC62gi5ejM8ioCog/gryBu337HMouc6eKjifS9V2CFFTnK1COnGghpQfYaRLItRqdiWJ7/I/FuucZmY4QubiYF+GSh9v19MA4iFxTysskJCKxQUftdFlFpJ9UbbU6dfObJgn3AN80ML8TjFyMO/Mhw0WNT8U88UF8CH/vE17q9LvivpvlrNemtEcYNjmEldb6UnWHRzUfCE1mOsfVdfsx3PudF4dot5VQvCzkbl/oS/zDGSlA7phC0aKmWVp2owjDqmm8qzWKl3M6g6eDMJ5t+UUZtvRDrkzgVsBFHuK30C4JuM2F5Yejwx2erSFQAWA+VU9WCY6klKEuU1rvFn5T63Q+dIjkCCY+1lVYIJe0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(366004)(376002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(55016003)(6506007)(26005)(53546011)(9686003)(7696005)(478600001)(71200400001)(38100700002)(122000001)(33656002)(66446008)(41300700001)(2906002)(66476007)(64756008)(66556008)(7416002)(76116006)(83380400001)(5660300002)(54906003)(38070700009)(8676002)(4326008)(316002)(6636002)(66946007)(8936002)(52536014)(6862004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?a0cwVFNpYnFYNFVhUUZyeEp5S2pPQ0xwK3NjcUVJSVBoYzd1ZG5pakwzWnI5?=
 =?utf-8?B?NEhrczdhbFV4TGpleERGWExIWmw4a3Q3OEpUcHIvYzJkemMyaHlDV2dqOG03?=
 =?utf-8?B?UTBqL3JiWHBxbkN0cjNDZFBPQWFsQnlXNzIvQk9qYW5zdCt6TWhnMkVqOTVw?=
 =?utf-8?B?ZU0xMHFhQUdKdWhvbEFXNmZZQjFoRzZhYkdvbm01NUxFWVRVZ2ZUNFd6Sm1M?=
 =?utf-8?B?d1AybXpma3hDRUdtMW16akY4TjlZT3pFRExXM1Jyak5vdGNGYWtkTk9TRHpE?=
 =?utf-8?B?c1pURVRJWFYyaVdVQ1hMTTRuMXhQd2NHT2FKNEZDNUZNYkttbktxaUtoSDRi?=
 =?utf-8?B?N2M1dnZRbWJtMEFiNVRsa2NJVDB2eFp4NFNPWnlmbXg2RWhRUHV4aUFqRFVE?=
 =?utf-8?B?T2pzdi9MMGs1NlNDZ0xtVkgwR2g5MnBtUXM5MTZpZUF0ancySXJlalltS0dx?=
 =?utf-8?B?ZDV2RGdoOEpsN01vRXlva2gra0FwWlBpdFVKNktGZ253SDFSWVpnM25wS0h2?=
 =?utf-8?B?bjkvWmtDUUJ6SDZCVW5vemsrNUJJbmdXQWxCRmozY3dFMEJJQTV1Vi9xT0th?=
 =?utf-8?B?dVFSUlRyVVRlYWJCU1BVNnVORm1KaFczWnZmcUo4cHhIOWtXVUExd2lQZW9Z?=
 =?utf-8?B?V09zQWhoTFZRVGdFQWRTQXpGZHpJZ1NhSFFlT0RaM2d4N25vNEdSRVFCT3Ix?=
 =?utf-8?B?Z0Zka3lpZDV2Y3NrWWhPQ21BbG9qMWswc0pDNzlXQzVvSThtT05ZSDZlSHlU?=
 =?utf-8?B?dzNBUEVkaXJjOTQyM25qQ0dRcW5KL2RCVit0ZEpKWVl0bHZBQzIzTzN3WDFU?=
 =?utf-8?B?bnpadDNacFV4T0pPakRCdHZvNDZabk1Nelc2SzZSaGlxNjd6U3QwcC8wODJM?=
 =?utf-8?B?N3RVZmdUeGNmQkwzdFdqSmRKMHZrNlRUYnNsNDB6dk9JR3doUUxFYVgzN1ZM?=
 =?utf-8?B?Mmo0eTNnazhKcE1BS3krRnBDaTlZZGtLOTZyT3FpSytoQkN1dzd2eUh1dm00?=
 =?utf-8?B?eDN5Q0RFOWhQRUJHZWR5dmlGdHNFQWZJRmcyZWRJT3VUUkVCZldLRmhjd2Rh?=
 =?utf-8?B?MlF3a3Y2clQxR0JYSzZONUFya0F2cmxxbDN6RWM0Y2tNcUFONmt6ZW1YNnJk?=
 =?utf-8?B?YTJncElQZVVVNVIzWDIrUkhxMHRZT1dhZWFWV0M0YVo0OUprQnJxSXhaWlZk?=
 =?utf-8?B?RC82MzVBYk05LzZaRTg0ZXdzLzBDMkxYRkpHeXhtK0J4RVpkNC8vNy9GZGlI?=
 =?utf-8?B?UWlsNm5ObnZTNmFIZVF3OFUxYzZEaEoyMjB4cGtlWjlwZmRFR0VPTVgrN054?=
 =?utf-8?B?MFd6RHhHcC82NHYwaEdMUDdsSEJaS0NiTktBc3pldkV4ZFZna2F2YjU2TWVY?=
 =?utf-8?B?WUtZbXRvUjd2UEROMlRyb2QyV0ZFajFJNHRhTUhTVmFqNFErYmQzbnNaWDN2?=
 =?utf-8?B?QnFYVitxd3NhZzVSRCszajRoWG1xeUI0MFJFTENCbHNSbVNtaW9uYWwwQzlW?=
 =?utf-8?B?TVd6ZzRuU3cvUlhJdVB4Tys4Q3dXRC9BZ0J5YVZKL0ZNaFdsYXl5bHFYamU1?=
 =?utf-8?B?SnJGU1RNZEgyaS9EdXR6MlNENlJiZVJoblhhVjM2OEEzY0hWbDlCcEVFOW5H?=
 =?utf-8?B?bDdWSTZ6L2tlVWdKVDV3bFBWNlVVYkRiVUlzSmkrVXdEczB4eDVtL25DZStR?=
 =?utf-8?B?SWdJeXhhNWdYaVRkdCtxdDVPdUtlODdjMmFMOFJxR1VDa0RJd1ZCbGUxL3l4?=
 =?utf-8?B?THd1UVJ4bnJpVHdaWWlybzYrOGVjUFVsYVFDc0I0QWRGbHBockN1Y2RTNG96?=
 =?utf-8?B?VmtDdG1OaFErRlh4bXpmd1BMWmRjTVlhZFRHaDVUa2NGODlBOHd3VlloWUVl?=
 =?utf-8?B?cXhkVUYwbjNHZDNZS3lqUWZxc3llenNTT2NRcDZyK3JmYkl5VXBFQVA3Q0tI?=
 =?utf-8?B?SjBMaC9GOHc1MFNPUHpnVTNiQ3RBbm1OYzExSUY5LzNneTl1ejBVYy9pR0t5?=
 =?utf-8?B?Ni9vOUJrQ280NnNIR3hHSURFZnIxM2taZURYa1RONXZJVkJJQk5HQWNWejVI?=
 =?utf-8?B?WVZIWkZBeUVJWG5pWHBmZjYvT3UzNnQ3UXJWeGR1K2Y3cmxIQUw2Z1NIbU9V?=
 =?utf-8?Q?ZzNE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <687E4F2503B2CC4481F810F146949561@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c28c43-c668-4f41-b0d9-08dc124e88c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 02:39:29.0972
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NSolJNwOJtbJp5SBXRgXpcFSDIhvW5rBjXZRgcUGqYD7/5yKianWkMG4SB1QlO7ps8HczVuwWNpcLXVtfmkOYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6063

T24gMjAyNC8xLzExIDA0OjA5LCBTdGV3YXJ0IEhpbGRlYnJhbmQgd3JvdGU6DQo+IE9uIDEvNS8y
NCAwMjowOSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9k
b21jdGwuYyBiL3hlbi9jb21tb24vZG9tY3RsLmMNCj4+IGluZGV4IGY1YTcxZWU1Zjc4ZC4uZWVi
OTc1YmQwMTk0IDEwMDY0NA0KPj4gLS0tIGEveGVuL2NvbW1vbi9kb21jdGwuYw0KPj4gKysrIGIv
eGVuL2NvbW1vbi9kb21jdGwuYw0KPj4gQEAgLTY1MywxMiArNjUzLDIwIEBAIGxvbmcgZG9fZG9t
Y3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkNCj4+ICAg
ICAgICAgIHVuc2lnbmVkIGludCBwaXJxID0gb3AtPnUuaXJxX3Blcm1pc3Npb24ucGlycSwgaXJx
Ow0KPj4gICAgICAgICAgaW50IGFsbG93ID0gb3AtPnUuaXJxX3Blcm1pc3Npb24uYWxsb3dfYWNj
ZXNzOw0KPj4gIA0KPj4gLSAgICAgICAgaWYgKCBwaXJxID49IGN1cnJlbnQtPmRvbWFpbi0+bnJf
cGlycXMgKQ0KPj4gKyAgICAgICAgaWYgKCBwaXJxID49IG5yX2lycXNfZ3NpICkNCj4gDQo+IFRo
aXMgZG9lc24ndCBidWlsZCBvbiBBUk0sIGFzIG5yX2lycXNfZ3NpIGlzIHg4NiBvbmx5LiBUaGlz
IGlzIGEgd2lsZCBndWVzczogd2UgbWF5IHdhbnQga2VlcCB0aGUgZXhpc3RpbmcgY3VycmVudC0+
ZG9tYWluLT5ucl9waXJxcyBjaGVjaywgdGhlbiBhZGQgdGhlIG5ldyBucl9pcnFzX2dzaSBjaGVj
ayB3cmFwcGVkIGluICNpZmRlZiBDT05GSUdfWDg2Lg0KQXMgSSB3aWxsIGFkZCBhIG5ldyBoeXBl
cmNhbGwgaW4gbmV4dCB2ZXJzaW9uLCB0aGVuIHRoaXMgY2hhbmdlIHdpbGwgbm90IGV4aXN0LCB0
aGFuayB5b3UuDQoNCj4gDQo+PiAgICAgICAgICB7DQo+PiAgICAgICAgICAgICAgcmV0ID0gLUVJ
TlZBTDsNCj4+ICAgICAgICAgICAgICBicmVhazsNCj4+ICAgICAgICAgIH0NCj4+IC0gICAgICAg
IGlycSA9IHBpcnFfYWNjZXNzX3Blcm1pdHRlZChjdXJyZW50LT5kb21haW4sIHBpcnEpOw0KPj4g
Kw0KPj4gKyAgICAgICAgaWYgKCBpcnFfYWNjZXNzX3Blcm1pdHRlZChjdXJyZW50LT5kb21haW4s
IHBpcnEpICkNCj4+ICsgICAgICAgICAgICBpcnEgPSBwaXJxOw0KPj4gKyAgICAgICAgZWxzZQ0K
Pj4gKyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHJldCA9IC1FUEVSTTsNCj4+ICsgICAgICAg
ICAgICBicmVhazsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICAgICAgICAgIGlmICggIWlycSB8
fCB4c21faXJxX3Blcm1pc3Npb24oWFNNX0hPT0ssIGQsIGlycSwgYWxsb3cpICkNCj4+ICAgICAg
ICAgICAgICByZXQgPSAtRVBFUk07DQo+PiAgICAgICAgICBlbHNlIGlmICggYWxsb3cgKQ0KDQot
LSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

