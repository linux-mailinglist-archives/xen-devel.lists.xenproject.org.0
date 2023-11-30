Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B6A7FEE4D
	for <lists+xen-devel@lfdr.de>; Thu, 30 Nov 2023 12:55:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644580.1005762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fdS-0000BG-To; Thu, 30 Nov 2023 11:55:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644580.1005762; Thu, 30 Nov 2023 11:55:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8fdS-00007Z-Ql; Thu, 30 Nov 2023 11:55:14 +0000
Received: by outflank-mailman (input) for mailman id 644580;
 Thu, 30 Nov 2023 11:55:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfjJ=HL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1r8fdR-00007O-6S
 for xen-devel@lists.xenproject.org; Thu, 30 Nov 2023 11:55:13 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f423ad5-8f77-11ee-9b0f-b553b5be7939;
 Thu, 30 Nov 2023 12:55:10 +0100 (CET)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by PH8PR12MB6891.namprd12.prod.outlook.com (2603:10b6:510:1cb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Thu, 30 Nov
 2023 11:55:04 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::969f:11b3:5ec2:3aa1%3]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 11:55:04 +0000
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
X-Inumbo-ID: 4f423ad5-8f77-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idxY3OfhTOVGWHwkK/SWDLfxZDKLyqQ9l1zs6JoULxUQwJXfAfSym9NcDC+LByU7YID8et4xCOOvCgs+u55DrovrnQm1N9MhOf2tUcX8LV1TCTHG3F3UIcnMjPqTmg985hoB87omq4fNTX6ud/CYcjrIa1cAR2ym8RHxh8St7QetP/e8tTH+jc7i7uLAeAeW+zecI0S7RiMXq3Nxb/qLGt7JuuyZtJp4FLqQwyiN+plsyyQ60/29j3R6/MjTDaTZ+gQFrHg8Csn/5S7YOQP6cxinyr+tdFiz84XuvtnNDDPsUzcyPF0YC91wjP5iBLlIPf6HAyx0+Pp3x4r9k7lXIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VK8jh57ZRVky3g8Sp0CiWc1G9eVKpDaeqj3HOOtK5W4=;
 b=JCY3UbmTKMWHFxiEUmZDYArAjD1vb66qwhaFCv9yVfZzfhs9G5NJzq3u+YpuQTgeOQWEbApFawcRkXQ1aKcQj5h5K9uKiFHJr70wuNJsRNGGhU8Rkh8GqE63CcbaCEPY6arOQHv9bnlcnkLed2D0i3eDSii4oQVeOnUwwD9YY9D7i88VKYYH0oDegGV6+UxNU7RIGOxHOPyMI7gI8YlArOc8rAMPG4O/D98af85z+1NwYx7Bzvar8N41cB+MHXGHxHY8Z+DaBSkcnppwl+vrHC8RgagXhygoL05zBlbb9JFCxtbT5T4fOMNNzqofYtQxH85E3ajlELE9UJ5gSECxdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VK8jh57ZRVky3g8Sp0CiWc1G9eVKpDaeqj3HOOtK5W4=;
 b=HCQBItb9VGTThPA9L8dyP+ybBnY++twcCxQnZxwqG67PH8n4+jpHBqvEVf2vYO8sgb4tSjB5xY9pIoplEyRzycShjjvfXA4ZY0bSTRCcKnnm3IeyQqaJHjmoX3h4/9bkEqnKllPtpWOJenSHr7LLvS04hZfnfZqT6dV9cVPkjS8=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>, Anthony PERARD
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
Thread-Index: AQHaHsLfq+dfGUvRWUqPIEH3O9fXrbCPyyeAgAMgFYD//96BAIAAhr4A
Date: Thu, 30 Nov 2023 11:55:04 +0000
Message-ID:
 <BL1PR12MB58493CC10788B055445B0BAEE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20231124104136.3263722-1-Jiqian.Chen@amd.com>
 <20231124104136.3263722-2-Jiqian.Chen@amd.com> <ZWX0U1tYooY70UJo@macbook>
 <BL1PR12MB58493CC28A32E3C9B3A1767FE782A@BL1PR12MB5849.namprd12.prod.outlook.com>
 <ZWh3Yl1bOnxczQbe@macbook>
In-Reply-To: <ZWh3Yl1bOnxczQbe@macbook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: MN0PR12MB5955.namprd12.prod.outlook.com
 (15.20.7068.000)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|PH8PR12MB6891:EE_
x-ms-office365-filtering-correlation-id: 88abea89-9af0-4c5e-3195-08dbf19b30da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Yb4Bzs9kXsWqdhurfk7zVPM6gfSihFgph/ziwUzswiNXxXicE3QlnnHBqaZY7UxLhJnEcSrBlwEBVqxL2G60Tvs8aJq/wG4y/MKEmE12GpduRPwnanfdQiO3epS71A+y71Nmoqwo842TeJJ558fajJKF2pq7vLDXQFNnw5gKq0SY/wY89WU/f9y6vNO1VobwpsNrpCScMFe0ZFtD5yAa7pH9XTiBwGywPJSG+udTqPVA553qn9G9Huz2q9BpxuyKf3oYP/TwuNzBaRFkci+h7yVxvNk4pQbpBb1eOMXTsUFlFwRLoqgDa4oFUJxNHOZU9OR00mmqKFGQjmNxgoQrfpqcVdYIb7Xmlc8uTwqtGc/7rRFpqEwvxV5IquRypYLLY8ZuFRzV2ZqJ73lV/Kbz5WDswFruXshqEiigcPNkiKeYTttXm3gjJF0r4eIrM/hVWAuP+G1dMNhoVliC152+m8WpCByO8Phcc3ZUUkQAlUIC79pnCTAgCV88tA3pK8oYYQt2Ilf2J2BDm2ywfPl4sf2qrfwblxVLbHzAcMBrVJ0BK55F1QgAlc05nPsVZQ/aD1B0/sDCUsQ9u5VHOFf4NSM3OJD3E0hPOuKeCgjwkRteAgLyWeiHsjMgGr+agXf/zwO7vITe/slZFF8PEJDgmrHzl5MMKVheV5vLHstS3J0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(52536014)(7696005)(9686003)(53546011)(76116006)(66556008)(6916009)(6506007)(41300700001)(66476007)(54906003)(8676002)(66946007)(64756008)(316002)(8936002)(66446008)(4326008)(5660300002)(71200400001)(55016003)(478600001)(83380400001)(26005)(202311291699003)(38100700002)(122000001)(38070700009)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YmxhQlpybUxiQUFRblAreExRL1lEOG9qTG16VTlwbXVONklwNGczYXpoY3Ft?=
 =?utf-8?B?NFlOQmtiMkRYdEtiTm00OHNZUGNiaUNLUFdlNStCS0d5YStuMVJ4UCsxbFoy?=
 =?utf-8?B?VUp4cG1VSWcwQTdkVjYvcUlPbyt5bXkyRmVIeEZqUFUxRzlxbmpGVnQ2QnlU?=
 =?utf-8?B?UlpCSDdaa08vbUdZOVYrTnJUN295eUdkb0FrcllncjBpSVhmMmpOSUd1bnpU?=
 =?utf-8?B?UjRZWjVYeTdOS3E1cEdZZWlTVTk4VGpaTHh4VVlEZEFPQlo5Q1FBYlhyRlhm?=
 =?utf-8?B?RXZIaHRhT2NXNjJSeUJPaExiMWE2ZmhnYTBPTlh6aXVLbnQyUjFQWkRJM0t6?=
 =?utf-8?B?UzU2bmQ1bkxQNzJlb2pxL2hJSDFuZy9rNmZqUWJlZUI0RWI4OElkczJXaHRo?=
 =?utf-8?B?U2hDRklSRE1qeitVME1EQ20wNXdtWTBnZDFtdzkzOE11U0hUclVkQVNWREkx?=
 =?utf-8?B?YytjZTRkQ3B3WW9DcVJJeEFOcm5aYXFFMHlTSkJXcHVwcmpKNDZFOE9wb25E?=
 =?utf-8?B?WGJyaXlOSXE5by8vbFpOQlk5cUI3VXF5clAxM3IzQklvcDZ2eWN2cWlxMEp6?=
 =?utf-8?B?YVpqY052ZWNvcDlwWVZVZkZiajZDMVg5SDFlRXlkemVHOWNNd0FjTitqNXMv?=
 =?utf-8?B?YTErNnZpMVdzckNkK1pGU21tSVlBcVlHMXFrMzlkWmJuL2grcmRvaUs4NWZn?=
 =?utf-8?B?dnNBZFRRNTkyNWJPMEhQZ2RXVkJ3ZlpXc2lUMkNmWDQ4SnlTZ1lTNjhoYUsw?=
 =?utf-8?B?bzQ0dXVOMHBLNlZiVmtGSXNSQ292UlZBVjJWWE5ucGhVRHI1YTFyWE50cXFG?=
 =?utf-8?B?U2I3Zk00Rm1kYkRzYkZVL2l4aFJPTllaMG5ibTNwb1lvUi9RcjNoSml1cDMw?=
 =?utf-8?B?T0ZYdGY5dzU4eFJIQUY3ODBoU1d0bE9XZXcrcjNYOUo5UFVobkdRcHZpN1BE?=
 =?utf-8?B?bHZEVkdHY3dDRVQ0WjB4OUl4ZkpBL2RRV2NVOXVPZzUwa25vL3ZPOTFMMmpV?=
 =?utf-8?B?VVRnbWJKNm03TXZoVkw1SDFSZ3Nzc1E3WDVqQkp2TVR1aHhKWWthbWdUcE9J?=
 =?utf-8?B?RHdXS1o3ZlJLTHdKNTVIOTNycjEzWXdXRlY3YjdaKzdwN3hNamRnSExBempR?=
 =?utf-8?B?RTV2M2plNW04WkVscUJuaTFDWHBrOG9LU3B2bFhQMTgzRFVhRW9UVlhWczQ4?=
 =?utf-8?B?RDRkNUMrdno3eklHcDBTeTU2Njd4Ulh2U3FqMEtucmRuMWJYV3lTdktGQ0U3?=
 =?utf-8?B?aitLUW1JQWx6RERJc2JWcFF1dit6c2E4TjlRK0dyN0JIS0JXc0g3Sk5INjls?=
 =?utf-8?B?Q2tUYkxjc1pWc0lkcVQ4TEpIYlJwWGtsMFBGcnVWNWJONXZuR25IRjE1SGYy?=
 =?utf-8?B?NjErbC9IMks5MFpSdWsxSjBldUMwZ0pMVU1kMWNSUnVtcGdEcEFHUjVKTFcw?=
 =?utf-8?B?aDhJS0xTV3VwOW00Z0pvRTVhTDJaMnpQTGdzaEU5eEZYTXdkbXV6NlZmcVRv?=
 =?utf-8?B?N3BGbmlCQ3V4Vm02MVJLQk1Qd2FvUkhXdTVCcS9SZ3ZZZ2QzVysxYUd2WUVk?=
 =?utf-8?B?dmJxcWxsN1Fzd29RK2poNkNzdW5lUVFCZ3NmL1NrVFNXTnRkaXFXNlNNZmlE?=
 =?utf-8?B?NjJ2YjBVVWZ4aHNiUEVPdUdvQmZPNzlUbmJzVE4zUXhSYVlsdmd2TXByTnM4?=
 =?utf-8?B?TFpaQktwZm9admVDcDAxTUpLZVFNcmlSRUc3MjNHYVBNRGhZdXlYVHRlZWJT?=
 =?utf-8?B?UkVZamx4UnB2K0RRMXphZ2dnMFVqa3pPYnlsazlLQlNWaHphai92RTRtR0Vp?=
 =?utf-8?B?NzUvZGVWYkxYM1pWcU00MXhQSlJnMURoQ0syZXUydHA4dnc0MG1BU05KN3dW?=
 =?utf-8?B?QVhPMWhRQlZkbExJYUpJOGNJQ0IwbjVVSE1Qdjd0SjlDN3VlYTI4a2t3Zits?=
 =?utf-8?B?YWV5cENCRXprVi9WMlYvWmdSY255U3BBbFR2bDc1QlQxbnp3Y1Q4Q3ZwdXBW?=
 =?utf-8?B?Z24zL0lUMVV6dkxYUk9YNlhVRVk0U0czckd1MGJoUmRoZU51dGFXRlEzMGdK?=
 =?utf-8?B?RDAzcXJwWGtNS2dSL1BubFhEem9uODJGQlRQeXQ0RkQxbjduTXhjVUF0Wllr?=
 =?utf-8?Q?A4VM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <45386DDADC42674B958602A8C0901E70@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88abea89-9af0-4c5e-3195-08dbf19b30da
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2023 11:55:04.4819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0FioACYd4NSJf9fdMyEk3+IAYRM8uXKrFjikL+Wt9Dz2/SPW94yxwfQi069JIj/PcAm+GuRBBab0C6ZSlTEU4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6891

DQpPbiAyMDIzLzExLzMwIDE5OjUyLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUs
IE5vdiAzMCwgMjAyMyBhdCAwNjoyMjoyOEFNICswMDAwLCBDaGVuLCBKaXFpYW4gd3JvdGU6DQo+
PiBIaSBSb2dlciBhbmQgRGFuaWVsIFAuIFNtaXRoLA0KPj4NCj4+IE9uIDIwMjMvMTEvMjggMjI6
MDgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gRnJpLCBOb3YgMjQsIDIwMjMgYXQg
MDY6NDE6MzRQTSArMDgwMCwgSmlxaWFuIENoZW4gd3JvdGU6DQo+Pj4+IFdoZW4gYSBkZXZpY2Ug
aGFzIGJlZW4gcmVzZXQgb24gZG9tMCBzaWRlLCB0aGUgdnBjaSBvbiBYZW4NCj4+Pj4gc2lkZSB3
b24ndCBnZXQgbm90aWZpY2F0aW9uLCBzbyB0aGUgY2FjaGVkIHN0YXRlIGluIHZwY2kgaXMNCj4+
Pj4gYWxsIG91dCBvZiBkYXRlIGNvbXBhcmUgd2l0aCB0aGUgcmVhbCBkZXZpY2Ugc3RhdGUuDQo+
Pj4+IFRvIHNvbHZlIHRoYXQgcHJvYmxlbSwgdGhpcyBwYXRjaCBhZGQgbmV3IGh5cGVyY2FsbCB0
byBjbGVhcg0KPj4+PiBhbGwgdnBjaSBkZXZpY2Ugc3RhdGUuIEFuZCB3aGVuIHJlc2V0IGRldmlj
ZSBoYXBwZW5zIG9uIGRvbTANCj4+Pj4gc2lkZSwgZG9tMCBjYW4gY2FsbCB0aGlzIGh5cGVyY2Fs
bCB0byBub3RpZnkgdnBjaS4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogSmlxaWFuIENoZW4g
PEppcWlhbi5DaGVuQGFtZC5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IEh1YW5nIFJ1aSA8cmF5
Lmh1YW5nQGFtZC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiAgeGVuL2FyY2gveDg2L2h2bS9oeXBlcmNh
bGwuYyAgfCAgMSArDQo+Pj4+ICB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyB8IDIxICsr
KysrKysrKysrKysrKysrKysrKw0KPj4+PiAgeGVuL2RyaXZlcnMvcGNpL3BoeXNkZXYuYyAgICAg
fCAxNCArKysrKysrKysrKysrKw0KPj4+PiAgeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgICAgICAg
fCAgOSArKysrKysrKysNCj4+Pj4gIHhlbi9pbmNsdWRlL3B1YmxpYy9waHlzZGV2LmggIHwgIDIg
KysNCj4+Pj4gIHhlbi9pbmNsdWRlL3hlbi9wY2kuaCAgICAgICAgIHwgIDEgKw0KPj4+PiAgeGVu
L2luY2x1ZGUveGVuL3ZwY2kuaCAgICAgICAgfCAgNiArKysrKysNCj4+Pj4gIDcgZmlsZXMgY2hh
bmdlZCwgNTQgaW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L2h2bS9oeXBlcmNhbGwuYyBiL3hlbi9hcmNoL3g4Ni9odm0vaHlwZXJjYWxsLmMNCj4+Pj4g
aW5kZXggZWViNzNlMWFhNS4uNmFkNWI0ZDVmMSAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gv
eDg2L2h2bS9oeXBlcmNhbGwuYw0KPj4+PiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2h5cGVyY2Fs
bC5jDQo+Pj4+IEBAIC04NCw2ICs4NCw3IEBAIGxvbmcgaHZtX3BoeXNkZXZfb3AoaW50IGNtZCwg
WEVOX0dVRVNUX0hBTkRMRV9QQVJBTSh2b2lkKSBhcmcpDQo+Pj4+ICAgICAgY2FzZSBQSFlTREVW
T1BfcGNpX21tY2ZnX3Jlc2VydmVkOg0KPj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX3BjaV9kZXZp
Y2VfYWRkOg0KPj4+PiAgICAgIGNhc2UgUEhZU0RFVk9QX3BjaV9kZXZpY2VfcmVtb3ZlOg0KPj4+
PiArICAgIGNhc2UgUEhZU0RFVk9QX3BjaV9kZXZpY2Vfc3RhdGVfcmVzZXQ6DQo+Pj4+ICAgICAg
Y2FzZSBQSFlTREVWT1BfZGJncF9vcDoNCj4+Pj4gICAgICAgICAgaWYgKCAhaXNfaGFyZHdhcmVf
ZG9tYWluKGN1cnJkKSApDQo+Pj4+ICAgICAgICAgICAgICByZXR1cm4gLUVOT1NZUzsNCj4+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIGIveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4gaW5kZXggMDRkMDBjN2MzNy4uZjg3MTcxNTU4NSAxMDA2
NDQNCj4+Pj4gLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4gKysrIGIv
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+Pj4gQEAgLTgyNCw2ICs4MjQsMjcgQEAg
aW50IHBjaV9yZW1vdmVfZGV2aWNlKHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4pDQo+Pj4+ICAg
ICAgcmV0dXJuIHJldDsNCj4+Pj4gIH0NCj4+Pj4gIA0KPj4+PiAraW50IHBjaV9yZXNldF9kZXZp
Y2Vfc3RhdGUodTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbikNCj4+Pg0KPj4+IFlvdSBjb3VsZCB1
c2UgcGNpX3NiZGZfdCBoZXJlIGluc3RlYWQgb2YgMyBwYXJhbWV0ZXJzLg0KPj4gV2lsbCBjaGFu
Z2UgaW4gbmV4dCB2ZXJzaW9uLCB0aGFuayB5b3UuDQo+Pg0KPj4+DQo+Pj4gSSdtIGhvd2V2ZXIg
dW5zdXJlIHdoZXRoZXIgd2UgcmVhbGx5IG5lZWQgdGhpcyBoZWxwZXIganVzdCB0byBmZXRjaA0K
Pj4+IHRoZSBwZGV2IGFuZCBjYWxsIHZwY2lfcmVzZXRfZGV2aWNlX3N0YXRlKCksIEkgdGhpbmsg
eW91IGNvdWxkIHBsYWNlDQo+Pj4gdGhpcyBsb2dpYyBkaXJlY3RseSBpbiBwY2lfcGh5c2Rldl9v
cCgpLiAgVW5sZXNzIHRoZXJlIGFyZSBwbGFucyB0bw0KPj4+IHVzZSBzdWNoIGxvZ2ljIG91dHNp
ZGUgb2YgcGNpX3BoeXNkZXZfb3AoKS4NCj4+IElmIEkgcGxhY2UgdGhlIGxvZ2ljIG9mIHBjaV9y
ZXNldF9kZXZpY2Vfc3RhdGUgZGlyZWN0bHkgaW4gcGNpX3BoeXNkZXZfb3AuIEkgdGhpbmsgSSBu
ZWVkIHRvIGRlY2xhcmUgdnBjaV9yZXNldF9kZXZpY2Vfc3RhdGUgaW4gcGNpLmg/IElmIGl0IGlz
IHN1aXRhYmxlLCBJIHdpbGwgY2hhbmdlIGluIG5leHQgdmVyc2lvbi4NCj4gDQo+IEp1c3QgaW5j
bHVkZSB4ZW4vdnBjaS5oIGluIGRyaXZlcnMvcGNpL3BoeXNkZXYuYyBBRkFJQ1QuDQpPaywgSSB3
aWxsIGNoYW5nZSBpdCBpbiBuZXh0IHZlcnNpb24uIFRoYW5rcy4NCg0KPiANCj4gVGhhbmtzLCBS
b2dlci4NCg0KLS0gDQpCZXN0IHJlZ2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

