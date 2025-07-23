Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF214B0F02F
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 12:45:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053747.1422548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWyT-0001Ov-Qw; Wed, 23 Jul 2025 10:45:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053747.1422548; Wed, 23 Jul 2025 10:45:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueWyT-0001NK-NW; Wed, 23 Jul 2025 10:45:25 +0000
Received: by outflank-mailman (input) for mailman id 1053747;
 Wed, 23 Jul 2025 10:45:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3SBI=2E=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ueWyS-0001NE-LT
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 10:45:24 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21c43a39-67b2-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 12:45:23 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by PAVPR03MB9116.eurprd03.prod.outlook.com (2603:10a6:102:32f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 10:45:19 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%4]) with mapi id 15.20.8922.037; Wed, 23 Jul 2025
 10:45:19 +0000
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
X-Inumbo-ID: 21c43a39-67b2-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UUuDCE4Nt5DcE9xEUbgqU7jdL6Hqbq5HN+yBNtlE0zoaHTLpKpH+W3+wtAQ2cSJ3oIX0S/2ZmrMHAPMDdqPd7G3AVVFc69PrQU2y2VlUkk/3ou+ySJDRHif1tUKjwjfIqLNbkIoX1CAK5TgQoEPPmrvGwefZj2s5zVsIRdMP+91cGltuKH/tspf/tNZoQXoZFK6Ihl2cd89RDwkW3w5dzLcmS6EqxbjzcocwRHOkLPhKf2u0MifZ7dmET4b7B5hlUcHAbWSbHPHvsBjgIXxYLngEMlrClPxY5G5f1W9Ehs7BnI6O8ModMAl95tKdDAUJcKg+V69esYBaTSJGdgl2zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+7VgzAtPOvtIFHv9OmnjG5IBZFUidZmHs2DAkFzkyU=;
 b=H5YAB58Y3eucPU1msT7fZaFrYNN3MIDM0YXP+Elt1AUkhdGK3Xl/DHDyJ23RvOrDkjJSMAPv+Dzua0A4ccMLApCiu6lSmc8CLJfa3ral7InpQPR/morMhwJEdgv3Mk445Bh6tK7LjrPhpTjyNGs4Mbd02waN9VVsjkSBjhSQ1Jt+PADrkXi7vWL6BQtkPqoyLD9FBNmh6kGynbe2WugYXX8VWPykVhil2VDORjvP4FPqCtAVDPXqVW8wkGXPdJ4Zv24OR0QyhAeIt9Ku347q/eWhHHS8n6BxOfT8x6/xIvpiFcPChswxY40Yxq33j0gg1lmHoR/A7VPpiYhv6SBjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+7VgzAtPOvtIFHv9OmnjG5IBZFUidZmHs2DAkFzkyU=;
 b=F+fagN2esHyAtIUF9LviSE5CWxrfdwfrfr1eBC3Muh1pkRFJZpqzVPSiNT+uaCXR62lg9MzHohtjh5ZaSXmAWlz7uNJvJ9siyRKAfzj6mYHvRYdBbge18LQ3vaKXNDNV83MrXZa3EdljhmIAhS02ELAtV4aFFn4FC8oMdiEbxtUW5QmpgZufC8Eyp81VZ13P/HBwngm/uGg08NSz7ntnB65He7+lSodwbjLDIPNIqnfdUKA4jZMl40LY6QjR7iRKPY1UQSpL2TxadbE82J+GDDUjkYJ/HsvLU5fbmL3ic98ck4BXVaH/kG7Nl2Mif+eNqt+V4TzGL5BbymFwvFFB0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
Message-ID: <4d5d6563-216c-44ce-b279-ecaa6f637734@epam.com>
Date: Wed, 23 Jul 2025 13:45:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 3/8] xen/arm: move vcpu_switch_to_aarch64_mode() in
 arm64
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20250723075835.3993182-1-grygorii_strashko@epam.com>
 <20250723075835.3993182-4-grygorii_strashko@epam.com>
 <a4b971f0-8d96-4917-a9a3-ef08d267327c@xen.org>
Content-Language: en-US
From: Grygorii Strashko <grygorii_strashko@epam.com>
In-Reply-To: <a4b971f0-8d96-4917-a9a3-ef08d267327c@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0195.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::20) To AS2PR03MB8907.eurprd03.prod.outlook.com
 (2603:10a6:20b:5e4::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR03MB8907:EE_|PAVPR03MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 78df3a3c-a0d8-43b6-71da-08ddc9d60462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QklMZHJtcHkzRFFuWkRnY1gxY21wd1lNOXhQTVFEeVBlMktYT2hpRU9COGho?=
 =?utf-8?B?VHhsOUU5a1JabkRFeHdubUFJTFp5UGd0MWl3Y2NoT2xteWNJbWpyVENBam83?=
 =?utf-8?B?dzN0SklEQy9Wc3llbXVPOExuOU9LbndTU2syTmJ1K2k4VXBoZExSU0paWCtL?=
 =?utf-8?B?Qzloejc3YVZIajkydHl5YzZPZCtnYTE5QVArdVRYZUdMUGpDOHBWNlVCS3V0?=
 =?utf-8?B?NDh3TEFTbVNEL3hGNWlyVWtsRVdHeUlTVUR2ejBJeEQvT1pyRjVVNFFmL1lL?=
 =?utf-8?B?UzA0a1pJcmZpWFZvZERhbFdCbXhleHBRQ25YOWNxMlBnWnpTNVNoaFBneGFN?=
 =?utf-8?B?WVRJQ0lnZmpjNUJWYk5iaXBubG8zaTRXMklxdUxON1VYcnRNMGxoVmRZVzFM?=
 =?utf-8?B?TzNhL09QM3hEa1JmWUVQMFd3bEdsSDBsL2NKYUE2NW5ZOXhrQitwcHFDWDVr?=
 =?utf-8?B?OWJyS1dtV3BQVWx6ZXQwVzJYeVROLyt6MHdzcDJJRkpRV0MyU2E3WXVMUUkx?=
 =?utf-8?B?Tnp2RklSanB4aHU0UEk0UFY2ckx6MDUzcWZxdzQwTVBIcm9qd1lrQnJSVjJn?=
 =?utf-8?B?T1d4QTN6RnNqdUI3NlQvT1BkQ3JYMjd1dUkyNy9kSXY5VnlpZHh3Z0lVRXQ5?=
 =?utf-8?B?bGpmNCtwMUpuR3JSUTNCOGhtK0Q5OFVoc3pnYWFLWVNRZUgvaHpWSDJGYzdS?=
 =?utf-8?B?TlNsRm52RjNaOHdCOGpLY3llbU5MYWtSaXQ1OXBoaFBxUWd1d1VKSGh2KzhC?=
 =?utf-8?B?ZnJvUGgwU1orMVg0WmxZT200OXc2bURhRHlXN0NVY3A4dFVtZk5lL3c1RUdz?=
 =?utf-8?B?cDVqY0pGMjJTUVNoSHl6dGlVTjRjQW41U3ZlblRRcFdGWUYrRlN1aldrZ2pV?=
 =?utf-8?B?Slp1c3I2M1ZrSXR5TW9oRnIrR21DT1VOekNMUUNCZm1GeXRhNCtTNVV1Vzhz?=
 =?utf-8?B?alZSMmJ0MUlNVXM5Qy9mOWlMTHkxMTNZTjJ1Rnk5OU1QY1oyQUxCK3FGdXR0?=
 =?utf-8?B?MTlWcnNWOXZVNXpuN3lSUmZkakFQVFZuN0huQWhqT29FT2o1U2h6UW1aMm1s?=
 =?utf-8?B?Mm1WRmlSekxuVnRNWEVnRzE5aUM4WHhORWpVQzkvb2V4dHhaNHp2OUt1NFNr?=
 =?utf-8?B?VFdtdjlCdEJ0MzJWVDlQMzkrVEEyYnZMYUI5WENvRE1wbll3ZEh6Z0pQYjdo?=
 =?utf-8?B?dmZMZzV1cWhmdVF1UjhKUVJYYWlYWjhoNHE5cDBzS1JHY0NGMmkyMTdCWFBy?=
 =?utf-8?B?dDRBUVN1V1VTc08vWHUwMVI3aDcySDY2ZWtOcEFqMmFZMnp1SXlYOWlZRFUv?=
 =?utf-8?B?NExzNnQrMm5WUUt3VDYrcCtFVGJiWWxtUHZVSmVLNkRWYVJJOFhZZjhsZDlI?=
 =?utf-8?B?WWVIVzN4c1grdWQrZGhVOWN4K1pST0ZnWjkxUThvNmd1aVpiRnFMbXZRQ29t?=
 =?utf-8?B?OXNzSnp1ZGxCVjdNMnJESkw3YWs0WVp2WmtJeTEyVUVmRWovdXlIdmFlUlB2?=
 =?utf-8?B?dHhXUXNsR1lGZWJFNzYxanc1ZUNDeWZSYnpmcVJJcXBGaTlQOTJoc1ZVdG92?=
 =?utf-8?B?TC9xR1k3NGR5S1l6VFNsY2x1TGNBaERZcmZ4cWxWSTczcjlLSXBURmhJSHhW?=
 =?utf-8?B?aUU4T0xFV2xURFI4UHkybHEvTEdhcGh1SG1FRDBiSVNzY1lCaXJOdTIvOHQ4?=
 =?utf-8?B?V2o1MVZnSjVVVGJDc1dncjlaeFN0WEg3SVQ0ekJiVHJBMDQva0o0MkszZlh5?=
 =?utf-8?B?dnNSU1d3WFpaSWdLYjFKYlRic29rMXI5N1lyWjUzcHdKQUs1TldiOUhvN1Zq?=
 =?utf-8?B?UW1uMzE4cVVVSGw2UmlCRmNCMVN1bTBsMXpqd1Q0MkNnZWxEMzdUNy9qZ1Fi?=
 =?utf-8?B?OEx4K2Zkc3o3bWFHTUM3Y2t2eHJLMWxIWUE1OVlLaXpKWEN0bVZFMzlEMW85?=
 =?utf-8?Q?rvwxb3EC0c0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QVBjd3IvUmZ1RVh3NlBUMC8vZnd3SWk2Y2ViYWdWNzFNaWJ5VlVzaXEzK0VP?=
 =?utf-8?B?Vnl0ZHpvZUlkcVM0bHVSVk4zZDljS3dFS3F3UE1UZndxZk5VL3hYSGkyNm5B?=
 =?utf-8?B?bHZrdFhiVjM1SFlheE02MHdRek5kaytsbUtna2t0MmpQUXBjOW1KbkVOWHBW?=
 =?utf-8?B?TXEvYzJweCtrT29PbDhFYnZ5Y01rcVAzNlZmTWZjZitrejN5d0dXUFUxL0RT?=
 =?utf-8?B?ODVxYi94ZGJZWFcxalg0N3FDZSs0eEppSTF5YXlnNWJKdFdEQi9KbzBXMWVE?=
 =?utf-8?B?SDdCL1BzNW9sK2lENWtNZHJuZ2ZRWjRiWHI5SVNRU2JxSlgxNzRKalFScVly?=
 =?utf-8?B?b012N1pxd3hNTkdwUXlLNm4rK2VlUk8zOGpoTUpsQ2RZY0tqSmFCVWQ3NGc0?=
 =?utf-8?B?QkNzUU93bUtMZFRzSUJtQjR4UmE2ZXMvQkZaUWdiWmJkcHFweWhMYS9kYWIv?=
 =?utf-8?B?a3Z1ZG9GdStlNGN3NGx3WGF0ZTRlUnkrZUgyYUUvMzc2bWEyK3NldktEaW5E?=
 =?utf-8?B?d0UyYnE1dW42bWVkeExMblBHZGQ0cDhmcjlIdG5wcmhpTFRzUThkeEdxM1Bz?=
 =?utf-8?B?Q1g1cURIRjZEMEY3NUtkck1lakFVL2tkSkxkaXQ5Nm1UNXhMOURFRkZqZGNH?=
 =?utf-8?B?enRka3FRMzRCK3Qvc2ZRK1ZveThUS3NabGxSVFd0TDZQQWVGWW1hYmdHUzNi?=
 =?utf-8?B?QXpmWWo3K0swL1JFUFJCZitZQWpKbDVZU1k1WFB2ZW95TjQ3THV5MWozY0gw?=
 =?utf-8?B?LzQwVWlHMjdtRXppblRGR3h3MHpnRHdYaEgyTUxoSGRxYkRPcFM2QkVCNzdY?=
 =?utf-8?B?QWRHNTBXUHZUc25sMkxJUGgwSW52T3BXbXViU1MxNDZPM0xMREZSY1llWGdn?=
 =?utf-8?B?a0N0QzJMR3BBdkZ4d1ZHR24zdi9uazhjdDREMHBqL1NQYXdRb2hFUTJPcTNr?=
 =?utf-8?B?Z3IyRnFsTkZNL0lPS2tuWjhLZkl0S25qQ2Zqa01hRHI5KzBCVVdtc1BJMkkr?=
 =?utf-8?B?VGdsZkdBNUloN3UvdGVEVFlaVVdiOHJZcmhsdVR5RjZxUHdNOFcyL1A0STR3?=
 =?utf-8?B?OW0wS3pzVHo3Z3BXbTQ0NzRxb2t3YUJFS29UajZtaEIvTjVzNEprUXpNMkNR?=
 =?utf-8?B?Mzk5SXpNbnIvdXU0VnBoczRRSXRXMlIvUkJONHBRVGRsWE16ZWVJMWwrRnlZ?=
 =?utf-8?B?Uis0d1pORnJ6UTVVaWdNNGdYaU56Ri80NDRmZ3JUTUxzeHRUR0JQb20vT3NP?=
 =?utf-8?B?RGtKU0N5MEltRnRXTjU1dzJ5V3NCa1VPWVR3YWhvZjI2VVpvcUJuamZDaEhF?=
 =?utf-8?B?Rngxa24vWmp0cElxTzhUMDB6NGorbUYySEFKYjVORWUyY29lMTE1VXZQNVdk?=
 =?utf-8?B?ejZZZTRRb1Bad21mZVpKZUloS1dhOGhsVFd6Y2E3NGo1N2lYQ1lROHkrUHBr?=
 =?utf-8?B?eEU1bUR2djUwN0dLN29RUEg4VTVxMXdwejRIVHBHd2VLSXErdEJoK0c0QTNi?=
 =?utf-8?B?YnZlY3FSU0Z4YzB5Q0lQT01jeU92SkRxZGVqeE41eVgyelIyWmd4cVdsS2NB?=
 =?utf-8?B?UVpyRm1oZWltcXlmL0VNZ0ZpUlk5ZmtscENxRVg1WlVEZFk2c2pqVW5MSC9h?=
 =?utf-8?B?VnNNRzdoSmNUS0VtV2c2OStTUzkvNHArcUowWHlXeFZ1emFJcHJSVUl1Y2RM?=
 =?utf-8?B?NXo1ZmozbGtpckM2RXcyQXpLWXROaGptYnlsbWQwYisveXB4QVp6WU5JZDRL?=
 =?utf-8?B?SDZ5RjFTcjZOWXppQ3NtTS9FdjVkby9NcGhZbFpTQXJWQU9HWXQ5RDNUVEhT?=
 =?utf-8?B?aDRZb0swZ3ZKV09JOWluOUVVVnp1ZkhiR3laUTY1aGo4U3MyejdjS2dMcmV1?=
 =?utf-8?B?bGk0T3dMNzI1Q2diSFAzY0RzSVVycmRzTFhDNzZGcElxZEJ5RGNJbW9qdkpI?=
 =?utf-8?B?TjFybnZzOXo0THdYNjU0QUlkVGtXSjJoVUtScnZ5V3N1OHVoRjYxM2ozdERQ?=
 =?utf-8?B?emdNY2lrV3Z3VWJBOXZZQ0FEU2pRWGFGNHZiWFQ4M3VTZ1VhUU4rWWxvWWN5?=
 =?utf-8?B?OEY2UG9yQ1ZieENHVzJpbTRpaTVTOVRUeFpNYmdwUTlnRFY3WEw5Um1qaktl?=
 =?utf-8?B?ekZkZUxNZGQ3NHlqUFYwWlhuRjRMUEVRdWxzY3dqN0NTSmVFWGdQRjVmSHFV?=
 =?utf-8?B?V0E9PQ==?=
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78df3a3c-a0d8-43b6-71da-08ddc9d60462
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 10:45:19.1706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GcpafxSVYVgNRGEcjHgRNJOiRkribRNOj3DA7qaOTspRx2lU+pu29WPKiECpDTIztX87SKT6dqeM2ITUyLIijwxKccZVQPggFbAapFYPfBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9116



On 23.07.25 12:22, Julien Grall wrote:
> Hi,
> 
> On 23/07/2025 08:58, Grygorii Strashko wrote:
>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>
>> The vcpu_switch_to_aarch64_mode() is Arm64 specific, so move it in Arm64.
>> As part of this change:
>> - introduce arm32/arm64 domain.h headers and include them in asm/domain.h
>> basing on CONFIG_ARM_xx;
>> - declare vcpu_switch_to_aarch64_mode() for arm64;
>> - add vcpu_switch_to_aarch64_mode() as empty macro for arm32.
>>
>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>> ---
>>   xen/arch/arm/arm64/domain.c             |  5 +++++
>>   xen/arch/arm/domain.c                   |  5 -----
>>   xen/arch/arm/include/asm/arm32/domain.h | 17 +++++++++++++++++
>>   xen/arch/arm/include/asm/arm64/domain.h | 22 ++++++++++++++++++++++
>>   xen/arch/arm/include/asm/domain.h       |  3 ++-
>>   5 files changed, 46 insertions(+), 6 deletions(-)
>>   create mode 100644 xen/arch/arm/include/asm/arm32/domain.h
>>   create mode 100644 xen/arch/arm/include/asm/arm64/domain.h
>>
>> diff --git a/xen/arch/arm/arm64/domain.c b/xen/arch/arm/arm64/domain.c
>> index dd1909892995..1e78986b5a7b 100644
>> --- a/xen/arch/arm/arm64/domain.c
>> +++ b/xen/arch/arm/arm64/domain.c
>> @@ -55,6 +55,11 @@ void vcpu_regs_user_to_hyp(struct vcpu *vcpu,
>>   #undef C
>>   }
>> +void vcpu_switch_to_aarch64_mode(struct vcpu *v)
>> +{
>> +    v->arch.hcr_el2 |= HCR_RW;
>> +}
> 
> Strictly speaking arm/domain.c is GPLv2-or-later. But arm64/domain.c doesn't have a license.
  So it would default to GPLv2-only. There have been argument in the past on whether we would
  re-license code from GPLv2-or-later to GPLv2-only. But this was never concluded. So I am not entirely sure what to do with this change...
  
> Bertrand, Michal,  Stefano?
> 
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index bbd4a764c696..e785278cdbd7 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -605,11 +605,6 @@ void arch_vcpu_destroy(struct vcpu *v)
>>       free_xenheap_pages(v->arch.stack, STACK_ORDER);
>>   }
>> -void vcpu_switch_to_aarch64_mode(struct vcpu *v)
>> -{
>> -    v->arch.hcr_el2 |= HCR_RW;
>> -}
>> -
>>   int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>>   {
>>       unsigned int max_vcpus;
>> diff --git a/xen/arch/arm/include/asm/arm32/domain.h b/xen/arch/arm/include/asm/arm32/domain.h
>> new file mode 100644
>> index 000000000000..4d1251e9c128
>> --- /dev/null
>> +++ b/xen/arch/arm/include/asm/arm32/domain.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +
>> +#ifndef ARM_ARM32_DOMAIN_H
>> +#define ARM_ARM32_DOMAIN_H
>> +
>> +#define vcpu_switch_to_aarch64_mode(v)
> 
> I think you want to "consume" v. IOW (void)(v).  That said, we tend to prefer using a static inline whenever it is possible. Have you tried it?

will do static inline.

Thank you.

-- 
Best regards,
-grygorii

