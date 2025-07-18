Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F12B09A1A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 05:14:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047834.1418184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucbXy-0000CS-E2; Fri, 18 Jul 2025 03:14:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047834.1418184; Fri, 18 Jul 2025 03:14:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucbXy-00009Q-AJ; Fri, 18 Jul 2025 03:14:06 +0000
Received: by outflank-mailman (input) for mailman id 1047834;
 Fri, 18 Jul 2025 03:14:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0jA/=Z7=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ucbXv-00009J-Qd
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 03:14:04 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2415::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3fcbc86a-6385-11f0-b894-0df219b8e170;
 Fri, 18 Jul 2025 05:14:01 +0200 (CEST)
Received: from MW4PR03CA0253.namprd03.prod.outlook.com (2603:10b6:303:b4::18)
 by CY8PR12MB7561.namprd12.prod.outlook.com (2603:10b6:930:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 03:13:53 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2603:10b6:303:b4:cafe::50) by MW4PR03CA0253.outlook.office365.com
 (2603:10b6:303:b4::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Fri,
 18 Jul 2025 03:13:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.1 via Frontend Transport; Fri, 18 Jul 2025 03:13:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 22:13:52 -0500
Received: from [172.21.62.237] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Jul 2025 22:13:51 -0500
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
X-Inumbo-ID: 3fcbc86a-6385-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZQImivV1I923uZxsdIVgKcrfWbavn+V3sTyDU1u1W1ghI8g2UySURTaMlvnz2x5cyj4AUW96xBhkHrymTCBKiS7fO6MytBIRUwdTG2nKMT2CPEKiGg8mPW0HkOg1qTGYdy+d/yO6wv5FFM7AenjTHnOESIo3GJf72VQTYa+n+R2QBanC5GJK2tFEobBFb+gJ8SMuqn6cXsRnA3g5tBaOcQkjG6m7B42Le7MNXOiIKNUQ6WPZAj3Z4OqGsgG3hjwJV21dUhtRrxl/U7g2VNN4uXMOye70MGTb+poK4m1HoSF/KfuVwxth88/Zc8XPY7pbQ2eeB/sUiBNg6FVCUHu3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jqSEW12oOOKTGIEGPIWqAULPCNAJ/jHbgYzJL7t9aGk=;
 b=qAbU6fJpW/qHuPgGgmJhC6FHh7xc5OlMEaFSY9ANGkfaI+PyYsM130BDZWTiU2NSpfPFS9kLyCgClPgW8NASFc9ClmHXn06r1OfViinlDU/MgtvFms8xuiLIG6v6h0XzMFNlqCYS06esUcTgc8IFVXFKBcbosuH4SBkMV1uXBTYWJUlKLI5V5x++eDyKRu38Wxk3UbTyyJ/ARYxB9MYXx7HIrXbdLJuoU6de4surOtSMIonO3umUNam1E2NVZVyqF0ebInFft+ic6qhjSLC0QhguQAzk95it179eOGmV99giqHiwS8GRkVwOM7unvyiPYgFKYPJSAkR62wIgiWcBmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=dornerworks.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jqSEW12oOOKTGIEGPIWqAULPCNAJ/jHbgYzJL7t9aGk=;
 b=Ic/Z9mdThjsJXUkdJhtXoMoaTYBae5tvmb8MKNtKA/lw4pn41r2yP+QXEKd3X1lGN2J1qlAph2xTiDEtjlosNP9aiB9DjqqNwThphIhpS8KC+RlUS3u2vYPIJ/P04m7HG22+vziuHuxQzOGc5uS6y/hR0baiklZpO8VbhaQ1IdE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <46b3cf5e-758d-4fb7-8d19-791d77040d15@amd.com>
Date: Thu, 17 Jul 2025 23:13:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen/arinc653: fix delay in the start of major
 frame
To: Nathan Studer <Nathan.Studer@dornerworks.com>, "Choi, Anderson"
	<Anderson.Choi@boeing.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "Weber (US), Matthew L" <matthew.l.weber3@boeing.com>, "Whitehead (US),
 Joshua C" <joshua.c.whitehead@boeing.com>, Stewart Hildebrand
	<stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>, Juergen Gross
	<jgross@suse.com>, George Dunlap <gwd@xenproject.org>, xen-devel
	<xen-devel@dornerworks.com>
References: <c3234cf8d5fb5da84e10ebdb95250c594f644198.1752197811.git.anderson.choi@boeing.com>
 <2c4837b7-404f-47a5-8c6c-f3a707bb544e@amd.com>
 <SA1P110MB1629479AEC6F1B8583D7725EF451A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
 <BN0P110MB214810B8239A418B1AF540E49050A@BN0P110MB2148.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB1629F354A80CE6536718FAB3F450A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <SA1P110MB1629F354A80CE6536718FAB3F450A@SA1P110MB1629.NAMP110.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|CY8PR12MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd4382f-ca3b-40fc-88f7-08ddc5a91ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aks4MGRYL1JncHdyVlM1ZExnd3BINlUzUU50Wk5pZmtiVzc5VStjQUFOeGpv?=
 =?utf-8?B?Q2kxZ0lRRjRiemlwWlRHcDY3eCt3YUVQS0JJSlQ5TVNPbllKOUFaVGtoanlM?=
 =?utf-8?B?Y3Q2SHgzN2FOalBnWHhNUzM5eXd3TXVlai91ZDQyZUczcDJnZmJ6N05YVkh0?=
 =?utf-8?B?dklyRFArdkUwa09ndms1STNCSi9qR0VZaTNlbzIxeUlSdXdCcjJtYzBhRnhp?=
 =?utf-8?B?V09MVXJWaklXZllJRlhZYm1MT3Zwa3habVAwNEQ2d2l6UUtuQnozMEdMZVNl?=
 =?utf-8?B?ZUxnY05PY2QrbEppMyszY3d3V1QxanpQbUVJVHhEWkxmQjRyWlhOR0E4R0xh?=
 =?utf-8?B?RUlJMlorMElHODZSeVBXQkpmQms0QjBwQUhZKzhvRHNaU1pQVVBhVG1Vd1RX?=
 =?utf-8?B?VVg2VTdkRE8rd3BsaWdGUEc0VDg3VkVuMFNPUlNydG1uV1c1akZFSUVLNUJJ?=
 =?utf-8?B?RVkwZmhUVGRMVUdWU2RaWkZSeTB6cGtYbUd0SmxtZnZ5T0pST3k3TWwyZTZ0?=
 =?utf-8?B?WXgwYmE2V2tMa3d2S1RNVjQ3Q3hBT0szTDQxampnWHd6bXVsTnZMUDRWV0Qr?=
 =?utf-8?B?S3ppajRraGpvcS9jT0wzMjgzR01hTXM3QzE5WjBMZHBpdjNSV2FTV3YyclNR?=
 =?utf-8?B?eHU0OHFrajQ0cVlrZUJMZkFTd2cyQkt3c2NyYk5UWDMzS1FnZnR0ZTNFM0JM?=
 =?utf-8?B?MWd3WFNUUmxvemNCbDBNUk14OVpsc2dlci9ra0VkaGkzVTdqQVMzdk1kYmdy?=
 =?utf-8?B?MXE5U2dqZHdyYTByK1ljK0JTNUw5cTJDMGphYWtqdFVsdVpYc1hsOWlNVFN2?=
 =?utf-8?B?SVZnUFNobGZyNkcyYS84U3NKaHdPNmtFVFlVckFWdHVGY2MzU3owT3BxZWp6?=
 =?utf-8?B?QTFDeEJId2F5cit4TDJ1YjF2ZVV0OTJncU1XSnVycmpHN0Ura2lRZEpLQ1FP?=
 =?utf-8?B?TDZXWkhaSmtnU21BL0dOZEw5c3djWUdqcXVUdFlCaTBuSzVHMWRVVnhJRzBz?=
 =?utf-8?B?ZzNsSWVzZFV2ZCtmVkpZZDRXL1V6YzhoV1JqQ2ZIb0FzRHNPYlJPemloMSs1?=
 =?utf-8?B?S2d0d1dycklBaUJuNEJWMXBXS3B5Y1RHMUlXdE0xYytNS1NkeDdmYUJvN2Jq?=
 =?utf-8?B?SzRCQjdiR054aHNhc1YvMGdOOE9USlFXektWa2cxUFJGTy9nbWw2d3VKTzZu?=
 =?utf-8?B?cE9uV3F1MHJvaytuRjV5ZS9vcEZXbHNaNW9lNDdnNHlGV25JeVFOdXc4dlFQ?=
 =?utf-8?B?aE1TSy9pQjZpckptbjh6dGVZWXZMdjZ1N0ZLby9rWXZHUWZ1a213SEZFbEJT?=
 =?utf-8?B?OXlBR3hDV3FwYXBzSkdoZ3BMZkh3Z2EzY3pQR2pOQXFadW9sWlNmRGRGWm9Y?=
 =?utf-8?B?R3owSHFVMWV1bDFZeGJ5UVRpUFhwNEJMQXJsalFWUDFGc0xLNEVWNkR1UDZv?=
 =?utf-8?B?WWQzYWk4US9ZZ3NvRGxudmFNR215ck1QY3gzNkl5WExubzY5MEtmSGp1amt2?=
 =?utf-8?B?OFZHT3JFSDRnZm04cDlHdWFoSDltem83ekkyS0kzemtQWExjWkRUYnlwaFVx?=
 =?utf-8?B?dHBCalNDSkQwdUYycGNnSTJ3cHR0cnVQQ0hkWmlFVEV6STFITW5pMDNJdHdv?=
 =?utf-8?B?SlhoaC9ORzhEYVFOVThlS1JZclBaSk1WSXB4S2UveU0zeDZ4czVVQUlxdHF0?=
 =?utf-8?B?RUNHZktWUjBzWXBnTVBLblBsa1VwSVh5YzN6dUdINHVtOXJGUnFyWkU0aWJL?=
 =?utf-8?B?U24zZTZHT1NFWmNRYmFCNi9VaGFlSVg1cUVaVXQ4Vlo4Zm5DWFpsejE3N0Zp?=
 =?utf-8?B?a2VlYThiMnFWZWUwRlJPOEJ0VGtqMWpYdDVUU3FvcGdGeTdHSWphUTMzRnRz?=
 =?utf-8?B?RkJjUm0xTm9LbUQvRURIYWYvTCt6Vk9KRkh0czFhcUFVVXc3dm02bmpzcm1I?=
 =?utf-8?B?OHk2ekFqNkVxdzFHYllEZkdJNXVxT2RLb011bitQTFRyeVM0bytWcXZjNDdH?=
 =?utf-8?B?UVExL3FlUG9oNmwxbG5CWlZmaklaZXFSNjBjVHk0aHhUMkNrSVVnUU8xazlR?=
 =?utf-8?Q?1XmFPL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 03:13:53.1432
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd4382f-ca3b-40fc-88f7-08ddc5a91ff5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7561

On 7/17/25 22:16, Nathan Studer wrote:
> On 7/17/25 21:39, Choi, Anderson wrote:
>>> On 7/17/25 9:21, Hildebrand, Stewart wrote:
>> else +        { +            sched_priv->next_switch_time =
>>>>> sched_priv->next_major_frame + +
>>>>> sched_priv->schedule[0].runtime; +
>>>>> sched_priv->next_major_frame += sched_priv->major_frame; +        } +
>>>>>   }
>>>>
>>>> There's no need for the above loop, this can be fixed by subtracting
>>>> the remainder (modulus major_frame). E.g.:
>>>>
>>>>     if ( now >= sched_priv->next_major_frame )
>>>>     {
>>>>         s_time_t major_frame = sched_priv->num_schedule_entries < 1
>>>>                                ? DEFAULT_TIMESLICE
>>>>                                : sched_priv->major_frame;
>>>>         s_time_t remainder = (now - sched_priv->next_major_frame) %
>>>> major_frame;
>>>>
>>>>         sched_priv->sched_index = 0;
>>>>         sched_priv->next_major_frame = now - remainder + major_frame;
>>>>         sched_priv->next_switch_time = now - remainder +
>>>>                                        (sched_priv->num_schedule_entries < 1
>>>>                                         ? DEFAULT_TIMESLICE
>>>>                                         : sched_priv->schedule[0].runtime);
>>>>     }
>>>
>>
>> Stewart,
>>
>> I appreciate your suggestion to eliminate the while loop.
>> What about initializing major_frame and schedule[0].runtime to
>> DEFAULT_TIMESLICE at a653sched_init() and use them until the real parameters
>> are set as below to eliminate the if branch?
> 
> It would make the scheduling code cleaner, but since you asked Stew I'll defer to him.

It feels odd to index schedule[0] when num_schedule_entries may be
zero... But since it's a fixed size array and element 0 is guaranteed to
exist I don't have a strong preference.

> 
>>
>> diff --git a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c
>> index 930361fa5c..73ce5cdfaf 100644
>> --- a/xen/common/sched/arinc653.c
>> +++ b/xen/common/sched/arinc653.c
>> @@ -361,6 +361,8 @@ a653sched_init(struct scheduler *ops)
>>      ops->sched_data = prv;
>>
>>      prv->next_major_frame = 0;
>> +    prv->major_frame = DEFAULT_TIMESLICE;
>> +    prv->schedule[0].runtime = DEFAULT_TIMESLICE;
>>      spin_lock_init(&prv->lock);
>>      INIT_LIST_HEAD(&prv->unit_list);
>>
>> static void cf_check
>> a653sched_do_schedule(
>> <snip>
>>     /* Switch to next major frame directly eliminating the use of loop */
>>     if ( now >= sched_priv->next_major_frame )
>>     {
>>         s_time_t major_frame = sched_priv->major_frame;
>>         s_time_t remainder = (now - sched_priv->next_major_frame) %
>> major_frame;
>>
>>         sched_priv->sched_index = 0;
>>         sched_priv->next_major_frame = now - remainder + major_frame;
>>         sched_priv->next_switch_time = now - remainder + sched_priv-
>>> schedule[0].runtime;
>>     }
>>
>>> The direct method suggested by Stew is preferable in the unusual case
>>> where many major frames are missed.  (We have only seen that happen
>>> when using a debugger.)
>>>
>>> To help uncover any issues like the one this patch addresses in the
>>> future we may also want to follow up this commit with a change to make
>>> scheduler misses more obvious.  Something like the following:
>>>
>>> commit e95cbc9078127c412bd1605d93cb97837751b5b4 (HEAD -> master)
>>> Author: Nathan Studer <nathan.studer@dornerworks.com>
>>> Date:   Thu Jul 17 12:43:39 2025 -0400
>>>
>>>     Do not silently skip frame overruns diff --git
>>> a/xen/common/sched/arinc653.c b/xen/common/sched/arinc653.c index
>>> 2d0d3bcbb3..a2c1c66c27 100644
>>> --- a/xen/common/sched/arinc653.c
>>> +++ b/xen/common/sched/arinc653.c
>>> @@ -523,9 +523,17 @@ a653sched_do_schedule(
>>>      a653sched_priv_t *sched_priv = SCHED_PRIV(ops);
>>>      const unsigned int cpu = sched_get_resource_cpu(smp_processor_id());
>>>      unsigned long flags;
>>> +    unsigned int oindex;
>>> +    unsigned int missed;
>>>
>>>      spin_lock_irqsave(&sched_priv->lock, flags);
>>> +    if ( now > (sched_priv->next_major_frame +  sched_priv->major_frame))
>>> +    {
>>> +        missed = (now - sched_priv->next_major_frame) / sched_priv-
>>>> major_frame;
>>> +        printk(XENLOG_ERR, "Missed %d major frame(s)!\n", missed);
>>> +    }
>>> +
>>>      /* Switch to next major frame while handling potentially missed
>>> frames */ @@ -544,6 +552,7 @@ a653sched_do_schedule(
>>>          }
>>>      }
>>> +    oindex = sched_priv->sched_index;
>>>      /* Switch minor frame or find correct minor frame after a miss */
>>>      while ( (now >= sched_priv->next_switch_time) &&
>>>              (sched_priv->sched_index <
>>>              sched_priv->num_schedule_entries) ) @@ -553,6 +562,12 @@
>>>              a653sched_do_schedule(
>>>              sched_priv->schedule[sched_priv->sched_index].runtime;
>>>      }
>>> +    if ( (oindex - sched_priv->sched_index) > 1)
>>> +    {
>>> +        missed = (oindex - sched_priv->sched_index - 1);
>>> +        printk(XENLOG_WARNING, "Missed %d minor frame(s)!\n", missed);
>>> +    }
>>> +
>>>      /*
>>
>> Nathan,
>>
>> Do we need a comma (,) between XENLOG_WARNING and the quoted string
>> when calling printk()?
> 
> No.
> 
>> And wouldn't the log be printed every time a new minor frame starts, for example
>> oindex = 0 and sched_priv->sched_index = 1?
>> I think you meant to use the condition "if (sched_priv->sched_index - oindex) > 1"
>> to check minor frame misses?
> 
> Right, the order should be the other way around in both the condition and the print.
> 
> Regardless, we can just worry about your patch for now and improve the miss detection reporting later.

+1

> 
>      Nate
> 
>>
>> Thanks,
>> Anderson
>>
> 


