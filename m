Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gh5oK1rFUGpP4wIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 12:11:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073217397CE
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 12:11:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=jrQoMCGf;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359035.1612826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi8CB-0002jk-IY; Fri, 10 Jul 2026 10:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359035.1612826; Fri, 10 Jul 2026 10:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi8CB-0002hm-Eh; Fri, 10 Jul 2026 10:10:59 +0000
Received: by outflank-mailman (input) for mailman id 1359035;
 Fri, 10 Jul 2026 10:10:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wi8CA-0002hg-4y
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 10:10:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi8C9-00GU5F-Dc
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 12:10:57 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a50c525-2eae-0a2a0a5409dd-0a2a450aabf6-36
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:10:56 +0200
Received: from [40.107.200.54]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a50c52f-ec7d-0a2a450a0019-286bc836bb3a-4
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:10:56 +0200
Received: from BN9PR03CA0970.namprd03.prod.outlook.com (2603:10b6:408:109::15)
 by CY3PR12MB9678.namprd12.prod.outlook.com (2603:10b6:930:101::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 10 Jul
 2026 10:10:52 +0000
Received: from BN2PEPF000055DC.namprd21.prod.outlook.com
 (2603:10b6:408:109:cafe::8) by BN9PR03CA0970.outlook.office365.com
 (2603:10b6:408:109::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Fri,
 10 Jul 2026 10:10:51 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000055DC.mail.protection.outlook.com (10.167.245.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.0 via Frontend Transport; Fri, 10 Jul 2026 10:10:51 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 05:10:51 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 05:10:51 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 05:10:49 -0500
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
 b=bPcSPNWXEY/6pmMuprSdiMAfg7HgTbjqlrNhDo53rNeHlSn7mx66c8XAs4V22DRvTbgaTGXOQa9SRe9NvPCWA/i+QdDTNteD8/qLcWRzcTYplkrhgmw9AUmotYAVPniMxghWxh/CVvQ5U9K84420ZceOHO2W74Wqi3hqdIQL5F5h7EElvqZ3gTXTXttECkR2Uzf8gyUP0H2L6BReHSjcWWtQ3aXO/ObbWta71+UjrGfCF6vtsv4d7rNqY2Fkr+A0Ytw/amnjKyP1ADQAQ8UGdqUhLpa8v2eTE5S8AROy6sFB+69OltcHY0FId7JtqiOJ7OKmYEViyO5TE0+Q6dCrdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUsa9Mbd+fx4ThZAf+bSccMSz/Od22pJBafQPExtXdQ=;
 b=a52Iu/Rwze5xNDoxlJdhumu4QQs7E9X3QMk5FNnAnZr4NECbQk8cfqWX2TXPUFRVUWi/SduNnHgDLzTBWVvPvN3uhICgGx/dRB6BT7qoKY88Dj1J20iZhsZCF4Iig0/dpQYqkLBBG3ixhFJomBfzIILmjyFyj1d92ggnF1272UDdnf5CYnicDlQ2TOLiTHE+Ug8SV/BBaB7lpqpj6ibv2hFor9nuIlBlyp3tXj1i8QWTjDs1yCEDJCEgKiBEISgZPO8kxVsp0N8H7MHCHyAQAkam4TP+VcMs1K4yoePDW6/algk0N0U18x1UXdMkFE0HkVvm/1z6pBUjTC432nORqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUsa9Mbd+fx4ThZAf+bSccMSz/Od22pJBafQPExtXdQ=;
 b=jrQoMCGfBE+6UYz505XFtr7CfjJutvvFXdaE8IMGesnc1cyABTsfv3IJtS9xsqsnMGayhhDPeK/DmjgTeXzsltvluLz+e54kGCzl2HMBXaRADpoq2QwNQZVgPY2FpUUWZsDKKsrgiTGcahDh5eIGw+piT3vvXefvl+ohUnyj0EA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <e6468083-f901-4a1e-94d5-d347068fabf0@amd.com>
Date: Fri, 10 Jul 2026 12:10:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 1/2] xen/arm: validate IRQs before descriptor
 lookup
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1783671887.git.mykola_kvach@epam.com>
 <1843da2e028635773638ef73ed10907c7ae7bb53.1783671887.git.mykola_kvach@epam.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <1843da2e028635773638ef73ed10907c7ae7bb53.1783671887.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DC:EE_|CY3PR12MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: 12645787-d87b-4d6b-16d2-08dede6b8575
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|22082099003|4143699003|18002099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	WgyD5wf4b6Sx3NR6dAYbsv0oIAnW8CUIWoUNqZPywiQq52cRllIRqrId6aYgN5nWZQdzPd7LwXZqLhf84NtnsiETrFMbXinfxpyOfTY9PUklVzm46e4doOq2d6EHfPkMSkiRbCVEVMuvOvzv6bt81wR5KeSyxjKZmLqIA9R68PJkEUsIrzaljKKf1KiIeg1VgBaPEB0pVOTciNiPasLP9iQozg4oxdx/XOQ4fg4vM1/tBBt7e9XAQ1cvqFAYldxAekkyTuxv7kp1ZMLkjVRKcSu0vZL0T5/cdxdWVjkB59PoMCkvdtLCncghjC0byFeh/3Qx9oQbIqvDf9G0WtwnDjSMJ/edilDihSgjEw7Ng5ky8cqarlngsU0Ucc9dBYG0MoE3UHY7Yv4xBgC1duzANWhZgVFDf3npEoz9bUEbL6ZdIQFbOZS8fE8So7Vvi8lthIkU+96j8JRX2VdBAxO9Ro4gYBvKGCfV3FmHier+hp4ThV0FWClmsEYGrb+EdTBGThp6OZRVa5glmtS/0aPwnfwsQyvlnv3cXnOC0S6AIfSvDeVZgGlzAvnhAtCTHhrrUZby+aUB06qwKT24iiNoQJf0g0HEUUqQfYFwOZR9HAf6InY4WrzlUKpzFAaHf82+udJXMKl3p1LMwzCe2zMilnl/S8Q5uIx/yrHYBUR5Ce9XJa9/3hpaGCQZluHSurRxUReA4Ow7TWw5SNF9wTQ27Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(22082099003)(4143699003)(18002099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jq3mX7URQoXyQqAPJig2d8pXCciZ+lRRHU6l4Ij4XUSmFKtUIqV/jGva7DV+h6lg3afQ71aA/17t5/PMK3cP/44Zbhc6l/hdLKqMIA8QRr/OCre3kT9GkoAPiDdVBQJFcieF9T5HLToW3l3rHba37bOtdD+B1HXpCpNeIxWupIPi5OpQubWFRV6KtXKk8jkdCB+rwW6yoDPNRTUaSgEMtj3mVpLDDfnV6NyJHl7+Ps83H1u0SDaKCbzaKIrKkSfHJPtZpCZSlEr5AVh9BQYkTT4CLOmFHNwtVPHKe4L16ve9W6ym6HICWBk0AwzjQstrfZTdaXweNxKdhSjdp/8EQTM8dLFwYkAO+Nr5h2fOcO9xOJEnv9Ygsndhboe/PPjZ3+uM+kVWkrUhiFR6HhcrXNWcK4bT4yLPw9J60vCB7sznYmWZkCatdmhsrY1loCvj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 10:10:51.4707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12645787-d87b-4d6b-16d2-08dede6b8575
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9678
X-purgate-ID: tlsNG-4011c0/1783678256-3E56E248-6AA3B7AB/0/0
X-purgate-type: clean
X-purgate-size: 3222
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mykola_kvach@epam.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:from_mime,amd.com:dkim,amd.com:mid,epam.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 073217397CE



On 10-Jul-26 10:31, Mykola Kvach wrote:
> With GICv3 eSPI support, nr_irqs covers the architectural INTID
> namespace up to ESPI_MAX_INTID. That namespace is not backed by a
> single dense irq_desc[] array: regular SPIs use irq_desc[], eSPIs use
> espi_desc[], and the INTIDs in between must not be treated as
> descriptor indices.
> 
> A firmware-provided interrupt in the sparse range can therefore pass
> checks based only on nr_irqs and reach irq_to_desc().
What are the possible consequences? You should explain it in the commit msg.
Also, what is your criteria behind protecting irq_to_desc()? There are other
places, where we have unprotected irq_to_desc(). Last but not least I think we
should have an ASSERT in __irq_to_desc() to prevent the indexing failure if we
end up there with a sparse IRQ accidentally.

The change itself looks ok.

~Michal
> 
> Validate IRQs with the GIC line helpers before looking up descriptors
> in setup_irq(). Also validate SPI type configuration with gic_is_spi()
> before irq_set_spi_type() obtains the descriptor, covering the
> platform_get_irq() -> irq_set_type() path. The route-to-Xen assert
> becomes redundant because setup_irq() now rejects invalid IRQs before
> routing.
> 
> Fixes: 98f7060b9ed ("xen/arm/irq: add handling for IRQs in the eSPI range")
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>  xen/arch/arm/gic.c | 2 --
>  xen/arch/arm/irq.c | 9 +++++++--
>  2 files changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
> index ee75258fc3..ed9870c1bd 100644
> --- a/xen/arch/arm/gic.c
> +++ b/xen/arch/arm/gic.c
> @@ -111,8 +111,6 @@ static void gic_set_irq_priority(struct irq_desc *desc, unsigned int priority)
>  void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>  {
>      ASSERT(priority <= 0xff);     /* Only 8 bits of priority */
> -    /* Can't route interrupts that don't exist */
> -    ASSERT(gic_is_valid_line(desc->irq));
>      ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
>      ASSERT(spin_is_locked(&desc->lock));
>  
> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
> index 73e58a5108..0314cf0b6e 100644
> --- a/xen/arch/arm/irq.c
> +++ b/xen/arch/arm/irq.c
> @@ -416,6 +416,9 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
>      struct irq_desc *desc;
>      bool disabled;
>  
> +    if ( !gic_is_valid_line(irq) )
> +        return -EINVAL;
> +
>      desc = irq_to_desc(irq);
>  
>      spin_lock_irqsave(&desc->lock, flags);
> @@ -647,13 +650,15 @@ static bool irq_validate_new_type(unsigned int curr, unsigned int new)
>  int irq_set_spi_type(unsigned int spi, unsigned int type)
>  {
>      unsigned long flags;
> -    struct irq_desc *desc = irq_to_desc(spi);
> +    struct irq_desc *desc;
>      int ret = -EBUSY;
>  
>      /* This function should not be used for other than SPIs */
> -    if ( spi < NR_LOCAL_IRQS )
> +    if ( !gic_is_spi(spi) )
>          return -EINVAL;
>  
> +    desc = irq_to_desc(spi);
> +
>      spin_lock_irqsave(&desc->lock, flags);
>  
>      if ( !irq_validate_new_type(desc->arch.type, type) )


