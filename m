Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 431B5C53125
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:36:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160063.1488292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCsg-0007LB-8P; Wed, 12 Nov 2025 15:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160063.1488292; Wed, 12 Nov 2025 15:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCsg-0007Ir-5T; Wed, 12 Nov 2025 15:35:34 +0000
Received: by outflank-mailman (input) for mailman id 1160063;
 Wed, 12 Nov 2025 15:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X0mN=5U=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vJCse-0007Il-Kd
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:35:32 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 359b43b5-bfdd-11f0-980a-7dc792cee155;
 Wed, 12 Nov 2025 16:35:27 +0100 (CET)
Received: from DM4PR03MB7015.namprd03.prod.outlook.com (2603:10b6:8:42::8) by
 SJ0PR03MB5407.namprd03.prod.outlook.com (2603:10b6:a03:28f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 15:35:23 +0000
Received: from DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9]) by DM4PR03MB7015.namprd03.prod.outlook.com
 ([fe80::e21:7aa4:b1ef:a1f9%3]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 15:35:23 +0000
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
X-Inumbo-ID: 359b43b5-bfdd-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ii+7IgxUnvOCiUu+Ogo49l2YLJIkZp3f3HSPsCfhyLewTo8/8Emuec+WanCTyABhEToEnupRyRY6gl8psC4X3uFT6oVDQ9e3DuN5uySBSI1D55fJ2ozC781rMa7mQPbf7VyGn+dnA/AB8PCdm7V1S2TVxLwqURxxtow8lZQ3i19qQLvAoryK250BTHcXcrFByhxt6YdXylS9QKKpCcAiXWipms0uNRPx2f1j4pSsJXm8pxybjGEVf2eqTj3ddxX3B45DjAHH79qmne/IORj8wHU6BSYQ7vP2YyWK+NMjQ6ybqRyOoaYjE0d66COtPuNkuW98i2oyWwjlT3kfumpFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SuR0EaxsMstdCukpJYov7lN6pb4OUX+GdtIY/WObpo=;
 b=CpZs0oC0DlG63WCHP85SI2i7jJ1Pr+oP3j0y2S2Il4nPByYRBmFP0wmwR9p+iFenvJ1k4A5Fca0HqXhJYqorO4Vl3U4B4sI5cKg/bLcnIzdJh7UrxuwUbrUrhZaDCG6gwxpPu5IlUIofpPG3b+0U+KItOqVY7DPuMvn+VNaq6/Gakwx0pZGbNA0p30WnAkvTZAoQOPh7mDPszcu4yogZNd3ujGrB4yF1+XOWoO1gianlJQoaDYJibeozVcqblfk/FcQPdzMJQwHLNJcKZPgk29UPzV1KZIrEUChlja0Pd599JYOersxcDK3mmROWsUnesxTPKpKQr8osKMEmphPzLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SuR0EaxsMstdCukpJYov7lN6pb4OUX+GdtIY/WObpo=;
 b=pLbKIL86Y5g3O6S1693wJmk0MmgEKrU21WKO5amBq900Ep9ajuwmWGkQoGtbkYBVFLPp5WKuJ6zaUn1mdwnNeirmX9pGkbTDCqHOPolD0uDMYaQMF8zu5fBknmssLq73GiNGKA56cFsS6TiEkgzhWLU+ZF55NWqidJAuS3uohWg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <0afd80de-9f22-4ff9-8592-6cbef064a5f1@citrix.com>
Date: Wed, 12 Nov 2025 15:35:19 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86emul/test: extend cleaning of generated files
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <14254365-bd77-4081-92c3-fcd0e649adae@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <14254365-bd77-4081-92c3-fcd0e649adae@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0318.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::17) To DM4PR03MB7015.namprd03.prod.outlook.com
 (2603:10b6:8:42::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB7015:EE_|SJ0PR03MB5407:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9ee3d2-e934-41d9-30f2-08de220117fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFhHS0dqNnFkSVAvdGtjaVJrV3dpd3ZVeGVFaTRRUEhZUkRuQTFOR1dsWkNQ?=
 =?utf-8?B?cSs1Z3VPZkxYMjV6amF1c3VtNVJtNmJQdGUxQk4xckdZV2JsZzJCdTFVR2RD?=
 =?utf-8?B?Q1NQWUZyMHoxcDdacjdsN3lPRkt4ZXBPSjJDaHlwNzVOYVZZaFZRNExuUVBX?=
 =?utf-8?B?SVFLbHNyREZEQXNLbXBjUm1lOXNWMEF2SGdKSUhZanZSaFUxN2FqSTZFRUV0?=
 =?utf-8?B?MU04OVFTUFJYUUJPYk9SOWpHNy9EWGpLN3dTNXlzTFRqR2NyenRVYlNxTUly?=
 =?utf-8?B?TDBEdTQ4Q1VJOGR4dEs0SlRTODdhdFlWQlJZZjdzUlk1Q3ZNOGlKMjJvMGt2?=
 =?utf-8?B?OEttNVgzdExDK2VFeG5jaW9Ibk9VUlI3ZXdFcHBuUFlyMnJqWEl4VWlHajha?=
 =?utf-8?B?YTFzWE15WTBVUFRYK3FSL0FiSU43aDNsS0twVzJZZGYydEc3TFhwRWpWNlVv?=
 =?utf-8?B?QVcvNDJLVmNsTFFuY1NuS1NLQU1kdmVhWXpYUFpKSW1qR3BOOGpvU2JMcGh6?=
 =?utf-8?B?VWN2cGVocG9ReCszYmRPRUhvSWV0ckFqZVVYSEVHMVlkNHV6OVlocjlTWlF1?=
 =?utf-8?B?Z1h2YTRHN3ZOaTNXRnR6T2FsTUliWW1XelVXeEZhZkpGNC9xaWZuZFFNcjA3?=
 =?utf-8?B?SmZoczVEVEEvc09QSDA5NEgwS1gvSUVTcGY3bzNxQ3RCZWtvcldQZDQ5Q2lH?=
 =?utf-8?B?b2IwWmJsbmhub3NrSlFlZ3VHS3U4VXYvMHhTejNGRDkreFhEazBqell5M1Zv?=
 =?utf-8?B?V0dTSCtMaUZrVnZBUHV6aWZHWk5ReVNFRU1MemxGNEF0UmdGeXhNdHZpaWYv?=
 =?utf-8?B?TnhJRWNtdGUyemh3cGdWN01lNmJBc1dieG9CWG9ZcEdkUU0vakJKelBoSGNU?=
 =?utf-8?B?YzYxdnJQUGJ6aUxlYlU5RmRmL0JLV2hYMlhPL3B4TittZ2F4eTRxbVcxdjRW?=
 =?utf-8?B?VDJ0YUlvdVluUUpLYkc4dFZuN1hoVU5zL1NVRDRVZmtWb0FsMnJMVis3SGZY?=
 =?utf-8?B?WFB3KzNGM1VZVUNWUjlYSS9wN1RxRHdDN2FKeGhYNk8vekphZ1cvY3lUY2Fo?=
 =?utf-8?B?TmhsYm1vNDBDdnJYTU45RkxzWFRxQ3laY1JvMzhSV3FJNEZzaUNlaG4vN09L?=
 =?utf-8?B?SG8zem9XZ29uMU9haGFPd0FmRm95dkpUZGJoL0RBNG1USGNZM2dWUHVFSEtG?=
 =?utf-8?B?VjhGN3BEdnNXMjl5WXViYmp2UUV2Tnl2MG1SRGZQUVVkSGpZRS85VW5wM21s?=
 =?utf-8?B?c2pybmorazZvTEFMQzE0YXVtWHBjd2FJamREZWpxZ3JDdkVkTjV1SjJuZlVp?=
 =?utf-8?B?aWpGOTA3WVFtSDJuWGpDM2JmcUVmZHNDV00reS83ZXEzaEJwVStuSUc5YmNn?=
 =?utf-8?B?SXhEOHI2SE5MRy82OU15VXBVR2tTejNUeS9JTmlWZXNSejFzTUhTQkZkRTVU?=
 =?utf-8?B?aVc0ZDdFYlVMNituWFZxRlVvQllGNFdmYmR4d0llNGkzMGFKVENNVVBhby9T?=
 =?utf-8?B?czBSQUZhVFlOeGlERUc2SjByWVF4MnV2ZEJQb2VyUkxUSkQrTjNtNTVUNGFY?=
 =?utf-8?B?SURPaVlaNVV3V1czQmhsSEtRY2VBeHFUeXdicmVldnk4Zkh3djNZaWhTWTg5?=
 =?utf-8?B?ZEM1NUZEMDdsTlBHZHAwakR0aW95OVkzS3luRnhQKzJkdWl4V0NaQ1c3OW1q?=
 =?utf-8?B?SGc0VDNnNktBaHVMY3pvaUlYbnNva0c4cnVUeTNqTVozZGpCcnYxN3pRNnpB?=
 =?utf-8?B?Zjl5Z0lQZXhDMlQ0b2wyS2xHVVRoZ1ozWG05Y2VEa2hGSWdTVVAxc2hLOWpl?=
 =?utf-8?B?dFhBSTNJaENnenRUU2RXK0tCa3I2cHFKMDBkTDd6RXVnRnRXOTFXZFh5eW5x?=
 =?utf-8?B?c1AxUEVXd1JMSU10WnI2UkxjSkoyVStWYWJNVFFYdkNqRXRrWU0vVUV3UWg0?=
 =?utf-8?Q?ALwu+XnPw0Py0caWrrTzo+T5Bzm6SAsK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB7015.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlBVQk5WQ0ZPcXVhb2t0U3NLYTRyWmpKU2Y5UzN1ZlRMSVlic2lOc1ZHZXM3?=
 =?utf-8?B?YWpNZGQ4SU1aaTBNekdUWkYzeWs2RnFQOWZHM3pMT3UwRyttTFVUYWpRamdB?=
 =?utf-8?B?cThJK0JlcTZNNmk5S0tpRldHUmN0eDhtZEFwMHc4azM3MldvMU9ybDdXTWNF?=
 =?utf-8?B?Y1ZjSXdhRUxPQ0NsOEdxSjRCbkVUVHlnSVFhUVhaWkdnMWUyVC9qdUFpVE9o?=
 =?utf-8?B?aDFTbVNWRUpSRmgrSEN4NS9ySk5SQkF3TWpQQVd4M3I0NjZnUWdmTUtFMjFZ?=
 =?utf-8?B?eWJIYXRsMnA2NU15VmVUTmd5WWNvd2RhdmlxZkpHUVJmY01JK0ZDMTVLbXpF?=
 =?utf-8?B?NnNiYTBDVjg0QmFKQ2dHaENGZHplbEJNeDF4bGFnSmc4a0owR1JleksxTDIw?=
 =?utf-8?B?dHBQT0NYTjVzTXZrdGRlRUtCVVF0dk5QRWxlUFVQQ2pXc1Uwbk5RcCtiRm5F?=
 =?utf-8?B?SnFNSm1heFJ6ZUt4TUE2Y1hobnVubHMvMzJZUGpwL0o0UnQyMGR3MTVuczNi?=
 =?utf-8?B?YUsyaXJvUElER0dJVG5sNVEraytVc2lGTnFEZE40dC9pM2x5eEc4SXZ1bXVu?=
 =?utf-8?B?WjYxQWI5UXMyL1d0Nks1TjJ3YUF6eVFtQlNNeHd5MmJyMVZ3VjJGNm9lVlZE?=
 =?utf-8?B?QWVrd05rQ3lFd1JDUzVZVW93S0NWdUpNWjVNWGxBdjhWbWU3NFViaklJSzhZ?=
 =?utf-8?B?SVFtQ3FqL2E2b2hlTUJDazVmUFB1UDdKbENudHZabE00aE9GL01WVGtJSm5N?=
 =?utf-8?B?U2VEcWZIb1FzOXlFbzgvZmdYNUdUYTU1L2cxR3FnV1JGN1c3cmpYeGw0a2s5?=
 =?utf-8?B?dzJ5blU3dnUxeElTajdacXZianlhUlV6Y2phT21uYUkyY2I3cllBU2Yyd0Nz?=
 =?utf-8?B?a2trRk1IdFVDOXRiQVNsQjNBbzcvdzJBK2doT04rcXhGYXNUQ3dKWkl4TEpC?=
 =?utf-8?B?YWlLVEVibXY4clFQcnNUdXQ0enBHQnFPT2tPdno4MkhCekN5cmh0NmVmMUFR?=
 =?utf-8?B?ZGs5UFBwNmVZeFUxZjJoaG4weThSZUd6V0drU2d0aFpvdDdQVGE2cjB5Vko4?=
 =?utf-8?B?UXN3dGFDNzJ3N21veHJXMXZwMFA0SEdwVUg2L2FwZkpGbmFiR3NaVXVkYWZZ?=
 =?utf-8?B?WHZlUjF4WEVhbG1TcHRWNXg2K3NYZDZDWUJ5S0VCc2wrT3NxVlh2SHJuNXZN?=
 =?utf-8?B?YzhUZU1OQ2svMmdhY1B5WDZacE4rVjljUlBTM2JYVW8zZ3ZRR3hiaWtoUDdJ?=
 =?utf-8?B?U0hvNW82VnVPckRJR3JtYm1VZ1hMWllKZHZqK0JOTmtiMXIyZGtkK0dWdEk0?=
 =?utf-8?B?VU1tYTNwZnFvS01mbS9PdUw5QXd0MXF1eFNNZlJGMWRYMUxEMk5XblRNZlgx?=
 =?utf-8?B?dnMvSi9JZjVtVGJRKzJmMTRRUnBpTEdyTG1yN3VxSENPWDAvbjM4WWQ5SWFZ?=
 =?utf-8?B?NFhySmNLRUV1NWMxM1RtZ0Y3ZVJlYzI3cUZnSExhMXFUQmJKRFkyZWVoTHVM?=
 =?utf-8?B?M1VJNFE3cSs1NU1yU1hVT25ucDJZY2NQMTc0WnJ2aC9nMXptTEtQODFXRzNu?=
 =?utf-8?B?cFd4TVRFWTlnSkVHM1lOc0oyb253Z0l3TlNneGpXbDF6Q1NBVGlCcEM2eXFr?=
 =?utf-8?B?b3FYRmwxQlZjMjFRaU12NVZTSFhmd1JHTDJqVVpDSVBYMm1nME9DR1puN1dF?=
 =?utf-8?B?eXZWdnNjb0RvdW95VDdyT0dQSTFWRlVZVDkrSjZjMjFrWm5TSFI0TDBROWVI?=
 =?utf-8?B?dmJDM2lVY2N2QUdrRUozYjQ3dFFDeFRBWXc4eG95ZFdPWC9oZHBDK29mUitC?=
 =?utf-8?B?L3JlRnZzaDBIOFU3Z0FmTEp5MW5tUnVQdWk2V1JvRm1VMVVIOU4xZXNqdmhC?=
 =?utf-8?B?ZndSRzJjVXNpbTZyZEVzYlhORHNsdWRUZDg3cWEwTEFxRnZGVExhK1F6VExF?=
 =?utf-8?B?ckZPQ2RLUW9NWkQ1RFkrMTFmeGVXNmhtSC9QcGhhNTJsSG1BOTFIUTVtR3pX?=
 =?utf-8?B?ZTZNNjJzVlpoTjFabWpwbStZTGhNSDA0a0VJNzdQUTJ2cFJVZzcvTmUxai9a?=
 =?utf-8?B?ZnRqbDhMOFRZRW0vaTNZbURQNzZLTytmUlpTTythaHRnWXdhUE9nN2FObkpM?=
 =?utf-8?B?dDhMT2RXeUl3YlhxUlUzeEtUeDBDL0lEQ3hMNTBmaXhwRllucDdKR3R1YTNC?=
 =?utf-8?B?YUE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9ee3d2-e934-41d9-30f2-08de220117fb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB7015.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:35:22.9860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51dbLZEZAzgPszHtu3Eh1csKbY/n0Zvl1qeZVKCuIe4ubuoR7wo9N7AD0lJAusQPpW53XAm0ql7jVppSgS/PKHwXuGA8PZGk9FBgw+zfOI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5407

On 12/11/2025 3:00 pm, Jan Beulich wrote:
> Many *.c files are symlinked while building, so along with generated *.h
> files they ought to be removed. Conversely $(TARGET) doesn't need removing
> twice.
>
> Fixes: cb4fcf70b2f3 ("x86emul: parallelize SIMD test code building")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

