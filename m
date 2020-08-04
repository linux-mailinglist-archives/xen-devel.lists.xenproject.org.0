Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DFA123B47A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Aug 2020 07:34:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2par-00053F-8y; Tue, 04 Aug 2020 05:34:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iF6a=BO=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k2pap-000537-9R
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 05:34:31 +0000
X-Inumbo-ID: 2b18188e-d614-11ea-9126-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b18188e-d614-11ea-9126-bc764e2007e4;
 Tue, 04 Aug 2020 05:34:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A2D4ACB5;
 Tue,  4 Aug 2020 05:34:45 +0000 (UTC)
Subject: Re: [PATCH v3 09/11] swiotlb-xen: introduce phys_to_dma/dma_to_phys
 translations
To: Stefano Stabellini <sstabellini@kernel.org>, boris.ostrovsky@oracle.com,
 konrad.wilk@oracle.com
References: <alpine.DEB.2.21.2007101521290.4124@sstabellini-ThinkPad-T480s>
 <20200710223427.6897-9-sstabellini@kernel.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2f68bb03-60b6-44d6-b9cd-d21ef20a4a68@suse.com>
Date: Tue, 4 Aug 2020 07:34:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200710223427.6897-9-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: hch@infradead.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 linux-kernel@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.07.20 00:34, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> With some devices physical addresses are different than dma addresses.
> To be able to deal with these cases, we need to call phys_to_dma on
> physical addresses (including machine addresses in Xen terminology)
> before returning them from xen_swiotlb_alloc_coherent and
> xen_swiotlb_map_page.
> 
> We also need to convert dma addresses back to physical addresses using
> dma_to_phys in xen_swiotlb_free_coherent and xen_swiotlb_unmap_page if
> we want to do any operations on them.
> 
> Call dma_to_phys in is_xen_swiotlb_buffer.
> Introduce xen_phys_to_dma and call phys_to_dma in its implementation.
> Introduce xen_dma_to_phys and call dma_to_phys in its implementation.
> Call xen_phys_to_dma/xen_dma_to_phys instead of
> xen_phys_to_bus/xen_bus_to_phys through swiotlb-xen.c.
> 
> Everything is taken care of by these changes except for
> xen_swiotlb_alloc_coherent and xen_swiotlb_free_coherent, which need a
> few explicit phys_to_dma/dma_to_phys calls.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Tested-by: Corey Minyard <cminyard@mvista.com>
> Tested-by: Roman Shaposhnik <roman@zededa.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

