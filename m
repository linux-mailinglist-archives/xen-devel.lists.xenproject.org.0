Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F5D5B1B81
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 13:33:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403179.645194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFmQ-0007vD-Ll; Thu, 08 Sep 2022 11:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403179.645194; Thu, 08 Sep 2022 11:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFmQ-0007st-J6; Thu, 08 Sep 2022 11:33:10 +0000
Received: by outflank-mailman (input) for mailman id 403179;
 Thu, 08 Sep 2022 11:33:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWFmP-0007sf-CM
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 11:33:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWFmP-0006Bh-33; Thu, 08 Sep 2022 11:33:09 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.18.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWFmO-0005Q5-TW; Thu, 08 Sep 2022 11:33:09 +0000
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
	bh=5yTKlD7qAkOEUZeNCZJ/+rQk35l+cF0IpTEEdZXbpKA=; b=j2v0uYGhCfgHcgxVW3UtwhJfyt
	9TSsZvzV/w4ieyNKgAd9e4G89AcSY/+z9TaEx4UIJDI+/J+vKHEX3BQIO5FOT0omUc8g8nCyKPQ8e
	sjv/7Pc3fm5u9zTUCF75mqNE+vsnW7f1zeCl96iO5yqfCa0L6RF4lfoMPrDNHztx7Uxs=;
Message-ID: <38ab7898-57ce-43be-7d41-13b75fc17f8e@xen.org>
Date: Thu, 8 Sep 2022 12:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v6 0/4] Introduce static heap
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220908110910.17108-1-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220908110910.17108-1-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 08/09/2022 12:09, Henry Wang wrote:
> The static heap, or statically configured heap, refers to parts
> of RAM reserved in the beginning for heap. Like the static memory
> allocation, such static heap regions are reserved by configuration
> in the device tree using physical address ranges.
> 
> This feature is useful to run Xen on Arm MPU systems, where only a
> finite number of memory protection regions are available. The limited
> number of protection regions places requirement on planning the use
> of MPU protection regions and one or more MPU protection regions needs
> to be reserved only for heap.
> 
> The first patch enhances the error handling in processing the dts
> chosen node. The second patch introduces the static heap and the
> device tree parsing code. The third patch renames xenheap_* to
> directmap_* for better readablity. The fourth patch adds the
> implementation of the static heap pages handling in boot and heap
> allocator for Arm.
> 
> Changes from v5 to v6:
> - Refine doc.
> - Drop duplicated code.
> - Add Julien's Reviewed-by.
> 
> Henry Wang (4):
>    xen/arm: bootfdt: Make process_chosen_node() return int
>    docs, xen/arm: Introduce static heap memory
>    xen/arm: mm: Rename xenheap_* variable to directmap_*
>    xen/arm: Handle static heap pages in boot and heap allocator

I have now committed the series. This required a small tweak in 
booting.txt because I merged it after Rahul event channel's series which 
also modifies booting.txt.

Cheers,

-- 
Julien Grall

