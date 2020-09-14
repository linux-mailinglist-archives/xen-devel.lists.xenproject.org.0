Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1E1268C1D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Sep 2020 15:22:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kHoPt-00064M-5q; Mon, 14 Sep 2020 13:21:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIgq=CX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kHoPr-00064H-IC
 for xen-devel@lists.xenproject.org; Mon, 14 Sep 2020 13:21:07 +0000
X-Inumbo-ID: 6d68017b-9ab1-48d8-b504-de82f544cfae
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d68017b-9ab1-48d8-b504-de82f544cfae;
 Mon, 14 Sep 2020 13:21:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7959AABC4;
 Mon, 14 Sep 2020 13:21:21 +0000 (UTC)
Subject: Re: [PATCH v8 4/8] iommu: make map and unmap take a page count,
 similar to flush
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <20200911082032.1466-1-paul@xen.org>
 <20200911082032.1466-5-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7910775e-8748-41a0-48ad-6b9dd9807033@suse.com>
Date: Mon, 14 Sep 2020 15:21:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911082032.1466-5-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

On 11.09.2020 10:20, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> At the moment iommu_map() and iommu_unmap() take a page order rather than a
> count, whereas iommu_iotlb_flush() takes a page count rather than an order.
> This patch makes them consistent with each other, opting for a page count since
> CPU page orders are not necessarily the same as those of an IOMMU.
> 
> NOTE: The 'page_count' parameter is also made an unsigned long in all the
>       aforementioned functions.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


