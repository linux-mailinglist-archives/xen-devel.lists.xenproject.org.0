Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKrIHehcxWlM9wQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 17:20:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8AC33846A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Mar 2026 17:20:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1264498.1556028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5nRD-0001P6-6Y; Thu, 26 Mar 2026 16:20:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1264498.1556028; Thu, 26 Mar 2026 16:20:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w5nRD-0001Ls-3S; Thu, 26 Mar 2026 16:20:03 +0000
Received: by outflank-mailman (input) for mailman id 1264498;
 Thu, 26 Mar 2026 16:20:01 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <helgaas@kernel.org>) id 1w5nRB-00010d-BW
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 16:20:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w5nRA-009bfB-Ne
 for xen-devel@lists.xenproject.org; Thu, 26 Mar 2026 17:20:00 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <helgaas@kernel.org>)
 id 69c55cb0-bab6-0a2a0a5309dd-0a2a450cd54a-0
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 17:20:00 +0100
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <helgaas@kernel.org>)
 id 69c55caf-f93d-0a2a450c0019-ac6904feaa5e-3
 for <xen-devel@lists.xenproject.org>; Thu, 26 Mar 2026 17:20:00 +0100
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id CF4E960053;
 Thu, 26 Mar 2026 16:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58181C116C6;
 Thu, 26 Mar 2026 16:19:58 +0000 (UTC)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=k20201202 header.d=kernel.org header.i="@kernel.org" header.h="Date:From:To:Cc:Subject:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774541998;
	bh=HUtRwEpymq8y1tHT5IuCcbjZ8WgelRutIBJgFxgBfwY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=F8mHPbZMLywhR2KPKiO47GUlQve1aWTvrP9jUY2zHBn/GgXJAJ8kIosO6KRmT2xPy
	 0IOXnbxBuiHeZMvRl+TjIGCZL+xLIklcHleCk7JhPz7DuyprdCRvXeIavUjsvsJn3u
	 2Q1RhEo14xk900QBnukOrxjvVlgBCi/2LncSYTzSdhsFA5hJ9IBKJY83E/k7nfnIj+
	 5lTlIF6wm86KROEBrkkqhHauUmxF3ByqGulkPiq2SUiGMalg+b2lo7okZjYoEqA7SE
	 DQIUYImcIBQS+JZCWgUDtLEZ0SBKAUGmugBagt425A+Pxg6+wxIOHa2m/AYEY0slHj
	 ZzEGDAJHfpMMw==
Date: Thu, 26 Mar 2026 11:19:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org, imx@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
	Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v11 2/3] of: Factor arguments passed to of_map_id() into
 a struct
Message-ID: <20260326161957.GA1324845@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-parse_iommu_cells-v11-2-1fefa5c0e82c@oss.qualcomm.com>
X-purgate-ID: tlsNG-d25034/1774542000-F7CA2734-0DE1B763/0/0
X-purgate-type: clean
X-purgate-size: 4293
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[helgaas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vijayanand.jitta@oss.qualcomm.com,m:hongxing.zhu@nxp.com,m:l.stach@pengutronix.de,m:nipun.gupta@amd.com,m:nikhil.agarwal@amd.com,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maz@kernel.org,m:lpieralisi@kernel.org,m:tglx@kernel.org,m:saravanak@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:bhelgaas@google.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:jgross@suse.com,m:sstabellini@kernel.org,m:oleksandr_tyshchenko@epam.com,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:bjorn.andersson@oss.qualcomm.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:krzk+dt@kernel.org,m:prakash.gupta@oss.qualcomm.com,m:vikash.garodia@oss.qualcomm.com,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pci@vger.kernel.org,m:imx@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:linux-arm-msm@vger.kernel.org,m:
 charan.kalla@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,8bytes.org,kernel.org,arm.com,google.com,nxp.com,pengutronix.de,gmail.com,suse.com,epam.com,oss.qualcomm.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,lists.xenproject.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,iommu_spec.np:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: CE8AC33846A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[cc->to: Richard, Lucas for pci-imx6.c question]

On Wed, Mar 25, 2026 at 04:38:23PM +0530, Vijayanand Jitta wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> Change of_map_id() to take a pointer to struct of_phandle_args
> instead of passing target device node and translated IDs separately.
> Update all callers accordingly.
> 
> Add an explicit filter_np parameter to of_map_id() and of_map_msi_id()
> to separate the filter input from the output. Previously, the target
> parameter served dual purpose: as an input filter (if non-NULL, only
> match entries targeting that node) and as an output (receiving the
> matched node with a reference held). Now filter_np is the explicit
> input filter and arg->np is the pure output.
> 
> Previously, of_map_id() would call of_node_put() on the matched node
> when a filter was provided, making reference ownership inconsistent.
> Remove this internal of_node_put() call so that of_map_id() now always
> transfers ownership of the matched node reference to the caller via
> arg->np. Callers are now consistently responsible for releasing this
> reference with of_node_put(arg->np) when done.
> ...

Not actually part of *this* patch, and AFAICS this patch is correct
as-is, but is it necessary to have different logic around
of_node_put() for imx_pcie_add_lut_by_rid() and
apple_pcie_enable_device()?

> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1137,6 +1137,8 @@ static void imx_pcie_remove_lut(struct imx_pcie *imx_pcie, u16 rid)
>  
>  static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  {
> +	struct of_phandle_args iommu_spec = {};
> +	struct of_phandle_args msi_spec = {};
>  	struct device *dev = imx_pcie->pci->dev;
>  	struct device_node *target;
>  	u32 sid_i, sid_m;
> @@ -1144,7 +1146,12 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  	u32 sid = 0;
>  
>  	target = NULL;
> -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
> +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
> +	if (!err_i) {
> +		target = iommu_spec.np;
> +		sid_i = iommu_spec.args[0];
> +	}
> +
>  	if (target) {
>  		of_node_put(target);

Here it's conditional on "target" even though of_node_put() checks
internally for non-NULL, so it would be safe without the conditional
here.

>  	} else {
> @@ -1156,8 +1163,11 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  		err_i = -EINVAL;
>  	}
>  
> -	target = NULL;
> -	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
> +	err_m = of_map_msi_id(dev->of_node, rid, NULL, &msi_spec);
> +	if (!err_m) {
> +		target = msi_spec.np;
> +		sid_m = msi_spec.args[0];
> +	}
>  
>  	/*
>  	 *   err_m      target

And here (outside the diff context) we also call of_node_put()
conditionally:

  ...
  else if (target)
    of_node_put(target);

> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a0937b7b3c4d..c2cffc0659f4 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  {
>  	u32 sid, rid = pci_dev_id(pdev);
>  	struct apple_pcie_port *port;
> +	struct of_phandle_args iommu_spec = {};
>  	int idx, err;
>  
>  	port = apple_pcie_get_port(pdev);
> @@ -764,10 +765,12 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>  		pci_name(pdev->bus->self), port->idx);
>  
> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>  	if (err)
>  		return err;
>  
> +	of_node_put(iommu_spec.np);

Here we call of_node_put() unconditionally.

I think it would be much nicer if imx_pcie_add_lut_by_rid() used the
same style as apple_pcie_enable_device() and did the of_node_put()
unconditionally.  That would untangle the function a bit and make it
easier to analyze.

> +	sid = iommu_spec.args[0];
>  	mutex_lock(&port->pcie->lock);
>  
>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);

