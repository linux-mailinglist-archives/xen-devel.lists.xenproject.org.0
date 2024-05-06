Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40F68BC6C2
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 07:26:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717193.1119189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3qrz-00075U-Oh; Mon, 06 May 2024 05:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717193.1119189; Mon, 06 May 2024 05:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3qrz-00072e-KI; Mon, 06 May 2024 05:26:35 +0000
Received: by outflank-mailman (input) for mailman id 717193;
 Mon, 06 May 2024 05:26:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pn4q=MJ=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s3qry-00072Y-5i
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 05:26:34 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31a9c99c-0b69-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 07:26:31 +0200 (CEST)
Received: from MN2PR07CA0028.namprd07.prod.outlook.com (2603:10b6:208:1a0::38)
 by DM3PR12MB9325.namprd12.prod.outlook.com (2603:10b6:0:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 05:26:27 +0000
Received: from BL02EPF00021F6D.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::bf) by MN2PR07CA0028.outlook.office365.com
 (2603:10b6:208:1a0::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41 via Frontend
 Transport; Mon, 6 May 2024 05:26:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F6D.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Mon, 6 May 2024 05:26:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 6 May
 2024 00:26:26 -0500
Received: from [10.69.48.49] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 6 May 2024 00:26:23 -0500
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
X-Inumbo-ID: 31a9c99c-0b69-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMFh8rpMaa46Cvhac+sOnnfS5g2HeC6I5X/7teiTMHUeUnFQn/tuZ7P06YS9krzdyI+B/pRYuvlVydfRNR8c2wKnICIKFj5WMUiVXJo+bu1wY2tRj6W1l1VygtWxZ55EeutrPIofRq785OsCSNqCJ/9oNfJYXh8Kpe8DaHzK2wsE6liMsv5s9C8WGNER9K+rvkfUncjqCaqcmhQVIy3YRlm+uHWjieSVE1xGwSsXLH5QzBubF9EFl1oR0P9QDe2OIRfr4RBdEshMPSfJnRNN+OhXKE7sPD5O7GkhDm+0h7Nh98P1/4EjjtB/j5ZnIyDoLilr+6Xsi4T19VJn6DB5/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMvWbq8eGkuTUPMO+sbko5zSqJnpOZqKBbowDBeFt2A=;
 b=Bu5HEU7TxUWwc0cxw8YGuXaLw6mu1Ud6Ggu/qxcojff/5Ix8ucyU++rN8Uqc63AEJReX1h5qmjMic7fC0EQ/szoJW0xViOc4iAaUksINWe1R1IahZOeVK3aL6ZvNDz+CHqKjoaLWkcGdtDPiQ/7qlzX4V3CFbsMRDlrnByV+O1WwSjMOZnc9LAgWTXJJOa5hKbBPkWHBc40UZGsMWoh9zdgBg7BMMhKkEAZjwnQg2JXQC0xNvCfCam62SJO5wb4ZKQiJrwPc4/gcrZfEQnLE252Z09iIrx7Ww3cX24jO7dpeAx38U/LM8BMI6l+rrv7SkSch8nfYqYKEGggvcUu5UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMvWbq8eGkuTUPMO+sbko5zSqJnpOZqKBbowDBeFt2A=;
 b=SlONAVj3mIGuw+SHX6gogH8rNhjg1PrlBb6thvHrKN98HSJug+q/r7eNt402XmPt3dmUgKM3wchZaHUPPqc20Sk4pz96qODefHZUU1JlG+FMqfW5qO9Ca+TnxmJCfPqmivtu53UypiQ97KSG7UxpJbnPXJHdSCCoBt1/wD9tRz8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <7d7d2ac3-47dd-4c64-b16e-29d67958cfbc@amd.com>
Date: Mon, 6 May 2024 13:26:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/15] xen/overlay: Enable device tree overlay assignment
 to running domains
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
CC: Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-8-xin.wang2@amd.com>
 <da67f90f-6807-4fdc-b65b-f7a4ba9f78ad@suse.com>
 <97a401ff-4b5c-4e6a-8d9c-e36305ec64f5@amd.com>
 <128c7e68-0431-44e9-b4fc-96cc46e158ad@xen.org>
 <e3c7098b-a876-48f3-8ccb-18a2ced8521c@amd.com>
 <63ad5cf3-5275-4fcd-a1d1-fbf5f3f167f4@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <63ad5cf3-5275-4fcd-a1d1-fbf5f3f167f4@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6D:EE_|DM3PR12MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 93cc985e-f737-491b-ef4d-08dc6d8d1384
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTFDYmJTNkYvTUNaeE1UQmVURjZ3a0laZnVGVHZsNVZaUEwxME1tdnEwREMr?=
 =?utf-8?B?aHQvTmMxZTVtcDVNZ3JjemNUMG5mNWNqZytYR2Z3dHhHYVhkb00zSG45YUQ5?=
 =?utf-8?B?WjNZNDlRSHdoNmo2R01Fbmk2aGhIaTVSSEVMM2UxTWdMMHd2SndIUEJQT05x?=
 =?utf-8?B?Y0xjbFdiMVpyclEwM0Z5am1MeDV0OWo4NkRid1lGb29VemZoRUtBbUhoUkdR?=
 =?utf-8?B?Mi9sTEdpM3V4ek4yK21XcHpoakkxY0p6VWtjNVk3VHFTMjhDNk1UOW1XYXRj?=
 =?utf-8?B?QnorcE5MaVNldVZuUUhOREJkNTJQRHpEaHo1cjZ6eWNMOVNvODcyVUNzcytr?=
 =?utf-8?B?MW50cEtnL3Z5bUlJTFZDL1hiOUlpNWwvT1NWczhjSzltYkpvZlBuRUd2YkZk?=
 =?utf-8?B?TFJBYXNBakc4dUgzb0VKekpQMTBjVW5GUUgvTm1BcnJGZ2Vhd3RLUi9VYkJX?=
 =?utf-8?B?d3JvV2p0akgxZG10NkplZFJNWjdKREVZWjZZSWJBdlk2MjZmRmZHZDEzeVdK?=
 =?utf-8?B?dHl0eHJJMDNKRGZPUlFzWlpFSW02bFpkcTBzUzJQdmQ2RmttZkdpZmJ5eXlJ?=
 =?utf-8?B?M28wNjFKakRBU2xCYkUydTlZMDFnZ1ZjQm84QTlKWGt3b2VBelpsQW9oMFFq?=
 =?utf-8?B?T2cxZC9kakoxYm91b1d2OE1CcExZVjQ0Z1NhaEJUZGQxSmh0eTRQUlhNUUdF?=
 =?utf-8?B?ZnFLMU1JODdWUEZCL0MzdWttV2F1MkVMcGkyb015V0xDWGhiTzRnTzdydDNV?=
 =?utf-8?B?UmtLaGhJbitjbExmeEhqVGVzbHhpcFVhb1duOUcyL01DRjFGZEpYQVBuK0th?=
 =?utf-8?B?cVFGOHR4Q284aHRhRzNLUGs3cVpCMUg2L1dGcGRKL3l0S3J6UUMxaFRxSGtM?=
 =?utf-8?B?aUdqMisweHBldVpjTXk4ZU50VGtqT3NLVktvZGF2cldIcmZxVGhlTldOMzFL?=
 =?utf-8?B?SzZSUm81OVdwWWhHRFBVVGlyTnhRQzhiMEVnS1R4YVVxaFZaNkRtRTl6OTl5?=
 =?utf-8?B?dG5lamw3dEQwdnNHTFc3eDk3NUhTamFMeDNqNHBRZitxVTRkVzh0U3NiYlpr?=
 =?utf-8?B?N2RhSWEzS2ZBM2pOc0dGR3Qxbm1lcDY1NkRqZGljTys3TFlKR3c5NUM4VmpD?=
 =?utf-8?B?WTNQcjAyT25yMWt6Tkp4VjUyS0lTbWlEN0h3aDNXQk5EM2RnYmFwOFhwQnJu?=
 =?utf-8?B?RVRRdmlqeDJlRWQ3S0RvQU8xQlhwWGxTeU9qd21KVndvZUFuT0VWM09SS3Ax?=
 =?utf-8?B?REMwc3ZsMzFxdVBRbHVtU3pMa01wREdvbmo2K0RBQTNsSXVHZE1wdXlpZEN3?=
 =?utf-8?B?L0w2a1Rna1AwSk8xK3JPZVk1ZHdxcTRHOHdraFdLbURzbnNicXFWY3hOL3Yy?=
 =?utf-8?B?dEdLaUJrWjczaTRGYkk2NVM2QlpoanRuSnhSNlhsZ1FqbW5VajhCZDFKWlRK?=
 =?utf-8?B?SDVycldUVkVQdUwvZkI5NWZleXBkWE5ZUUkwd2wyY0pKcVkrUVFoSFpod2Fm?=
 =?utf-8?B?TWp4bnNtdEFFZzRBK1FqdzA0MHlZaFRIUWg1bjhoUmJ1RHIvZklkRnE3aTJu?=
 =?utf-8?B?WEt5Q1l4YjF1UFdmaWpkTVVhbExuN2Q0QTZlQVFuOWpycGZXN2Z6dWRpaTJV?=
 =?utf-8?B?YkEyeXlFSE9seGZJaEh2aUJBeTdFZmZLckt2R2Z2TXVsUzJpWWhKdFZ5VXdM?=
 =?utf-8?B?eXZObmFyd2toT2hySjF5d01oSHlhRlR0REJhRXU0bGpCQ2RQVTJSWTYzT0xm?=
 =?utf-8?B?YzV2M05oaE1sL29KZ0VROWVIV0xJZG5kMVBPSDNPMEJ4T29XT3lQMUsrellh?=
 =?utf-8?B?REpqVkdJbHhpRFc3ZzNpd3NaeWVSR3NicFFLREYzUWZhNGZlUmM2WG5rT2ZK?=
 =?utf-8?Q?PPfb3vs9HRVAV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 05:26:26.4750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93cc985e-f737-491b-ef4d-08dc6d8d1384
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9325

Hi Julien,

On 4/30/2024 5:47 PM, Julien Grall wrote:
> On 30/04/2024 05:00, Henry Wang wrote:
>> Hi Julien,
>
> Hi Henry,
>
>> On 4/30/2024 1:34 AM, Julien Grall wrote:
>>> On 29/04/2024 04:36, Henry Wang wrote:
>>>> Hi Jan, Julien, Stefano,
>>>
>>> Hi Henry,
>>>
>>>> On 4/24/2024 2:05 PM, Jan Beulich wrote:
>>>>> On 24.04.2024 05:34, Henry Wang wrote:
>>>>>> --- a/xen/include/public/sysctl.h
>>>>>> +++ b/xen/include/public/sysctl.h
>>>>>> @@ -1197,7 +1197,9 @@ struct xen_sysctl_dt_overlay {
>>>>>>   #define XEN_SYSCTL_DT_OVERLAY_ADD                   1
>>>>>>   #define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
>>>>>>       uint8_t overlay_op;                     /* IN: Add or 
>>>>>> remove. */
>>>>>> -    uint8_t pad[3];                         /* IN: Must be zero. */
>>>>>> +    bool domain_mapping;                    /* IN: True of 
>>>>>> False. */
>>>>>> +    uint8_t pad[2];                         /* IN: Must be zero. */
>>>>>> +    uint32_t domain_id;
>>>>>>   };
>>>>> If you merely re-purposed padding fields, all would be fine without
>>>>> bumping the interface version. Yet you don't, albeit for an unclear
>>>>> reason: Why uint32_t rather than domid_t? And on top of that - why a
>>>>> separate boolean when you could use e.g. DOMID_INVALID to indicate
>>>>> "no domain mapping"?
>>>>
>>>> I think both of your suggestion make great sense. I will follow the 
>>>> suggestion in v2.
>>>>
>>>>> That said - anything taking a domain ID is certainly suspicious in a
>>>>> sysctl. Judging from the description you really mean this to be a
>>>>> domctl. Anything else will require extra justification.
>>>>
>>>> I also think a domctl is better. I had a look at the history of the 
>>>> already merged series, it looks like in the first version of merged 
>>>> part 1 [1], the hypercall was implemented as the domctl in the 
>>>> beginning but later in v2 changed to sysctl. I think this makes 
>>>> sense as the scope of that time is just to make Xen aware of the 
>>>> device tree node via Xen device tree.
>>>>
>>>> However this is now a problem for the current part where the 
>>>> scope (and the end goal) is extended to assign the added device to 
>>>> Linux Dom0/DomU via device tree overlays. I am not sure which way 
>>>> is better, should we repurposing the sysctl to domctl or maybe add 
>>>> another domctl (I am worrying about the duplication because 
>>>> basically we need the same sysctl functionality but now with a 
>>>> domid in it)? What do you think?
>>>
>>> I am not entirely sure this is a good idea to try to add the device 
>>> in Xen and attach it to the guests at the same time. Imagine the 
>>> following situation:
>>>
>>> 1) Add and attach devices
>>> 2) The domain is rebooted
>>> 3) Detach and remove devices
>>>
>>> After step 2, you technically have a new domain. You could have also 
>>> a case where this is a completely different guest. So the flow would 
>>> look a little bit weird (you create the DT overlay with domain A but 
>>> remove with domain B).
>>>
>>> So, at the moment, it feels like the add/attach (resp detech/remove) 
>>> operations should happen separately.
>
> Thinking a bit more about it, there is another problem with the single 
> hypercall appproach. The MMIOs will be mapped 1:1 to the guest. These 
> region may clash with other part of the layout for domain created by 
> the toolstack
> and dom0less (if the 1:1 option has not been enabled).
>
> I guess for that add, it would be possible to specify the mapping in 
> the Device-Tree. But that would not work for the removal (this may be 
> a different domain).
>
> On a somewhat similar topic, the number of IRQs supported by the vGIC 
> is fixed at boot. How would that work with this patch?

Seeing your comment here I now realized patch #5 is to address this 
issue. But I think we need to have a complete rework of the original 
patch to make the feature portable. We can continue the discussion in 
patch 5.

>>>
>>> Can you clarify why you want to add devices to Xen and attach to a 
>>> guest within a single hypercall?
>>
>> Sorry I don't know if there is any specific thoughts on the design of 
>> using a single hypercall to do both add devices to Xen device tree 
>> and assign the device to the guest. In fact seeing your above 
>> comments, I think separating these two functionality to two xl 
>> commands using separated hypercalls would indeed be a better idea. 
>> Thank you for the suggestion!
>>
>> To make sure I understand correctly, would you mind confirming if 
>> below actions for v2 make sense to you? Thanks!
>> - Only use the XEN_SYSCTL_DT_OVERLAY_{ADD, REMOVE} sysctls to 
>> add/remove overlay to Xen device tree
>
> Note that this would attach the devices to dom0 first. Maybe this is 
> why it was decided to merge the two operations? An option would be to 
> allow the devices to be attached to no-one.
>
>> - Introduce the xl dt-overlay attach <domid> command and respective 
>> domctls to do the device assignment for the overlay to domain.
>
> We already have domctls to route IRQs and map MMIOs. So do we actually 
> need new domctls?

No I don't think so, like you and Stefano said in the other thread, I 
think I need to split the command to different hypercalls instead of 
only one hypercall and reuse the existing domctl.

Kind regards,
Henry

>
> Cheers,
>


