Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC69B0EAB1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 08:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053270.1422013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueT3R-0002xk-6S; Wed, 23 Jul 2025 06:34:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053270.1422013; Wed, 23 Jul 2025 06:34:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueT3R-0002w6-24; Wed, 23 Jul 2025 06:34:17 +0000
Received: by outflank-mailman (input) for mailman id 1053270;
 Wed, 23 Jul 2025 06:34:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9doN=2E=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ueT3O-0002vA-Oq
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 06:34:14 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2417::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b9a7b18-678f-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 08:34:13 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by SJ0PR12MB6941.namprd12.prod.outlook.com (2603:10b6:a03:448::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 23 Jul
 2025 06:34:08 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%6]) with mapi id 15.20.8922.028; Wed, 23 Jul 2025
 06:34:02 +0000
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
X-Inumbo-ID: 0b9a7b18-678f-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCDBVI5ciFYcd/RFPZNNKrY+Fa+epQ9Z1dglCsXWJK8eLnI7usWlp7AVpHxhlbIxmJ7j8PB9vnRJzbTIvfLeo6s7vCtUxOyI5PXZOASwQDfzHCRgUu6GMGVTZK2tbEmKBGrlAD1fMn8eJSJe/Xz6r/dWY1LGI002tYtgyy1i6f4fYlIqWJi94D7esVaHTQYCRx2pbHSnhoUDW8nSrOloHprfGTNImXNB9GP3ObV67z0DU84J4uLU3OZViiiuoqNnWQxBDFQdWXlqhCnfYa5Rj8n9KRUfAxRl9KzSzDj6M+QhVw2ahINpR8XtOOW1V0IqfRyXcUIYkzLyI5sWa3bU2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OhicKrzQgET9gN/R8TtOW6GJKJPWejtMzYorzdFeOXA=;
 b=XI+hlCYgMNkCSVtMYP8qFxeiaYnRuXURfEQ0rgnQ/z9YhpS7mLHwhiagCo/i9nkBFD5Jq6kxm8BMFAw9YWJL7PgV1Joysc8CUko56T53H+TQ+h+o9x8rsHjb1w+chn4XIsmnOZWL4x+hklIzU2zOtx7J9P7eLqu7UAhzgStQ+w0yCZsZs8aw91YztnyDmLRTAOSyW0ocHXxdIre6w44VWJ7PNdp7McDG+l48RCNWMTiPKH2WX2BybQchf1BQZDYLlTnCmtJQOGKXkAUQTs6CuZ5JQ/GY0Hqo3AyigjMtRWb6HQFQOIShgSjGsVW24R8t6+YNiqSWbexHOGN41MZg2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OhicKrzQgET9gN/R8TtOW6GJKJPWejtMzYorzdFeOXA=;
 b=KcpnAipLm/WdSAbx/CL41VcU4EvtLpqFWVkBDVKEJYaEhmn53uBffHbhzNqh3+igX9/bhNK/4385CuK+Dq/nN2LcQW3ECPXTNrI7vXrGhN15nMwLSNUPijlrFoixQp7zfszTF29Go1wEwcpvIh3Jq7WTwxFr9buei5CJYR6VPa8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <0aac46ee-fd2f-43b4-accd-6eae133c618e@amd.com>
Date: Wed, 23 Jul 2025 08:33:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree/kernel: Use memcpy in output_length()
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250722074645.19029-1-michal.orzel@amd.com>
 <1d5c10bc-eb69-492c-9f1a-6a273feecdcd@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1d5c10bc-eb69-492c-9f1a-6a273feecdcd@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0366.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::13) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|SJ0PR12MB6941:EE_
X-MS-Office365-Filtering-Correlation-Id: 46d25309-e3d2-4dc9-76b6-08ddc9b2e9ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bWZhU1RkeVhZTmdaYzJ2cjNGM2xZMFd0ZmY4WDNkTHhmb3hsbnp5Mys2bE5k?=
 =?utf-8?B?V3EwQ3Q4dmZnMitmRnphbmtxNWY4dnZhK0ViMyt1ZjJqS245WU1QRmwxRndj?=
 =?utf-8?B?RlVNR2VKQURJNVQzTFI2WGFYNmZEamhoVlNmQWRsWkpWcEV3YmRaRDBOQ0dx?=
 =?utf-8?B?MTd1MzdWVnhram9MVDNiZ3lYbmpBV0J1Z2txUk91OVFsY0tveDBybG9wdits?=
 =?utf-8?B?MkVhZ3g4cXVEWlFjQW1iUEZSQXI2R0V6eGtlOFM2aThyZlhLR3BlejJiWVpu?=
 =?utf-8?B?QjJxQ1kvUFdYc2txYzloUEE0NnZxT1FmWkFoT3lzUFBsbUswM1pjYi9Ec1hG?=
 =?utf-8?B?QkZqTFRCOGV1Y1JJaHh4eDdrWGRQVGNNRTNGSlhQbEZYZTZZVnNwUXNlWnc5?=
 =?utf-8?B?ZXdOb1BSamNlOUZOVmZoWGNHUThqTS91SEk0VlVoT0IwM2RiTWFmOU83d3gv?=
 =?utf-8?B?WVlwSmtsek9xNzIybklqU3ZOTm5HVitISGtKUWhndVF4bks5Wnk5RVJaamx0?=
 =?utf-8?B?Lzlpb0ZBMzZNTjREMjBoMlJVdjRXSXlxalBrSEhETzJtOWdaN3JxSjhJZkpk?=
 =?utf-8?B?SERHaGNjRjBNZ1pNVVkxY2tZL09GK2FVd205SktibmMxY212QlZ0aUQrb2Ez?=
 =?utf-8?B?TVRqWDZhSEZES1hhbnQ4U1orRFRFUzd4MUlDQktsaUhrY2trYnNyUWNvbzA5?=
 =?utf-8?B?WVdQQUE2QnQ3aGhWUnJiemN5VGhXL3JyLzF5OE9WTkt4L1ZDanc3VUhGTXU1?=
 =?utf-8?B?Ly9USXp2cWcyYnZrVDduTStvMGsxenFkNWc4WElaUElPeXNodWIyTTBjNkNm?=
 =?utf-8?B?Yjd1ZHFNQnJJb1pnTGowSjIrSXlIS2o2VVpQakNVaVpKYjRzaXNIcnBCc3RW?=
 =?utf-8?B?LzVJRmZZQ0FxT3NaN1lGYUxVczRxaU1NaDZwSHp6WktBTTd1WXZsWWNuS3Z3?=
 =?utf-8?B?V1d6akdPRWZqN0YwVVRGUXhwd251dmVwQjdzTkdBREN0UTVWLzMzeGdzbnZT?=
 =?utf-8?B?TmI3ZC9WdjBhVnMvRnUzRXIrYmRZNks4MXhzYTI4RTdVc3NWOFlXRFMrTGhC?=
 =?utf-8?B?NjJjQmluZFgySGZ2ZG40RVk3WmlROVBCbGNKWTIzc0NKdkFaYzNZZ1dpVVpH?=
 =?utf-8?B?NWRTbnd1dmo2TEpSVGJOSVlGZUhabnUraE5RaHhvZ1g4cWRNa2V5MXBUenh6?=
 =?utf-8?B?U3lPWnVueE0vOHlRVk5LRjNjbnVqb05TZXpHTTY3VnQvUGhDMGxzVGR2d1ZU?=
 =?utf-8?B?QW5SY0N6YWhaa05GZzAwVXdFVHd2NG54TldRMzdoVm91NDA5WlNTV1lQdFJJ?=
 =?utf-8?B?Ym8yTmdvWHQyMzlwWEhlbythc1BFTHc2ZlpScGxFTXB4bHkyVkF4WU9heGR1?=
 =?utf-8?B?cThrUkszU3p0UEZMYjZNVnFOMnBocXpiZmo1L3pCQVJndXNIK1I1Zmgwcjd2?=
 =?utf-8?B?Y0hJbUtMZHdzQS9uU1hBVFl3ajBmVDUvdkhRQnYwZ0pZd1dFSUVZVktkeFVY?=
 =?utf-8?B?V1V3NnBBenZOVEd0bnhrS1BNWUN2ZDNSWUxvemxYTk44K0FzcFNsdzRwYUtz?=
 =?utf-8?B?aVI4MmpGODU0UndRZmQrNVpmZHA5aGt1Zm1zaTZEcitwYWpmV3hMclhIWDBW?=
 =?utf-8?B?ZlNrc0lhUXhGMTRMNnFrdENubmJCN1U4S1YyMDR6bG5rS0dncDdtRUhibkVq?=
 =?utf-8?B?OTVsU1dWSTYrWXUzazR2VmZmYWl0Mkhvamd1WUFxZzlRUW1SRzNFcDIzMG5M?=
 =?utf-8?B?TVJsNWlrWVRWMFBuVFlKek1ic3BKdDdsZCtqcXBWdkkxMWxaNmNYWTFUWVRI?=
 =?utf-8?B?czJuT2ZSamFuekg2dUtXWnUveW5YdkZTdkIvQjhGYVl4OXdBVlE3Z29adTEr?=
 =?utf-8?B?ZzBIZDR2S3oyMFZFSHRJSnUxVmxzNnI1UXUzRVdXd0ZubnFGb2daeGl6S1NY?=
 =?utf-8?Q?xY1Dhu33F0U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVlvRHYzTGdHWFJBRm96bTgrUGFtUWFWcjFFRFdKRGdBMU0zV1BkdmNMcW1h?=
 =?utf-8?B?U0ZwU2MreFdHZlZYZG9tT25xQTB3b3NIcGZGbFBLYklVRnBhVk9Oa0UvUjB1?=
 =?utf-8?B?R1Y1RU1rZkRZdDVSVlR3c2tMeWdiNUxJUGJOdjhHRFJ6RlRIWDdLQ3NEN1Iy?=
 =?utf-8?B?a0t1TllwZEJiUjUrcjQwaERraXI0VzV4K2YxWFVwc0R0L0NwK2F5YWlwazgx?=
 =?utf-8?B?TE5vSGFLNk1ZcEhaYWNqakJmTGIvV3Z0NFRkZXVhZkJzYlJBYW10Yk94aUIw?=
 =?utf-8?B?WjdwUS85SHh6WXYzMkR4TExIV2lTQmd1NXVwMkpWcVB4cmREakpsTzRtcXZ3?=
 =?utf-8?B?UzI3Ukg0WlJIc1VPbHpjekZ6VWh0MjRhQUk3VUNpdDVuZlhxRGRaRjVmOGta?=
 =?utf-8?B?MGp3Rk5icTljWVArMHVybXMvZ01ocGJvZFNSWkVlMW1YOFgreEd1OFA2aWxw?=
 =?utf-8?B?QkNpZHZHSTBxNlVmSjVYUFhHc0NONjI0dmwyU252aVRPMm9SdFlFVjNsVi95?=
 =?utf-8?B?UDRGVkNqS3NFMld1dUtZbGRXeGlpU1pYZGNKdmJWMEdrOHVIRi94V1hBNjds?=
 =?utf-8?B?V3NDV1ZQbFVYd20yYmhLNS9EK2RDdElUa0RKOW9RbDFOaE85QmR1RUVnTTRZ?=
 =?utf-8?B?ejdhZ0tGVmJ4NmJpWEY3azMvdVhrSGdqa2NxNldDTEsyZm9oTjNUN3lEMXI4?=
 =?utf-8?B?dFpqQlJmMml3TzMrQm9XaHlYUTNqYUl2NWNGVUJSWUJxMTV0TDVUcWNLQUpR?=
 =?utf-8?B?a052UHIwTnlDOEpDWkZvV0dYaUtxaXdiL1dLVVJJR3MranRLeG8yQ28wdUpa?=
 =?utf-8?B?d1hyN0ZqZy9LWk5CVlp4YUJNZzkrS05OaGprYnRTNzZURFhzbGxLYlFNL205?=
 =?utf-8?B?em5CZnJTYVNwRkhVTSs2SGFTTnZiV2c4RVVtK0NJWW9ZUytGcS81UkhPMGsv?=
 =?utf-8?B?Qkhnd0FBSVlQUG1McDJuVmgxTEIwWG52SitzeGQvN0NsV1pQNmJoZ1lybzJX?=
 =?utf-8?B?c2t1c2NVcEduR29YcmJwU3ZzYm9LTXo0RHhVS1RPNGk5bUN1bnNVQ3E0Undj?=
 =?utf-8?B?WUpRVS9hR2pvb3hML2RxVExQeXdrZEVBVnJyTDlTZ2trZkVaVzJ6bTFpYzBi?=
 =?utf-8?B?V2EvV3J3S0lYQlg2bk5TdENQUERtdmNLMlh0V3ZNdGRrWWs0Um05dW56RzJp?=
 =?utf-8?B?Y1lza0RxNDB0ZUpDUCt2L3JaZVNHLzNnMXlVZlRTWEpudGdtKzNCdXJmeXIy?=
 =?utf-8?B?aVFQeHhXVjYzV1dITlB0c0lvSENMQUJqT3kzaDA4U0ZDYjdBSHFLYXlBVjJs?=
 =?utf-8?B?L0MxNFR3K2ZqaUNOU2ZmTEdwMTRkRWt3NG41dWt2ajZWVDhQYitITFV3Nk1W?=
 =?utf-8?B?cjRjMCtGSGhFZlphMDM5RVNIUVBNcTdjOU56dXZPbWZFYVhpK1NvQmxQRVVZ?=
 =?utf-8?B?Z21DbDlpV0NzOExpdFV2UWhJd1hDVk5DOTl2UVUwRTlkNGNWeXZjb0dlcWJk?=
 =?utf-8?B?ek50dWlFYmJVK0J5WGM1cEc0VGhPdlkwQ2YwV2wxNWFwTG1WMFJrUlZXNkg1?=
 =?utf-8?B?NktEb0hoTGJsL2QxdnVaeUNTWHQyZVhjUGFrYmh1ajJXdndGVWllQUE0Ny9t?=
 =?utf-8?B?d2hDU2RvU1R5NUlJSmR6YWl2aE92MkJXNEMzZ3k3c3JNaWVvZWF6dkN4b1JH?=
 =?utf-8?B?bFdaOTV2ajlhTXpSWWN5K1VpTlZQRlVPK29YME9tdVlmU3lmbkYvaytZM3Qv?=
 =?utf-8?B?USt6VFNQTUJzaGZQSm1xZzRhUGlnNVhGQ29VTWpEbVQ2NWFYS0FLVGpxK2hN?=
 =?utf-8?B?ZFlpaUxRWktWSnFrOUZQUnpUaFJFOWxNUlNDbGdSWmQ2dytoVXAxQzgvVENn?=
 =?utf-8?B?SXlPZkxQbHFGam5obG5jOVpGL3lEQjk5b3lrYlZDL0cxTjdLU0VHR20wbWwy?=
 =?utf-8?B?cTFPYjE4eUQ0bVliVkloRS9WZ21lRGRzWDVjclVDR0FRM2Q2cEp4bmtXdGhh?=
 =?utf-8?B?VWE2VHJpUGxnZzdUVVIvRThkdUtOaFlhTEU1NU5veVVjU2srcXNSbzdyY0xi?=
 =?utf-8?B?bGFGaG8vMzM4VFo4RDZkSW9IdFJJOFZ4cFlWSmY3VTAvMitiOXAxSytBQmVu?=
 =?utf-8?Q?kCqM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d25309-e3d2-4dc9-76b6-08ddc9b2e9ed
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:34:02.6800
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fH/gY4LkihtxRwqkNfyNAXJfDI+c5eH4NEtYTnAYtv9EHVnrKtYJNpjCi5wV/q3y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6941



On 22/07/2025 06:50, Jason Andryuk wrote:
> On 2025-07-22 03:46, Michal Orzel wrote:
>> Trying to boot a compressed kernel with UBSAN enabled, results in the
>> following warning:
>> (XEN) UBSAN: Undefined behaviour in common/device-tree/kernel.c:21:12
>> (XEN) load of misaligned address 00000a0040f89867 for type 'uint32_t'
>> (XEN) which requires 4 byte alignment
>> ...
>> (XEN)    [<00000a0000529964>] kernel_decompress+0x2bc/0x5bc
>> (XEN)    [<00000a000052a354>] kernel_probe+0x6f0/0x734
>> (XEN)    [<00000a0000528714>] dom0less-build.c#construct_domU+0x188/0x9d8
>>
>> If &image[image_len - 4] is not aligned to 4B boundary it causes
>> unaligned access which is undefined behavior on Arm. Use memcpy instead
>> to be safe.
>>
>> Fixes: c1be0b102e0e ("xen/arm: support gzip compressed kernels")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/common/device-tree/kernel.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
>> index ef393182b691..28096121a52d 100644
>> --- a/xen/common/device-tree/kernel.c
>> +++ b/xen/common/device-tree/kernel.c
>> @@ -18,7 +18,11 @@
>>   
>>   static uint32_t __init output_length(char *image, unsigned long image_len)
>>   {
>> -    return *(uint32_t *)&image[image_len - 4];
> 
> Maybe just:
>      return get_unaligned_le32(&image[image_len - 4]);
> 
> You'll also need:
> #include <xen/unaligned.h>
> 
> The gzip size is little endian, 
I thought about this solution but decided to use memcpy because one day we may
want to support other compression algorithms and forcing LE could cause issues.

I'm ok either way. Let other maintainers decide.

~Michal


