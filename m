Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAF7B2708A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 23:04:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082568.1442380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umf7Z-0006jZ-83; Thu, 14 Aug 2025 21:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082568.1442380; Thu, 14 Aug 2025 21:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umf7Z-0006hd-4h; Thu, 14 Aug 2025 21:04:25 +0000
Received: by outflank-mailman (input) for mailman id 1082568;
 Thu, 14 Aug 2025 21:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vckc=22=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1umf7X-0006hX-DV
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 21:04:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060d.outbound.protection.outlook.com
 [2a01:111:f403:2418::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e97ea0c-7952-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 23:04:20 +0200 (CEST)
Received: from MN2PR06CA0005.namprd06.prod.outlook.com (2603:10b6:208:23d::10)
 by SA5PPF9BB0D8619.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 21:04:14 +0000
Received: from BL02EPF00029929.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::f) by MN2PR06CA0005.outlook.office365.com
 (2603:10b6:208:23d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Thu,
 14 Aug 2025 21:04:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029929.mail.protection.outlook.com (10.167.249.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 21:04:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 16:04:13 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 16:04:13 -0500
Received: from [172.23.255.54] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 14 Aug 2025 16:04:12 -0500
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
X-Inumbo-ID: 3e97ea0c-7952-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UDn/t46y+ZVtzCNIpXucLoPvYKh/FYG0s3rG2F1vV6QSwWYl9OrGA807PBVsnWbEpGArXVAKUlUTUF/KTfEJGRQqrRtHaBOv4IVtjB9fo8MSv6BchxEK85DUbL70I+D3GyQzsJsS06KQUTo08LNgfnFY3Xj8ZZgaCth/m6PWRbdHuUrL4/dt5athabVDju5NQtbfVy85yGZF4ND90+DtFvCph4f56J0aO87uIMUO3AZgMJZwjXhaAzgMmRPQAnR3Uq/Sc3uWofAELnpPQjpTXrm4e0H7CO+8ODDHvo+r7by3l9YcgsQjGwMVrvKKkLZhIsdSHTBiEmYqC8GB/PCTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L+fefGiP643bWbhlH0h/mgMGbq0UrkurRyvb+dSujKU=;
 b=kCFH52R635273MA2tVTiyOsvVXWdkwanUOHB9h86gPi89Q+X4/WcZ+/vC0V2zovpAr/CqmUH2Zhpc7w9ePL1bxnz1sKQU1FLuF1KUPgDxIFrjOVPrGKvQnhEHsElbd6uaE55/56KTpwuyINjust0Wo+BWIiyDs7Rk4ZMsA3NCAgUst0RAQEgXB67fUhg37eflySnNGFK7yAzJ0YHcHyJcLR132/MwhZLH0kfc5V98PjCW7DWafsDa4dYMutM3rHL4t/V/hW3zHN7x6RArdEK5Y5vfv5mnTpdtz2u518288o12Zhk3vpFg/wRrluDSIQmgR3BMxm4sYPVnjpunWt8Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L+fefGiP643bWbhlH0h/mgMGbq0UrkurRyvb+dSujKU=;
 b=WhIQMHqUGphP2w31pXoht841ajm0851SjZXQ6zoCOimdBwlSgeWDDCwB1FwoD01e+SNQxYOgWxAEgr1xHkNSytCKN1xXCF49DpHt0jFvJ/4LuiHsfCrtDbtsqhw1hYNVWLTy7BBrYNhlw4hMH8MEQwVC0QajDQf3mkHAHu2BywY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <238b2fd0-33ab-4279-9205-de58332fa944@amd.com>
Date: Thu, 14 Aug 2025 17:04:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/events: Fix Global and Domain VIRQ tracking
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Chris Wright <chrisw@sous-sol.org>, "Jeremy
 Fitzhardinge" <jeremy@xensource.com>
CC: <stable@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
References: <20250812190041.23276-1-jason.andryuk@amd.com>
 <a4b5fd6b-80db-4b58-b3e8-5832e542d64c@amd.com>
 <6bf9bac0-a394-4064-bb5d-924f5a920e7e@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6bf9bac0-a394-4064-bb5d-924f5a920e7e@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029929:EE_|SA5PPF9BB0D8619:EE_
X-MS-Office365-Filtering-Correlation-Id: e08dfef4-71bc-4bf3-cb8e-08dddb761fc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?b0JFdG9MUFIrNXhEZE5MUkxCU2hIWGYrb2kwZ3QvYndVWnlxM2pPd08wUSsw?=
 =?utf-8?B?MVovN0ZMQjYvZjJBcGF1cSt5aHRGT0tMQXoyM2twQmJYV01YTTJoQndYUVdN?=
 =?utf-8?B?a3pYMDVzRXd5R3R6TjlTaVhYUGpkTWhtRFBqR1praXlPN0xWTGZXanllR1Nt?=
 =?utf-8?B?dWxwTGJ5dlpwRXEzakRKMDMxdnptNVRYRzlacC9lckphUjI0blpjRFFDTUow?=
 =?utf-8?B?NDlRekl0d0NlMUJ0L3B4U3ptKy9wK2V1NHdrSUZseE5PY0o1c1NYWVkwYW8y?=
 =?utf-8?B?UHE1QjNYaEFRS29Sckl5NWY2WCs3MUh5c3BObHA1aHZQQ2k0dFhGdFBDd0lN?=
 =?utf-8?B?a29CeUszdysvWU5UVVZoanp1WEJ6ZG1SUGc1cUJiTW44WHM2YXhJSGhxeTQx?=
 =?utf-8?B?Q1EwNXNFcmljemtqSGhhK3F6WDVuUzlrei9PQlRBUHRQNEFGK01XYms1eVFx?=
 =?utf-8?B?eElsVEpFZ0pYemJjL0pucDZtVzBBeTNTcVNCSzIzcGdRUUx1elhaVS94eUZY?=
 =?utf-8?B?aVFvREo3bEVmWG9BNVpyVUxJS0hsd0hhcy9CWkNoVytzYkl6OHo1Q0pDOXlp?=
 =?utf-8?B?eXhMVGZFUkZZbS85a21xV2tSWnRxTnZPV2hnc3dybm9QLzR0TXIrb05OT3pi?=
 =?utf-8?B?UlJxVXNTY2o3Umo5UFN5dFVmaU9nN1N6NUw0emZTZFlrcmErQmdlTktWZ2FW?=
 =?utf-8?B?emZpUjRGYmQ1clQ2U2VnaE9ybmJlWHdRbEF4RE0rMW1XOXczMTJweXVISG9q?=
 =?utf-8?B?T0pDK1lQTTkrVlh0K3k0aDdaYkhVNEVIZG5Ga0xsWStBcXl0NHN1U09GM2xa?=
 =?utf-8?B?VjJ6YU5GdXhJdllnSkI0Q1p1dDRlcHNCRVAzZ0wya0tLR2dOalFZUHJROVNn?=
 =?utf-8?B?a3p5VGdYampTODNiaEN2WlFqZjU1cCtyRnhFYU00RDVjanRyWVpZLytpV3J0?=
 =?utf-8?B?aXVPeHR1SXZmY3VDUU1MbUwzVDBLYitieEYzYWNST3JrTllCSitVRmcrK1ZL?=
 =?utf-8?B?ckM4UnRENFQ0MnBkMnlqTitra25kWEhXTXp3MzEwWUJUS3dhdzFSUXVmNFZq?=
 =?utf-8?B?Y0NRd3R2bnRkbXljRjE1NkFWZVBMR3c0VWxTVjdaSnUxUytUTFR4RG00dUE2?=
 =?utf-8?B?cW90VWNwOHFTN2J1enJFd2w2TWxDb01wT2hDc3ZMbXJsQTF2OGd3cENJY2Za?=
 =?utf-8?B?SzVsMHRZU2dWcENYVm1BQ25EVGEzSmUwYTVoaFlnSVFaTjh6NDAydWZBOTBH?=
 =?utf-8?B?a201OFQ2L1JaOWpJOTZBTk1reEdoZWRGV2FPNG5EMzZPZEJRVHQ5WXlXMnVV?=
 =?utf-8?B?aFdNUnh2cFFMM0IvNVNnSVF6RGdJbksyN2xORm8xZUZpR3oxZk91RXhNNmxL?=
 =?utf-8?B?TmhwOExpVDQ4R0lUcDVRZ2YzQ3dtNVl3U3VPR0lpN0pCYjRLRWFpSXA0Q3V6?=
 =?utf-8?B?eXJoTnluVGJoYkQ4VUhKd1lXb3NuelhoMU5DcFNIbEM0dVlHQVpseWlJYUla?=
 =?utf-8?B?V0VhcCs2Y1UzOUpPek9HUHJIeGVWT0srMVl4d0lqa3RGU25wd0Rpc3VCMEQ5?=
 =?utf-8?B?elU2blRlb2tuZEZkR3NIQ2hoU0ZxekU5N2NnQXpydGdBZFZlOWovSTBQMUxx?=
 =?utf-8?B?WmhERnVmTVFGbXRQOWo1VE9oQ1VoVGQyK2EzQllUTHRHZVVDQkVPR2k3a08x?=
 =?utf-8?B?ZThyajBjc09VQ3JWMUJGdWxibTJuaGo4WFpTdkNaaDhBV2JoOFdFVXorYisw?=
 =?utf-8?B?Zk9tVGRGajR2QjZEd0hBTDBqVEV4YXgrUHVoUjVsb0dSVDRRNCtHZUo2OVJV?=
 =?utf-8?B?cFMwOG1kRTgycDZEM3haODZoMUFFdzdaald0RGM4UDZZS252TDZPL3VkQ3p5?=
 =?utf-8?B?b2RwRk9XNWdaZ213WGtLQ2hhSW8xeDhMQU1QMHhwMHRkMllldW1EYlZQbXZ2?=
 =?utf-8?B?SHpVMVJQdXptMEFVSnJub1I1N0x2Q0xZdUJJYVBJbzVxVkZGUnhUMXUwR01I?=
 =?utf-8?B?SEhtczRUTGVUNERXeFN1QjJFOWozNDdyYlQ4K3RSSHBKN1Q0TklWa2lORVc5?=
 =?utf-8?Q?TDvjyD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 21:04:14.1988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e08dfef4-71bc-4bf3-cb8e-08dddb761fc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00029929.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9BB0D8619

On 2025-08-14 03:05, Jürgen Groß wrote:
> On 13.08.25 17:03, Jason Andryuk wrote:
>> On 2025-08-12 15:00, Jason Andryuk wrote:
>>> VIRQs come in 3 flavors, per-VPU, per-domain, and global.  The existing
>>> tracking of VIRQs is handled by per-cpu variables virq_to_irq.
>>>
>>> The issue is that bind_virq_to_irq() sets the per_cpu virq_to_irq at
>>> registration time - typically CPU 0.  Later, the interrupt can migrate,
>>> and info->cpu is updated.  When calling unbind_from_irq(), the per-cpu
>>> virq_to_irq is cleared for a different cpu.  If bind_virq_to_irq() is
> 
> This is what needs to be fixed. At migration the per_cpu virq_to_irq of the
> source and the target cpu need to be updated to reflect that migration.

I considered this, and even implemented it, before changing my approach. 
  My concern was that the single VIRQ is now in one of the N per_cpu 
virq_to_irq arrays.  A second attempt to register on CPU 0 will probably 
find -1 and continue and issue the hypercall.

It looks like Xen tracks virq on the bind_virq vcpu, so 
per-domain/global stays on vcpu0.  Binding again would return -EEXISTS. 
find_virq() would not match the virq if it was re-bound to a different vcpu.

If we don't care about handling duplicate registration, then updating 
the virq_to_irq tables should be is fine.

>>> called again with CPU 0, the stale irq is returned.
>>>
>>> Change the virq_to_irq tracking to use CPU 0 for per-domain and global
>>> VIRQs.  As there can be at most one of each, there is no need for
>>> per-vcpu tracking.  Also, per-domain and global VIRQs need to be
>>> registered on CPU 0 and can later move, so this matches the expectation.
>>>
>>> Fixes: e46cdb66c8fc ("xen: event channels")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> ---
>>> Fixes is the introduction of the virq_to_irq per-cpu array.
>>>
>>> This was found with the out-of-tree argo driver during suspend/resume.
>>> On suspend, the per-domain VIRQ_ARGO is unbound.  On resume, the driver
>>> attempts to bind VIRQ_ARGO.  The stale irq is returned, but the
>>> WARN_ON(info == NULL || info->type != IRQT_VIRQ) in bind_virq_to_irq()
>>> triggers for NULL info.  The bind fails and execution continues with the
>>> driver trying to clean up by unbinding.  This eventually faults over the
>>> NULL info.
>>> ---
>>>   drivers/xen/events/events_base.c | 17 ++++++++++++++++-
>>>   1 file changed, 16 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/ 
>>> events_base.c
>>> index 41309d38f78c..a27e4d7f061e 100644
>>> --- a/drivers/xen/events/events_base.c
>>> +++ b/drivers/xen/events/events_base.c
>>> @@ -159,7 +159,19 @@ static DEFINE_MUTEX(irq_mapping_update_lock);
>>>   static LIST_HEAD(xen_irq_list_head);
>>> -/* IRQ <-> VIRQ mapping. */
>>> +static bool is_per_vcpu_virq(int virq) {
>>> +    switch (virq) {
>>> +    case VIRQ_TIMER:
>>> +    case VIRQ_DEBUG:
>>> +    case VIRQ_XENOPROF:
>>> +    case VIRQ_XENPMU:
>>> +        return true;
>>> +    default:
>>> +        return false;
>>> +    }
>>> +}
>>> +
>>> +/* IRQ <-> VIRQ mapping.  Global/Domain virqs are tracked in cpu 0.  */
>>>   static DEFINE_PER_CPU(int [NR_VIRQS], virq_to_irq) = {[0 ... 
>>> NR_VIRQS-1] = -1};
>>>   /* IRQ <-> IPI mapping */
>>> @@ -974,6 +986,9 @@ static void __unbind_from_irq(struct irq_info 
>>> *info, unsigned int irq)
>>>           switch (info->type) {
>>>           case IRQT_VIRQ:
>>> +            if (!is_per_vcpu_virq(virq_from_irq(info)))
>>> +                cpu = 0;
>>> +
>>>               per_cpu(virq_to_irq, cpu)[virq_from_irq(info)] = -1;
>>>               break;
>>>           case IRQT_IPI:
>>
>> Thinking about it a little more, bind_virq_to_irq() should ensure cpu 
>> == 0 for per-domain and global VIRQs to ensure the property holds.  
>> Also virq_to_irq 
> 
> In Xen's evtchn_bind_virq() there is:
> 
>      if ( type != VIRQ_VCPU && vcpu != 0 )
>          return -EINVAL;
> 
> Making sure in Linux that there is never a violation of that restriction 
> would
> require to always have an up-to-date table of all possible VIRQs and their
> type, which I'd like to avoid.

Yes, I agree with this.

> I think it is the user of the VIRQ who is responsible to ensure cpu 0 is 
> passed
> to bind_virq_to_irq(), as this user knows that such a restriction 
> applies to
> the VIRQ in question (at least he should know that).
> 
> Special handling for really used VIRQs in the kernel can have some special
> handling, of course, as they are known already and should be used 
> correctly.

Thanks,
Jason

