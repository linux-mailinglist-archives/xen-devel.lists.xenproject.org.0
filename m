Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1454EFA30
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 20:54:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297559.506961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naMPB-0008Qj-Ut; Fri, 01 Apr 2022 18:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297559.506961; Fri, 01 Apr 2022 18:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naMPB-0008Ot-RQ; Fri, 01 Apr 2022 18:53:53 +0000
Received: by outflank-mailman (input) for mailman id 297559;
 Fri, 01 Apr 2022 18:53:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naMP9-0008On-Tg
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 18:53:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naMP6-0003iV-DX; Fri, 01 Apr 2022 18:53:48 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naMP6-0004sa-72; Fri, 01 Apr 2022 18:53:48 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=43AGt2kDTptRp6gsxl5KdUrnVUYUs2dh2RGyik/bBK0=; b=QOnaMZX/13Q9Nq6ffwSsRTaiaE
	YjhjPDewYXBkDYBf/WvBdsCcIk/WWlVmD5hhFMGnCbxEXtkas0XpDAMcDDco6+57pneR2MG9hdvT9
	p9728MjrCvmnjfQhDr26PKZlx0BGpAW09jKWxH+Kq4pCs5jEqAp+fnR6ZpUmC49ERb34=;
Message-ID: <6ae9a1f9-4167-46d2-df9b-9d7f626fa247@xen.org>
Date: Fri, 1 Apr 2022 19:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static
 allocation
To: Penny Zheng <Penny.Zheng@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Wei Chen <Wei.Chen@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
 <20220330093617.3870589-4-Penny.Zheng@arm.com>
 <31c1ae2d-a4d6-5445-e819-5df5a0984cdd@suse.com>
 <DU2PR08MB73251B78F8EB19E334A70876F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <eba664e6-4146-426b-5119-59fe02a96bb5@suse.com>
 <DU2PR08MB7325D94A0BFFC2A3BB0AFF08F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB7325D94A0BFFC2A3BB0AFF08F7E19@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 31/03/2022 11:30, Penny Zheng wrote:
> Another reason I want to keep page allocated is that if putting pages in
> resv_page_list upon dropping the last ref, we need to do a lot things on
> pages to totally let it free, like set its owner to NULL, changing page state
> from in_use to free, etc.
This is not only about optimization here. Bad things can happen if you 
let a page in state free that is not meant to be used by the buddy 
allocator (e.g. it was reserved for static memory).

I discovered it earlier this year when trying to optimize 
init_heap_pages() for Live-Update. It was quite hard to debug because 
the corruption very rarely happened. So let me explain it before you 
face the same issue :).

free_heap_pages() will try to merge the about-to-be-freed chunk with the 
predecessor and/or successor. To know if the page can be merged, the 
algorithm is looking at whether the chunk is suitably aligned (e.g. same 
order) and if the page is in state free.

AFAICT, the pages belonging to the buddy allocator could be right next 
to region reserved memory. So there is a very slim chance that 
free_heap_pages() may decide to merge a chunk from the static region 
with the about-to-be-free chunk. Nothing very good will ensue.

Technically, this is already a bug in the already merged implementation 
of the static memory allocator.

I can see two ways to fix it:
   1) Update free_heap_pages() to check whether the page has 
PGC_reserved set.
   2) Use a different state for pages used by the static allocator.

So far my preference is leaning towards 1. But I would like to hear 
other opinions.

Cheers,

-- 
Julien Grall

