Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980EEB9E00B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 10:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130205.1469796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1h7P-0000LC-RU; Thu, 25 Sep 2025 08:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130205.1469796; Thu, 25 Sep 2025 08:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1h7P-0000Hk-O0; Thu, 25 Sep 2025 08:14:23 +0000
Received: by outflank-mailman (input) for mailman id 1130205;
 Thu, 25 Sep 2025 08:14:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bul+=4E=epam.com=Oleksii_Moisieiev@srs-se1.protection.inumbo.net>)
 id 1v1h7O-0000HI-Mr
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 08:14:22 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a12a844f-99e7-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 10:14:17 +0200 (CEST)
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com (2603:10a6:102:32e::21)
 by GV2PR03MB8583.eurprd03.prod.outlook.com (2603:10a6:150:77::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Thu, 25 Sep
 2025 08:14:13 +0000
Received: from PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc]) by PAVPR03MB8946.eurprd03.prod.outlook.com
 ([fe80::f12d:7394:bbe3:dfc%5]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 08:14:13 +0000
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
X-Inumbo-ID: a12a844f-99e7-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2pHc2Qdydswqmr08DwzAP9l880h15mu2v5q5W9j1+BnfhMHuq5ArAeXeq8BES5pOlTBFkqTIukBIwlVx4QdYjpA52fdbM8eat3pzidZIvRCT1W7E080x2bk93lbR/ylYVTWRlSNZSGo2A73yKG072Dce9TielfwhrZRPUK8Rxk27ceYAeI6rhUfcEpFcbRb40Jwt7v05IUwEM7TLa+YuJpJQ19gs/0lCTjzvLHe4dSY0Ubse+bdEZrrXbGQhTr82qQskR4C9DZBEfYGAmtnSEIhhctHyhSI+g1cIEpYp1uIKsH4/twUcYHuk559Eza0gqsfT+/qK+EbkHpY+JenRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iDhYqQ1ZAJ9/W11nuhGfG3cuPN7qiNQ43xN42sm1lw=;
 b=CgOopAVPBAiqJUGzYtIEZmkem4xnBR4JTmAgERXIF9wqFnGvTiELvJTYUluaMCTe7HATUmHH0ruSnZ1E6VPRvNVrNQQOKQJqwWqnCmDF+UGL7tFnf2zYR52umGvLQmKfCSysjUHEVeDIg/DqN2hB28nHXaM9Yp1EWZ01GRnwIe+E3QDt9//uW02Tku9Hq1hwNdHV9Zgvxkhmf7lTbgPALTfUvMv/WZsB2Zq2Sqy/imtaBwKuuMGAlteWrk8OA7N/7wVWefkiUIw0n/Yx3/p+yT0njpZncqdtZ4dw91n9plKF6fZuMEIWRhpUjV+5FhaMkjC/fxvpWe9FMrRwWToCkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iDhYqQ1ZAJ9/W11nuhGfG3cuPN7qiNQ43xN42sm1lw=;
 b=A/VOkrXQYbDEbI5R6seV1kmjg+IKVfXX/Bhlwxu91rMUKrsyCTq6BqiVyM/E5WRM2zvKbohJdZiUXdGqa2nKQ76PaiJJWr8nxMXpnPKZuowYZ+KAZTg2FQ/3znpDhuXaXbEjqxbx/0zACvuR0YHwCXRNdVscLu03hSGIBpk4VYvjLed4g9cIsIf9TOVtq8kbr9vT7qYKUgYuU3LUsdPNiEF5qKT7Ogs64Y3n3lwurgwfnhZheQ4WgTxNWoAsrGcqJdrs9cKftbQ6uTtENljoWCR3E8CaUWuAmfAwBAp86oy19c2mgVt59Ll2swjJV93pUyG4+lkd7SQLwG4uOVtkIw==
From: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Topic: [PATCH v3] xen/arm, xen/common: Add Kconfig option to control
 Dom0 boot
Thread-Index: AQHcLWxn561sYuCM3E640/FLnKWxSrSjchMAgAAbxQA=
Date: Thu, 25 Sep 2025 08:14:13 +0000
Message-ID: <fba9650a-0015-435f-bca7-5876c952bcdd@epam.com>
References:
 <34e1b5036361745db2fde233e0935a568c0ebc90.1758729618.git.oleksii_moisieiev@epam.com>
 <9507e775-f9c3-4351-9c76-ca939c1147bc@suse.com>
In-Reply-To: <9507e775-f9c3-4351-9c76-ca939c1147bc@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB8946:EE_|GV2PR03MB8583:EE_
x-ms-office365-filtering-correlation-id: a553573a-9445-4f7d-8ea8-08ddfc0b8340
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?WVFabEp3QnA5M3dNUUFaOXVpbHVWMjZFV1dmNkxRMFJ2Rm4yam9ocllOUEVo?=
 =?utf-8?B?S1M5QndLeGZxWGlkOFUrY1R5Q25lRDdTYnNnWVdOTkNpcGpIZTJNMDZXL1VW?=
 =?utf-8?B?WUsrbEpyM1ZuU3h3OFVhQldPNnhUQjAxU0lFU0xqNUY0SlNXT2ZkdE9WNjJs?=
 =?utf-8?B?S0dnYXB1OCtpcTM5dkcweFNJMU5KOHJzZWVFMEp0M3FKTGpKWVdpRnM2dWpF?=
 =?utf-8?B?VzV3bGVVV3JFSDZGbmlka2VPYmdwaHNXM0VvV1FSbXlBM2ZtdEVjaXhkd0xk?=
 =?utf-8?B?SEQ4T0M5M1pIVHhUTkNaYXRHMUp5TGZvQ1EzeWk5Y0pxcTROeUdKK3B1VEhE?=
 =?utf-8?B?eE4rK3RUWkYzaFlwaVFraTgvOUs2UWxuQngvK0UvdDR6SCs5anpxZ0dZREg5?=
 =?utf-8?B?b0JCUzEvWUdlY1hydWQxUkIyN2V6UDBDSWZ4WkRCV1EyY25WMGtrdXhTSStq?=
 =?utf-8?B?d1drOTJUOExCeUUyS29DUVZIRDhCSUZUL1lRancvbEFhblkwK3pOZTlZVTg3?=
 =?utf-8?B?VVQ4ajRRSndqbTZGRU9LK2hVNDlJNXM2bkx1Wmx6cldMSWwva2xwYTR6czgz?=
 =?utf-8?B?UkdvbHRkQnZONGdrc0xLelZZVVFzY0hOc0NzeFprTVgzaytmMENBcXRmQzdi?=
 =?utf-8?B?NmFwamhteDQrUXZVbzNQN2R2NzdSZk9KL3pOazdGcDNUWENEVmlFUlBURnd6?=
 =?utf-8?B?dzJUeEo1MkQ4MXZFWUJlb3NkdkxISTl6eEFLTGIvdkwxWnNGNDdlTkZGYWY3?=
 =?utf-8?B?c0Z2K1oxUnhKdk5HOGUxSVV5RkxkU3B3dHJnTXF1S2NRVm5sZHRETGhQVDUx?=
 =?utf-8?B?cUk2Vk5JQ3hnK2prdUExWWpoWURpWU1xc3J1UjZ0UjZhOVNxTjI2YXhnSndq?=
 =?utf-8?B?ZXVEbDRQcUZhUGJCdVVHOHIvSG1kcW1wTHNpaGFVcnlkRHFTWEU2ajVxemhD?=
 =?utf-8?B?dmVNb1R6V0tQbDRGRUdtcHRMN1poWC9JcVZEbXdqQUJDam1TWkczQzhWUHlB?=
 =?utf-8?B?R3pGQyt5dlFVNnhEUzlZcUxieXpCTC9ha0hudURDeEJGUFVmTHdRR2VqMERs?=
 =?utf-8?B?REk0ajZoTU5jNTYvRVhNY0pJalJJVWQ5MHYwbWJVRHRjTHRvQXVvQ2Z6SFdm?=
 =?utf-8?B?NUEzeXJkeE1CdlZIQUMySHU1YkVjZDN2S2gvM2hrQ2NEUzFFWjNjeVRpc25J?=
 =?utf-8?B?bDRaSkpNb1ZkcUxJeTlNQzh2WkhkN3plai9xUnYvWGJUaVRlUlFkclgxdmhH?=
 =?utf-8?B?NUxDQ0lkenFnUHdLK1pSTElCbjE0emYwTHFSV2VKdStBaG5LTUxqUnN6b1U4?=
 =?utf-8?B?Zi9PV2dETVM3bU5xbDZTNytDMi9lUEVHV3FQeThWdURscGh1ZTFHTUZkcHRH?=
 =?utf-8?B?MUFmdEVhc2dUQmszWFhLZGtDYnpOak9oM2xvU0QvL3lCbmFYbWtwOEthcWVU?=
 =?utf-8?B?K0ZKR0dCZ0hGN3VJQ1UwSUpYTEZPV1lJUlZiTVk4SXFraUEyWnVTbmU1L250?=
 =?utf-8?B?SzNYY0hoN1FVY3dJVFBQRFhUdzlCMlNyeUI3UzMySjFVbmJFUmIrTEk0RnI3?=
 =?utf-8?B?T2xLbzFMVU94bk9uYTlDZDR6MEF6eVhqOXZsc3BTVm1QZDlLcEo3dFdVMFZQ?=
 =?utf-8?B?N3plWkRmWitOTkVtcDY3c3RmbHFlMWNSelpVNVlMU3FBUDJkZnlkNzB1V2la?=
 =?utf-8?B?bHEvVTVtdDgxYnExYTNVeVNYT0dRVXNoL3hGamZGNENqU0M5d3lCL3NhbUJi?=
 =?utf-8?B?OTZhQmFkT0tnM2h3d29YY1A1eE8rNTlCU2JiWWFQWVlvdkFLM3JRTTVjRlV5?=
 =?utf-8?B?UGthVW94ZmVCVHlWSzBuT3RvRi9iWEdIUmhVVDJBZkFlbHRYVXBuRHFibDlP?=
 =?utf-8?B?bFAxSlpmSGJjdk9raVFSVjNQWjcvblhacGQ5eEREL0krVE1mUUd0T3NqaEdz?=
 =?utf-8?B?UGJwRHY5VFUyQlQzaGhDMTdKcXFza0Y5RzZKbG45dXFsRld5c0hFZW5EZ1dK?=
 =?utf-8?Q?DTnEHkvMfi+c/Z32ika0gTjldcW6Wk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB8946.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?aDNOWEpZSk5uTjBhck40b3BsRkNhMCtPbGwxOCtCS0Foc0RyRFVqK2dDcUk3?=
 =?utf-8?B?a1BUbWJza1c0TWFPWmIwcnVGUnZCU1hOa3BRY1VDRXN0SWxBdXg3dnk3b2Rp?=
 =?utf-8?B?TzlNRDZ1cC9NU3VJRzZLVnM5bENOOEJVR3JWclNyVlVZcE8xYngxRzczbU1y?=
 =?utf-8?B?TEhEY0VuY1J6RkFtVXVTMDJaUHkvdzVkYktzVkVtUTVqRHlrY2lzWm1XM29l?=
 =?utf-8?B?RzZDVDVrajlmVTdQKzk0YlNtRndSWlhITXFZK2JEOU5QcTVEUGVhbi9Fc2VJ?=
 =?utf-8?B?c3RucURHRWJKNUpmY1BjcktNUno3Q1FTVVpEU1RHRUFJWklGTzAzSDJlUzBG?=
 =?utf-8?B?QXI5WTNJT3JiVDRiaTYvblJLQ2Y2Rzdmd0NhUVdMY2s2NWsrVTAzNnd2aVd0?=
 =?utf-8?B?ZVBhUmRlRkF2Z3dyc21EYklNWEFDS3Vkb1FGU0FJRFVBUlE0eUFCYlhWcVla?=
 =?utf-8?B?TnVJMXVrQStPcnlMMG9CQ2R3MU96TUhoNllJZTREc2VWNG8yQW5rKzB1Y1Yr?=
 =?utf-8?B?aDJ4VEFrR0syajIzZmNoeG8rZk9IOVpIYWY5d01DTXRYWFhQNHY4WWdUK0Mv?=
 =?utf-8?B?ampmWXJ3Y1U2RlQrMkpQR2J0blMveE1OSmw5bnFKL093SWlNbU1pOGp1NnA2?=
 =?utf-8?B?NkJwNFprN1JuZmtiZWFSanB6UG5JbFYzeEh6K3VERDd6N0VTOVFTOGZOL095?=
 =?utf-8?B?ak5CcllpckZDejl2c3N2UHY5Y1BWR0swZ2xxL2d4cUl6S3VRZE42WEdlZ2Rr?=
 =?utf-8?B?TzVhbGRpaUpxTG92Yy9ZNm11emJtU2ZHdm5nNzZRTmU3aVZVdDJhWFIzeWdB?=
 =?utf-8?B?cStybUVrcHIwQ0ZZbWhpU2NaQ1NodEpLbHNRWmtGN2JtMHR4b0poYmViVVRB?=
 =?utf-8?B?bmdDMHBiNjlrVlRmZENyUzhlN3VEbE1xSUpQeXQ4UGh6NkpHRVVjN1BkQlZU?=
 =?utf-8?B?ZnVzMC9hNFl0bzBWbFlBUVc4OGxxanF1THViQmdScnRlcEN3WjNmRWtyRUZr?=
 =?utf-8?B?K0pUR2tuWjhRQjRvcWliOVZtd1ZUeW42cEhPUGFhV1lhd2NPSHhqSzgvS2hi?=
 =?utf-8?B?b2lnc2F0aS96Y1QxcWo3bEdmYk92OHdYeHZHUDNVYW1kUWxpdjlYa2xyTmRw?=
 =?utf-8?B?RzFrSlBDWmtZNzJNZUdpNGFHZUo3SmRrM3FFOC92VGM0OTNBK01acWREdkRL?=
 =?utf-8?B?eWVCdnpXc3RzUjZ4SnhuNWx6eVVEVW4rT1h0RlNvaE50OExmU2I0N05sWlNw?=
 =?utf-8?B?TGpuR3B1bWlQNDVxRk02WlVIZUx6Zjc5YmdsU1UrRFVwYzJlZTVwalVaMzRG?=
 =?utf-8?B?a1BZK01vRllEUDFUeHJ5NmhKTEVPYzdSakxIYWs1VHVoelFHbnpEWGQvUzdK?=
 =?utf-8?B?TXZndWpTdHJsQkxPYlJjNUFsWkhnMnlLYTd6eGxmRmh0TGNodGNkMjRhR0Zl?=
 =?utf-8?B?Uk1hVmZrYjhPR0s3NU1aTzZBb295dFl4ZnFIS01Nc0JRemY5SlhiNjREc2o0?=
 =?utf-8?B?bjVlSGx5SnFuckdXT3ZXMnhXQTRqeFVMRXh1VURzKzFSaUdLRnFhd1dwdFpS?=
 =?utf-8?B?c0F4MlF0Z2pOY1VGYkE5MlUzV0oxOFNya1lFdExNTlIvSnR5RUhGTGF2MHhp?=
 =?utf-8?B?Z1dyRmR3SloyTWgxQjQ1dFJwZFBQeUxMdGNlN0dKQlN1VGxYY3FVb3cyRGlM?=
 =?utf-8?B?UkU5L09mTnIxakFBR0ZLdk1VWTJobk9zblBNWFBwNUJVTE4wcUtZbkY1bWV4?=
 =?utf-8?B?SVk2Zk5qelFKTlJobUt4aUkvK0RhNUkveEZLSGk4UStodTBJNExEMFg1Qlpa?=
 =?utf-8?B?M3poK0VoZ0FibUl5MGFNVi9VVVFRTTBKZGc1SHJIbThEQytVbHZiS3p6ang0?=
 =?utf-8?B?alg0MnBDM2R4RW01NkpFZFJKWUdONW5lUnYwcURkdW82UDdvZE5lbFdnc0FQ?=
 =?utf-8?B?bTZmWnVRSGxmajd6cFZ3blgvQnFLL2c3WTZRenBTRW1XOERiZzkvcVNJcUwx?=
 =?utf-8?B?dDhpcExJQU1iSnRVUTE0SkFvWXYzQlFwOUlkOFpMM29kTkdtM1RURExXT01u?=
 =?utf-8?B?anlRQW1Yd3AxOHFCajloaktlWnp5YTZPZ2pkaFpoTUtLVjZUc3N5QkFxRVU3?=
 =?utf-8?B?ZzhSSEZ3ZS8rMERaZE1sbmZvNFh0aTBQSXU5b3l6SnV5UTVyYktCQmN4S2Jm?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D45171E0054AE9478E7B2C684EF8D502@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB8946.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a553573a-9445-4f7d-8ea8-08ddfc0b8340
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 08:14:13.3216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iTdL9eXlSF8Yl6JqXe1VRszxJQDvy9BeS2OqJL6D8KCYS8l9Qs0yoiwhwB2q1yXzwp+he2z0sWSyh10Gt6fLSZn+l8dzBt9jvHOeQLnr6Mo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8583

DQoNCk9uIDI1LzA5LzIwMjUgMDk6MzQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAyNC4wOS4y
MDI1IDE4OjAwLCBPbGVrc2lpIE1vaXNpZWlldiB3cm90ZToNCj4+IC0tLSBhL3hlbi9jb21tb24v
S2NvbmZpZw0KPj4gKysrIGIveGVuL2NvbW1vbi9LY29uZmlnDQo+PiBAQCAtMjYsNiArMjYsMTQg
QEAgY29uZmlnIERPTTBMRVNTX0JPT1QNCj4+ICAgCSAgWGVuIGJvb3Qgd2l0aG91dCB0aGUgbmVl
ZCBvZiBhIGNvbnRyb2wgZG9tYWluIChEb20wKSwgd2hpY2ggY291bGQgYmUNCj4+ICAgCSAgcHJl
c2VudCBhbnl3YXkuDQo+PiAgIA0KPj4gK2NvbmZpZyBET00wX0JPT1QNCj4+ICsJYm9vbCAiRG9t
MCBib290IHN1cHBvcnQiIGlmIEVYUEVSVA0KPj4gKwlkZWZhdWx0IHkNCj4+ICsJZGVwZW5kcyBv
biAoQVJNICYmIEhBU19ET00wICYmIEhBU19ERVZJQ0VfVFJFRV9ESVNDT1ZFUlkgJiYgRE9NQUlO
X0JVSUxEX0hFTFBFUlMpIHx8IChYODYgJiYgSEFTX0RPTTApDQo+IFRoaXMgbGluZSBpcyB0b28g
bG9uZywgYW5kIHJlYWxseSB3b3VsZCBoYXZlIHdhbnRlZCB0byBiZSBicm9rZW4gdXAgYW55d2F5
LiBDbGVhcmx5DQo+ICJkZXBlbmRzIG9uIEhBU19ET00wIiBjYW4gYmUgc2VwYXJhdGVkIG91dC4g
SSdtIG5vdCBxdWl0ZSBzdXJlIGFib3V0IHRoZSBleHRyYQ0KPiBBcm0tc3BlY2lmaWMgZGVwZW5k
ZW5jaWVzOiBBcmUgdGhlc2UgdHdvIHJlYWxseSBBcm0tb25seSAoYXMgaW46IG5vdCBhbHNvIGFm
ZmVjdGluZw0KPiBlLmcuIFJJU0MtVik/IEZ1cnRoZXJtb3JlLCB3aGF0IGlmIEkgdHVybmVkIHRo
aXMgb3B0aW9uIG9mZiBmb3IgeDg2PyBEb2luZyBzbyB3b3VsZCwNCj4gYWl1aSwgaGF2ZSBubyBl
ZmZlY3QgYXQgYWxsIHJpZ2h0IG5vdy4gQW4gb3B0aW9uIHdpdGhvdXQgYW55IGVmZmVjdCBpbW8g
YmV0dGVyDQo+IHdvdWxkbid0IGJlIGV4cG9zZWQuDQpNeSBpbnRlbnRpb24gd2FzIHRvIGludHJv
ZHVjZSBzYW1lIGJlaGF2aW9yIGZvciBib3RoIHg4NiBhbmQgYXJtLg0KQWRkZWQgdGhpcyBjb25m
aWcgcGFyYW1ldGVyIGFzIHdhcyBzdGF0ZWQgaW4gdGhlIGZvbGxvd2luZyByZXBseSBmb3IgdjEg
WzBdDQpGb3Igbm93LCBzaW5jZSBoeXBlcmxhdW5jaCBpcyBub3QgbWVyZ2VkIHlldCB0aGUgb25s
eSBvcHRpb24gZm9yIHg4NiBpcyANCkRvbTAgc28gaXQgd2lsbA0KdGFrZSBubyBlZmZlY3QgZm9y
IHg4NiByaWdodCBub3cuDQoNClswXWh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC85
ODE0MTQ0Yi01ZWI0LTQyMWEtOTNmMy0yYTE1MjMyYTdkZDNAc3VzZS5jb20vDQo+IEphbg0K

