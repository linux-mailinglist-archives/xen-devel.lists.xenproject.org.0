Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C30AF8F93
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 12:11:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033281.1406738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXdNO-0001PA-P1; Fri, 04 Jul 2025 10:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033281.1406738; Fri, 04 Jul 2025 10:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXdNO-0001MU-Lf; Fri, 04 Jul 2025 10:10:38 +0000
Received: by outflank-mailman (input) for mailman id 1033281;
 Fri, 04 Jul 2025 10:10:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gmk4=ZR=epam.com=Sergiy_Kibrik@srs-se1.protection.inumbo.net>)
 id 1uXdNN-0000PN-FY
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 10:10:37 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e4c6eb0-58bf-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 12:10:32 +0200 (CEST)
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com (2603:10a6:20b:5c0::11)
 by AS8PR03MB9698.eurprd03.prod.outlook.com (2603:10a6:20b:61e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 4 Jul
 2025 10:10:27 +0000
Received: from AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d]) by AS8PR03MB9192.eurprd03.prod.outlook.com
 ([fe80::baa9:29b3:908:ed7d%5]) with mapi id 15.20.8880.026; Fri, 4 Jul 2025
 10:10:26 +0000
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
X-Inumbo-ID: 1e4c6eb0-58bf-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TMqs1GeC4GoVviMe4ovLA8/1gV97IFZWnBptpobFYbGmnJ8E5bRqLeTMpjooppstC0W9k5WUDpFXE/g/CUQZ0QzcmexOHtdp3uD5bYI4kVKJ2twx7RXlkOc2FxiXXA8/T05DeTWXfJo2A5AZDSYMMlThQn6u8wRNhnY/izKBOGhcjKmmLXpEMWmkfBNyqVdNGsFEPtK8tgknL1wlWmuuezZ7Gat85IjPapzGtV4Fb+jVri/b9TwiHKS2b5fx8MKFgvy9ECIZmz349sUTjpFv3cgfR+vil535Be5r8EGJH4JfP+XVvJReHNu78t1Bm5XNDfmH2uhbqbbMLirpgiNEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1s/qrMHQrsvkMssyWBNx2+w5cCySPLut+hg/y0EsTQ8=;
 b=kLyucP/xchFjoNcI88tj8jK3WiYexzW/BSAoYsape8ScuvxLM0YIZA2VfKh55YzxWFulbo6QivUx9EclI+WOqFIL9VzsK5oVaOldl6slVRoq+iGEK8oMF2wB8GmLXvKGtNIKNeFDcl9F3nOD7VozjJXgLMvGS/mCpDtcD8risamaTlClFu6mVt7qlqmAyR73ObOEgaJxTBOQIVtyHe2qLDhFINYS8jjJVkUBm13j+nYTEV1o0e2vpnVYvENLiaEFjK3Y+4FuJkl9YZPKFNjaXw5D7CDWJTD0brXtaakXZvC0Z7AIXoJ4AGwl1T74izCoHoGp/cMeHrfHcE2f4sl+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1s/qrMHQrsvkMssyWBNx2+w5cCySPLut+hg/y0EsTQ8=;
 b=h8TTazGiUzfd9BzgGzVmXGLarYwk+aCNXeP41TWfG+UYzTJJ4V0CpgW3ClBeiEHojjBFBwT8RmaZpy8XLz7/eA8OrhP4O+LLiiQ8AdzauXgM6ULYc8PTlRHkuOdbt11mXtbvNYsm1z+sfRizwlkiw0OCgoQVKWwxRjRG3s+Kox7Wtxxu+TljPMm991GnoEyAH/XI4ta6THUWw49sV5+Vf52Z/TNAnApknly9FGjDUbSaG+cASZpRTE2MIsHDwQchZLZtO14/5W1ouAWQb8JBKHlhEpu/hUheT7DeZ8d7xBDbgnN+iij1E/3dhn1yvNsVklbLTiyPG2fDkuA/0j5gyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <71ca3126-d311-4ed2-8d6d-3ffcb90a222e@epam.com>
Date: Fri, 4 Jul 2025 13:10:23 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/flask: estimate max sidtable size
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250630085559.554334-1-Sergiy_Kibrik@epam.com>
 <d562251a-a6ec-4e2f-b1f7-dd87a97d4005@suse.com>
Content-Language: en-US
From: Sergiy Kibrik <sergiy_kibrik@epam.com>
In-Reply-To: <d562251a-a6ec-4e2f-b1f7-dd87a97d4005@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0047.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::16) To AS8PR03MB9192.eurprd03.prod.outlook.com
 (2603:10a6:20b:5c0::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR03MB9192:EE_|AS8PR03MB9698:EE_
X-MS-Office365-Filtering-Correlation-Id: 8634dd6b-38ab-4c2a-bd27-08ddbae2fec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVJnbnpGU1Vnb3RYWklwYTFuYklpQ0RobzB1ZlMraEF5TkxBTmowcGZ4Vi9R?=
 =?utf-8?B?MWxsTjJDS3k0cC9DSDlUaExXV0FQVGJxcnV6dHB0VXZYdGVVWmU0UlEzclF2?=
 =?utf-8?B?eGhZM2dlbWFmZDd2U3UwOEowZGZ3OU0rdUNuZUJaaUhheUc0TG1aQ0phc2xN?=
 =?utf-8?B?R1BpemRXOEFnakJLTWF1SHJ6TkRBUUNTV3ByV3BVNmxqb2VJQ1QxSEkvN0dO?=
 =?utf-8?B?RGNvUWdQZXVnRDc4VVVBdWViSVV2L2lPUHQ2MHkzZmV1c3VZS0NMSFRsNURi?=
 =?utf-8?B?anQxUmVEQnY1TDlLeFhabTZKLzNSS0xURXJ2L3pmOEhCVTk1RUtURHFrNmt2?=
 =?utf-8?B?Z0FWUXp6TXJlTS85VHFlUUtuWFY5R0h6UWJaV3ZnWDh4elRkSDhsS2x0dXF3?=
 =?utf-8?B?dHl4aU1tdVJiWHVNQnl0RjRwVmRRMGFZaTVqVkVoOGVsQytYWnRIZ0xQK1FJ?=
 =?utf-8?B?bFM0b2FPcjM4WElneElPLzl1SHozTUVHUFpUb043TmdLUi9iK1piR1RtWFg3?=
 =?utf-8?B?RkY5endVSTh1Qk5EQm50THpXZXdQcFFFUFUrOGVaVEV1SXdlZEZadmtIY2xV?=
 =?utf-8?B?L3FJdWZ0SzNxbXd0czNKSUg4ckMyK1Z3TzVFcnN6ZmZUV3d3b0V2VnBHWWl1?=
 =?utf-8?B?bEZsK0dDbkNqZEM1VHRERnZKZVFqdUs4ZGRmVXAzWEtGSitPeW1nMEtST3Yw?=
 =?utf-8?B?SXhKdTlZUU40L3ZCeXh3cmVMTnRwWjNJV3k3Q1FMclptOFhFaUZnWWoybGZR?=
 =?utf-8?B?UDBCZTIwdE1tRC8rMUVUTEdKQVYvSnNwRjIvRDVmSGd1WEtHUytjYWRsalJm?=
 =?utf-8?B?dE9PdmRkMFhrcjFBUU9FemR6aEJuRm5uZXpWdmhoRUl0anJjVFFpWnBhazgv?=
 =?utf-8?B?cTRMTmZpZjhVOVZzaHFzb3ZteDNCSmhPdHREMGFSSXNvWTM0RW5ySno5aU1K?=
 =?utf-8?B?VXRxT25mdXpLRHV1MHFtZk9hdFNhd3llYlJVWHdBNTF1MEJVR0lXOFpxV0Qy?=
 =?utf-8?B?eEIxRld6d3lBZGcvaGpPbjV6MmExQ3pjb2xnZEhRS0QwZUVzblAwMTArS3pV?=
 =?utf-8?B?VElTbnJLYk5SdjdQZml0ODRCQ25jV09vRUpiYnJSek5TMi9SYzRnK21QdXB3?=
 =?utf-8?B?QzllbW5pSnV3ZkQyRnp2c1hYMkNnMm9Vc2IwVUdmQmpybWpzeEswUmVVcDNN?=
 =?utf-8?B?ZlN6dTJGbGhtSStia1FSRTBQNXJUL09ZMmFLUlo0VXhPSXY0OUt3TmxTWVZS?=
 =?utf-8?B?d1hVeVM1Wk0rT2NsaFpWMUh4cWdnQ2xEZlZka01ZU3ZzMWVFbWN4WTZodVBK?=
 =?utf-8?B?LzJhZi9uczIvVE5wTkhrSFJBMmZoQktwbkxXbHllMVZWU29taU4vWEcvSzl5?=
 =?utf-8?B?aXc4WUZvTWp6Y09uYjlqK3h6Mi9RQW1lQ1p2WjUvcWpaYnlwK2RmN1hBRXpM?=
 =?utf-8?B?VlhtUjBOS2JseG9ySDdHTlFNRjNScFVrRVlWY3JCTHVsNHJ1bWtDU3JEb0Vw?=
 =?utf-8?B?R1h1Sm8xa0dFSGlnbjBMVEhIZWxiUGk4a1JsRWJUOHNyZHBGS3lxVlBMNzFa?=
 =?utf-8?B?aG91OW0xc1BDN0hQUzRrTkN0RWxRQ3lLd0JyTlY1S3pZaXYwOVBnaVRrMlBO?=
 =?utf-8?B?eUtYT296YURJV0dDbHRWUjJIOHRpTzBSbmNzL3RhMGNIQkVHNDRVWU00ak5E?=
 =?utf-8?B?MFE2NGI5V1hNOUNuMVJLNC9OYldGVnFmL3U0bWVDV0V4WjBLK29sUU0wTG54?=
 =?utf-8?B?VjhJenk4ODRYbVdjN3FtWllUUDNjdHBlcS9sQXhEN0xwMFRna1dQVm9TdXdC?=
 =?utf-8?B?WmpVSXA3OXJjeEw4Wno3eVJvSklMTnJOamtXaTJKcTVCRGlyc0oyYUFTL2VW?=
 =?utf-8?B?MzhqaXlaQ3dRM2tDTXVwUjAvUjRndXgzb3dvcHFDR1RLSnlQWGJRbEphZDc4?=
 =?utf-8?Q?A3hNlmqWuto=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR03MB9192.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUJ3NWRHZlh4aUd0MkJEem9LTm9NNjluS1REYitoUktDS3RaaHFaRFRyaXhi?=
 =?utf-8?B?cnVTM0M0Y3R1bU1Hb21ybmlFZHVDdkhKNlBwOFkwT0o4cnVJeENnaWh4aCtN?=
 =?utf-8?B?ay9kazZSOE1UaWt1RU9jT2thbHlXRUovVGRkaHlhaHE0ZFVQQkdFNnV4Ymgx?=
 =?utf-8?B?STUzSGFhZ0VvSnlMRlBBS1UyMmcwYi9xNlk0VVN4aXkzT1dMNjVoeVAzTi9O?=
 =?utf-8?B?TlRQYjRtTFIyU0RuZ0tsUVVLYmhYemdMdTlQUkdFS0xscitaWkVrcENQcllr?=
 =?utf-8?B?VzY4S0F4Y01MMUZjOWZJTFZrMkJqdWNncHN1T0pJREhYWmhIaHhxM1AxNjZF?=
 =?utf-8?B?VUhNcnlYZjV5ay9YZWppd2JjZCtncnRhUXpwQ05xY3BkZEZOUnl3L2VxeU1o?=
 =?utf-8?B?T0FpR1VjL1ovUWFWRDZuclFKRi9OQVJvcmEvYlMvalJqK3dwR0wreVlWbmky?=
 =?utf-8?B?YzFXc3VldEM0SVJIT21LZnN2Q2pTZEo0d0lPL2lERlhITGlyYS83cjE2cXFh?=
 =?utf-8?B?aUdybm5tcjFoN1p0eldXSzl1SVhlbFVndHZURm9oclh0RnlUY1g2SlhDVDdj?=
 =?utf-8?B?QTM4ekh4UFZlQ1FDMEJZbHNmY1UwNXZURC9heEo4U1p3S01KeEVoYzFQaXBo?=
 =?utf-8?B?YjVJaGlkVDVFRmRUNStTbmtxNDUvWWVnT1BrUnhlUTVkWkFCUzB5U1dGRUMv?=
 =?utf-8?B?Mm9FUmI3dk52YXhvazM5OWJoT2lDSXk3emZ5SXU5bm04RmFzS1BEOFczUWtD?=
 =?utf-8?B?clZRMUdVOWZueEUzOERjK2hGZCtyaVdUTFdGZmQ3NVdvOVV4dmJrTmRlS0dq?=
 =?utf-8?B?S0tPeitzWTNEaXhwaDFDUWVVTE1XcThxaGxvUWR3YVlqZmQzdUJ3SWM0cHlH?=
 =?utf-8?B?R3FsWFlISDdQeXFRLytVMDEyZmhMdzBCMXplN0FWZDl5QWMvTXF0aUNCYmFw?=
 =?utf-8?B?dmJZcVcxRWJiNHVDR0JTeTNOTTlkdHJ2YlR4WmVkcVZmN2pQaS90ejB6dlRj?=
 =?utf-8?B?ZU5JZzUxTllTSzVuZVRoWkVmN0toTzRrbVR3Y09SYlYvTXVMVkViR0duVW5V?=
 =?utf-8?B?S2JpaHR5WjRFRG96Tll2ZFRrdnpjRkYxUFFCVTV4TW84Q2xNT2hDdnVyYUtk?=
 =?utf-8?B?WXNjZ2RLU2lLeERNVzN3Rk9QeHFQd0d3MGpSU0ZyQ3Y4eGRHOXVpcHo0cEoy?=
 =?utf-8?B?ZFZ0eFNzTk0wTTlwTzNseXRVeXE4V096SE1zWlZMZWpJbnFzR2VXZDhCekht?=
 =?utf-8?B?V2NKQ001ZDh2WVYzc0tFNmEyV3J3Z1J6N25UWVhITXpicjEwWUJVWEhPeFll?=
 =?utf-8?B?U0JWbG9DRlNWdFlvdUFmT1VBbW1tRFZvaGdjbWhMRzhiMlFFZEIwWDl6VEhB?=
 =?utf-8?B?Z0orNkxVTGozMGM4N3J3WjZPVFJuWGNVRzlSNXBTUVlMNkcwYmp5YXp6N3dY?=
 =?utf-8?B?d1d2VlYyOXlLT3J6WGJHVVE0M1VrU2RVc1c3c3phQkkxRmMrbHRycmtFZnRk?=
 =?utf-8?B?L1NBdDNBdmk1Vnd6Zkl5OGdXREFOZlY1d0oxL2ZycjltakVNMyt0ZnlXem1O?=
 =?utf-8?B?Q3dwYjNzRlFBekdVYzBGSkRKSC9LcEplT25yS0FveWRCOVlYOFhQS1pDMm5k?=
 =?utf-8?B?L0laQWJGS0x3dVNlVUtVUjdVR3dNUXdiTzFHdm9ZRUZXNDdzUXdZVkZCbVpV?=
 =?utf-8?B?TUp0U2JXN3paWEFZc1RtUjh4RkxJYVAzbE1ta1BmazFuYm82ZzM5bzdWOStx?=
 =?utf-8?B?UVFGTGF1aktEMWZXS2Q1Y0lVODluVzUyRjNQK1IyUGU5R3BaeDljQlliMkJo?=
 =?utf-8?B?ZHhTeEExeDdxWmxBbXU2TEdmU0g4VUw0RFdUWDFvdFJJdlhjRFlPYkJTZUx1?=
 =?utf-8?B?dFZ0a25hbUZHY0FGSDAvY0kxbFczbWZWdm8vTitodHRWMDR5TVVaSW9RUGtq?=
 =?utf-8?B?UFg3Q0NYbTdGaC9xaHRqdWZ0bXVOWEpwV0ZBZ0ZrQkZlTFc1VmNZWFF3bGdI?=
 =?utf-8?B?MzAxY3hrY0Z5UTRKKzdxVWdUVklOSzJqemw3QmJWSURsU1JpK0ZLcjU0QWdI?=
 =?utf-8?B?QzNoWnBoaXJvamVZbDdCNE12WDkvbXRyY05QSmlGb3pNOHNWblJ0Ymd5aWJa?=
 =?utf-8?Q?QeH1OR/Wxh+E0aFhM9ZgAVxZc?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8634dd6b-38ab-4c2a-bd27-08ddbae2fec5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR03MB9192.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 10:10:25.8764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LtrFPfqTBkvoKeqbGzdFStdojCFgTrSKxrMhQV7rHs6g32qfKZBdjq51r21Z2+3o/ssnH8mq8xw701QsjcPw8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9698

01.07.25 13:42, Jan Beulich:
> On 30.06.2025 10:55, Sergiy Kibrik wrote:
>> Currently Xen lacks a defined largest number of security IDs it can potentially
>> use. The number of SIDs are naturally limited by number of security contexts
>> provided by a given security policy, i.e. how many combination of user, role
>> and type there can be, and is dependant on the policy being used.
>> Thus in Xen the number of allocated entries in sidtable is hard-limited by UINT_MAX.
>> However in the embedded environment configured for safety it is desirable to
>> avoid guest-triggered dynamic memory allocations at runtime, or at least limit
>> them to some decent amounts. So we seek to estimate this limit.
>>
>> This patch suggests one way to do it using Xen's flask policy.
>> List of users, roles and types is read from binary policy using setools utils,
>> then it is used to count the No. of combinations these values can give.
>> This No. of combinations then can be used in code as a practical replacement
>> of UINT_MAX limit. Also it can be used later to pre-allocate sidtable at boot
>> and avoid runtime entries allocation altogether.
>>
>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>> ---
>> This RFC presents a concept of estimating a max possible sidtable size.
>> Can we discuss how valid this concept is? Currently it yields 420 as max SID,
>> is it a reasonable number?
> 
> As this is policy dependent - what policy did you use to obtain that 420?

it's actually from my custom extended policy, for policy in Xen master 
branch it's 384.


> 
>> @@ -54,4 +54,7 @@ $(obj)/policy.bin: FORCE
>>   	        FLASK_BUILD_DIR=$(FLASK_BUILD_DIR) POLICY_FILENAME=$(POLICY_SRC)
>>   	cmp -s $(POLICY_SRC) $@ || cp $(POLICY_SRC) $@
>>   
>> +$(obj)/%/se_limits.h: $(obj)/policy.bin
>> +	$(srcdir)/policy/mkselim.sh $^ $@
> 
> Hmm, that's using the built-in policy, isn't it? What if later another
> policy is loaded? Wouldn't it be possible to have ...
> 
>> --- a/xen/xsm/flask/ss/sidtab.c
>> +++ b/xen/xsm/flask/ss/sidtab.c
>> @@ -13,6 +13,7 @@
>>   #include "flask.h"
>>   #include "security.h"
>>   #include "sidtab.h"
>> +#include "se_limits.h"
>>   
>>   #define SIDTAB_HASH(sid) ((sid) & SIDTAB_HASH_MASK)
>>   
>> @@ -228,7 +229,7 @@ int sidtab_context_to_sid(struct sidtab *s, struct context *context,
>>           if ( sid )
>>               goto unlock_out;
>>           /* No SID exists for the context.  Allocate a new one. */
>> -        if ( s->next_sid == UINT_MAX || s->shutdown )
>> +        if ( s->next_sid == SEPOL_SID_LIMIT || s->shutdown )
> 
> ... more than this many SIDs? What if CONFIG_XSM_FLASK_POLICY isn't even set?
> 

It's using a policy from tools/flask/policy, yes. But not a built-in 
policy, just reusing a bit of code from that code. The idea is that we 
can have CONFIG_XSM_FLASK_POLICY option disabled yet still be able to 
calculate SEPOL_SID_LIMIT.

As for loading another policy at runtime -- the calculated 
SEPOL_SID_LIMIT=384 for current master flask policy is still pretty big 
limit. From what I can see -- much less No. contexts are being used on a 
running system, because most of calculated combinations of 
user/role/type are not really usable (e.g. contexts with xen_t or 
xenboot_t types and user_1 user are not expected etc). So there should 
be enough room even for more complex custom policies.

> It also doesn't really become clear to me how you avoid or even (meaningfully)
> bound memory allocation here. A table of several hundred entries is still a
> decent size. If you really knew the max size up front, why couldn't the table
> be allocated statically. (Sadly the table allocation isn't in context, as you
> don't even touch that code, wherever it lives.)
> 

As said before, this limit is crude and still far from the number of 
actually usable contexts. So allocating this memory beforehand can be 
kind of wasteful, as most of it will probably never be used.

   -Sergiy

