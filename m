Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K6/RG0w3TmqpJAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:41:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACB5725F5D
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 13:40:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=FdQm6OxO;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356906.1611429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQdu-0005QK-Ul; Wed, 08 Jul 2026 11:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356906.1611429; Wed, 08 Jul 2026 11:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whQdu-0005Oo-QJ; Wed, 08 Jul 2026 11:40:42 +0000
Received: by outflank-mailman (input) for mailman id 1356906;
 Wed, 08 Jul 2026 11:40:42 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1whQdt-0005Oi-Ug
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 11:40:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whQdt-00HMwQ-BQ
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 13:40:41 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4e3734-5cb7-0a2a0a5109dd-0a2a4502b206-18
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:40:41 +0200
Received: from [52.101.46.30]
 (helo=CO1PR03CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4e3737-5a27-0a2a45020019-34652e1e75cf-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 13:40:40 +0200
Received: from PH7P220CA0052.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::34)
 by LV3PR12MB9213.namprd12.prod.outlook.com (2603:10b6:408:1a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 11:40:35 +0000
Received: from SN1PEPF00036F3C.namprd05.prod.outlook.com
 (2603:10b6:510:32b:cafe::65) by PH7P220CA0052.outlook.office365.com
 (2603:10b6:510:32b::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 11:40:35 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F3C.mail.protection.outlook.com (10.167.248.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 11:40:35 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 06:40:34 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 04:40:34 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 8 Jul 2026 06:40:32 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ptmCN9zLpo+fQINeLgSnwlx926ueDzp1sm+jJYVSSK8tYt7eZ5XuuPtIP/8JH7oenYLcVELxlG3SLJJkgvZlYH/uBUqshbnZro7nKOnZ9Z0kjNwTG3VFsNzHlhfBdQDhaLGq8pjT8Xr9GoXwriJom0XMYBMwKl5I4IsMS059paBLsEfyWPgKBZ7LNnmi8PRR9NX6nDqZlQV6fXjUhwqxJbLU77dTlwZDUgaL+fW5L7QIJmYqg/IMO3i5Mg3JCiTptuFs5EuCpwVVvOckq6cXvk4y7NabeikoZJoOyJZ5X+TMl5H5sLkBu9kYflImjTB/o2L4PYCKMJCnd+6c8ySASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=15GRzMNsqIbB/evT3tBPJrK/H7jL8Rhe9uVvGwFg798=;
 b=izntbHwSzpHiVAMWxarSIHgfLxVtYr3pVcuxX+C8+ed2CQFOazBWR80811BJ23rFm4W1PpD4m7703ScnqlkPEeZxsH6YxeXwmUijBoLUKglrr2tdFBjt9ffaGvQAqDVqrwoFksGUcTjwgiXLM6Et2D7qk1aLJ7IudYwO/oVS/98xHn4POoTsL1Kj/KadWR2g8CeKp3TIAUd2xPVcyCNyq6dohibrF51S+gJPz3Yu4945HVPxfbSsZ7MhXcJ//Ip29UYEy9n2YlEN7HTMwlsbOp+HOHDokzgR9pmDwALgcWuNFM1bZWGtRtcCqCaRmjBLY6baEISglCpK2HA9xc7yuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15GRzMNsqIbB/evT3tBPJrK/H7jL8Rhe9uVvGwFg798=;
 b=FdQm6OxOlHVNVnE9HkpfeevD3LEA0U0TkgfCV7dpImNKzKm6kcqBe6+pUWDw+iKpyChV7nUr0ZvjIz1ZPcTsTROOFPColGwY+phz+D0ezyDXlWp/lPEK/aiuvF2erfFUaj1sWdnaveWMxG85CmlsxQPlggA6NyeDfqMnzS6+wJA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e2cceffa-4f7d-4b4e-b69b-3cf11e0049ae@amd.com>
Date: Wed, 8 Jul 2026 13:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.22][PATCH] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, <ayan.kumar.halder@amd.com>
References: <20260708074919.33381-1-michal.orzel@amd.com>
 <1cce5057-3f17-4144-acc7-b343718c431f@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1cce5057-3f17-4144-acc7-b343718c431f@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3C:EE_|LV3PR12MB9213:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5dea16-99a8-49a0-876d-08dedce5b999
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|23010399003|82310400026|36860700016|1800799024|376014|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4pb41l5fLyRzVKm5sJj5Tw9V9KFIJSzdzoqn32fl65X+AxBtgSMY5cv6aNIgPOEamSYNA3U02HciTWrH0Fe+h0cd+iNFzk1NiTLRsg257fBr8ro4rUToOCHOxxcNmPlhvDmGHcjNTZemErWXgIJ03sWgQ03clzn89Cmzw2gl7aLFl2Ue4IGh1ET9JcN2ChjQTgTb5/3+lKinWKLqlu1SRlN8WnILyH72qlF0FDQUfdBQsE1K+OE7Xv/4unYFzZeRHLwnUnVf8wDs494uEKovlDHbsuMXZIPXBLUNByVVHoxoP9R1Ttq85coMV0iaxaOg4EyGEArS2VdV81m1A6aZmhwxMiXW2QryKVZDuLNpNzayke6o3eehDVNltyYCnmqwfyMKMP0JgRBeESfV1khPM6N9JFtbnllD0Ns623arXD7JaEyTaiIfdQ2rRnR8uM8VONvSooKtYhhU3/kGHFchYKNolsl11RmOyw03ukmhu4Fc8Rr4HElC4q1l0ITgHD3yfoTCgvhQbfHTFR8Vk3ZH2EkKZP2AlYQQ0tp8faRNVQQH84CT8u/yA8Td64eLhPuk0p8fnmxlMcL3RemP/RaJhFZ5iCB/CoxhcE/qBVYXa4xhcnnrHV7iWkPnGrOduKV0+Yi1qfVkP3HI+ru2dn1o4DmuZORwHHRwk71dJN1/eytEUlQljc+5qnnTFsrx4sYM4OCY02btEg0IeSLni4X0SA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5tHpjBKFS9cRwJPduJuUn/AytROLf3h+H1DMGKjVrv3RcDt3yTzY+BbYd0L8GzSRiAxS+AAWDIuTEug14sqV5Mjpsq2ZZTfH09ov/9r7eNYMgoBX/TI3F+t3Fltu4zgBb1IT1n+iRT2TTZpMTsAVBKs4eeJ8OnrR7XhtgujUsMp8Li6nasAP1nkaSHdfdZM5tkVTZrmmFI+p8fTR3kbTC1ZJRwLcHIALro4JaCmJ8drqRr8G6eSAu+oTCLrmKlM+QgishLKvJLuzip3yzObS1o1EUF3lknk28FtAIRImjx+rwfFLD93cinpYNDmGDVuZI+6tGQNEoUQhPIICYFNV977cc0MpZVyhX2UIRTArSKrP9/69vhRBGkPA+kjP5zVnL2ojW66t9VW0Gl353BL/XioDnuSxVS9rg7ENROs+droo1rMJRKUOUJd/nld83RTB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 11:40:35.2304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5dea16-99a8-49a0-876d-08dedce5b999
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9213
X-purgate-ID: tlsNG-720697/1783510841-554E17C5-1B0C55F8/0/0
X-purgate-type: clean
X-purgate-size: 3365
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AACB5725F5D



On 08-Jul-26 13:30, Andrew Cooper wrote:
> On 08/07/2026 8:49 am, Michal Orzel wrote:
>> construct_domain() creates the secondary vCPUs in a loop, but on a
>> vcpu_create() failure it only prints a message and breaks out of the
>> loop returning success. As a result the domain can be constructed
>> with fewer vCPUs than d->max_vcpus, leaving NULL holes in d->vcpu[]
>> below max_vcpus.
> 
> I'd suggest phrasing this as "partially constructed".  "holes" isn't
> really what's going on, given the linear nature of allocation.
> 
> Because of the object visibility, and because constructing vCPUs isn't
> atomic, all code needs to cope with d->vcpu[] having no, some or all of
> d->max_vcpus constructed.
> 
>>
>> When the guest probes the redistributor of a vCPU that was never created,
>> get_vcpu_from_rdist() only checks vcpu_id against d->max_vcpus and then
>> dereferences the NULL d->vcpu[vcpu_id], resulting in a data abort.
> 
> That's unsafe, especially as vcpu_id is calculated from an MMIO access.
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index c1c4d6f71ea8..c01cc596d593 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -1111,10 +1111,10 @@ static struct vcpu *get_vcpu_from_rdist(struct
> domain *d,
>      unsigned int vcpu_id;
>  
>      vcpu_id = region->first_cpu + ((gpa - region->base) / GICV3_GICR_SIZE);
> -    if ( unlikely(vcpu_id >= d->max_vcpus) )
> -        return NULL;
>  
> -    v = d->vcpu[vcpu_id];
> +    v = domain_vcpu(d, vcpu_id);
> +    if ( !v )
> +        return NULL;
>  
>      *offset = gpa - v->arch.vgic.rdist_base;
>  
> 
> Do you want me to submit this separately?
If you have time, yes. Otherwise I can do that too tomorrow.

> 
> 
>>
>> Return an error instead of breaking out of the loop. Both callers
>> (construct_domU() and construct_hwdom()) already propagate a negative
>> return value and fail domain construction, which is the correct
>> behaviour: a domain that cannot provide the requested number of vCPUs
>> should not be brought up.
>>
>> Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>  xen/arch/arm/domain_build.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 550617f152bb..b46574fd32aa 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -1847,7 +1847,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>>          if ( vcpu_create(d, i) == NULL )
>>          {
>>              printk("Failed to allocate d%dv%d\n", d->domain_id, i);
>> -            break;
>> +            return -EINVAL;
>>          }
>>  
>>          if ( is_64bit_domain(d) )
> 
> On x86, we explicitly tolerate a failure to build all of dom0's CPUs, if
> at least one did get constructed.  This is to increase the chances that
> the server can boot and at least let an admin in to look at things.
> 
> However, I can see why such a behaviour is not wanted in a "single
> pre-packaged system" as used by automotive.
Yes, that is a known difference in behavior between x86 and Arm. We decided to
bail out asap.

~Michal


