Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4912EFCCA
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 02:45:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63960.113412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky3JP-0008Vw-DW; Sat, 09 Jan 2021 01:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63960.113412; Sat, 09 Jan 2021 01:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky3JP-0008VQ-9n; Sat, 09 Jan 2021 01:45:03 +0000
Received: by outflank-mailman (input) for mailman id 63960;
 Sat, 09 Jan 2021 01:45:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEI1=GM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ky3JN-0008QN-Kn
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 01:45:01 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20b1fe40-7033-4fee-93d9-b0d7d85ddd50;
 Sat, 09 Jan 2021 01:45:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1DA323A1E;
 Sat,  9 Jan 2021 01:44:59 +0000 (UTC)
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
X-Inumbo-ID: 20b1fe40-7033-4fee-93d9-b0d7d85ddd50
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610156699;
	bh=NRJCQkuvhLeozbvyL4gm8xi+PZLU2P0FQF1Gt3t22Yw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=etUMoZ1b6q1FY4MBnCJadu07n9BuUVh+WW+8H4GmvDuXcIRod1hRii+H1IDt5uMF7
	 +kpiY8bkxT7Y2R7Y6YFLCWaHfHgTsqXGOZC4u0ITqV6I0ZS2MEVuYdMhqrujuW1lzE
	 kQdF6R//KFIYiOlGvBZae9nXGor98G3QR9DjaFKO5QHj4+F+CBgyhGW94rau3odE0K
	 5dcjbmapRuDqasWG29/0Wg5kkFZ/1qyZXO/1mLdmGjUjas5JFLA1wDiHUIYJBK6Kzl
	 /S6V/TeAAzJxhmWLK80EIkEP17iknntPoBEYgWsIUlr2LymftXjCp4CqY4mrwraAHD
	 wF+7o6gJb4Lbw==
Date: Fri, 8 Jan 2021 17:44:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 10/11] xen/arm: smmuv3: Replace linux functions with
 xen functions.
In-Reply-To: <85c1bdd22dc6f50c9d1dfd73e0ddf83c2c307dcf.1610115608.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2101081611000.26153@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <85c1bdd22dc6f50c9d1dfd73e0ddf83c2c307dcf.1610115608.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Jan 2021, Rahul Singh wrote:
> Replace all Linux device tree handling function with the XEN
> functions.
> 
> Replace all Linux ktime function with the XEN time functions.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
>  - This patch is introduce in this version.
> Changes in V4:
>  - Move this patch one patch earlier so that there is no need to remove
>    the code.
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index f5f8b4c981..2dfadc6a65 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -682,7 +682,7 @@ static void parse_driver_options(struct arm_smmu_device *smmu)
>  	int i = 0;
>  
>  	do {
> -		if (of_property_read_bool(smmu->dev->of_node,
> +		if (dt_property_read_bool(smmu->dev->of_node,
>  						arm_smmu_options[i].prop)) {
>  			smmu->options |= arm_smmu_options[i].opt;
>  			dev_notice(smmu->dev, "option %s\n",
> @@ -754,17 +754,17 @@ static void queue_inc_prod(struct arm_smmu_ll_queue *q)
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
> @@ -990,13 +990,13 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
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
> @@ -2649,7 +2649,7 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
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

