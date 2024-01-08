Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FAC826774
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 04:44:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663166.1032980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMgXn-0004gP-Ci; Mon, 08 Jan 2024 03:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663166.1032980; Mon, 08 Jan 2024 03:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMgXn-0004di-9H; Mon, 08 Jan 2024 03:43:19 +0000
Received: by outflank-mailman (input) for mailman id 663166;
 Mon, 08 Jan 2024 03:43:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xshC=IS=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1rMgXl-0004dc-3c
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 03:43:17 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0c02c803-add8-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 04:43:12 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CY8PR12MB7492.namprd12.prod.outlook.com (2603:10b6:930:93::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 03:43:07 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 03:43:07 +0000
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
X-Inumbo-ID: 0c02c803-add8-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVDfuppuhexacu5DBKn1lNIqKydcdZ74Ic5rItk5GrBqJCoCrhqbwxGqKDDyctU+Qm9xHPfr8yc4Qe9hjuZjBE22y1VLpdeJXpZwKz0DTk5vDrz6vUIJ/s8It2KAvzG/V37OI1KTxZTPqHL26b7dQmiJuZKpc+IfwsXj6p/8jQMiw2GWsZ2GJixRyqsl3dQgoEWta9ymfHoXco0DITB2fkasn0g/RnfbN21xMLNAXjWli6V/x34bg0wDINeWK9eeeDoKGQJuAev8hLCXZPsXuGgSjIqiUhjH+/ZwMPKf03RHBEdogjz8btQp3UexhGdyOFGi3zaQwu+xhWVnPJk34A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xqksTUSzR55SLCvYStR1yuGqyX5ZIHREY25bX253Koc=;
 b=QZYLyg57bKkE298VTGG6mSGxuUNU+5QfJYwn75WeLuaA+ZjiJYtjZRB5G0AQOmdL9kWYsiIVFIXijz8q82hTHH9677/a+fYaipU8PwrUHOK7DwZXsVb9Z4MgwFOeZlW0YcSFMqEODuyf/xQRqRATfofKsrffEvb5r0o9cfeOPE6yuYAHOATI7S/HJLMmbvjOAlr/b62dJ/HrtozQxghEahvkavX5Z53Y0mPUz5ZbduEDOSk4iYf04guoBZoLz8jWPtiZgjodYaUVoLHjiC4YFIYK2LQlE7wn32fKxmxxr/0NryQ8s6WCY2QRi3N4GbjP3q0oceBI405LKE4M0CRJYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xqksTUSzR55SLCvYStR1yuGqyX5ZIHREY25bX253Koc=;
 b=O1uztZY5G9M+Ld1QyUW7QgtVMdBqcnIttG7OfUNxeook7a1xDLd40SPiaT8KLR+G0JxhZ1+JjmsAsCLZkgLR1jdYJmfNQK7cH/d05jRi8wMI/D9UTtbZ7tkXHQbx/yoq//FOWkLZzSW37hiTm7ISBdxWoIfjvw2q1H7+5fKMsUw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	"Huang, Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Thread-Topic: [RFC XEN PATCH v4 4/5] domctl: Use gsi to grant/revoke irq
 permission
Thread-Index: AQHaP6Y1pt0ckfKChE+VsjXCWSj8+LDL+oWAgAPTiYA=
Date: Mon, 8 Jan 2024 03:43:07 +0000
Message-ID:
 <BL1PR12MB58490A4BEDC08F227BFE2723E76B2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240105070920.350113-1-Jiqian.Chen@amd.com>
 <20240105070920.350113-5-Jiqian.Chen@amd.com>
 <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2401051702200.3675@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: IA0PR12MB8932.namprd12.prod.outlook.com
 (15.20.7181.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CY8PR12MB7492:EE_
x-ms-office365-filtering-correlation-id: a3dd2184-0dc5-4982-21ca-08dc0ffbed78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 vl38y3msQ/cWA7/igg3T/XuXsQcrqLUXztRIDNY2Up7eFzzHXFl6xAy9gNBHOCBJUx5Zsr8hKecPNJzWHkGt5toF8T7F05gSxIIEojIGH7882jxYlSZjHpvaffkT63fWB92WinzZNKdAEijGa9M1+e5UynTRfVApQu67pPMX255KntedCPrYDbiBDw1fuGMUf8zcqQm71V3ePbI9/svByPPpniCVesOl92yZPQYsyO8nQiCqEgLLNuQVTHvQ/4GiAe1+QwWCyni8mWsjCaoid6LyV5V9o2FE6pgEx4IstoZChKU/EKEEX2yr0jR8SFp0koRI5wOK2nAwvL6S2Yvx5iN4YaHtdSz/8L5icQXEBpllEAOU6JUYByzIkV14fWOdduS6U89tTYIRJcp2FUouj/3dz3CiRGIkY829AThpJYBPBzgaX80UtVXh0fL0iCFntMnUkDVdhodHCUQzRYPb/YnWlGiycbL/b18x50FOKQJI4PxndQXQP+xwjrYlVaOXRI7SuBtrgRjk3V1cW9QpJfCyYEgi3w4hwSmEqrewI8Jf03PM1wsQIyrevJX31Ruq8/UPAZ3PBnrB7aL/BJ0RyO+fbDr0/UAi2aRppi85pvNtjhSUoo7J7WAeq39ivR1j
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(346002)(136003)(396003)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(41300700001)(8676002)(8936002)(55016003)(38070700009)(5660300002)(7416002)(2906002)(26005)(6916009)(64756008)(66446008)(66556008)(52536014)(66476007)(54906003)(316002)(66946007)(76116006)(71200400001)(478600001)(9686003)(83380400001)(33656002)(53546011)(6506007)(7696005)(38100700002)(122000001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MjBQNnIreFhSS2dkdCtDVXlLUDdLaTgwbDRoU095b3d2RWdMdU1IRHBoc0ZR?=
 =?utf-8?B?QkVjR1BTbzlQbEdPM3NHYXlyVjYwT1lBdWIvSmIwdFZrRW5yQ1FETU12VUE4?=
 =?utf-8?B?em53dHAwcXFBSSsyVkcwZ3htcmtuKzNJTEZITG1tOWlscGszdmltMXpLQjc0?=
 =?utf-8?B?UkpDa1ZycTlybFdxd3BYM1NUMU9scW5VM0ttVTl4NWpVTkhhRnl5Tk1yL000?=
 =?utf-8?B?bmV1K0I2aHFaWmlqZXJTK20zdUJmWFcyK3FDVWVRZUozVUxlMXk2Z2wza1l5?=
 =?utf-8?B?YXROUEtKZzB3eTU3aXc2QzhlUkgrUmM4RWR1a08yMXBSWVgvWk5nWUdHL0Zq?=
 =?utf-8?B?SGlzeUlUeEZtcUo1dXlwNC84dnF4am14aW92ZitpYU5GTWlmWVVnTmN0ODFN?=
 =?utf-8?B?T0Q2a0NTMHhjc1RZcisrMHRxWFhLVFlyYmFIanlBZ01ZY3lnOGNPSVUzZnFz?=
 =?utf-8?B?VWkrdHhNcnZ1cVVVc0xaSXFhanhnQTdPUk5LZjVJbjdqNE5iZjd2cDFDanBL?=
 =?utf-8?B?MXRpK3VpYWpTdmJCb3I0RzUzS2VyT1FLZTBJdkVVVHZpZzZQODUzS3h5ZStr?=
 =?utf-8?B?SytTMzRHTG53a0F4cVF2RmdRMHFCOWF5WXMzU1A4RnFqbGtwRWNXQ1Qrd2c5?=
 =?utf-8?B?dFhyN1dHeW11dmphWExEeXF6OVlzOUdUMmhYTzdRNWlhRnd6UGlDeVptM2Rj?=
 =?utf-8?B?dXFpUnY4QTh6bDFZZnlwMExGVjlucHhwV2hlUnhZc3RnK2dWb08xcjZmS1FS?=
 =?utf-8?B?RVhpdmlXOFN1MHZRVHBWejM2TzlILzRBeTJqQ09mTXNuTXI3VVhLRTRKOGkv?=
 =?utf-8?B?dlFKUXpsUFVWUkFHbk9VOTl4ZXh1UVozS0lLY0NSNWI1K29WcHdpWG1QOUxM?=
 =?utf-8?B?Z205VHd0VVVpQi9ranBwSVQwYXhETEtJQXpZbTZMMnhTaDdjSituU2w2aUhk?=
 =?utf-8?B?aW12dkdVVW5ZblBXQkxQMktOTkM1ZjZudk82eVF4YVdaSmlacVNzY1pJeWp1?=
 =?utf-8?B?RFF4RnBhOG1ZTUp4Yk9UZFBOS1lBdDJDSTlXYU1TRjJEdnFYTlpkVzZiY2FX?=
 =?utf-8?B?NGZJM0FrYWdlQmJaYmovN3JWNnpSY3dsSzR3Sm5wWklVSkNDcHgzeWpDZXU1?=
 =?utf-8?B?QXllVlpkUnJFV3JLTFJXWE1MVUpXeGI0QkIvWkZhWk1sdEdlaFEvaExLbU12?=
 =?utf-8?B?ZGd4V1RYcjhLbmJNc3IvUUhSN0JBR0w4ZXkrVUdIYVNIaFlqTmpoaVo5WXA1?=
 =?utf-8?B?ZU81WlRwWGw2RGJnQi9QMHdrRVMyYnNNUTdZZG1ESGIxSFphc1FaemRwSWU1?=
 =?utf-8?B?a09ITVREZkQ0MWV4N0RMSll0enY1N3E1cmhYcHVXR1g2VytwbDVrMDFxTy8v?=
 =?utf-8?B?d0o2UGJLa2I4RVd0czNYUTYreHc1MGRPa2hiS3IyeE1RZ0doYnJ6ejNvR2RZ?=
 =?utf-8?B?ZWdOS2dWV1RKRFN4UmtRRVFJL1R1c2l2TXRKcngwOWIzaGIvUWNtNnJocDRK?=
 =?utf-8?B?cThqR0ZmSm9lR3FDaUZJUjFQTHVWdEdLWWovVTZxenBXT2RXWk9ldTZpV1Nl?=
 =?utf-8?B?YUxLVytSdWtSc2pRaGRtOHZBYzZ5bHNya1RlR2h5THN5bk5LMkRrYWZOUXIx?=
 =?utf-8?B?Y3djZWg3WXE1a0lQQ0crRnd6b0JkR1dQNG1yTU4yeCtkZDZueXBTdkhwYXRI?=
 =?utf-8?B?aFkxc29Scm12a1Y5WExlaGNsWWRsd1dMYmtXelJ6NmJDeUNJamhuUWE0Tnp1?=
 =?utf-8?B?M1NpUTFEdnoyT2pYK3ptTFVTclFCdEJ5R0ZpNHdvdWRldDA0eExLU25ubTJ4?=
 =?utf-8?B?OUxTYmxzQU0zZTV5MTRZN1l0K3IyeGN0eHpqOWluMDRBYlk1bzF1Wk9vclM0?=
 =?utf-8?B?THFaUGlmMTc5UUFHS01hVzBZSUFpN0hOaE1odzlKUEVRUTJHcDFSczdxdCtj?=
 =?utf-8?B?WlpwTmhCWXkyaGNuWlpxMmVVRUwyK2pZM2Z5QmhwY0xlemNIZDl1Nlp4U3FI?=
 =?utf-8?B?bU5mN1QwUlVMc1k3RVZjTGNJZVNoZWs0R3lwRlFQVVBkYTJ6aHdkREY0T0xt?=
 =?utf-8?B?NytVeXYxanlJRHJVSHBFM2VVdFZqNnUwNGx4Rzd1L1pIZGtHZEtYM3ErcHN2?=
 =?utf-8?Q?B9dw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5717CD73822604DA59134712473A9B3@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3dd2184-0dc5-4982-21ca-08dc0ffbed78
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2024 03:43:07.4885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dULiU18F2plgo5QBZoWgZ5vqliS5t3eKSFWUBmkCZ0lFVMzqexTjRhj4EMYlRXxU1CE24PMG0Ycbx3DYvQYHBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7492

T24gMjAyNC8xLzYgMDk6MDgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24gRnJpLCA1
IEphbiAyMDI0LCBKaXFpYW4gQ2hlbiB3cm90ZToNCj4+IFNvbWUgdHlwZSBvZiBkb21haW4gZG9u
J3QgaGF2ZSBQSVJRLCBsaWtlIFBWSCwgY3VycmVudA0KPj4gaW1wbGVtZW50YXRpb24gaXMgbm90
IHN1aXRhYmxlIGZvciB0aG9zZSBkb21haW4uDQo+Pg0KPj4gV2hlbiBwYXNzdGhyb3VnaCBhIGRl
dmljZSB0byBndWVzdCBvbiBQVkggZG9tMCwgdGhpcw0KPj4gcGNpX2FkZF9kbV9kb25lLT5YRU5f
RE9NQ1RMX2lycV9wZXJtaXNzaW9uIHdpbGwgZmFpbGVkDQo+PiBhdCBkb21haW5fcGlycV90b19p
cnEuDQo+Pg0KPj4gU28sIGNoYW5nZSBpdCB0byB1c2UgZ3NpIHRvIGdyYW50L3Jldm9rZSBpcnEg
cGVybWlzc2lvbi4NCj4+IEFuZCBjaGFuZ2UgdGhlIGNhbGxlciBvZiBYRU5fRE9NQ1RMX2lycV9w
ZXJtaXNzaW9uIHRvDQo+PiBwYXNzIGdzaSB0byBpdCBpbnN0ZWFkIG9mIHBpcnEuDQo+Pg0KPj4g
Q28tZGV2ZWxvcGVkLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPg0KPj4gU2lnbmVk
LW9mZi1ieTogSmlxaWFuIENoZW4gPEppcWlhbi5DaGVuQGFtZC5jb20+DQo+IA0KPiBJIHJlYWxp
emUgdGhlcmUgaXMgbm8gZXhwbGFuYXRpb24gb3IgY29tbWVudCByaWdodCBub3csIGJ1dCBJIHRo
aW5rIHRoaXMNCj4gY2hhbmdlIHdvdWxkIGJlbmVmaXQgZnJvbSBhIGluLWNvZGUgY29tbWVudCBp
biB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgNCj4gRS5nLjoNCj4gDQo+IC8qIFhFTl9ET01D
VExfaXJxX3Blcm1pc3Npb24gKi8NCj4gc3RydWN0IHhlbl9kb21jdGxfaXJxX3Blcm1pc3Npb24g
ew0KPiAgICAgdWludDMyX3QgcGlycTsgICAgICAgICAgIC8qIHBpcnEgaXMgdGhlIEdTSSBvbiB4
ODYgKi8NCj4gICAgIHVpbnQ4X3QgYWxsb3dfYWNjZXNzOyAgICAvKiBmbGFnIHRvIHNwZWNpZnkg
ZW5hYmxlL2Rpc2FibGUgb2YgSVJRIGFjY2VzcyAqLw0KPiAgICAgdWludDhfdCBwYWRbM107DQo+
IH07DQpXaWxsIGFkZCB0aGlzIGNvbW1lbnQgaW4gbmV4dCB2ZXJzaW9uLCB0aGFua3MuDQoNCj4g
DQo+IA0KPj4gLS0tDQo+PiAgdG9vbHMvbGlicy9saWdodC9saWJ4bF9wY2kuYyB8ICA2ICsrKyst
LQ0KPj4gIHRvb2xzL2xpYnMvbGlnaHQvbGlieGxfeDg2LmMgfCAgNSArKysrLQ0KPj4gIHhlbi9j
b21tb24vZG9tY3RsLmMgICAgICAgICAgfCAxMiArKysrKysrKysrLS0NCj4+ICAzIGZpbGVzIGNo
YW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMgYi90b29scy9saWJzL2xpZ2h0L2xpYnhs
X3BjaS5jDQo+PiBpbmRleCA5NmNiNGRhMDc5NGUuLmUxMzQxZDFlOTg1MCAxMDA2NDQNCj4+IC0t
LSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfcGNpLmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMvbGln
aHQvbGlieGxfcGNpLmMNCj4+IEBAIC0xNDE4LDYgKzE0MTgsNyBAQCBzdGF0aWMgdm9pZCBwY2lf
YWRkX2RtX2RvbmUobGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICB1bnNpZ25lZCBsb25nIGxvbmcg
c3RhcnQsIGVuZCwgZmxhZ3MsIHNpemU7DQo+PiAgICAgIGludCBpcnEsIGk7DQo+PiAgICAgIGlu
dCByOw0KPj4gKyAgICBpbnQgZ3NpOw0KPj4gICAgICB1aW50MzJfdCBmbGFnID0gWEVOX0RPTUNU
TF9ERVZfUkRNX1JFTEFYRUQ7DQo+PiAgICAgIHVpbnQzMl90IGRvbWFpbmlkID0gZG9taWQ7DQo+
PiAgICAgIGJvb2wgaXNzdHViZG9tID0gbGlieGxfaXNfc3R1YmRvbShjdHgsIGRvbWlkLCAmZG9t
YWluaWQpOw0KPj4gQEAgLTE0ODYsNiArMTQ4Nyw3IEBAIHN0YXRpYyB2b2lkIHBjaV9hZGRfZG1f
ZG9uZShsaWJ4bF9fZWdjICplZ2MsDQo+PiAgICAgICAgICBnb3RvIG91dF9ub19pcnE7DQo+PiAg
ICAgIH0NCj4+ICAgICAgaWYgKChmc2NhbmYoZiwgIiV1IiwgJmlycSkgPT0gMSkgJiYgaXJxKSB7
DQo+PiArICAgICAgICBnc2kgPSBpcnE7DQo+IA0KPiBBIHF1ZXN0aW9uIGZvciBSb2dlciBhbmQg
SmFuOiBhcmUgd2UgYWx3YXlzIGd1YXJhbnRlZWQgdGhhdCBnc2kgPT0gaXJxDQo+IChhbHNvIGlu
IHRoZSBQViBjYXNlKT8NCj4gDQo+IEFsc28gSSBkb24ndCB0aGluayB3ZSBuZWNlc3NhcmlseSBu
ZWVkIHRoZSBnc2kgbG9jYWwgdmFyaWFibGUsIEkgd291bGQNCj4ganVzdCBhZGQgYW4gaW4tY29k
ZSBjb21tZW50IGJlbG93Li4uDQpIZXJlIHBhc3MgdGhlIHBvaW50ZXIgb2YgaXJxIHRvIHhjX3Bo
eXNkZXZfbWFwX3BpcnEsIGFuZCB0aGF0IGZ1bmN0aW9uIHdpbGwgYXNzaWduIHRoZSB2YWx1ZSBv
ZiBwaXJxIHRvIGlycSBvbiBYZW4gc2lkZSwgc28gYWZ0ZXIgY2FsbGluZyB4Y19waHlzZGV2X21h
cF9waXJxLCB0aGUgdmFsdWUgb2YgaXJxIGlzbid0IHRoZSBvcmlnaW5hbCB2YWx1ZSwgd2UgbmVl
ZCBhIGxvY2FsIHZhcmlhYmxlIHRvIHJlY29yZCB0aGUgb3JpZ2luYWwgdmFsdWUuDQoNCj4gDQo+
IA0KPj4gICAgICAgICAgciA9IHhjX3BoeXNkZXZfbWFwX3BpcnEoY3R4LT54Y2gsIGRvbWlkLCBp
cnEsICZpcnEpOw0KPj4gICAgICAgICAgaWYgKHIgPCAwKSB7DQo+PiAgICAgICAgICAgICAgTE9H
RUQoRVJST1IsIGRvbWFpbmlkLCAieGNfcGh5c2Rldl9tYXBfcGlycSBpcnE9JWQgKGVycm9yPSVk
KSIsDQo+PiBAQCAtMTQ5NCwxMCArMTQ5NiwxMCBAQCBzdGF0aWMgdm9pZCBwY2lfYWRkX2RtX2Rv
bmUobGlieGxfX2VnYyAqZWdjLA0KPj4gICAgICAgICAgICAgIHJjID0gRVJST1JfRkFJTDsNCj4+
ICAgICAgICAgICAgICBnb3RvIG91dDsNCj4+ICAgICAgICAgIH0NCj4gDQo+IC4uLiBsaWtlIHRo
aXM6DQo+IA0KPiAvKiB4Y19kb21haW5faXJxX3Blcm1pc3Npb24gdGFrZXMgYSBnc2ksIGhlcmUg
d2UgYXNzdW1lIGlycSA9PSBnc2kgKi8NCj4gciA9IHhjX2RvbWFpbl9pcnFfcGVybWlzc2lvbihj
dHgtPnhjaCwgZG9taWQsIGlycSwgMSk7DQpXaWxsIGFkZCB0aGlzIGNvbW1lbnQgaW4gbmV4dCB2
ZXJzaW9uLCB0aGFua3MuDQoNCj4gDQo+IA0KPj4gLSAgICAgICAgciA9IHhjX2RvbWFpbl9pcnFf
cGVybWlzc2lvbihjdHgtPnhjaCwgZG9taWQsIGlycSwgMSk7DQo+PiArICAgICAgICByID0geGNf
ZG9tYWluX2lycV9wZXJtaXNzaW9uKGN0eC0+eGNoLCBkb21pZCwgZ3NpLCAxKTsNCj4+ICAgICAg
ICAgIGlmIChyIDwgMCkgew0KPj4gICAgICAgICAgICAgIExPR0VEKEVSUk9SLCBkb21haW5pZCwN
Cj4+IC0gICAgICAgICAgICAgICAgICAieGNfZG9tYWluX2lycV9wZXJtaXNzaW9uIGlycT0lZCAo
ZXJyb3I9JWQpIiwgaXJxLCByKTsNCj4+ICsgICAgICAgICAgICAgICAgICAieGNfZG9tYWluX2ly
cV9wZXJtaXNzaW9uIGlycT0lZCAoZXJyb3I9JWQpIiwgZ3NpLCByKTsNCj4+ICAgICAgICAgICAg
ICBmY2xvc2UoZik7DQo+PiAgICAgICAgICAgICAgcmMgPSBFUlJPUl9GQUlMOw0KPj4gICAgICAg
ICAgICAgIGdvdG8gb3V0Ow0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxf
eDg2LmMgYi90b29scy9saWJzL2xpZ2h0L2xpYnhsX3g4Ni5jDQo+PiBpbmRleCBkMTY1NzNlNzJj
ZDQuLjg4YWQ1MGNmNjM2MCAxMDA2NDQNCj4+IC0tLSBhL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxf
eDg2LmMNCj4+ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfeDg2LmMNCj4+IEBAIC02NTQs
MTIgKzY1NCwxNSBAQCBvdXQ6DQo+PiAgaW50IGxpYnhsX19hcmNoX2RvbWFpbl9tYXBfaXJxKGxp
YnhsX19nYyAqZ2MsIHVpbnQzMl90IGRvbWlkLCBpbnQgaXJxKQ0KPiANCj4geW91IGNvdWxkIGp1
c3QgcmVuYW1lIHRoZSBpbnQgaXJxIHBhcmFtZXRlciB0byBpbnQgZ3NpID8NCk5vLCB0aGUgc2Ft
ZSByZWFzb24gYXMgYWJvdmUuDQoNCj4gDQo+IA0KPj4gIHsNCj4+ICAgICAgaW50IHJldDsNCj4+
ICsgICAgaW50IGdzaTsNCj4+ICsNCj4+ICsgICAgZ3NpID0gaXJxOw0KPj4gIA0KPj4gICAgICBy
ZXQgPSB4Y19waHlzZGV2X21hcF9waXJxKENUWC0+eGNoLCBkb21pZCwgaXJxLCAmaXJxKTsNCj4+
ICAgICAgaWYgKHJldCkNCj4+ICAgICAgICAgIHJldHVybiByZXQ7DQo+PiAgDQo+PiAtICAgIHJl
dCA9IHhjX2RvbWFpbl9pcnFfcGVybWlzc2lvbihDVFgtPnhjaCwgZG9taWQsIGlycSwgMSk7DQo+
PiArICAgIHJldCA9IHhjX2RvbWFpbl9pcnFfcGVybWlzc2lvbihDVFgtPnhjaCwgZG9taWQsIGdz
aSwgMSk7DQo+PiAgICAgIHJldHVybiByZXQ7DQo+PiAgfQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9j
b21tb24vZG9tY3RsLmMgYi94ZW4vY29tbW9uL2RvbWN0bC5jDQo+PiBpbmRleCBmNWE3MWVlNWY3
OGQuLmVlYjk3NWJkMDE5NCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9jb21tb24vZG9tY3RsLmMNCj4+
ICsrKyBiL3hlbi9jb21tb24vZG9tY3RsLmMNCj4+IEBAIC02NTMsMTIgKzY1MywyMCBAQCBsb25n
IGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwp
DQo+PiAgICAgICAgICB1bnNpZ25lZCBpbnQgcGlycSA9IG9wLT51LmlycV9wZXJtaXNzaW9uLnBp
cnEsIGlycTsNCj4+ICAgICAgICAgIGludCBhbGxvdyA9IG9wLT51LmlycV9wZXJtaXNzaW9uLmFs
bG93X2FjY2VzczsNCj4gDQo+IGhlcmUgd2UgY291bGQgYmVuZWZpdCBmcm9tIHJlbmFtaW5nIHBp
cnEgdG8gZ3NpLCBhdCBsZWFzdCBpdCBiZWNvbWVzDQo+IGNsZWFyOg0KPiANCj4gdW5zaWduZWQg
aW50IGdzaSA9IG9wLT51LmlycV9wZXJtaXNzaW9uLnBpcnEsIGlycTsNClRoYW5rIHlvdSwgSSB3
aWxsIHJlbmFtZSBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+IA0KPj4gLSAgICAgICAgaWYg
KCBwaXJxID49IGN1cnJlbnQtPmRvbWFpbi0+bnJfcGlycXMgKQ0KPj4gKyAgICAgICAgaWYgKCBw
aXJxID49IG5yX2lycXNfZ3NpICkNCj4+ICAgICAgICAgIHsNCj4+ICAgICAgICAgICAgICByZXQg
PSAtRUlOVkFMOw0KPj4gICAgICAgICAgICAgIGJyZWFrOw0KPj4gICAgICAgICAgfQ0KPj4gLSAg
ICAgICAgaXJxID0gcGlycV9hY2Nlc3NfcGVybWl0dGVkKGN1cnJlbnQtPmRvbWFpbiwgcGlycSk7
DQo+PiArDQo+PiArICAgICAgICBpZiAoIGlycV9hY2Nlc3NfcGVybWl0dGVkKGN1cnJlbnQtPmRv
bWFpbiwgcGlycSkgKQ0KPj4gKyAgICAgICAgICAgIGlycSA9IHBpcnE7DQo+PiArICAgICAgICBl
bHNlDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcmV0ID0gLUVQRVJNOw0KPj4gKyAg
ICAgICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgfQ0KPj4gKw0KPj4gICAgICAgICAgaWYgKCAh
aXJxIHx8IHhzbV9pcnFfcGVybWlzc2lvbihYU01fSE9PSywgZCwgaXJxLCBhbGxvdykgKQ0KPj4g
ICAgICAgICAgICAgIHJldCA9IC1FUEVSTTsNCj4+ICAgICAgICAgIGVsc2UgaWYgKCBhbGxvdyAp
DQo+PiAtLSANCj4+IDIuMzQuMQ0KPj4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hl
bi4NCg==

