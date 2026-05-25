Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7NaOGbcaFGoGJwcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 11:47:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CFE5C8C92
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2026 11:47:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1319106.1586830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRRt8-0006rI-VV; Mon, 25 May 2026 09:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1319106.1586830; Mon, 25 May 2026 09:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wRRt8-0006oT-Oy; Mon, 25 May 2026 09:46:22 +0000
Received: by outflank-mailman (input) for mailman id 1319106;
 Mon, 25 May 2026 09:46:22 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wRRt7-0006oN-Oc
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 09:46:22 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wRRt7-00470x-4m
 for xen-devel@lists.xenproject.org; Mon, 25 May 2026 11:46:21 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a141a65-5cb7-0a2a0a5109dd-0a2a4502c18a-6
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 11:46:20 +0200
Received: from [52.101.61.27]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a141a6a-af86-0a2a45020019-34653d1bc093-3
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2026 11:46:20 +0200
Received: from BL1P223CA0016.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::21)
 by PH7PR12MB7019.namprd12.prod.outlook.com (2603:10b6:510:1b9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 09:46:12 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::79) by BL1P223CA0016.outlook.office365.com
 (2603:10b6:208:2c4::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Mon, 25
 May 2026 09:46:11 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 09:46:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Mon, 25 May
 2026 04:46:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 May
 2026 04:46:11 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 25 May 2026 04:46:10 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LarfoQTigKAKL8w9WZmnV1KU/CADGZgq45JGiqsrBOStp/e+qu8qg/Cmv3YXfT6kh8IOp44oMWb2dSmoyT87lyVjYaUrbRvK7HAPlPNI2jnT2IBpZ6k1j3v2aZGdlZQJ1mBe6TuC6zsUiyBaVal3HdY+4R2CSYIDigLKg551rM+gtaSD2PzD7pqh5zAmQT3Wri81c0QBFE+Rq/xDL50GPJl6tJ1mPxEx8eQ4lF1qZXozLofFXWaF8rElAyokaXB+ZtS/MrFSjwG3gGc8UKaSUOHjYfdxHKIjZKM+n1Y1PIQ/eRk32JIlFlmddNWW2qwtZrIXRKgkh04E2Cf+RL2CNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ahRO5UdBbWodjZgE60oN0b0QE3VVyY2NqX5GA8TthSI=;
 b=WH5h+y2nfBuBPE9pMARw2u6OPO5Hc1EXE+rVe0iRnVHfN+O22I1oGY55tnCRGtuASPhNoxE4RE4DTdd/cv+/YehLQjU4yCumhD1irDJDrVC/RADvQNTjl+EO9dP4cDeckTMGYxC2CkOgCIhteLfE5pKuIzSeYKoRpaVRHvsPd5cDNcbLoFDEAwpTHL1XibeV4SKFFdBQIJd4riLh+KBZZz/jeMgjAjjqLQx3Z84ERzqFEV/+ESAzNitJylnGa/xjb/4QC7M0SpKujHxSj1ySZP/NM3iBhEZKuFS7iNPENyTfiVL/1C3/JG5u+cxlOOb56qAFLG6Y609KU3qg6mF2ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ahRO5UdBbWodjZgE60oN0b0QE3VVyY2NqX5GA8TthSI=;
 b=QK24cXM3ZdeMSiIP/BERW6QCDhpB/ydiKGqigy7hZ7V2tQHPnf6GNmh6e7bEMKUNv1/5PflRZc5WCQFu+c6Z8aoklDOR20sf0wa8VsIcSoLNvFN1Sf+HLYNaKVj+4YsrOP4Roa/puCwSd+8alMMKREhKjKzUYtp2NZup1pqOTtc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <eaf40a4c-ce82-4a34-91f1-9cdd0bbff7fb@amd.com>
Date: Mon, 25 May 2026 11:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: propagate vGIC vCPU init failures
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Mykola Kvach <mykola_kvach@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1779430299.git.mykola_kvach@epam.com>
 <f9a0308092deb2135d32ad9fc2c5ccafc8a7320e.1779430299.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <f9a0308092deb2135d32ad9fc2c5ccafc8a7320e.1779430299.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|PH7PR12MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 03e0c321-ecd9-48f6-103b-08deba427488
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|11063799006|4143699003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OWm+kH/uliS3Xgl4bs50dxnEshSbl4SFo3dx2dCvpGZREUtQ5XTseqTxkhGw9bl8k/htblkVzMq/RiSN4uob1v6UQJnuekxR9Jh/vE3KyDX3bSOx5OrvkZ0+n768coduYPKyFzaTWQEzStOc1eeKPuoqqubEVfjSUgAFQ8u2R6og/ZHAlM18MIzZ5PIyUTGTkW0zREVpqapr+ehW5idOte9DU9NTfORmMmjksZmhbRQQd23SZYeBDj0GI2hRJZMfj0HYPcSS4zD5bzG1mlu9JdB/UjPaOOYuf+krzYLPbtJhD3GxFYsgRi3jmBhIVI1OuHiAvWdcLWvOoLW13/WAc3FeWTe4qXO2Eql1buYEZXx655zNxYXCsTcTbho+RwwioppjQ68oDM/Z73W+YF5kK8AN2ZXWld8Inzm99QQT7/wuY7y1RqZqPB841zpmYsZKexWcpPUxA5Q71WSZPSz3+Gk0oyS0yPy+SfBzyDfUg4u0msZexJTHkeRo7qDTGaV8FRjyksyjP/Dc/WwFR8urUmJyB9ntcYOD2/NhBoqVxP3nC7dKKGA6XJ0sgiGlmPuJqiWGP3dEZswAFZiJkzlR3rNQX+hkNDEPNJ7Mdfd7s2TZFS+TriObPFpxba6n+1CRTjwEVVXJ979PLZkvu3gw4VKZBoh9L7+T7rcflSTlBh41T73G8rRCeL+HAqknVePAlqNeA8YNJ4L8CeYfeO8y4JYaeH5W7BZtExDy24r/5mQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(4143699003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UdKRs0PsG0bHIo36GTWinbO+buMG9WNAOb2rEG5mXmSUDKCVWGhWt30Z6NGMuRDEgpHSxq7a5zA+sC/Aq7IiyiCCfqkveY2gjvbL8xz06Zo2qKLqY9lAM705ygBfp67PRzA0QdXZGJZqmW3lFGPxcxTGBl8q9TO+1E1ZelKEg1V8vALXPyeVpqlT6ACeaVswcyXFsLtPs0S3K+SYAZ+eFjfLtFaZhhF4kq6DQE3Rk8HYbMpGqTw8Xj4fjanJ4Dek5qztPdAoqYoGH6+dWxeAQSSp49kL8D8tW4yk6fIwD7cHATeBPa5rdX55RClDFtVVhftZEglFJbv00I1xAkQRGJqFAB0BKa0LdpGKDtvzFzFry6+jAoHcGueXAguw87EbqDVICqY5O59iU2fjiSw+WL/owkidvH+nR3zdqiGPKyfWuykrwrvmzpmyY2FA4ccB
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 09:46:11.8427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03e0c321-ecd9-48f6-103b-08deba427488
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7019
X-purgate-ID: tlsNG-720697/1779702380-80145161-1FB4BEB6/0/0
X-purgate-type: clean
X-purgate-size: 5795
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xakep.amatop@gmail.com,m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:xakepamatop@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWELVE(0.00)[14];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B2CFE5C8C92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 22-May-26 08:18, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> The vGIC per-vCPU init callback can fail. In particular, GICv3 rejects
> a vCPU when the domain's redistributor layout has no MMIO slot covering
> that vCPU. However, the generic vGIC init path ignored the callback
> return value, so vcpu_create() could succeed with an invalid vGICv3
> per-vCPU state.
> 
> This can be reproduced on FVP Base RevC by exposing a 2 MiB GICv3
> redistributor region to Dom0 and booting Xen with:
> 
>     maxcpus=1 dom0_max_vcpus=64
> 
> The host GICv3 redistributor range is:
> 
>     region 0: 0x0000002f100000 - 0x0000002f300000
> 
> With Xen's guest redistributor frame size of 128 KiB, that range covers
> 16 guest redistributors. vCPU16 and above have no corresponding
> redistributor slot.
> 
> Before this fix, Xen detected the missing redistributors:
> 
>     d0: Unable to find a re-distributor for VCPU 16
>     ...
>     d0: Unable to find a re-distributor for VCPU 63
> 
> but ignored the error and continued as if the secondary vCPUs had been
> created correctly. Dom0 then saw 64 possible CPUs and could hang during
> secondary CPU bring-up:
> 
>     smp: Bringing up secondary CPUs ...
>     d0v15: vGICR: SGI: unhandled word write ... to ICACTIVER0
> 
> Propagate the vGIC vcpu_init() error so the caller can stop creating
> secondary vCPUs. With this fix, Dom0 construction reports:
> 
>     d0: Unable to find a re-distributor for VCPU 16
>     Failed to allocate d0v16
> 
> and the guest continues booting with the vCPUs created before the
> failure:
> 
>     smp: Brought up 1 node, 16 CPUs
> 
> Free the private IRQ rank allocated by vcpu_vgic_init() on this error
> path. The caller will still run the generic vCPU creation cleanup, but
> XFREE() clears the pointer so that cleanup remains idempotent.
> 
> Also fix the host-layout redistributor region count for the case where
> the requested vCPU count is larger than the capacity of all host
> redistributor regions. The old code always stored i + 1 after the loop.
> That is correct when the loop stops inside a valid region because the
> requested vCPU count is covered. If the loop exits after consuming all
> hardware regions, i is already equal to the number of allocated regions,
> so i + 1 records one region too many.
> 
> In the same FVP setup, that off-by-one made Xen describe host-layout
> GICR state beyond the populated redistributor region list. Dom0 then
> accessed the GICR MMIO window described in its device tree, but Xen could
> not match the access to a valid emulated redistributor frame. During
> debugging this was seen as an unexpected vGICR access followed by a
> guest panic:
> 
>     d0v0: vGICR: unknown gpa read address 000000002f10ffe8
>     pc : gic_iterate_rdists+0x4c/0x104
>     Kernel panic - not syncing: Attempted to kill the idle task!
> 
> Keep the existing best-effort Dom0 policy: a failure to create a
> secondary vCPU stops the secondary vCPU creation loop, but does not fail
> the whole Dom0 boot.
This is the construct_domain() policy that is used for both dom0 and dom0less
domUs. I must say I don't really like this policy and it's against our *generic*
Arm policy to fail the domain creation on any error especially if this belongs
to unsatisfied user requests. This is not really related to your series, but I
would like to ask other Arm maintainers about their opinion.

> 
> Fixes: ea37fd21110b ("xen/arm: split vgic driver into generic and vgic-v2 driver")
> Fixes: 54ec59f6b0b3 ("xen/arm: vgic-v3: Don't create empty re-distributor regions")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/arch/arm/vgic-v3.c |  3 ++-
>  xen/arch/arm/vgic.c    | 10 +++++++---
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index 77517c3030..360778eb32 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -1834,7 +1834,8 @@ static int vgic_v3_domain_init(struct domain *d)
>           * not match the number of pCPUs). Update the number of regions to
>           * avoid exposing unused region as they will not get emulated.
>           */
> -        d->arch.vgic.nr_regions = i + 1;
> +        d->arch.vgic.nr_regions = (i == vgic_v3_hw.nr_rdist_regions) ?
> +                                   i : i + 1;
Wouldn't min(i+1,vgic_v3_hw.nr_rdist_regions) be cleaner?

>  
>          d->arch.vgic.intid_bits = vgic_v3_hw.intid_bits;
>      }
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 6647071ad4..e55e484493 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -368,7 +368,7 @@ void domain_vgic_free(struct domain *d)
>  
>  int vcpu_vgic_init(struct vcpu *v)
>  {
> -    int i;
> +    int i, ret;
>  
>      v->arch.vgic.private_irqs = xzalloc(struct vgic_irq_rank);
>      if ( v->arch.vgic.private_irqs == NULL )
> @@ -377,7 +377,12 @@ int vcpu_vgic_init(struct vcpu *v)
>      /* SGIs/PPIs are always routed to this VCPU */
>      vgic_rank_init(v->arch.vgic.private_irqs, 0, v->vcpu_id);
>  
> -    v->domain->arch.vgic.handler->vcpu_init(v);
> +    ret = v->domain->arch.vgic.handler->vcpu_init(v);
> +    if ( ret )
> +    {
> +        XFREE(v->arch.vgic.private_irqs);
> +        return ret;
> +    }
>  
>      memset(&v->arch.vgic.pending_irqs, 0, sizeof(v->arch.vgic.pending_irqs));
>      for (i = 0; i < 32; i++)
> @@ -944,4 +949,3 @@ void vgic_check_inflight_irqs_pending(struct vcpu *v, unsigned int rank, uint32_
>   * indent-tabs-mode: nil
>   * End:
>   */
> -
Stray change, please drop.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal



