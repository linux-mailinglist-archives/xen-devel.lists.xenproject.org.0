Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE8736590A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 14:37:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113618.216532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpdA-0007dD-7S; Tue, 20 Apr 2021 12:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113618.216532; Tue, 20 Apr 2021 12:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpdA-0007co-3l; Tue, 20 Apr 2021 12:37:28 +0000
Received: by outflank-mailman (input) for mailman id 113618;
 Tue, 20 Apr 2021 12:37:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yMJ0=JR=intel.com=chao.gao@srs-us1.protection.inumbo.net>)
 id 1lYpd9-0007cj-7i
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 12:37:27 +0000
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d37eb6c9-581c-4eb4-ac03-68d33f006aea;
 Tue, 20 Apr 2021 12:37:22 +0000 (UTC)
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 05:37:21 -0700
Received: from gao-cwp.sh.intel.com (HELO gao-cwp) ([10.239.159.149])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 05:37:18 -0700
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
X-Inumbo-ID: d37eb6c9-581c-4eb4-ac03-68d33f006aea
IronPort-SDR: 8ENSriSrf/ef9mDRmsr9Guol8FOaFEcS+lR5v9WwPSQ9GVYewRDpPMiu+JVJ4bSdepl47X6GB2
 Olimjc2ujYwg==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="182629102"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="182629102"
IronPort-SDR: O7KmZDvxuhOz0prwu+3x444EnRXqTsEP7IEi60RmoghTIxR/41DlrkSB+S1aVzBzhJwWlvAuwm
 lK8joYWbc8Aw==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; 
   d="scan'208";a="426910262"
Date: Tue, 20 Apr 2021 20:41:29 +0800
From: Chao Gao <chao.gao@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] VT-d: Don't assume register-based invalidation is
 always supported
Message-ID: <20210420124127.GA12175@gao-cwp>
References: <20200401200606.48752-1-chao.gao@intel.com>
 <f4b3ad3b-16b9-5e42-c7a6-0c5c81b1f392@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4b3ad3b-16b9-5e42-c7a6-0c5c81b1f392@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Tue, Apr 20, 2021 at 01:38:26PM +0200, Jan Beulich wrote:
>On 01.04.2020 22:06, Chao Gao wrote:
>> According to Intel VT-d SPEC rev3.3 Section 6.5, Register-based Invalidation
>> isn't supported by Intel VT-d version 6 and beyond.
>> 
>> This hardware change impacts following two scenarios: admin can disable
>> queued invalidation via 'qinval' cmdline and use register-based interface;
>> VT-d switches to register-based invalidation when queued invalidation needs
>> to be disabled, for example, during disabling x2apic or during system
>> suspension or after enabling queued invalidation fails.
>> 
>> To deal with this hardware change, if register-based invalidation isn't
>> supported, queued invalidation cannot be disabled through Xen cmdline; and
>> if queued invalidation has to be disabled temporarily in some scenarios,
>> VT-d won't switch to register-based interface but use some dummy functions
>> to catch errors in case there is any invalidation request issued when queued
>> invalidation is disabled.
>> 
>> Signed-off-by: Chao Gao <chao.gao@intel.com>
>
>In principle (with a minor nit further down)
>Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
>However, ...
>
>> ---
>> Changes in v2:
>>  - verify system suspension and resumption with this patch applied
>>  - don't fall back to register-based interface if enabling qinval failed.
>>    see the change in init_vtd_hw().
>>  - remove unnecessary "queued_inval_supported" variable
>>  - constify the "struct vtd_iommu *" of has_register_based_invalidation()
>>  - coding-style changes
>
>... while this suggests this is v2 of a recently sent patch, the
>submission is dated a little over a year ago. This is confusing.
>It is additionally confusing that there were two copies of it in
>my inbox, despite mails coming from a list normally getting
>de-duplicated somewhere at our end (I believe).

You are right. I messed the system time of my server somehow. Sorry for this.
If it is possible, please help to update the date of this patch also.

>
>> --- a/xen/drivers/passthrough/vtd/iommu.c
>> +++ b/xen/drivers/passthrough/vtd/iommu.c
>> @@ -1193,6 +1193,14 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
>>  
>>      iommu->cap = dmar_readq(iommu->reg, DMAR_CAP_REG);
>>      iommu->ecap = dmar_readq(iommu->reg, DMAR_ECAP_REG);
>> +    iommu->version = dmar_readl(iommu->reg, DMAR_VER_REG);
>> +
>> +    if ( !iommu_qinval && !has_register_based_invalidation(iommu) )
>> +    {
>> +        printk(XENLOG_WARNING VTDPREFIX "IOMMU %d: cannot disable Queued Invalidation.\n",
>> +               iommu->index);
>
>Here (and at least once more yet further down): We don't normally end
>log messages with a full stop. Easily addressable while committing, of
>course.

Okay. Please go ahead.

Thanks
Chao

