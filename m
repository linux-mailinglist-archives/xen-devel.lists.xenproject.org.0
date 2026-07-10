Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DW2hLRoKUWqM+QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 17:04:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E92D073C0BB
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 17:04:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=K7V4SG7+;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359512.1613051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiCmT-0008Dn-2o; Fri, 10 Jul 2026 15:04:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359512.1613051; Fri, 10 Jul 2026 15:04:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wiCmT-0008C3-0A; Fri, 10 Jul 2026 15:04:45 +0000
Received: by outflank-mailman (input) for mailman id 1359512;
 Fri, 10 Jul 2026 15:04:43 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <ayan.kumar.halder@amd.com>) id 1wiCmR-0008Bx-CS
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 15:04:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wiCmQ-007QcZ-18
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 17:04:42 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a510a06-2eae-0a2a0a5409dd-0a2a45049f0e-8
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:04:41 +0200
Received: from [40.93.196.24]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <ayan.kumar.halder@amd.com>)
 id 6a510a07-b1e5-0a2a45040019-285dc41859d1-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 17:04:41 +0200
Received: from BN9PR03CA0783.namprd03.prod.outlook.com (2603:10b6:408:13f::8)
 by CH3PR12MB7739.namprd12.prod.outlook.com (2603:10b6:610:151::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 15:04:22 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::a2) by BN9PR03CA0783.outlook.office365.com
 (2603:10b6:408:13f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Fri,
 10 Jul 2026 15:04:22 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 15:04:21 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 10:04:14 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 10:03:36 -0500
Received: from [10.71.198.170] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 10:03:34 -0500
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
 b=V1SsdhKNvAJQI7QPSLpgo4OxH/tERtjr0YuynPbV8Ye/XJrAQHLvQSXo0N1AWSlTwJeVqo2cQPQ/UJkkgn9w6t1/kZcpY3EPd4YD+rZXGmzHajag7625iiN/1QmG76WR07JP0/oNCHp1RzXVFmBRgVOESEeYV5p6pPVEPWTm4XIVN+iDoNBKxyYnbVAd10xvYD0pc2gycJi+UT8kz1VPzYY5+MUKFIYUV5MeIAzz34E4x3o1/IhPpg5Kw2P5pWT4AFwo3yBKvzavuUljgh9fZn2YI4MfV90MpNUJXZuPC9oAhDgE3JV3mrj86ar/1PoADwwMc2neqZWy81EwsbL0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+GCN0uCPhbYpjkLakFcOrKmJerj6Qan4aAw7P14occ=;
 b=YYiVmYjxHgpHM9e0Z5qJDb9ICAl11lH6BU8xb5NZNBWAB97F4FXJtDTLpM21MxAP/xizoXV7mlyINcgcU4SbRXxvxDGdOnAUzFQKnKB5RFRF6HGqLNVGK/myrijuDThzOJrHYnb0NOeJjQuRD2NFv/KRu/DcIX6bWzsr+EV+9w/THlGEfkXcp510TmJOLM1kctbU44ZzGjCITqjQWDD8i0WHVIgrbkFbAPRyE0lsmt1LH6DoICklU9Aq+QSRmV6hGDjAZrhW0B2UMWv5L/cUbOke2CengVAB2aYC1rjK0Qy2gV5LF3JC9/j0a8l1fMwvXD+lIoNsSS5OPjGV4xi4rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+GCN0uCPhbYpjkLakFcOrKmJerj6Qan4aAw7P14occ=;
 b=K7V4SG7+RZuX8g1a4dvRDwwC0l6CwO+BtgkTHuXSISOGHYh/Y6jR3EjdqndSjaDvs4joCg/VDU0y0dwadjwTkK+jIU4Csb2Xkdhfx0HFdNqcRYnc/y6mwYwKx5dZU4uRvJauykxiDY+m3dCxAnMrHq9SznsqcILf/cpWOEW0cq4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <77ffbeab-ed35-409e-92fa-b64727000d53@amd.com>
Date: Fri, 10 Jul 2026 16:03:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] xen/arm: Implement p2m_set_entry for MPU systems
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>, "Hari
 Limaye" <hari.limaye@arm.com>, Harry Ramsey <harry.ramsey@arm.com>
References: <20260420142524.1804073-1-luca.fancellu@arm.com>
 <20260420142524.1804073-2-luca.fancellu@arm.com>
Content-Language: en-US
From: "Halder, Ayan Kumar" <ayankuma@amd.com>
In-Reply-To: <20260420142524.1804073-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|CH3PR12MB7739:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f5e3c5c-4fb2-47e5-6a1c-08dede9485db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|7416014|376014|18002099003|22082099003|6133799003|11063799006|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dsN/RX+7NS+7/Mr5STHjnEZ8wb6UK4BB9s2jAy9BVMK9cDLASC2T1qBQFxa9bNYnfBwqdsmsvVxDzclaRn174EN3+E9ecLuEtm8KDaVtThGxwkbz8cfSZ87MduQ66nrXMSd1IpA5SAPuT4c4fr3EzEPh1SOEFL2hPbkkcjn8hT2+cWCfvqhDW0DLQG2ooahzY55XHBWZzXSqlfPxgJmxj3Y9T6Omqt6N+kfMj/Ekq4SJ8cSR5IqcZbqAlucSwWUk3GK+vlP4Y7z8lWhmVKxSZZO47RJBkk/tsw/G+cLOuNCsRmVse6iKHWglUsLSgOm/JfVnVLrzJlPrhx0/xIf3Aa3iwdKgCpn6wK3m6YUNB4+sVeQdiApSSQ2dODbR8ujCjfitL1oYBqHDHQe9irSc4uH3poC00U7dftlXDUooa2zM6U0lXNQ+JDumcTxO5K2htzgbvoYXjFmyyUuXn/vVGD0Yh+5yQ1kT5fA/oFcdf86i4iP+Au7LI8X8yJg5Tf5rznzqpXNAsRiRbtI5TJ3s8R1RVuvadKRRTx3LyDa3mVKiAnHJQFXrWsi4fD6FQgIgxYZ3TJCkFgIcXwpHXbbxR70+3xQoFYNdPyeAoeO1GownjE6PlHARG5QJy0FBvM5Z53KqSpA5yJ4HWFeTgEMIezNElKYYoOUpeienOKMT2BD/Z11yOpo2rAKIT3yDpgkkAB4fWVP1eqeG5E+kOrimNA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(7416014)(376014)(18002099003)(22082099003)(6133799003)(11063799006)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hy0bMCpU2AhPXwi2Z7SS/zH/DlwNe8SKvDjbaVoh3WuzZGjq2+M3NZ8Lsmp5wxqNIXjLU9Mz2jo4YPRABNNGCNNkoX+Mbzv/D2sgh7JakvMDpqY+9SuxtD/9odrdgmM9y43Pk0QBw2z09hkdY9/yNHv9e4KfDVZNXnlo89HXLI0YEZ8To+EzPwb/K6ezBk5Yi3a6DY9zQVxlQpqYC3TvrvL/bjDm8vC4cwgXNWTxCaqos5Lv3fAcU1u1XaaRUALClqrBtu0PNqYQbOPHLGgVBBVNI/zK1MYpm1qTapYIAahL2qXf04qDhc/Z+AHumUlu8RKRRTEUvEMMKA4RlykuPJFVhlQztXQvOehJ/i5b7hC4Ksm/oxeTgPxXHfumcRw7fj/Azkvh1FkMYmH9LAzUYhwSEwbyYsKcwzJC2mtb3T4gZxUdqPEUBVTkvnnkS2B0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 15:04:21.4503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f5e3c5c-4fb2-47e5-6a1c-08dede9485db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7739
X-purgate-ID: tlsNG-ebf023/1783695881-7FBADFE7-C16FA996/0/0
X-purgate-type: clean
X-purgate-size: 14157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luca.fancellu@arm.com,m:xen-devel@lists.xenproject.org,m:Penny.Zheng@arm.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:wei.chen@arm.com,m:hari.limaye@arm.com,m:harry.ramsey@arm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ayankuma@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:dkim,amd.com:mid,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E92D073C0BB

Hi Luca,

On 20/04/2026 15:25, Luca Fancellu wrote:

> From: Penny Zheng <Penny.Zheng@arm.com>
>
> Implement the function `p2m_set_entry`, which is responsible for
> inserting a new entry into the p2m tables, for MPU systems.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Hari Limaye <hari.limaye@arm.com>
> Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
> ---
>   xen/arch/arm/include/asm/arm32/mpu.h |   3 +-
>   xen/arch/arm/include/asm/arm64/mpu.h |   3 +-
>   xen/arch/arm/include/asm/mpu/mm.h    |   3 +-
>   xen/arch/arm/include/asm/mpu/p2m.h   |  10 +++
>   xen/arch/arm/include/asm/p2m.h       |   3 +
>   xen/arch/arm/mpu/mm.c                |  43 ++++++----
>   xen/arch/arm/mpu/p2m.c               | 123 ++++++++++++++++++++++++++-
>   7 files changed, 167 insertions(+), 21 deletions(-)
>
> diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
> index d565230f84ee..ab58df079920 100644
> --- a/xen/arch/arm/include/asm/arm32/mpu.h
> +++ b/xen/arch/arm/include/asm/arm32/mpu.h
> @@ -42,7 +42,8 @@ typedef struct {
>       prbar_t prbar;
>       prlar_t prlar;
>       uint8_t refcount;
> -    uint8_t pad[7];     /* Pad structure to 16 Bytes */
> +    uint8_t p2m_type;
> +    uint8_t pad[6];     /* Pad structure to 16 Bytes */
>   } pr_t;
>   
>   #endif /* __ASSEMBLER__ */
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> index 8b86a03fee44..c82624f0f2cf 100644
> --- a/xen/arch/arm/include/asm/arm64/mpu.h
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -41,7 +41,8 @@ typedef struct {
>       prbar_t prbar;
>       prlar_t prlar;
>       uint8_t refcount;
> -    uint8_t pad[15];    /* Pad structure to 32 Bytes */
> +    uint8_t p2m_type;
> +    uint8_t pad[14];    /* Pad structure to 32 Bytes */
>   } pr_t;
>   
>   #endif /* __ASSEMBLER__ */
> diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
> index 1b5ffa5b644d..24bffdee4fb6 100644
> --- a/xen/arch/arm/include/asm/mpu/mm.h
> +++ b/xen/arch/arm/include/asm/mpu/mm.h
> @@ -75,9 +75,10 @@ void write_protection_region(const pr_t *pr_write, uint8_t sel);
>    * @param base      Base address of the range to map (inclusive).
>    * @param limit     Limit address of the range to map (exclusive).
>    * @param flags     Flags for the memory range to map.
> + * @param p2m       True for a stage 2 mapping, otherwise False.
>    * @return          0 on success, negative on error.
>    */
> -int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags, bool p2m);
>   
>   /*
>    * Creates a pr_t structure describing a protection region.
> diff --git a/xen/arch/arm/include/asm/mpu/p2m.h b/xen/arch/arm/include/asm/mpu/p2m.h
> index 39fc0c944916..b9c7be2d9dcc 100644
> --- a/xen/arch/arm/include/asm/mpu/p2m.h
> +++ b/xen/arch/arm/include/asm/mpu/p2m.h
> @@ -21,6 +21,16 @@ static inline void p2m_clear_root_pages(struct p2m_domain *p2m) {}
>   
>   static inline void p2m_tlb_flush_sync(struct p2m_domain *p2m) {}
>   
> +static inline void region_set_p2m(pr_t *pr, p2m_type_t p2m_type)
> +{
> +    pr->p2m_type = p2m_type;
> +}
> +
> +static inline p2m_type_t region_get_p2m(pr_t *pr)
The pointer is read-only here; take const pr_t *. Same for region_set_p2m's
sibling accessors added in this series
> +{
> +    return pr->p2m_type;
> +}
> +
>   #endif /* __ARM_MPU_P2M_H__ */
>   
>   /*
> diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
> index ed1b6dd40f40..43b383885da0 100644
> --- a/xen/arch/arm/include/asm/p2m.h
> +++ b/xen/arch/arm/include/asm/p2m.h
> @@ -54,6 +54,9 @@ struct p2m_domain {
>   #else
>       /* Current Virtualization System Control Register for the p2m */
>       register_t vsctlr;
> +
> +    /* Number of MPU memory regions in P2M MPU memory mapping table. */
> +    uint8_t nr_regions;
>   #endif
>   
>       /* Highest guest frame that's ever been mapped in the p2m */
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index aff88bd3a9c1..4ee58ded5ad6 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -317,13 +317,14 @@ static int xen_mpumap_free_entry(uint8_t idx, int region_found_type)
>    * Update the entry in the MPU memory region mapping table (xen_mpumap) for the
>    * given memory range and flags, creating one if none exists.
>    *
> - * @param base  Base address (inclusive).
> - * @param limit Limit address (exclusive).
> - * @param flags Region attributes (a combination of PAGE_HYPERVISOR_XXX)
> + * @param base      Base address (inclusive).
> + * @param limit     Limit address (exclusive).
> + * @param flags     Region attributes (a combination of PAGE_HYPERVISOR_XXX)
> + * @param p2m       True for a stage 2 mapping, otherwise False.
>    * @return      0 on success, otherwise negative on error.
>    */
>   static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
> -                                   unsigned int flags)
> +                                   unsigned int flags, bool p2m)
>   {
>       bool flags_has_page_present;
>       uint8_t idx;
> @@ -399,6 +400,8 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>               return -ENOENT;
>   
>           xen_mpumap[idx] = pr_of_addr(base, limit, flags);
> +        /* AP[0] always 1 for stage 2 */
> +        xen_mpumap[idx].prbar.reg.ap_0 = (p2m ? 1 : 0);
>   
>           write_protection_region(&xen_mpumap[idx], idx);
>       }
> @@ -418,33 +421,41 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
>       return 0;
>   }
>   
> -int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags)
> +int check_mpu_mapping(paddr_t base, paddr_t limit, unsigned int flags)
>   {
> -    int rc;
> -
>       if ( flags_has_rwx(flags) )
>       {
>           printk("Mappings should not be both Writeable and Executable\n");
> -        return -EINVAL;
> +        return false;
This function returns bool but is typed int, and has external linkage with
no prototype. It becomes static bool in patch 4 - please make it static bool
here so it is correct when introduced, and drop the churn in 4.
>       }
>   
>       if ( base >= limit )
>       {
>           printk("Base address %#"PRIpaddr" must be smaller than limit address %#"PRIpaddr"\n",
>                  base, limit);
> -        return -EINVAL;
> +        return false;
>       }
>   
>       if ( !IS_ALIGNED(base, PAGE_SIZE) || !IS_ALIGNED(limit, PAGE_SIZE) )
>       {
>           printk("base address %#"PRIpaddr", or limit address %#"PRIpaddr" is not page aligned\n",
>                  base, limit);
> -        return -EINVAL;
> +        return false;
>       }
>   
> +    return true;
> +}
> +
> +int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags, bool p2m)
> +{
> +    int rc;
> +
> +    if ( !check_mpu_mapping(base, limit, flags) )
> +        return -EINVAL;
> +
>       spin_lock(&xen_mpumap_lock);
>   
> -    rc = xen_mpumap_update_entry(base, limit, flags);
> +    rc = xen_mpumap_update_entry(base, limit, flags, p2m);
>       if ( !rc )
>           context_sync_mpu();
>   
> @@ -459,7 +470,7 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>       ASSERT(IS_ALIGNED(e, PAGE_SIZE));
>       ASSERT(s < e);
>   
> -    return xen_mpumap_update(s, e, 0);
> +    return xen_mpumap_update(s, e, 0, false);
>   }
>   
>   int destroy_xen_mapping_containing(paddr_t s)
> @@ -499,7 +510,7 @@ int map_pages_to_xen(unsigned long virt, mfn_t mfn, unsigned long nr_mfns,
>                        unsigned int flags)
>   {
>       /* MPU systems have no translation, ma == va, so pass virt directly */
> -    return xen_mpumap_update(virt, mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags);
> +    return xen_mpumap_update(virt, mfn_to_maddr(mfn_add(mfn, nr_mfns)), flags, false);
>   }
>   
>   /*
> @@ -520,7 +531,7 @@ void __init setup_mm_helper(void)
>               paddr_t bank_end = bank_start + bank_size;
>   
>               /* Map static heap with one MPU protection region */
> -            if ( xen_mpumap_update(bank_start, bank_end, PAGE_HYPERVISOR) )
> +            if ( xen_mpumap_update(bank_start, bank_end, PAGE_HYPERVISOR, false) )
>                   panic("Failed to map static heap\n");
>   
>               break;
> @@ -533,7 +544,7 @@ void __init setup_mm_helper(void)
>   
>   int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
>   {
> -    return xen_mpumap_update(s, e, nf);
> +    return xen_mpumap_update(s, e, nf, false);
>   }
>   
>   void dump_hyp_walk(vaddr_t addr)
> @@ -598,7 +609,7 @@ void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
>       paddr_t start_pg = round_pgdown(start);
>       paddr_t end_pg = round_pgup(start + len);
>   
> -    if ( xen_mpumap_update(start_pg, end_pg, flags) )
> +    if ( xen_mpumap_update(start_pg, end_pg, flags, false) )
>           return NULL;
>   
>       /* Mapped or already mapped */
> diff --git a/xen/arch/arm/mpu/p2m.c b/xen/arch/arm/mpu/p2m.c
> index ec8f630acd90..4a8595b1b25e 100644
> --- a/xen/arch/arm/mpu/p2m.c
> +++ b/xen/arch/arm/mpu/p2m.c
> @@ -8,12 +8,131 @@
>   #include <xen/sched.h>
>   #include <xen/types.h>
>   #include <asm/p2m.h>
> +#include <asm/mpu.h>
> +
> +static inline unsigned int build_p2m_flags(p2m_type_t t)
> +{
> +    unsigned int flags = 0;
> +
> +    BUILD_BUG_ON(p2m_max_real_type > (1 << 4));
> +
> +    switch ( t )
> +    {
> +    case p2m_ram_rw:
> +        /* Nothing to do, XN=0, RO=0 */
> +        break;
> +
> +    case p2m_ram_ro:
> +        flags |= _PAGE_RO;
> +        break;
> +
> +    case p2m_invalid:
> +        flags |= _PAGE_XN | _PAGE_RO;
> +        break;
> +
> +    case p2m_max_real_type:
> +        BUG();
> +        break;
> +
> +    case p2m_mmio_direct_dev:
> +    case p2m_mmio_direct_nc:
> +    case p2m_mmio_direct_c:
> +    case p2m_iommu_map_ro:
> +    case p2m_iommu_map_rw:
> +    case p2m_map_foreign_ro:
> +    case p2m_map_foreign_rw:
> +    case p2m_grant_map_ro:
> +    case p2m_grant_map_rw:
> +        panic(XENLOG_G_ERR "p2m: UNIMPLEMENTED p2m permission in MPU system\n");
> +        break;
> +    }
> +
> +    flags |= MT_NORMAL;
> +
> +    return flags;
> +}
> +
> +/*
> + * Check whether guest memory region [`sgfn`, `sgfn` + `nr_gfns`) is mapped in
> + * mpumap `table`.
> + *
> + * If the memory region is mapped, `idx` is set to the index of the associated
> + * MPU memory region and 0 is returned.
> + * If the memory region is not mapped, -ENOENT is returned.
> + */
> +static int is_gfns_mapped(pr_t *table, uint8_t nr_regions, gfn_t sgfn,
> +                          unsigned long nr_gfns, uint8_t *idx)
> +{
> +    paddr_t gbase = gfn_to_gaddr(sgfn);
> +    paddr_t glimit = gfn_to_gaddr(gfn_add(sgfn, nr_gfns));
> +    int rc;
> +
> +    rc = mpumap_contains_region(table, nr_regions, gbase, glimit, idx);
> +    if ( MPUMAP_REGION_OVERLAP == rc )
> +        return -EINVAL;
> +
> +    if ( MPUMAP_REGION_NOTFOUND == rc )
> +        return -ENOENT;
> +
> +    return 0;
> +}
> +
> +static int __p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned int nr,
p2m_set_entry takes unsigned long nr and passes it here as unsigned int, so
the count is silently truncated on the way in. Keep the type consistent.
> +                    mfn_t smfn, p2m_type_t t, p2m_access_t a)
> +{
> +    pr_t *table;
> +    mfn_t emfn = mfn_add(smfn, nr);
> +    unsigned int flags;
> +    uint8_t idx = INVALID_REGION_IDX;
> +
> +    /*
> +     * In all cases other than when removing a mapping (mfn == MFN_INVALID),
> +     * gfn == mfn on MPU systems.
> +     */
> +    if ( !mfn_eq(smfn, INVALID_MFN) && gfn_x(sgfn) != mfn_x(smfn) )
> +    {
> +        printk(XENLOG_G_ERR "Unable to map MFN %#"PRI_mfn" at %#"PRI_mfn"\n",
> +               mfn_x(smfn), gfn_x(sgfn));
> +        return -EINVAL;
> +    }
> +
> +    table = (pr_t *)page_to_virt(p2m->root);
> +    if ( !table )
> +        return -EINVAL;
> +
> +    /* Already mapped */
> +    if ( is_gfns_mapped(table, p2m->nr_regions, sgfn, nr, &idx) != -ENOENT )
> +    {
> +        printk(XENLOG_G_ERR "Unable to insert P2M MPU memory region %#"PRIpaddr"-%#"PRIpaddr"\n",
> +               gfn_to_gaddr(sgfn), gfn_to_gaddr(gfn_add(sgfn, nr)));
> +        return -EINVAL;
> +    }
> +
> +    flags = build_p2m_flags(t);
> +    table[p2m->nr_regions] = pr_of_addr(mfn_to_maddr(smfn),
> +                                        mfn_to_maddr(mfn_add(smfn, nr)), flags);
> +    region_set_p2m(&table[p2m->nr_regions], t);
> +    p2m->nr_regions++;
Should we check that against the upperbound MAX_MPU_REGION_NR. And panic 
when it reaches the max , so that an overflow is prevented.
> +
> +    p2m->max_mapped_gfn = gfn_max(p2m->max_mapped_gfn, _gfn(mfn_x(emfn)));
> +    p2m->lowest_mapped_gfn = gfn_min(p2m->lowest_mapped_gfn, _gfn(mfn_x(smfn)));
> +
> +    return 0;
> +}
>   
>   int p2m_set_entry(struct p2m_domain *p2m, gfn_t sgfn, unsigned long nr,
>                     mfn_t smfn, p2m_type_t t, p2m_access_t a)
>   {
> -    BUG_ON("unimplemented");
> -    return -EINVAL;
> +    /*
> +     * Any reference taken by the P2M mappings (e.g. foreign mapping) will
> +     * be dropped in relinquish_p2m_mapping(). As the P2M will still
> +     * be accessible after, we need to prevent mapping to be added when the
> +     * domain is dying.
> +     */
> +    if ( unlikely(p2m->domain->is_dying) )
> +        return -ENOMEM;
> +
> +    return __p2m_set_entry(p2m, sgfn, nr, smfn, t, a);
>   }
>   
>   mfn_t p2m_get_entry(struct p2m_domain *p2m, gfn_t gfn, p2m_type_t *t,
- Ayan

