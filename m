Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A13B09596
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 22:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047436.1417939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucV2B-0004Od-UM; Thu, 17 Jul 2025 20:16:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047436.1417939; Thu, 17 Jul 2025 20:16:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucV2B-0004M4-Q2; Thu, 17 Jul 2025 20:16:51 +0000
Received: by outflank-mailman (input) for mailman id 1047436;
 Thu, 17 Jul 2025 20:16:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTIS=Z6=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ucV29-0004Ls-JF
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 20:16:49 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2414::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f669ed73-634a-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 22:16:47 +0200 (CEST)
Received: from SJ0PR03CA0002.namprd03.prod.outlook.com (2603:10b6:a03:33a::7)
 by DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Thu, 17 Jul
 2025 20:16:43 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::ac) by SJ0PR03CA0002.outlook.office365.com
 (2603:10b6:a03:33a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Thu,
 17 Jul 2025 20:16:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Thu, 17 Jul 2025 20:16:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 15:16:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Jul
 2025 15:16:42 -0500
Received: from [172.19.134.125] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Jul 2025 15:16:41 -0500
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
X-Inumbo-ID: f669ed73-634a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVN0dp9pAasriA2PsmiVcb8mW4VC8ju74vlY65KJ7f7v28nBo5UVwYqlJdrJMXXSBLGyf8eqYij7K5ajCKTbdTWPz5YvDBdMUddf5CcVhepUvezR1RPcbvZ0d3SUR9ldDcQf2GK4TdCweoKaqyujMMWzZDJCr8VYZLFcU8Asym16oy1OU17FcGdDNPo4MQEHuwY/krSlGejhf5imtOX+tNkBJA9m5uR25xyh/f3bK/W8Ou6lRysDPQVqFlFBpLmuid3yd+KDhgy6j9capWrq+aD4GwB2+pQWo9gAG7wR8ozAoUe0erUEaikJ/uoTOxgky7Y5CfEr/LsGIqJ7xa40xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7zyvjFcATpZv3Jfvj6QCtALUjPUjkOZPlRV/F7yhsQ8=;
 b=IS5TIBXyoOsmK1QSQ9xoiucJbVXLRhYrqhLMOWQb9FA6EVL+Rx/b6EDRx5XqoIvxINLUlBG3nvN0gDbhTLyR7GrlD4PtLCxdBZvkZ/7qanTNmN+WHpxcWvjhZVXPWoC5N1xkEJHT4MoyZnRdLyOCnXUioonhoOoVtc0EF0ythtTExDyRyaamwvI5kRKITvUBGMNCsmI9XiutLlXTf+R8ppziQGv0Zb5eXXfHIOWS30yE8A6TyJSVotmI/kcqm4F75WdNulOqDT2+OSfXmmSLgKpNinyBqrIgTRQsNq5T1hRyRFb76+NT9dhHAXurjBb/+MmIIPoPdfvh3KM85mSEdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7zyvjFcATpZv3Jfvj6QCtALUjPUjkOZPlRV/F7yhsQ8=;
 b=deT6mWHJFYODfKBcbI77+G5YB8xSPXVPHQYbymP1xLkxn+O8KspGDLlVN4Xc4AhfgEgaheMc6OV7Kdkrw4d+Z4pKryscJEq7KTe8S15SQgbMcmWaLexOUlTWfkUgRABJ1gLW1RyF7denoToRkOBYK1sjB4KCIV7HfmxyzFgaxp0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f03ae1ad-629d-4cb7-ad85-7862dde939a4@amd.com>
Date: Thu, 17 Jul 2025 16:16:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/17] xen: Add capabilities to get_domain_state
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
 <20250716211504.291104-12-jason.andryuk@amd.com>
 <13f6ce53-fdb9-469c-a2fd-a93280d55c97@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <13f6ce53-fdb9-469c-a2fd-a93280d55c97@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: e5a946e8-f2af-4347-2a62-08ddc56ed8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDA1bnExTnBEWFhWWWxLRWExZG1WTGhMSXBVekRpYXE0U3RyZG4xU012NkFP?=
 =?utf-8?B?aTFxaTRNUmVYK2V0SVQyV1A1VUxSdHRnOHVmaFpzblYvbjU0ZTZ5OXhCNlZW?=
 =?utf-8?B?KytnaHR5a2N5M1RjdTFrZElJOUZUNG40K08zOHN5OWN4MXM0M2d6V2lPa1hx?=
 =?utf-8?B?VjJFWUY3RVFsYkhXTFRiaGNxM2IwUVRLVzBacGpZU2p2RHoxdWp4am1oY0hz?=
 =?utf-8?B?NUIwNUZGQ3BHNitYSFZ2RUF2eXp0cXRXU21nTGdyNFl2TUZuNVlVU0lHQW5U?=
 =?utf-8?B?c0RWcnREbmtwMThoTXo4SWhhcy9kRkx6S1Z4QmVEVXAvMURUL0VCYTliN3pK?=
 =?utf-8?B?VHkvU3ZLSVliYmg3T1dMQUdZQnBQcWI2VE9WSFJEbWNDd2NEQS8wc0c0TTNC?=
 =?utf-8?B?ZHUxUUhiS015N2VlQzFiZVFKU3ZVRXVhRnhJOFJnQTdRbDAwUkpDVHpPSUxX?=
 =?utf-8?B?QUN4cDhCYWxmSlU4NzRMZm5mTzZiMW41bTIzTzBaODkyTzdxS2QxQVR4U3Vp?=
 =?utf-8?B?NkIxZXFueWwrb0VWbENZN1NvY3R0a0d4K2R4L3BFeEhZZUdSZUhWaUdmb2Vl?=
 =?utf-8?B?UGZoY3QxejgwbG15ZFNKYXl3U05iaFZPVDNOamZYUGpuMHlOVGtRdnBhdkxW?=
 =?utf-8?B?MHAreEJCenJ1eTQzVHZLYlZ6SndveW9wUG1sL3hrNjgyM2kzQkNhak0wYWZh?=
 =?utf-8?B?SDEreS9JYWJhSDc3Q3BvT1ZCMDVha2pQNHUycmg4eGVlSEpKYmRvMzd4eVpW?=
 =?utf-8?B?ajlZSUVPaTVRM1ZLNUJvVkNkT2oySkprNnYwaGVTUkRLRGQ1akdjNGJWSWhG?=
 =?utf-8?B?RzVVejVMWHdUWThSU2ZRT2NmR3YxSE1VTG9VeXJOUXl4SmtPSUVkSjBBZVly?=
 =?utf-8?B?bVdGcVovcVV4TjJpSUltTFRJS2F2QzduK2szRW5qWXF0REdoZHZJTWJrWG5Q?=
 =?utf-8?B?dXByQ2pDRVRjelVML1dyUHRZWEk3c2hCMllJRGRTekdrU0pLQW0vQXZLU3JX?=
 =?utf-8?B?TnJsOTM1S1QwSmljRFVpQVJIS3dYbHRmS3M2Vml4SnVHbkhXRXJTM3NUc05m?=
 =?utf-8?B?UmFjbm9nd3lpeFRFTlBKUGNZTWFXZ2o5cXUyb0tzRzZZYm9Pb3JCNU1tOHEx?=
 =?utf-8?B?dDhZR1RGWGdZb0h1TE91ZjVjTHVOVGZKVk5SWlh4cUNFaExubWpDMDNieGZx?=
 =?utf-8?B?UHo1dHlQWW1tQmEzaTFjVG1EQ3FuY2Z3WnduV1dYYU5tNjJ6VHJIOUZndWh3?=
 =?utf-8?B?OFBjL2NkdU5lYnFRWHQzZVVpb1JXeWh6akIxbE5pUGhGZk92S1hHVXFlMjRT?=
 =?utf-8?B?NzUzc3JkZVpXbW8yRTNXSy9EbWo3RmJYNVFUN2R5SzM3VjBsYktKbUF6NzNl?=
 =?utf-8?B?WmE3UkIvdVViOEdoUlIrNEhaMDdsRDBHNXdoWFM2bGdMWTZsb2lXR2k1UDZk?=
 =?utf-8?B?SFBoTzRtVFJBWDh1MWZwR2pKTCtnNVhQQmUrV2FLOEY3VDBSQU5ra1lrQys4?=
 =?utf-8?B?azQ2ZEdYbnlZaExWRUJzTTlhWitES04rK0pFTG5DYTkxS3RyeHd1YnkwR0JW?=
 =?utf-8?B?TnpKSkEwOFp5STZ1Wi93amdqdEpsWGg4UTRCUTRxUU1aejBUQXRLOUJyQmI4?=
 =?utf-8?B?UElpckg2c0xkUkh1M0J3TXpNNm5yYzdsRjY4eG8veEdGdnJjU3E2LzJ6NW81?=
 =?utf-8?B?bUtJbU9ncE1MTkF4TDhBWHpRYjZlNHRwMklqUXo0WmIwRlozb3g1MWhkR2I1?=
 =?utf-8?B?YzhaeUJGVWlCais4eFNJVDYrdm9Yc3h0RG9LR3VWVnpJa0Q5dXEyRkpjbHN2?=
 =?utf-8?B?NzE4OVppckorVEMvR1VKdjhOZzI3cVBJQXNxZ1JNUDlkZEtnQU9BM2xOWWl6?=
 =?utf-8?B?b20zelJHeHZReWF5OEV1Q0luQ1JMb2RMSmY5WnhqTkF1L1NUMTZ5M3MvdW5P?=
 =?utf-8?B?bUFtZmExTVAvTG13d3d4K0FST2dkOFhkcFdzOERpSlRnN3lpeG5yMm8rR1hD?=
 =?utf-8?B?T0xQYks4R2h0R0hKV3dKandwWUVIZ2JmQWxNaVB1UHdXbnBOUjFYV0JXbTEr?=
 =?utf-8?Q?eohYm8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 20:16:42.9011
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a946e8-f2af-4347-2a62-08ddc56ed8be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741

On 2025-07-17 02:24, Juergen Gross wrote:
> On 16.07.25 23:14, Jason Andryuk wrote:
>> Expose a domain's capabilities - control, hardware or xenstore - through
>> stable get domain state hypercall.
>>
>> The xenstore domain can use this information to assign appropriate
>> permissions on connections.
>>
>> Repurpose the 16bit pad field for this purpose.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   xen/common/domain.c         | 8 +++++++-
>>   xen/include/public/domctl.h | 7 +++++--
>>   2 files changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/common/domain.c b/xen/common/domain.c
>> index c347de4335..8b0151a8f7 100644
>> --- a/xen/common/domain.c
>> +++ b/xen/common/domain.c
>> @@ -195,6 +195,12 @@ static void set_domain_state_info(struct 
>> xen_domctl_get_domain_state *info,
>>           info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
>>       if ( d->is_dying == DOMDYING_dead )
>>           info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DEAD;

I'll add:

+
+    info->caps = 0

here, to ensure all the caps bits start off cleared.

>> +    if ( is_control_domain(d) )
>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL;
>> +    if ( is_hardware_domain(d) )
>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE;
>> +    if ( is_xenstore_domain(d) )
>> +        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE;
>>       info->unique_id = d->unique_id;
>>   }

>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>> index f1f6f96bc2..879343b21d 100644
>> --- a/xen/include/public/domctl.h
>> +++ b/xen/include/public/domctl.h
>> @@ -1269,8 +1269,11 @@ struct xen_domctl_get_domain_state {
>>   #define XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN  0x0002  /* Shutdown 
>> finished. */
>>   #define XEN_DOMCTL_GETDOMSTATE_STATE_DYING     0x0004  /* Domain 
>> dying. */
>>   #define XEN_DOMCTL_GETDOMSTATE_STATE_DEAD      0x0008  /* Domain 
>> dead. */
>> -    uint16_t pad0;           /* Must be 0 on input, returned as 0. */
>> -    uint32_t pad1;           /* Must be 0 on input, returned as 0. */
>> +    uint16_t caps;           /* Must be 0 on input, returned as 0. */
> 
> I'd drop the "returned as 0" in the comment. :-)

:)

I'll drop the whole comment since the input value is not checked.

> With that fixed:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Does this stand with the above changes?

Thanks,
Jason

