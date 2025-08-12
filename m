Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0EEB23914
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 21:36:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079157.1440122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulunB-0001OK-CW; Tue, 12 Aug 2025 19:36:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079157.1440122; Tue, 12 Aug 2025 19:36:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulunB-0001MP-9i; Tue, 12 Aug 2025 19:36:17 +0000
Received: by outflank-mailman (input) for mailman id 1079157;
 Tue, 12 Aug 2025 19:36:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ed2z=2Y=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ulun9-0001MH-Lo
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 19:36:15 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20620.outbound.protection.outlook.com
 [2a01:111:f403:2406::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a1a41ab-77b3-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 21:36:12 +0200 (CEST)
Received: from SA9P221CA0005.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::10)
 by LV2PR12MB5824.namprd12.prod.outlook.com (2603:10b6:408:176::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.20; Tue, 12 Aug
 2025 19:36:07 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:25:cafe::e7) by SA9P221CA0005.outlook.office365.com
 (2603:10b6:806:25::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.22 via Frontend Transport; Tue,
 12 Aug 2025 19:36:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 19:36:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 14:36:07 -0500
Received: from [172.18.164.135] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Aug 2025 14:36:06 -0500
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
X-Inumbo-ID: 9a1a41ab-77b3-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXL2um4rQx0adO29LpZuw2VTHitULBOpIKdjXy1Yf2JgJYzD6rCv4O8EJtnYIhGXkaDcx10qxhgpO/93DWj0eaMrx9ywipB1Wg0i3ZdxOHFUozSGeugj5/8hgkvvUbWq1xwlUVOwAii3HNq8cMpTqof5cTGQpZNOJacMZlNbbfDPKjE1KYMNKTGI6y7gaYXuGaTl8EKfNYQat5UCZ4C37bYLXnRd2GNNtnJeuujvHiF9HjldiVVoMPCX+noNja6QlsUuoc9Wrlf/SCn/GO3gA09WLnq5EmrChH9jWSaUvxz54a+me8Ghd410P5V43mue531EGq294sPZoy/PcKcN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqHkB/iKh0iOalV5y38Gym5n4ZW2TlAwTzGUmDm+sNQ=;
 b=PYfttHmB6xEb+WSMLfFtTFZIkl2JNFe++AcObNAxKopteTEZ7t92JaOuBzsvIuA5JbbRz62ZaXXkaB+24D7J/KGJP/bbiN9S35NLAPTZK/p+pzwHcvxLizpUOyMO1Zd8JfVhDjqhpwdzavH8NYkyfxBtgXQeft51Q2ILT+4qcSLE79uyhzsb1olk57znCBOMMggXxSllaj5HBY+9UNs7br5OVArlH8CxrNZ122bF3J1U6Jm/+BVogREnQC9t6TRg+u8jzca7sAROQ+BCWpwy7HvSZFdB/2ce6/neVq4BjqydiCz+7O7Jx7DqP14Wcvw0xiQc/3an/j+W3GHwwh65gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LqHkB/iKh0iOalV5y38Gym5n4ZW2TlAwTzGUmDm+sNQ=;
 b=cBS9V82naXa4vuAuKC351TZJd/OHnhesZX/VTU2JsiX+Vpe730E5c4DNq3VeVrKCMC46nN80YhH1MjXBn3KamEWZaZubGdu7JEB6X3N/e8agGXiUTkU1pag+pviMU7t8NF9RGtU4J3QCwIDhFmU+rjO+SgLX++ZXZPuu1ypVFw4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1651b43b-3230-4404-b65c-50de6d971d74@amd.com>
Date: Tue, 12 Aug 2025 15:36:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/events: Fix Global and Domain VIRQ tracking
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Oleksandr
 Tyshchenko <oleksandr_tyshchenko@epam.com>, Chris Wright
	<chrisw@sous-sol.org>, Jeremy Fitzhardinge <jeremy@xensource.com>,
	Christopher Clark <christopher.w.clark@gmail.com>, Daniel Smith
	<dpsmith@apertussolutions.com>
CC: <stable@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
References: <20250812190041.23276-1-jason.andryuk@amd.com>
 <5407877d-4c7c-494f-8fc1-d44eea4762b9@citrix.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <5407877d-4c7c-494f-8fc1-d44eea4762b9@citrix.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|LV2PR12MB5824:EE_
X-MS-Office365-Filtering-Correlation-Id: d61780af-f4b9-4570-f088-08ddd9d77bd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUVNcEkyVTZSZzBYY2VLNDU3S01ZQ2IxbmRGalpQOXh6YjVzZVJOOHBUNml2?=
 =?utf-8?B?MktOSUk0Zk1uaDh5eFhaQ1BRSHMwQlpjVTQxRFZrZFdSb2N2bW1ZTVRnbzZC?=
 =?utf-8?B?M0ZOelNTT0VIZWdrMkZVZHV4cGlpd3BoVWhBU245ek53VUVZNzFmZVA5TFg0?=
 =?utf-8?B?WVk1TEJ2RlpxT2JqSGhZM2xmd0lOZjZlOTduVnFwc0FQRUhBMlppTjRxcU0v?=
 =?utf-8?B?dTgwd1E1Zk1YMDg1TzM2NFZtK3VsUDlrcDRxTG9sWS84SUFSdTR4Y1JUT1Bs?=
 =?utf-8?B?TGdlVGZQTEtZaTVvd2lwMzB0Q3NuNEZTOHBNTWp4RXNxUFFzNU5pU1pDZHBh?=
 =?utf-8?B?Wm55SksvTEJTUWUveGUxejhYY2l4MWZwb25Ycmh0a3RncXBCSGN3a0tiM3A4?=
 =?utf-8?B?QXJOcEZSdHNRM2NqbCtxaldlak9yOVRQMTJzcStiSFNvRTRnL25ZR1A0YXQy?=
 =?utf-8?B?RlByTnZ4cnVJTGY1QnNMU1YxcmVudWppZ1dwMXIrMktnQUd2aTVtcVZuRVpN?=
 =?utf-8?B?WVRVY3Z3WWl5WkI0V1BDeFZmMTJZQVVQV2Z0WTI3SEh4RGozYWtGZU8remZj?=
 =?utf-8?B?SW11dUtxT212U2JLYThtbFBIQUVPY0hvMitOWCtlVVd2Mk92VmZXdmR2b0N4?=
 =?utf-8?B?aTZORXFKL2VJN3hJOXAxNXJlcnBDclJIZFNUVTllZkh1QnZ6SmFIbjJoNGR3?=
 =?utf-8?B?dXVCN0RUTWtlYXJHRTE0eWJhL05Nc2RDQ09yYTdyOGgyZDAzbUZtUkFRYXpE?=
 =?utf-8?B?dGdVYWRadzhnQ1Z6Wlpud2hLRDRSa2x3Nk5NbTUwTXhtUm9sbVZLM2tsVzVK?=
 =?utf-8?B?THNHQWdEOFVkMmpWdnRSakxOcndjYnE2WmpUREJxSmhrcEN5YUpKYVlRaVQ1?=
 =?utf-8?B?TEpMN3VQbnFTWklTcFQwUUFrSGtydU83ZXA3MkhpYktnK1Z5d2VWNEtBYnlK?=
 =?utf-8?B?amU1TVUvRExDazBuZmZ1ZWdrb05EQmxLK1cySnVLOCtWSEVRMHFJbEFLci9v?=
 =?utf-8?B?S2hiMUhOU0Y1RGg3QXRLZzg2cE84aDhFRUdodmlsdG5JMmpRVlRwOXp4Slhy?=
 =?utf-8?B?UVEzNGVJWFJqaXFsQnYxczNPZXoyVmZZZnZoR1RXNEpZMVNXVitsNzR6UUNM?=
 =?utf-8?B?b3pPRlpiRjVjanAySnMraU9uTjFyeTVrdi9CK25ySmVjcXZPaVgreEVTN01u?=
 =?utf-8?B?VDEwSDJoVlZodlgvL3FEWjdzOGxPMERoS1RSUXZJaXdUTEh4cWszRVpLNVZi?=
 =?utf-8?B?aERPOEV6eUpISHpVRFBKeUhiN0JSTFBrRng2cmJmcTVXdmxsUjNGaTVhdU8z?=
 =?utf-8?B?dEpQek5ZRUVsYTdKVkZnQkNiUllvaFJtampYK2t5djVMZnpqWU9iRHhyeDI2?=
 =?utf-8?B?WUJWTnVLejJqWEdGNXFWaEg0TlhrdHFVVXk3emV1dzBKdVFSVHhURFhnRko0?=
 =?utf-8?B?dDcyR2l4NDF6YmUwYXUyWGZ5bTR5azF5WTZzSEpKeXpBYXJpNk8wS0VUV3I3?=
 =?utf-8?B?SWZuUFJnQ2Y1Zm1sZkpZTHFYWFo0eTk0KzhyU3RqNVdIRlRFVTJkTnY4b3dl?=
 =?utf-8?B?Yy9ZT3lTcFRKUzZxa2JWVWhIS1B6eDJFZ3FpRm1uYTlVSXpyMzdIc1pjUXQv?=
 =?utf-8?B?alB1RExoWC9XOHJlbXdzRHpUUUJBMmQxUlpLaURwMWRpc2VJS2tTQVJVNnFT?=
 =?utf-8?B?bGV2em5UWXA4U3lkUW5hRWJWNUZYRkgvb0ZJRUJGbGYzcWcrVE1mRHdOVXE4?=
 =?utf-8?B?MTdDb3FMYk5tSjZzeDFjY2lwRVYxSVJxbVB6SnVLbkxnWmxxa1pUK2hnT2ZS?=
 =?utf-8?B?NFBJSjVzenlobVo2cGZNdGQydUdvZDNSbFc5aC9EYlluQjUwRmk4Q3ZjNkhp?=
 =?utf-8?B?bXc3RTd4RHZkSnc1UXlJVzcvWHA3azRZR1U3cXYya2FaOFJZV1ZTS2g4Q05B?=
 =?utf-8?B?RGozbldvSjdBSDNlNzAvN0hYN3VNN0g2Y3Q0b2JGRDlNSWpwc09QdDR2UXBW?=
 =?utf-8?B?N1JBNWthQ3BiUHFIWGVqVzkvc0Z3MFRzTWRJWHYxTXVmUDdKeTZJY2hxSEJm?=
 =?utf-8?Q?4SgGM6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 19:36:07.4667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d61780af-f4b9-4570-f088-08ddd9d77bd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5824

On 2025-08-12 15:10, Andrew Cooper wrote:
> On 12/08/2025 8:00 pm, Jason Andryuk wrote:
>> VIRQs come in 3 flavors, per-VPU, per-domain, and global.  The existing
>> tracking of VIRQs is handled by per-cpu variables virq_to_irq.
>>
>> The issue is that bind_virq_to_irq() sets the per_cpu virq_to_irq at
>> registration time - typically CPU 0.  Later, the interrupt can migrate,
>> and info->cpu is updated.  When calling unbind_from_irq(), the per-cpu
>> virq_to_irq is cleared for a different cpu.  If bind_virq_to_irq() is
>> called again with CPU 0, the stale irq is returned.
>>
>> Change the virq_to_irq tracking to use CPU 0 for per-domain and global
>> VIRQs.  As there can be at most one of each, there is no need for
>> per-vcpu tracking.  Also, per-domain and global VIRQs need to be
>> registered on CPU 0 and can later move, so this matches the expectation.
>>
>> Fixes: e46cdb66c8fc ("xen: event channels")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>> Fixes is the introduction of the virq_to_irq per-cpu array.
>>
>> This was found with the out-of-tree argo driver during suspend/resume.
>> On suspend, the per-domain VIRQ_ARGO is unbound.  On resume, the driver
>> attempts to bind VIRQ_ARGO.  The stale irq is returned, but the
>> WARN_ON(info == NULL || info->type != IRQT_VIRQ) in bind_virq_to_irq()
>> triggers for NULL info.  The bind fails and execution continues with the
>> driver trying to clean up by unbinding.  This eventually faults over the
>> NULL info.
> 
> I don't think the Fixes: tag is entirely appropriate.
> 
> per-domain VIRQs were created (unexpectedly) by the merge of ARGO into
> Xen.  It was during some unrelated cleanup that this was noticed and
> bugfixed into working.  i.e. the ARGO VIRQ is the singular weird one here.
> 
> In Xen we did accept that per-domain VIRQs now exist; they had for
> several releases before we realised.

AFAICT, global VIRQs have the same issue - I think they just aren't 
unbound and rebound.  I just happened to trigger this with the 
per-domain ARGO VIRQ.

I double checked, and the cpu is updated like so:

set_affinity_irq()
   rebind_irq_to_cpu()
     bind_evtchn_to_cpu()
       cpu_evtchn[chn] = cpu;

unbind_from_irq()
     case IRQT_VIRQ:
         per_cpu(virq_to_irq, cpu_from_evtchn(evtchn))
                 [index_from_irq(irq)] = -1;

cpu_from_evtchn()
     return cpu_evtchn[evtchn];

So global VIRQs were mis-tracked even in the Fixes commit.

Regards,
Jason

>> ---
>>   drivers/xen/events/events_base.c | 17 ++++++++++++++++-
>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
>> index 41309d38f78c..a27e4d7f061e 100644
>> --- a/drivers/xen/events/events_base.c
>> +++ b/drivers/xen/events/events_base.c
>> @@ -159,7 +159,19 @@ static DEFINE_MUTEX(irq_mapping_update_lock);
>>   
>>   static LIST_HEAD(xen_irq_list_head);
>>   
>> -/* IRQ <-> VIRQ mapping. */
>> +static bool is_per_vcpu_virq(int virq) {
>> +	switch (virq) {
>> +	case VIRQ_TIMER:
>> +	case VIRQ_DEBUG:
>> +	case VIRQ_XENOPROF:
>> +	case VIRQ_XENPMU:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +/* IRQ <-> VIRQ mapping.  Global/Domain virqs are tracked in cpu 0.  */
>>   static DEFINE_PER_CPU(int [NR_VIRQS], virq_to_irq) = {[0 ... NR_VIRQS-1] = -1};
>>   
>>   /* IRQ <-> IPI mapping */
>> @@ -974,6 +986,9 @@ static void __unbind_from_irq(struct irq_info *info, unsigned int irq)
>>   
>>   		switch (info->type) {
>>   		case IRQT_VIRQ:
>> +			if (!is_per_vcpu_virq(virq_from_irq(info)))
>> +				cpu = 0;
>> +
>>   			per_cpu(virq_to_irq, cpu)[virq_from_irq(info)] = -1;
>>   			break;
>>   		case IRQT_IPI:
> 


