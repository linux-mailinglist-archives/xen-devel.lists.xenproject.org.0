Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 461482F9BDE
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 10:27:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69493.124394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QoJ-0005R8-T3; Mon, 18 Jan 2021 09:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69493.124394; Mon, 18 Jan 2021 09:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1QoJ-0005Qj-PK; Mon, 18 Jan 2021 09:26:55 +0000
Received: by outflank-mailman (input) for mailman id 69493;
 Mon, 18 Jan 2021 09:26:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=d36Q=GV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l1QoH-0005Qb-Lj
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 09:26:53 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7efda1a-a3b9-46c4-9175-bcaeb9c17e8c;
 Mon, 18 Jan 2021 09:26:52 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CC0DCAB7F;
 Mon, 18 Jan 2021 09:26:51 +0000 (UTC)
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
X-Inumbo-ID: d7efda1a-a3b9-46c4-9175-bcaeb9c17e8c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610962011; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t2o2qlb/LWJ8B5Q3NBvcEarizjAoscEdU3Yf/uk9ycE=;
	b=QhJ3gFL6+Y1NglgFTZu1m888yDwCdHYOYTQNWjkyPZSNizr5znl8HpCIpQNtvHw+nalSRC
	K2LUn49/GfwhgMTCINWbvK+eoO4wTuS8FAg92D99pQnemA89YVp3b3BDo9zXSv9Nmqlb0k
	qvc79RtioO2vetltwQAhoD9VXUAnQSA=
Subject: Re: [PATCH] xen/arm: livepatch: Include xen/mm.h rather than asm/mm.h
To: Julien Grall <julien@xen.org>
Cc: andrew.cooper3@citrix.com, Julien Grall <jgrall@amazon.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20210115192947.6499-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e5fb6b33-6656-52ee-ee66-04e2f73ab0a6@suse.com>
Date: Mon, 18 Jan 2021 10:26:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115192947.6499-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.01.2021 20:29, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Livepatch fails to build on Arm after commit ced9795c6cb4 "mm: split
> out mfn_t / gfn_t / pfn_t definitions and helpers":
> 
> In file included from livepatch.c:13:0:
> /oss/xen/xen/include/asm/mm.h:32:28: error: field ‘list’ has incomplete type
>      struct page_list_entry list;
>                             ^~~~
> /oss/xen/xen/include/asm/mm.h:53:43: error: ‘MAX_ORDER’ undeclared here (not in a function); did you mean ‘PFN_ORDER’?
>                  unsigned long first_dirty:MAX_ORDER + 1;
>                                            ^~~~~~~~~
>                                            PFN_ORDER
> /oss/xen/xen/include/asm/mm.h:53:31: error: bit-field ‘first_dirty’ width not an integer constant
>                  unsigned long first_dirty:MAX_ORDER + 1;
>                                ^~~~~~~~~~~
> 
> This is happening because asm/mm.h is included directly by livepatch.c.
> Yet it depends on xen/mm.h to be included first so MAX_ORDER is defined.
> 
> Resolve the build failure by including xen/mm.h rather than asm/mm.h.
> 
> Fixes: ced9795c6cb4 ("mm: split out mfn_t / gfn_t / pfn_t definitions and helpers")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Thanks for the quick fix, and I'm sorry for the breakage. I'll
try to make sure I'll also check building with livepatch enabled
down the road.

Jan

