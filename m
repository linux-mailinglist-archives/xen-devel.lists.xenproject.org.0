Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D75947A5D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 13:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772055.1182494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savvs-00023H-I9; Mon, 05 Aug 2024 11:31:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772055.1182494; Mon, 05 Aug 2024 11:31:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1savvs-00020g-Ej; Mon, 05 Aug 2024 11:31:20 +0000
Received: by outflank-mailman (input) for mailman id 772055;
 Mon, 05 Aug 2024 11:31:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3WU3=PE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1savvq-00020a-L1
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 11:31:18 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39f2387c-531e-11ef-bc03-fd08da9f4363;
 Mon, 05 Aug 2024 13:31:17 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DM4PR12MB6112.namprd12.prod.outlook.com (2603:10b6:8:aa::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.26; Mon, 5 Aug 2024 11:31:12 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7828.024; Mon, 5 Aug 2024
 11:31:12 +0000
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
X-Inumbo-ID: 39f2387c-531e-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N5tkki6hrPX0/lymnq8se9V5BXsrV6JtBDsF/lI8h1d9XZab79uvlUWEwDm8yqBw1XBN3Ua4KNsiaR7ZIZSfGB8bJ9OwJA2gXeu/gJEokc4AiaqP8+3hFzfa1nEDrfR9Dy4i0NQjgBauNeXjNJrzA8NxXjcTOM5xnPdvW0FhXa3+jIXXvYmhoSP2uj+Dr6rT1PYiqvFdXKUHLt/iu9vUJMfDgMctUAjPqmTc9rrEDntgrTpIwXozIKhTsUYlug9FPJDxf4QMbbzns9l57LERK8OMFsSMzzS+9Yh8N+BNNrItME+oYnul+Nh+e4NlXGISnLiIOFdQ7OA7ShszcN2QJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6B5PZ2cRTgSOdnor8+eA0UOSNdKeHF5CTrgg5bm8jbw=;
 b=cqoo8Conky28Z49f9lZVKHXKnJ9B5alctNq8jQIRgmRL3qM2CXzD25jl5enyw0oLRg3YAbcLzGJMTYiq0TC4cb7YkXlQ7/MTbkxLJR5hnstQBBg75h0ARR9QJyRdwLPdcyg6KrBdsc4ON6CJI/jdY8QnVEbs2QNPV6zXJU+liCBXW7Jp3rb4PX3J4fcapbX4QAgh+V90CLAn7E3zXNor+aJm+ADwe8MFXR2JKjlIJltTFkRoZYQPVEToyQ0CvzxO8CQnUChEu481yfa1qkQ8A590KEGYdUe8GNzc6o32cxKHCpTNYjKIFDq7Snff4UJq/iCBAgx3mrVoOKFCKH8JrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6B5PZ2cRTgSOdnor8+eA0UOSNdKeHF5CTrgg5bm8jbw=;
 b=jDwjfEhbw/foUB8OKf6wC/5LEv/h81LwLJch7/A5TstRCdJWVi2aP0ixXLxfaQeF7xkwYM+94uY+MopOLjCy6cYT5haqCv/t7UqQnrBKmh72Z/2frSziOp2uo2sxfT1tvjxeVjRWSYVOkFusqrZYeIHJvVo6170AYE4rOYKv+Bc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <1f151a72-711a-4e84-ba4b-182a3f26601a@amd.com>
Date: Mon, 5 Aug 2024 12:31:07 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] xen: arm: Move the functions of domain_page to MMU
 specific
Content-Language: en-GB
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
 <20240802121443.1531693-4-ayan.kumar.halder@amd.com>
 <de98dd2d-7516-4e7a-ae96-903479f5b179@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <de98dd2d-7516-4e7a-ae96-903479f5b179@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0234.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::23) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DM4PR12MB6112:EE_
X-MS-Office365-Filtering-Correlation-Id: 859829ad-d01f-42c5-4c9d-08dcb5421c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUVtSmplVFpubUJSM0JXYnVTRHlTL3pCZWVFUlo5ZXowWFF0cDBGZ0ptNXpU?=
 =?utf-8?B?RXJ3OGc2SmIwVDZLc0pZRXdBWk51RWhyWDNhb1hkNDYxaGRHWDVjMGhsdlZo?=
 =?utf-8?B?UWlZOTB5VExDZWFHc2JMQkYvK2h5QTUvcUptTVFwT3RhNTJQRXc1ZmZQTGJi?=
 =?utf-8?B?dnZHb2ZnS1AvbVNlQUl5dElHREgwM0FwbzJMaDRHSDMvRGlKU0pVVkN6WU1H?=
 =?utf-8?B?TnQ3RlBLWWhjc2QxVS9YOVpTbUdiZ1I0MlpDYlZobmhYWjVFamJOQ2NkWjBt?=
 =?utf-8?B?UlZhdDFMRWVKVm1yRFZaaGlkOW44ZjMvbW5CamtMV2VneUtmcEV6NFhTc20y?=
 =?utf-8?B?b3ZpSmQ0eEJ1WmpRZXRML21sK2ErUk5Sanhud0pWdUtscVcwaVdweUZIUmFn?=
 =?utf-8?B?NlZucFFLSnY4ckFONndRZWJnS1BjM0E4UFp4dDZSOG95SnpMWVF6SWpQSUhy?=
 =?utf-8?B?U3F6ZmMxQThOZm52b0h4M2QvUlczeW5oUHlKOG9tSWd0eFNreDNuMWppbzhm?=
 =?utf-8?B?ZEQ2RUVZbmFtSnNpYzVVN2FOb3hETkZGTHhhSHB3czFXSTFpRmtGRE5Leld6?=
 =?utf-8?B?TkJtL0ZIdTRVL2JqcUY3YzJXdjNRL1JockVMM1h5MWNseExHRVQ0cXZrU3RL?=
 =?utf-8?B?RUthcjVuVVd2RGNhZzZIN3I1NXU5ZkhiVmtXOHFZRmVKYjUzbGVvYlNQQ3FB?=
 =?utf-8?B?d1JiR09DOUhJS0drTXZsakloWDE5emFnUUtLZ0F3MDBmb1Foazh0WHZ2TXdv?=
 =?utf-8?B?V3dSVk1rTzJuUFJLTjhWK3VwWk10L3RUTTM0SnpKa0MyOENtS0FidHcwVW8z?=
 =?utf-8?B?WkJvdU1rQVVINHBzaUg3UEFNSDFZb3ROdUN2bzdTemRjSDQ4MGRyaTlva1ZS?=
 =?utf-8?B?THZGR0xNNzIrVEZrckMrbzRvdlZXRXp6aFlJdlpTYmpUUnJtQSszcmh6NDdV?=
 =?utf-8?B?blJnbWhJZWFmczhIWlpUclhyN2Y2dWJsS3BIWm9nY0lBa3QzcDBDcFRIOHlZ?=
 =?utf-8?B?cjZKb3RxZ3hpeWRaVjBqT2VBbnVGaU1XYTlmK20rMDVVV3V0eTFxMWhPaGNn?=
 =?utf-8?B?MkIzWjZ5alRWSVZhS2xzV1BTUVFjOFJudDE2TEJTaGNUSSsvdHoxVjVwYW5D?=
 =?utf-8?B?dHBCUmpib21LbHdYUDFBY2JYekZCWkNOSHBaYzdXZWVLODl4RlR3RVN4SE5r?=
 =?utf-8?B?YXZYb2lJZjdFaHpSbmNnck1WUmR6NFhQQkZqSlBTZ1o1UDEzblR1aUFMLzJQ?=
 =?utf-8?B?ZGlwZGFEdklUd20vYTM3eHJLWHNYZ0xXNG5uOHlpRkVtYnhBWDRnUCtVc1Ay?=
 =?utf-8?B?ajlQUnh5N3NvUUxKWnlWdU5vTi9hN1JKeTRBMHNBNkR1UWpUL1RzKzlrWHFm?=
 =?utf-8?B?bXJqMEdDcTVFVzBBaFNFTjVMSTBjbStwdXJMTWZFcjJ5MmVUM1FZUEJwRkNo?=
 =?utf-8?B?OGh3UENRRHNabEhIWEhwM09FRVZvY1M0T3dBK3ZlbmNtWVVUeW4ybnExK2pS?=
 =?utf-8?B?TUl2MkdQSXVrbGg5MHFUczhrdzFYVmk1eHUvYndTNGlPT0Q3SnJWL2hYUy9W?=
 =?utf-8?B?N1hBd05yUGo0UHkvb0t0SStxRUZhamZVc0hUdWNUMmpCTDIzbU1xTXVFb0Mx?=
 =?utf-8?B?TTFubm9Vcmxvem1tRWJ3MHB3OGkvQ0NiWDllbWpNdTdHVVNVUnRKYTVnMVcz?=
 =?utf-8?B?WVpzUENxUThXVCsydkN0QVhYMUlMR0JmKytmbmZpMndrQytnY1NJUEZoaVNN?=
 =?utf-8?B?R3d5WDY1MUNVMVo3WXZxSUIyWVNrZGw3OTRTQ1JhSWNFTk1ZTE8yMTFsREtL?=
 =?utf-8?B?U1Ywd2hZcFlLd3FhcDF6QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bHNNZ1NYMnNMSDdCNEorN2RmUTlscXFMM0VhZytRM3dkcGI0VG5tVUJwdFo4?=
 =?utf-8?B?UDR3T24rMEZBWlMxS3p2ejF5NmRiYjFFUXdxODJUekx6ZUZoNVA0ZnZXMWFh?=
 =?utf-8?B?eWowSVFERHpkLzNYWDRMYThacGovSWsyVm5uV2dZKzYzaVRVM0gwS1pOSVRS?=
 =?utf-8?B?U0VwcEY3eE1qR1NrTXRuUm5KbGRpakM1Wmh1YTIwUG1YVFdiRWlYVWxBZXpV?=
 =?utf-8?B?WEVxbytlT0ZPeXA1US9tcldpT2Nnd0VjWGgrc2Q4b0N4cnEvemJUcENBTDhD?=
 =?utf-8?B?ZnFNUGRHZjc2ZlUzQUVIc3NzLzczYmpHMUI4M21jWm9jbUx2RVFIcWZwUjI1?=
 =?utf-8?B?Zm51YSt1RDRCOEQ4c25tZnRsMERFK1lqWk4zcTNCTGFndzQxU2NlcGNjWFBt?=
 =?utf-8?B?MVZrQVFVUFg3ZmhBY2c4R1hLWG1EMFVrRFQyZTlxSlRMRVd3U3JUb2pRaEEw?=
 =?utf-8?B?RWtIMVRrdHlTUEFpVmNnTW5mby9pRThkaHo2MExVaHZJNUpwbmlYbjB3Y0s1?=
 =?utf-8?B?eTRNZ21Eby9adXdDRXUrYlVieHpSUUlBL1Q3dzlIdStBd2o4VWZWRTA3WXpI?=
 =?utf-8?B?c1FnL2dFbTFCWkl6WjZwamJwbEpUdXRkeGw0c1prSXRSMXNSMkFDRVYzVTVT?=
 =?utf-8?B?K1N3ZDZBNitkaEU2RjlYeXIxNVZ5Z0ZxVHVwa3FWRXE2NHBDM0t4ekVFL25D?=
 =?utf-8?B?SFNVWGlMMUxQV09ORHF4NUxZRnBJR2c2UnVubk9UaTRrVzFtb0ErV3oxUWtM?=
 =?utf-8?B?MDNnTDRRajZWb29hYVNWTGtJUFRFQnZBb1RON2ZzUEFwRUIxU0VUTGtRaEUy?=
 =?utf-8?B?dW1ZbFViOEw1SWh0WEpSQ29Qb3ZkRTFwU085N045cHZXcjgzcUVYbmNjc2RR?=
 =?utf-8?B?MUErWXdmeFo5ZUtrQmFoeVhOUkcxQ0tJenYvUWdCQm1YMFU2UGc3VDUrQ25K?=
 =?utf-8?B?WUsrbFpvdExTdzhZUFcxTitselRVQTJwYkR4dFA5M3c5VXhsSStublFROTk3?=
 =?utf-8?B?aUlwMlpxMlJtRzBlY25oS0d6ZEdMNFJOREpBK3JmOEZ4MHZWSEhMTENmNEZ2?=
 =?utf-8?B?alpkYXdQU2hNRUZTR1BHNkpzSi9HUExINEhNMUpjcTZlQUJSUDhWN3FjblFO?=
 =?utf-8?B?MkZtN0ZNaWRTZjF4VUVzbDFEVno2SktSVU05Q2xlVFhnSEE3OWI1dytLUW9x?=
 =?utf-8?B?YXhsc0FiNE85b0tCcTFyZ0srNWJtemVreGxlV3NXOGpkQSs0cFZtc0EyTUJG?=
 =?utf-8?B?OGtDQVFaVDFTMjBUWHpPL3lyVmszVVRZV0pTckQxd203R2xubGJNRkRKM1Z2?=
 =?utf-8?B?S2pFMGQzZW05VTUxK1dRVkYxR0ZNb1diaVBOVi9QeXF4eVJOaGY1ZkZWNVpY?=
 =?utf-8?B?T3JGbEVEcnBmT0RMYnRPdXVZYzNadjZ5c28xK0tHVWgvNWFsNVYyd1R3MjAy?=
 =?utf-8?B?dDdUOEhhcW02UnQ1WVNoeVR6K3pPWlRIaUxpUVp1RFI5SmJQUk5lTEI4RUxt?=
 =?utf-8?B?TEVrMHBmYmI2cHBoemVHZExyZ2hRb0NjaWtva1FiMkhWeWI3TVBuU3pGZFdZ?=
 =?utf-8?B?cGQyUmlaNGNNdVB3K2xDWWtLYnIycTNFZHJxdmc3MGFXbnhKMmM0UHFxVE1x?=
 =?utf-8?B?NG1oYnhEWnM5T3E0Qm9ZZlFndG5aR2tENkJrUlllQjFMME5jdm93VVhIdS9G?=
 =?utf-8?B?bTc4Y0xlN2xNWVdrK3VhVmdQRW5FVVVvTml5UXpONExEdXB1eVM4WU9CQUhF?=
 =?utf-8?B?ZFpGZWJ0MEIxMXpaU0FqaEYzeXUwZkxaQkpiR2ZxVUtBemprelB0NytYaThK?=
 =?utf-8?B?ZnJwNjFrbjIvKzdxZG1lK2tvckZidEdvV3VMcWtXWHZCenhmYldtalFWTEJ6?=
 =?utf-8?B?cC92amo0RFJXRm43NTFuU0pzVzZrbzdyZGg0Ly9MQ2tJTmhRcVZrOHp0Qmdl?=
 =?utf-8?B?SXF2Ym5xY3VDanBreEtaMHQ4QzY3dkM5aW5pOGZPQjVDekFDQ3ZRdjBhaHUr?=
 =?utf-8?B?Y3YvemxrU2xraWw4Ny90Y1BUWkFFMkhGSnMyVEVQRWdxL1d2ODBXakF3VWti?=
 =?utf-8?B?OGlza3dOYnlMQ0Z5OCs1NjNMNnB0czJldnZBeng0Z0RRWmc2cklHSGVFSkl4?=
 =?utf-8?Q?ZYYm6CTeD59zkhwZ5Ctrf8UUK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 859829ad-d01f-42c5-4c9d-08dcb5421c39
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 11:31:12.6854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GFGf+NNRZ09L18TmwKjs0C3v8lTG5WcGFsCxQe6LCrrn5ismAmM/mkf5uJvTpQcCcZDbpGQivv87SYB8ybFmuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6112


On 02/08/2024 14:33, Julien Grall wrote:
> Hi,
Hi Julien,
>
> On 02/08/2024 13:14, Ayan Kumar Halder wrote:
>> Moved init_domheap_mappings(), map_domain_page_global(),
>> unmap_domain_page_global(), map_domain_page(), unmap_domain_page(),
>> domain_page_map_to_mfn() to MMU specific folder.
>>
>> On the top level, we have added stubs which will invoke the
>> MMU specific equivalent of these functions.
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>   xen/arch/arm/domain_page.c          | 161 +----------------------
>
> Looking at what's left in domain_page.c, we seem to have just a series 
> of stubs:
>
> bool init_domheap_mappings(unsigned int cpu)
> {
>     return init_domheap_mappings_mm(cpu);
> }
>
> void *map_domain_page_global(mfn_t mfn)
> {
>     return map_domain_page_global_mm(mfn);
> }
>
> void unmap_domain_page_global(const void *ptr)
> {
>     return unmap_domain_page_global_mm(ptr);
> }
>
> /* Map a page of domheap memory */
> void *map_domain_page(mfn_t mfn)
> {
>     return map_domain_page_mm(mfn);
> }
>
> /* Release a mapping taken with map_domain_page() */
> void unmap_domain_page(const void *ptr)
> {
>     return unmap_domain_page_mm(ptr);
> }
>
> mfn_t domain_page_map_to_mfn(const void *ptr)
> {
>     return domain_page_map_to_mfn_mm(ptr);
> }
>
> The indirection seems unnecessary to me. What about renaming 
> arch/arm/domain_page.c to arch/arm/mmu/domain_page.c? Then, for the 
> MMU you can implement unmap_domain_page() & co rather than suffixed 
> _mm ones.

Makes sense. I will do this way.

- Ayan

>
> Cheers,
>

