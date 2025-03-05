Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F811A502DE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 15:56:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.902430.1310401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpqAk-0006Rm-64; Wed, 05 Mar 2025 14:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 902430.1310401; Wed, 05 Mar 2025 14:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpqAk-0006Oy-1e; Wed, 05 Mar 2025 14:56:34 +0000
Received: by outflank-mailman (input) for mailman id 902430;
 Wed, 05 Mar 2025 14:56:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AkOH=VY=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tpqAi-0005Oe-C0
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 14:56:32 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2408::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02c2ad04-f9d2-11ef-9ab4-95dc52dad729;
 Wed, 05 Mar 2025 15:56:26 +0100 (CET)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by PH7PR12MB6564.namprd12.prod.outlook.com (2603:10b6:510:210::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.29; Wed, 5 Mar
 2025 14:56:21 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 14:56:21 +0000
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
X-Inumbo-ID: 02c2ad04-f9d2-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eqx08f9eVDLpFitODAQYrCwighUmM2p2v3SlhpUp2MzeDpdmdre8+7urC5UGKLwqK1oATSiTLD7jOfDFYEml0KcPLhv3TM0JWm3gGbueq84WWAkURmNHVVCkvwqA9eupr9q7VScqsM4URHuGppbB1k/jaYtz5KBZ3qBYaPxiiREQ6LvA4vN74LNQ5tmd7+xumpxBeRj6PpN6VxFVTtFGqYtnJ0maEsWWXUa/ZDCGm+PIoSKsHSFc4I8pEmKxsJGHHPdoAGj2sq1oWLWlLUePkQPF8yZQWYIKgJkkbLQ84O91ZZdeh4OOQqJBe/+1yzJ6lj7FHe7B2FAnfXeGDXSiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v+UdBwJd0w0TKG4z/Dod7jgy+alHNvbEKUZojfNqXQE=;
 b=BaFV3u3djjuGH9sDnendnI8e65dNTbu+j7tLCf/5HKXsnNrsObRGYfBaaMGOOxJO8bteBeRecVi4iTeitQXT4GexkX60FL9V+q6p9MFLG2hRRrlUXui8RZ8j/4rTIXUuwjiQZcH2ly00JT20FTMdfqVDzaX/83zAJcnAMXczZ9/Bnu9hgaXgDw8UqUI90mDpBMAFXzb/pV5e6mELNHTFOpw2rRjTEYcqyP4W8LC4RaXQQpDtlVnMo/Fwptqyc92uJ7rnyOqYU4+cBK7rA7QGOn6abim1oRThdsB6VwKt6KoSKa5/ho9e3Y+oDh5IiI910eBXBy211VE1eQSAbuLM6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+UdBwJd0w0TKG4z/Dod7jgy+alHNvbEKUZojfNqXQE=;
 b=qbVkfA2Cs6dzezaCHO3cQp/T3wdh1gfPATfsRio8MEsy/WzHDlx1D1xK1WrQQvnYuSGXfhVCFHlB60SlIXLyQ60Axu7SvmiP8mAlYqnCjCdJ9I3nZlr9hmLvN+SW/jwxMMOaHbAqZwEFADwVUTHCydLt1R1jGBFxcy0C74qlh9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <4dce0cda-4aa6-4f9b-9bc4-681f8cd2983c@amd.com>
Date: Wed, 5 Mar 2025 15:56:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/arm: mpu: Move some of the definitions to
 common file
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20250304175708.2434519-1-ayan.kumar.halder@amd.com>
 <20250304175708.2434519-2-ayan.kumar.halder@amd.com>
 <860cfb26-37f6-4007-a66e-5f9075efe87e@amd.com>
 <2904f052-c35c-4fa6-9f1f-917acb72f1ac@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <2904f052-c35c-4fa6-9f1f-917acb72f1ac@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|PH7PR12MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: 958c203c-638d-477c-9650-08dd5bf5e354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWhvOVBIM3FYUldGUEVBeUczd3pPa2x0NTFlSklEbzIyL3hhTEpBTnZxUkdh?=
 =?utf-8?B?QnE4VGJBK2x5bVQzZXdKa0dPdTdnS1QwV2pST2VjTFJ4UzV2dWNsYWkyU2xU?=
 =?utf-8?B?UjMxZ0JhUGZqWExFcXYrQkZ0S2M1azZlbXVZZXloTnV1a0o4YmR4WVdkNHpX?=
 =?utf-8?B?UmhFMUJKRysyVkZJWDlaRFhqMmEzbmpzT1RFN3JwWTNURTZlczErTW1lNnJ0?=
 =?utf-8?B?ZmZIYXZROXI4WWVkVTljV3lvZGpmZG82YzY2RVFTY1M4YjhXQnNpaDJlRWha?=
 =?utf-8?B?TGFIQVBJdG1nSU00TjBHeFE1aVZvSVVNb2ZqQ1l0WkJqMENsUkpiK3NDaU05?=
 =?utf-8?B?N2l0dlNVbXFQOHJyQUlzQ3lVZ0hNalRmRHdvQzJuKzNtUjJzN1htakc0Q2VZ?=
 =?utf-8?B?dzBZOVhaZFoyNENZaG9Db2JFQ2JCeGZseS9NWk9tM0hDZEx0TXduWDN1M2hS?=
 =?utf-8?B?c0VrQUd1a1h5SzF6emRRdXViSXoya2dJVFZta2dLcUdpMFppWlZCSFRhRU9i?=
 =?utf-8?B?OExMYUZ2OTdiV2hPWUZmeFFzc1UyUXhkYmNkUktwMUxQOFBUS1FHZE1MR0Iv?=
 =?utf-8?B?N2JPRUhaRDhzckQwYnIrUUlnZnVIblVFMExGaytDdUVUUmJGQlkybXl5M1FX?=
 =?utf-8?B?VDhPZUtQeFhkV0cvSEpIbk1BTlNpMDlCQlVkWnkvK2FBNWUrUmtjMW1seUd6?=
 =?utf-8?B?QU5SV1FuUWltSjZDSUFMblRDdll3eHZLMDNTTVdwaVdiT1Zhd1dvaXZwWm5X?=
 =?utf-8?B?KzBVeEg0TGlyRThUQy9ZOUEwTWFnOTU0VXlGc1dWSGpRelZIdVRPU2laZUZC?=
 =?utf-8?B?WktZaThOc3RONmVMZkwvdGoxbzZWRmlJaWhYZ1RXWkVRa09OZ2hONzA5TEVU?=
 =?utf-8?B?NmU3N1JPRE9nVXZjNUo5emRmRlpHMkw5ZjJFRXpXWDM0MHdQM1BhQ3BNZnoz?=
 =?utf-8?B?bWVCK3dEbHl2N1V1bE9Zc3Rld0QrWTNwbHRPWGNGNTFKbUhIcUNoaG9qTmQ1?=
 =?utf-8?B?bnhSSGN2Q1JuR0c3VjBUZlhkNUhIcFcxN2dCemNTS1FkU2JqU3ozNFRQamZH?=
 =?utf-8?B?ekpRbW41RnNZT1p0OGtTYk1Xc0E0dGFFRVlFaXMyNFVwaGsxZzB4cDVqdC9K?=
 =?utf-8?B?bzJHNGdFN2RrV001MS80RmVsZ2U2ajRNaUpFbXpuNjFvNVN2MmFscy9FYXlr?=
 =?utf-8?B?THZRQ1VLSUoxTnRyU3E4bHI0SlBZUlJ2WHdNWExiV1k0QTVFZTJ5WURQVjhC?=
 =?utf-8?B?SEZaazIzZFArUGNqQmZtbEduOGVSUW1KdG1MdUtpVnRqTHlJLzNGd2JITS9I?=
 =?utf-8?B?TzNlRjVxYUM2WkRlelhOZWM3cGZvUlpjOHNucXJMVG9razZmRGpDSSszdTNr?=
 =?utf-8?B?aHRvcmFyQ2Vtbzc0OGxValR0VDdTcHZnZFoyajJTbnhtM2c0Sy8vSDBvclFn?=
 =?utf-8?B?ckhGK0NMenNvcDNUZXZ3NjVHeHU3N0w5MGtCOVF2b0xKOW5ab2t3ZFV6KzBo?=
 =?utf-8?B?RDJISXV3ZThLZ3kvWjRaZitWOGU4eDRrNU5GMTFzaWhtZTd1NzJpOEY3RWJM?=
 =?utf-8?B?b3EzOHNnWkxaWjZJWmZ3UXdhK2VvcXRlb09wZ0V4MG9hczZkaEkreVk4VkUv?=
 =?utf-8?B?R2o0bEJ4ODR4M1dtUnMvaDZtVGpQQUE2b0RJeWtWT1p5UlFTcVp2T3B5dHJT?=
 =?utf-8?B?ZDBTck5scCs5MmJMODVqUFAvdlJYdHgzUWRpd2pLdGRKVUg3bnBtaGhIaWtr?=
 =?utf-8?B?YzJpTlRtQjJzNjAvdFpPYk5JUjR5R0ljaEVXZGdNT0p5TXl1dStldEVDajhT?=
 =?utf-8?B?Mm5WRm1GcDBReTBPVzR2QlZwNlJPQ1pUZXB6VmdncWtMNk9EYXFydGNWQUYr?=
 =?utf-8?Q?YQ3QuZSmR/BTE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aEpRbVQwL2hOVk9JQnJtM3NwNEtKZzVML0NpN21MZ2dZWGc2dHpXY3kva0Qz?=
 =?utf-8?B?OFptejFXa05ibmtaalpScTNmcmNFZWx6UjQ4cnNzRTE4c1d3cVFhWXVVcWpC?=
 =?utf-8?B?a3NERmYvcGFnWGFHVlpOMXErWWlCY1JkeEZKYm1sSGtCTnBkMFNiUGgxMEpk?=
 =?utf-8?B?L09yTnM3dHF2WmdHQTlweU1YY0NudFA1TEtzZUlvd0YyTkdXNGMvdXRGNU9w?=
 =?utf-8?B?dXBOVXpsU1AvSGlUVmRzbnByVllxd1NRMTVkb3BtNld6cUMxTU5RemJTM0tk?=
 =?utf-8?B?d0U3VGw5WXA0M0E5a2Y3UHpRcGdYUVFUL2dyRStrQ2V5djZmV0JwMURPbStm?=
 =?utf-8?B?eTBXTUYrSnlmR2RxbUF6UlFIMXN5ZytuV3lLa3FJUytNdFNaTTB0K2NVMFhT?=
 =?utf-8?B?bi9rT2JkdUdrVkd5WHdRS3FxTTErakkwSnJyL2hFbkZiblBBV1BjUW1wNGYv?=
 =?utf-8?B?NU1weGVKN0NTdEdOTlpudjBWMFdHK3lmNWNqT3pVNFNvaFhNYnJFVmNKdHBB?=
 =?utf-8?B?Y29BYTB5QTlneTNrSEZGK1FMMnllaWJBajZhLzFKcEtNZUMyVlk4YWY0U0g0?=
 =?utf-8?B?TTRTVkdZNXg0RFhMNFQwZG5vcm9XSG11UVRNck9NS2tZNWxIbEcveFVDNmtZ?=
 =?utf-8?B?eUFZdVdDRVFSTHNFNXZ5aUlpS1ZXQ3k0R3c3bFFFV21wbDNnbWNvNjhOSzdY?=
 =?utf-8?B?dDhkZE1rSWNvZzBHMGUvRzhkclpGYUsvVUhsc3g0VFhuaStRN0NYZnFkM2ls?=
 =?utf-8?B?cjk4T095ZUVyWlVUbkhvRU10UEEwSUFVM3hObElZVGVxUm5TSVkzY3pIbDRS?=
 =?utf-8?B?TDF0d1NwY3I1M1ljU0NHdTRaUGlRK0UrN2VxSlFSZlk5TjJrdGd3Ny9EUktz?=
 =?utf-8?B?akE4dStwZlVjV09wVlFoYUpBVklkbHVaV3FYL0NEVUJoLzRVUy9ZRU03YnQ5?=
 =?utf-8?B?dTNWVmRVY3JYMWZselpVZnZjdldoZHJqRlYrVFJvZ2ZFTld4UE8za043YjNp?=
 =?utf-8?B?NnhTWUQrd3hYTEF2dXNxWEN5akVwdHRGcnJoQkxldTRQK3pweU9EVGFjWHA1?=
 =?utf-8?B?VkJPSmtNc2xBRndOY0lVNmJsSUM1V2w0ckd0OFh1Uk51WnAzdnZqcEdVOUox?=
 =?utf-8?B?QWVySjRzcXJGalZ4dkMvTG5JTlpOMFBUV3U0ODVxYktKVklYeVVwSmNBN1hP?=
 =?utf-8?B?akY5M0p3Q2s4Ty9zZWFzUWpUZ2xvT3BKNVpGbEROSCtWZ3FqcUI3WkU4cWFG?=
 =?utf-8?B?eWd0YlJubEFPcUlkZ05RRlF2eCtsdnhFS3V0ZWNabzNvbXBzSTE1MFFCbGZB?=
 =?utf-8?B?N0tKRjRNSmNENUNaSGpEcnN0N3ZZVlV4cVFFcGVmbitRMVMzem85SENvY1Np?=
 =?utf-8?B?Tmt1a2VwTG1GUzNFeEZYcHNsSjNwQlkvSWVRbFpid0FaUlhLMWl6YlEveko4?=
 =?utf-8?B?NHdXV1o3bWpDTy9pcHBlNkRHbGZpdmVxTkd1VkVIYzBwUXlWeGI1VG1UMENY?=
 =?utf-8?B?b1dFUDFjQU94QlRGaVlBVmRIZkw5S3YwQVBheHRkUVJNWmhhczdxZjBqQnZx?=
 =?utf-8?B?dWdoUFRXQTdvWlQ0ZmNKakdMckkrSGY5SXpqNUd5dVRLQnJTRE9YclEyTS9F?=
 =?utf-8?B?Y0VoM3lETzl4d1lVdzA5VHhLeUJqWCtMUVZDc0g4U3M0Z3RSRFEvbXdTR2VV?=
 =?utf-8?B?TGtnVmVmYUtGMDNpMG9pZWZKWmlVQjZKT0RhTkpJMExIa1NnSGdkTUZTeGs3?=
 =?utf-8?B?V0VHRDZvVXB4dlR2aUhZSStKalBoT0d4aXZrWHVoRGQrcFRHQzhGTVRFSEpy?=
 =?utf-8?B?TlBRSTBUdTRwNHlyRmlKSVkvcDFBd1ZBWjFJWUIrSndiejdNUVF5OEZFUTRC?=
 =?utf-8?B?TFAzQlNkejVvQWliS2VmNCtDRkZRS0dLVjhCUnJLWUJLOHBGYjA1TTNkcEJ5?=
 =?utf-8?B?UEI5WS9Pd1ZHYlpnRnpyd0pRZHRBOThOVWVRalY0UGtwU1R4QmdmNTJtR0RD?=
 =?utf-8?B?SzZSaE5RS1RuWWNDcHZ2SWNzcEk2TXFKOUl5UkZUb3VLK3hkZlA2azdyOUhU?=
 =?utf-8?B?M2pGOEI1cGJpZzF5ZnZ4MERVYTVPellDU2EzQVhiN2VvZS96N3dyM3B5ZXlm?=
 =?utf-8?Q?6uSk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 958c203c-638d-477c-9650-08dd5bf5e354
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 14:56:21.1141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PlqNUGqqYDk16Gj5JOhxSpDoyhoMSwytqznSsihJAmPlOhYKVpRpyx7VkKHSfos5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6564



On 05/03/2025 10:37, Ayan Kumar Halder wrote:
> Hi Michal
> 
> On 05/03/2025 07:28, Orzel, Michal wrote:
>>
>> On 04/03/2025 18:57, Ayan Kumar Halder wrote:
>>> For AArch32, refer to ARM DDI 0568A.c ID110520.
>>> MPU_REGION_SHIFT is same between AArch32 and AArch64 (HPRBAR).
>>> Also, NUM_MPU_REGIONS_SHIFT is same between AArch32 and AArch64
>>> (HMPUIR).
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
>>> ---
>>> Changes from
>>>
>>> v1 - 1. Add the R-b.
>>>
>>>   xen/arch/arm/arm64/mpu/head.S              | 2 +-
>>>   xen/arch/arm/include/asm/early_printk.h    | 2 +-
>>>   xen/arch/arm/include/asm/{arm64 => }/mpu.h | 6 +++---
>>>   3 files changed, 5 insertions(+), 5 deletions(-)
>>>   rename xen/arch/arm/include/asm/{arm64 => }/mpu.h (87%)
>>>
>>> diff --git a/xen/arch/arm/arm64/mpu/head.S b/xen/arch/arm/arm64/mpu/head.S
>>> index e4f2021f45..7b659aa42b 100644
>>> --- a/xen/arch/arm/arm64/mpu/head.S
>>> +++ b/xen/arch/arm/arm64/mpu/head.S
>>> @@ -3,7 +3,7 @@
>>>    * Start-of-day code for an Armv8-R MPU system.
>>>    */
>>>   
>>> -#include <asm/arm64/mpu.h>
>>> +#include <asm/mpu.h>
>>>   #include <asm/early_printk.h>
>> These should be sorted alphabetically
>>
>>>   
>>>   /* Backgroud region enable/disable */
>>> diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
>>> index 219705a8b6..644fd0fcfb 100644
>>> --- a/xen/arch/arm/include/asm/early_printk.h
>>> +++ b/xen/arch/arm/include/asm/early_printk.h
>>> @@ -11,7 +11,7 @@
>>>   #define __ARM_EARLY_PRINTK_H__
>>>   
>>>   #include <xen/page-size.h>
>>> -#include <asm/arm64/mpu.h>
>>> +#include <asm/mpu.h>
>>>   #include <asm/fixmap.h>
>> These should be sorted alphabetically
> This and ..
>>
>>>   
>>>   #ifdef CONFIG_EARLY_PRINTK
>>> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/mpu.h
>>> similarity index 87%
>>> rename from xen/arch/arm/include/asm/arm64/mpu.h
>>> rename to xen/arch/arm/include/asm/mpu.h
>>> index f8a029f1a1..40fa6eaaca 100644
>>> --- a/xen/arch/arm/include/asm/arm64/mpu.h
>>> +++ b/xen/arch/arm/include/asm/mpu.h
>>> @@ -3,8 +3,8 @@
>>>    * mpu.h: Arm Memory Protection Unit definitions.
>>>    */
>>>   
>>> -#ifndef __ARM64_MPU_H__
>>> -#define __ARM64_MPU_H__
>>> +#ifndef __ARM_MPU_H__
>>> +#define __ARM_MPU_H__
>>>   
>>>   #define MPU_REGION_SHIFT  6
>>>   #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
>>> @@ -13,7 +13,7 @@
>>>   #define NUM_MPU_REGIONS_SHIFT   8
>>>   #define NUM_MPU_REGIONS         (_AC(1, UL) << NUM_MPU_REGIONS_SHIFT)
>>>   #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>>> -#endif /* __ARM64_MPU_H__ */
>>> +#endif /* __ARM_MPU_H__ */
>> Would you mind adding extra line between last definition and #endif?
> 
> this, can you fix them on commit, please ? Or do you want me to send a v3.
If I end up committing this patch (I can do that tomorrow), then I can do these
changes on commit.

~Michal


