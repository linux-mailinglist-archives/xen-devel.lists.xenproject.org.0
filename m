Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FEE9AC695
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2024 11:31:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824497.1238623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Xhm-0005js-6V; Wed, 23 Oct 2024 09:31:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824497.1238623; Wed, 23 Oct 2024 09:31:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3Xhm-0005hR-2x; Wed, 23 Oct 2024 09:31:02 +0000
Received: by outflank-mailman (input) for mailman id 824497;
 Wed, 23 Oct 2024 09:31:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvWg=RT=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1t3Xhk-0005hI-MJ
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2024 09:31:00 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20626.outbound.protection.outlook.com
 [2a01:111:f403:2413::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82c4c338-9121-11ef-a0be-8be0dac302b0;
 Wed, 23 Oct 2024 11:30:59 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by BY5PR12MB4177.namprd12.prod.outlook.com (2603:10b6:a03:201::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Wed, 23 Oct
 2024 09:30:55 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%3]) with mapi id 15.20.8069.027; Wed, 23 Oct 2024
 09:30:54 +0000
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
X-Inumbo-ID: 82c4c338-9121-11ef-a0be-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5IzTFHsa3lkgH5kY4vR+e8Lpnjn31n6CB9zTxQYl8KoeG53Rgct6QjAD7pHtTtYa8Y/aCemQcQzXhae24iUVKuwt8vZHQ1wEgfpZ88ih3Yv3r9JQt/IgQ9psvT2RcWtsb/lG/fYZ90yJqRGqAKHEWCND3Peb7hPwlrMbe3sEg5K3499zaD/CQNVL1dvet4Gyz9adaGJ6FSZljU4sDMD/fhEIbRTfEVuSMLYaj2IaRQup+no6JC485fZUiImBuiprLd1ri8h0uNJlJCuVvDzWEsS4vJWIeBlEYkQ3WGa3Q7OlkxgCAieBqA08Imzj5OEcVgFKlNiZw7CtauMExyMWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cluu/nLc+2Z26A8o9jU16qPh/Y22bsI0a5pU+pOdNc=;
 b=RUbAzoQe+yumdN54CkGWjG192gGy8rYjMOx1NPyStT/yxZgaJbOIZnUjc0SjSQ1MWM2WvEeYLdk/ti2R1aJ2pu361QtSxJPvl28sYWubb0qRx3KmUMpuR/dJ9LzxVkDWL2Ab2cELEQ83fF62l8SoadtFDrYRBAkcs2/iwbAGGX2nMHdYFth0HmDhRlxCkuENse6yfPw7Xg8btpZx+QhSoGrcEhPooDSh1bPXMawsfzy+wjsuU11QCQNjZQKWtQu5+yOZYaXpPKDMEIhcozL559UQRUcRr6HJHBCeOffJR5uIBEMaTPFMs75c5hq8F01Ephf9cmlYzF/Yf93gvx8FKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cluu/nLc+2Z26A8o9jU16qPh/Y22bsI0a5pU+pOdNc=;
 b=xKiIbIsS6C64b80Lm8dNoIQ2R0X7hW76+ULTVOpVtO2qC0n+j0ooz5iBNJaMLVhncue4lkKuLn8Y7Y6OEH/gMIF4CMk/GxNCD4MRQJOEefcxH2ZTlxjd6FsZyGLX4YeKsffPmElAyuj/xuibfzZLIzmx6ngRVqPDKmdSAhcypUg=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
	<marmarek@invisiblethingslab.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Paul Durrant <paul@xen.org>, "Edgar E . Iglesias"
	<edgar.iglesias@gmail.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [QEMU PATCH v8] xen/passthrough: use gsi to map pirq when dom0 is
 PVH
Thread-Topic: [QEMU PATCH v8] xen/passthrough: use gsi to map pirq when dom0
 is PVH
Thread-Index: AQHbH5SoA03nzCynnUmi2VFVuzae7rKTb04AgAEz3YA=
Date: Wed, 23 Oct 2024 09:30:54 +0000
Message-ID:
 <BL1PR12MB58495FAE926D2A0A793CF9A0E74D2@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20241016062827.2301004-1-Jiqian.Chen@amd.com>
 <ZxgwUd3riLmFzFC4@mail-itl>
In-Reply-To: <ZxgwUd3riLmFzFC4@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8069.027)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|BY5PR12MB4177:EE_
x-ms-office365-filtering-correlation-id: cb5d130d-d9dd-430e-67ef-08dcf34564a6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bEVNUVdIUWcyNHF2ckF4aFZoZlgwYkcvZkU1d1oycnlpaHBSNGtadENkdzBS?=
 =?utf-8?B?ajlTbnNwdy9MSEVkTnNSZHR6YVB0NmZjR1RNZmZ0aHBhQlRNQVJBc2ROR3FT?=
 =?utf-8?B?VFZ3cCtTTkJ5REIrZlN1SkI0dENJR00rczlYVFh4NEN6V293U2E2SG9wU04z?=
 =?utf-8?B?MFk4RWlSMzNBMElVLzJWZ2x1VjJiWGJoU1FCL1pYcjlOWjI4My9VMWwrbGM3?=
 =?utf-8?B?ZkFYanFMRUkxZDlWV1RyMFhjZ0ZNKzliSWMreDkrTHJOM1M2SWRZU2lmNU5X?=
 =?utf-8?B?SEp6YkRZNWdYMk00T1JpT0Fsc2s1ZTN5RG5HVkhlUXlnWHJsZmZlRWtXZEpT?=
 =?utf-8?B?NzBNaThkMWpVZ1REaEZCaFJNM1B3bWhQV2VqTUFNeU03SFZHN0xvMzM0b21K?=
 =?utf-8?B?Y2NZRFl6b096OEVCeTFXbHZuWVFMaThzTmJmalJrcTNtbGRHcjV3Wld0a1Jw?=
 =?utf-8?B?VjhXZW1QOWV6aWZwODNkdEwrRXJOQ2RtSDdWZCtyMGlMbENFVzlKRVhyWThp?=
 =?utf-8?B?TFM4ZlBLbWtVQkhoU2tQYjNIMk5sbU50QnU4MlNjaE9HMTVEWXcxbTV0TVhF?=
 =?utf-8?B?Ym8wK3VFbEM2dFh5SmZ5c1VsVGg1dm1iUkliY2NGWnVXajk5NEZTNFlWQXJz?=
 =?utf-8?B?ZlhvVkdhRmV1NkF4WW8ycitRTjVwZXgwOUlyUXdqU0U4YzRUdVcyRUJSZTZi?=
 =?utf-8?B?T0dJQVdVYkdYdkhRMTYyY1lyczVHUmRFRkVEbWRsVTVQWmIvYmdZSURlNFIy?=
 =?utf-8?B?ZHVhQ2NqS2NKTWFCTlVYN0xwUDdtV1hJRndwSERvL1I5NnF2NGs1UEdZYzZS?=
 =?utf-8?B?bkZlcUpoNnZhcTREQWtSV0pESFU5T0RJY3VZN25lem1NZ1ltZUR0clZGc0Mw?=
 =?utf-8?B?RzVrelZ5MFlrUkRkaXFlTTNjLzBGd1A0K3NrelYzZW44NGkvcVJMU2hESjZl?=
 =?utf-8?B?VDB6NHMrU0ZqNHdRbS9VMmEyYzhsVGlIdnpuSXhEY1h6cmVrRUVySTZJOVky?=
 =?utf-8?B?d1pXQzl0RTBXa1pPUjcvVTFpS3NwZHBkSnVsWHB1dEJralNhMm9pVk1qWTZY?=
 =?utf-8?B?Ykw1LzgycVpab2M5UTR6Kzk0TlVmbjlpODh6eFRvS01MOUtSTWI2cExJaFk5?=
 =?utf-8?B?NWlIQXU2NHBVU01IUGZqSHJUL09kRmtISzRleURZcUI1NkduQkZ0bmFwdlpC?=
 =?utf-8?B?UURWeXVva09MZDRYSWV2OG9hak1CV3AyWkhCSW9wZTFOOFJjV1JrR3FuTXYx?=
 =?utf-8?B?czEwL1hGeEFoZjNkcEZPVzRLVEs2a0FDeEQ4Y0ZBQkZjUm9sU09zWW1ielZL?=
 =?utf-8?B?b1BBYjdzVDk5Z3lscXZYelRPYmZSZnNUL09qa2xVK1E2bXFqOHA4YTBFNG1Q?=
 =?utf-8?B?dTMvYWFFYjBqaUR3b0ZqVlZEeXF4dVlMWWlVcGJwRkhnTlQxNVh1em5LYkxk?=
 =?utf-8?B?dzgrYXdZNm5aa3RhYU8xTGxIK2ZrejEvVTNxL0Fsc1JIdHcxU0RQVG1GYlVF?=
 =?utf-8?B?MVd6LzdFUG9lbGxYV3pjOHJ3aVVkWGNhNzdrVEFUb0VtdTgyQVVxd2l2QjV2?=
 =?utf-8?B?RkNXaWJieDVSMlRERzhUUUJXdkN4TGxjN1F4cTZUNVVKc25IMTVHSS9heTNJ?=
 =?utf-8?B?SDNPYlAwYllIN2p5U3RydU84b255dkNrc2lkRFc1N1ZIamNXZk1mbG1CaG1y?=
 =?utf-8?B?UHRBWGVSZEVLM2N6Y3NWYjZaVUFFNXlCR2pyQjZtRnM0STdhbzBCd1BzQXRk?=
 =?utf-8?B?T3duS242dXdocVBkUmNUdGo1WklsZUtUOWZNa1JodEFwMTZLRDRMUEdidGZQ?=
 =?utf-8?Q?3CcIIDe9SvCCytVN8NvbZgy6WiFOUheePTaDc=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?LzA3Y2ZWa1Z0bmdqekExZGFmN1VRRzVyU1RQNEZiTkVQa2U2ZEttMVYvYnds?=
 =?utf-8?B?Tk1xYkhNQ3VYSDZQU1k5L1RTQVo5ZE9xSlQ3N2ZFbmtMekcxMXVuUmZ3bWtY?=
 =?utf-8?B?TmF0RFFlMVRFZFhNa0JyQUpLSVJ1Z21xZkZLWURTM1Q3V1FyZndxSXIya2Ry?=
 =?utf-8?B?MDUrVWVESllqUG9veCtZQ1h5ditGYW8yL1g2VkUwOEtQcUpQMVpFeUpaZFpi?=
 =?utf-8?B?RFFTSjN4NVNKV0draFduSFNJT3loVm1EUkk3aHk4T1Q4akZRejQrTXNYNytS?=
 =?utf-8?B?SnhyR0hUbnRKNG9rdXVIb0hPc0NnTUhuQ09yOUVZR0QyZGFoRmVPdDJVTTkr?=
 =?utf-8?B?RHFmVDRQSFFqUDVsamtBQjJLTHVzUGJjbFdFeWZXL2lKU2MxSHBRWWtuVzZ5?=
 =?utf-8?B?QzFyODluMmtQVmNiUllVZVladk82aGY4QVpMMExubHUvVHdDTW91WldEbkJQ?=
 =?utf-8?B?TXNmNDF0RVlsN3hueTk3WXVKUVRBckdjaGdnM1NIVFF0QmhCWEs1ajU2K0Fw?=
 =?utf-8?B?YUU5QVk5U3U0cllqVFhUdjYvaGxZb0VHTW5NRTNianlXQTdPd1BlQm12VS9I?=
 =?utf-8?B?b3UzeW9wNmNFZ2xMb0k3UVVZMjB6RmhsRkk4T2w1Y3BPV2J2NEhZQWhQcWRp?=
 =?utf-8?B?VDZVTFkxVEJkejU1S24xeGFaOUVORDZyVHNmb2IxK1BmMmhFMys1ZmE1c2JZ?=
 =?utf-8?B?Z016c25wZlpWRThWRGFXVnBTRzA2L3lDRVZsckJqa1NHd0dqWDR3aDBqWSt2?=
 =?utf-8?B?V0o5Z3NPWWZSL3VZOHBadnZFb0NBcmxsR3BtMk1TTHJBWWRiR3hTb0taOE5j?=
 =?utf-8?B?M1pIVVB3M1BjaDNWejZxR3NZYnRCZ3hxczVTQm43Z1NuU2NhOVJpc3Q4NVND?=
 =?utf-8?B?YlVxM1h4Mi9UdC8vRk1sd29SR25QY0h2TjdZUkJQTUJoREVoU1FlY0ZpOTRG?=
 =?utf-8?B?akFBMDJJRjlBLzNCYWRacFBsUjNpclJJYkN2dks0T0tMQlhOTm52c0pOZ1Vm?=
 =?utf-8?B?U3RsemFZTFlZZ1F0ejNaNWRzZEl1Rnpad0JmSXJDellnN3BZTk93bU9tREJH?=
 =?utf-8?B?NzRKWWVuTFdpYWsvWUNMWFpDaGRXKzZCdTVOVnJzcitWMkcweTdEbXo2TXh2?=
 =?utf-8?B?aUdRa0JYSUx0L1RUK2dEMWV4dGFGSndzS2FYaDRuU1V2K0l4OGFqNW1STkhM?=
 =?utf-8?B?STgvMWFBSHRhaHNYU2FKc1JFcDc1NjVsWWs1WnNoMFpwUzYrVWJyMVRFRWNt?=
 =?utf-8?B?K2NrWldwUUdEcFRnenZFWHJnalAxTktEZXFMQUF5cWZoamlUZ0pmalVFaFp2?=
 =?utf-8?B?c3pIQytKNVlTVm1yTVNSQm9wdi8zVzV5eTd0RERSaTZveUk4NVRwaVhuVzR1?=
 =?utf-8?B?SmtqQXQxaVlKZFpRa0h6SmtmanJ1RHhHTFRueW81QVVHYnc2SkVDNVhyTHQx?=
 =?utf-8?B?T3k0aXJWamhwWXFFcWZCUkJWaVVYWDZMeDM5Mi9DUnVyMitBWk5xV3NyWTNY?=
 =?utf-8?B?RkUwNnFCUTBUZG5xcXQ4cWxsbEVlSnlaMDVoV1hOMXFDOSsrSFBTNE9sbk5l?=
 =?utf-8?B?aVhmNHpocTVPY2xCaE1DTFNzQVZPZlIxRThOSXJ1aUplR29RU3gvMm5kY2dS?=
 =?utf-8?B?T1Y2SzhCWFZLRUo2L3ZUWG9lbllEQTViL0VyeFM0aUZMRzkrdE4wM0hXWmYy?=
 =?utf-8?B?UTBEQ3RCcEFqaDV6MW5mV1ZpaWxoSDdzNTFyd3o4UUN1a2xIbFpLbU9EM1ZO?=
 =?utf-8?B?SzRHeVZ3cjBSaVo5QW81N2NUUDlwV2hHbG5GNXBTSStjaUhIeVZIWFVxalVU?=
 =?utf-8?B?SXpodXpLbTYySUJWSHR4VVppTFRHemt0UW1PTTB2elJaa0EvTnVrN1NWa2Y3?=
 =?utf-8?B?bmVabnJ5VG41NCt3Z2N0TzNiSUFqSmp1UEhPNUpIOGxZOVR0NGI4dmZXQUg1?=
 =?utf-8?B?Yk5DalhzV3d4QW9aV1JkK3JZU1pyQzhBcVNKd25HZmtTQXpueU85bUV5Sis4?=
 =?utf-8?B?S0tPdzRmN1duSWhkZXRiYkx1cEJodDVKdllCTEhDbytwNDJvNHU4QmhhVENm?=
 =?utf-8?B?Q2xFTkJwcmF4bk9tZ0h5bWtNdzM5VUtEb0FpbkxFUWdVZFZtRjEraGNKVnFn?=
 =?utf-8?Q?R5C4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B427FB5B0B92BE4FA09F354828F401F3@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb5d130d-d9dd-430e-67ef-08dcf34564a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2024 09:30:54.6126
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uXbWmhZrsWoU2vIPinGDReFkd5UBj4aURDeU6OsBOQgrDC3a73xPTT2/tjaLCvKZv2Xl6hu1ZRmNWSGrng9yfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4177

T24gMjAyNC8xMC8yMyAwNzowNywgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOg0K
PiBPbiBXZWQsIE9jdCAxNiwgMjAyNCBhdCAwMjoyODoyN1BNICswODAwLCBKaXFpYW4gQ2hlbiB3
cm90ZToNCj4+IC0tLSBhL2h3L3hlbi94ZW5fcHQuaA0KPj4gKysrIGIvaHcveGVuL3hlbl9wdC5o
DQo+PiBAQCAtMzYsNiArMzYsNyBAQCB2b2lkIHhlbl9wdF9sb2coY29uc3QgUENJRGV2aWNlICpk
LCBjb25zdCBjaGFyICpmLCAuLi4pIEdfR05VQ19QUklOVEYoMiwgMyk7DQo+PiAgIyAgZGVmaW5l
IFhFTl9QVF9MT0dfQ09ORklHKGQsIGFkZHIsIHZhbCwgbGVuKQ0KPj4gICNlbmRpZg0KPj4gIA0K
Pj4gKyNkZWZpbmUgRE9NSURfUlVOX1FFTVUgMA0KPiANCj4gUGxlYXNlLCBkb24ndCBoYXJkY29k
ZSBkb20wIGhlcmUsIFFFTVUgY2FuIGJlIHJ1bm5pbmcgaW4gYSBzdHViZG9tYWluDQo+IHRvbyAo
aW4gd2hpY2ggY2FzZSwgdGhpcyB3aWxsIGhpbGFyaW91c2x5IGV4cGxvZGUsIGFzIGl0IHdpbGwg
Y2hlY2sgd2hhdA0KPiBkb20wIGlzLCBpbnN0ZWFkIG9mIHdoZXJlIFFFTVUgaXMgcnVubmluZyku
IA0KPiBTdGV3YXJ0IGFscmVhZHkgcHJvdmlkZWQgYW4gYWx0ZXJuYXRpdmUuDQpHb3QgaXQsIHdp
bGwgdXNlIFN0ZXdhcnQncyBzdWdnZXN0aW9uLCB0aGFua3MuDQoNCj4gDQoNCi0tIA0KQmVzdCBy
ZWdhcmRzLA0KSmlxaWFuIENoZW4uDQo=

