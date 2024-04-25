Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6878E8B1B72
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 09:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711843.1112124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztC4-0002fM-Qr; Thu, 25 Apr 2024 07:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711843.1112124; Thu, 25 Apr 2024 07:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rztC4-0002d2-Nw; Thu, 25 Apr 2024 07:06:56 +0000
Received: by outflank-mailman (input) for mailman id 711843;
 Thu, 25 Apr 2024 07:06:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HNrt=L6=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rztC3-0002cp-A6
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 07:06:55 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2405::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64b0af05-02d2-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 09:06:52 +0200 (CEST)
Received: from BN8PR15CA0048.namprd15.prod.outlook.com (2603:10b6:408:80::25)
 by SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 07:06:49 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:80:cafe::f) by BN8PR15CA0048.outlook.office365.com
 (2603:10b6:408:80::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.25 via Frontend
 Transport; Thu, 25 Apr 2024 07:06:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Thu, 25 Apr 2024 07:06:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 02:06:48 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 02:06:47 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 02:06:45 -0500
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
X-Inumbo-ID: 64b0af05-02d2-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfuaHjNbvrtTOP57zK1RtKLim03X3/LbUpRmidEAZZFI9vefKa9y7CpgoP9swky+oT3TWTFeNsJhlBaddpBUpnbFGYYkkot3yAx2TJHDTGHGJpXZ6z4PDSJj0e19nE4VV8Z9pqxcDyKzHU4h8Bq4W+JEYm3YdYB1SqOgKJG61ckhDKNr+4IHYPi1C1QVsbzf6PQ00gIVrFU7RqBxs0g9FOvuo2r4XU50pOiiit7pHp13NsdkCifHtfzTRi/+GgtnIIV2hrRYj18FXPx6j/gamvZbX0Co1WF+druEmmSt+tAqd6+lOWqtMs5Csf6EOsvBtk5Ok6PMfghG5aHMrPAKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XE9TPjnivHbWUzUOYv7aZuYKCVTly+JQTCfnfs91HM=;
 b=PjTtPEEIz5sWuTGzloKuSBxLl/kZt1nroHzFL2Xn771/oW0HdWxGE5NkZTBLcS3nRtw1V1V1SPSFj0vB0CjliHhcoiKiY/QxTfhWtkZmSr3iginG2dto1PJN4kQ3bSeU6LZQlPN/1TI2l3CHAqhKlkD4MtrWwiCaOvXkxHX9doPAI7SCZfY62e8oirRqfsRg0/tFXCaWBZBdGej3Kf/bgFri3kG//6cWPCTh/5gNudrJaxkgluzjTLC5o30wOO0Js7rE3n9ONFFUGII0Tfd36ippgi5BJrToUGT+2skOt1Eah26X8zgSGXxhVfFxlfjEdfMn056LKPU1BCtZUP/fFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XE9TPjnivHbWUzUOYv7aZuYKCVTly+JQTCfnfs91HM=;
 b=1YsKxwbHiEi566+Lm35OpCjoc5TW+vFfxTkhU6QQw2Ddyn7JwsPUnt3GdBAB8ReFhG3PU0jH7zDer7EeqlDeicf3apKGqZCiniGadNk6QBqz0xSK6QzwlDw7YIrIXLg9Lm+pyW28bHoVSc9d/BTEtoILitbmNtgKH1XyT/zCnJ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <70c5a593-9ac5-485b-be81-b789562249d8@amd.com>
Date: Thu, 25 Apr 2024 15:06:39 +0800
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
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <670d1033-2443-4245-8ff1-cb7099a7c793@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|SN7PR12MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: 907b1ac2-44d3-4c24-d82b-08dc64f6464c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ek5LaFpVaExUczdvdDMvUUlxaGZHcnpJdzVVYTJyNnhpYzk2V0FVR3JoN2d6?=
 =?utf-8?B?R1NocXNQdk1oVUxBTWtKaXQ3TGlWT0NNd0xxTUZxc3FtSm5Yd2tIekJmTTYw?=
 =?utf-8?B?bi9CWUc4WVJTT3hnUzkzZHMyUW80NFJLQTlCRUdpZFg1TFpaYXBUeTNYd3dY?=
 =?utf-8?B?aExsbU5HMlExVmpuZUt6eHYvUEdFT0FLano0WGRDcWRWSExrbzh4MnluNHRY?=
 =?utf-8?B?ZHd4RkpoMXpGaE0xbEVWcERkN1J6aVJDVjNnQzNhUGlZY05YSTNkaDBkSHlN?=
 =?utf-8?B?aXAzaHROZVhkRzFNczl4S2JPZi9ReGRHN3RCUGRnNTZQWHdtVytrVFV1UFhZ?=
 =?utf-8?B?cTBQYjMrdVFGNENuT2E4OExkU2tNVGRUMW5tNE13amZyVjBPZEQ1NVRpcjFx?=
 =?utf-8?B?MzBVL3ZVcis1dStsdDhSWUQyWk0zSmNkRytacE9kako2eTk0ZHdGUGNXUTQ2?=
 =?utf-8?B?Q3lpcmdOamJ6QWlxdVA4N09leXVMd2dUVXVTdmJWaGM3ZXplb21PUit4dGJz?=
 =?utf-8?B?L0lrU1RQRythWWJMVFVERFVFeGNGUVJ6K0lDQ2Q1U2hyOGdBNnNUbjY5MUN6?=
 =?utf-8?B?elNabjUwcG1OVGtYaUs0QmN3Qlc1MWRFaWpXNnNGMFRqbWtTMUkwTjJQcWNw?=
 =?utf-8?B?NldpQjdWNWNXQytoUllTWkNtZzRuUkI1MEY0MUJrKzRWS3hXekRsYjJ1NWdH?=
 =?utf-8?B?b2lWZ09PRUs2WlNLZkRBTFZjaG95RWkyRjdaTDZVSGFqdS9iamprS1VKMFlo?=
 =?utf-8?B?TzBFd015UldrMWV0YTZ5SmNldElFaStZWk5Za0dBMXpTaHZPUGEwR3dsWXlB?=
 =?utf-8?B?MThLcE9HRWhzVWN1TEE1SWxaZ0lEOXN5eGJPT3FpNjlXYVpYT05ZVFNLUTY4?=
 =?utf-8?B?ZEN3cTFXMjFEV2wza0RveHFqVzE5STJjMkJ4bGVHZG5PRm1lQ2pGYmJqOXk5?=
 =?utf-8?B?M2JaSDluclZyTHZrQ2huaEY1QXhiQTlsamtScXJuaU5HbzNmaWh1V3NtZS9Y?=
 =?utf-8?B?RzR3NmJUZHhadDRoV2l1Si9LWEhKR1BHaVVrdjN2NmVNaDk1MmcxMXF4dnJQ?=
 =?utf-8?B?NmhVQ1NXTmlxTU1aa1pFQlA1ZXBTSFNEbFlZSktFRFJNQURjLzNYM2tIbkxY?=
 =?utf-8?B?OUJTRktGZ0srdEFubXBzQzBETjdNZTJvV1pOZm4wblRQY1gwUmhBRHB2eEZi?=
 =?utf-8?B?c1ZwNFNIK1MxMzFvejdobVVzVUJVL3d3VzVzVXp4YWhQcm5NZng1V2Fta0g3?=
 =?utf-8?B?TjA2aHBlOTZZeXVuZjhNZytZRGhya2V2NmtPMDArdmt1OXZSd2hYcUVmaTcw?=
 =?utf-8?B?YXhEc3gxS25VN01xSlY4ZFE1ZjgzdTQrMVQ1c1FhVWRFWExwUXdYaDZzRktn?=
 =?utf-8?B?cElzVmZ3eEZQUnBNMHIwNEZHWFRTYnRmK1ZpNU1OOG1UYTJuT3NoaU1WMzRo?=
 =?utf-8?B?WnQ1REJDbnQxbUlKZjZGT2RhT2Z0czdXMGdtVHRYdEt1djVvcktUcGIyRkdU?=
 =?utf-8?B?VTUrcEFZeW44ZTdRZXM3dS8wdlR4YytRSkZ1ai9QSXJLbmp2YkJtZjJTcTVW?=
 =?utf-8?B?NEJwZ3NBMXNHZFRMRDdzMFIzcVQ3b1ZlSm8wbk5zdGwrQ0NZUHlaQmp1L3BH?=
 =?utf-8?B?ejRhaTBDYzR4V2EvSU9VT21nUnFzb2pTVzlPVEt1WUliSFFPMkRjYmQ3V0ZK?=
 =?utf-8?B?SzU3bEVIL21BeW9RYis3RUZNRWRQWGZmbm9EWC9YS2o1SkNvbkFNK3VmQmMy?=
 =?utf-8?B?TzYrMHF4ZURMOUR1bVI4dDJ1QmtFU3QzL2hycW96RUxrUEt2TEJMcnBqWGdD?=
 =?utf-8?B?aVZLckZvNFRLYUJWMzJiMGlVZ0lzcWtMbHc2aUxwREZrclNua2hGQU5aNmpu?=
 =?utf-8?Q?PcwqClgTax2Nm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 07:06:48.3472
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 907b1ac2-44d3-4c24-d82b-08dc64f6464c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8059

Hi Julien,

On 4/24/2024 8:58 PM, Julien Grall wrote:
> Hi Henry,
>
> On 24/04/2024 04:34, Henry Wang wrote:
>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>
>> Enable interrupt assign/remove for running VMs in CONFIG_OVERLAY_DTB.
>>
>> Currently, irq_route and mapping is only allowed at the domain 
>> creation. Adding
>> exception for CONFIG_OVERLAY_DTB.
>
> AFAICT, this is mostly reverting b8577547236f ("xen/arm: Restrict when 
> a physical IRQ can be routed/removed from/to a domain").
>
>>
>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>> ---
>>   xen/arch/arm/gic.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>> index 44c40e86de..a775f886ed 100644
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -140,8 +140,10 @@ int gic_route_irq_to_guest(struct domain *d, 
>> unsigned int virq,
>>        * back to the physical IRQ. To prevent get unsync, restrict the
>>        * routing to when the Domain is been created.
>>        */
>
> The above comment explains why the check was added. But the commit 
> message doesn't explain why this can be disregarded for your use-case.
>
> Looking at the history, I don't think you can simply remove the checks.
>
> Regardless that...
>
>> +#ifndef CONFIG_OVERLAY_DTB
>
> ... I am against such #ifdef. A distros may want to have OVERLAY_DTB 
> enabled, yet the user will not use it.
>
> Instead, you want to remove the check once the code can properly 
> handle routing an IRQ the domain is created or ...
>
>>       if ( d->creation_finished )
>>           return -EBUSY;
>> +#endif
>>         ret = vgic_connect_hw_irq(d, NULL, virq, desc, true);
>>       if ( ret )
>> @@ -171,8 +173,10 @@ int gic_remove_irq_from_guest(struct domain *d, 
>> unsigned int virq,
>>        * Removing an interrupt while the domain is running may have
>>        * undesirable effect on the vGIC emulation.
>>        */
>> +#ifndef CONFIG_OVERLAY_DTB
>>       if ( !d->is_dying )
>>           return -EBUSY;
>> +#endif
>
> ... removed before they domain is destroyed.

Thanks for your feeedback. After checking the b8577547236f commit 
message I think I now understand your point. Do you have any suggestion 
about how can I properly add the support to route/remove the IRQ to 
running domains? Thanks.

Kind regards,
Henry

>
>> desc->handler->shutdown(desc);
>
> Cheers,
>


