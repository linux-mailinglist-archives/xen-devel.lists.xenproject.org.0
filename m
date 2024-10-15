Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E6F99DC1B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2024 04:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.818938.1232221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0X3D-0004ZX-To; Tue, 15 Oct 2024 02:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 818938.1232221; Tue, 15 Oct 2024 02:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t0X3D-0004YH-R1; Tue, 15 Oct 2024 02:12:43 +0000
Received: by outflank-mailman (input) for mailman id 818938;
 Tue, 15 Oct 2024 02:12:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0I5b=RL=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1t0X3C-0004YB-Bk
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2024 02:12:42 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:200a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f34694f7-8a9a-11ef-99a2-01e77a169b0f;
 Tue, 15 Oct 2024 04:12:39 +0200 (CEST)
Received: from BL1PR12MB5849.namprd12.prod.outlook.com (2603:10b6:208:384::18)
 by CH3PR12MB9100.namprd12.prod.outlook.com (2603:10b6:610:1a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20; Tue, 15 Oct
 2024 02:12:33 +0000
Received: from BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285]) by BL1PR12MB5849.namprd12.prod.outlook.com
 ([fe80::b77f:9333:3a5a:d285%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 02:12:33 +0000
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
X-Inumbo-ID: f34694f7-8a9a-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwBTGVkjEzFAhBa0/qk1dH19GDuQz7I2WOxTqRVEaSgMoziAm866wxsmr3Wv676DbgdXrn47xLFzEVbeizzEhPVL8DnQ4nWCO1oT6+zG/K3x4jpLFGzN3MnOqB/nDLIDAJh+M7tq1QZRz5fbMFcCgYiXZ3khwyW+zlOQBfkLQx+HkPb5VVKGwsPpDEPArkRthQlWEF5dgqq47FCWV0r1bSxtlKl/77r7R7sj3Ejw60XGUc5mDxzqj9Hl0yBnxdBJCIZDHkiZ3+CTu9iPv4De6oymnKiHyKmjXdZkcnX4rS+vJOD2JDSbr9OFxPvLxIpsKFupYouKW0OGS7p9f2YNnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nk2TV3r9qIDztPwtx/J5KwpV0H9xlQlRYy3KsqwFU1I=;
 b=vtYEUTzNw31a7OPfQHEkCk1kmjYORDieA7+tZaEX62AWF91Hx8GZuwZCf2OH63mNeOFyUrs1elSyyVILz7Ipa5M8pMM3glK3jqw/jS49fzn3H3btA5mS6bITTOONEBgcXPFWNNkuRiT/PW7KcuOf93P6uVc9YBv5U2FP70ncJGIjkkVD7tGC72yz+mQCns7sA+uzjfXBdlgmdTFJ3tB+5odFvsWgJdim1PICT0sDhZtQ9c2lUMRJA1hsDZpJrAEVWgAaQZBLbClOoaouXP35kCeg654ywzFGlq2en1usTb2pEexighPe+FUarQ3lgSFgRpoEms+Dh66RbjV6J/ZN7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nk2TV3r9qIDztPwtx/J5KwpV0H9xlQlRYy3KsqwFU1I=;
 b=XIfx+vtmp3XnQit/ONDFjop3jFHzCQbXc1QC/y6Q/dnGPGUo2gbz7PFwzf9dSAYoj1UIaIi5Fu+2xsC7+6Hmn6KDxsHARj+Sc7CzSrr9UXSthO9GrwR0oB6pTIqsOZ4uELvWtyNLSzumvt0B4KTB8ebw4lvLyABNWICHLA9DpnY=
From: "Chen, Jiqian" <Jiqian.Chen@amd.com>
To: "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Huang,
 Ray" <Ray.Huang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>, "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [RFC QEMU PATCH v7 1/1] xen/pci: get gsi for passthrough devices
Thread-Topic: [RFC QEMU PATCH v7 1/1] xen/pci: get gsi for passthrough devices
Thread-Index: AQHap3nJmmJ4lr8haEKHz4C0egxoBLKHkVEAgAD0cQA=
Date: Tue, 15 Oct 2024 02:12:33 +0000
Message-ID:
 <BL1PR12MB58495C5C65A61003B9E90528E7452@BL1PR12MB5849.namprd12.prod.outlook.com>
References: <20240516101338.86763-1-Jiqian.Chen@amd.com>
 <20240516101338.86763-2-Jiqian.Chen@amd.com>
 <fb14e4dc-b8ea-444b-8eee-551d05b7217f@amd.com>
In-Reply-To: <fb14e4dc-b8ea-444b-8eee-551d05b7217f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-imapappendstamp: BL1PR12MB5849.namprd12.prod.outlook.com
 (15.20.8048.020)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5849:EE_|CH3PR12MB9100:EE_
x-ms-office365-filtering-correlation-id: b318472e-de4b-4b6a-47dc-08dcecbed46d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?MnROOURNV1BjMVhRY2g0QUllTGVGK1E1NDdEYy9tbm14MXcxeEU2RTFYamdo?=
 =?utf-8?B?SzU0bjBjNWNxTlNHTTRJdlNqSVQ4RG1JYWxDMXVCT1lzU053bnpzUjVUVFgv?=
 =?utf-8?B?M01TaWNGdFl4aHRiV1hLdzNaZDAwVmRGRlk4WjZUY1pCUGpUWmtNNzFTaVVT?=
 =?utf-8?B?QzNTWlVlUHlKTEJMWitvU1ZIbWRxbmJEOFJEeExjVlhsYVJENDMyS08vbWVV?=
 =?utf-8?B?Njc3Zlp6WEtLdk8rOER3QWpVS3RmYkN6OGtRK1p0dFRvdHh5QnNwd0xtbXc2?=
 =?utf-8?B?K1dlQWZPeDZpcnVFV2RjR29nLzFGU0l0dFhjUkh2OVpJd0R0NGEyMkkyUmxu?=
 =?utf-8?B?NkpKeHFpZ3IzdFI0UU5HZTR5dzN3UzAxdXBib1pWNGFFWGxOYUhBNnB4Sjdu?=
 =?utf-8?B?MlhKMWkvbFE4S05WdjhvMTlwQW1wVW1oSHQwRGNUbCt2RWdJeHlMSzJvT2pQ?=
 =?utf-8?B?U1BBT2ZnUzBmN0dJNmZEOVBYaUdiWEQwcTR5cm1zYkczOCtsa1ZCbTVsZnk2?=
 =?utf-8?B?ZHVVVmtxUkJOdmQwbkFGblFBV24yVzJXVjBqdzBQRHRXQ3gxL3RBVzhOSkxX?=
 =?utf-8?B?YlZpZDhlaDAwcDA5Z1ZOZWQwblUwMHZiWkYvSitQd29sK21PK1VaSXN5aURi?=
 =?utf-8?B?SW5uZEJIS0N4YVZnYUp1SXhqYUc0Mi8rbnkzdXBmajg1cG94RmwvVlRJbWkv?=
 =?utf-8?B?K1Y4QlVjRVQwU0QyMkVzQmMzelNNK1ZKS0psNWNHcklCTDBPaEt0bExrZ0gr?=
 =?utf-8?B?Sjkrcmtxb1Uxb2EzWkxISWJUcDcyclRQVFFDc0RBMHNPUCt1alJaZ1NnZFl6?=
 =?utf-8?B?VlYzSnI0UHpvakhtSVkwVUJ6Q3J3c25DSVJuRVFXMUNTVEJuSUlZUjJ5aHg0?=
 =?utf-8?B?UCtNWlRDMWFQUEJVaUpWaDRyNGVOMUpGVDJiakdaRXpuOHRha0pHVVBLWDlG?=
 =?utf-8?B?dW50WXdocGp6aWtZNmF6M0RTbnNjSHFvOG4vQUhOclRxY0lhYWYzUWY2WU50?=
 =?utf-8?B?Q25EcGdzem9SSXc3YS9VbWdMdHNPYXNDajlxeDJmejlWOUJSOEw5VStMUmFL?=
 =?utf-8?B?N0hob1ZoVzlUNUx1MjVwaUJyWUZFdDhCZTRBRVV5Z2YyZGIxZCtwVkdQZVh1?=
 =?utf-8?B?dDdIOGxTVXd0TXAxY0dVR0FYZU1ZNm1rN0ZYV3dBRnFkTTR2THFEc3p0VUhS?=
 =?utf-8?B?dklGSUplYlJjZDhNcDE2MVhLMEpOV0JTemxCcFQ4OXpaZmRSTVp5VndLT1Na?=
 =?utf-8?B?WDJxL2hTb3lGeDNad0E0eVEySlZZZk1SS0VjdXlKdVpDc3ZvazJTVGl5UFJJ?=
 =?utf-8?B?cjZSVjdldE9RU2NHMmJYQno4TzdkbndSQlZEaElKS2tsZ0puU1M1ZTZobWpr?=
 =?utf-8?B?TXI4cXY1L3FVS2dwRkh5NXgyUk9OZUdTOGxXWW9wdnJwbHE3WFVGYThiZVl4?=
 =?utf-8?B?cVBBY3BZNEt6VXlwSG5RTXpxRnpWbThNbWJtNmkwZU5WS2RFNFdMbkFBSDdN?=
 =?utf-8?B?dTd1RGx4cE5ybE1weW1kQzhySUFPQldPcU1PbVJMMzZoTzVxWEdHVVQ5NGxj?=
 =?utf-8?B?cG0vcFZEc2dQTGd0T2RXejZsVmJMSUlOOTZJOXVvcm90c29CNFRIamE2N3Q5?=
 =?utf-8?B?MHgvMkVCeEowc1lVWW4wcFlnWnpjSTRkcEhsUk1SOG1ZSXJwcFgrNjYvTnJz?=
 =?utf-8?B?Y0pheVZVQ2kyT2lEUWpKaU8zVjR2bHJJdEhCWVpBeHd0TjgycU9hNkFMVVNn?=
 =?utf-8?B?bmxJZmpjc1BTZ2ZMY2tUUUswZk1GMFRZSmw1Q2djbmtIdllFTmkrUHNGYlNk?=
 =?utf-8?B?bExQRVI0NG0xTzhLUGhDUT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5849.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZlVpeEpwYkdyMzE5S0VlMzh2WlRZMmJMWnJlY2N5MGk5ZGpxbWw3Q1FMZmRv?=
 =?utf-8?B?Z09sMXF3MW5lZS9QdGhuNmgzZmd5S1pXSVV3K05qcmsweG5rNjdWTWFPdTFo?=
 =?utf-8?B?bDdpci9KUmhyeXlFUGNSaEs0a3VDRHdBTXNlTHdVUnlJVXlzaUR6WnRqa05m?=
 =?utf-8?B?dFRBUFBxZFRFWXVXMTdpQkhucTRwRDVZck8vd0tmTFNSVkdNelVkSEZRLzMx?=
 =?utf-8?B?YThSWWxBZG4xZjJPalhWS2kwVHZPSXlBQ0F2UTRnM0VoZ2txM2FDTS8wK2pB?=
 =?utf-8?B?TnlsUmo5MnFzRmloZjAxZ0RXVTZSK3BKc3VRczNlSVh0amNKOXQ1R3oySUIw?=
 =?utf-8?B?VTFwc3h0aWY5U2tLZlZiVTRhWU9PNkl3NDhNVlRpYzBZTGRhNHY4eWxOcjFr?=
 =?utf-8?B?YzJmRDl3SURxWWJwQzdvSmlOcG00aTZWVDlnUjVCV2xuZzJFd295d1JHdW0w?=
 =?utf-8?B?TmxHZk9Cd1VkQ1F5Sm94aGRCR3U3bFJhcDZlN0N5SmZ5bUxOaHNINWk4Ny9Q?=
 =?utf-8?B?WmNhOS8zL2czakFHQS8zMjZ1SG9qSlAzY212VWpSazNjM2pxUDQvSFJjTEZZ?=
 =?utf-8?B?UWpYSWFaSzhlbThCUXBYbFFscjVmdE9Gbzk0c3p3ZHJVbER4dnJvVitkYXo5?=
 =?utf-8?B?N3FQaytVOHdld2xlVVROS0RIYUd6blNMam5sUS93dnFBMGs2T1hpSnpkcklJ?=
 =?utf-8?B?aDYvZDJYVElzU2p0M2V0RTVUQyszRksrc2IrY0FvYjc2U2JHYk5ISlZrdUQ3?=
 =?utf-8?B?RWhMcEZqRHlRa1NwME9PZnk1QVV2NFl0dlNna2oyaDhWa21PWVltejRHNlpM?=
 =?utf-8?B?VUV2QmtQOGtONTgrczMzZ2JaaGd0TlNXVHhHbGdtYmJQTzZQdVkzZWRDcm83?=
 =?utf-8?B?VUJ0S01VZU4xM2NMSG9sbGJPSmR2ZjRIZkRsL0R0emxlVG8zdENydGRKOEFH?=
 =?utf-8?B?RDZzMmdURjZKa3dtdGptQjRlVks4NzU3Q1dmZnkzY0VvUmpDL3I1WEtZSndI?=
 =?utf-8?B?OXZSNmQwbFE5bW1qbldFaERwb2VtbmYwOVVERktUcWF0akVDTHRpMWhmZDIr?=
 =?utf-8?B?eEdPUEdOQTJWR3V1VmNLTGx0V0E2cUNVcTRwa0FxZCtSb3BzTTFpYy9udVJT?=
 =?utf-8?B?NGRvdkRPbTNpQTNCSlp5dHp3VU00ZjVkMFZ3MWZGdFBDcGNpU3pOczR5NzRJ?=
 =?utf-8?B?dElTOEl5S25kSnVlTm1sSGJ0RXpqdzJtOURadDNucVNvdThKWnkzcS9LUjZa?=
 =?utf-8?B?R1E5NTMva1lmZWQ3bEJna3BROUVEZVZrT3dOdW5GUjVMa2o1eXljbU9QdGxH?=
 =?utf-8?B?ZmVJSVFGZWdJNXpQL2NRelZlZkJnL1Z1Mm44Uy81dzE3UmZDKzExMnppcVph?=
 =?utf-8?B?a3J3ZGZsc28xSXp1Znk0SmpuUDh3UXdkbDFmRGE0MlloSGVKdlREMWdhOFpB?=
 =?utf-8?B?MDlqRjJSbllORFVuMGp6cnVhMkw3TENxMzdpUWw3b1kxSmdESzBzOWZpOGFl?=
 =?utf-8?B?U3VaYWJBODlLNG1MU3hGclVWWWM5MXVpcFdEdHRDdm9BQVNIMFVFeDlyTW1P?=
 =?utf-8?B?TGYzMCt6ZEhuMEpwa3JjTDJpMnI5NmFQcGRQNFBCZTA1RHUrbk42YWdqU1ZU?=
 =?utf-8?B?allvWDlrcDFrNlM3RndvZ05GbG9BRkdTR1hONE1FSWNSTW82NVRWRzhvZXVu?=
 =?utf-8?B?ODJtTFk0TGErYzY5NVNPS0c5cmZPNCtLL2I3bTBDOHN6d1lUYVpVUE9ST1N4?=
 =?utf-8?B?UTkrOCtWSUVEOU9ldXErWXBFOUlRSW12YVpRRzR4eEs0clhybFlHSTlvSjQ5?=
 =?utf-8?B?bWpZODQzd244cnNhd2t5WGJURHhJUm5SdytBMkk3eUdXNy83NVE4RGg0VHdR?=
 =?utf-8?B?blkvMGhWZ2JETDAzaFFzc3daZlc5b29zcDFJU0hLSnAvd3ZsWnBMOFllYmhl?=
 =?utf-8?B?aFpESVR4dE9wQmdjNVZMMDJIcDdsNTRnRERmZUgydXp0MTBmVzhYK2puY2ZW?=
 =?utf-8?B?UnVEdDBCaFhnNEZ4NU45ZGFBZEF5Vjk3SER3QTVlM2RxZjhVeGQzTlJlME5x?=
 =?utf-8?B?TmJpODVuekhKQ0M2OHd1UjlwRzQrS1puenUyVzdlbmtzd1BHN09JUjk3MTlP?=
 =?utf-8?Q?BiC4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <12619D4981BD384C8485508A68956B0C@amdcloud.onmicrosoft.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b318472e-de4b-4b6a-47dc-08dcecbed46d
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2024 02:12:33.1400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HsiKqLs2JGSqtf0LOkCYKrU4XHMTTfOwjw6xIT8ksgdvuptd8jYL9GCL71+X2CS5wrzjXSHtUCpMb1hr/ths/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9100

T24gMjAyNC8xMC8xNSAwMzozNCwgU3Rld2FydCBIaWxkZWJyYW5kIHdyb3RlOg0KPiArRWRnYXIN
Cj4gDQo+IE9uIDUvMTYvMjQgMDY6MTMsIEppcWlhbiBDaGVuIHdyb3RlOg0KPj4gSW4gUFZIIGRv
bTAsIGl0IHVzZXMgdGhlIGxpbnV4IGxvY2FsIGludGVycnVwdCBtZWNoYW5pc20sDQo+PiB3aGVu
IGl0IGFsbG9jcyBpcnEgZm9yIGEgZ3NpLCBpdCBpcyBkeW5hbWljLCBhbmQgZm9sbG93DQo+PiB0
aGUgcHJpbmNpcGxlIG9mIGFwcGx5aW5nIGZpcnN0LCBkaXN0cmlidXRpbmcgZmlyc3QuIEFuZA0K
Pj4gdGhlIGlycSBudW1iZXIgaXMgYWxsb2NlZCBmcm9tIHNtYWxsIHRvIGxhcmdlLCBidXQgdGhl
DQo+PiBhcHBseWluZyBnc2kgbnVtYmVyIGlzIG5vdCwgbWF5IGdzaSAzOCBjb21lcyBiZWZvcmUg
Z3NpDQo+PiAyOCwgdGhhdCBjYXVzZXMgdGhlIGlycSBudW1iZXIgaXMgbm90IGVxdWFsIHdpdGgg
dGhlIGdzaQ0KPj4gbnVtYmVyLiBBbmQgd2hlbiBwYXNzdGhyb3VnaCBhIGRldmljZSwgcWVtdSB3
YW50cyB0byB1c2UNCj4+IGdzaSB0byBtYXAgcGlycSwgeGVuX3B0X3JlYWxpemUtPnhjX3BoeXNk
ZXZfbWFwX3BpcnEsIGJ1dA0KPj4gdGhlIGdzaSBudW1iZXIgaXMgZ290IGZyb20gZmlsZQ0KPj4g
L3N5cy9idXMvcGNpL2RldmljZXMvPHNiZGY+L2lycSBpbiBjdXJyZW50IGNvZGUsIHNvIGl0DQo+
PiB3aWxsIGZhaWwgd2hlbiBtYXBwaW5nLg0KPj4NCj4+IEdldCBnc2kgYnkgdXNpbmcgbmV3IGZ1
bmN0aW9uIHN1cHBvcnRlZCBieSBYZW4gdG9vbHMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSHVh
bmcgUnVpIDxyYXkuaHVhbmdAYW1kLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEppcWlhbiBDaGVu
IDxKaXFpYW4uQ2hlbkBhbWQuY29tPg0KPiANCj4gSSB0aGluayB5b3UgY2FuIHNhZmVseSByZW1v
dmUgdGhlIFJGQyB0YWcgc2luY2UgdGhlIFhlbiBiaXRzIGhhdmUgYmVlbg0KPiB1cHN0cmVhbWVk
Lg0KVGhhbmsgeW91ISBJIHdpbGwgc2VuZCBhIG5ldyB2ZXJzaW9uIGxhdGVyIHRoaXMgd2VlayBh
bmQgbW9kaWZ5IHRoZSBwYXRjaCBhY2NvcmRpbmcgdG8geW91ciBjb21tZW50cy4NCg0KPiANCj4+
IC0tLQ0KPj4gIGh3L3hlbi94ZW4taG9zdC1wY2ktZGV2aWNlLmMgfCAxOSArKysrKysrKysrKysr
KystLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2h3L3hlbi94ZW4taG9zdC1wY2ktZGV2aWNlLmMgYi9o
dy94ZW4veGVuLWhvc3QtcGNpLWRldmljZS5jDQo+PiBpbmRleCA4YzZlOWExNzE2YTIuLjJmZTZh
NjA0MzRiYSAxMDA2NDQNCj4+IC0tLSBhL2h3L3hlbi94ZW4taG9zdC1wY2ktZGV2aWNlLmMNCj4+
ICsrKyBiL2h3L3hlbi94ZW4taG9zdC1wY2ktZGV2aWNlLmMNCj4+IEBAIC0xMCw2ICsxMCw3IEBA
DQo+PiAgI2luY2x1ZGUgInFhcGkvZXJyb3IuaCINCj4+ICAjaW5jbHVkZSAicWVtdS9jdXRpbHMu
aCINCj4+ICAjaW5jbHVkZSAieGVuLWhvc3QtcGNpLWRldmljZS5oIg0KPj4gKyNpbmNsdWRlICJo
dy94ZW4veGVuX25hdGl2ZS5oIg0KPiANCj4gVGhlIGluY2x1c2lvbiBvcmRlciB1bmZvcnR1bmF0
ZWx5IHNlZW1zIHRvIGJlIGRlbGljYXRlLg0KPiAiaHcveGVuL3hlbl9uYXRpdmUuaCIgc2hvdWxk
IGJlIGJlZm9yZSBhbGwgdGhlIG90aGVyIHhlbg0KPiBpbmNsdWRlcywgYnV0IGFmdGVyICJxZW11
L29zZGVwLmgiLg0KPiANCj4+ICANCj4+ICAjZGVmaW5lIFhFTl9IT1NUX1BDSV9NQVhfRVhUX0NB
UCBcDQo+PiAgICAgICgoUENJRV9DT05GSUdfU1BBQ0VfU0laRSAtIFBDSV9DT05GSUdfU1BBQ0Vf
U0laRSkgLyAoUENJX0NBUF9TSVpFT0YgKyA0KSkNCj4+IEBAIC0zMjksMTIgKzMzMCwxNyBAQCBp
bnQgeGVuX2hvc3RfcGNpX2ZpbmRfZXh0X2NhcF9vZmZzZXQoWGVuSG9zdFBDSURldmljZSAqZCwg
dWludDMyX3QgY2FwKQ0KPj4gICAgICByZXR1cm4gLTE7DQo+PiAgfQ0KPj4gIA0KPj4gKyNkZWZp
bmUgUENJX1NCREYoc2VnLCBidXMsIGRldiwgZnVuYykgXA0KPj4gKyAgICAgICAgICAgICgoKCh1
aW50MzJfdCkoc2VnKSkgPDwgMTYpIHwgXA0KPj4gKyAgICAgICAgICAgIChQQ0lfQlVJTERfQkRG
KGJ1cywgUENJX0RFVkZOKGRldiwgZnVuYykpKSkNCj4+ICsNCj4+ICB2b2lkIHhlbl9ob3N0X3Bj
aV9kZXZpY2VfZ2V0KFhlbkhvc3RQQ0lEZXZpY2UgKmQsIHVpbnQxNl90IGRvbWFpbiwNCj4+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgYnVzLCB1aW50OF90IGRldiwgdWlu
dDhfdCBmdW5jLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgRXJyb3IgKiplcnJw
KQ0KPj4gIHsNCj4+ICAgICAgRVJSUF9HVUFSRCgpOw0KPj4gICAgICB1bnNpZ25lZCBpbnQgdjsN
Cj4+ICsgICAgdWludDMyX3Qgc2RiZjsNCj4gDQo+IFR5cG86IHMvc2RiZi9zYmRmLw0KPiANCj4+
ICANCj4+ICAgICAgZC0+Y29uZmlnX2ZkID0gLTE7DQo+PiAgICAgIGQtPmRvbWFpbiA9IGRvbWFp
bjsNCj4+IEBAIC0zNjQsMTEgKzM3MCwxNiBAQCB2b2lkIHhlbl9ob3N0X3BjaV9kZXZpY2VfZ2V0
KFhlbkhvc3RQQ0lEZXZpY2UgKmQsIHVpbnQxNl90IGRvbWFpbiwNCj4+ICAgICAgfQ0KPj4gICAg
ICBkLT5kZXZpY2VfaWQgPSB2Ow0KPj4gIA0KPj4gLSAgICB4ZW5faG9zdF9wY2lfZ2V0X2RlY192
YWx1ZShkLCAiaXJxIiwgJnYsIGVycnApOw0KPj4gLSAgICBpZiAoKmVycnApIHsNCj4+IC0gICAg
ICAgIGdvdG8gZXJyb3I7DQo+PiArICAgIHNkYmYgPSBQQ0lfU0JERihkb21haW4sIGJ1cywgZGV2
LCBmdW5jKTsNCj4+ICsgICAgZC0+aXJxID0geGNfcGh5c2Rldl9nc2lfZnJvbV9kZXYoeGVuX3hj
LCBzZGJmKTsNCj4gDQo+IFRoaXMgd2FzIHJlbmFtZWQgdG8geGNfcGNpZGV2X2dldF9nc2kuDQo+
IA0KPiBUaGlzIGFsc28gbmVlZHMgc29tZSBzb3J0IG9mIFhlbiBpbnRlcmZhY2UgdmVyc2lvbiBn
dWFyZCBmb3IgYmFja3dhcmQNCj4gY29tcGF0aWJpbGl0eSBzaW5jZSBpdCdzIGEgbmV3IGNhbGwg
aW50cm9kdWNlZCBpbiBYZW4gNC4yMC4NCj4gDQo+PiArICAgIC8qIGZhaWwgdG8gZ2V0IGdzaSwg
ZmFsbGJhY2sgdG8gaXJxICovDQo+PiArICAgIGlmIChkLT5pcnEgPT0gLTEpIHsNCj4+ICsgICAg
ICAgIHhlbl9ob3N0X3BjaV9nZXRfZGVjX3ZhbHVlKGQsICJpcnEiLCAmdiwgZXJycCk7DQo+PiAr
ICAgICAgICBpZiAoKmVycnApIHsNCj4+ICsgICAgICAgICAgICBnb3RvIGVycm9yOw0KPj4gKyAg
ICAgICAgfQ0KPj4gKyAgICAgICAgZC0+aXJxID0gdjsNCj4+ICAgICAgfQ0KPj4gLSAgICBkLT5p
cnEgPSB2Ow0KPj4gIA0KPj4gICAgICB4ZW5faG9zdF9wY2lfZ2V0X2hleF92YWx1ZShkLCAiY2xh
c3MiLCAmdiwgZXJycCk7DQo+PiAgICAgIGlmICgqZXJycCkgew0KPiANCg0KLS0gDQpCZXN0IHJl
Z2FyZHMsDQpKaXFpYW4gQ2hlbi4NCg==

