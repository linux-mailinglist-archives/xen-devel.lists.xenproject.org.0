Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5C1A78A93
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 11:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935291.1336714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzu1C-0002hI-0Z; Wed, 02 Apr 2025 09:04:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935291.1336714; Wed, 02 Apr 2025 09:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzu1B-0002ea-Ts; Wed, 02 Apr 2025 09:04:17 +0000
Received: by outflank-mailman (input) for mailman id 935291;
 Wed, 02 Apr 2025 09:04:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=trQc=WU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tzu1A-0002eU-KX
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 09:04:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2415::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73252db3-0fa1-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 11:04:14 +0200 (CEST)
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by CH3PR12MB9022.namprd12.prod.outlook.com (2603:10b6:610:171::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.50; Wed, 2 Apr
 2025 09:04:11 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::cf66:58ab:47be:4b13%5]) with mapi id 15.20.8534.045; Wed, 2 Apr 2025
 09:04:09 +0000
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
X-Inumbo-ID: 73252db3-0fa1-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g6xovmobdBHQk4jXqJAtLvyjy4ifafUMFa7rQsdY8Nk2mBBRt+qmCGLH01OJNkbraViURAOpJeez7z3e8KHJJADCPh39DzUnceHNMMCwmyD00JBlFQEU7Gsf4byaixXOUc7BEzPqAS3bwf9dEZzE1Wgub3uof3ijP+GuHpjxeCLd2CBr7IjmvxluDvyXikNbrjds+XdmkanSYfOQDl37YkHJQEfcjUvEKcqsiPVBnjx9RtBFRsei0tyKxBLUnDmPscdlSg0ZTxvmsGJ5WsbARbZzjd8PgNVlef7jHvO/h+gykicHRYP234KvXfqdNRJfXeGg9ORkTzO6GC0RIUWl2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49pBpG9I4LV0Rpvb7Ee9EEPkhH/chRtrEzqAzYy69Pw=;
 b=xTD82uhRh3d9kkKg1kaIL+caWCyPjU453QMLRgCEuGzeWuiQNJMEqp/laSF8Py1TFRpNxFvQriIp3IsmqXVCW0JWkAi9fqKSmNBbQJPyS0BrGApYTDBGj96wkbIOEB98biQHJokXhPShWxCwYNJDjtEIZKunvSuEdTo5OOjIXZe3d60p3tAcHiAxOHd8Goj4SLfhNgIl0Y30Nzyw88nsw9lEz95j+elYJH3SO55TMBMHtM5qXj8WiKp7dbsCYpTD/kN8OJ1TPHELmHBUhEIxvv5a+9Ejffpi3yw5lxum2Que1gAZclxoHu9F4Syx3DkHm+V8vx9GPKs38eACQ3agDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49pBpG9I4LV0Rpvb7Ee9EEPkhH/chRtrEzqAzYy69Pw=;
 b=BhK6GvXaY/C2bWF/7YA6kL6LrNRmvQG+JmMPtQvooRMd/Zw7gQGj6iFWd6X3QAMvDSKeuD9MgGAdb8hBVLPIorox/vnRRPuJ9x3OCh9qzYo+ae6EcYZIm9RQc1AIUMFy1qwtH4XZDd7nAI2wNZnQuy1ZLClUwSAX7voW38X5UBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3961e7d2-4f34-4297-8166-6a8a220e12c5@amd.com>
Date: Wed, 2 Apr 2025 11:04:05 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: add kconfig for event_fifo
To: Stefano Stabellini <stefano.stabellini@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, jbeulich@suse.com,
 roger.pau@citrix.com, julien@xen.org, bertrand.marquis@arm.com
References: <20250327232225.1114007-1-stefano.stabellini@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20250327232225.1114007-1-stefano.stabellini@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0104.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::20) To BN9PR12MB5273.namprd12.prod.outlook.com
 (2603:10b6:408:11e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5273:EE_|CH3PR12MB9022:EE_
X-MS-Office365-Filtering-Correlation-Id: afdd0152-25ce-4972-5968-08dd71c55408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Zlp3N0kwcjNzM1hhRXdWMXVIRDhCaXIzcHV4ZG1PZUhNN1p1dXU4VndUL0c5?=
 =?utf-8?B?Qm05Yy9KU3ArTFgrWFMvd3RuNitmeklTOU9rKy9PM0dBNitnS0puSXZKb0Ux?=
 =?utf-8?B?YzBMK2tYRXBkR1pZVDdNR1hsOWdNQzlSeUl2NEFmeDJ5T3NXZnU5dDI0Z1FD?=
 =?utf-8?B?YmthNTdvQ0szMUtqb2xjVDR4Vm5WNDZiSmFDbEtzN1hSZDdmekdlTWhjNkls?=
 =?utf-8?B?aU5jUHMybXZ6aVZkTG90TURvT0p6SmxvYUF5cXhlN2daTm45ZzlXdDIvQkkz?=
 =?utf-8?B?eXNXcVVWS1NVVWRDSmNTaTJVRTJ0bFlXclhBNVJYcTRiN203Y3NZZFd3RDR1?=
 =?utf-8?B?TGlSczd1OTdnbTdTOWdKLzZiOW5kRXhPdHkweUg2MzAxaWlraVgyU3V3VjJU?=
 =?utf-8?B?V2wzUWNFZ2pwZit2QmVsU25pd1luc2xwcnRBRDRMbjNDMDRsZTJ0OG51WFU1?=
 =?utf-8?B?Vko2S1pYUUwxMHJHeHBWTGRXMCtBY2JDeDlCQ0ppSFhyMFJPWkdMcjB1NXlS?=
 =?utf-8?B?VDYwejhnTGVXSDI5QVZpbGlRSU92b1BPeHREUXMzWkxNcUJhKzI2V0thTndj?=
 =?utf-8?B?aTVIK0NjdS9tUXRJdmRTWUxmcGJGSmpWQ2dlUFpleTlSV1IrYjZnZzZaTm9k?=
 =?utf-8?B?bzY3TExyNDBMTmpHNm8wckgxY0ZjUGtOaVhZQmRvcjFsWWppcmh6VGtieWpv?=
 =?utf-8?B?Q3pnNWhzeEEwazE3aXZMeWd1RCtQM1pDc1pyTWt6U2twbjZhVnZCQ2tHalBn?=
 =?utf-8?B?V0hDTnpqeTdxczhNRVIrYnJqSzUxdTVyRDNGZXY3L1hQbXRtTll3YjNhU1BD?=
 =?utf-8?B?NHhBRnQ3c1ptN2RJdHhDMGFQcE9kUU5zODZvd1ZmNjVaNDF1TExJNVAwVGl4?=
 =?utf-8?B?Nnl5K09DcUdHS0UxencwUFdQYjJjQ3AwbExKeXl2TUxOcVEwUDlvQzdGNGtM?=
 =?utf-8?B?eDlPUVUrU2NsZEFWZk83RmZmS25BTHVETlMxVGVyOEFlK3dhT0w2TFRTTlBv?=
 =?utf-8?B?NHpaVG0wTWROM2dCYWlNOXBPUVJUV2NONHRUWnVZSHptcW1QbGdmSytkLy9v?=
 =?utf-8?B?b3BZbmpidXJ2NkQ1WEY1UFpINm9HZlJ3a2h6TFVyVEFsRG5QUU9CblVHY0tw?=
 =?utf-8?B?RXU2NWJCTGxWbTdXTEZZR1kwTGxGZ3k5Q0ZKUjZwbE5YOWFZdzFxbEhzeUlj?=
 =?utf-8?B?UTJ5alNJSWcxd1gyOWZPSUI2elM4V3FwM3FGK3Awc3BuMkJ3Z0NoQ0NjZTlk?=
 =?utf-8?B?TmxReThHZUEyNXVtaW16elMveXF6VUg3L0xmdEZVTWJEVUhZWnN1cGUvNnFz?=
 =?utf-8?B?ZGR2STRBTVk1U3RCa1RURzBOT2YreXZxZHluTDBsU3dhckRqQ2tuRFFUcHI4?=
 =?utf-8?B?Z2d2ck9tL0o5U0V1SXhQUklRSmxoRTNxc1RnVkFVaHVxbG8wUms4aktRL01X?=
 =?utf-8?B?V01xenhXN1pZSWVpMlNlNGM0YVFPQzYvN0t4OVhGZUE5MFF2dS9tVGxjVGdM?=
 =?utf-8?B?UnpzVzJvV0Yrb0N6TnRQVG9YaGFod1ErUXBPMTlSY203NjUxcnZOTUxYbUY4?=
 =?utf-8?B?TzVrOUZ0TmdoeHZleFhLU2tzZjVJSkJVU1ZlM20ybmo2VzR0bFA0d0t0MXBq?=
 =?utf-8?B?alRrKzAwalZEd1czZnhOanFXRW5ZcEsxSDliV2c0c1ovR1lva0lpRkRPSFBW?=
 =?utf-8?B?Zm9LWWhMbjV3bHBzRWZ0VWtTRmdIajFZVHhQNnN5OVU0cFZIR0djM0U0UVFW?=
 =?utf-8?B?ZGVzdlNEZi9ZQ2VUUTBFTHdjK1phTmZPa1duRHVZYVRwMmI5d1JObDdRcU0y?=
 =?utf-8?B?MFpHOVdERkJxdnhmRjhJeDY4ZWk5SVFORWh0QnZ1R25rdmVKMWF4TjZlZk04?=
 =?utf-8?Q?gdaH+41MxZvbs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm9YWUJMZENhbExnYnMyWHFCV3FQdnFVa2gxcmU4cFpxeVdHVkVjVzVaZGtM?=
 =?utf-8?B?ZzdDcEdYMW5Fa2k0U0hSemFMa052Umh3eDRyQ09UM08vTW5Sc3RwSzlPODJJ?=
 =?utf-8?B?Z3lKNVRRSFNEQ3JUcHhSbEUrSlhCQVZwZW9acDBwWjBUSUJCSDNra3R2Z1Jp?=
 =?utf-8?B?Tnp1NDlCaS9LV0lVeDZtenJYRDZza0Q4U254V2pSYVZWdG1Ga3JmUjJVQWhE?=
 =?utf-8?B?RGw0d2luTklVSzdKa0d3SVVQK2F2Q24rRHo0aUlhUjM4VUhMZE5DVTVyZzZY?=
 =?utf-8?B?MllyRU1EclJMck51dTIrYUo2aDcwejM0VENXWVRJYXoySmRKNDJYSDRKTUZK?=
 =?utf-8?B?azFDQWRNbWNwR2ExWnU0aUlTekpoV2J4SVptUUkxS251cGNWaXFQNXhnVnVN?=
 =?utf-8?B?SlQyQyt4N1dPRW1QWEZxNzQ0UElTci96clZyZ2JrV0hVREN6NDhBSUN6SHVG?=
 =?utf-8?B?RmpqNzViL0NzNWEzMFIwNXlxckpXMWVwdlNuRkx4SENTY1l2dCtuRCtVTjNh?=
 =?utf-8?B?OWtrejFrN09GWDJNOUhjRFdYTGdHM0kvdTc2TmN1RVNPSWU1b1AvR01sYmUw?=
 =?utf-8?B?eXBnS1d4OFJLTCtzMldTZWhINDV4UmlERHJoeFl5dmt6d0hmV0VQdzFxKzV4?=
 =?utf-8?B?a29yOEI4cUpzd0VnRFNHRDZXbVd3dUI5NWJHMDdxcUo3T3hUd1N5Q3BXOUFk?=
 =?utf-8?B?NUFhczV5ekQ0cDd0YjBhcnB5QTVtS3V5MXd2bHVYTE12M3ZDK3pkNG16ZitE?=
 =?utf-8?B?WlRkcitDdlBXTjArcW1JeUlZVjJXVWJTd2E2enFtTGZ6U1VJdDltaDFlemho?=
 =?utf-8?B?UFlTM3BOZ1dKcEVCSXIwRjYzWWRZUmUraGtEUVVZT2dDdWZ6UTBRRFRCYXNY?=
 =?utf-8?B?SEkydU94K3VycURWenpYbmJldklOckZvL2xDZ3E4VG1GNzlxT1FKMEduRFhx?=
 =?utf-8?B?UHJMeHlmVXY3NHowbzduSVViYTJXcWRXYnkweEQ5aXpiRFlKVHp5SmFmZEdB?=
 =?utf-8?B?bFJhZ1JnTytjRENObkd6bjVOVVdxVmUwQ1pKbi9kSmVwMEduOE1NT1pweVZi?=
 =?utf-8?B?VVBjQXVnWVpURmIwZTVyS0ovMThNQjJkU0Y3U1VZd3pqWi9EUWNFVU91MEhY?=
 =?utf-8?B?Z2ZscVh4dWVNQmY4ZGRySGF4K0ZmdWdvQys4OWhzWWRZS2dwTmVJSnRUb0tl?=
 =?utf-8?B?d0MrWmNlTHJXWGlLcFpNUXlySGZIMFpLdCttcm10RFRBV1Jab1NkSDFYWUpW?=
 =?utf-8?B?VlErVmhCalFnT0xKUFNJN0RwSnJPdGc4bXN3eGk3UEkxTUZGVzRyN0w2bVVo?=
 =?utf-8?B?bXg5R1J6UUFWQkltbzlDY0tiRllJS2RybzRBSlovc2ZZSEErNmF1Z0Nlaity?=
 =?utf-8?B?bG0zbU9SRkZ0elJYNGl3VmtPdHZ2UTBXRHVxYjk5eGVpQjdFV0htem1CajJC?=
 =?utf-8?B?SGVISG51bDN0Sy9sRXNXSVlKcG8rai93a3JaQW0yZVlja3pBeXdBWkZyNkV2?=
 =?utf-8?B?TWtlVHVEeXNJQ01zMVAyc1ppc1ZNZytob2t1WVhwNHZ4OUNrTVZtRDlFT1hG?=
 =?utf-8?B?NlRZbm9RdjZTNTJSQU5kZEZSeGVhMVB4OFkwdzU1bjlNZ2xERTliN1hYc3pq?=
 =?utf-8?B?enNtamNlYlJMdXpzVU1kN0JrMmJ0aWg5cjBsRHI0Q0hZTlpDejZzRzNrbVZ5?=
 =?utf-8?B?SWpwdE41clZ0NDhybDZXQ0pSTUsrSTlVSjUrakJLaGFLdklQczlMbGs0SXB1?=
 =?utf-8?B?QThneGZpU0x4UGpWaXhuVkNqWFBTRm1lR1JHckNMb0E0bGhXNUV6L1hFbVdk?=
 =?utf-8?B?eUMwdjY0RXMveHNLa1B1dTBPRW5sdGVjRTVweE1WeWc3OVRkaEFzRGErbTFE?=
 =?utf-8?B?K1FHRGdhZnFuNUMxWTlValJIcDZKWlpFd1RNc293ajRQMEhsVStHYXg3TGEx?=
 =?utf-8?B?OU5TSjdkaDMzWDFKUkhCazZNS29zL0tKUjZRZURwbmVxdFFhQVp5S3E0cWsv?=
 =?utf-8?B?NG5aMWhnTUNSUkpaRWVSZlZoVXN2YUZ5R2MxTmZla3FpWUlWSlczeEljc3FH?=
 =?utf-8?B?NVpNWCt3ZE85VHhzeW1BNnV5VmlMYUIzZFViY056bzdDeVFVVUxxM1ZIbEtI?=
 =?utf-8?Q?DL7gqBUapW2V2OWj8YmIVw85N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afdd0152-25ce-4972-5968-08dd71c55408
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 09:04:09.1053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9BSmb6RwpQIYKOxFBqGJiLTanpy2W5YU5AlgyX8r0om6Y1lnsICX6p6T5bQtP4x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9022



On 28/03/2025 00:22, Stefano Stabellini wrote:
> Evtchn fifos are not needed on smaller systems; the older interface is
> lightweight and sufficient. Also, event_fifo causes runtime anonymous
> memory allocations, which are undesirable.  Additionally, it exposes an
> extra interface to the guest, which is also undesirable unless
> necessary.
> 
> Make it possible to disable evtchn fifo.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


