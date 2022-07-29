Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 981505856BF
	for <lists+xen-devel@lfdr.de>; Sat, 30 Jul 2022 00:05:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377889.611189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHY64-0004Fc-Py; Fri, 29 Jul 2022 22:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377889.611189; Fri, 29 Jul 2022 22:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHY64-0004DR-Mt; Fri, 29 Jul 2022 22:04:40 +0000
Received: by outflank-mailman (input) for mailman id 377889;
 Fri, 29 Jul 2022 22:04:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oHY63-0004DL-AN
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 22:04:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHY62-0004J4-Kr; Fri, 29 Jul 2022 22:04:38 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oHY62-00058i-Ej; Fri, 29 Jul 2022 22:04:38 +0000
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
	bh=WNivob6JPiZKteOJLG1omPhtziu4YGyRpbIwIMHuJlQ=; b=32KQ5Fre7cIDCtgvUMI/4kn77Q
	TtskerEz8ZL5C+1GhML79StfjuvRKuys3xe7ZWNTS4t8EcmbFRpuLkCmbB8Pz9fQq9X3SpPLZL2FV
	ADl1duTNhc7TaNw+HGB4FqUVON3iZwmU0E0aURYmn0I6AULEKYo7Vmbgb/gOs4EtbfMw=;
Message-ID: <921d6948-c379-bba4-444e-c7b1f35926bc@xen.org>
Date: Fri, 29 Jul 2022 23:04:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 0/5] xen/arm: mm: Bunch of clean-ups
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20220720184459.51582-1-julien@xen.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220720184459.51582-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/07/2022 19:44, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Hi all,
> 
> This series is a collection of patches to clean-up the MM subsystem
> I have done in preparation for the next revision of "xen/arm: Don't
> switch TTBR while the MMU is on" [1].
> 
> Cheers,
> 
> [1] https://lore.kernel.org/all/20220309112048.17377-1-julien@xen.org/
> 
> Julien Grall (5):
>    xen/arm: Remove most of the *_VIRT_END defines
>    xen/arm32: mm: Consolidate the domheap mappings initialization
>    xen: Rename CONFIG_DOMAIN_PAGE to CONFIG_ARCH_MAP_DOMAIN_PAGE and...
>    xen/arm: mm: Move domain_{,un}map_* helpers in a separate file
>    xen/arm: mm: Reduce the area that xen_second covers

I have committed this series.

Cheers,

-- 
Julien Grall

