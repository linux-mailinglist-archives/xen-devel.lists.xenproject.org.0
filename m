Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0B9BE5E2E
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 02:30:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144822.1478065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9YL3-0003PZ-FU; Fri, 17 Oct 2025 00:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144822.1478065; Fri, 17 Oct 2025 00:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9YL3-0003ND-CW; Fri, 17 Oct 2025 00:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1144822;
 Fri, 17 Oct 2025 00:28:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E5B7=42=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v9YL1-0003Mz-U4
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 00:28:56 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42292212-aaf0-11f0-9d15-b5c5bf9af7f9;
 Fri, 17 Oct 2025 02:28:53 +0200 (CEST)
Received: from BN9PR03CA0711.namprd03.prod.outlook.com (2603:10b6:408:ef::26)
 by IA0PR12MB7628.namprd12.prod.outlook.com (2603:10b6:208:436::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 00:28:48 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:ef:cafe::c9) by BN9PR03CA0711.outlook.office365.com
 (2603:10b6:408:ef::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 00:28:48 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Fri, 17 Oct 2025 00:28:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 16 Oct
 2025 17:28:44 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 16 Oct
 2025 19:28:44 -0500
Received: from [172.29.145.48] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 16 Oct 2025 17:28:44 -0700
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
X-Inumbo-ID: 42292212-aaf0-11f0-9d15-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2tGFVGz5k4Zs5QCUGXtkKFNXZUBY4C/T+1LWz4ae7YQY98wZs2KPuSVcj2207mqa3MqJI4i6MPpOp6j3MgzqsuO5kDYE+2X5KOwxCGCKGuucnrMi4lEBWqq9crMOys8A/UK6f4KJ5IiV1ZUMTKA9qVKkGR815N5KexqNt8+2/0+NqRAMHmsqgliyhxBH6taI2R2TdIWJpPIMQkfZFKzbxCw8UZCzM5GpLCZhPKsqKHadr25946FjMtcu33pKqzYQUvKOcjFsKjGJ0PSX3QKqjGgb0S0Gdata91pF7+YYiTXG/IOpfC6ILME/wbY2iSfGQO5PLKx2wffgXPCzWAsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aL4lpS9pti12mMfEZKIJ14I3hWL8n8ML/yS5P8FT0Ig=;
 b=EK/6nRFgCzKy/5KegKEsUXJ6h6wSmWlCd7odRhIdF0E/4P3yk5eM2P3ZDc7b+JuUMVhOA4VnC50MNUvpHxqiqLC1V8cjQjy10w8c2wS95MEe16ReKbbudWsEi/SJzV6/wrEuBiVgRve5vvcWylZDTR2+mpOGkWsM/7eWE0MvdVMOWsUh1qZqbNfVXi50fmjkoUrjefDVpAG8ubcPse3wvQti0MOSbh43Ce0d8Wmd6JSef4TxHMGlewwbA2ydOTAnmv2bxLgS6dsBcPPMSYJ2Jrc4AC75+aWkovA4haeX5WjggqcD72pNJ3TRbn18kPA3ZYIgdXDXM2ZuXBGCMd0FSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL4lpS9pti12mMfEZKIJ14I3hWL8n8ML/yS5P8FT0Ig=;
 b=YWgeNyPN6khK8BH1ejnUYUMDPx/8jdT8g6CXY3Rb2K+Cl+It0QvPO82BIVIk1LZhKInEe7JeBQrh9Ky8L533XMZe3fhXxLXfT6iT9ShVmOLmlYrDR3tMA1iB6vX3zKEmAxYY/6UuSz8/TMjJAOQeNDMuQstkOTJkApBczDBDS5M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <7db4f31e-1641-4105-8b1b-4884505f8559@amd.com>
Date: Thu, 16 Oct 2025 20:28:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 v3 2/2] x86/io_apic: Use next_entry() in loops
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20251015210454.95381-1-jason.andryuk@amd.com>
 <20251015210454.95381-3-jason.andryuk@amd.com>
 <61773baa-d577-4cf7-8d1a-819b79bd1c7d@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <61773baa-d577-4cf7-8d1a-819b79bd1c7d@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|IA0PR12MB7628:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d6cdf58-127a-4dda-b1e9-08de0d142392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RzF0Nm1hVmc4elY0dEFVZ0UzbmtIOXRjdVIwUVg3RjFoV0o5dEZaWnhqT3NZ?=
 =?utf-8?B?YThNRkNPYnNVNUpLNmN5OWJjZjYwV0pxb2pUSUo2OHF1MmQzWmdjeTZnYXNW?=
 =?utf-8?B?YmtiUU5sWk1LZmNmSzh2SldIc3N1WmtTc0p0SFJHaEdESURmVnFXakFhSUM2?=
 =?utf-8?B?R0hOclZheTF4emZndkkvdXZJWGZ4RHU0MXN5ZUZtSmltU3ZaM0hyMGZUbXQr?=
 =?utf-8?B?RWFEZTVybmFWQ0MzeGoxN0ZPK0kzZkpYNkk5eFRvcEF2NzNPOVIzbHpoTzFL?=
 =?utf-8?B?THNkVXptd1RpYVByYkNRL3R5N29GWEpuaHBNS014dmUybUtCK09LVTRDdU5D?=
 =?utf-8?B?c0trTUd3Y3pQVDQzQVVpa0FFRjVLVlBMYmhPQ0YyTkE0b3V5RmluWE1SZnd0?=
 =?utf-8?B?OFphNHNJcFR6V1JiWVpXN1RYQWFYalhJKzdyeFUwTXNCOHRTdFFxTnZwQTR4?=
 =?utf-8?B?eW9oMGg3c0ltSCtsbno1NVE3MmVnTGtuaVd0S2taYVJtcllTMUt1aUg3am5q?=
 =?utf-8?B?Q1dlWWI4enJIY25YZEJRVnY5bUpsQ2ZBZFk4Nmd0cmd0MEI4cUVieW1GcmlQ?=
 =?utf-8?B?QnF0YW5aRmNqaVNlK3EvcEZYam5SY3ErTW1lWjQ1Yk1HRVZ4RjJ6Um96Vk51?=
 =?utf-8?B?YitTT2FtRVVCakVzcUJlOTh0cDNRMk1tRVNFL3ZwVXJtZmxUcGZORHBKMVlp?=
 =?utf-8?B?NHFGVFdHY3NNVW02b3Z4QjJwUGJ6dEUrb2k0amRlOWQzV1RYWS91Qm9QL25I?=
 =?utf-8?B?bDRXdTJoQkp4NVlOVWxCdDZJZnN5UWtJL1QrQUJpZFJ6Tnh4Ny84MUVUVXh2?=
 =?utf-8?B?a1NoTUdxcEc1ZjFrWFlvWDJvQUZNbXZwL3RYdUoydXdMcGI5UUVtdjZHSVFa?=
 =?utf-8?B?d3N0WkFnZUcza3k1NnVFcVo2MEdMQ3FWT0EwUHZtaWtnTEdHZ1VCZDV4blhJ?=
 =?utf-8?B?UGhqMVZOemxHb0tzaUl1cldGZ1p0WjJHdlRWMEtjZU5TMGlHbk1UNHdYU2VS?=
 =?utf-8?B?NHFSekRENE9yaUdJd0pkVHl6bm41NmhpRzVNczlSdktSWUszMGJQNzBlNHJV?=
 =?utf-8?B?L0oxaGJZdHlHMXIydytuNmdOTTBLeVN6SndLZkR4Mk5xTkVZUWNJL2lCRnhv?=
 =?utf-8?B?N25OYnhON2VrWTR5cUJvcGovSzFHZjVET2N5eVMvNHdEQzRRWU1GT051Sklx?=
 =?utf-8?B?N3RSOHkxdFFHbVpLNFRSMTFYSkxkaW5Ic3hUSVA5NkJnTHlaTm5PM25BbnhB?=
 =?utf-8?B?RlpTTjBmeE5ZN3RJMXlDbDFvYUVOZ0EvQ3NnVWUyOXVCek1LNjNqWkorNzBs?=
 =?utf-8?B?NlBTR242QnZ1K000M3Exa2RkdURDeWtFN2ZyYUdtQ25VWksrODJLTXlTRHVU?=
 =?utf-8?B?Y3NOZU9lTXVRcTBkL3ZpMXY4WUEzSERYdmJRTGQ5T3RqV0FyRHVuU0M5ay9v?=
 =?utf-8?B?RUtUcUtQYjZqQzhDdVVVT0lDTDAwaXJpSG51bUI0YzRVN3BycnV3SkxURDFX?=
 =?utf-8?B?S21pYmZudGlLdTh4YmU2YVR1ekxlVVRlNVRiZm8ybW56QXhiWjV1M1IvT3Nz?=
 =?utf-8?B?Nk9PZXQ3QXJXdTV4UGdiMldXb0EwMWpIenl5ODdPNzBndWFFWTIxc0cwemkr?=
 =?utf-8?B?REJVak9BRUhiZFVDWGR3ZzF5UWNjbE5sNE96L1A5ZXE3TlovUnNhZTZvd1Ri?=
 =?utf-8?B?U3ZDTjJhSXB6d0kwbWYxZ0dmVmIzOTRpeUlSWFJqL1E5ejc1TjZtRDlxY1Fa?=
 =?utf-8?B?ampIVDZnYURKQ2lLVzJhNHFvMHVWSnFHYnEzSy9LMHZpdkRpbU4wZ09IQWda?=
 =?utf-8?B?T0lIaDNQc0QrbUMwV2R3ZnRER1VSWms0U2x6QnZ4WlJ3WXliN2FZV0ZQNGhv?=
 =?utf-8?B?Y2dabkhPZ1J0WUZIblhmcVpaUlQyUFpQZ1JzbWJMMXkreEpFWDN4WnN3c2NJ?=
 =?utf-8?B?N1JqSzRIWFc0RFlYakxMblA0VkV0dVdselpZTStYaTdUT1dwY3JCaFpVQ0Jm?=
 =?utf-8?B?K1RHQmkxL0ErL0liVkxaaHRUSHBYOVNEKy9KLzRUaFZhd2lpRlozNzcvUjBV?=
 =?utf-8?B?UUxNZjhiKytiakIyOEpJM0J1MWFmSGhCbmh1UFpCODBnRUdmZTRGbGZJbktZ?=
 =?utf-8?Q?WCng=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 00:28:48.0084
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6cdf58-127a-4dda-b1e9-08de0d142392
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7628

On 2025-10-16 02:53, Jan Beulich wrote:
> On 15.10.2025 23:04, Jason Andryuk wrote:
>> io_apic.c has a lot of ad-hoc for(;;) and while(1) loops for iterating
>> over irq_pin_list entries.  Replace them with a standardized
>> for loop using next_entry() to advance entry.
>>
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   xen/arch/x86/io_apic.c | 49 ++++++++++++------------------------------
>>   1 file changed, 14 insertions(+), 35 deletions(-)
>>
>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
>> index c35d611ecf..73b48a9cb8 100644
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -191,6 +191,14 @@ static void remove_pin_from_irq(unsigned int irq, int apic, int pin)
>>       irq_2_pin_free_entry = entry - irq_2_pin;
>>   }
>>   
>> +static struct irq_pin_list *next_entry(const struct irq_pin_list *entry)
>> +{
>> +    if ( !entry->next )
>> +        return NULL;
>> +
>> +    return irq_2_pin + entry->next;
>> +}
> 
> Preferably with the function put in its final place right in patch 1:
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
>> @@ -482,7 +487,7 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
>>   {
>>       struct irq_pin_list *entry = irq_2_pin + irq;
>>   
>> -    for (;;) {
>> +    for (; entry; entry = next_entry(entry)) {
>>           unsigned int pin = entry->pin;
>>           struct IO_APIC_route_entry rte;
>>   
>> @@ -492,9 +497,6 @@ static void modify_IO_APIC_irq(unsigned int irq, unsigned int enable,
>>           rte.raw &= ~(uint64_t)disable;
>>           rte.raw |= enable;
>>           __ioapic_write_entry(entry->apic, pin, false, rte);
>> -        if (!entry->next)
>> -            break;
>> -        entry = irq_2_pin + entry->next;
>>       }
>>   }
> 
> I notice that within here there's also a "break" upon ->pin being -1.
> Seeing that io_apic_level_ack_pending() has continue there, I think we
> will want to be consistent. Which way isn't quite clear to me (yet).

Right.  I don't know.  It seems like ->pin == -1 indicates an unused 
entry, so stopping in the case makes sense.  I've wondered if 
io_apic_level_ack_pending() continues just in case an entry->next points 
to another pin to ack.  i.e. it's not the expected case, but it also 
might help if entry->next points to something valid.

Regards,
Jason

