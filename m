Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B98E22D6D85
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 02:29:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50033.88504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXF5-00068Y-2z; Fri, 11 Dec 2020 01:29:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50033.88504; Fri, 11 Dec 2020 01:29:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knXF4-00067r-Vd; Fri, 11 Dec 2020 01:29:06 +0000
Received: by outflank-mailman (input) for mailman id 50033;
 Fri, 11 Dec 2020 01:29:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZKjA=FP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knXF3-00067E-Uy
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 01:29:05 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b597f50-d032-4a33-bbb5-357f783602fb;
 Fri, 11 Dec 2020 01:29:04 +0000 (UTC)
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
X-Inumbo-ID: 4b597f50-d032-4a33-bbb5-357f783602fb
Date: Thu, 10 Dec 2020 17:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607650144;
	bh=o1YuXZ1UFfht1Mq6WAudo2SMaWA5ntFuZo2TWa2BfK8=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=DlkVr2QcAMAtXfeDMT6AqyMalzsih5KC2tJM/sqpYMDAdOiQTcZfZW9q12TgwlRjU
	 cb9aK9bgKp7fvuuJQDbD0YjCKiH2pQ3i3561TzFawfyTZBjUSDKjhptIJ7NV/2SGB+
	 56ecrw/omuMy29MyTkwNQ76CufGA/9/4GG7itglaQlDYYh5e7uwgVkmDNwnn0rUxJ4
	 WJGUPtLCNGmPexZEvHR0K2Ajy+x0R/rjpLGcNkWm8inxTDyV4eSDSaeciandULeAdX
	 NKXiV+fkK5ssryWuXWCmnLMCUMGc26KK1TF6F3pDv5niI7BhXXtQNOyuppgGQV9NXD
	 C33VHgf3kGYng==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 8/8] xen/arm: smmuv3: Remove linux compatibility
 functions.
In-Reply-To: <c38df3122a9e74e2324936c8bd36d372cdc3009a.1607617848.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2012101622570.6285@sstabellini-ThinkPad-T480s>
References: <cover.1607617848.git.rahul.singh@arm.com> <c38df3122a9e74e2324936c8bd36d372cdc3009a.1607617848.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Dec 2020, Rahul Singh wrote:
> Replace all Linux compatible device tree handling function with the XEN
> functions.
> 
> Replace all Linux ktime function with the XEN time functions.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
>  - This patch is introduce in this version.
> 
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 32 +++++++--------------------
>  1 file changed, 8 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 65b3db94ad..c19c56ebc8 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -101,22 +101,6 @@ typedef unsigned int		gfp_t;
>  
>  #define GFP_KERNEL		0
>  
> -/* Alias to Xen device tree helpers */
> -#define device_node			dt_device_node
> -#define of_phandle_args		dt_phandle_args
> -#define of_device_id		dt_device_match
> -#define of_match_node		dt_match_node
> -#define of_property_read_u32(np, pname, out)	\
> -		(!dt_property_read_u32(np, pname, out))
> -#define of_property_read_bool		dt_property_read_bool
> -#define of_parse_phandle_with_args	dt_parse_phandle_with_args
> -
> -/* Alias to Xen time functions */
> -#define ktime_t s_time_t
> -#define ktime_get()			(NOW())
> -#define ktime_add_us(t, i)		(t + MICROSECS(i))
> -#define ktime_compare(t, i)		(t > (i))
> -
>  /* Alias to Xen allocation helpers */
>  #define kzalloc(size, flags)	_xzalloc(size, sizeof(void *))
>  #define kfree	xfree
> @@ -922,7 +906,7 @@ static void parse_driver_options(struct arm_smmu_device *smmu)
>  	int i = 0;
>  
>  	do {
> -		if (of_property_read_bool(smmu->dev->of_node,
> +		if (dt_property_read_bool(smmu->dev->of_node,
>  						arm_smmu_options[i].prop)) {
>  			smmu->options |= arm_smmu_options[i].opt;
>  			dev_notice(smmu->dev, "option %s\n",
> @@ -994,17 +978,17 @@ static void queue_inc_prod(struct arm_smmu_ll_queue *q)
>   */
>  static int queue_poll_cons(struct arm_smmu_queue *q, bool sync, bool wfe)
>  {
> -	ktime_t timeout;
> +	s_time_t timeout;
>  	unsigned int delay = 1, spin_cnt = 0;
>  
>  	/* Wait longer if it's a CMD_SYNC */
> -	timeout = ktime_add_us(ktime_get(), sync ?
> +	timeout = NOW() + MICROSECS(sync ?
>  					    ARM_SMMU_CMDQ_SYNC_TIMEOUT_US :
>  					    ARM_SMMU_POLL_TIMEOUT_US);
>  
>  	while (queue_sync_cons_in(q),
>  	      (sync ? !queue_empty(&q->llq) : queue_full(&q->llq))) {
> -		if (ktime_compare(ktime_get(), timeout) > 0)
> +		if ((NOW() > timeout) > 0)
>  			return -ETIMEDOUT;
>  
>  		if (wfe) {
> @@ -1232,13 +1216,13 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>   */
>  static int __arm_smmu_sync_poll_msi(struct arm_smmu_device *smmu, u32 sync_idx)
>  {
> -	ktime_t timeout;
> +	s_time_t timeout;
>  	u32 val;
>  
> -	timeout = ktime_add_us(ktime_get(), ARM_SMMU_CMDQ_SYNC_TIMEOUT_US);
> +	timeout = NOW() + MICROSECS(ARM_SMMU_CMDQ_SYNC_TIMEOUT_US);
>  	val = smp_cond_load_acquire(&smmu->sync_count,
>  				    (int)(VAL - sync_idx) >= 0 ||
> -				    !ktime_before(ktime_get(), timeout));
> +				    !(NOW() < timeout));
>  
>  	return (int)(val - sync_idx) < 0 ? -ETIMEDOUT : 0;
>  }
> @@ -2969,7 +2953,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>  	u32 cells;
>  	int ret = -EINVAL;
>  
> -	if (of_property_read_u32(dev->of_node, "#iommu-cells", &cells))
> +	if (!dt_property_read_u32(dev->of_node, "#iommu-cells", &cells))
>  		dev_err(dev, "missing #iommu-cells property\n");
>  	else if (cells != 1)
>  		dev_err(dev, "invalid #iommu-cells value (%d)\n", cells);
> -- 
> 2.17.1
> 

