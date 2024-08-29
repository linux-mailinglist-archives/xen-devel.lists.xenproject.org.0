Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAE796445B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 14:25:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785806.1195305 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjeDK-0002OK-04; Thu, 29 Aug 2024 12:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785806.1195305; Thu, 29 Aug 2024 12:25:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjeDJ-0002Lr-Sb; Thu, 29 Aug 2024 12:25:21 +0000
Received: by outflank-mailman (input) for mailman id 785806;
 Thu, 29 Aug 2024 12:25:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0cO=P4=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sjeDI-0002Ll-35
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 12:25:20 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20618.outbound.protection.outlook.com
 [2a01:111:f403:2407::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0337386-6601-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 14:25:18 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA3PR12MB7877.namprd12.prod.outlook.com (2603:10b6:806:31b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Thu, 29 Aug
 2024 12:25:14 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 12:25:13 +0000
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
X-Inumbo-ID: c0337386-6601-11ef-a0b0-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jxvr1AVqJAqoL0LXdZdCiyZxOwSf8foTnamtta+qfmWbRgg/FPHleNhNVYE+C55a7DfBtlqvGLI+2+3YL3w5aBaufJouZMZ0tpTTdfSVehJTgFn0OvKnxeLUrBHBLD+tTI9kEd4QDrNTMQJ22Hv4giWMD8hrew34Q/bI8l5Q3kjw2CXS3oobjFgN/4Q/Tah9ZHb6fMhcFDpCvZalssGgcmwceHLjXZV45zhihiIIy6CHogxjXKv0d/2nseL6ScYDxA/0NhZJ/s8VE9na/aapaLbpMZIxNqIyhQ6b8zB2X6gvsJ7bKpUiFO4F9N7cr42M3UmcbLpzvw+bn897shcVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PL+jn9OjPmLNJlqKfsE9y44CsGOuj/IRg4bxm5PdPqk=;
 b=O6EP+cY4PuRZ6DKitTFD/jaUWTIjkdH0ccH9ytqcbcUY092vIRc/slVXRKPELXuILsugVYQCmvKm/rdlOkTNA8c/tpTua4pNMOnVu5oGpURbFUngGVf/TClqBB/rISydxdweFFN2ue1IMNmmYggtGc3HWihzc1agkYikurp/kuPMjSbzf7l6+tzRa6NOi4FdF4yliiEt1w3fy6xYbMEzOnme+ignF2jmtrgNi+XhU38S/oo4ehJeFUIT2vhNuqCETmHNOY6/lF82vQh5DUlZmQc8nnIx+Y4GwhIRBq/2YhKG3Gf7o/IhtF8J/4TC8AccUNcy3S+Ac8RZek+26ivevA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PL+jn9OjPmLNJlqKfsE9y44CsGOuj/IRg4bxm5PdPqk=;
 b=CnJ5ZayrXaXF+n/E4EyjtJtnemxcPvf5Ub3V/yDmZS7rvHgxUOAcwv303toE9tCBBdjE9EhAyixsZoqQYoD8SmQkAX9L0SEi3OtAZKxmWjEfjFfKr1st4+m9m2IqE/BTmvVyWOAFjFDBcvMjal+bkGTez2kyj5ldVvj6bbhyTsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <138347b2-e2b8-44d8-961f-cea212f1ec37@amd.com>
Date: Thu, 29 Aug 2024 13:25:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: make VMAP support in MMU system only
To: Jan Beulich <jbeulich@suse.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Chen <wei.chen@arm.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
 <20240821122503.2315844-5-ayan.kumar.halder@amd.com>
 <cd2e6b08-ce76-4707-831a-c21b05ca85cf@xen.org>
 <6d065949-dfae-41f8-b030-c7d09516846b@amd.com>
 <ec35f90e-d999-49a5-b3c3-79aa32689687@suse.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <ec35f90e-d999-49a5-b3c3-79aa32689687@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ad::23) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA3PR12MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: da329a71-95a1-47c2-da79-08dcc825a1e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkkwQkFIVEc3ZUg5ZExLRXFFMFlEY2FIdzdJNGJ4ZHIzc0EyMGNQQU5QMVl1?=
 =?utf-8?B?bXpid1ZtRXQ1UDBaUUViYnhhVmdTUkMzdldzeU9LR1I1UzFuS3BYQzRHb2hN?=
 =?utf-8?B?TERFOVhGS0UzYXRCUkdmZHlvRkpaRC92ODFYUkptMzJESGprMlZVUGFhMEo5?=
 =?utf-8?B?N04rL2JpSStlUlB5b3hzamF1cHJJUnlWbE9PVWExZitOdzFhSjZXZ1hXLzMx?=
 =?utf-8?B?Skd6NCtjeXJzVjZMVDhlTXl5RDc3MTdYS1M5WjVoU0FweXA0cWpDVlMybnBj?=
 =?utf-8?B?MTYzM2RhUGQxWEJYZ2YySU5zSnNKQ1JUbGhxaFJDR21NdjFWdmoyelY4VEg2?=
 =?utf-8?B?RU83bWJmTElUK1ZVMGhvY2lSalRrOUJYT25DRzhCbmxWMktHR0g0RlZTRUFJ?=
 =?utf-8?B?WFU5bmxwVGdGbXNqZXZ0OTlUMUtGSUlhMlFOUHlMMDFKNkhsM0Z2SnNJS3V0?=
 =?utf-8?B?VUtZUjkwMWlja0g1ZjJSQjk2QUM2Y04xR2UxYTJCYzlCbjhxRlFrd3BlNStJ?=
 =?utf-8?B?dzlaajEzYWFUTFZFRXBWdE9BV21aRzhJZzZFUUh5WkxCOHZueG1nWG5GK0p2?=
 =?utf-8?B?UXppamp2NUc4elNUc1B2MzVieUNVbnIrQmhFTWVIMTYwNW1mZ0szc1loYS82?=
 =?utf-8?B?c1ZEcmhnNnV1TDVQTUlxRERYWUtYNEwvT3RnOHRUU3FoQUZub1RvMHhjcnBn?=
 =?utf-8?B?YTd3VW56UFJSa1pZcTRIU2JIYzg5S05kK0xDYXl3d0ZaS2JJY0Y0SG9pZWtQ?=
 =?utf-8?B?RTBjdjRRNUM0Uy84ZXBEWkhyanlxU29KODR2aTM2dTEwMDltbjBlWHFJSDR5?=
 =?utf-8?B?WmZveXc1SWV1RVVtaGdEYWM4ZFQ0UDBJOTNQcnlMd0d6WGtDaDNrc3ltamx0?=
 =?utf-8?B?VnFzYVpVWU1ISGxmK3lOSXpoT3ZnMVVLWWdoQlFTWTFEaEFNeklmV09CTjdY?=
 =?utf-8?B?bXhDWmZIUnEyWDQrRjJzUlJzV2hnSGtOY09wMUdjcmNwaGszeTRxWjU2RVlj?=
 =?utf-8?B?cTBmM3QrRjFpcWRBN1cvcXYrUmVqMTEwQmQxcVVXTWszS2lGSVdCZDZpRXZv?=
 =?utf-8?B?ZGU5MFprTjVZSWhpaEgvalp5M1hudER5R2hNV0s3Rzhza3A2em1TTWNuUjRC?=
 =?utf-8?B?VEc0Ym1LYXZJY2hqQW1xRXhDczRDN0dGdURNZnJkQVpTeWN5YUR0TXlXKzZO?=
 =?utf-8?B?Y3pONFRqbUFGaEFWRkdkNndCb2pSWkg4eENSTHBOMWgzTFVySC9lY2Nvd0Ew?=
 =?utf-8?B?MHVndVZjbkVhVkN5RElYdm15Um5sNlJQb0cvVkExRmFnbGk0M2ZqSUh6Q2ZT?=
 =?utf-8?B?dUtNUnJ3TGdPSW03WWJ1WVJEdlR4Z01rUHorUko1emM0a3QwSVA0TlpWUDF3?=
 =?utf-8?B?UnlKL250cXBsbW9SdXo4Q0Z3MGI5OWV0NmtyaWd0Q3JlcnpuWGNPdzhDUUJP?=
 =?utf-8?B?d1NqWU94blJHWHhHdU1VQSs4YnpFTlRKUEpURU0ycW9aRXdrTEFVN084NFJC?=
 =?utf-8?B?aW9tN3RDVXN2a2hiVzQ0em5UMldjNTNHTGNOVDRDSE9hcVE4N2JDcjlMUGMr?=
 =?utf-8?B?c1YrQmV5UDdOQk9kN2MydEFWSll4NU4ySlBlNHRjSktSWGNJeFJiUjBTNStF?=
 =?utf-8?B?N0pxSDVkSk1KUWRMZVRiZ0NMcU9Ea2NYY1ZrdTFmMWJ0NVBIWmthUVU5NXVq?=
 =?utf-8?B?eldFRWNhcHROOXRYMmVsNE9pQ2MxYjJmV25LY21HVXU0NkdMSVIvaldUTjVh?=
 =?utf-8?B?TnNBcXlTbFZYbURPNnFQOTQ4VzdCRGVTZHJyS2M0MkFNQmVEaFVCWFVxOUN2?=
 =?utf-8?B?V3ErN0pjM2RLUFFsQjFTdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmZUSjlCa0JsQWhWR1VkaDN2MFB0NklTM0MydC84YVZsYkRSL1VDdTJiMFk2?=
 =?utf-8?B?KzU5eTBCY0VCc0NGMU1UK0FSa1pheXFYTmkxb0ZxYjdsT1hJNjhxb09OWHox?=
 =?utf-8?B?TFdidGxlMVlzTys2L1luNTlNNnY5MWM5RFE2L3B5T3hUWjJ1RVRZWXhlWU1y?=
 =?utf-8?B?TDFMc2NNSFR0T2hhVDh6cy9Lb0JmRGJMci9mbXlhU3FPZjlvK2MybjVvbjlL?=
 =?utf-8?B?TnFQdzByaHkwUnp2WmhxemhPOXRoMDVXbWZLNlNDWWRrakovLzVob1d3bEh3?=
 =?utf-8?B?Z3NJZUlKL1ZtUHZ4aDFLSE5aUTY5U0Y2S0N1clN1UnRoTzNWMEFyUmxoNGhH?=
 =?utf-8?B?aUZPWTU5dk1XZ1RWMFZNTVd0dUxtNTdqVnZTTlVTZXJGaCtSbU9WMGU5NWVq?=
 =?utf-8?B?NTF1YlpkYUkxL2pRcWswNExOcEZnQTRjRXNFbkZHZ3JIRnQ1Sm85L29RQzdH?=
 =?utf-8?B?dVJEVzhMSnpJU0JqZmhObkFxWjZCMS9FRlF5Y0VlTDNmdHk1ZTNSSExML1U4?=
 =?utf-8?B?QVc2Ukg5RXpLMHpWYmdQRk1ISGg4V1BPa01GRXFaZEtPdVJrSk03QnlWQnhU?=
 =?utf-8?B?c2VWZkhJZEdYM0V0R1BEK3FDQlBqUlNEUStLSnFwQTFySmNtMDMrS0NaTnBp?=
 =?utf-8?B?RXhrVmxTNVFoVnBZZEQxVWpyWUpha1daSlpqeGpNQmFsdnhoVnZzS2k4N2l6?=
 =?utf-8?B?bHJrNjFuZk1od1JBK0xPQ05SdXR0THZ1MzVmM3dmWmtLY0NOQkNma05FckZU?=
 =?utf-8?B?SUJUcjVxdEhhdEthaURQcUVhQVRLaDRBcEs2b2ErZ0pNd0xMNzh6M2NBZHlK?=
 =?utf-8?B?cXUrZlVWRE55M2R4cHpyZmY5MjhOZ1J3RjgvRHRVL3hoVnZhRUZPdDBJdWdp?=
 =?utf-8?B?ZE1VVkgxc0JQR24rZXYvTTU5TmdmM2hSRmV5aGU4V3ZPV2RDM2sxa3grV2xq?=
 =?utf-8?B?Rk45ZVhuUStNbFU5WlRDUFJ3TFFUSkN5YkRmSjZBL20ySGgzVVlnWEtqYVpB?=
 =?utf-8?B?WmN1dHM1YVlMdkJPS0dXU3RIaW9aV1oyclVRNVhmOTEzRFZTd0FCam9VcjJX?=
 =?utf-8?B?Z1FBN0c0aGZiUlltTzg0aWFXKzRuRkhBb2s1bWxlZ3VjNFY0Y1F3QmZiMHIx?=
 =?utf-8?B?NFB3MkxnMVcwbk9vTDVIOUt3d0cvcTFRb1VoWHRKcVNjOCtJQldqcXMwZXFW?=
 =?utf-8?B?NGprRXdDMll3QzcreXplcVlSc09VR2FKZUNWMVhHWWlKdDlOTlFjalpVcmRu?=
 =?utf-8?B?OGlXQUs5bVYyMENDaEVYWXFWYk0reVBtbVBzdjB5VzBQemd5a3RDZkRzSkV6?=
 =?utf-8?B?aHFzNU5JYktjQ1BYeUtjU09UUXZGb21lRVhNNk0wa01FR2cySWJIZFM1ZE9L?=
 =?utf-8?B?OTYzM09FV2sxOVMvcG4yRjVQTzE1anNxdGw4bUlNajhVZDU0ODZUUjE4a1dO?=
 =?utf-8?B?QkNZQXh1R05KVEJxMi9EdWxhNG80TXRHQ3FaUThacXR4QmttK0ptQjJkRlV0?=
 =?utf-8?B?YzRtK2xpMm9jZGRWdlNsejByRXB6NU5XVnIybjlKK0xkTDFxQnczLy9ZMk1L?=
 =?utf-8?B?a2NLM3VjYzZpMG1uSWxTMnNHZFJaYkJkRVhoL3ViSTAvaEpyMXpGUkVRbk4y?=
 =?utf-8?B?QVpRUks2cjlrN0JZSzBoZWh1YVl4MmhKYk04TkcrY0pGdmxVMGdHYmhIOWY2?=
 =?utf-8?B?UnU4ZGwzQzVhSEtpeFdnQ2U3aWlvaW9IZExBMmJnRHZYWldmVTcraXNkVWow?=
 =?utf-8?B?VjlDaWlkaXZocFJJakdGTXNYTVRkWUFNOVVLby9MaFhrUWh0ekhBQlRTZzVH?=
 =?utf-8?B?cGIyRStEZk1oWmh3aExpVmN0RkNKM0VnSCs1Qk9EUDRpNmVteWFtbkZ3Uzg1?=
 =?utf-8?B?QWdlajgxdXA5d0krSzFpZ1lVVlZ1amRONFdDbVZreGh3eHZwTk5tU0M5djBn?=
 =?utf-8?B?bGd6b1Y0SStBbEYyWXM1R2taaUQ1OFFWS2xBRXpUVzB0Y2pkenk3VFVkeXZw?=
 =?utf-8?B?cFdyR1pwaVBHMUMxMjhmcDBXaS9OSDRjczltTHcySlpuRnFiZmZnZ1dNRWFT?=
 =?utf-8?B?Z1lmSjJwVE80RjFJdTJKQTJYVFVNS2hLMHlCTDVZQ2dDdi82dGxnVG0zYkNm?=
 =?utf-8?Q?xMMDoha4NREYKDPFyuO2VWdNS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da329a71-95a1-47c2-da79-08dcc825a1e2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:25:13.7745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uv48OPBuEBd/VYlDk+vqBr5D1f2FPusV8whqIY5J+52VPJ7QJTQJhw9gSZwKM/qCUSWOlAUgaaBrjyJg/lNp+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7877

Hi Jan,

On 29/08/2024 08:54, Jan Beulich wrote:
> On 22.08.2024 12:52, Ayan Kumar Halder wrote:
>>    I will update the commit message as below. Let me know if this makes
>> sense.
> Certainly better. One more question though:
>
>> ```
>> xen: make VMAP support in MMU system only
>>
>> Introduce CONFIG_HAS_VMAP which is selected by the architectures that
>> use MMU. vm_init() does not do anything if CONFIG_HAS_VMAP is not
>> enabled.
>>
>> HAS_VMAP is widely used in ALTERNATIVE feature to remap a range of
>> memory with new memory attributes. Since this is highly dependent on
>> virtual address translation, we choose to fold HAS_VMAP in MMU. And
>> ALTERNATIVE depends on HAS_VMAP.
> What is "fold HAS_VMAP in MMU"? I see no folding anywhere. My only guess
> is that this means to describe the "select HAS_VMAP" being added to MMU.
> But then why the word "fold"?

Sorry, I used the incorrect word. Rather I should say

"... we choose to make HAS_VMAP selected by MMU. And ALTERNATIVE depends 
..."

- Ayan


