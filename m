Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6226FB37E43
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 11:03:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095739.1450641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urC31-0004Gp-Ux; Wed, 27 Aug 2025 09:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095739.1450641; Wed, 27 Aug 2025 09:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urC31-0004Di-RZ; Wed, 27 Aug 2025 09:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1095739;
 Wed, 27 Aug 2025 09:02:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qxfF=3H=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1urC30-0004Dc-I4
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 09:02:26 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c3308bf-8324-11f0-b898-0df219b8e170;
 Wed, 27 Aug 2025 11:02:24 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by AS8PR03MB7923.eurprd03.prod.outlook.com (2603:10a6:20b:426::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 09:02:20 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%6]) with mapi id 15.20.9052.014; Wed, 27 Aug 2025
 09:02:20 +0000
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
X-Inumbo-ID: 8c3308bf-8324-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v8SHMNKOu9HTR2edlr4Yf1kTrht1mscU0v8L2XkN92qMlXM24Teu0WrK/YV2vHCJWlV11o+ruuSEVpoHU073T6erglX2B6CkhTQbj3PPbg9aYZlQ1joV0Ek7fw262HD7BG5oA+6hC9Vum9PUCr/LWc8OOW3qts+EmacTvpR8XLiOC7TCS07ka4LXDUEcQsHNs2pI1E2suJyqkFPid9QDyOD32XFfm9+LXUhPe7wuXiu+4VYbwrATv5dgUeBDRL/Exti8XY4xmbrEHXCZgy4ZUf7J5yvffgCjLoCYc6ybsVW3LwBcB4dMNmSKgt3mI0poiVo3+AFfvnp9WoOz5BdOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eVRJD/FmGe2MSXvM4mkEiVtZBLzPpImx5UumxDWy7w0=;
 b=pEGI19heIww3+61Brfw0jhzgD9cOszP5icPW9CZsPDago43qxT3/m6jX7LjlVxYIOAFgKHEiZnSQeLFwnb453C6SwEpvB7pYoCITtMomddsvYqPtOBiJu4EgcEdCqnvHDtRkyBrSeot0AC4dn7ie1SlmU7ekWHyEjRqPIaKF77v2yQgDro9i5ozVN0KgCNC23ziIB4qambuZTIUBVkJk/qc9tlM4aJlFFVYZ304+cKyyFYwC03PiDedtelZfg8Vf2MZdBOALCGaC3mrBWbiwXnp+hz4yZ5v/+Dsf7XsvbRj4B8H+ycv381OKWWI5e+dwniXp+EfBxZ/aebvyX7Robg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eVRJD/FmGe2MSXvM4mkEiVtZBLzPpImx5UumxDWy7w0=;
 b=gXW42/clk2FByMdmWhH1h4RA5Pu5jR+KW6YTgVJ8HekOhP6WZx/wGxiv3dz8CnBBfqgS6EXiw3tV6HGrmw259Z4zIBx0stmv+ZdhgCi5a2vqRKTbbO+3lyVZNHLOT4FjF+c8jp2sjy8IdnEw2BxqwrpYYcaOTBdTYh7+zUzd9LQC79DtELP+xOZwm42JamjRILbot+qrus6Th+JwP8GiNwz1xl/aLGTA+NIA1NT1j6MSKfWe6JsueZ5Uyz61Sjhj75p5FiX8pGa4ikpVKlZO630L42lQr2t5PNq53oV7YyZK1fPyaKQCVSa4+K1Bb+glcs/2qG2pBg3FXaIV4d0Y3Q==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Jan
 Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Grygorii Strashko
	<grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v5 02/10] xen/arm: scmi-smc: update to be used under
 sci subsystem
Thread-Topic: [RFC PATCH v5 02/10] xen/arm: scmi-smc: update to be used under
 sci subsystem
Thread-Index: AQHb+v2VN6PNmY5o9E6echLDtYWg47RvkxgAgAbZdoA=
Date: Wed, 27 Aug 2025 09:02:20 +0000
Message-ID: <1f64aa13-d9d3-4b58-9581-a45f7173430b@epam.com>
References: <cover.1753184487.git.oleksii_moisieiev@epam.com>
 <a6a538ca4c02483e745f18db4f74504dad525fe6.1753184487.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2508221709020.2743087@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2508221709020.2743087@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|AS8PR03MB7923:EE_
x-ms-office365-filtering-correlation-id: 421607be-2b82-4d9d-6a48-08dde5486dfc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?blVzd0I5Smh1OFBKdzNqYXR0bWhiK01DcHdhTXAvSno2UnRkQnVZQ0NVQk0z?=
 =?utf-8?B?elBEVHhHcVgyRERadWZZK3dlam8zQVE2L1RvZTcxRkt4cFI3N2hiblJvOFB2?=
 =?utf-8?B?alFlQkhleXozT2EyTFlCaVpNTmxQRit6VE43MGU2bkM4S05raHZ3dlA1dmk0?=
 =?utf-8?B?cEZCbmVZVFhPYy9lMzFuKzhRUzhqMm9pUXhNUVI0aStuN3AwMWNMTy9Vb0Yy?=
 =?utf-8?B?a1F0TzUvRFBYYXR0SWRJR2RIQUpsUGRoUk5FMDVTUW9KdzhBZVowMExIa2t2?=
 =?utf-8?B?aEhEM3h1cGUwb25vbG54b3ZyZjlZeGZZbzBHVm54TGdJcDN4R2VMa1RIZGR3?=
 =?utf-8?B?RnBNSzNaUEQ3UUpPS2RFRHhQSkVwZFp0aVVxaTUwcEtxdWtxVE1SZ2dJM1li?=
 =?utf-8?B?cUlwSEtPS09VM2sxUjVJWW5MeURHN2UrWFY0RmU0aDZsWkh1ZEg1WTJxbC9X?=
 =?utf-8?B?aTZKZ09FK0JyT1RlSEdjUFAvOEdOa0dOU1M5VnhBdTBtZC9EdWRFWFh4bVpK?=
 =?utf-8?B?dS8zcy9rRUF5dnVZSCtEYzkrcG9abE5KNGVvSzBPRFdmcGduM3JCY1lYV1BZ?=
 =?utf-8?B?cjZSTXlvTTRRQ3JhWUlCZHVMeWw1aUFvOXYrTThqakZLRmJPR0d3L251dnFy?=
 =?utf-8?B?NWxjZTRieU01UGFnV1lzdlh2TmdBdWxHRjloNmZ5YUcwUW10QlRGQ0lwLytw?=
 =?utf-8?B?V0tWMEp0WHJ1bEFEbkpXRDBLOEhvVzRaK3lKQ2UrK2t2czF4Zm1yR2UzZHMv?=
 =?utf-8?B?alI5NExMTlEyQXRoc0g0UEdnV054WlZNWUZkelgyZXJiQ1ZhT2Vac2hWSkJm?=
 =?utf-8?B?bW9tby9EQlpUM0NCMkhGSGcwQzNZdzlSbVZQVFRjeU1nV3NoaVJxazBEV1Fk?=
 =?utf-8?B?ZGYvcjgxaHgzb1BkcWtUc2NIVVBIM1hZRjlockt2Z0dYV2wzOEdXWFpoZWZ0?=
 =?utf-8?B?MFhrMmdTeTFOU3hvOTNEMENsMDJIdmcyMVJvVWFXdlV4MkxnY2lUL1lSeE9i?=
 =?utf-8?B?Qll1Q2R1K1JDVnUwdnQxWWtrNmdXVlVveVZudmg2ZkRFWVUrbmVHWGtRb3RD?=
 =?utf-8?B?WnllQzYyRGFtQjRMakxLdXd4dGRSQjJFM2pkMHl2RVdrZG5NRm8zWnRscGJZ?=
 =?utf-8?B?SllsYnJJaXI2R0NGc3IxbTd5WW1oR1R1dzFMQ2lWYVRyWDJSdFM4eGJGSHBu?=
 =?utf-8?B?N0VVQVU0TC9CaDBCeTdZdVZiN1dYRzVMWWpQcTZQbEdnT3FFQ0tncEc2czNW?=
 =?utf-8?B?QzVuK1VkYjBwcVhCaXM0RFg1NDFoMWFGTm1sN01MZ0dyeUZsR01BQTJVSkVC?=
 =?utf-8?B?NnN4cGw4VHRIY1M0YXU3L3Qxa1ZiQnd2VnhVYlFQQ2lWTVNld212cjYvM3Y0?=
 =?utf-8?B?bWdsREI4YWJhYkZTbVFGTzdERkdVWmtNRis1WUloMzhYWFY4VVdQUFNVekhT?=
 =?utf-8?B?S0JDNUM1QVNJMXY5SHlRYlpNRVFyRTllS0QyanRlM1B5UHpDQTNiOVE1VWZX?=
 =?utf-8?B?SHNFZ1JaYkZKTTVpVUtUclN6ZzBEN1o4K0pqQ21KaUVGeEFGS3lQc3kvQmhQ?=
 =?utf-8?B?UXQ3UWJJRnBvMFRudCtqcFpDVWtKbnM4b0hIZ3BLeVg3QkFIWlo4TkZOc1NE?=
 =?utf-8?B?Qlh5T1VZemRVcDRmcktWMXNXMFNWQkwxUVgrRnpNR2VOYXZaYmlSSmM3bVFy?=
 =?utf-8?B?Sml3TldUWmhlYXVFT3ZFeWp0TlR6cjd4dGgxMTNmN3MyN2xWSHBPV0dWSkJX?=
 =?utf-8?B?S0lRTVNZWHJXL0lrR1FYVEpsVEd0L3FXUzNWVy8wUTRabGdwaG0xdHZUV0lC?=
 =?utf-8?B?aEkwMVJVa0JrUmt2eGtTbyszL01IM3lFMUY0V05CMXAvNGdhVm4yZit5Q3ZS?=
 =?utf-8?B?Vy9FUmkzS0JiMUh3S1hxWnNPenFXY2VpWXpkVlg0UENHQ3laRkU0L2ZVeHlL?=
 =?utf-8?B?Q1dsSG1JMC82S0hGZlJ5WDFudVFXbTFZSDM2ZzdUSitUc3FzUmV0NDdCQWRr?=
 =?utf-8?B?WFVFam02QU1nPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QUd6b3FvamlxeEdSanlWbDc3ZDBJSFVtMTFPaUFhZHAzaGh1b29qb2ZJdFQx?=
 =?utf-8?B?dktvTHo4WlBqdHdBQUlkOWZaaUhxOVd6Rzc0UEhvMTRhUUhzeU5Ec0cwWGNl?=
 =?utf-8?B?N25aVnh4RHY3d1poWUZjVjJCT0hxamRXMWZSRUdjc3RUZHY5UDRmcGJjVHFu?=
 =?utf-8?B?akNva2ZWNlgzSW5ZVmdoWlBlSHQ4d3RhYnEvSGxsQS9CNjJLbHQ2cFJ1ZCtq?=
 =?utf-8?B?bHZEem5CYVhmb3NtVDFxY09ZRDQ2bTNyUTAvbEtZMU55UW1xT2NwckhtQTVK?=
 =?utf-8?B?ZW9EZ1FwVGNjWEdtMUs4d0tuYjlZT21NNEp4eXZROWFJcnRSei9iQm54bVVN?=
 =?utf-8?B?bjRDcm9LQTlDNkE2RGtKaVo4VjVNby9SRUc0VlFPK2szMzhZRENPSUJqSzdQ?=
 =?utf-8?B?Mks1MWc5cjJOT2duZDcxZHpzUXJlSU1uSXVvTmNiRjlncmEyZ0tRMUpkYnNh?=
 =?utf-8?B?UStCSUphYzFmbStXWEY5RzhTRVF5aUVNaTVNN1diTzJlM1JQMlcwQWtjVnpk?=
 =?utf-8?B?RXliTUlodkZ6TGk5bitJblBRdmJ3dlowcGtNRVJYQmpWT2h6eElNdXFOQlVi?=
 =?utf-8?B?WExjMXlGUzdCcFZRY3N2Ry9qOEUxWHRxYkV0ZWtsSGdLWWNVa1pnVnRBcHlu?=
 =?utf-8?B?c1VHY0YrSUVDUCs0SEptQjFWK0pQVitMWmRpcG9qWkMramdTMnZUcXBGTmRz?=
 =?utf-8?B?TnUrbTZJMW9GUFhtQ0N0dlBza3JGaFVoVlVHaFpUb2ZHZHlVT29zakdncU9u?=
 =?utf-8?B?VTlJODYvNWV1WlMzalo2M0tsRmN0Q1NPV3pob0g5aFZDdlNvbkZBQUMyWjh1?=
 =?utf-8?B?a3N4eEVDT2p0YStaM2FVZUREVzJoMUZYbGNic2pmb0tzcll4WVJUbnAwZUx1?=
 =?utf-8?B?VXBkTFlacTFLdzQwQmVYUGZkTlB2enhuN1R1djVIaHAxK0hva1ZSYUVWQXpz?=
 =?utf-8?B?U3NkU3NxZVFSZk5DVUlONXhwN0dVQUJrZmZTOHk0THZMck5sWmFocDRYbnFZ?=
 =?utf-8?B?Y081eXI5NUJJV2FTWUdnM0JzbDJKVFJJTEpyOGRzUndDWlNPRVRBRGtMZ0Nj?=
 =?utf-8?B?VGt6TGhCWXhqMy9laUNOeU1wcXYyTDVyMDc2QkVnd2craXNsZnUvaWxkaHVX?=
 =?utf-8?B?SmZqRXh2S3ZHbVptZndCZjBuRXBPZGo3UmMzMlN0Zkw3eWJ6cWx1UnBMandh?=
 =?utf-8?B?cEdFdlcraDNjMml0UlBvZjY3Q3JodDhoOHdpb1NoKzlia1liM09JNEJSblNh?=
 =?utf-8?B?dyt3MUlpQnp5WktTVWR0Vzc3QUxmMTR2MGdaOUM0UWNnUjN6YVFla2c4VGN5?=
 =?utf-8?B?QVFzeThPS0NmM2txbktXV2NCTEthWUduQmViYis3NUxKVWl6VmpzMFAxcUdN?=
 =?utf-8?B?YlI3N2FZVUgyelFJUWo5TDIzdWN6Y25hUGcrOStxaGVPZmF2WTFmTVFzUXFF?=
 =?utf-8?B?QXZPaFpGaE1LVjFQTnlaeDE1dTJiUTV1YzN2L2QvS0EwcFR3UHVLWlNxV25P?=
 =?utf-8?B?TVBvWGNSRzhlM3FmTHdaeFNTczlZRFdUaVJZKzQwRVAyY3NqVVZROGRId3Zo?=
 =?utf-8?B?SitEQjFGTUQvd0xROUM1UWRXUkhGakF6L21xTHZuYjRNd1ROR3JzOTlPQUs0?=
 =?utf-8?B?MERxaVljRzZYWUZibm1XS2JPSXNGaXJTREExcURIVkNlY1pTWWZMUDZZUjBD?=
 =?utf-8?B?U29iWVZibHhEVHZINTNPMjhSd3Y4VkVNMjRLR1VXTkt3T2JlUlNWTjh6emRj?=
 =?utf-8?B?NERieUc1Mk9QM2VxRk9KSFRkRW5aOUNqVGYvcmhXZUd4WHh1aTZzMHRLVVUy?=
 =?utf-8?B?OWF6ZXhqUGtCUnRxRCszNW9scXEvbnRwYllMc3ZEb3JKZ1pibnpvYnhaa2Qv?=
 =?utf-8?B?MUxVNTRIWXVXSkdiL3lkbFJSQTAvRCs5aEpnb2lVa0tuQWZtS05ORWVEa2NJ?=
 =?utf-8?B?MUc4SEhsZVg5c0xlaUF0TGltUklaVERXeTJnaFNNMmVFS3d3bHNuMXVPNXI3?=
 =?utf-8?B?eWY0ZFVzYnJiNFpTRm43ZVdEVkU1TW5xN3RWZXZQWUJCRGdmeGdkZEcyb1ZQ?=
 =?utf-8?B?TFAvM3dMbUFRclBtMC9qSVY2NDg2RVV5UHNlakVtWktmNTNsQTRmdFY3WDhM?=
 =?utf-8?B?dENrMVFJVlJUVGFMSmxSNWtSYlVRTTlzbTBLSkJNZXdSb3oraVpoNDZvZVh0?=
 =?utf-8?B?VkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BF004FCBCC25534D96E17CC4487E27FE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421607be-2b82-4d9d-6a48-08dde5486dfc
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 09:02:20.1949
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BaBgZRWWelIWOkWatKm7veDXuViBuKllDwdgYumpYBSxvmJqno2oTeB5RVgPmC4B6LUFovkaeLVBBkfF6hAxEwiJrGdMVvQ19SqpfmiU+aw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7923

DQoNCk9uIDIzLzA4LzIwMjUgMDM6MjYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToNCj4gT24g
VHVlLCAyMiBKdWwgMjAyNSwgT2xla3NpaSBNb2lzaWVpZXYgd3JvdGU6DQo+PiBGcm9tOiBHcnln
b3JpaSBTdHJhc2hrbyA8Z3J5Z29yaWlfc3RyYXNoa29AZXBhbS5jb20+DQo+Pg0KPj4gVGhlIGlu
dHJvZHVjZWQgU0NJIChTeXN0ZW0gQ29udHJvbCBJbnRlcmZhY2UpIHN1YnN5c3RlbSBwcm92aWRl
cyB1bmlmaWVkDQo+PiBpbnRlcmZhY2UgdG8gaW50ZWdyYXRlIGluIFhlbiBTQ0kgZHJpdmVycyB3
aGljaCBhZGRzIHN1cHBvcnQgZm9yIEFSTQ0KPj4gZmlybXdhcmUgKEVMMywgU0NQKSBiYXNlZCBz
b2Z0d2FyZSBpbnRlcmZhY2VzIChsaWtlIFNDTUkpIHRoYXQgYXJlIHVzZWQgaW4NCj4+IHN5c3Rl
bSBtYW5hZ2VtZW50LiBUaGUgU0NJIHN1YnN5c3RlbSBhbGxvd3MgdG8gYWRkIGRyaXZlcnMgZm9y
IGRpZmZlcmVudCBGVw0KPj4gaW50ZXJmYWNlcyBvciBoYXZlIGRpZmZlcmVudCBkcml2ZXJzIGZv
ciB0aGUgc2FtZSBGVyBpbnRlcmZhY2UgKGZvciBleGFtcGxlLA0KPj4gU0NNSSB3aXRoIGRpZmZl
cmVudCB0cmFuc3BvcnRzKS4NCj4+DQo+PiBUaGlzIHBhdGNoIHVwZGF0ZXMgU0NNSSBvdmVyIFNN
QyBjYWxscyBoYW5kbGluZyBsYXllciwgaW50cm9kdWNlZCBieQ0KPj4gY29tbWl0IDNlMzIyYmVm
OGJjMCAoInhlbi9hcm06IGZpcm13YXJlOiBBZGQgU0NNSSBvdmVyIFNNQyBjYWxscyBoYW5kbGlu
Zw0KPj4gbGF5ZXIiKSwgdG8gYmUgU0NJIGRyaXZlcjoNCj4+IC0gY29udmVydCB0byBEVCBkZXZp
Y2U7DQo+PiAtIGNvbnZlcnQgdG8gU0NJIFhlbiBpbnRlcmZhY2UuDQo+Pg0KPj4gVGhlcmUgYXJl
IG5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBpbiBnZW5lcmFsLCB0aGUgZHJpdmVyIGlzIGp1c3QgYWRv
cHRlZA0KPj4gdG8gdGhlIFNDSSBpbnRlcmZhY2UuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogR3J5
Z29yaWkgU3RyYXNoa28gPGdyeWdvcmlpX3N0cmFzaGtvQGVwYW0uY29tPg0KPj4gU2lnbmVkLW9m
Zi1ieTogT2xla3NpaSBNb2lzaWVpZXYgPG9sZWtzaWlfbW9pc2llaWV2QGVwYW0uY29tPg0KPj4g
LS0tDQo+Pg0KPj4NCj4+DQo+PiAgIHhlbi9hcmNoL2FybS9maXJtd2FyZS9LY29uZmlnICAgICAg
ICAgICAgICAgIHwgMTMgKystDQo+PiAgIHhlbi9hcmNoL2FybS9maXJtd2FyZS9zY21pLXNtYy5j
ICAgICAgICAgICAgIHwgOTMgKysrKysrKysrKystLS0tLS0tLS0NCj4+ICAgeGVuL2FyY2gvYXJt
L2luY2x1ZGUvYXNtL2Zpcm13YXJlL3NjbWktc21jLmggfCA0MSAtLS0tLS0tLS0NCj4+ICAgeGVu
L2FyY2gvYXJtL3ZzbWMuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArLQ0KPj4gICB4
ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCAgICAgICAgICAgICAgICB8ICAxICsNCj4+ICAg
NSBmaWxlcyBjaGFuZ2VkLCA2NCBpbnNlcnRpb25zKCspLCA4OSBkZWxldGlvbnMoLSkNCj4+ICAg
ZGVsZXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9maXJtd2FyZS9zY21p
LXNtYy5oDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9maXJtd2FyZS9LY29uZmln
IGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL0tjb25maWcNCj4+IGluZGV4IGZjNzkxOGM3ZmMuLmJi
Zjg4ZmJiOWEgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZmlybXdhcmUvS2NvbmZpZw0K
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL0tjb25maWcNCj4+IEBAIC04LDkgKzgsMTgg
QEAgY29uZmlnIEFSTV9TQ0kNCj4+ICAgDQo+PiAgIG1lbnUgIkZpcm13YXJlIERyaXZlcnMiDQo+
PiAgIA0KPj4gK2Nob2ljZQ0KPj4gKwlwcm9tcHQgIkFSTSBTQ0kgZHJpdmVyIHR5cGUiDQo+PiAr
CWRlZmF1bHQgU0NNSV9TTUMNCj4+ICsJaGVscA0KPj4gKwlDaG9vc2Ugd2hpY2ggQVJNIFNDSSBk
cml2ZXIgdG8gZW5hYmxlLg0KPj4gKw0KPj4gK2NvbmZpZyBBUk1fU0NJX05PTkUNCj4+ICsJYm9v
bCAibm9uZSINCj4+ICsNCj4+ICAgY29uZmlnIFNDTUlfU01DDQo+PiAgIAlib29sICJGb3J3YXJk
IFNDTUkgb3ZlciBTTUMgY2FsbHMgZnJvbSBod2RvbSB0byBFTDMgZmlybXdhcmUiDQo+PiAtCWRl
ZmF1bHQgeQ0KPj4gKwlzZWxlY3QgQVJNX1NDSQ0KPj4gICAJaGVscA0KPj4gICAJICBUaGlzIG9w
dGlvbiBlbmFibGVzIGJhc2ljIGF3YXJlbmVzcyBmb3IgU0NNSSBjYWxscyB1c2luZyBTTUMgYXMN
Cj4+ICAgCSAgZG9vcmJlbGwgbWVjaGFuaXNtIGFuZCBTaGFyZWQgTWVtb3J5IGZvciB0cmFuc3Bv
cnQgKCJhcm0sc2NtaS1zbWMiDQo+PiBAQCAtMTgsNCArMjcsNiBAQCBjb25maWcgU0NNSV9TTUMN
Cj4+ICAgCSAgZmlybXdhcmUgbm9kZSBpcyB1c2VkIHRvIHRyYXAgYW5kIGZvcndhcmQgY29ycmVz
cG9uZGluZyBTQ01JIFNNQ3MNCj4+ICAgCSAgdG8gZmlybXdhcmUgcnVubmluZyBhdCBFTDMsIGZv
ciBjYWxscyBjb21pbmcgZnJvbSB0aGUgaGFyZHdhcmUgZG9tYWluLg0KPj4gICANCj4+ICtlbmRj
aG9pY2UNCj4+ICsNCj4+ICAgZW5kbWVudQ0KPj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9m
aXJtd2FyZS9zY21pLXNtYy5jIGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3NjbWktc21jLmMNCj4+
IGluZGV4IDMzNDczYzA0YjEuLjEzZDExMzc1OTIgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vZmlybXdhcmUvc2NtaS1zbWMuYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL2Zpcm13YXJlL3Nj
bWktc21jLmMNCj4+IEBAIC05LDYgKzksNyBAQA0KPj4gICAgKiBDb3B5cmlnaHQgMjAyNCBOWFAN
Cj4+ICAgICovDQo+PiAgIA0KPj4gKyNpbmNsdWRlIDxhc20vZGV2aWNlLmg+DQo+PiAgICNpbmNs
dWRlIDx4ZW4vYWNwaS5oPg0KPj4gICAjaW5jbHVkZSA8eGVuL2RldmljZV90cmVlLmg+DQo+PiAg
ICNpbmNsdWRlIDx4ZW4vZXJybm8uaD4NCj4+IEBAIC0xNiwxMiArMTcsMTEgQEANCj4+ICAgI2lu
Y2x1ZGUgPHhlbi9zY2hlZC5oPg0KPj4gICAjaW5jbHVkZSA8eGVuL3R5cGVzLmg+DQo+PiAgIA0K
Pj4gKyNpbmNsdWRlIDxhc20vZmlybXdhcmUvc2NpLmg+DQo+PiAgICNpbmNsdWRlIDxhc20vc21j
Y2MuaD4NCj4+IC0jaW5jbHVkZSA8YXNtL2Zpcm13YXJlL3NjbWktc21jLmg+DQo+PiAgIA0KPj4g
ICAjZGVmaW5lIFNDTUlfU01DX0lEX1BST1AgICAiYXJtLHNtYy1pZCINCj4+ICAgDQo+PiAtc3Rh
dGljIGJvb2wgX19yb19hZnRlcl9pbml0IHNjbWlfZW5hYmxlZDsNCj4+ICAgc3RhdGljIHVpbnQz
Ml90IF9fcm9fYWZ0ZXJfaW5pdCBzY21pX3NtY19pZDsNCj4+ICAgDQo+PiAgIC8qDQo+PiBAQCAt
NDEsMTQgKzQxLDExIEBAIHN0YXRpYyBib29sIHNjbWlfaXNfdmFsaWRfc21jX2lkKHVpbnQzMl90
IGZpZCkNCj4+ICAgICoNCj4+ICAgICogUmV0dXJucyB0cnVlIGlmIFNNQyB3YXMgaGFuZGxlZCAo
cmVnYXJkbGVzcyBvZiByZXNwb25zZSksIGZhbHNlIG90aGVyd2lzZS4NCj4+ICAgICovDQo+PiAt
Ym9vbCBzY21pX2hhbmRsZV9zbWMoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+PiArc3Rh
dGljIGJvb2wgc2NtaV9oYW5kbGVfc21jKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4g
ICB7DQo+PiAgICAgICB1aW50MzJfdCBmaWQgPSAodWludDMyX3QpZ2V0X3VzZXJfcmVnKHJlZ3Ms
IDApOw0KPj4gICAgICAgc3RydWN0IGFybV9zbWNjY19yZXMgcmVzOw0KPj4gICANCj4+IC0gICAg
aWYgKCAhc2NtaV9lbmFibGVkICkNCj4+IC0gICAgICAgIHJldHVybiBmYWxzZTsNCj4+IC0NCj4+
ICAgICAgIGlmICggIXNjbWlfaXNfdmFsaWRfc21jX2lkKGZpZCkgKQ0KPj4gICAgICAgICAgIHJl
dHVybiBmYWxzZTsNCj4+ICAgDQo+PiBAQCAtNzgsNDkgKzc1LDQ1IEBAIGJvb2wgc2NtaV9oYW5k
bGVfc21jKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKQ0KPj4gICAgICAgcmV0dXJuIHRydWU7
DQo+PiAgIH0NCj4+ICAgDQo+PiAtc3RhdGljIGludCBfX2luaXQgc2NtaV9jaGVja19zbWNjY192
ZXIodm9pZCkNCj4+ICtzdGF0aWMgaW50IHNjbWlfc21jX2RvbWFpbl9pbml0KHN0cnVjdCBkb21h
aW4gKmQsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2Rv
bWN0bF9jcmVhdGVkb21haW4gKmNvbmZpZykNCj4+ICAgew0KPj4gLSAgICBpZiAoIHNtY2NjX3Zl
ciA8IEFSTV9TTUNDQ19WRVJTSU9OXzFfMSApDQo+PiAtICAgIHsNCj4+IC0gICAgICAgIHByaW50
ayhYRU5MT0dfV0FSTklORw0KPj4gLSAgICAgICAgICAgICAgICJTQ01JOiBObyBTTUNDQyAxLjEg
c3VwcG9ydCwgU0NNSSBjYWxscyBmb3J3YXJkaW5nIGRpc2FibGVkXG4iKTsNCj4+IC0gICAgICAg
IHJldHVybiAtRU5PU1lTOw0KPj4gLSAgICB9DQo+PiArICAgIGlmICggIWlzX2hhcmR3YXJlX2Rv
bWFpbihkKSApDQo+PiArICAgICAgICByZXR1cm4gMDsNCj4gU2hvdWxkIHdlIGFsc28gY2hlY2sg
Zm9yIGNvbmZpZy0+YXJjaC5zY2lfdHlwZSA9PQ0KPiBYRU5fRE9NQ1RMX0NPTkZJR19BUk1fU0NJ
X1NDTUlfU01DID8NCj4NCkN1cnJlbnQgY2hhbmdlcyBhc3N1bWUgdGhhdCBvbmx5IFNDTUlfU01D
IGlzIHByZXNlbnQuIFRoaXMgY2hlY2sgd2FzIA0KYWRkZWQgaW4gdGhlIHN1YnNlcXVlbnQgcGF0
Y2ggd2hlbiBtdWx0aWFnZW50IHdhcyBpbnRyb2R1Y2VkLg0KPj4gKyAgICBkLT5hcmNoLnNjaV9l
bmFibGVkID0gdHJ1ZTsNCj4+ICsgICAgcHJpbnRrKFhFTkxPR19ERUJVRyAiU0NNSTogJXBkIGlu
aXRcbiIsIGQpOw0KPj4gICAgICAgcmV0dXJuIDA7DQo+PiAgIH0NCg==

