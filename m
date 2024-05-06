Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA4B8BC61F
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 05:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717179.1119159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3opk-0005YE-BA; Mon, 06 May 2024 03:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717179.1119159; Mon, 06 May 2024 03:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3opk-0005V8-8D; Mon, 06 May 2024 03:16:08 +0000
Received: by outflank-mailman (input) for mailman id 717179;
 Mon, 06 May 2024 03:16:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pn4q=MJ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s3opj-0005V2-AY
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 03:16:07 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2414::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8af4a30-0b56-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 05:16:05 +0200 (CEST)
Received: from DM6PR04CA0029.namprd04.prod.outlook.com (2603:10b6:5:334::34)
 by DS0PR12MB8478.namprd12.prod.outlook.com (2603:10b6:8:15a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39; Mon, 6 May
 2024 03:15:59 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:5:334:cafe::3) by DM6PR04CA0029.outlook.office365.com
 (2603:10b6:5:334::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.39 via Frontend
 Transport; Mon, 6 May 2024 03:15:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 03:15:58 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 5 May
 2024 22:15:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 5 May
 2024 22:15:04 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 5 May 2024 22:15:01 -0500
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
X-Inumbo-ID: f8af4a30-0b56-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrb73tqaDvGuWUtOc/oofGWff07c6PffgZ/u/89IHI16t1xorF/XUCUi7WzkJvnKiQ2RC5s5uZk0zAKDRsIIfV0T8aTqvoPyrC8GewOYwHu8TE5yPU/ckQQsWudUqo+sOPlN6gSQv45Ys612nw20uCIeRnxUcv8rhLDrW3HLja+fQZfZpW79D/nSsYsFtV1VgyzHj9cEAoHIcHw/x9EJlu8H0aNIIVe7iq+2ekQmmd3OwXrXNqTWweGpIG5yC5SY7g7yK0tPyu8RKgIkjGIhx2dJizNPFcWssLHQJ0EWzjHyj9fcOIL6A1QHMQQWhfLrYOyQgMWs5Nn2YVK+wN7/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i1bh3+wge0j+km//KlMypTl9qwGSWcm+TB01jpyzT2E=;
 b=e0nwLrVRLxne4r6TYuXIhw0u54odg/xsS10pei2T3qlvWC01b5dL7JHJh+NB3s1W71uSMmUVN9USwstlz/urDWWGKUjQXFmqMvA/sYv5ZhyWmixYhU8tIxdXU36Wu52zOqoPqvlJF1+L39BKsjltuhwD0K1BemUwvxYTjjXg7/hI8Zu9JWQdHleAzQvGG9KXM5lnYvJxdqMjzeEn3Y7pZhX63jeOKnZ/a+I8qV1Wk0ZStdJlozDf3yFf2lkaP71UZhrPE6KChND7XiVzqM0a/k48zGZa6BtFSzZtR/WysHLnyb7h/kLKkgPr9gATChRt+znViTzepHXqZuMS9UHrJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i1bh3+wge0j+km//KlMypTl9qwGSWcm+TB01jpyzT2E=;
 b=EoI15oSY1KeIenxMXGOk4m4MwK10qDILtT1vtboBEgIoZjlZP18gojPsUHYFeo72zgioKkwHFtBq7lnZWRT/d7juCphN9yVLUqqlRtQZIeBZ/oKXpxru4HLDrTBYPHEVpjmA9Xhy2V/XL8tyLQb6viK5DIzQ7pem0xMTQCHm9ac=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <999ff94f-826e-4493-9902-b700bd9747e0@amd.com>
Date: Mon, 6 May 2024 11:14:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] xen/overlay: Enable device tree overlay assignment
 to running domains
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: Jan Beulich <jbeulich@suse.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-8-xin.wang2@amd.com>
 <da67f90f-6807-4fdc-b65b-f7a4ba9f78ad@suse.com>
 <97a401ff-4b5c-4e6a-8d9c-e36305ec64f5@amd.com>
 <128c7e68-0431-44e9-b4fc-96cc46e158ad@xen.org>
 <e3c7098b-a876-48f3-8ccb-18a2ced8521c@amd.com>
 <alpine.DEB.2.22.394.2405021101200.624854@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2405021101200.624854@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|DS0PR12MB8478:EE_
X-MS-Office365-Filtering-Correlation-Id: fd57067e-2880-4a3b-78c7-08dc6d7ad9eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|36860700004|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVF6ZkRGN3B5dzRGVFBTQ2lwbFpMMEdGR3l1TDJJM0xXeWNybzlBME5aQ1Fa?=
 =?utf-8?B?VHByOU5QR2Q3MWtmdkFZL3VUcUZXQnRTeXg5Ukc5eFVEYUdaalA4aXM3bFhC?=
 =?utf-8?B?SXN3SHVLL2NvTitmQnk2NlpyT2VWYUlzV2svSHBQMmFqOVM2ekhSNkYxSEJj?=
 =?utf-8?B?TVpldE4yc0pvVFdhc3JaVjFlNmNxbUxWNGptZ095TG04cE9FV0ErL2kzMFh3?=
 =?utf-8?B?VktpSWNOcXVPVDhhd2lGQUNYdEg1Qzg0VXZFSlNXWVVlNzVUTGRpKzAxcEdO?=
 =?utf-8?B?VTBsbzkwRlFSVWxKdWlCaDJEMmZEaERkK2RYTWl0SE5tYXZnQlREc2JqR0w0?=
 =?utf-8?B?cU9xaDhEdkFscjVseWFzRnB6Wk9VaFZjK3VEZ29WTlMwT2locHlnNWE0VE9n?=
 =?utf-8?B?aFFScVdXN2hEbVQ4dXp6SmhPZk9CeGdtdFhqaWlCS2JvcXNqdEhpRFFsZkZx?=
 =?utf-8?B?RzMxUU5LNUx4YUhYc1BVSG5PakRmTHNlakg2QVZBOUFWVXljb0t1bWlmUXFw?=
 =?utf-8?B?V1BuYjdYTXhMZjJLYkFlSForSUtCbkVUUFZ6aDlpMmJGNnB4Z0hYWFM4S1Rq?=
 =?utf-8?B?MUErNmpKaXAvRnNQU2JPdkdHUi80NXpWZ0FXdjhRaEI3TFVNdjRMRUQ4ZFRm?=
 =?utf-8?B?bTR5TEZ6bjU0MC9DRUV5dU9OUDJDeTlNRGNvc1ljK3hBVDlRWTJ0SEMwalhI?=
 =?utf-8?B?N0kzRXM3Sy9wSy9ORVlxc0psYzZ0Y3hPcFc0WEhxSHJDVzlEM0hRMFIzaXdM?=
 =?utf-8?B?cXpqZWFXb0RkVURxWUk4UDkzMGhMUVNCdVJrbmp6MlRTY3pPTis4Ny91L2d3?=
 =?utf-8?B?Unc4WS8xRnJnMk4zS25GRTNTdHU5Yk96S1VtZFd5MW1Db2lSUUx0OG5FTHlR?=
 =?utf-8?B?T3htVUpLS0MyNFlVQThBQ3U2UWNGUVdEMkFSWEFaZ3p6QjI3bGJIMkQrMVJK?=
 =?utf-8?B?TmUrT05qbnlkRGpLdEVNVFB0MVljS1pXb1VTU1czMWVFc3FaZzVVVVowT3ls?=
 =?utf-8?B?eE5Sem9TU00xcE5lK0FQSzQzZEp0b2Q2aVB0aUpaNXBkeEFuYUkvQUZHWDhJ?=
 =?utf-8?B?V0x6dE9UWlJHeDh6RTJkYjJpdmpZaCtmZzdicUFtMW1SUjlCOUNLZytFcDhz?=
 =?utf-8?B?enB2TEdxaHRXdkJ4aUpJRDBzc0hoa2NXRENQUmVqYVcrYTAzYU1Wb0VwYlli?=
 =?utf-8?B?N0kySWdpdDlWSnlLaW5GWG5VaE54c3VhZFk0QTRxM3J5N0xGcTRkU2RxUTl3?=
 =?utf-8?B?RFR0ZkZrS29jemtPTWVXeEkyOFltSG5sWldidXFhS1RUdW5pMXJyZFlKVkRQ?=
 =?utf-8?B?Wkd4ZW9TdXlpTGRjOTZzdUpEbEgzTFVFQ3pnSkVYY0d6emFnOGZoRUpEVGxy?=
 =?utf-8?B?MWpaUy92amx1NkZyK05hSk5aWDl5SDdxak1PWmdtanhRR0dHeEhnaUVabmhk?=
 =?utf-8?B?a0VtcFljeDArOFZwUHJqRlpkL1NlVkhlZGpBRm5mNVk5SXVYVUdJbzhPTy92?=
 =?utf-8?B?OGJwd05lKzFDTVFtc0FsTXNaNHl4ZzZIcHFubjdqRitJbGY0MWJpb2pPWGRl?=
 =?utf-8?B?a284ZjdyOENOS3Mwb3VTUWV0WVByRUhwZ0dlOEZMZmpwcU1TbFBUNmNzZk9x?=
 =?utf-8?B?VHBlRVdtTEVuZWErV21KS1NqTDFxZklBbEhCQU0wUWJUdUZ4ai8zdlpBeHls?=
 =?utf-8?B?cEl1TjJObkc1bFB3K3lUWEhoWVMzd3QxZlRHOG1WT2VuQTYvQ21lZ29jc3VJ?=
 =?utf-8?B?NXI3b3NOcmVUaW5iUDV2RmlmTDdrMHJ2c2thTGFOaUZzTVFnYnU3MXk0V2pW?=
 =?utf-8?B?MnpwOGxxbkVmYVRJSUVtT0phSEJ1c0dNMFk5ZEMrcWw2OXlSWDBTUWJ6RnVr?=
 =?utf-8?Q?9eRGQLUVpKvAO?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 03:15:58.8355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd57067e-2880-4a3b-78c7-08dc6d7ad9eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8478

Hi Stefano, Julien,

On 5/3/2024 2:02 AM, Stefano Stabellini wrote:
> On Tue, 30 Apr 2024, Henry Wang wrote:
>> Hi Julien,
>>
>> On 4/30/2024 1:34 AM, Julien Grall wrote:
>>> On 29/04/2024 04:36, Henry Wang wrote:
>>>> Hi Jan, Julien, Stefano,
>>> Hi Henry,
>>>
>>>> On 4/24/2024 2:05 PM, Jan Beulich wrote:
>>>>> On 24.04.2024 05:34, Henry Wang wrote:
>>>>>> --- a/xen/include/public/sysctl.h
>>>>>> +++ b/xen/include/public/sysctl.h
>>>>>> @@ -1197,7 +1197,9 @@ struct xen_sysctl_dt_overlay {
>>>>>>    #define XEN_SYSCTL_DT_OVERLAY_ADD                   1
>>>>>>    #define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
>>>>>>        uint8_t overlay_op;                     /* IN: Add or remove. */
>>>>>> -    uint8_t pad[3];                         /* IN: Must be zero. */
>>>>>> +    bool domain_mapping;                    /* IN: True of False. */
>>>>>> +    uint8_t pad[2];                         /* IN: Must be zero. */
>>>>>> +    uint32_t domain_id;
>>>>>>    };
>>>>> If you merely re-purposed padding fields, all would be fine without
>>>>> bumping the interface version. Yet you don't, albeit for an unclear
>>>>> reason: Why uint32_t rather than domid_t? And on top of that - why a
>>>>> separate boolean when you could use e.g. DOMID_INVALID to indicate
>>>>> "no domain mapping"?
>>>> I think both of your suggestion make great sense. I will follow the
>>>> suggestion in v2.
>>>>
>>>>> That said - anything taking a domain ID is certainly suspicious in a
>>>>> sysctl. Judging from the description you really mean this to be a
>>>>> domctl. Anything else will require extra justification.
>>>> I also think a domctl is better. I had a look at the history of the
>>>> already merged series, it looks like in the first version of merged part 1
>>>> [1], the hypercall was implemented as the domctl in the beginning but
>>>> later in v2 changed to sysctl. I think this makes sense as the scope of
>>>> that time is just to make Xen aware of the device tree node via Xen device
>>>> tree.
>>>>
>>>> However this is now a problem for the current part where the scope (and
>>>> the end goal) is extended to assign the added device to Linux Dom0/DomU
>>>> via device tree overlays. I am not sure which way is better, should we
>>>> repurposing the sysctl to domctl or maybe add another domctl (I am
>>>> worrying about the duplication because basically we need the same sysctl
>>>> functionality but now with a domid in it)? What do you think?
>>> I am not entirely sure this is a good idea to try to add the device in Xen
>>> and attach it to the guests at the same time. Imagine the following
>>> situation:
>>>
>>> 1) Add and attach devices
>>> 2) The domain is rebooted
>>> 3) Detach and remove devices
>>>
>>> After step 2, you technically have a new domain. You could have also a case
>>> where this is a completely different guest. So the flow would look a little
>>> bit weird (you create the DT overlay with domain A but remove with domain
>>> B).
>>>
>>> So, at the moment, it feels like the add/attach (resp detech/remove)
>>> operations should happen separately.
>>>
>>> Can you clarify why you want to add devices to Xen and attach to a guest
>>> within a single hypercall?
>> Sorry I don't know if there is any specific thoughts on the design of using a
>> single hypercall to do both add devices to Xen device tree and assign the
>> device to the guest. In fact seeing your above comments, I think separating
>> these two functionality to two xl commands using separated hypercalls would
>> indeed be a better idea. Thank you for the suggestion!
>>
>> To make sure I understand correctly, would you mind confirming if below
>> actions for v2 make sense to you? Thanks!
>> - Only use the XEN_SYSCTL_DT_OVERLAY_{ADD, REMOVE} sysctls to add/remove
>> overlay to Xen device tree
>> - Introduce the xl dt-overlay attach <domid> command and respective domctls to
>> do the device assignment for the overlay to domain.
> I think two hypercalls is OK. The original idea was to have a single xl
> command to do the operation for user convenience (even that is not a
> hard requirement) but that can result easily in two hypercalls.

Ok, sounds good. I will break the command to two hypercalls and try to 
reuse the existing domctls for assign/remove IRQ/MMIO ranges.

Kind regards,
Henry


