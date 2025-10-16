Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E06E7BE5AC3
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 00:26:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144770.1478036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9WPc-0004Wa-FH; Thu, 16 Oct 2025 22:25:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144770.1478036; Thu, 16 Oct 2025 22:25:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9WPc-0004Ta-CE; Thu, 16 Oct 2025 22:25:32 +0000
Received: by outflank-mailman (input) for mailman id 1144770;
 Thu, 16 Oct 2025 22:25:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V46/=4Z=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v9WPb-0004TU-1U
 for xen-devel@lists.xenproject.org; Thu, 16 Oct 2025 22:25:31 +0000
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [2a01:111:f403:c100::f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 049dcf9e-aadf-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 00:25:28 +0200 (CEST)
Received: from BLAPR05CA0008.namprd05.prod.outlook.com (2603:10b6:208:36e::11)
 by CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 22:25:25 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::35) by BLAPR05CA0008.outlook.office365.com
 (2603:10b6:208:36e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.6 via Frontend Transport; Thu,
 16 Oct 2025 22:25:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Thu, 16 Oct 2025 22:25:25 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 16 Oct
 2025 15:25:22 -0700
Received: from [172.29.145.48] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Oct 2025 15:25:22 -0700
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
X-Inumbo-ID: 049dcf9e-aadf-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5cHVpO22PQvEbPkxIS6QiN0eluB7mwKbsARimUF9d5xmOxl7nwPIda1Qs0X7FcOBKE3Phtow4L4A27/UxHupDWsHiw3fYg8uuL3b0nmQ7qL+8lRabZSrunTrzJvZHLzKD+/fQjNBS1zAiDPfyK6eBjLVhnpp9AtWLoRUgCkRhXMSjl/fAQK8pdq/dya8t+FRpIW4GqJs/SFpmLLq/SDwUhVF95VKfzBWJS2ANT8COjvCxq2kRJR6ZqhVItv+JSip5IyAgg3F5b28/7vSez5m4Ur7mgtoT1hIe7yiN3gjdVpiJ491gHhPlJrn3tQ47IzaYjqpTrsEC0QOwit+7OQ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3FMdvvl/y5XmTzmFHQ41vnWtANseuZf6tRbUKhBp9Y=;
 b=a7ewpoPH/lTe5igtzF1afiqwbDsjAVSDpCjhk/tNeE2CChHLhWyw6OoRVuvdCZkJuXNZESO4dKhCKz0fyBLpHKRlWc89PDFUqZW5LYK/1t6LaFWHr/gpHiY/M0R4QUTIojZcip90bTWBgyFYWIGzNrw8SguemwNXeEaucKR1R414b0/EgN4H/L9/FOPxc4Y1ZPTKU+6C0b3akTydZEyq2qKfzNkJD9BKTfXPNWJwn+A9yndWisbQYI1cAwn/J8x4z45g8eYH9FG23PEpRQ6SZ/PHbE0wGnqAlcGilF6aHgCO5vBMmjQ0NdlyEW8jfgSXKF09/GtC6Nrti+h5Ow9ENQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3FMdvvl/y5XmTzmFHQ41vnWtANseuZf6tRbUKhBp9Y=;
 b=vXj/1zL2u4YDgbH5bHCyZJaVqAj4EBxsm++RrGswCVuPafoJB9cLHXxfirsiLepGFwBg1N/k1tW/T/8EVcoBbfL8A2YfTGTneSwxnPKcU60q3rABSW/kpR4HXyCRRLLWSXqYeg/hfB3PWIN8KOmyk6bKR8Sa85GM6z6OYFd+rPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <72ed3dd7-8476-42a0-adab-726925b4df28@amd.com>
Date: Thu, 16 Oct 2025 18:07:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 v3 1/2] x86/apic: Avoid infinite loop in
 io_apic_level_ack_pending()
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, <xen-devel@lists.xenproject.org>
References: <20251015210454.95381-1-jason.andryuk@amd.com>
 <20251015210454.95381-2-jason.andryuk@amd.com>
 <6cf0b252-05ef-409f-876d-2016f0cdc088@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6cf0b252-05ef-409f-876d-2016f0cdc088@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|CH2PR12MB4216:EE_
X-MS-Office365-Filtering-Correlation-Id: 478ba9a2-e1ac-4893-b5e3-08de0d02e70a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mm1YVlB1aWR4NFlhaHZVL0pMRHRiOFZHL3FaU09YZWJIMndhL3VRaEFTcnd0?=
 =?utf-8?B?cjkvdXFSS3Y1eE9oYnp5azFYWTFXMk95bjJQaEJNd3R4U3VEZUh1bFNKa3Vk?=
 =?utf-8?B?RkN6bEZRcEUzR0cxdDJUaTVRallPS0ZBK1d3Ukx1MldRYUhFSlduQWlOMUpi?=
 =?utf-8?B?dEVwTzlxUkNTc2IwVkUxUkQwbGswVWlDUjZPSGNYL0YyUjNGd0hzdVdNZ0lk?=
 =?utf-8?B?VW94WjlCZDU4THFIVkdNMFE1YjNMUE8vRGpzU3F1NGRobUhQOEJLano3VFo0?=
 =?utf-8?B?aHkzdmdITFVaeUpZYWdkUTF6Tkl5OUdweUFBV3U4VU9VMEpyd2QzSmdxcFVo?=
 =?utf-8?B?ZjlOQUZNWm0zbHhxU09WcFhHdzRvRTMrM3dSam9ya3NVWkVCMVBmZmRoTXJD?=
 =?utf-8?B?SW5KZTFYUUJXWUEyU2FrNDB3N2FUam9RM3JHcmp0ZUZTaHRkMVBsaldHYUJE?=
 =?utf-8?B?eFNjOTNncWxRTVJWbTRtT2p5V1pPQVcyS1VvZkhvSnZEK0dlQXlkVzdEQlpo?=
 =?utf-8?B?UW1WT01lK0JTWXQzaHNUTTBQaVkrYU9nc3RXSEVJM2NVMmFOL2hsaTdXcFA5?=
 =?utf-8?B?ZkprMXRkOERTa0IwdVpIdFJvZkY3SVZPVzR5bkRvM0lKQ2YrQUJIMVVyZjRr?=
 =?utf-8?B?TWJ4TFBBd2Z6TTA0aU1WWkdWRVRxVlJtWFBYSmF4RHFJRXNGQzJJakFiTjJk?=
 =?utf-8?B?dUhubTU4UVA5V3A0MWhRSjVNZ25sN0lCamtIQ0FJaVpzV2labHlTUElGekJC?=
 =?utf-8?B?QjhTSXMvK0tCaXhERlJ0L0IzV0FOQ0NlcDZTR3QvRWEyMXczSThXbzdDUGJn?=
 =?utf-8?B?NjJibXdpSEJsUnJQUVN6OWxjaVYvcmE2WVNuekxaTitlUXB5N2V3d3NBdnhJ?=
 =?utf-8?B?NmNPTis1bFRBUk0zUG1RZ0pMUEpockEwa3NGdmlQMFpJaFZvQWhuUjdLMlYw?=
 =?utf-8?B?OVczb3YxaXc2Mkw2M1ExbzVFNFV2cTVMeENGaG1tR04zRFBEZUhEVCtnS1Ra?=
 =?utf-8?B?RUVQTUcwU3FuNWpHa09Yd0dLOGV2MUl4RGlncnJFYzVPc0ZRajNQeHY1dWdD?=
 =?utf-8?B?N2V1dCtqQjl2TU4yNWJyRXlGSnVFdmVZSjAvc0s3NUt3R3FHZnFTMGJHMG9h?=
 =?utf-8?B?SHhqbEhWR2QrM01UUEJYUGQ1ci9WSTZRWWJGeVE1c3k5ZnR4aUx4UzkvQllX?=
 =?utf-8?B?N1ZEZ05JaC9GQmVHaTdzdkYxclRJR0dEbkdGTU5uUXpCR1dldFdqa3VqcHN2?=
 =?utf-8?B?MGx6R045QWVkWi80QVk2dklrbFBKL2pUekpISldsc2p0c29WNWYrVS9Fd1Nm?=
 =?utf-8?B?VmhqM1B2TEVicG02U3ZPcTA1K0s2TVFEcWM5MzNFK2djN2ltQ3cvTmtkRnZX?=
 =?utf-8?B?Z3VmMWs3Zkw1OHBkWnJsNGREcHdlR0lGbUhobUkzRkNQSUNhVENhZWQxZm00?=
 =?utf-8?B?WGZmVTdCNnZNUVhLYXNHQUYvSVgzRmU4eDZxSnY1VnpxekdMYTQvYTZrelkw?=
 =?utf-8?B?bGY0aTd6WmVtTWZiU1VURFg1Z21wZi9UbXNzMXFsZmlOUFp4M1JLM1czKy90?=
 =?utf-8?B?NTBJOEMwOUZycE52NDMrb3hCMWF2ZkwrYVNSMTkrRDBZTXM4WUZ6L3QwVEFr?=
 =?utf-8?B?dFFyVmRkUCs3YXdpb01JTWlSK1FtZEVKTFZtRXZMNTlvOC9qQTVWcHFSMTNl?=
 =?utf-8?B?N0cwVlhlVHl4VFF1M0RIUm9yMzlodXJQTmJXcEhrcThZcEFTazNxSG5TUGp1?=
 =?utf-8?B?NW5qdlBBS2YwZE4rdEpGUDNNZUgyRkV6ZWp1VXRFR3lUanVpbERjMUJ6VmhP?=
 =?utf-8?B?TzRaQlkzN0tsQnBkcXhNZmg2MTdNZVo0akRPdjZoRzhLZFk5c1JUUDN4SDZX?=
 =?utf-8?B?SFVTSXU0OVRsTW9IeG9yajAxNm9BSVBTSzI4MU9BZ2Ftbi9jL2pHNWV0UGQ5?=
 =?utf-8?B?YjVHVWZLTmkrazQ3RDNrcmEwWXhRU1pUL0dkQmtIaUFxd2FDUmxVOHNlM2RU?=
 =?utf-8?B?eWlLbDhJVkcrMVp6OTlSbVAzQkxzZTNmMS81eEcwbisrenlSbnBremQ2bitC?=
 =?utf-8?B?ZVA0Z0FOdEp5VEZ3dUZyVkE3UnpCYWFmbHdkTlVpTUFPdW85cUJ1SVB0ZjBY?=
 =?utf-8?Q?DDEA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 22:25:25.0081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 478ba9a2-e1ac-4893-b5e3-08de0d02e70a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4216

On 2025-10-16 02:47, Jan Beulich wrote:
> On 15.10.2025 23:04, Jason Andryuk wrote:
>> io_apic_level_ack_pending() will end up in an infinite loop if
>> entry->pin == -1.  entry does not change, so it will keep reading -1.
>>
>> Convert to a proper for loop so that continue works.  Add a new helper,
>> next_entry(), to handle advancing to the next irq_pin_list entry.
>>
>> Noticed during code inspection.  The infinite loop was not observed.
>>
>> Fixes: f821102450a1 ("x86: IRQ Migration logic enhancement.")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>> v3:
>> const on next_entry() parameter
>> Remove spaces inside for loop braces
>> Remove inner if (!entry) check
>> Expand commit message to state noticed during code inspection
>>
>> v2:
>> continue (not break) for pin == -1.
>>
>> I added the next_entry() helper since putting the expression in the for
>> loop is a little cluttered.  The helper can also be re-used for other
>> instances within the file.
>> ---
>>   xen/arch/x86/io_apic.c | 17 +++++++++--------
>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
>> index c384f10c1b..c35d611ecf 100644
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -1586,20 +1586,24 @@ static int __init cf_check setup_ioapic_ack(const char *s)
>>   }
>>   custom_param("ioapic_ack", setup_ioapic_ack);
>>   
>> +static struct irq_pin_list *next_entry(const struct irq_pin_list *entry)
>> +{
>> +    if ( !entry->next )
>> +        return NULL;
>> +
>> +    return irq_2_pin + entry->next;
>> +}
> 
> When replying to the v2 thread I hadn't spotted yet that a v3 was already
> posted. As indicated, imo this name to too generic (now). I'd be happy to
> make adjustments while committing, as long as we can agree on some less
> generic name.

pin_list_next() works for me.

Thanks,
Jason

