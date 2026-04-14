Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Ei9DqSi3mlYGwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:25:08 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 029023FE58B
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282096.1564814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJa-00071L-T6; Tue, 14 Apr 2026 20:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282096.1564814; Tue, 14 Apr 2026 20:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJa-0006x3-MO; Tue, 14 Apr 2026 20:24:54 +0000
Received: by outflank-mailman (input) for mailman id 1282096;
 Tue, 14 Apr 2026 20:24:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCkJZ-0006tP-Ba
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 20:24:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJZ-001nU6-00;
 Tue, 14 Apr 2026 20:24:53 +0000
Received: from [2a02:8012:3a1:0:6452:fdce:8dbd:9a39]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJY-0036wi-2l;
 Tue, 14 Apr 2026 20:24:52 +0000
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
	bh=09cHly2BqHYGkH46vKnOx07jfMK6IV594uDYR5Bmswg=; b=dYthwWWTRu8t31JD9TpxyWNo7w
	QY+H99Bw3+5QPpBIWWOA3jlT+6y4HdchpYCCrbLgI465eaik4BAfQhHRZl0qpHiDjt/YLovGusv5G
	0Am67lhsAW2Oeox2scP6A3dTT728WvBpdv9HozZRPc4cuIQVA3TwGj2tl05n1ks3DDI0=;
Message-ID: <5aa739f7-dba0-42bf-beb3-594c53fdb868@xen.org>
Date: Tue, 14 Apr 2026 17:18:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/23] xen/arm: vsmmuv3: Add support for cmdqueue
 handling
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <b223a8bb3e4d8771fc643c324a692a2639a91c12.1774918270.git.milan_djokic@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b223a8bb3e4d8771fc643c324a692a2639a91c12.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,xen.org:dkim,xen.org:mid,epam.com:email];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
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
X-Rspamd-Queue-Id: 029023FE58B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

On 31/03/2026 10:52, Milan Djokic wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Add support for virtual cmdqueue handling for guests

This commit message is quite light. There are quite a few pitfalss with 
the command queue because it can be long running which require some 
explaining on the plan to handle it.

If this is delayed for later, then it would be useful to document in the 
code what's missing so it is easier to know whether the vSMMUv3 
implementation can be security supported (I assume this will be the goal).

> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/drivers/passthrough/arm/vsmmu-v3.c | 101 +++++++++++++++++++++++++
>   1 file changed, 101 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> index 3ae1e62a50..02fe6a4422 100644
> --- a/xen/drivers/passthrough/arm/vsmmu-v3.c
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -1,5 +1,6 @@
>   /* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
>   
> +#include <xen/guest_access.h>
>   #include <xen/param.h>
>   #include <xen/sched.h>
>   #include <asm/mmio.h>
> @@ -25,6 +26,26 @@
>   /* Struct to hold the vIOMMU ops and vIOMMU type */
>   extern const struct viommu_desc __read_mostly *cur_viommu;
>   
> +/* SMMUv3 command definitions */
> +#define CMDQ_OP_PREFETCH_CFG    0x1
> +#define CMDQ_OP_CFGI_STE        0x3
> +#define CMDQ_OP_CFGI_ALL        0x4
> +#define CMDQ_OP_CFGI_CD         0x5
> +#define CMDQ_OP_CFGI_CD_ALL     0x6
> +#define CMDQ_OP_TLBI_NH_ASID    0x11
> +#define CMDQ_OP_TLBI_NH_VA      0x12
> +#define CMDQ_OP_TLBI_NSNH_ALL   0x30
> +#define CMDQ_OP_CMD_SYNC        0x46
> +
> +/* Queue Handling */
> +#define Q_BASE(q)       ((q)->q_base & Q_BASE_ADDR_MASK)
> +#define Q_CONS_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->cons) * (q)->ent_size)
> +#define Q_PROD_ENT(q)   (Q_BASE(q) + Q_IDX(q, (q)->prod) * (q)->ent_size)
> +
> +/* Helper Macros */
> +#define smmu_get_cmdq_enabled(x)    FIELD_GET(CR0_CMDQEN, x)
> +#define smmu_cmd_get_command(x)     FIELD_GET(CMDQ_0_OP, x)
> +
>   /* virtual smmu queue */
>   struct arm_vsmmu_queue {
>       uint64_t    q_base; /* base register */
> @@ -49,8 +70,80 @@ struct virt_smmu {
>       uint64_t    gerror_irq_cfg0;
>       uint64_t    evtq_irq_cfg0;
>       struct      arm_vsmmu_queue evtq, cmdq;
> +    spinlock_t  cmd_queue_lock;
>   };
>   
> +/* Queue manipulation functions */
> +static bool queue_empty(struct arm_vsmmu_queue *q)
> +{
> +    return Q_IDX(q, q->prod) == Q_IDX(q, q->cons) &&
> +           Q_WRP(q, q->prod) == Q_WRP(q, q->cons);
> +}
> +
> +static void queue_inc_cons(struct arm_vsmmu_queue *q)
> +{
> +    uint32_t cons = (Q_WRP(q, q->cons) | Q_IDX(q, q->cons)) + 1;
> +    q->cons = Q_OVF(q->cons) | Q_WRP(q, cons) | Q_IDX(q, cons);
> +}
> +
> +static void dump_smmu_command(uint64_t *command)
> +{
> +    gdprintk(XENLOG_ERR, "cmd 0x%02llx: %016lx %016lx\n",
> +             smmu_cmd_get_command(command[0]), command[0], command[1]);

I would consider using gprintk() because this could be useful even in 
non-production build.

> +}
> +static int arm_vsmmu_handle_cmds(struct virt_smmu *smmu)
> +{
> +    struct arm_vsmmu_queue *q = &smmu->cmdq;
> +    struct domain *d = smmu->d;
> +    uint64_t command[CMDQ_ENT_DWORDS];
> +    paddr_t addr;
> +
> +    if ( !smmu_get_cmdq_enabled(smmu->cr[0]) )
> +        return 0;
> +
> +    while ( !queue_empty(q) )
 > +    {> +        int ret;
> +
> +        addr = Q_CONS_ENT(q);
> +        ret = access_guest_memory_by_gpa(d, addr, command,
> +                                         sizeof(command), false);
> +        if ( ret )
> +            return ret;
> +
> +        switch ( smmu_cmd_get_command(command[0]) )
> +        {
> +        case CMDQ_OP_CFGI_STE:
> +            break;
> +        case CMDQ_OP_PREFETCH_CFG:
> +        case CMDQ_OP_CFGI_CD:
> +        case CMDQ_OP_CFGI_CD_ALL:
> +        case CMDQ_OP_CFGI_ALL:
> +        case CMDQ_OP_CMD_SYNC:

Is this empty because there is nothing to do? Or is this empty because 
they are not yet implemented?

> +            break;
> +        case CMDQ_OP_TLBI_NH_ASID:
> +        case CMDQ_OP_TLBI_NSNH_ALL:
> +        case CMDQ_OP_TLBI_NH_VA:
> +            if ( !iommu_iotlb_flush_all(smmu->d, 1) )

This is quite a bigger hammer when the guest may only want to flush the 
S1 TLB for a single device. I am ok for now, but it would be good to add 
a TODO for optimizing it.

> +                break;
> +        default:
> +            gdprintk(XENLOG_ERR, "vSMMUv3: unhandled command\n");
> +            dump_smmu_command(command);
> +            break;
> +        }
> +
> +        if ( ret )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "vSMMUv3: command error %d while handling command\n",
> +                     ret);
> +            dump_smmu_command(command);
> +        }
> +        queue_inc_cons(q);
> +    }
> +    return 0;
> +}
> +
>   static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>                                 register_t r, void *priv)
>   {
> @@ -104,9 +197,15 @@ static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
>           break;
>   
>       case VREG32(ARM_SMMU_CMDQ_PROD):
> +        spin_lock(&smmu->cmd_queue_lock);
>           reg32 = smmu->cmdq.prod;
>           vreg_reg32_update(&reg32, r, info);
>           smmu->cmdq.prod = reg32;
> +
> +        if ( arm_vsmmu_handle_cmds(smmu) )
> +            gdprintk(XENLOG_ERR, "error handling vSMMUv3 commands\n");
> +
> +        spin_unlock(&smmu->cmd_queue_lock);
>           break;
>   
>       case VREG32(ARM_SMMU_CMDQ_CONS):
> @@ -326,6 +425,8 @@ static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
>       smmu->evtq.q_base = FIELD_PREP(Q_BASE_LOG2SIZE, SMMU_EVTQS);
>       smmu->evtq.ent_size = EVTQ_ENT_DWORDS * DWORDS_BYTES;
>   
> +    spin_lock_init(&smmu->cmd_queue_lock);
> +
>       register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);
>   
>       /* Register the vIOMMU to be able to clean it up later. */

Cheers,

-- 
Julien Grall


