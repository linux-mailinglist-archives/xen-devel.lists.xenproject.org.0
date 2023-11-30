Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E4C7FE918
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 07:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644406.1005347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8aRa-0005Xh-Jv; Thu, 30 Nov 2023 06:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644406.1005347; Thu, 30 Nov 2023 06:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8aRa-0005Ug-H1; Thu, 30 Nov 2023 06:22:38 +0000
Received: by outflank-mailman (input) for mailman id 644406;
 Thu, 30 Nov 2023 06:22:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfjJ=HL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r8aRY-0005Ua-So
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 06:22:37 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8729b81-8f48-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 07:22:34 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by SN7PR12MB7251.namprd12.prod.outlook.com (2603:10b6:806:2ab::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Thu, 30 Nov
 2023 06:22:28 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 06:22:28 +0000
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
X-Inumbo-ID: d8729b81-8f48-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H+kBsk4A3d2/RRyT49OWS+jaAJIJqSwIdFSSj9DxBVI99euf3u9jgoOwHA1ksqBcxVh4mfmZx0ZnNcfQ2L1uCILQ2G1fRwhkavpkR7zOAia1+qDW2DBEvQbNNAFBvpMeJt9dF5b8ZDoIPWBBjKoO+1+WJkC9iPTw/9NJ4KdpoVd29eMFX1DQ4LPSFL4+Dr3lGEzZ0H1Ow5okj4Ve11rvkyczCAukDbsA+dFll0FOUAvCSSYLITb2fIhLBfhQcaWnFZ5mwntDob438CvGcQXtPSDIXUXfNkz5jWeF1w9W6YabZsznsrKdg/YOh5RY0KhuI01bfD/0oNQCHBYnhEi4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Fs4XBn4beRAUJ2xxC22hpTah8PuIfagUoiNU5WIeHg=;
 b=mZinRS+Q1/ZPfW7a69IYmFCvndGSxN1uoPoRsNuCWE53h4qaQdsunOVQIjT2jJpYqq/Wd7MlBk8wLxGc16//nNInrHB6DA6aG81LninN0gUUlrf2iLORgQ8+cVffC+OukRC9t8ujZoOAdpuCRGMYjbECWSBe18lbeH+QGv3jAgiSe/IuKVX322v42aVSq9D4xGqzXPxf61SX7iDv+8stOuttXJr45Gw47D+j6ybFojYYYhvJFrFZmHmCfYBVdKF3jllZD0luuq86s4eEmVuxGKBbW/hO/kVGv+bqvUWgeXERKlZvZehZonWBCTzbi9nKAWsGDILcoMkX6M8xBNLy1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Fs4XBn4beRAUJ2xxC22hpTah8PuIfagUoiNU5WIeHg=;
 b=IkYzNmitrI/43ah3n/cNj+8ncVnHhyfIHtHfNFc4MrJuwr/pbZaJUZPCCN3RVZZKTDxz4LCrF+D0PEd2AmseOFYSLcSJZCH/PUj5n6GQhmljiJy3EvZ2VE3Rd2bCQSa+dFji/7bI6r2qrqKNtV+De61QQe8agwTDkm9SeQ0rNcs=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
CC: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Hildebrand, Stewart"
	<Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Thread-Topic: [RFC XEN PATCH v2 1/3] xen/vpci: Clear all vpci status of device
Thread-Index: AQHaHsLfq+dfGUvRWUqPIEH3O9fXrbCPyyeAgAMgFYA=
Date: Thu, 30 Nov 2023 06:22:28 +0000
Message-ID:
 <BL1PR12MB58493CC28A32E3C9B3A1767FE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-2-Jiqian.Chen@amd.com> <ZWX0U1tYooY70UJo@macbook>
In-Reply-To: <ZWX0U1tYooY70UJo@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA0PR12MB8351.namprd12.prod.outlook.com
 (15.20.7068.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|SN7PR12MB7251:EE_
x-ms-office365-filtering-correlation-id: c1897859-9607-4bbe-e300-08dbf16cba33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 D8y+cDn8JoKESwLW97oV03yqjJjOX3H9tTv3uFZdW/h3ygzInyt4LG3FjRwBtOLgX0BCu1j3Pw93Oqnj5LHuyfVJ9qJQ6zwhe22iF28UDfZJu35Uc9Pz2Z92NoX2HXj2EWeRKO6nejUsxbtKzq7pWISEJYdUoHhaJ3tJVyQD2ATjt3n0dbXePPRAnIT4aXS+7wQKf6TkWwPBhkYR6HoKAkniiTRiLyNG3LFb7XYmuEa45QyPvrdrNK4xEO3l31gvbnJyEfHF3/MTOAB+tnQsvv5ZNpMNO6eL3MDTf6xT4HKl2RQgpEi8QjeCjtsbIFjzoc3nlJDwJSRS5ZV/2aW34gNoij4TRbPG8+oFJm8MUo5kGRHQ0Eyd5a8H67YuBM0mB5btHPtQf27iVpveYzpQd6JlBLt9cQPWj9c18TnVRJcvXpH05vHQ/+H4GHeE5vmjU2GeZFtX4B97URN8a3h2J9oUXkkApTndtN3TUjGKn/wfugSyWP99tHgjXEcrSa4jO+lUV24kPDiRmxKec3KM6VtrpiSFNxEgGATiBYBLInvDXhUHuc3sPNvqq58Zcj3P8SXjpuaZVvGFALWJuLuX6Wow+F0aSvY3uas2y9JUW+Em2se2S4Zdm9e4BMCkcm/jwJCQIG4bV3sdyN6t13TWHvbobRYB9i+xE5W8o4wBs70=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(66446008)(110136005)(76116006)(66476007)(54906003)(64756008)(26005)(66946007)(66556008)(316002)(2906002)(52536014)(4326008)(8936002)(38070700009)(38100700002)(41300700001)(122000001)(5660300002)(33656002)(8676002)(55016003)(53546011)(83380400001)(6506007)(7696005)(478600001)(9686003)(202311291699003)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MThsV3RGWHh0dVM3V0Zqc0xQMVIxWTkyaW9oWFBobzJlL0k1SjZLWXVaZlo1?=
 =?utf-8?B?QTdzbk4wenMzZ2I4R0VSZ0tCc0ExQmtZcEZDemt5RllVTWd4V0U1VjZmRzB1?=
 =?utf-8?B?bHlEakhHeG1kRkNnMXU5L0lJZzcwYjVQeUkrZ1ZxNm55WkhtWEtFMW9wMVd4?=
 =?utf-8?B?dmtFMVMxb3NibzcyYWlpak92TWFnV0RuSXJuNWwwODJlVkFRVFErM1FQY2Q3?=
 =?utf-8?B?WnVQUlM4K0VENEd5akhHWFpvV0xDT2QwRkVEZjNtU3E2cTJtZEdUNGFWQUhI?=
 =?utf-8?B?WGVxb0w4M3lOWVE4dWhRTHpmOVl6c1RYa0Z3dUxUNXZHL2RZcENhVlFqd1d2?=
 =?utf-8?B?N05xdldWbHg3SVhIa1ZzUThKWTFkS3BUZUR4KzA2RWxJb0dsdWo1M2Z3SlNU?=
 =?utf-8?B?aTJ4TkVPWlpGY0cyVGhSWEFDUHNUZVlkV3lIbTg5Q2pGWlloU3hLNzhOY0pM?=
 =?utf-8?B?RWUrQXBZejVEWUY0R3dFRkNqdHcreHlUUjl1Q3hPRGRpUmZXc2VqQkhsckVr?=
 =?utf-8?B?TEhEU0orNkFJcUVIWk9mOHRrOUhacnAvb29mc3l1cExPNDVhSGw1cmN4QllC?=
 =?utf-8?B?N01QVHQ2akVEVzg5QXI1aGU2dWZKV1V0U1JUajZvY3ZKR3dIMk9LYy9VaWZK?=
 =?utf-8?B?NHhjRFZaY0RjUHhXYktiWDl5Sm5na0JBRi9SR09mZ01BRHA2WlkyUE4vU2dU?=
 =?utf-8?B?dkU1b3lKTWM0WVJNVHVwaWQ1UUNNbDZ0YUgxNUZoeEVWMEd2SDdxTEVoSUwx?=
 =?utf-8?B?L3NNcnFSR3pWNDFRWjdvOXhIeW9YQU0vbkt2dm1yaGdzaDlLR2lvUkZxUmRm?=
 =?utf-8?B?YkdjMUcwRExRMXFQUXBHbGRwVy9EYmpQRDRuY0Q5QStUWXluQU5xd3U0aWth?=
 =?utf-8?B?UXY1WDRwN2FydjluQURSemtLanFiOU85UEZkd0p6ZGUxZXVrYTBheXNpTnNt?=
 =?utf-8?B?aXhyU0VkNkVmMy9CNkltRTlLMGRoQXdzbExnNEE2L1AzeDZrUGx3TG53VXhn?=
 =?utf-8?B?MVgxdXNxbVN2bXpqQTlab2pYc3ZDSE15R0g0UGo2QXJOWFJJUE4wSnNQbzAy?=
 =?utf-8?B?VW1FRzBPL2lmSi9JdTlac0hOcGxSckhwTE1vZEZGUXNlNUxlaVlZaHpzbGo4?=
 =?utf-8?B?dk42Mkl1V3BUVmVmamZ1eVU4T0JZdnRhaFdtTXRMd1ZYbjdERDNLRG9seit3?=
 =?utf-8?B?OE9QaEJOd01RcE1xS0RJMENGZldZL2NCUzFTVFBlRTBtbThXaW50eVcrK2h3?=
 =?utf-8?B?YUVKNEtpUURCaTNsMDNVSDFmVUNhSFVaSU9DTVFRVTYxb1ZTbVFZbXdadEcy?=
 =?utf-8?B?N2F6OVBXWXFtaUpqbHRwaEtSU0VncW9jVnJHaFlMcmJKS1lQS242aUFwVHU3?=
 =?utf-8?B?bE5qYXZjYTU4WGFQRmptODZRb2R2cFJVVXBqWEp6aSs0MmJhSUJzS0VLT2w0?=
 =?utf-8?B?dVdHb1JtL2VCZ20vZnNGT3BYd21JRm9pL00xa3VwZzh0dWJVL2ZKRUllTjRm?=
 =?utf-8?B?ZE5YY2lhZUxia2lUZ2g4Vk5CUUE0NnpBbHZvSFlMN2t0NzRLRXBpUi9vNVJV?=
 =?utf-8?B?NUdHTU1OZHowWG5IdmdGUlY4WnpyVzBuQmVFbmc2d1I4aVNnSkFabEZHeUgr?=
 =?utf-8?B?Zzhad0JqeG1hQmVGWkVGSCtEL3Nlb3lJR3BpMEhHcU1oSUxrSnVzbkljdFhh?=
 =?utf-8?B?cklyWVMrUWpXekZVRlNnMWdmZlFGU0ZCSWthVzd0SWVGRlpLL3FzS1BnS2hL?=
 =?utf-8?B?VDloQW9naXREbmFoVzU4U2RIRVZ2Zm5MR2JqRCtNV01IeFl3V0p3VXBiUG5k?=
 =?utf-8?B?Q2ZvcllPblpSVTJtZmNKcml3a3ZZUnl5bmFtVEZKSFVOcGVKODIwSE1FQUc0?=
 =?utf-8?B?ZFFIMFJiRXdvNUtlTldLVzlhbGp4d0E2VEQ0RU5qNjdFdUhQZG1jeCsrUG1M?=
 =?utf-8?B?OVRoU01zVnB0U1haY1lGK1BoN2g0TzJDK1llUlM0RDVCRm80MlFFT0FaZllJ?=
 =?utf-8?B?L0trNU9kMFRqaVJGRjZ5Mk1icktTWE1VeDZUQk1waU1UN2lCSzVWQ29WbnBz?=
 =?utf-8?B?NGh4R09xYU5hQlRZblU3SXdVQVBReUczeDJ3UGttWTBtN05EcU55TlcwdlJX?=
 =?utf-8?Q?dep8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <797F0984BF7AE14784B3B79C0BB7ECAF@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1897859-9607-4bbe-e300-08dbf16cba33
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 06:22:28.5438
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iPttsehBmtHP+lj3uiQt6Pt9HcrtD4hDf1K5zgi2zHQgAvK6+Pbnrm3VU61dWGaPpxzPQoVZf4v2NNZkUrTN4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7251

SGkgUm9nZXIgYW5kIERhbmllbCBQLiBTbWl0aCwNCg0KT24gMjAyMy8xMS8yOCAyMjowOCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gT24gRnJpLCBOb3YgMjQsIDIwMjMgYXQgMDY6NDE6MzRQ
TSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiBXaGVuIGEgZGV2aWNlIGhhcyBiZWVuIHJl
c2V0IG9uIGRvbTAgc2lkZSwgdGhlIHZwY2kgb24gWGVuDQo+PiBzaWRlIHdvbid0IGdldCBub3Rp
ZmljYXRpb24sIHNvIHRoZSBjYWNoZWQgc3RhdGUgaW4gdnBjaSBpcw0KPj4gYWxsIG91dCBvZiBk
YXRlIGNvbXBhcmUgd2l0aCB0aGUgcmVhbCBkZXZpY2Ugc3RhdGUuDQo+PiBUbyBzb2x2ZSB0aGF0
IHByb2JsZW0sIHRoaXMgcGF0Y2ggYWRkIG5ldyBoeXBlcmNhbGwgdG8gY2xlYXINCj4+IGFsbCB2
cGNpIGRldmljZSBzdGF0ZS4gQW5kIHdoZW4gcmVzZXQgZGV2aWNlIGhhcHBlbnMgb24gZG9tMA0K
Pj4gc2lkZSwgZG9tMCBjYW4gY2FsbCB0aGlzIGh5cGVyY2FsbCB0byBub3RpZnkgdnBjaS4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBKaXFpYW4gQ2hlbiA8SmlxaWFuLkNoZW5AYW1kLmNvbT4NCj4+
IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQo+PiAtLS0NCj4+
ICB4ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jICB8ICAxICsNCj4+ICB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9wY2kuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrKw0KPj4gIHhlbi9kcml2
ZXJzL3BjaS9waHlzZGV2LmMgICAgIHwgMTQgKysrKysrKysrKysrKysNCj4+ICB4ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYyAgICAgICB8ICA5ICsrKysrKysrKw0KPj4gIHhlbi9pbmNsdWRlL3B1Ymxp
Yy9waHlzZGV2LmggIHwgIDIgKysNCj4+ICB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICB8
ICAxICsNCj4+ICB4ZW4vaW5jbHVkZS94ZW4vdnBjaS5oICAgICAgICB8ICA2ICsrKysrKw0KPj4g
IDcgZmlsZXMgY2hhbmdlZCwgNTQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jIGIveGVuL2FyY2gveDg2L2h2bS9oeXBlcmNhbGwu
Yw0KPj4gaW5kZXggZWViNzNlMWFhNS4uNmFkNWI0ZDVmMSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJj
YWxsLmMNCj4+IEBAIC04NCw2ICs4NCw3IEBAIGxvbmcgaHZtX3BoeXNkZXZfb3AoaW50IGNtZCwg
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgIGNhc2UgUEhZU0RFVk9Q
X3BjaV9tbWNmZ19yZXNlcnZlZDoNCj4+ICAgICAgY2FzZSBQSFlTREVWT1BfcGNpX2RldmljZV9h
ZGQ6DQo+PiAgICAgIGNhc2UgUEhZU0RFVk9QX3BjaV9kZXZpY2VfcmVtb3ZlOg0KPj4gKyAgICBj
YXNlIFBIWVNERVZPUF9wY2lfZGV2aWNlX3N0YXRlX3Jlc2V0Og0KPj4gICAgICBjYXNlIFBIWVNE
RVZPUF9kYmdwX29wOg0KPj4gICAgICAgICAgaWYgKCAhaXNfaGFyZHdhcmVfZG9tYWluKGN1cnJk
KSApDQo+PiAgICAgICAgICAgICAgcmV0dXJuIC1FTk9TWVM7DQo+PiBkaWZmIC0tZ2l0IGEveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
Yw0KPj4gaW5kZXggMDRkMDBjN2MzNy4uZjg3MTcxNTU4NSAxMDA2NDQNCj4+IC0tLSBhL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYw0KPj4gQEAgLTgyNCw2ICs4MjQsMjcgQEAgaW50IHBjaV9yZW1vdmVfZGV2aWNlKHUx
NiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pDQo+PiAgICAgIHJldHVybiByZXQ7DQo+PiAgfQ0KPj4g
IA0KPj4gK2ludCBwY2lfcmVzZXRfZGV2aWNlX3N0YXRlKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2
Zm4pDQo+IA0KPiBZb3UgY291bGQgdXNlIHBjaV9zYmRmX3QgaGVyZSBpbnN0ZWFkIG9mIDMgcGFy
YW1ldGVycy4NCldpbGwgY2hhbmdlIGluIG5leHQgdmVyc2lvbiwgdGhhbmsgeW91Lg0KDQo+IA0K
PiBJJ20gaG93ZXZlciB1bnN1cmUgd2hldGhlciB3ZSByZWFsbHkgbmVlZCB0aGlzIGhlbHBlciBq
dXN0IHRvIGZldGNoDQo+IHRoZSBwZGV2IGFuZCBjYWxsIHZwY2lfcmVzZXRfZGV2aWNlX3N0YXRl
KCksIEkgdGhpbmsgeW91IGNvdWxkIHBsYWNlDQo+IHRoaXMgbG9naWMgZGlyZWN0bHkgaW4gcGNp
X3BoeXNkZXZfb3AoKS4gIFVubGVzcyB0aGVyZSBhcmUgcGxhbnMgdG8NCj4gdXNlIHN1Y2ggbG9n
aWMgb3V0c2lkZSBvZiBwY2lfcGh5c2Rldl9vcCgpLg0KSWYgSSBwbGFjZSB0aGUgbG9naWMgb2Yg
cGNpX3Jlc2V0X2RldmljZV9zdGF0ZSBkaXJlY3RseSBpbiBwY2lfcGh5c2Rldl9vcC4gSSB0aGlu
ayBJIG5lZWQgdG8gZGVjbGFyZSB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZSBpbiBwY2kuaD8gSWYg
aXQgaXMgc3VpdGFibGUsIEkgd2lsbCBjaGFuZ2UgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPj4g
K3sNCj4+ICsgICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7DQo+PiArICAgIGludCByZXQgPSAtRU5P
REVWOw0KPiANCj4gU29tZSBYU00gY2hlY2sgc2hvdWxkIGJlIGludHJvZHVjZWQgZnJvIHRoaXMg
b3BlcmF0aW9uLCBhcyBub25lIG9mIHRoZQ0KPiBleGlzdGluZyBvbmVzIGlzIHN1aXRhYmxlLiAg
U2VlIHhzbV9yZXNvdXJjZV91bnBsdWdfcGNpKCkgZm9yIGV4YW1wbGUuDQo+IA0KPiB4c21fcmVz
b3VyY2VfcmVzZXRfc3RhdGVfcGNpKCkgb3Igc29tZSBzdWNoIEkgd291bGQgYXNzdW1lLg0KSSBk
b24ndCBrbm93IHdoYXQgSSBzaG91bGQgZG8gaW4gWFNNIGZ1bmN0aW9uKGFzc3VtZSBpdCBpcyB4
c21fcmVzb3VyY2VfcmVzZXRfc3RhdGVfcGNpKS4NCkhpIERhbmllbCBQLiBTbWl0aCwgY291bGQg
eW91IHBsZWFzZSBnaXZlIG1lIHNvbWUgc3VnZ2VzdGlvbnM/DQpKdXN0IHRvIGNoZWNrIHRoZSBY
U01fUFJJViBhY3Rpb24/DQoNCj4gDQo+IChhZGRpbmcgdGhlIFhTTSBtYWludGFpbmVyIGZvciBm
ZWVkYmFjaykuDQo+IA0KPj4gKw0KPj4gKyAgICBwY2lkZXZzX2xvY2soKTsNCj4+ICsNCj4+ICsg
ICAgcGRldiA9IHBjaV9nZXRfcGRldihOVUxMLCBQQ0lfU0JERihzZWcsIGJ1cywgZGV2Zm4pKTsN
Cj4+ICsgICAgaWYgKCAhcGRldiApDQo+PiArICAgICAgICBnb3RvIGVycm9yOw0KPj4gKw0KPj4g
KyAgICByZXQgPSB2cGNpX3Jlc2V0X2RldmljZV9zdGF0ZShwZGV2KTsNCj4+ICsgICAgaWYgKHJl
dCkNCj4+ICsgICAgICAgIHByaW50ayhYRU5MT0dfRVJSICJQQ0kgcmVzZXQgZGV2aWNlICVwcCBz
dGF0ZSBmYWlsZWRcbiIsICZwZGV2LT5zYmRmKTsNCj4+ICsNCj4+ICtlcnJvcjoNCj4+ICsgICAg
cGNpZGV2c191bmxvY2soKTsNCj4+ICsNCj4+ICsgICAgcmV0dXJuIHJldDsNCj4+ICt9DQo+PiAr
DQo+PiAgLyogQ2FsbGVyIHNob3VsZCBob2xkIHRoZSBwY2lkZXZzX2xvY2sgKi8NCj4+ICBzdGF0
aWMgaW50IGRlYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MTZfdCBzZWcsIHVp
bnQ4X3QgYnVzLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgZGV2Zm4p
DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGNpL3BoeXNkZXYuYyBiL3hlbi9kcml2ZXJz
L3BjaS9waHlzZGV2LmMNCj4+IGluZGV4IDQyZGIzZTZkMTMuLmNmZGI1NDU2NTQgMTAwNjQ0DQo+
PiAtLS0gYS94ZW4vZHJpdmVycy9wY2kvcGh5c2Rldi5jDQo+PiArKysgYi94ZW4vZHJpdmVycy9w
Y2kvcGh5c2Rldi5jDQo+PiBAQCAtNjcsNiArNjcsMjAgQEAgcmV0X3QgcGNpX3BoeXNkZXZfb3Ao
aW50IGNtZCwgWEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+PiAgICAgICAgICBi
cmVhazsNCj4+ICAgICAgfQ0KPj4gIA0KPj4gKyAgICBjYXNlIFBIWVNERVZPUF9wY2lfZGV2aWNl
X3N0YXRlX3Jlc2V0OiB7DQo+PiArICAgICAgICBzdHJ1Y3QgcGh5c2Rldl9wY2lfZGV2aWNlIGRl
djsNCj4+ICsNCj4+ICsgICAgICAgIGlmICggIWlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkg
KQ0KPj4gKyAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4+ICsNCj4+ICsgICAgICAg
IHJldCA9IC1FRkFVTFQ7DQo+PiArICAgICAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdCgmZGV2LCBh
cmcsIDEpICE9IDAgKQ0KPj4gKyAgICAgICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAgICAgICAg
cmV0ID0gcGNpX3Jlc2V0X2RldmljZV9zdGF0ZShkZXYuc2VnLCBkZXYuYnVzLCBkZXYuZGV2Zm4p
Ow0KPj4gKyAgICAgICAgYnJlYWs7DQo+PiArICAgIH0NCj4+ICsNCj4+ICAgICAgZGVmYXVsdDoN
Cj4+ICAgICAgICAgIHJldCA9IC1FTk9TWVM7DQo+PiAgICAgICAgICBicmVhazsNCj4+IGRpZmYg
LS1naXQgYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5j
DQo+PiBpbmRleCAzYmVjOWE0MTUzLi5lOWMzZWIxY2Q2IDEwMDY0NA0KPj4gLS0tIGEveGVuL2Ry
aXZlcnMvdnBjaS92cGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiBA
QCAtMTAzLDYgKzEwMywxNSBAQCBpbnQgdnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYg
KnBkZXYpDQo+PiAgDQo+PiAgICAgIHJldHVybiByYzsNCj4+ICB9DQo+PiArDQo+PiAraW50IHZw
Y2lfcmVzZXRfZGV2aWNlX3N0YXRlKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsg
ICAgQVNTRVJUKHBjaWRldnNfbG9ja2VkKCkpOw0KPj4gKw0KPj4gKyAgICB2cGNpX3JlbW92ZV9k
ZXZpY2UocGRldik7DQo+PiArICAgIHJldHVybiB2cGNpX2FkZF9oYW5kbGVycyhwZGV2KTsNCj4+
ICt9DQo+PiArDQo+PiAgI2VuZGlmIC8qIF9fWEVOX18gKi8NCj4+ICANCj4+ICBzdGF0aWMgaW50
IHZwY2lfcmVnaXN0ZXJfY21wKGNvbnN0IHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpyMSwNCj4+IGRp
ZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvcGh5c2Rldi5oIGIveGVuL2luY2x1ZGUvcHVi
bGljL3BoeXNkZXYuaA0KPj4gaW5kZXggZjBjMGQ0NzI3Yy4uNDE1Njk0ODkwMyAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9waHlzZGV2LmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRl
L3B1YmxpYy9waHlzZGV2LmgNCj4+IEBAIC0zMDUsNiArMzA1LDggQEAgc3RydWN0IHBoeXNkZXZf
cGNpX2RldmljZSB7DQo+PiAgdHlwZWRlZiBzdHJ1Y3QgcGh5c2Rldl9wY2lfZGV2aWNlIHBoeXNk
ZXZfcGNpX2RldmljZV90Ow0KPj4gIERFRklORV9YRU5fR1VFU1RfSEFORExFKHBoeXNkZXZfcGNp
X2RldmljZV90KTsNCj4+ICANCj4+ICsjZGVmaW5lIFBIWVNERVZPUF9wY2lfZGV2aWNlX3N0YXRl
X3Jlc2V0ICAgICAgMzINCj4gDQo+IFRoaXMgbmVlZHMgc29tZSBjb21tZW50IGluIG9yZGVyIHRv
IGV4cGxhaW4gdGhlIGV4cGVjdGVkIGJlaGF2aW91ciwNCj4gYW5kIG1pZ2h0IGJlIGJldHRlciBw
bGFjZWQgYSBiaXQgdXAgYWZ0ZXIgUEhZU0RFVk9QX3JlbGVhc2VfbXNpeC4NCkkgd2lsbCBhZGQg
c29tZSBjb21tZW50IGFuZCBtb3ZlIGl0IGNsb3NlciB0byBQSFlTREVWT1BfcmVsZWFzZV9tc2l4
IGluIG5leHQgdmVyc2lvbi4gVGhhbmsgeW91Lg0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQot
LSANCkJlc3QgcmVnYXJkcywNCkppcWlhbiBDaGVuLg0K

