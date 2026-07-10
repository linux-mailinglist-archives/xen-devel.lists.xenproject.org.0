Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WRHBJEfNUGoJ5QIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 12:45:27 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5C9739D10
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jul 2026 12:45:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="WMe3/642";
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1359084.1612853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi8j6-0007m4-G7; Fri, 10 Jul 2026 10:45:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1359084.1612853; Fri, 10 Jul 2026 10:45:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wi8j6-0007ja-DF; Fri, 10 Jul 2026 10:45:00 +0000
Received: by outflank-mailman (input) for mailman id 1359084;
 Fri, 10 Jul 2026 10:44:58 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wi8j4-0007jU-Nq
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 10:44:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wi8j3-0063XA-Qn
 for xen-devel@lists.xenproject.org; Fri, 10 Jul 2026 12:44:57 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a50cd14-5cb7-0a2a0a5109dd-0a2a450b85be-44
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:44:57 +0200
Received: from [40.93.196.14]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.2)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a50cd28-b7da-0a2a450b0019-285dc40e1091-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Jul 2026 12:44:57 +0200
Received: from CH2PR03CA0024.namprd03.prod.outlook.com (2603:10b6:610:59::34)
 by PH7PR12MB6883.namprd12.prod.outlook.com (2603:10b6:510:1b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 10:44:51 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::2d) by CH2PR03CA0024.outlook.office365.com
 (2603:10b6:610:59::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 10:44:50 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 10:44:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 05:44:50 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 10 Jul
 2026 03:44:49 -0700
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 10 Jul 2026 05:44:48 -0500
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
 b=fdNPB9z/iPrbhkh9Kl+qzpTWijq/Ny3FwTLwQiNKenQEebbfUfa4AHO9KxRsDijoyIEsDDLh3ZfKjqCxM3kbF45rO7/Snz1CglzfuVbkrFfCXibBDOOUDj62CmGWEoJgu5BB/aWrBFCuAW+pLhhJ68IF4YICgfMbGJl6tVPk6NYO+uxeutmmTvGPzbu9GdFEdCIXJEohD/WwtSLez0asxMJFl26xCfDwQuM0o4HuKwGPlwRrzDwjGe+Fj8oK3mUYDdx48HC3et0VqstBsD/8ovTaUw+lV/Rs36Rg7Yq8wJMBxtrWTlhojDYJtJ19pnL582QiF2Oozan2HscJ7qTetQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKsRINZ6Eyzi7RD09UzW/pgaKIm+QtXBbhrXSHvQYdo=;
 b=kYgISARNwdLAF192fBCiJY1OzuVF/YPf3l4v64sW8z67HnqFDXqw71lgsbHGJ6h0FYR7T6QR3YdV+yVWBI0USaN4kLk6bVniBhiRIKbdYCxfkuIjZZPE+BNxZt4KCL/Iebf+3buo55XL6HE4SfkzmzgDA/AowQ4eEZvZM7PaoJD8VCTsfSaidU/6Y0189buDKA2+IudAZWHAX/GgjnmJmPa6/RGp3RDKwFPweJ8AAMvx6os4+tAftYFEhwKgWzvBlLiMw3kFtIaZp4DWS8uHk/UH9vOprWnDIk1EYXVajhHY7KJyNIx0y2T/zPSGLbOfqhpIkd5U1Ke0kISKmESjFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKsRINZ6Eyzi7RD09UzW/pgaKIm+QtXBbhrXSHvQYdo=;
 b=WMe3/642k+HKGbWJL+J39dgJv2RAuqs4KrtaiAChqL8SXD4Uvid0IFPhcUgqEYoNKdqiaX6UL78SiqUOr+LFaoxXGtdBsADGIIdytzgbBfh01MKvl/8jQ92CkVUfno7Ep//s+8S94fTlxlu4zabQdk5Tj+gM+Hh9IeDjnaDvo50=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <2ba97094-c9c8-461b-adc4-64cca978dd6a@amd.com>
Date: Fri, 10 Jul 2026 12:44:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.22 1/2] xen/arm: validate IRQs before descriptor
 lookup
From: "Orzel, Michal" <michal.orzel@amd.com>
To: Mykola Kvach <mykola_kvach@epam.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <cover.1783671887.git.mykola_kvach@epam.com>
 <1843da2e028635773638ef73ed10907c7ae7bb53.1783671887.git.mykola_kvach@epam.com>
 <e6468083-f901-4a1e-94d5-d347068fabf0@amd.com>
Content-Language: en-US
In-Reply-To: <e6468083-f901-4a1e-94d5-d347068fabf0@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|PH7PR12MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a277e5-bb9a-42cc-c063-08dede7044c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|18002099003|22082099003|11063799006|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	dB9gJ9i7cbWWUZOtDdxzQ0CaStlRrK+n9U7LlFbaXrX3XUdAcrO+B/tNrME5Uv8LYw9AAoYUxfU+V0b2jSJQK7cfjzJg6VRiYTNBXOMnBTEDzI8thj+thC87CBMHkszBwWis+qMZF3Kg+Tb/rx0+fCKDDCMvwgoYWbjAjIg6lOw2aKVR9wiOnjmmOS1tzKMs8Z0TB9kuwumRR2AcaXjRuVBdkjuSFRss7lOPRm/AOfIskohwIEj/zp8RYuTGcKUL5WgSC+rbNvmcBJdtQ9N2WE4oBFeJ80FB6SOPdmRK/6AhoWpLJZjg43q8es/3LCp4hE1aOK6hoiwFV4d9wZP+APN/li470gRf9beJHkK8D5vPJ6Jfc0ldhmjsavgA4amRmE5WbebWL3CH4p2HkBjBxFsMjR1XsOuAN1bh+gkQE9kqGAY/P3AkLwZ4S5iUYJYyal65EX1G4gvH4HBhBtb05tF4LulkgCNktaJClzTqIa82tJw5ov2CGgdVvRXVj+A9uSVcL5mUO4HFOxDMlRLbs4i6LEbonMPgYsv3jjJLicDQ7pyrwGCk0N45dMGXzjKfq9vmENBg7nU73TUDwEFO+PTTAEqqurKFh1uEJN9Ws6UknwPgsE+C5yBdcf6c5AyND93GNI8xPHC4Dhd//sQScFG6s1+v4CRY+WSb7T9Oorue807HcEITm7EIc4bCU0FNymieM9Rtp0WhnHiSmTr7MA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8XEMOz/97uHZxgayY4iSO5QxADmFye4oI3/7lEihQIXGq5mObnsx6fQ2ibnHxJgaPmjPJyJxs4Y5+mK9f/OP2FIQsHsI8v61/pE3n90qVwrxzY+yiGIMMbd0Kc0Lu50XQnmjZQc2Me7S/VIcxBHEoiGewgoiDFniqka/yJsIs+Q5u0rmVPiN+cgrLryBY8KWKGsA73A6qU57N5qTQ/jmNVwZbPeeQl5Y7GipmIlOPG44UPdXnmUyIbpIdet1AwSAEm9lMc2Jw9jO72qEQzPneHtIyRwo34H65HhLFL6qUPW4AXDPH0Vd39PltKIGRtIxYAJmFnFHchFDtSRoDdnHOztL+EXDzhZV7lZ8tJ0VhrdLgAkiAEnSPME94xJjAHFz9a02i6yzM2neow3RZz/Sb9evrpHFZSZnmVWthA8WZq+KrxISFYWRBWKypwg+lGaD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 10:44:50.4035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a277e5-bb9a-42cc-c063-08dede7044c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6883
X-purgate-ID: tlsNG-42698a/1783680297-A11D69ED-663689FE/0/0
X-purgate-type: clean
X-purgate-size: 3675
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:dkim,amd.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA5C9739D10

On a tangent note:
I can see that you pushed quite a few "for-4.22" patches. We are approaching the
release, so afaict at this point we should only be taking crucial bug fixes.
Moreover, when sending "for-X" patches, please include a description with your
analyzed pros/cons of taking a patch in.

~Michal

On 10-Jul-26 12:10, Orzel, Michal wrote:
> 
> 
> On 10-Jul-26 10:31, Mykola Kvach wrote:
>> With GICv3 eSPI support, nr_irqs covers the architectural INTID
>> namespace up to ESPI_MAX_INTID. That namespace is not backed by a
>> single dense irq_desc[] array: regular SPIs use irq_desc[], eSPIs use
>> espi_desc[], and the INTIDs in between must not be treated as
>> descriptor indices.
>>
>> A firmware-provided interrupt in the sparse range can therefore pass
>> checks based only on nr_irqs and reach irq_to_desc().
> What are the possible consequences? You should explain it in the commit msg.
> Also, what is your criteria behind protecting irq_to_desc()? There are other
> places, where we have unprotected irq_to_desc(). Last but not least I think we
> should have an ASSERT in __irq_to_desc() to prevent the indexing failure if we
> end up there with a sparse IRQ accidentally.
> 
> The change itself looks ok.
> 
> ~Michal
>>
>> Validate IRQs with the GIC line helpers before looking up descriptors
>> in setup_irq(). Also validate SPI type configuration with gic_is_spi()
>> before irq_set_spi_type() obtains the descriptor, covering the
>> platform_get_irq() -> irq_set_type() path. The route-to-Xen assert
>> becomes redundant because setup_irq() now rejects invalid IRQs before
>> routing.
>>
>> Fixes: 98f7060b9ed ("xen/arm/irq: add handling for IRQs in the eSPI range")
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> ---
>>  xen/arch/arm/gic.c | 2 --
>>  xen/arch/arm/irq.c | 9 +++++++--
>>  2 files changed, 7 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
>> index ee75258fc3..ed9870c1bd 100644
>> --- a/xen/arch/arm/gic.c
>> +++ b/xen/arch/arm/gic.c
>> @@ -111,8 +111,6 @@ static void gic_set_irq_priority(struct irq_desc *desc, unsigned int priority)
>>  void gic_route_irq_to_xen(struct irq_desc *desc, unsigned int priority)
>>  {
>>      ASSERT(priority <= 0xff);     /* Only 8 bits of priority */
>> -    /* Can't route interrupts that don't exist */
>> -    ASSERT(gic_is_valid_line(desc->irq));
>>      ASSERT(test_bit(_IRQ_DISABLED, &desc->status));
>>      ASSERT(spin_is_locked(&desc->lock));
>>  
>> diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
>> index 73e58a5108..0314cf0b6e 100644
>> --- a/xen/arch/arm/irq.c
>> +++ b/xen/arch/arm/irq.c
>> @@ -416,6 +416,9 @@ int setup_irq(unsigned int irq, unsigned int irqflags, struct irqaction *new)
>>      struct irq_desc *desc;
>>      bool disabled;
>>  
>> +    if ( !gic_is_valid_line(irq) )
>> +        return -EINVAL;
>> +
>>      desc = irq_to_desc(irq);
>>  
>>      spin_lock_irqsave(&desc->lock, flags);
>> @@ -647,13 +650,15 @@ static bool irq_validate_new_type(unsigned int curr, unsigned int new)
>>  int irq_set_spi_type(unsigned int spi, unsigned int type)
>>  {
>>      unsigned long flags;
>> -    struct irq_desc *desc = irq_to_desc(spi);
>> +    struct irq_desc *desc;
>>      int ret = -EBUSY;
>>  
>>      /* This function should not be used for other than SPIs */
>> -    if ( spi < NR_LOCAL_IRQS )
>> +    if ( !gic_is_spi(spi) )
>>          return -EINVAL;
>>  
>> +    desc = irq_to_desc(spi);
>> +
>>      spin_lock_irqsave(&desc->lock, flags);
>>  
>>      if ( !irq_validate_new_type(desc->arch.type, type) )
> 
> 


