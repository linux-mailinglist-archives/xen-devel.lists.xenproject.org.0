Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EFF3657AF
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 13:38:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113560.216422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYoi6-0001Ro-Fr; Tue, 20 Apr 2021 11:38:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113560.216422; Tue, 20 Apr 2021 11:38:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYoi6-0001RP-Cr; Tue, 20 Apr 2021 11:38:30 +0000
Received: by outflank-mailman (input) for mailman id 113560;
 Tue, 20 Apr 2021 11:38:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYoi4-0001RK-C0
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 11:38:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f149d5f-2b32-4e6e-a54f-bbb5f9a5ec6a;
 Tue, 20 Apr 2021 11:38:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88048AF52;
 Tue, 20 Apr 2021 11:38:26 +0000 (UTC)
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
X-Inumbo-ID: 0f149d5f-2b32-4e6e-a54f-bbb5f9a5ec6a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618918706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o46pYuyr1Fj8rLslI2UzFnxj0+NBg4CnXwVdzT0j2mw=;
	b=SmwyKflvLprWZbRn/9A2RQttJ8jgHnmBPpLPWyXF7IS0QFw9nAwQ/vCbiInmFyTUrZiLkZ
	oB/8Cqz0GWaevXcMlK+Y7Kf9T8lZP2EIB4qKOTmloa9aLkdUropNQCmpl8+fEdC1YrqQVx
	/81mYzIGs2Pun7/ZySX4BF7N9qyvGxA=
Subject: Re: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
To: Chao Gao <chao.gao@intel.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20200401200606.48752-1-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f4b3ad3b-16b9-5e42-c7a6-0c5c81b1f392@suse.com>
Date: Tue, 20 Apr 2021 13:38:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20200401200606.48752-1-chao.gao@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.04.2020 22:06, Chao Gao wrote:
> According to Intel VT-d SPEC rev3.3 Section 6.5, Register-based Invalidation
> isn't supported by Intel VT-d version 6 and beyond.
> 
> This hardware change impacts following two scenarios: admin can disable
> queued invalidation via 'qinval' cmdline and use register-based interface;
> VT-d switches to register-based invalidation when queued invalidation needs
> to be disabled, for example, during disabling x2apic or during system
> suspension or after enabling queued invalidation fails.
> 
> To deal with this hardware change, if register-based invalidation isn't
> supported, queued invalidation cannot be disabled through Xen cmdline; and
> if queued invalidation has to be disabled temporarily in some scenarios,
> VT-d won't switch to register-based interface but use some dummy functions
> to catch errors in case there is any invalidation request issued when queued
> invalidation is disabled.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>

In principle (with a minor nit further down)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, ...

> ---
> Changes in v2:
>  - verify system suspension and resumption with this patch applied
>  - don't fall back to register-based interface if enabling qinval failed.
>    see the change in init_vtd_hw().
>  - remove unnecessary "queued_inval_supported" variable
>  - constify the "struct vtd_iommu *" of has_register_based_invalidation()
>  - coding-style changes

... while this suggests this is v2 of a recently sent patch, the
submission is dated a little over a year ago. This is confusing.
It is additionally confusing that there were two copies of it in
my inbox, despite mails coming from a list normally getting
de-duplicated somewhere at our end (I believe).

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

Here (and at least once more yet further down): We don't normally end
log messages with a full stop. Easily addressable while committing, of
course.

Jan

