Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3E2C8A1A9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:52:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172793.1497894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFw1-0001rt-0x; Wed, 26 Nov 2025 13:51:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172793.1497894; Wed, 26 Nov 2025 13:51:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFw0-0001p8-Tu; Wed, 26 Nov 2025 13:51:52 +0000
Received: by outflank-mailman (input) for mailman id 1172793;
 Wed, 26 Nov 2025 13:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fSqE=6C=citrix.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1vOFvy-0001nu-Mh
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:51:50 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d00a44d-cacf-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 14:51:48 +0100 (CET)
Received: from CH8PR03MB8275.namprd03.prod.outlook.com (2603:10b6:610:2b9::7)
 by LV5PR03MB8409.namprd03.prod.outlook.com (2603:10b6:408:35c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Wed, 26 Nov
 2025 13:51:46 +0000
Received: from CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8]) by CH8PR03MB8275.namprd03.prod.outlook.com
 ([fe80::b334:94c2:4965:89b8%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 13:51:45 +0000
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
X-Inumbo-ID: 0d00a44d-cacf-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/vUXVsOCZRtu+9ySqgxoudvkZXTu43ZBNrBXj3P3RpYFkLLvWrAg5M07eSuPSL69kk86mOyUcN86rHr0LEFvMxELM8gb3jmr2UY8srz3zIaCxKf6gcD4Jz54P8TLEkfSRQeDl4DoFDdIE2lMCePXXLTn8iZBN/uFqCr+fmyDL8aH+qbuWjIvnGnxkvMffU/uk6u4h1uzur1Kh2gDs9rF7DyHK1+I+YYTEIq21vwV0tsFQ6BzoQpiM5jy4TvakuZEijUJz04Ydf3VjxMbRGEl2EzxXEaYQux7tVIF6ZqisFxx1jeJn7V6+FRAO0m3ldDhpmaWaB1s7ZANIgqRHTtrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xH3PSPtyfxlv7BsGDtw1CYgo/fmljYPSZrwxVD+LSmU=;
 b=X8VRi8OPa0MFLaYHNwGgY9hPJ2barhd7QCaEzmn7olpDC8scbcrY1ZcTC/p8MbYxh8A9jblYhszNh9qDCRrdxnKCKIDtzCT3WtC7OcLE8Ar1HgXa4Ff/CDHvdbM0jMcy8iHGCv/isac3mlz3h1Vklchh1/Mh1gXk03yDBUskfFQsUrek8+78LsHVWZ9wY1nc6C/CuiGbn6ztO4sJSRcCdlDaNzKQuPCwJiFnCIDO2dY09vw4SrkFHVqsiv/BAkMEMc2tcgsw2o93WCycBpCf5hkkTH43OxuYZOP4KshacXVtWRIusrBWWL5zSJH5VXrl/ZJx0oD93EdWPREDWKbUQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xH3PSPtyfxlv7BsGDtw1CYgo/fmljYPSZrwxVD+LSmU=;
 b=lN+v17zBVtF/dpa6hkt6Ldrw3pno2ytgbGPlbgQwjusRuH6LMjJmf4N5BeAc2/6ZCirQcO5owfgSCaq6ahaJS3c4FcUhl8nL+F57cx4kCHJwlCHmtLgizw+2rVLJLeMdEpiVc3j7hfdJV2+Dzv6cArQrUUD6iKS94v0C3Mt213w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <859d60ce-165d-416f-a1f1-89ba11de2839@citrix.com>
Date: Wed, 26 Nov 2025 13:51:42 +0000
User-Agent: Mozilla Thunderbird
Cc: andrew.cooper3@citrix.com, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Subject: Re: [PATCH 1/2] x86: move arch_generic_hweightl() to arch-specific
 library
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <245fbc16-924b-4fd9-8cbc-a539b569edac@suse.com>
 <76f2d454-ee2b-4aba-a6e5-974b1b2dfbb3@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <76f2d454-ee2b-4aba-a6e5-974b1b2dfbb3@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0043.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::12) To CH8PR03MB8275.namprd03.prod.outlook.com
 (2603:10b6:610:2b9::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH8PR03MB8275:EE_|LV5PR03MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: d3096180-d3a2-4c7d-a8ee-08de2cf2f01e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VEN3b1JMcFVoNm1hbFIvUSs1Y0x0ZTJvSDBRVkJZK2s5b3B1N1RGVVFMZnVD?=
 =?utf-8?B?VHp1dU0xMGM2bWFhSlZ0M1pRcmJKQWY0ZUpKVDRzSSs2eVpyR0V4SFYxcVNJ?=
 =?utf-8?B?VEdMbVVZbVJuV1lJN2NaNUgzYmU4SnhJOTlRZE1vNmRJZGtvQXlDTDJlVlpW?=
 =?utf-8?B?dXlIbzVLUFJZVDg4OVEwYVpqb2d6SHVhcjE3VDVqb2pQYXU4SnptejFkYlRT?=
 =?utf-8?B?Y3JSNGNCQy91VTd0NUY5dFRSNE1EdjlNVmxtcExuNDI3MWpRSnVTSW0zSUZM?=
 =?utf-8?B?UW1qdTRaMWVMTFkrQURWMjZzOENqSHhXREYyR3ZNdU45T3kwRVZLQ3pJM2lk?=
 =?utf-8?B?ckRKRkpUenJ4bnFzKzF6NUk1ZW5oQnBoQ01sYmFCV3o3eXhRc0FVdzNCeHRL?=
 =?utf-8?B?eG5VVVpiOU5ub2xFd29nczNLWkdtVUlac3h0WlBBanFlM0tqUDF1Zm4vWkVa?=
 =?utf-8?B?blN4dnpUS3ZHakdqVGZJNGpwVzRwUENsMG9kMkNtVTA1SXZJNDdKZXlLQlNa?=
 =?utf-8?B?dUpvK2tkck94S2NVelpUWkRQc3NZQWRvMTh5UWYyQk10RENxanl2RjYyTys2?=
 =?utf-8?B?QlZvSmsrRS9VYWlqaE90ajIzQUh0bE5lSGE1K2RPNWFzaUd2Y09MOGtSaE5x?=
 =?utf-8?B?aE52UTkvcFRLdVBxTVQzalVMOUxzd0hSdVlySlg1MldhOGxJLzdiOVRydlAy?=
 =?utf-8?B?dThUdXpvaEJoRzRod0JxM0oxUXphdFBqSjVVcVluYXhPLzMwK2ZrVVNPWms4?=
 =?utf-8?B?WkpGMDNpcTZ2REJETm1QUU5NMU8rRC9vVlFjY281NEgvU1NlNVhTUFJBeEp0?=
 =?utf-8?B?Q2tUUlV4R2lIRG53WitPTUIvUkEzMmNGVkxOaFdoL2taZWZ4bmprcnVrUWpE?=
 =?utf-8?B?OGxHSXNCQy9uRnVZSWp1aXovclZxK0g3SUZnUXRucWZnMnJrQ3Z6bFZqZUlQ?=
 =?utf-8?B?bjlYbVVGdzhoekQvUC9IVkIyYzBZT2V1YVd2czZuSGZzYkkxaStEQXFUNGJO?=
 =?utf-8?B?OGptTGl5SlJlRnpyd1puUzFuMUJWS3pxSXNZdW5JeThyL250VytIZlVXYmhq?=
 =?utf-8?B?YjZpUU9aY3l1U3R5R0hkYzhCSW55cGVPK3FwRyt1dXBVZTdlUHJTa3ZUS3V3?=
 =?utf-8?B?d3NyMDd3UWpnZ2RCSlZsZGluZ1B0OWRoVU05bHZLNWplZlNqdHkrV0VLNWVR?=
 =?utf-8?B?cjlwVGZVcnRZR1hRV3NZSGRiWWpFb3hqWE54TmxzZjJvVFFiUHQrLzA4eVdE?=
 =?utf-8?B?TFdoQStjQldQQTN2c0o2WklONkljU0tkWEdlejZTdC9WeWJOZjdDOFRub1JY?=
 =?utf-8?B?QkRuaGR1dFJBUFRGNnZPeE5maVJ1T1FINUhiU3Vhd2Fka0J1T0cwWkswQWpJ?=
 =?utf-8?B?TUVteVE3WHpncFhvcFRRNzRCcE5IZXlUeHNsbUY5dnVUWlN5a1o3eWFOV00w?=
 =?utf-8?B?RWFmNXcxNXNITDZkbHRiZldaME5NSHJHNlUxYVlSUkhtcGp2U0dVb3JXSjlh?=
 =?utf-8?B?bm8wazhPOGFGSmlvNTVLWktaTXlQR3VkVitqTElvdHZhUXV3VFlQb3Budkkz?=
 =?utf-8?B?MkRRWjNaTnRIa1lHNytidXRNcnIvQ3c1dGF5KzdvYm4xaVpWbDFFbHRmV0tE?=
 =?utf-8?B?SUFhNTVNWnI4bzBvbE14TTYyaXRGZ2RyWkFyMnFSNEM4eWhFMGVCWTVzRXQr?=
 =?utf-8?B?eEE0ekNuSWVGTm45SlZLblcrWDRjd2Jndnl5clRKRE5sNVdXWHYwOU92Ri9V?=
 =?utf-8?B?L3lBelVIbExvZDVqRkROZEtiVVR4QUxPSGlEaUg2ZjN1b3FtTU9NMWNlMXFP?=
 =?utf-8?B?b2xiQ09MbDcxbG9KR2dWR0Q3R3ZnOUF0aFZIV0hBWlRiOXYxM1Q3ZTg2cExJ?=
 =?utf-8?B?TjAwS3lQaGRlaFBQVC9ZMytTSmNhQkJoanl2QVErL3lkZ01JTzMvdkpKUmM5?=
 =?utf-8?Q?IRvIxGOYs5izEj3XsmuZdOHPt7NyRYao?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH8PR03MB8275.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OTMxN2NqdTRaZzE0Z0ZFOEN2c2oybEFkV1N6VldyUU42aUJaYjVUUXF6ZzU2?=
 =?utf-8?B?MEc5eW42OXdiTlprY0lDRWlFdVJPNHdMeFJucnJJdzVEL2xwSHh1aldxa3Zu?=
 =?utf-8?B?d1VGbjdJQlJycFZyVWlEd2VBdytma1NBdzUwVFB6ckgxYUZ1Q05TVFBncXhQ?=
 =?utf-8?B?NjNZNXF5cStQZ09nQ0dRZzNJYVViQjBNUjJUeWRqWmkwZ2hPY002eWxmcEpo?=
 =?utf-8?B?aHFvR0pjQ0QyQjFQRitva2loT2tpZkNHdGpmM2p6TmpMYWdNUUF5R1loU3Ar?=
 =?utf-8?B?K3BieEs1ZUx0dmRMcDFCNEhVRDJ1WGJtVVZuekF0TmFqRFFqb0JudXJ2SThH?=
 =?utf-8?B?dVhYTkFrUGZVMXJJNXo5WGtlZk5ScmJLY1lBTzVWZHFqVUVNUmpBSjVONWR3?=
 =?utf-8?B?THVDakpRMXI5Mk82dlBoMXM1bTZhbExCS25VTFdlVncvbEtIV04ydHBrUFFU?=
 =?utf-8?B?aStScE5jb3BETStsWk4zMS8wL2JTRnliM3hDS3RHdnRQdmVObzZMRUgxdEJ0?=
 =?utf-8?B?dFpQMDdIK3lab1ZNc09Yd25hZnYvMmZ4amZZbGNONkNvZVVhOWxSTEQwMW52?=
 =?utf-8?B?T1lGRE9BcDBGbkE5WVdkdkhVSDdHU1Q1RlRxUWIvQ0Z3R0VieEt3YVRwbE1q?=
 =?utf-8?B?UThwK3JPWlM5YVJKcFZJTTJXRW9ySmkxOTJRYXhuekhxREFyeW14eXRyc0N0?=
 =?utf-8?B?TENpYU5VTkJuTVZWMUhya0NMSVZJblVCbFVONVMySWxlT082ODlydmlkNFJP?=
 =?utf-8?B?MjZPVlM2VXJManhXUTdwcG1sV1hkUFg0M251QW1kM0FtKzZSK3R6alF1MTJB?=
 =?utf-8?B?ZkphcGVNTUQwODZ1NUlGVGcwbnVKbzdTUmJJU0hoS0NNRVBKcytVNUw5d2Ju?=
 =?utf-8?B?SkJkZzRLeWN2WDNvbnpmSzA5TFcyZFVQOVFMZ0pEakwxd0hJUXlZdVh6MVlM?=
 =?utf-8?B?SkxhaHdiSll3SkkwMVlHVHROK1oyamJ3UytLSEVQRmc0ZGhFOHdZdEpGamlw?=
 =?utf-8?B?dkVOcEFxSU9XbjJUR1VhdC9XMUcwK2FrWmxISVoyS2pqSXJWUS9QOFdmbTdU?=
 =?utf-8?B?a0xONnFQZTdtNk1wNDFZREg3UXNFNytYSEptZ2Nkbi9kV2lUclpiK0NmMGdM?=
 =?utf-8?B?ZUFDbWh6Z21HYk96QWE2bDFjMTB3aFFmU09pZHYyMXJ6cnFrN09UU0JHL2l4?=
 =?utf-8?B?MHFUVFJScktZZzJNc3lnMVdVSFIxTzVGWUlSMXhVRGtEc2RpWFVUV2taaXBh?=
 =?utf-8?B?cFBMdG5lbWZxVUlmMUlHQmpyNDVBNVhIZUg2QlY2NkMycEQxcEZMbC9LYVJQ?=
 =?utf-8?B?UGdqRkIvcFd0ZlZUbUN4WGc3eGpmRkVuRS9QL3pvOFVCZUxkZS9DL0FIZ1ZO?=
 =?utf-8?B?dExZbGZ0TlJPLyt5dmNrVXBRQzJqelZrZEczZUxrTHNsaERzZW5kalRkNkdi?=
 =?utf-8?B?VW50ZW10ZXRVQUFYL0ZDNjVGbFM5SWErdDBtVHEyZ1hVd2IxVzFka2RBUzFu?=
 =?utf-8?B?Rmh3WWRZYXhCTzJTelF4RmE0b2JlcGVQRmtUam82QTk4NWo1RlVRclFrYkI0?=
 =?utf-8?B?NWdnbHZVZWpZNkpVc0RmN1Uvb3Z0bE52UUlIR0FBc2gzUzRtYlF0YUw5QWJR?=
 =?utf-8?B?UGd0K0dpa3dhNGtHOEVXcjF4RXBmZHR6S3c5azdudHRuTFpVSmJ0R2hBdmRs?=
 =?utf-8?B?SlpQQ3hhZUxvdDBFVElPOSs4dGovSkJpdnZwOXR5ejVZdm0rVU5kaFdKVzJE?=
 =?utf-8?B?WVJ0bU1oYzhVZ1dVTnVRSU5DNHpPWGU4VVFpWWwzZDRybHh5QXorajJjUmkv?=
 =?utf-8?B?NUFVQS91U1VVUHFMejNjNjRiZ2NOajQ5VDJaYzJBUDRQMUpUcXpPdUdMU1c4?=
 =?utf-8?B?Ny8zSXVoSXp2V2RsL3R4djFIRERnYVpOL0JOUlhHbHMvL2tPaUs4cVpjSkpX?=
 =?utf-8?B?OXlpNEh0VWs2S2oxQWNQdWMzOGlwTmlCTmo0aTNzN2EwdWowY2loeGgxQXNi?=
 =?utf-8?B?RE5nMVl1ZE1wMGhPQlY5RE53NTUxSytXdXN3Y21jL21JZXJWWjZnTm1EMXRv?=
 =?utf-8?B?cHZuRm1kQllaZmhvSktWWkw4WlprekkvQlZ3dFVTM0NkdzFFZ1JqOWhhTUlU?=
 =?utf-8?B?TlYxWFB2MkhMa0xaNWtZY05OeHV6L0pRYVdKdzFVMDBYTXdKYXZNaG1YaWJN?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3096180-d3a2-4c7d-a8ee-08de2cf2f01e
X-MS-Exchange-CrossTenant-AuthSource: CH8PR03MB8275.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 13:51:45.7070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OVDJ6t/PxaXdHs//yv6xucyKriOJnsSDvf51BMAOgHkqED7D4L30zyLWrnpC/1Pj8aEJhzDEi70vsmp0UIf5I7FOKaLbmFH8SE5uafa9/1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR03MB8409

On 26/11/2025 1:24 pm, Jan Beulich wrote:
> diff --git a/xen/arch/x86/arch.mk b/xen/arch/x86/arch.mk
> index 16368a498bb7..a0ee050c931b 100644
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -3,6 +3,8 @@
>  
>  export XEN_IMG_OFFSET := 0x200000
>  
> +ALL_LIBS-y += arch/x86/lib/lib.a
> +

Oh, I'd realised it was this easy, I'd have done so straight away when
adding x86's custom arch_generic_hweightl().

I assumed it was going to be more complicated getting the order of the
arch specific lib correct with the generic lib.

More concretely.  Given an x86 lib, we should move things like
arch/x86/memcpy.S to it.

Therefore, when we have common/lib.a and arch/lib.a, do we guarantee to
have arch/lib.a with higher precedence so for matching functions the
arch specific one guarantees to be taken?

Otherwise this feels like a trap waiting to happen.

~Andrew

