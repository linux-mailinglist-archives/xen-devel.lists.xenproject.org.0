Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A650A8B693B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 05:51:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714480.1115735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1eVv-0007c3-4U; Tue, 30 Apr 2024 03:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714480.1115735; Tue, 30 Apr 2024 03:50:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1eVv-0007aE-0W; Tue, 30 Apr 2024 03:50:43 +0000
Received: by outflank-mailman (input) for mailman id 714480;
 Tue, 30 Apr 2024 03:50:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H2uD=MD=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s1eVt-0007a8-G8
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 03:50:41 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2405::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf1e6bb3-06a4-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 05:50:39 +0200 (CEST)
Received: from BL1P222CA0027.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::32)
 by SN7PR12MB7912.namprd12.prod.outlook.com (2603:10b6:806:341::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Tue, 30 Apr
 2024 03:50:33 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:2c7:cafe::84) by BL1P222CA0027.outlook.office365.com
 (2603:10b6:208:2c7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35 via Frontend
 Transport; Tue, 30 Apr 2024 03:50:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Tue, 30 Apr 2024 03:50:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 29 Apr
 2024 22:50:32 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 29 Apr 2024 22:50:30 -0500
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
X-Inumbo-ID: cf1e6bb3-06a4-11ef-909b-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWmFWPGcEw14qjmiwg2pG0SPVhRenN6tg93oIDVyJHw4CLf9KCJMN0zTezeEdAHs2kSFn+ah/gm6HK4ioh814z5tMXjgtnmTBl+yFurdc7CD4LvGtyCpzxcT9pb5C8Njm6eGRnYyHjr+mC9xZTFV0MNKD+P6mpbW1BtppA47qaBefskuktK83Fpe42j1/Va3+SOqX5PC/rxdYvbQrYxCEfyuCYGudUvHTAu37dCcAw4xvn7NZYLhBuKVGdjYUWtELb5W/EpjpGnhvaHoqQLPeyWPW5S6AHd3Zd1fDi6Wni4+SEUCuSFifB783mj8gp0I+skzZiyUowQPL9qBrOHfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5NKdNeaLKDz7p17nJHZ4u5oxkSxXzae8uOP+VsjtOiw=;
 b=c4xuxQhp2+IvRbFGiN3j5bVw8/heHB53zND+0UztUy86RAGgyrB82DO2mzKuzMUckNvsFetEPyway3UJErG7tHy7FsPseXu3pBnMYCMKYrLJVc+ZzRzNDRDIM97hOkgLg1zRlZObZzchnFdvJqTBu+jZSjQQdXe613nBLa3YLJjU1JKnxeyXfbM8ZtR54/6D8cs4SnM1ciJYTN2+utZ/7kjSLhEAqslUrEo+151mixbE/Xl9BkJEk/Od2z7a5/wcpn1qmNGin/4ZrUDwDjYFbrQRP3WQKQZhWSiOiWjqX4/ny8kFasC2vqP+Mfq2n7o8ioU9j7Bnjm0P0EiwhvDjrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5NKdNeaLKDz7p17nJHZ4u5oxkSxXzae8uOP+VsjtOiw=;
 b=Y3hZLHPWK3+nZUtSq3QZbY1l7S9Jd261soHZ1KwOKEAdPFus95jeUrKCyDVLQQbF0yfmnlmyZ55mSSMT3gNT/UKzYWQqxcue2b67nUL5Ly5ZSdoGAiM5sMS6oZyCXghOEImgoHxwzMrDupJozVQJbSG6j62C/r0ngIMopj5dAXg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1a29ae76-a902-4a24-8fd1-ac26ef228971@amd.com>
Date: Tue, 30 Apr 2024 11:50:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/15] xen/arm/gic: Enable interrupt assignment to running
 VM
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-3-xin.wang2@amd.com>
 <670d1033-2443-4245-8ff1-cb7099a7c793@xen.org>
 <70c5a593-9ac5-485b-be81-b789562249d8@amd.com>
 <5ba38b7b-16b1-489b-ad55-083504690bbd@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <5ba38b7b-16b1-489b-ad55-083504690bbd@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|SN7PR12MB7912:EE_
X-MS-Office365-Filtering-Correlation-Id: 018f95c3-e28c-4b85-d8a1-08dc68c8afb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400014|36860700004|1800799015|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzZycGdLK1ZrQytCZndIY2F0b0pSKzdCZHVVZGNlU01LUzA3RjFGQkdpMnhu?=
 =?utf-8?B?aWN1WElWSDZDMVVGRkxYbHBlek5aNXVIemhmMVRUSVhXcU5rekdmdk9KellQ?=
 =?utf-8?B?cmNNdmUyZGk3ckdHTFNFaFpYVnhHKy9DeXVYWHdHYTZSbGYvSDFlUVhjNlY4?=
 =?utf-8?B?M2tnODRaS2l4dHA3dDdJdVBoZk5zZWFib2ZTNE9iNncvaUFFZkxrYWFFR1dS?=
 =?utf-8?B?aW8wTFcxUEJid3p2NjRKeXlZSCtSb3ozeGlDV0VmNXNSNThwS09TaWRtKzJ0?=
 =?utf-8?B?V3MvZVFoblBZd2ttWHFsVUZzbEVRR3pVU0tHUm1OcGxzVE5XUERqdXFJRGRK?=
 =?utf-8?B?RjJJK3FMeWpXRGlPTjE5SjYvZUhkYlc0Q3VtUitJa2NURFp5SndjVDZRNXpI?=
 =?utf-8?B?alM5SGJxdndiUC9WTjNoUVpJNGxrRjlteTdYN0RWNEZCbFl4emcvTGNTeUth?=
 =?utf-8?B?ZlJWdzl6c1NzWDgyZTRpaitmVDBhSStlblYyZzJvQ3dIT2FjVkhHbENHbE9U?=
 =?utf-8?B?ZlZZbmhtTmg4emVhbXR6bnpHUVgrb1lrTFVLZmRIMkNRRTNqOFNBQmZRWjRz?=
 =?utf-8?B?MjhWME12OUh0akE3a3pOWVNRbGNUTzNnUEp1TG9zK0lveXVyZk9UcWpmcDU3?=
 =?utf-8?B?cUI5OWpPNmp1T0Z5cFFlZnZOdWtzWU1SRzRLdm12ZHBjWThZdVM1QWNuRldF?=
 =?utf-8?B?eHVqalhWdkhmcDdqMC9qYnozbzFadmt4L2lNR0Q4N0R4eWlhc3FMNmV4MktR?=
 =?utf-8?B?aXdFTDFoM2RRTzczYzdvdkwvcXEyZWZtL0M1V2xLMzFyRERaeXgwcGVzTkUw?=
 =?utf-8?B?bFJsdHJva1RDNjNMbWh6RW4xd1k4azZYVnBKZ2tkdTlEUmh5TTlFeVAxaGZp?=
 =?utf-8?B?NGttLzQ0WjhpWkV4YUFCMnVWc0M2V3NjTlcwVFZHTG83V3JOZ09vRTY3WlNp?=
 =?utf-8?B?emc0SmcrTmZySVlsaEtKK0tnQytlVFBGdExHY1JVZlRodHIycy9kU25jTFFi?=
 =?utf-8?B?dUw0YzZCSnBMaTRrc2RkV3kyQWdiZXoyckZ3b1gwMHRmamdmQVltR2Mybmd5?=
 =?utf-8?B?OTJhWTgxV3JRRTJSNGoxNDF1WEpkZjV0Vlc5M2FsZm1iMUwvd251aUZFQk81?=
 =?utf-8?B?UXF3QW1mbnlMSmF3Y1krdlFMVm5JUytlUEtqM1FiMk5JL0VkODJ5T2h2M2lm?=
 =?utf-8?B?MUQvRWk1cWpiVjlMYXBaU1N0NTU4MnFIN01aS0U3Rk9LSmt4UXpqSlNvRTFK?=
 =?utf-8?B?elFKc3JlZ1dnL0tQOEdEbEJWaXZrR1NEWW12bG83bFZTVFRxODhPZVc1bmNK?=
 =?utf-8?B?NmxUck80YzcyUEtDTlNBdDBQQldRa25nWVAwYkJlclFZK0tDMitucHZrZVFV?=
 =?utf-8?B?V1Vubm1BUWw1UDIvSmozMEJUbituUXEvMzVPVGVjVVFtZ2ErNDNDL01rNm1i?=
 =?utf-8?B?a2hBazZGSzY4c0xSK1ZJSTliSDR2bnRtOU9leUMvei9oMUlRYzJ0TW1CVXg1?=
 =?utf-8?B?RFVVajQzSElSN0ZvaUR5WlJ2RGI5VFYvalUwQ2pyYnlsQ29rYXl4a1l5UmZP?=
 =?utf-8?B?L2xSa2ZxQStQbEZmRURoTVBqa0hncGxEN0tycHQya24vUkFqWXlXdjdjQUJu?=
 =?utf-8?B?bVFjWHBKa3Q0aGI2MktzVysxSmdFWlcvTGwwSlpOb05tZGsrMzZkZ2NNODht?=
 =?utf-8?B?UGJzRUJhcDBUQVFvajZhVVBmYndtS01RRHA0NHhzMWpYQTZFYVp5cWdmeENa?=
 =?utf-8?B?S2Rxc1dPZlVEODVCUmlKbzZlcEpzTW5EaWUxYnJ1a3BCQjhSQ3NYWFN3SC9N?=
 =?utf-8?B?YzhTeGVXQi9NWkVnQkNjbUdIR29uRk50RkV3T3F2QWExK0JNa2FHd1c5NXpU?=
 =?utf-8?Q?x3F1XkQS7geJl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2024 03:50:32.9715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 018f95c3-e28c-4b85-d8a1-08dc68c8afb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7912

Hi Julien,

Sorry for the late reply,

On 4/25/2024 10:28 PM, Julien Grall wrote:
> Hi,
>
> On 25/04/2024 08:06, Henry Wang wrote:
>> Hi Julien,
>>
>> On 4/24/2024 8:58 PM, Julien Grall wrote:
>>> Hi Henry,
>>>
>>> On 24/04/2024 04:34, Henry Wang wrote:
>>>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>>>
>>>> Enable interrupt assign/remove for running VMs in CONFIG_OVERLAY_DTB.
>>>>
>>>> Currently, irq_route and mapping is only allowed at the domain 
>>>> creation. Adding
>>>> exception for CONFIG_OVERLAY_DTB.
>>>
>>> AFAICT, this is mostly reverting b8577547236f ("xen/arm: Restrict 
>>> when a physical IRQ can be routed/removed from/to a domain").
>>>
>>>>
>>>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>>>> ---
>>>>   xen/arch/arm/gic.c | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>>> index 44c40e86de..a775f886ed 100644
>>>> --- a/xen/arch/arm/gic.c
>>>> +++ b/xen/arch/arm/gic.c
>>>> @@ -140,8 +140,10 @@ int gic_route_irq_to_guest(struct domain *d, 
>>>> unsigned int virq,
>>>>        * back to the physical IRQ. To prevent get unsync, restrict the
>>>>        * routing to when the Domain is been created.
>>>>        */
>>>
>>> The above comment explains why the check was added. But the commit 
>>> message doesn't explain why this can be disregarded for your use-case.
>>>
>>> Looking at the history, I don't think you can simply remove the checks.
>>>
>>> Regardless that...
>>>
>>>> +#ifndef CONFIG_OVERLAY_DTB
>>>
>>> ... I am against such #ifdef. A distros may want to have OVERLAY_DTB 
>>> enabled, yet the user will not use it.
>>>
>>> Instead, you want to remove the check once the code can properly 
>>> handle routing an IRQ the domain is created or ...
>>>
>>>>       if ( d->creation_finished )
>>>>           return -EBUSY;
>>>> +#endif
>>>>         ret = vgic_connect_hw_irq(d, NULL, virq, desc, true);
>>>>       if ( ret )
>>>> @@ -171,8 +173,10 @@ int gic_remove_irq_from_guest(struct domain 
>>>> *d, unsigned int virq,
>>>>        * Removing an interrupt while the domain is running may have
>>>>        * undesirable effect on the vGIC emulation.
>>>>        */
>>>> +#ifndef CONFIG_OVERLAY_DTB
>>>>       if ( !d->is_dying )
>>>>           return -EBUSY;
>>>> +#endif
>>>
>>> ... removed before they domain is destroyed.
>>
>> Thanks for your feeedback. After checking the b8577547236f commit 
>> message I think I now understand your point. Do you have any 
>> suggestion about how can I properly add the support to route/remove 
>> the IRQ to running domains? Thanks.

I spent some time going through the GIC/vGIC code and had some 
discussions with Stefano and Stewart during the last couple of days, let 
me see if I can describe the use case properly now to continue the 
discussion:

We have some use cases that requires assigning devices to domains after 
domain boot time. For example, suppose there is an FPGA on the board 
which can simulate a device, and the bitstream for the FPGA is provided 
and programmed after domain boot. So we need a way to assign the device 
to the running domain. This series tries to implement this use case by 
using device tree overlay - users can firstly add the overlay to Xen 
dtb, assign the device in the overlay to a domain by the xl command, 
then apply the overlay to Linux.

> I haven't really look at that code in quite a while. I think we need 
> to make sure that the virtual and physical IRQ state matches at the 
> time we do the routing.
>
> I am undecided on whether we want to simply prevent the action to 
> happen or try to reset the state.
>
> There is also the question of what to do if the guest is enabling the 
> vIRQ before it is routed.

Sorry for bothering, would you mind elaborating a bit more about the two 
cases that you mentioned above? Commit b8577547236f ("xen/arm: Restrict 
when a physical IRQ can be routed/removed from/to a domain") only said 
there will be undesirable effects, so I am not sure if I understand the 
concerns raised above and the consequences of these two use cases. I am 
probably wrong, I think when we add the overlay, we are probably fine as 
the interrupt is not being used before. Also since we only load the 
device driver after the IRQ is routed to the guest, I am not sure the 
guest can enable the vIRQ before it is routed.

Kind regards,
Henry

> Overall, someone needs to spend some time reading the code and then 
> make a proposal (this could be just documentation if we believe it is 
> safe to do). Both the current vGIC and the new one may need an update.
>
> Cheers,
>


