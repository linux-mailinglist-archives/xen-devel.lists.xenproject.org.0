Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0622FDBE2
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 22:33:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71778.128826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2L6a-0004I5-Fg; Wed, 20 Jan 2021 21:33:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71778.128826; Wed, 20 Jan 2021 21:33:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2L6a-0004He-Bv; Wed, 20 Jan 2021 21:33:32 +0000
Received: by outflank-mailman (input) for mailman id 71778;
 Wed, 20 Jan 2021 21:33:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vUnd=GX=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l2L6Y-0004HY-S7
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 21:33:30 +0000
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c763153-6657-438a-8355-1aa166bacf00;
 Wed, 20 Jan 2021 21:33:29 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f11so143813ljm.8
 for <xen-devel@lists.xenproject.org>; Wed, 20 Jan 2021 13:33:29 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id i11sm301217lfl.297.2021.01.20.13.33.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Jan 2021 13:33:27 -0800 (PST)
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
X-Inumbo-ID: 4c763153-6657-438a-8355-1aa166bacf00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TKfmdtXva70d3upDu7d0m8OsnDHbCfa/aZtoeQc90cw=;
        b=iH48H4B6kfadx0HpYRCCMu5eDm8i+2+CYZKUKIo0rnIs9LTDlxHbmhlmU0yZokM5CH
         fpe7k4cNXfAPczU9tx/i64gVBUtrNHctkF3pnDxcxNWfs5h7N7VSFb8yWmUYgNiBejsp
         jLV5MYFVzzyHybBOnPCS9Y74qbn5ylMhXkpnXm4fHlaP0TeDSz8Fzzbq8FhJukwXIW+V
         LmJS1DDHoJvM9ZtUNQVzedAZJ1+IqB4S6xzDZDxhW7t3WFBzZsjxQHr0j/wInIJzkT1J
         yXUG3wAFtntJm2CFko01OH00ayg+LlaBA9JzdgbDi0HujpqYeu5+aNvQwBIRJt/a1Gx/
         8ooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TKfmdtXva70d3upDu7d0m8OsnDHbCfa/aZtoeQc90cw=;
        b=FN8pe7gDHsY0cFpd5QraexOaDrAqK0S2in1D1kC/vKttUba4CFLINqmU6kTvwATBix
         dzuL0dSH1+GEVp4e5z3ScIaDgWVBDZ+9bNmGQ48e1+jqavbUa8UnoY71agbQYwdT+h3Q
         n23Cqgf3iunUFpRfoQGs5g6WxwIWv+ruvrsmOZhfAvl9j36+7TUEooXLQb5wrXiN2n1A
         u1KZrpwNRSY0Sm7mZM8s7LFkZoBfU1OH8QWha+t/JSqUfZ1ZNTp0HX99hXujugBBkPdi
         xnLu7p8ztPP+xgciL1GPbEo8fn2GLIpcBGXk6wjsz9VPYwrhTL7IwpFEfbDW+pPNqh4n
         VFXw==
X-Gm-Message-State: AOAM5316KETdyCANBfAbYcwA1JttbUnUpb2WbDUnt9mfYQrmRNo6q0vO
	vEnG8daZDP9aGKdUZlFXErY=
X-Google-Smtp-Source: ABdhPJz37rSX2CQ8duhbs1Kp/UoSeKX0S4A/95oU/YpAwK3Rof2Nn9ZlPUV03kxdYHN1dORUC8QfVg==
X-Received: by 2002:a2e:a402:: with SMTP id p2mr5393150ljn.270.1611178408018;
        Wed, 20 Jan 2021 13:33:28 -0800 (PST)
Subject: Re: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
To: Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1611153615.git.rahul.singh@arm.com>
 <b14ea889b0c27fec1b8843da91b570b0ccd66796.1611153615.git.rahul.singh@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <b35211f0-d523-aa5f-55a1-6afa5142617c@gmail.com>
Date: Wed, 20 Jan 2021 23:33:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b14ea889b0c27fec1b8843da91b570b0ccd66796.1611153615.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 20.01.21 16:52, Rahul Singh wrote:

Hi Rahul

> Add support for ARM architected SMMUv3 implementation. It is based on
> the Linux SMMUv3 driver.
>
> Driver is currently supported as Tech Preview.
>
> Major differences with regard to Linux driver are as follows:
> 2. Only Stage-2 translation is supported as compared to the Linux driver
>     that supports both Stage-1 and Stage-2 translations.
> 3. Use P2M  page table instead of creating one as SMMUv3 has the
>     capability to share the page tables with the CPU.
> 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
>     and priority queue IRQ handling.
> 5. Latest version of the Linux SMMUv3 code implements the commands queue
>     access functions based on atomic operations implemented in Linux.
>     Atomic functions used by the commands queue access functions are not
>     implemented in XEN therefore we decided to port the earlier version
>     of the code. Atomic operations are introduced to fix the bottleneck
>     of the SMMU command queue insertion operation. A new algorithm for
>     inserting commands into the queue is introduced, which is lock-free
>     on the fast-path.
>     Consequence of reverting the patch is that the command queue
>     insertion will be slow for large systems as spinlock will be used to
>     serializes accesses from all CPUs to the single queue supported by
>     the hardware. Once the proper atomic operations will be available in
>     XEN the driver can be updated.
> 6. Spin lock is used in place of mutex when attaching a device to the
>     SMMU, as there is no blocking locks implementation available in XEN.
>     This might introduce latency in XEN. Need to investigate before
>     driver is out for tech preview.
> 7. PCI ATS functionality is not supported, as there is no support
>     available in XEN to test the functionality. Code is not tested and
>     compiled. Code is guarded by the flag CONFIG_PCI_ATS.
> 8. MSI interrupts are not supported as there is no support available in
>     XEN to request MSI interrupts. Code is not tested and compiled. Code
>     is guarded by the flag CONFIG_MSI.
>
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes since v2:
> - added return statement for readx_poll_timeout function.
> - remove iommu_get_dma_cookie and iommu_put_dma_cookie.
> - remove struct arm_smmu_xen_device as not required.
> - move dt_property_match_string to device_tree.c file.
> - replace arm_smmu_*_thread to arm_smmu_*_tasklet to avoid confusion.
> - use ARM_SMMU_REG_SZ as size when map memory to XEN.
> - remove bypass keyword to make sure when device-tree probe is failed we
>    are reporting error and not continuing to configure SMMU in bypass
>    mode.
> - fixed minor comments.
> Changes since v3:
> - Fixed typo for CONFIG_MSI
> - Added back the mutex code
> - Rebase the patch on top of newly added WARN_ON().
> - Remove the direct read of register VTCR_EL2.
> - Fixed minor comments.
> Changes since v4:
> - Replace the ffsll() with ffs64() function.
> - Add code to free resources when probe failed.

Thank you for addressing, patch looks ok to me, just one small remark below:


> +
> +static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
> +{
> +}

We discussed in V4 about adding some code here which all IOMMUs on Arm 
already have, copy it below for the convenience:


      /* Set to false options not supported on ARM. */
      if ( iommu_hwdom_inclusive )
          printk(XENLOG_WARNING
          "map-inclusive dom0-iommu option is not supported on ARM\n");
      iommu_hwdom_inclusive = false;
      if ( iommu_hwdom_reserved == 1 )
          printk(XENLOG_WARNING
          "map-reserved dom0-iommu option is not supported on ARM\n");
      iommu_hwdom_reserved = 0;

      arch_iommu_hwdom_init(d);


Also we discussed about possibility to fold the part of code (which 
disables unsupported options) in arch_iommu_hwdom_init() to avoid 
duplication as a follow-up.
At least, I expected to see arch_iommu_hwdom_init() to be called by 
arm_smmu_iommu_hwdom_init() it current patch... Please note, this is 
*not* a request for change immediately,
I think, driver is functional even without this code (hopefully 
arch_iommu_hwdom_init is empty now, etc).  But, if you happen to do V6 
or probably it could be done on commit ...


> +
> +static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
> +{
> +	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
> +
> +	ASSERT(list_empty(&xen_domain->contexts));
> +	xfree(xen_domain);
> +}
> +
> +static const struct iommu_ops arm_smmu_iommu_ops = {
> +	.init		= arm_smmu_iommu_xen_domain_init,
> +	.hwdom_init		= arm_smmu_iommu_hwdom_init,
> +	.teardown		= arm_smmu_iommu_xen_domain_teardown,
> +	.iotlb_flush		= arm_smmu_iotlb_flush,
> +	.iotlb_flush_all	= arm_smmu_iotlb_flush_all,
> +	.assign_device		= arm_smmu_assign_dev,
> +	.reassign_device	= arm_smmu_reassign_dev,
> +	.map_page		= arm_iommu_map_page,
> +	.unmap_page		= arm_iommu_unmap_page,
> +	.dt_xlate		= arm_smmu_dt_xlate,
> +	.add_device		= arm_smmu_add_device,
> +};
> +
> +static __init int arm_smmu_dt_init(struct dt_device_node *dev,
> +				const void *data)
> +{
> +	int rc;
> +
> +	/*
> +	 * Even if the device can't be initialized, we don't want to
> +	 * give the SMMU device to dom0.
> +	 */
> +	dt_device_set_used_by(dev, DOMID_XEN);
> +
> +	rc = arm_smmu_device_probe(dt_to_dev(dev));
> +	if (rc)
> +		return rc;
> +
> +	iommu_set_ops(&arm_smmu_iommu_ops);
> +
> +	return 0;
> +}
> +
> +DT_DEVICE_START(smmuv3, "ARM SMMU V3", DEVICE_IOMMU)
> +.dt_match = arm_smmu_of_match,
> +.init = arm_smmu_dt_init,
> +DT_DEVICE_END

-- 
Regards,

Oleksandr Tyshchenko


