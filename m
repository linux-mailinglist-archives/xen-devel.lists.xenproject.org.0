Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02037FE94F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 07:44:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644412.1005366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8amX-0002Xz-IG; Thu, 30 Nov 2023 06:44:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644412.1005366; Thu, 30 Nov 2023 06:44:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8amX-0002Vf-F9; Thu, 30 Nov 2023 06:44:17 +0000
Received: by outflank-mailman (input) for mailman id 644412;
 Thu, 30 Nov 2023 06:44:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfjJ=HL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r8amW-0002VY-DL
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 06:44:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfc58eca-8f4b-11ee-98e4-6d05b1d4d9a1;
 Thu, 30 Nov 2023 07:44:14 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by DS0PR12MB7874.namprd12.prod.outlook.com (2603:10b6:8:141::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Thu, 30 Nov
 2023 06:44:08 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 06:44:08 +0000
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
X-Inumbo-ID: dfc58eca-8f4b-11ee-98e4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnIP/Gi26Nrwv1qNrx84hAZs29w0sd0i+JdeFvVFYXFwzNY3daVYVDTm5O1LL2GLj3rzvC4LuDUbUBuL/KxAyDboCYDDvv3etE9lWvgpo82hLK+SzmboLcOTOp9WJhrtMloD4vKs3leuLKm0sjbbw3Fvi1H335WkGDBeeXefVx9D46nam9fubYoDKdWXLHCCkYN6YX4uzhFIGM+8vta8A2YCaYssKZUixoEEr8mlSFRuWzdgZQ3K1wx+3Z3/34eeGtn6+/vE2J33nqLGCEymomF+RO2AwTr83b4qY+8Jd5r6XxvZivrd70rJ5sDQoI4v77rv9zM2gppb9FPpfka+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UlZF+jGCmRkN4zsxWcBMVXQQdD3ujz4au5mFuhMnm+c=;
 b=KvIL8QtL0qrzXEZCVrhbXtEP5PJca8BnhPVOesQ1fJ7VMXRTR8LefHm4MbW8ZAqbvAZtcH8QWfu2Fgem2zjFzzBrf6S+4sBO/gPKohbErJ8m5Zt/b8Kb6ydZw/lx3nLSwtrycpFomKrXkgsNmNBmMIO2+XnwuUizkbxMAq5BPW8oTWvcqe963+Jal3NW3bg4ZgxOFYnCDtmA77IPl817dPYgtkfaIZBZkbVF3hq58RwQYhUZ286gNY6L2IQIPFY6q2NM2nEn+1tGcwLLtBIglFzuoA8PshZ9oCDK8453cMasPkRGXIWf7IcL1NO1lK6dRjBA/dxZHUyqTlwSYaq51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlZF+jGCmRkN4zsxWcBMVXQQdD3ujz4au5mFuhMnm+c=;
 b=TH0J6FdmDLOJH99lnOIeJNZu2lkrBPo/+XzWS8fzhK1CfziUAK8+ywGCDulrxredCnn/WOB8bV+JRpHUN13I7nZ2A3UqQhFnT/GESM+3mDBMnEVl/XG4V+d4OtwaPSIqtOya95u5KcYNIG6qCU54nmh9uCWO/07JaQ0w8z3gXXw=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>, "Deucher, Alexander"
	<Alexander.Deucher@amd.com>, "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>, "Huang, Ray"
	<Ray.Huang@amd.com>, "Huang, Honglei1" <Honglei1.Huang@amd.com>, "Zhang,
 Julia" <Julia.Zhang@amd.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Thread-Topic: [RFC XEN PATCH v2 2/3] x86/pvh: Open PHYSDEVOP_map_pirq for PVH
 dom0
Thread-Index: AQHaHsLnjKJ102tGrkSg9na/6oLNI7CP3bYAgAMYyIA=
Date: Thu, 30 Nov 2023 06:44:08 +0000
Message-ID:
 <BL1PR12MB5849B37472F195417B301A1EE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-3-Jiqian.Chen@amd.com>
 <fe8ee91c-7272-4cb9-b7a6-cb6ec7945bc1@suse.com>
In-Reply-To: <fe8ee91c-7272-4cb9-b7a6-cb6ec7945bc1@suse.com>
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
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|DS0PR12MB7874:EE_
x-ms-office365-filtering-correlation-id: 39027796-0b0b-4588-dddf-08dbf16fc103
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 g58n1HAf8TwemRB2jF86EIl5197iTNlB3YIC+IDJM32hIaQCdjOjSjT8eN8gqxb7L/1mpk96V/jt6CRKmms7ijdpcxeIKRbTlwEUr28ZaNlKT36C08m5ONL3l6ICeXKmDIIDD9VeFxferPuPyImK3VctcnNDTBXwf1egA+vJoHyyV+JNt6CbEL6guEh70JBTC8wT8W4aoQKAWdMiOwB9Pz5ZW7z/K/tzhU7GPI+yEpisQu9Lau6K12kU59YjSu5zrbIQ90E47by2H7XHrSQ3w6Jl3+KkJ3lZzS02jlnhog2TiKGyLxGkbKwl5GSMxS0hp3PY5LIeWvBFwMUCSVzm5UFyyqWXpdA52V6F+z79MSp2WhJZqxYQGfcSg6F00N0s8Ojo3SLAe1MOgfTmXdQ6s/xCVy0Mf2vV7VbbZ/h7035fUZ9MZE3BFUvgdpWGscXzRdHRXKACVKeWh8vjbpmS5V73pDCJACGh9RbjO7mKZcGJ+2wXqEemXDGNrOkBP45nzgJs7baCiPcvI+Np8S9KDRcGIpzfzeYLQ/VWbx0QNvzgficpD+NwWkYA4k57tO5ciwEOAyu35uawPoGoXGeG17b0FAcGpF6q6F70+p5f3cWr2I4Wine0zcfO9PGzvvDZ9kzMDFRXtIUp49hVaAJ0yQ5Vv8RuYNVhTe+EPTfTLWAZrt7BMc8SoqSizNPSwdy9
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(396003)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(55016003)(38100700002)(202311291699003)(6916009)(122000001)(83380400001)(8936002)(52536014)(2906002)(4326008)(8676002)(5660300002)(316002)(76116006)(54906003)(64756008)(66446008)(66946007)(66556008)(66476007)(41300700001)(4744005)(33656002)(53546011)(7696005)(6506007)(71200400001)(478600001)(9686003)(26005)(38070700009)(340984004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?THFjbzlBY2lHSWR0eGRsbHVXa282S3AybmlaVFgwWmRaamV0Z1lUY1NKUFc2?=
 =?utf-8?B?dENRamo0WDlJY2NMUlJ0S2t2aXA4QXBlanpTT2Z2c0thc0NpdmhnaFVuRzky?=
 =?utf-8?B?eVZ1RVRhVDBXdkxwQ2o3aDdxZTk2V2NQK2N3dnNyZnVPV0pGd2JNUzE3ckZy?=
 =?utf-8?B?TGNVNkYzbGtPNE9FMzZHVDlQcVc4YkpROGVRZG5NcDRMeXdYZkMxSkZtclRn?=
 =?utf-8?B?Smw1Ymg5SUEyZ25xelkwV09JTFdQNEdyUjBwT3ROTGFoakkxbGpRcE1zV2ZZ?=
 =?utf-8?B?YkZ1My9lTXJSc1RPUVdxR2NTT3BRQWJCQW1vbVRUUWhISkE5S1BKUkFEMkNI?=
 =?utf-8?B?czQ1YUt3MlFva1cvcXdaZVBJV1kwUXNlV0k1cGRndmZERVpvakpFWVg2OWFt?=
 =?utf-8?B?RnNxQW10Q2Ywd01kZjgxUDRrZWtGejVJS2ZmVE4yNHJwTFRIdXZOUyt1TnFK?=
 =?utf-8?B?eFJYZmZBRURNMVBSS1dOZVdndzI1cE1CWWwxdWNLN3VBclZUUTI5eTQ0RHBE?=
 =?utf-8?B?NW9MeWE5Z2o2eHVLMCt3dGFkdElQTUhRQm9rcXlaYTNxVkF1bmdhNVR1WExL?=
 =?utf-8?B?bkJ1TzMzb2h5cW55clZQWEwxTXdQVnUvMEE3WEo5WW4wODZXbWdWRFlNUUJi?=
 =?utf-8?B?WG00TFZ6N3ErVmRtL0VuTlp2c1BTUEFuTmVPWFFSWVhJdzJPcU1FN3E2Wm40?=
 =?utf-8?B?aFEzOGxXRkpzRnIwTTczVmNEYmkrOStNelMvYk95cEN5Y0RDL241TlNROTg1?=
 =?utf-8?B?bHora1BQWjRRYi9oUWtWNXJLSU9DcjZEU2ZMQTFNbHN1cDkxY1VLSlVtSzMz?=
 =?utf-8?B?MVRGZDYwSVcvWjdYNWZ5MEd2QjlsUURTTkVpZHVOak4wMmlrYkovTDY5ZU04?=
 =?utf-8?B?VFdvOE1lRW9PT3F0MlBnQ3hRL0ZiSVluMTVud0ljS3hmdHdNaHZjdkxHQ0tk?=
 =?utf-8?B?bnNZcGZNZlBLbG5SV3JlZU5aL3FRd3JJMWhITGRxU0IwTklUdTBMdlQzUnZu?=
 =?utf-8?B?U3AycUl1MnR2RkE5TzdEWTZvNCtsZWV6Vmlrb09tbDZjWlNBR09tUHZuRW9n?=
 =?utf-8?B?RVcyRElwc1dYd1pjNEZ1YjU3endvY2lVR1FNSDVDY21PMGw5U0w3NlJSaksv?=
 =?utf-8?B?b25QVVBvSEpiR2U3VE81cE5zVFhHdG9jSTF2UnpMS0ozc0grUG1WbTYyNVI5?=
 =?utf-8?B?WFI4VU9Qcy9NTHE1WlFEbVFxbXRaRCtPZzFoVncxMGVxZjdWMisrVUhyZy9l?=
 =?utf-8?B?UDBheXIzeHdaYXIvb2xGRVJ5NzRUd0FydHdzUys4WTI5VmVCSnZPSTNpQzBK?=
 =?utf-8?B?SEZEeEkyeUI4ZVpqZjFVbkZQbFVzWnViV1hpODM0cWhxSFBOQlR6NWlqNDZ5?=
 =?utf-8?B?ZzJPdFI3ZUFkU1NHdTd3cE1nWjh0Z2UweWVNdDdiTEpKTnR3Y29ZVGo2blVI?=
 =?utf-8?B?YVBzTVJ1bjEyakJuY3F6OGJvNUFXbUJSOUxXTzM2Q3cxQ3p1bXZ3akY5elN0?=
 =?utf-8?B?NkJPREFrS3FyUC8wRThkTVRITGtEaGlzai96RkxoQWVvZk9jSjV6MlNQOU50?=
 =?utf-8?B?L0lXZEkvSkp0QktBVG9JVDBaTjA4R0RHUnZoTStpbHZ2cFIvbHEzemlKTjRk?=
 =?utf-8?B?SjJETEdLL0ZEVGJObDRsVVc1ZitMbFZEdDBhdkJaSjAyRWdVakZnbW5DUDN6?=
 =?utf-8?B?cnJtODB0RjhzRHF6MHNuSXdoTW9tOTJqOERPQ1hvRHJubTNJeHhCcEJUWGEw?=
 =?utf-8?B?a3FtK2pJajBnS2J2UFVrNlVtRkZ2Y3RUaTA3ZTFUU29vc05VSkdiRko2alhr?=
 =?utf-8?B?ZDBVdTVybzdDK0FoL1N1dmowdzBKeVg5MmRwTTBwQkVNLzllOC93RnpDTlVa?=
 =?utf-8?B?T1hpVmZsRHllSGcwbEZQT0pqKy9abFh6bDB4bHBoY2d3VDFSWG9VeHdsY0Mz?=
 =?utf-8?B?SFNCbFpxOUhBVVdyZGxjcGN6by9mWVRjcWpHb0NJS2ZIeko4ZHF0eWh1MWZB?=
 =?utf-8?B?NDlydjdKVXkzQ3FpdzhPb2F6Ri9mamJvT1V0Z0JVR2xwY0ZSN1pUYTVtdmdC?=
 =?utf-8?B?MEpFbVFlMkFqVE95L3B5QmdwVHFPL05Tb1huQjNzcFdqNlJjZ2luVGNmemV0?=
 =?utf-8?Q?KnII=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17C23EA9D5A60C4F91B4D90611B8C04C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39027796-0b0b-4588-dddf-08dbf16fc103
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 06:44:08.4561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q5aIDDS7WtEpAvrvU9gQ8wGe4DO1OqKQrWN6GVF565+kI4hUrAsxqA8EpbHDOaHavwCmF1wcSLf4W9V3txuw7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7874

DQpPbiAyMDIzLzExLzI4IDIzOjE0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjQuMTEuMjAy
MyAxMTo0MSwgSmlxaWFuIENoZW4gd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL2h5
cGVyY2FsbC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2FsbC5jDQo+PiBAQCAt
NzQsNiArNzQsOCBAQCBsb25nIGh2bV9waHlzZGV2X29wKGludCBjbWQsIFhFTl9HVUVTVF9IQU5E
TEVfUEFSQU0odm9pZCkgYXJnKQ0KPj4gICAgICB7DQo+PiAgICAgIGNhc2UgUEhZU0RFVk9QX21h
cF9waXJxOg0KPj4gICAgICBjYXNlIFBIWVNERVZPUF91bm1hcF9waXJxOg0KPj4gKyAgICAgICAg
aWYgKGlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZCkpDQo+PiArICAgICAgICAgICAgYnJlYWs7DQo+
PiAgICAgIGNhc2UgUEhZU0RFVk9QX2VvaToNCj4+ICAgICAgY2FzZSBQSFlTREVWT1BfaXJxX3N0
YXR1c19xdWVyeToNCj4+ICAgICAgY2FzZSBQSFlTREVWT1BfZ2V0X2ZyZWVfcGlycToNCj4gDQo+
IElmIHlvdSB3b3VsZG4ndCBnbyB0aGUgcm91dGUgc3VnZ2VzdGVkIGJ5IFJvZ2VyLCBJIHRoaW5r
IHlvdSB3aWxsIG5lZWQNCj4gdG8gZGVueSBzZWxmLW1hcHBpbmcgcmVxdWVzdHMgaGVyZS4NCkRv
IHlvdSBtZWFuIGJlbG93Pw0KaWYgKGFyZy5kb21pZCA9PSBET01JRF9TRUxGKQ0KCXJldHVybjsN
Cg0KPiANCj4gQWxzbyBub3RlIHRoYXQgYm90aCBoZXJlIGFuZCBpbiBwYXRjaCAxIHlvdSB3aWxs
IHdhbnQgdG8gYWRqdXN0IGEgbnVtYmVyDQo+IG9mIHN0eWxlIHZpb2xhdGlvbnMuDQpDb3VsZCB5
b3UgcGxlYXNlIGRlc2NyaXB0IGluIGRldGFpbD8gVGhpcyB3aWxsIGdyZWF0bHkgYXNzaXN0IG1l
IGluIG1ha2luZyBtb2RpZmljYXRpb25zIGluIHRoZSBuZXh0IHZlcnNpb24uIFRoYW5rIHlvdSEN
Cg0KPiANCj4gSmFuDQoNCi0tIA0KQmVzdCByZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

