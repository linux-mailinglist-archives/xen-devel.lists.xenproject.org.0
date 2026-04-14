Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MG8SEuaj3Wl8hAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 04:18:14 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C37D33F4F41
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 04:18:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1281412.1564324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCTLY-0000rw-8V; Tue, 14 Apr 2026 02:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1281412.1564324; Tue, 14 Apr 2026 02:17:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCTLY-0000pj-5I; Tue, 14 Apr 2026 02:17:48 +0000
Received: by outflank-mailman (input) for mailman id 1281412;
 Tue, 14 Apr 2026 02:17:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCTLW-0000pd-6C
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 02:17:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCTLV-001RkF-2B;
 Tue, 14 Apr 2026 02:17:45 +0000
Received: from [116.84.110.196] (helo=[10.158.125.74])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCTLV-001W45-1J;
 Tue, 14 Apr 2026 02:17:45 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=js5XNSEc24aap/AOxb/rFQf3IpHmT2uTLaA9JtlSpc0=; b=kQ6mYhiE4UbFDKjrAquAjVOavl
	mwX1laZ5Ny0jlbjvKMJ4CvtK4PFw0ob1gcRx8MTrL7nIaqh+2ftFi0WGzsYh5DBjE0sO9jWK9vt3I
	rn8lS9JynCRf5UMEBBc6vfR5Gi5HfeGl2YtXgH2l3waHT211GhXiV2TGGAHhHXR6om/4=;
Message-ID: <56a7c116-4ecb-4dfc-a7dd-774d53041fe9@xen.org>
Date: Tue, 14 Apr 2026 11:17:41 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/23] xen/arm: smmuv3: Add support for stage-1 and
 nested stage translation
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774305918.git.milan_djokic@epam.com>
 <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cb8a2cb5df50128f4c49d34a7ab8faa4e73f83c6.1774305918.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:dkim,xen.org:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:bertrand.marquis@arm.com,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[xen.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C37D33F4F41
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

On 24/03/2026 07:51, Milan Djokic wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Xen SMMUv3 driver only supports stage-2 translation. Add support for
> Stage-1 translation that is required to support nested stage
> translation.
> 
> In true nested mode, both s1_cfg and s2_cfg will coexist.
> Let's remove the union. When nested stage translation is setup, both
> s1_cfg and s2_cfg are valid.
> 
> We introduce a new smmu_domain abort field that will be set
> upon guest stage-1 configuration passing. If no guest stage-1
> config has been attached, it is ignored when writing the STE.
> 
> arm_smmu_write_strtab_ent() is modified to write both stage
> fields in the STE and deal with the abort field.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/drivers/passthrough/arm/smmu-v3.c | 93 +++++++++++++++++++++++----
>   xen/drivers/passthrough/arm/smmu-v3.h |  9 +++
>   2 files changed, 91 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 73cc4ef08f..f9c6837919 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -683,8 +683,10 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   	 * 3. Update Config, sync
>   	 */
>   	u64 val = le64_to_cpu(dst[0]);
> -	bool ste_live = false;
> +	bool s1_live = false, s2_live = false, ste_live = false;
> +	bool abort, translate = false;
>   	struct arm_smmu_device *smmu = NULL;
> +	struct arm_smmu_s1_cfg *s1_cfg = NULL;
>   	struct arm_smmu_s2_cfg *s2_cfg = NULL;
>   	struct arm_smmu_domain *smmu_domain = NULL;
>   	struct arm_smmu_cmdq_ent prefetch_cmd = {
> @@ -699,30 +701,54 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   		smmu = master->smmu;
>   	}
>   
> -	if (smmu_domain)
> -		s2_cfg = &smmu_domain->s2_cfg;
> +	if (smmu_domain) {
> +		switch (smmu_domain->stage) {
> +		case ARM_SMMU_DOMAIN_NESTED:
> +			s1_cfg = &smmu_domain->s1_cfg;
> +			fallthrough;
> +		case ARM_SMMU_DOMAIN_S2:
> +			s2_cfg = &smmu_domain->s2_cfg;
> +			break;
> +		default:
> +			break;
> +		}
> +		translate = !!s1_cfg || !!s2_cfg;

NIT: translate is a bool. So do you actually need the !!?

> +	}
>   
>   	if (val & STRTAB_STE_0_V) {
>   		switch (FIELD_GET(STRTAB_STE_0_CFG, val)) {
>   		case STRTAB_STE_0_CFG_BYPASS:
>   			break;
> +		case STRTAB_STE_0_CFG_S1_TRANS:
> +			s1_live = true;
> +			break;
>   		case STRTAB_STE_0_CFG_S2_TRANS:
> -			ste_live = true;
> +			s2_live = true;
> +			break;
> +		case STRTAB_STE_0_CFG_NESTED:
> +			s1_live = true;
> +			s2_live = true;
>   			break;
>   		case STRTAB_STE_0_CFG_ABORT:
> -			BUG_ON(!disable_bypass);

I am not sure I understand why this was removed. Can you clarify?

>   			break;
>   		default:
>   			BUG(); /* STE corruption */
>   		}
>   	}
>   
> +	ste_live = s1_live || s2_live;
> +
>   	/* Nuke the existing STE_0 value, as we're going to rewrite it */
>   	val = STRTAB_STE_0_V;
>   
>   	/* Bypass/fault */
> -	if (!smmu_domain || !(s2_cfg)) {
> -		if (!smmu_domain && disable_bypass)
> +	if (!smmu_domain)
> +		abort = disable_bypass;
> +	else
> +		abort = smmu_domain->abort;
> +
> +	if (abort || !translate) {
> +		if (abort)
>   			val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_ABORT);
>   		else
>   			val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_BYPASS);
> @@ -740,7 +766,33 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   		return;
>   	}
>   
> +	if (ste_live) {
> +		/* First invalidate the live STE */
> +		dst[0] = cpu_to_le64(STRTAB_STE_0_CFG_ABORT);
> +		arm_smmu_sync_ste_for_sid(smmu, sid);
> +	}
> +
> +	if (s1_cfg) {
> +		BUG_ON(s1_live);
> +		dst[1] = cpu_to_le64(
> +			 FIELD_PREP(STRTAB_STE_1_S1DSS, STRTAB_STE_1_S1DSS_SSID0) |
> +			 FIELD_PREP(STRTAB_STE_1_S1CIR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> +			 FIELD_PREP(STRTAB_STE_1_S1COR, STRTAB_STE_1_S1C_CACHE_WBRA) |
> +			 FIELD_PREP(STRTAB_STE_1_S1CSH, ARM_SMMU_SH_ISH) |
> +			 FIELD_PREP(STRTAB_STE_1_STRW, STRTAB_STE_1_STRW_NSEL1));
> +
> +		if (smmu->features & ARM_SMMU_FEAT_STALLS &&
> +		   !(smmu->features & ARM_SMMU_FEAT_STALL_FORCE))
> +			dst[1] |= cpu_to_le64(STRTAB_STE_1_S1STALLD);
> +
> +		val |= (s1_cfg->s1ctxptr & STRTAB_STE_0_S1CTXPTR_MASK) |
> +			FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S1_TRANS) |
> +			FIELD_PREP(STRTAB_STE_0_S1CDMAX, s1_cfg->s1cdmax) |
> +			FIELD_PREP(STRTAB_STE_0_S1FMT, s1_cfg->s1fmt);
> +	}
> +
>   	if (s2_cfg) {
> +		u64 vttbr = s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK;
>   		u64 strtab =
>   			 FIELD_PREP(STRTAB_STE_2_S2VMID, s2_cfg->vmid) |
>   			 FIELD_PREP(STRTAB_STE_2_VTCR, s2_cfg->vtcr) |
> @@ -750,12 +802,19 @@ static void arm_smmu_write_strtab_ent(struct arm_smmu_master *master, u32 sid,
>   			 STRTAB_STE_2_S2PTW | STRTAB_STE_2_S2AA64 |
>   			 STRTAB_STE_2_S2R;
>   
> -		BUG_ON(ste_live);
> +		if (s2_live) {
> +			u64 s2ttb = le64_to_cpu(dst[3]) & STRTAB_STE_3_S2TTB_MASK;
> +			BUG_ON(s2ttb != vttbr);
> +		}
> +
>   		dst[2] = cpu_to_le64(strtab);
>   
> -		dst[3] = cpu_to_le64(s2_cfg->vttbr & STRTAB_STE_3_S2TTB_MASK);
> +		dst[3] = cpu_to_le64(vttbr);
>   
>   		val |= FIELD_PREP(STRTAB_STE_0_CFG, STRTAB_STE_0_CFG_S2_TRANS);
> +	} else {
> +		dst[2] = 0;
> +		dst[3] = 0;
>   	}
>   
>   	if (master->ats_enabled)
> @@ -1254,6 +1313,15 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>   {
>   	int ret;
>   	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
> +	struct arm_smmu_device *smmu = smmu_domain->smmu;
> +
> +	if (smmu_domain->stage == ARM_SMMU_DOMAIN_NESTED &&
> +		(!(smmu->features & ARM_SMMU_FEAT_TRANS_S1) ||
> +		 !(smmu->features & ARM_SMMU_FEAT_TRANS_S2))) {
> +			dev_info(smmu_domain->smmu->dev,
> +					"does not implement two stages\n");
> +			return -EINVAL;
> +	}
>   
>   	/* Restrict the stage to what we can actually support */
>   	smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
> @@ -2353,11 +2421,14 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>   		break;
>   	}
>   
> +	if (reg & IDR0_S1P)
> +		smmu->features |= ARM_SMMU_FEAT_TRANS_S1;
> +
>   	if (reg & IDR0_S2P)
>   		smmu->features |= ARM_SMMU_FEAT_TRANS_S2;
>   
> -	if (!(reg & IDR0_S2P)) {
> -		dev_err(smmu->dev, "no stage-2 translation support!\n");
> +	if (!(reg & (IDR0_S1P | IDR0_S2P))) {

I believe the behavior is now slightly different. This would not print 
anything if the SMMU support stage-1 but not stage-2. However, Xen at 
least need the latter.

> +		dev_err(smmu->dev, "no translation support!\n");
>   		return -ENXIO;
>   	}
>   
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
> index ab1f29f6c7..3fb13b7e21 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.h
> +++ b/xen/drivers/passthrough/arm/smmu-v3.h
> @@ -197,6 +197,7 @@
>   #define STRTAB_STE_0_CFG_BYPASS		4
>   #define STRTAB_STE_0_CFG_S1_TRANS	5
>   #define STRTAB_STE_0_CFG_S2_TRANS	6
> +#define STRTAB_STE_0_CFG_NESTED		7
>   
>   #define STRTAB_STE_0_S1FMT		GENMASK_ULL(5, 4)
>   #define STRTAB_STE_0_S1FMT_LINEAR	0
> @@ -549,6 +550,12 @@ struct arm_smmu_strtab_l1_desc {
>   	dma_addr_t			l2ptr_dma;
>   };
>   
> +struct arm_smmu_s1_cfg {
> +	u64				s1ctxptr;
> +	u8				s1fmt;
> +	u8				s1cdmax;
> +};
> +
>   struct arm_smmu_s2_cfg {
>   	u16				vmid;
>   	u64				vttbr;
> @@ -669,7 +676,9 @@ struct arm_smmu_domain {
>   	atomic_t			nr_ats_masters;
>   
>   	enum arm_smmu_domain_stage	stage;
> +	struct arm_smmu_s1_cfg	s1_cfg;
>   	struct arm_smmu_s2_cfg	s2_cfg;
> +	bool			abort;

I think there might be some padding before s1_cfg. So I wonder whether 
this would be better be moved before to reduce the size of the structure.

>   
>   	/* Xen domain associated with this SMMU domain */
>   	struct domain		*d;

Cheers,

-- 
Julien Grall


