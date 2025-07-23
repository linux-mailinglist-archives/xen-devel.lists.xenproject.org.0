Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC4AB0F3E5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 15:24:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053981.1422759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZRn-0000V5-OW; Wed, 23 Jul 2025 13:23:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053981.1422759; Wed, 23 Jul 2025 13:23:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZRn-0000Rw-LC; Wed, 23 Jul 2025 13:23:51 +0000
Received: by outflank-mailman (input) for mailman id 1053981;
 Wed, 23 Jul 2025 13:23:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ueZRm-0000Rq-KM
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 13:23:50 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2417::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c80ef3a-67c8-11f0-b895-0df219b8e170;
 Wed, 23 Jul 2025 15:23:36 +0200 (CEST)
Received: from SJ0P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::8)
 by CY1PR12MB9627.namprd12.prod.outlook.com (2603:10b6:930:104::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Wed, 23 Jul
 2025 13:23:31 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::f6) by SJ0P220CA0021.outlook.office365.com
 (2603:10b6:a03:41b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.30 via Frontend Transport; Wed,
 23 Jul 2025 13:23:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 13:23:31 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 08:23:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 08:23:30 -0500
Received: from [172.25.61.180] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 08:23:29 -0500
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
X-Inumbo-ID: 3c80ef3a-67c8-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYjLi+x6ny+I9T0+JiSWzJCHsaekMiDAVJ31cOEqBbnhxfwEp87FeSZ9nsGjnnD3k5vRfmYoYdWMJISrTPkxPHgFzMOLKkIizNtRCQXs9y2At8ftoVFYrZA49xEOkI2MesHyMIVKhQ2l/hc5mG6MEU5lH5IsEWGWi9elexKSevn6H6Bs/8sLDvHaSStcjgZUWFEunByQbNBBHxLNdSJFfUJznfuJDungzxX+clu0fcSmEtlYHED/q1845EvCYWrCDpZW/hwkS8huvf/7BoEseOPwvGe4Pb3AgHrwxvLuuZ++aU9RtLHbub0vYai8hB01Q10wc9JZ2xdGg8d+0leZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWQNDhuA8x52T/QP/1uGkdHOJoFSLEsMAOnwvgITQgc=;
 b=dM4RSZLj1hpS8MvYBdQUNy0VlAgCn0cYjG4AClWHYAj6e4GR8zWjFxXnuP5A1oMl5inIgFxzTVECHsFbX8pxxT3oVYde174jQ24zaYjjWbW12MLlo2tL27adQZm3gWo31rhoCsZdxZ8cu7DSH8FUjoPPZUoPb/ZeK1q+k/SZi0ZEw/nSptq/RR1068RYgfkDCMKPqlkdtu/YGNCd9uxfM75wMjZg7Ssi6op9fGOhzjU8qeRs+A9rzqkWKaeJc4TeUMzaMw9f9fRGdrLNeVBP+zNTkiQIHFOVvxNGfeeG9wePT87ctn8mUUbS9JiWBEtjdMtRVwLs+wkvXQwTNnLvSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=boeing.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWQNDhuA8x52T/QP/1uGkdHOJoFSLEsMAOnwvgITQgc=;
 b=nVzHxFzkhKu+Wq+sDN9DbwMjLP/DRIhDgoY9oCg4F8GTLe3WyDZ3TeznoSUTlh6zTE66PJ3arLd99DIGAgWEAGfeVIGuJHvSWiPrhs/IDSpKDOmSTDNeEtEEWmlxV1nJ9VlgZzzr8TOi819H5/n17n+ZCCnqpPEoBtAYt5kaYlQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b45f6120-917c-417c-9361-c702451a3673@amd.com>
Date: Wed, 23 Jul 2025 09:23:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [XEN PATCH v3] xen/arinc653: fix delay in the
 start of major frame
To: "Choi, Anderson" <Anderson.Choi@boeing.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>, "Whitehead (US),
 Joshua C" <joshua.c.whitehead@boeing.com>, Nathan Studer
	<nathan.studer@dornerworks.com>, Stewart Hildebrand <stewart@stew.dk>, "Dario
 Faggioli" <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>, George
 Dunlap <gwd@xenproject.org>, "xen-devel@dornerworks.com"
	<xen-devel@dornerworks.com>
References: <cb18dbefaf574eb4d3647097d06debcab378533a.1752815008.git.anderson.choi@boeing.com>
 <0c262d60-6776-4c60-ae6e-5d168bba9d93@amd.com>
 <BN0P110MB2148E2F55FD1DC7B22A78296905FA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <BN0P110MB2148E2F55FD1DC7B22A78296905FA@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|CY1PR12MB9627:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b18fa53-0d45-439a-f379-08ddc9ec1e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|7416014|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzF1YmlTN1FMcjd3MGpsUkVoNy9KSTN5U3RVeGtWREtkK3VOUnNwU3VBTC9v?=
 =?utf-8?B?eFpubXg1YTlrZjJBMnRlNDBTRFBEWE5yUlFsUFNtci9qa2VocDNsNG1EZitQ?=
 =?utf-8?B?WXF3VCt6enB1cEI0Q0FSckdNb01uSHhRTnQ4aFgvTCtoTEp6eWlMWkVDY1RH?=
 =?utf-8?B?RC9IK1J2YUhrK3VrRDhXVUJQYXdlNUtTcGtBaEdKWFA0K2M5TVc5a1NDZS9P?=
 =?utf-8?B?dGN4bFFuUUNuaE5wQVNNTm9kNjdWR2MxYTU3T0tjb1FIdG52ZkQrRElFYzhu?=
 =?utf-8?B?VjFENGFYSDhodHZoYi9nOEMzc01jVkxtZ0U5RGVhZDh2MHR6ZlJ1aVJOMHJI?=
 =?utf-8?B?SjdPcllkSytZSXVxT3JPbFI5MGVoYnhMT2NUczhhL25zMVhpZkdQeXAzWjdh?=
 =?utf-8?B?S2xLZU9oWGpTeDA2OWU2WXVBbUZlQnNhWTlUbmFVc3lzWHpDVHhGdFROSnRO?=
 =?utf-8?B?ZXNUcTczRXNRUEZuTWcvVjY5Qmt4WG4xTWFCU2FHL0hjdVZXMWl5enAxL3Nm?=
 =?utf-8?B?VFJka1ZyR254R1c4NXhyNUtIRlJoZDRNK2NrU0JZRUVkbWh6ZVVLekVqU3VY?=
 =?utf-8?B?U3RQS0RpbVppK2dDdzcrTkJ0MHV0UnE1WHc3c1VmNHFRY253b0hnbzFEaWdQ?=
 =?utf-8?B?SXBFeWZGMElBUEFIT29LUE0zWkRuV3RwcTRJYnB1a3J0ZE9OVTJ6MWx5V01r?=
 =?utf-8?B?bDVkZnVIRnYwWFBmRmdBd1F2MkYrcnhBUlVZcHVQQUc1N0s1NW1XYWtRc1hP?=
 =?utf-8?B?R1l5a2ZjUHhpOEV4VVl4dERSWmw4T3ZGMDFiNTBIbUQyWUVZQTlxTFZMb1ZI?=
 =?utf-8?B?dzdFeG52aWZ2SEREelJ6SUVGSFZHazk4WlJ6VGIvb3VEdHlqYU9vWDM3L0I4?=
 =?utf-8?B?MGdwWmcvS1duTUp0WFNQREhhMmRFTGpidDFNNzA5N2szUHJYN0JVQTkrUVVa?=
 =?utf-8?B?M0lJdjE3UVhORHNLWkNkN2htRGRoQmZ0YzBFaEFKTzQvZ1FCSG1tNGxEYWVu?=
 =?utf-8?B?VWVBZWxRMWFLYTlHd2t4bzhsMHdlQ09BZGNHdlVWaDIveGpYUE5uOXc3cFU5?=
 =?utf-8?B?WE5yS2wwWDZrM3I4bFJoK3NzbUg3QzM3K2N4MFF2bHNBbzd3ZWtaR0NyTnlH?=
 =?utf-8?B?d0NWOEZBUThraCtNNGhSZ1p3Y2xndGdkcXNpQnZJSEJmN1RDcXJxTGhGWXY2?=
 =?utf-8?B?aVIzNm1KWUpKS2hzRXovWmRyemhXVXgyQkhITnNDOE10dTZpNjZodjlKREVM?=
 =?utf-8?B?UkJWazJ4NHJkckR5enZXWG5QVTA3bG9TOE1aVjdZaFJLZG8rS1NrdHRUZWhu?=
 =?utf-8?B?SlMvOVlGR1lTWjZ0bWE3UFAxSEI0K2Z0cmZlaGM0bmtXWk5NZXVob21UbFFY?=
 =?utf-8?B?VHAza1NTb3lVRGczNjBkSVVoYWxSMHliVU84cWZobjIyMk1CUWlDZlJjcy83?=
 =?utf-8?B?bEs1aWZHTk5xUlM2bTRiSjBFZmZRL3RjRWdlN0lJbmZJcGQ3VXhpdGJ1K2U4?=
 =?utf-8?B?Mjg4azN4cHdCSVJkdkswWnI4NmhmRVNaR1M0cGpuVm5CblVZWkc1SlJhMFl3?=
 =?utf-8?B?WUo4U0M0bjZUeWVTUmhSQ2FqZ3lkTGZjNlBvVjl3MVBpemtWNitOOGJ4MHRX?=
 =?utf-8?B?Qms4SnM4VXcyUzAyVWgyZVA2ZVhWdWE2bE9CM0FoMVV0Y0RJSVpVY0VySmtn?=
 =?utf-8?B?RUVyNmN6Z1hVZTBFc0pVVEcxdktCUVdXNVlmOWxJUko5YWZMQk9UakV4QTJ2?=
 =?utf-8?B?aWM4SVBVYzFpR2VJK08rWGcyNkd2N0tObHBlQjhzbENPbzNOR1VUdkZtNGRM?=
 =?utf-8?B?L204dVgwOVhuK3gwcUhWZHdsL0N5S3MwL1Z3NFg0alJGNUFCY1hxVnRMQ1hV?=
 =?utf-8?B?NFo0Mys5d3NLSjJjWm5VSnJtZi9rRHJMY0o1R0h1dnlZeGdCSi9NUnUrZXlQ?=
 =?utf-8?B?OU5nQko2aUNPNS9MV2hZUGpQNGtpejYyaytkZHZFWUtxWGU5N1h6MW9MdHJv?=
 =?utf-8?B?Q0g2NmpJNlIycjYwTGdmNGlaK0REbTRROThNZ0VVVmRjcmY4ZWZKU3NSbTkw?=
 =?utf-8?Q?FfG+2v?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 13:23:31.0389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b18fa53-0d45-439a-f379-08ddc9ec1e25
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9627

On 7/22/25 20:16, Choi, Anderson wrote:
> Stewart,
> 
>> EXT email: be mindful of links/attachments.
>>
>> Hi,
>>
>> It largely looks OK to me, just a few small comments below.
>>
>> On 7/18/25 05:16, Anderson Choi wrote:
>>> ARINC653 specificaion requires partition scheduling to be
>>> deterministic
>>
>> Typo: s/specificaion/specification/
>>
> Addressed the typo.
> 
> ARINC653 specification requires partition scheduling to be deterministic
> 
>>> Per discussion with Nathan Studer, there are odd cases the first minor
>>> frame can be also missed. In that sceanario, iterate through the
>>> schedule after resyncing
>>
>> Typo: s/sceanario/scenario/
>>
>> The line is also too long.
>>
> Addressed the typo and the lengthy sentence.
> 
> Per discussion with Nathan Studer, there are odd cases the first minor
> frame can be also missed. In that scenario, iterate through the schedule
> after resyncing the expected next major frame.
> 
>>> Per suggestion from Stewart Hildebrand, the while loop to calculate
>>> the start of next major frame can be eliminated by using a modulo
>> operation.
>>
>> The while loop was only in earlier revisions of the patch, not in the upstream
>> codebase, so it doesn't make sense to mention it in the commit message.
>>
> Removed the reference to the while loop.
> 
> Per suggestion from Stewart Hildebrand, use a modulo operation to
> calculate the start of next major frame.
> 
>>>
>>> Fixes: 22787f2e107c ("ARINC 653 scheduler")
>>>
>>
>> Please remove the extraneous newline between the Fixes: tag and
>> remaining tags
>>
> Removed the newline.
> 
> Fixes: 22787f2e107c ("ARINC 653 scheduler")
> Suggested-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Suggested-by: Nathan Studer <nathan.studer@dornerworks.com>
> Signed-off-by: Anderson Choi <anderson.choi@boeing.com>
> 
>>> @@ -526,29 +528,30 @@ a653sched_do_schedule(
>>>
>>>      spin_lock_irqsave(&sched_priv->lock, flags);
>>
>> Since the num_schedule_entries < 1 case is no longer handled below, we
>> depend on major_frame > 0. Please add ASSERT(sched_priv->major_frame >
>> 0); here.
>>
>>> -    if ( sched_priv->num_schedule_entries < 1 )
>>> -        sched_priv->next_major_frame = now + DEFAULT_TIMESLICE;
>>> -    else if ( now >= sched_priv->next_major_frame )
>>> +    /* Switch to next major frame directly eliminating the use of
>>> + loop */
>>
>> Similarly to the commit message, there was no loop in the code before, it
>> doesn't make sense to mention it in the in-code comment.
>>
> Added ASSERT() and removed the mention to the loop.
> 
>      spin_lock_irqsave(&sched_priv->lock, flags);
> 
> -    /* Switch to next major frame directly eliminating the use of loop */
> +    ASSERT(sched_priv->major_frame > 0);
> +
> +    /* Switch to next major frame using a modulo operation */
> 
>>> +    if ( now >= sched_priv->next_major_frame )
>>>      {
>>> -        /* time to enter a new major frame
>>> -         * the first time this function is called, this will be true */
>>> -        /* start with the first domain in the schedule */
>>> +        s_time_t major_frame = sched_priv->major_frame;
>>> +        s_time_t remainder = (now - sched_priv->next_major_frame) %
>>> + major_frame;
>>> +
>>> +        /* major_frame and schedule[0].runtime contain DEFAULT_TIMESLICE
>>> +         * if num_schedule_entries is zero.
>>> +         */
>>
>> The start of the multi-line comment should be on its own line. I know the
>> comment format was a preexisting issue, but since you are changing the lines
>> anyway, please adhere to CODING_STYLE on the changed lines.
>>
> Addressed as below.
> 
> -        /* major_frame and schedule[0].runtime contain DEFAULT_TIMESLICE
> +        /*
> +         * major_frame and schedule[0].runtime contain DEFAULT_TIMESLICE
>           * if num_schedule_entries is zero.
>           */
>          sched_priv->sched_index = 0;
> 
>>> +        sched_priv->sched_index++;
>>> +        sched_priv->next_switch_time +=
>>> +            sched_priv->schedule[sched_priv->sched_index].runtime;
>>>      }
>>> -
>>> +
>>
>> Please remove the extraneous white space
>>
> Removed the white space.
> 
> I do appreciate your valuable review.
> Would it be okay to submit v4 with all the changes applied?

Yes, please do

> Please let me know if there's anything that doesn't reflect your comments correctly.

Your inline replies look good, thanks

> 
> Thanks,
> Anderson
> 
> 


