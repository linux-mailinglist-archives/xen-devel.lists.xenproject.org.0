Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1F41ADCDC
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 14:06:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPPlY-0003ss-RH; Fri, 17 Apr 2020 12:06:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPPlY-0003sn-3N
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 12:06:40 +0000
X-Inumbo-ID: e47ec60c-80a3-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e47ec60c-80a3-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 12:06:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 18D4DABEF;
 Fri, 17 Apr 2020 12:06:38 +0000 (UTC)
Subject: Re: [PATCH] x86/vtd: relax EPT page table sharing check
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200417112954.21250-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00d0abbb-5925-4866-8614-7ea10bc80cf4@suse.com>
Date: Fri, 17 Apr 2020 14:06:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200417112954.21250-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 13:29, Roger Pau Monne wrote:
> The EPT page tables can be shared with the IOMMU as long as the page
> sizes supported by EPT are also supported by the IOMMU.
> 
> Current code checks that both the IOMMU and EPT support the same page
> sizes, but this is not strictly required, the IOMMU supporting more
> page sizes than EPT is fine and shouldn't block page table sharing.
> 
> This is likely not a common case (IOMMU supporting more page sizes
> than EPT), but should still be fixed for correctness.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

