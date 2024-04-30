Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FA18B6948
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 06:01:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714486.1115744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1efL-00017H-1g; Tue, 30 Apr 2024 04:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714486.1115744; Tue, 30 Apr 2024 04:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1efK-000156-VF; Tue, 30 Apr 2024 04:00:26 +0000
Received: by outflank-mailman (input) for mailman id 714486;
 Tue, 30 Apr 2024 04:00:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H2uD=MD=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s1efK-00014y-2j
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 04:00:26 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28b110a6-06a6-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 06:00:20 +0200 (CEST)
Received: from CH0PR13CA0020.namprd13.prod.outlook.com (2603:10b6:610:b1::25)
 by PH7PR12MB5928.namprd12.prod.outlook.com (2603:10b6:510:1db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 04:00:16 +0000
Received: from CH1PEPF0000A348.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::1b) by CH0PR13CA0020.outlook.office365.com
 (2603:10b6:610:b1::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.21 via Frontend
 Transport; Tue, 30 Apr 2024 04:00:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A348.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 30 Apr 2024 04:00:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 29 Apr
 2024 23:00:10 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 29 Apr 2024 23:00:07 -0500
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
X-Inumbo-ID: 28b110a6-06a6-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luhMye8SjY+mLEuCKKsG0ZDd6uc2GUY/Z+GWnCqEPKLdwuDgoQDCYhbqNqQkEzUeyAXFexDqZqaFhi+0q7z+WEygu1Epa2jflSJ40RX3IwTjs+qUpyPpLh0hTs5FyuqjN9mgIpmX+DBJPaiC44H4A9VHvK0xTM66PfPc5ABVQ1MfxWtvTxJeR4MBMkBl4b2A431/7eTWS+mxAbXfj5IJuL3q4oSKoVUPZCS3E59tqFNlnuYvzMITcI8P19A/r4HaSH1uKl4kYygYQaHB9ghIeKAmucgJKg1vyP/fgu9TSq4iereYab6CyZu4fuumjivT+0EFWlxjmV5bE9l35Zj8EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufgL6oise1HBbBXXAe7ujK+6sBYWFqHS5NFn1jHb/ys=;
 b=VxvQrsbjr8UqYi42Fs5Y3bePdGc5vMUmCNOmkpZHXtzG2y/462BT4s5K7cUrToBwBlkYCS+5laX81OO8g1vpb+CKUShI87M0dDjIkmJAqG7+n+q6clWpltjInxGVuPTZeesH7erjwB6u8i3WsNVgv8GV97Earb8u3c7qCTjcJ6POypvVKUJVoXWRsoNh6KVEXc8djmbQuz06JEsn6w4P+CYQn6PIvkLpWbhybd/tjW0p+lIXI66VCnp8iK9IQKlIB/o+EJ8tp2m+3niN22gM0zoqTQQ5nryjRtTyuQsgP+zWMSpMxX3s/rmcYlyPNO7kNmx8YQ4ABFowSiro7cSUyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufgL6oise1HBbBXXAe7ujK+6sBYWFqHS5NFn1jHb/ys=;
 b=Vvl9Gxv1GHnLVS4UOIGFchOV2Tnfe9FE5lCdInLiQqQIPbE97OxKW7TBT7PpOYxm1DV2kTMFYmpj+Q7xd19fPHvZASJtHXiTCIQiyIUy/ivmmo4xWR6iEGeHeAY/+XGXTaojLVCtaTc//IDBAtl8sBz9zY25khA0pLS+yVIS+fc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e3c7098b-a876-48f3-8ccb-18a2ced8521c@amd.com>
Date: Tue, 30 Apr 2024 12:00:07 +0800
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
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <128c7e68-0431-44e9-b4fc-96cc46e158ad@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A348:EE_|PH7PR12MB5928:EE_
X-MS-Office365-Filtering-Correlation-Id: f34f07d6-7f19-4900-a255-08dc68ca0b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|82310400014|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MmJ2djVkSkUwaU1NZW5hdXlab283RllvV2Uxc0YvUzVDd3dOakZuc21aY3Ft?=
 =?utf-8?B?RVlUZXczL1VRWlhhdXVPYUM0UVZTK2YyQ0crUTZ3VzFPK3NKUDE3dEttMGhu?=
 =?utf-8?B?cjhtczhTK0tqYVhxRlVRTVo1dGpqQzdCSm9STVRIejNKYXJhZkp3bklHWlhp?=
 =?utf-8?B?YnZyNEQ5bml3YTJGb2t0R2pteTgvajExcUdnTlNXS043dGkxV0Mrb21CV2Np?=
 =?utf-8?B?WndyVS9TWTIxdHJOa0loSnpMc3ArZEdEUEVadHR0enQzcWdzbEdVdWVyYWI1?=
 =?utf-8?B?TFA5Sk9XZDE1L1BXWnVxOFRuM3JxQnNGT1ZjQS9YQVZYbmRscEp0OFBNa3pr?=
 =?utf-8?B?MzUxRytsRUlUUjduSEkvcUEwL3lNNWtHeldwdVhtRldHVzlhWWFYVjhsc1F4?=
 =?utf-8?B?WnRYQk96SUIwa0hLMkpsb0Z1Zm92a3k2dEs5bkJJNDFTZ0JReUtua04vY3B3?=
 =?utf-8?B?UHJGeEZWd2RLQzJvTDhNakI3c2ppdHVmYzdQa2JkU1RjdDBBT25HTjVKR3Zm?=
 =?utf-8?B?UnpGckhmS0pxN2U1MmErci95M3VETDIrNTRTeG9oNVpnVGkxVGlxTThTeFFn?=
 =?utf-8?B?a1VMeG1RT1RodDM0M3o4ajg1ZVA5Tm1ydGh0bFZ5cTl5Njk2VEZZUE82UkdO?=
 =?utf-8?B?Z1hJM0NDR3lyb1YxUWgwcDJVTW5OZDVzaGJRLzR5NWxVWFRFQUE3cEM0bm9B?=
 =?utf-8?B?MnFVNXdJK215cFZ2ZWFLQ1ZWUTl0MjRnTngrNTRoQTFGSnRCZkdWeERBOTkv?=
 =?utf-8?B?RzkrcGd2VTMwRUx1SytJVnhQK0ZSQlhJQnhlZXZBMnZXbXZObmwydldmTHd4?=
 =?utf-8?B?eGNnb0hPWkpHdUVaeTlROVJrdFZYa3VzeHphZU5idm9vT0FpRmM4WmlrNzEz?=
 =?utf-8?B?M2RkdFRJaW9BWEdLaEE0ZitlaU50SjNiaTZVOG1YU2FtWmJrNG56VVRZRlFB?=
 =?utf-8?B?Z2swdG9iYmNPRHVjTHRiMDVoVlZ0eWNIVzhHYTJkSCtUcTBCK0c5Skk4bGNy?=
 =?utf-8?B?Wkd3akV5MTduTzhra0cvdzk4ZWIwMDZyVW9kQ1F4Q3lKQlZjSVkyMEtFWi9o?=
 =?utf-8?B?ZENBL1VzcWVsL2FwQTlqSUt6Z3o2VlEvZWY4MjBVRlZ4OTd5aW9Ha1VpQ0ly?=
 =?utf-8?B?aDlFR1JwSHh5R2dDTU9lelhQUzRCVWZvc1RrNFpXcXZMRnd5b016dnFvUGM3?=
 =?utf-8?B?SXFUYmxBRlhPZ1BDdlErdEtrZGNLQkdiM1E0UlVtZ3hqem10SVUvVFdkak1m?=
 =?utf-8?B?eU5MUFVWM2pxSm04OEFabXZSUkw3dytHMTRxNkRObUV1dWJJWlVOZUN5VkRI?=
 =?utf-8?B?TVJvdmZGak9pa2RlMExSQzRxanZFVkx1RklVMEJFZHFoMUZ4RVBIRXJUZHpa?=
 =?utf-8?B?S1Z4NTcxVmpNNmFpK09CS1pxejA5TW5od3FKekV3azZJY0w4a2twMXhLbWhm?=
 =?utf-8?B?QUVHVzk3R1RKc3ZVNVc1RllxazhpMTFrOW5vN25XVmdYbGU2TklPTmlTeis1?=
 =?utf-8?B?Zzh1Z3h1UUljNDJRQmJBTWl6dkZWT3RIY3grbHNKaElHQklZYlJvOVVtVVRZ?=
 =?utf-8?B?K2NKZHNNbUh2eThBWm05cGdVMVJ3TnhqdkM3YTJBcnlQSkZ2T1huZnM5M21M?=
 =?utf-8?B?V0RtTlRJZmE2ZlpoRWxiT2hEOFNDRFRnbWMyRFluVXRMUklycmZNVmk5bVZO?=
 =?utf-8?B?a2JsaGVxMWxaeEk4N0pqbDYwc3pPblVVSnE2THVDSC9Ua1p3UVVwTzNXNFJF?=
 =?utf-8?B?alJHR05vYU1MSTRYWkdROVRWSzdzWmZYREIvb3JtV2VGUFNrWG56M24yNjFs?=
 =?utf-8?B?SkthdDlMd3hZSXlvSFlBclhKZjljYy9ZWlpBVVdLeUk0dkk1bUwrcmtyTHpC?=
 =?utf-8?Q?1WX7+m969ayaZ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 04:00:15.8382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f34f07d6-7f19-4900-a255-08dc68ca0b1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A348.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5928

Hi Julien,

On 4/30/2024 1:34 AM, Julien Grall wrote:
> On 29/04/2024 04:36, Henry Wang wrote:
>> Hi Jan, Julien, Stefano,
>
> Hi Henry,
>
>> On 4/24/2024 2:05 PM, Jan Beulich wrote:
>>> On 24.04.2024 05:34, Henry Wang wrote:
>>>> --- a/xen/include/public/sysctl.h
>>>> +++ b/xen/include/public/sysctl.h
>>>> @@ -1197,7 +1197,9 @@ struct xen_sysctl_dt_overlay {
>>>>   #define XEN_SYSCTL_DT_OVERLAY_ADD                   1
>>>>   #define XEN_SYSCTL_DT_OVERLAY_REMOVE                2
>>>>       uint8_t overlay_op;                     /* IN: Add or remove. */
>>>> -    uint8_t pad[3];                         /* IN: Must be zero. */
>>>> +    bool domain_mapping;                    /* IN: True of False. */
>>>> +    uint8_t pad[2];                         /* IN: Must be zero. */
>>>> +    uint32_t domain_id;
>>>>   };
>>> If you merely re-purposed padding fields, all would be fine without
>>> bumping the interface version. Yet you don't, albeit for an unclear
>>> reason: Why uint32_t rather than domid_t? And on top of that - why a
>>> separate boolean when you could use e.g. DOMID_INVALID to indicate
>>> "no domain mapping"?
>>
>> I think both of your suggestion make great sense. I will follow the 
>> suggestion in v2.
>>
>>> That said - anything taking a domain ID is certainly suspicious in a
>>> sysctl. Judging from the description you really mean this to be a
>>> domctl. Anything else will require extra justification.
>>
>> I also think a domctl is better. I had a look at the history of the 
>> already merged series, it looks like in the first version of merged 
>> part 1 [1], the hypercall was implemented as the domctl in the 
>> beginning but later in v2 changed to sysctl. I think this makes sense 
>> as the scope of that time is just to make Xen aware of the device 
>> tree node via Xen device tree.
>>
>> However this is now a problem for the current part where the 
>> scope (and the end goal) is extended to assign the added device to 
>> Linux Dom0/DomU via device tree overlays. I am not sure which way is 
>> better, should we repurposing the sysctl to domctl or maybe add 
>> another domctl (I am worrying about the duplication because basically 
>> we need the same sysctl functionality but now with a domid in it)? 
>> What do you think?
>
> I am not entirely sure this is a good idea to try to add the device in 
> Xen and attach it to the guests at the same time. 
> Imagine the following situation:
>
> 1) Add and attach devices
> 2) The domain is rebooted
> 3) Detach and remove devices
>
> After step 2, you technically have a new domain. You could have also a 
> case where this is a completely different guest. So the flow would 
> look a little bit weird (you create the DT overlay with domain A but 
> remove with domain B).
>
> So, at the moment, it feels like the add/attach (resp detech/remove) 
> operations should happen separately.
>
> Can you clarify why you want to add devices to Xen and attach to a 
> guest within a single hypercall?

Sorry I don't know if there is any specific thoughts on the design of 
using a single hypercall to do both add devices to Xen device tree and 
assign the device to the guest. In fact seeing your above comments, I 
think separating these two functionality to two xl commands using 
separated hypercalls would indeed be a better idea. Thank you for the 
suggestion!

To make sure I understand correctly, would you mind confirming if below 
actions for v2 make sense to you? Thanks!
- Only use the XEN_SYSCTL_DT_OVERLAY_{ADD, REMOVE} sysctls to add/remove 
overlay to Xen device tree
- Introduce the xl dt-overlay attach <domid> command and respective 
domctls to do the device assignment for the overlay to domain.

Kind regards,
Henry

>
> Cheers,
>


