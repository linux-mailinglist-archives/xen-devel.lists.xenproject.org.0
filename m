Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3A4D69F9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 23:30:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289272.490786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSnkv-0006LX-Kz; Fri, 11 Mar 2022 22:29:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289272.490786; Fri, 11 Mar 2022 22:29:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSnkv-0006Ii-H9; Fri, 11 Mar 2022 22:29:05 +0000
Received: by outflank-mailman (input) for mailman id 289272;
 Fri, 11 Mar 2022 22:29:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nSnku-0006Ic-Bf
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 22:29:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSnkn-0002Oo-13; Fri, 11 Mar 2022 22:28:57 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSnkm-000476-Ql; Fri, 11 Mar 2022 22:28:56 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=FmTCGu9KQaQL86omL6YiRViAhJTBBT+KMYvX8QRG/YY=; b=Tsvh3PUpHWhWkqGx6R59SiOHoI
	YITvxQF9ey2IQwrOyWY/WVfIopj/flCQdxd9A11EDIopOJrGeqREjdw5Q3WcfZd8w8ggP5DIsVXBn
	EoVDsNVslKHtoiaSNfF5A8gJqElkLNeG5x93eJqD/A7Wo8cnLIH3S8Ir5VtIC7GFgco8=;
Message-ID: <ec6106f4-3a9a-7110-78e3-de3f072576b9@xen.org>
Date: Fri, 11 Mar 2022 22:28:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.2
To: Jan Beulich <jbeulich@suse.com>,
 Marco Solieri <marco.solieri@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 xen-devel@lists.xenproject.org
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-29-marco.solieri@minervasys.tech>
 <07507a77-168a-9387-1f5a-11f00de587f6@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 28/36] xen/arm: introduce xen_map_text_rw
In-Reply-To: <07507a77-168a-9387-1f5a-11f00de587f6@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/03/2022 07:39, Jan Beulich wrote:
> On 04.03.2022 18:46, Marco Solieri wrote:
>> From: Luca Miccio <lucmiccio@gmail.com>
>>
>> Introduce two new arm specific functions to temporarily map/unmap the
>> Xen text read-write (the Xen text is mapped read-only by default by
>> setup_pagetables): xen_map_text_rw and xen_unmap_text_rw.
>>
>> There is only one caller in the alternative framework.
>>
>> The non-colored implementation simply uses __vmap to do the mapping. In
>> other words, there are no changes to the non-colored case.
>>
>> The colored implementation calculates Xen text physical addresses
>> appropriately, according to the coloring configuration.
>>
>> Export vm_alloc because it is needed by the colored implementation of
>> xen_map_text_rw.
> 
> I'm afraid I view vm_alloc() as strictly an internal function to
> vmap.c. Even livepatching infrastructure has got away without making
> it non-static.

I think we can get away from using vmap() here. We were using it because 
Xen text mappings are RX and this is enforced by the processor via 
SCTLR_EL1.WXN.

The bit is cached in the TLB. Back then it wasn't very clear what would 
happen if we clear the bit. Looking at the latest Arm Arm (ARM DDI 
0487H.a D5.10), there is now a section "TLB invalidation and System 
register control fields" providing more details.

Reading the section, it should be safe to temporary disable WXN on every 
CPUs and make Xen text writable.

@Marco, would you be able to have a look?

Cheers,

-- 
Julien Grall

