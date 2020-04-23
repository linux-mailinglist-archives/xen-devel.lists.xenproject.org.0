Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EB21B610D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 18:35:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRenX-0001oR-82; Thu, 23 Apr 2020 16:33:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRenV-0001oM-4Z
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 16:33:57 +0000
X-Inumbo-ID: 39c495b6-8580-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39c495b6-8580-11ea-b4f4-bc764e2007e4;
 Thu, 23 Apr 2020 16:33:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9C1B7ABCF;
 Thu, 23 Apr 2020 16:33:54 +0000 (UTC)
Subject: Re: [PATCH v11 1/3] x86/tlb: introduce a flush HVM ASIDs flag
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200423145611.55378-1-roger.pau@citrix.com>
 <20200423145611.55378-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59e48d80-8ce1-3f3d-c07e-5117adea272a@suse.com>
Date: Thu, 23 Apr 2020 18:33:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423145611.55378-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: xen-devel@lists.xenproject.org, Tim Deegan <tim@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.04.2020 16:56, Roger Pau Monne wrote:
> Introduce a specific flag to request a HVM guest linear TLB flush,
> which is an ASID/VPID tickle that forces a guest linear to guest
> physical TLB flush for all HVM guests.
> 
> This was previously unconditionally done in each pre_flush call, but
> that's not required: HVM guests not using shadow don't require linear
> TLB flushes as Xen doesn't modify the pages tables the guest runs on
> in that case (ie: when using HAP). Note that shadow paging code
> already takes care of issuing the necessary flushes when the shadow
> page tables are modified.
> 
> In order to keep the previous behavior modify all shadow code TLB
> flushes to also flush the guest linear to physical TLB if the guest is
> HVM. I haven't looked at each specific shadow code TLB flush in order
> to figure out whether it actually requires a guest TLB flush or not,
> so there might be room for improvement in that regard.
> 
> Also perform ASID/VPID flushes when modifying the p2m tables as it's a
> requirement for AMD hardware. Finally keep the flush in
> switch_cr3_cr4, as it's not clear whether code could rely on
> switch_cr3_cr4 also performing a guest linear TLB flush. A following
> patch can remove the ASID/VPID tickle from switch_cr3_cr4 if found to
> not be necessary.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


