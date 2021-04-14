Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 043CF35F13F
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 12:07:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110431.210779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcQO-0006A4-15; Wed, 14 Apr 2021 10:07:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110431.210779; Wed, 14 Apr 2021 10:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWcQN-00069f-Sy; Wed, 14 Apr 2021 10:07:07 +0000
Received: by outflank-mailman (input) for mailman id 110431;
 Wed, 14 Apr 2021 10:07:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWcQM-00069a-43
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 10:07:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28c2ab46-5424-4db3-a9af-555ef1eb2a16;
 Wed, 14 Apr 2021 10:07:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 73D22AEC2;
 Wed, 14 Apr 2021 10:07:03 +0000 (UTC)
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
X-Inumbo-ID: 28c2ab46-5424-4db3-a9af-555ef1eb2a16
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618394823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P+BFNuRrnu/f/EndnfZG2/F8EA9Ao/8PPSJJTwXHVb4=;
	b=KKPFybKDW2qtdtA/Bfvrb9ceupyJGcLSbnMSrSe6++11af7BydC8ITSdiTST0Ijtr6cfNO
	ZqpK8voup5bpSXoDStpZeGMo4PTj6pYJCax6z+NF5h9qBVz5cfD/zINyeKPCCGvvjnJ/ZD
	QZXJnEj/WRR0X5kPTeUlK2Nu/uutuSA=
Subject: Re: [RFC PATCH] VT-d: Don't assume register-based invalidation is
 always supported
To: Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20210414005526.36760-1-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <568f7b59-57e0-7daf-c27d-b771869209c4@suse.com>
Date: Wed, 14 Apr 2021 12:07:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210414005526.36760-1-chao.gao@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.04.2021 02:55, Chao Gao wrote:
> According to Intel VT-d SPEC rev3.3 Section 6.5, Register-based Invalidation
> isn't supported by Intel VT-d version 6 and beyond.
> 
> This hardware change impacts following two scenarios: admin can disable
> queued invalidation via 'qinval' cmdline and use register-based interface;
> VT-d switches to register-based invalidation when queued invalidation needs
> to be disabled, for example, during disabling x2apic or during system
> suspension.
> 
> To deal with this hardware change, if register-based invalidation isn't
> supported, queued invalidation cannot be disabled through Xen cmdline; and
> if queued invalidation has to be disabled temporarily in some scenarios,
> VT-d won't switch to register-based interface but use some dummy functions
> to catch errors in case there is any invalidation request issued when queued
> invalidation is disabled.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> ---
> I only tested Xen boot with qinval/no-qinval. I also want to do system
> suspension and resumption to see if any unexpected error. But I don't
> know how to trigger them. Any recommendation?

Iirc, if your distro doesn't support a proper interface for this, it's
as simple as "echo mem >/sys/power/state".

> --- a/xen/drivers/passthrough/vtd/iommu.c
> +++ b/xen/drivers/passthrough/vtd/iommu.c
> @@ -1193,6 +1193,14 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
>  
>      iommu->cap = dmar_readq(iommu->reg, DMAR_CAP_REG);
>      iommu->ecap = dmar_readq(iommu->reg, DMAR_ECAP_REG);
> +    iommu->version = dmar_readl(iommu->reg, DMAR_VER_REG);
> +
> +    if ( !iommu_qinval && !has_register_based_invalidation(iommu) )
> +    {
> +        printk(XENLOG_WARNING VTDPREFIX "IOMMU %d: cannot disable Queued Invalidation.\n",
> +               iommu->index);
> +        iommu_qinval = true;
> +    }

With this I don't see ...

> @@ -2231,6 +2239,8 @@ static int __init vtd_setup(void)
>      struct acpi_drhd_unit *drhd;
>      struct vtd_iommu *iommu;
>      int ret;
> +    bool queued_inval_supported = true;
> +    bool reg_inval_supported = true;

... the need for the first variable here. You'd simply ...

> @@ -2272,8 +2282,11 @@ static int __init vtd_setup(void)
>          if ( iommu_hwdom_passthrough && !ecap_pass_thru(iommu->ecap) )
>              iommu_hwdom_passthrough = false;
>  
> -        if ( iommu_qinval && !ecap_queued_inval(iommu->ecap) )
> -            iommu_qinval = 0;

... clear iommu_qinval here again, and use that in the 1st if() you
add in the next hunk; the 2nd if() there would go away again.

> +        if ( reg_inval_supported && !has_register_based_invalidation(iommu) )
> +            reg_inval_supported = false;
> +
> +        if ( queued_inval_supported && !ecap_queued_inval(iommu->ecap) )
> +            queued_inval_supported = false;

I don't see the need for the left sides of the && in both of these
(or in fact any of the pre-existing) if()-s. (Of course this is not
a request to also adjust the ones that are already there.)

> @@ -2301,6 +2314,25 @@ static int __init vtd_setup(void)
>  
>      softirq_tasklet_init(&vtd_fault_tasklet, do_iommu_page_fault, NULL);
>  
> +    if ( !queued_inval_supported && !reg_inval_supported )
> +    {
> +        dprintk(XENLOG_ERR VTDPREFIX, "No available invalidation interface.\n");
> +        ret = -ENODEV;
> +        goto error;
> +    }
> +
> +    /*
> +     * We cannot have !iommu_qinval && !reg_inval_supported here since
> +     * iommu_qinval is set in iommu_alloc() if any iommu doesn't support
> +     * Register-based Invalidation.
> +     */
> +    if ( iommu_qinval && !queued_inval_supported )
> +    {
> +        dprintk(XENLOG_WARNING VTDPREFIX, "Disable Queued Invalidation as "
> +                "it isn't supported.\n");
> +        iommu_qinval = false;
> +    }
> +
>      if ( !iommu_qinval && iommu_intremap )
>      {
>          iommu_intremap = iommu_intremap_off;
> --- a/xen/drivers/passthrough/vtd/iommu.h
> +++ b/xen/drivers/passthrough/vtd/iommu.h
> @@ -540,6 +540,7 @@ struct vtd_iommu {
>      struct list_head ats_devices;
>      unsigned long *domid_bitmap;  /* domain id bitmap */
>      u16 *domid_map;               /* domain id mapping array */
> +    u32 version;

Nit: uint32_t please in new code, assuming a fixed-width value is
needed here in the first place (see ./CODING_STYLE).

> @@ -549,4 +550,10 @@ struct vtd_iommu {
>              dprintk(XENLOG_WARNING VTDPREFIX, fmt, ## args);    \
>      } while(0)
>  
> +/* Register-based invalidation isn't supported by VT-d version 6 and beyond. */
> +static inline bool has_register_based_invalidation(struct vtd_iommu *iommu)

"const" please

> @@ -463,6 +480,18 @@ void disable_qinval(struct vtd_iommu *iommu)
>  out:
>      spin_unlock_irqrestore(&iommu->register_lock, flags);
>  
> -    iommu->flush.context = vtd_flush_context_reg;
> -    iommu->flush.iotlb   = vtd_flush_iotlb_reg;
> +    /*
> +     * Assign callbacks to noop to catch errors if register-based invalidation
> +     * isn't supported.
> +     */
> +    if ( has_register_based_invalidation(iommu) )
> +    {
> +        iommu->flush.context = vtd_flush_context_reg;
> +        iommu->flush.iotlb   = vtd_flush_iotlb_reg;
> +    }
> +    else
> +    {
> +        iommu->flush.context = vtd_flush_context_noop;
> +        iommu->flush.iotlb = vtd_flush_iotlb_noop;

Nit: Would be nice if aligning (or not) the = operators was done
the same in both cases.

Seeing this part of the change I wonder whether you shouldn't also
alter the other place where the register-based invalidation hooks
get put in place: It can't be right to install them when enabling
qinval fails but register-based invalidation is also not available.
I guess, no matter how much we'd like to avoid such, panic() may be
needed there in this case, or IOMMU initialization as a whole needs
to be failed.

Jan

