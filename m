Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31532268996
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 12:48:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHm1U-000827-Ro; Mon, 14 Sep 2020 10:47:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LHiq=CX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kHm1T-000821-SS
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 10:47:47 +0000
X-Inumbo-ID: ce792b25-2b20-486a-b2b1-e77c887ac3d1
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce792b25-2b20-486a-b2b1-e77c887ac3d1;
 Mon, 14 Sep 2020 10:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=mSAR+sNjDEHeC0b9WpUqlNnuqxwyFTHiNqQVMVq0KEE=; b=Sl9e51VZW36NMG2MdlJwFgkEc5
 u7Bb9b5EwSkMeSGkC7PxAnIrHlOoFFnBeY3OhuEGT5haL+14CNBLGXPRXaQqUju7ao+N0IWpICnuz
 +YsEPAhc0RVs5S2NPhg+iEWHN91j2V99yVNWgyy+cUS2s1QvYQBpXtiHVFAG0IWl4UBg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kHm1A-0003gz-7B; Mon, 14 Sep 2020 10:47:28 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kHm19-0008P1-TR; Mon, 14 Sep 2020 10:47:28 +0000
Subject: Re: [PATCH v8 5/8] remove remaining uses of iommu_legacy_map/unmap
To: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20200911082032.1466-1-paul@xen.org>
 <20200911082032.1466-6-paul@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <bfc234e7-b822-71e1-f305-b0643998f00a@xen.org>
Date: Mon, 14 Sep 2020 11:47:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911082032.1466-6-paul@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Paul,

I am sorry for jumping very late in the discussion.

On 11/09/2020 09:20, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> The 'legacy' functions do implicit flushing so amend the callers to do the
> appropriate flushing.
> 
> Unfortunately, because of the structure of the P2M code, we cannot remove
> the per-CPU 'iommu_dont_flush_iotlb' global and the optimization it
> facilitates. It is now checked directly iommu_iotlb_flush(). This is safe
> because callers of iommu_iotlb_flush() on another CPU will not be affected,
> and hence a flush will be done. Also, 'iommu_dont_flush_iotlb' is now declared
> as bool (rather than bool_t) and setting/clearing it are no longer pointlessly
> gated on is_iommu_enabled() returning true. (Arguably it is also pointless to
> gate the call to iommu_iotlb_flush() on that condition - since it is a no-op
> in that case - but the if clause allows the scope of a stack variable to be
> restricted).

Unfortunately, this change will re-open a potential security hole closed 
by commit 671878779741:

     xen/arm: p2m: Free the p2m entry after flushing the IOMMU TLBs

     When freeing a p2m entry, all the sub-tree behind it will also be 
freed.
     This may include intermediate page-tables or any l3 entry requiring to
     drop a reference (e.g for foreign pages). As soon as pages are freed,
     they may be re-used by Xen or another domain. Therefore it is necessary
     to flush *all* the TLBs beforehand.

     While CPU TLBs will be flushed before freeing the pages, this is not
     the case for IOMMU TLBs. This can be solved by moving the IOMMU TLBs
     flush earlier in the code.

     This wasn't considered as a security issue as device passthrough on Arm
     is not security supported.

     Signed-off-by: Julien Grall <julien.grall@arm.com>
     Tested-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
     Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
     Release-acked-by: Juergen Gross <jgross@suse.com>

One possibility would be to treat iommu_dont_flush_iotlb as x86 only.

Cheers,

-- 
Julien Grall

