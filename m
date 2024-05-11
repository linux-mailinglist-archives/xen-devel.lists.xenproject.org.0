Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94508C300B
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 09:31:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720227.1123310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5hBB-0002w6-LN; Sat, 11 May 2024 07:30:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720227.1123310; Sat, 11 May 2024 07:30:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5hBB-0002tC-Hg; Sat, 11 May 2024 07:30:01 +0000
Received: by outflank-mailman (input) for mailman id 720227;
 Sat, 11 May 2024 07:30:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0W/u=MO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s5hBA-0002t5-GR
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 07:30:00 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20605.outbound.protection.outlook.com
 [2a01:111:f400:7e88::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43d4684c-0f68-11ef-b4bb-af5377834399;
 Sat, 11 May 2024 09:29:58 +0200 (CEST)
Received: from CH0PR03CA0309.namprd03.prod.outlook.com (2603:10b6:610:118::30)
 by MN0PR12MB6001.namprd12.prod.outlook.com (2603:10b6:208:37d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.54; Sat, 11 May
 2024 07:29:51 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:118:cafe::73) by CH0PR03CA0309.outlook.office365.com
 (2603:10b6:610:118::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.54 via Frontend
 Transport; Sat, 11 May 2024 07:29:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Sat, 11 May 2024 07:29:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sat, 11 May
 2024 02:29:50 -0500
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sat, 11 May 2024 02:29:48 -0500
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
X-Inumbo-ID: 43d4684c-0f68-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HD5PtHUD/UEHJ3cPC5NTNAN4rvPJ4RwTRc0j7wPcSfoD4Nk/p/a/DSe0vXPRUNN48+KQ9gOMnfSVv8CDetQv9Lf3cfSzyanVu8VM64EXVZFhPzbYSHVgBZVPr7HeYHWvCKoMoXLmn/gsHVyXcz6CIxYkGsAAZY8PDOEMEbKQuz/W4OTXmtB66ohtUEHJng6rCmxcE9jHxAYvTbUypdCd7ucV5qquhBE/OK/JrLxj8OEuqDLb+lZA98sPZ1NpHjiIhmgv046cIyPX6u6ccaqc8KD1hrDOqZTFV0ZQKBx7vLits3XaDNaE1vtGuXXDABUgCzWTKxMx7FSb7ZIR3IxZ8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSIOxDBb6opTW+eXESXU5shvpcAEyhf3/skZqhC1BIw=;
 b=W8WKfdfdIJZLbYgLccE6OheeEZ5+5mjIX48pBZCaMSazC50LmHMxMvsVRnnOP+UQoy7m0ECPkvAILerTOT8SHfhoJAPr9E4NV3m4BO6X1gIvWkKPWcorlMTlCAaRZjQX6Re+XvcZTvoNIEiKhxkPosspN7L+3h0i16xncuDSJ9aGIsYuFsiaY/+SNXfUtCRvfRvWDBJIyzGxrZF838Fzm2PLJjWtuIfuJ9jhJ6+aIvzuVTmtvlf+m7/6U2Pc/hX9pHLP21q19LvRbL34mapjWfugOhDjCLZbQIN7daj9D1cxT+tTnntoCX1ku6vZwWWRw5gzTOv4byjdIhUrcf8gUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSIOxDBb6opTW+eXESXU5shvpcAEyhf3/skZqhC1BIw=;
 b=EJo4M7KeTgOOGy2q26bxnGBCJhRoP0HU58ZZzdFClZ11QA3Lgey8CkCDZdgKEqd07O/7s9G9YUh3D5/4ITv+4K+9IIMNBnChdW3wFPQKw0Yu9CiTFC/ypysLf9mT98nmxBnv6lQEgt+jzwwmBzBUREKn9lDbmp+LtM31NdQjRG0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <1e9c6513-8e45-4202-a25e-bc342072d6cd@amd.com>
Date: Sat, 11 May 2024 15:29:47 +0800
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
 <1a29ae76-a902-4a24-8fd1-ac26ef228971@amd.com>
 <365e1b12-6b20-40ed-8ca9-beb643c907ab@xen.org>
 <145e4192-3113-415f-876c-e67145d1d5c9@amd.com>
 <f30f7599-6bcd-4b8d-bd1f-6afde18c14c8@xen.org>
 <8957ab21-796f-4e15-a89e-d040e6f7b5ca@amd.com>
 <995ce39d-6a04-4bdc-bfe8-bcef3da24cc2@xen.org>
 <ff5e2477-ed5a-40cd-a592-5ceb3bc8f1f1@amd.com>
 <1ad2c873-219c-4d96-82d6-e1bc58216f2d@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <1ad2c873-219c-4d96-82d6-e1bc58216f2d@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|MN0PR12MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: 774ccb05-707a-4d05-b2f9-08dc718c24df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|82310400017|36860700004|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0hKaHNXcGNXR0Z5Q2xnbDZFWWZrbSs4Q1V4OCtuQ0wwWUZaQTU4elY1aUVx?=
 =?utf-8?B?QkVGa2hEd0J4V3FTZHU0UXVNc01NWVhYbTNEWHVZa01aMnVIc0dNd3BxR3ZM?=
 =?utf-8?B?UFh1ck1DN21PdUlxT1MxMmdwTmJEMFNseE05OWdBWStKc3lLellvVFJXVTkr?=
 =?utf-8?B?emdKSHpZYTMwSTV4aVZQOVd0RFFkekRtL1dBbGt0MndRenprMVFLbnJNT09w?=
 =?utf-8?B?d3dDZ3RpRlBzeTZaem44b0xORWVsZHMyRGdDOStxejJkMG84OStudUxncCsx?=
 =?utf-8?B?OW85WDZ0VEVDeHJicFV1N1d1S1krMXRuRUJMY1k0Wk4veGJMTG9xTDVPSjRP?=
 =?utf-8?B?SEQyU2hRcjJQS1lmYjFjVWd5Z21vRkU4UGVUSTVheU1ueHozaVpsQVBYNWQr?=
 =?utf-8?B?c0p0Q1RCSVNwQWRQZThKOUZCQUNmbXRpdDVtbGpIMDNZWHNieUZydmJrK1lF?=
 =?utf-8?B?cVVEc09kU2RvamQ5K1JXSTVEZXNsM1RrbndsZU1tS0JZcGtDdHI5aXZneEov?=
 =?utf-8?B?S2ljbGRwejFJeE5jbktiQ29RVm54NTE2QW1ZQWoxUTZTcjZSRkRHV1NpK3Ax?=
 =?utf-8?B?ZDh5UjdiY2tkWlJpOU1QTVFnOUxKWEduZWJsSTdlb0huUWIySUhQREFpVmd0?=
 =?utf-8?B?TUc1WjVnUE4ya2NOMklFaEhEbytuelJZZlVKUy9yYkM4enVzUzJKOWJQL1Fl?=
 =?utf-8?B?ZnhYV0tmbHRaZUNsNGxzMEMwdGNsYUlVVHNheENjYnhnbi8xRFN4c09VYkZZ?=
 =?utf-8?B?U29SRmRUaUViNkFYUjFYWGZsMmZ4MDh5aTN1Y0FRQ05NeU5lMEIrL0hJdDBu?=
 =?utf-8?B?QkdxVEthVFFZWVA3VThoczBmNzRCZ0JGcDJPaVlhemJiVUpESFhYWXFxRmo2?=
 =?utf-8?B?SGNxV3Fka0d2TTFxMkY2c09wTzJnU3oyYUZaazRuc1FDUDM4OFpzMkZsMWx1?=
 =?utf-8?B?MjlVbURidFMwY3k1M29FdEg4MkRaUitiaDNlZkN0UzVLRks4Vm5WNGlCWGl3?=
 =?utf-8?B?OXRwQ1RpVG9RZmQzUzRkZWs0dlpTUmY1MkpLb3JNaVFmZU82MDNla244VlVT?=
 =?utf-8?B?WThrQU14SU9mZGwwSUk3bW85SlpnNkFEb1o4Wm1vRUxRWUwxQkNiaDJIOUFn?=
 =?utf-8?B?alhBMXN0UkQwQ3lWZUQrckx0K2lRbFdFTjJ1SDRyVG5aU29BZ0kyazFhMktI?=
 =?utf-8?B?bXBCQ1hUVjRMU2lRbkptOWwzUVdvY1Z3SHhoK1hRZ09yYTRXaWpsTFFOaEpl?=
 =?utf-8?B?ZzVwUS9UU1pqc3ZCTnB4VzgrWnNUNjRZNE10VlVCNXFJSm5vc2c2YUZ5Q29u?=
 =?utf-8?B?KzVaL3NJeEJTdkFlTUxWdTh2OHNiaWZzT0l0MjBqYVVZSFpTUzA3THhFZjhj?=
 =?utf-8?B?RUFjanpNYzZwclcwRGZLZFRqWHQ0SHNtWC9udFhwUkhZMndpZnRQNnB4Q3BX?=
 =?utf-8?B?NzVyUmdYTjY5MFpKcDZWaGNzaVRlNHNIWXN0UmN4V1lHS204c1VvRE1GRldp?=
 =?utf-8?B?cGNRR3dQK0Z0UXBvZ09RQ2pqcng2Z0pjQzdoOUl0bDF5YWFValNBSlBIRVNu?=
 =?utf-8?B?QUsyNEpOMDIzY1BYY3hDU25RaTY0ZS9CckFPRms3U0lKaW80Znh1OVVyTDBE?=
 =?utf-8?B?WnVaU2hhSVdTMUJ1QlpxYmVsSTlYeUZRQmhlRlhYaElWSkJXdk92UDZTTDIv?=
 =?utf-8?B?RXp2ckNFQTdvYjJBbXpXOXBReCtMK1MzZ2NZZHlxWnl6N080UlpuSDlpN0ZO?=
 =?utf-8?B?bUZIZGxGN0oveDdZeEdhZWZDQXIrU0ZmdFBPQzFRV3V0VE1tbXlVU25mdEtl?=
 =?utf-8?B?T1JiVnI1SVJKbjRrOVhBend2dXpiTUxPdGxjT2JTUVBSNGFlem9OY1hBRVhD?=
 =?utf-8?Q?psYvby3eRT5Zo?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 07:29:50.6986
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 774ccb05-707a-4d05-b2f9-08dc718c24df
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6001

Hi Julien,

On 5/10/2024 4:54 PM, Julien Grall wrote:
> Hi,
>
> On 09/05/2024 16:31, Henry Wang wrote:
>> On 5/9/2024 4:46 AM, Julien Grall wrote:
>>> Hi Henry,
>>> [...]
>>> ```
>>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>>> index a775f886ed..d3f9cd2299 100644
>>> --- a/xen/arch/arm/gic.c
>>> +++ b/xen/arch/arm/gic.c
>>> @@ -135,16 +135,6 @@ int gic_route_irq_to_guest(struct domain *d, 
>>> unsigned int virq,
>>>       ASSERT(virq < vgic_num_irqs(d));
>>>       ASSERT(!is_lpi(virq));
>>>
>>> -    /*
>>> -     * When routing an IRQ to guest, the virtual state is not synced
>>> -     * back to the physical IRQ. To prevent get unsync, restrict the
>>> -     * routing to when the Domain is been created.
>>> -     */
>>> -#ifndef CONFIG_OVERLAY_DTB
>>> -    if ( d->creation_finished )
>>> -        return -EBUSY;
>>> -#endif
>>> -
>>>       ret = vgic_connect_hw_irq(d, NULL, virq, desc, true);
>
> This is checking if the interrupt is already enabled. Do we also need 
> to check for active/pending?

Thank you for raising this! I assume you meant this?
@@ -444,7 +444,9 @@ int vgic_connect_hw_irq(struct domain *d, struct 
vcpu *v, unsigned int virq,
      {
          /* The VIRQ should not be already enabled by the guest */
          if ( !p->desc &&
-             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
+             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) &&
+             !test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) &&
+             !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) )
              p->desc = desc;
          else
              ret = -EBUSY;

I think adding the check for active/pending check at the time of routing 
the IRQ makes sense, so I will add them (both for old and new vGIC 
implementation).

>>       if ( ret )
>>           return ret;
>> @@ -169,20 +159,40 @@ int gic_remove_irq_from_guest(struct domain *d, 
>> unsigned int virq,
>>       ASSERT(test_bit(_IRQ_GUEST, &desc->status));
>>       ASSERT(!is_lpi(virq));
>>
>> -    /*
>> -     * Removing an interrupt while the domain is running may have
>> -     * undesirable effect on the vGIC emulation.
>> -     */
>> -#ifndef CONFIG_OVERLAY_DTB
>> -    if ( !d->is_dying )
>> -        return -EBUSY;
>> -#endif
>> -
>>       desc->handler->shutdown(desc);
>>
>>       /* EOI the IRQ if it has not been done by the guest */
>>       if ( test_bit(_IRQ_INPROGRESS, &desc->status) )
>> +    {
>
> I assume this is just a PoC state, but I just want to point out that 
> this will not work with the new vGIC (some of the functions doesn't 
> exist there).

Thank you. Yes currently we can discuss for the old vGIC implementation. 
After we reach the final conclusion I will do the changes for both old 
and new vGIC.

>> +        /*
>> +         * Handle the LR where the physical interrupt is de-assigned 
>> from the
>> +         * guest before it was EOIed
>> +         */
>> +        struct vcpu *v_target = vgic_get_target_vcpu(d->vcpu[0], virq);
>
> This will return a vCPU from the current affinity. This may not be 
> where the interrupt was injected. From a brief look, I can't tell 
> whether we have an easy way to know where the interrupt was injected 
> (other than the pending_irq is in the list lr_queue/inflight)

I doubt if we need to handle more than this - I think if the pending_irq 
is not in the lr_queue/inflight list, it would not belong to the corner 
case we are talking about (?).

>> +        }
>> + spin_unlock_irqrestore(&v_target->arch.vgic.lock, flags);
>> +
>> +        vgic_lock_rank(v_target, rank, flags);
>> +        vgic_disable_irqs(v_target, (~rank->ienable) & 
>> rank->ienable, rank->index);
>> +        vgic_unlock_rank(v_target, rank, flags);
>
> Why do you need to call vgic_disable_irqs()?

I will drop this part.

Kind regards,
Henry

