Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 021A3ABFA8C
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 18:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992130.1375910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHltX-00042n-Gk; Wed, 21 May 2025 16:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992130.1375910; Wed, 21 May 2025 16:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHltX-00041B-D0; Wed, 21 May 2025 16:02:15 +0000
Received: by outflank-mailman (input) for mailman id 992130;
 Wed, 21 May 2025 16:02:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uHltW-000415-2G
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 16:02:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uHltV-0062Uo-23;
 Wed, 21 May 2025 16:02:13 +0000
Received: from [15.248.2.235] (helo=[10.24.67.107])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uHltV-007167-0h;
 Wed, 21 May 2025 16:02:13 +0000
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
	bh=ofZ0TmNT3UO0L4t2n85+JQXYCvXKSh2/A6Pr2hwNnjw=; b=PghmeuUv6QzJZe1VKeSBeRjxED
	rSqA1muEOe6BCiMXwOp5uQV6ywjrw8bs8sMEnDxNnlot/f/LKE58zx3/KzJIzm1LOgQHWrVkJGh3p
	0hswl2UIwKZPPhKcLPixD3ZhLiGougKl6bUwsOOdZjDy7yo9ukCGsR/nSqMn6ujJJC88=;
Message-ID: <55778d7c-e559-4ae3-a6f6-cb74e6e1d1a8@xen.org>
Date: Wed, 21 May 2025 17:02:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vpci: fix handling of BAR overlaps with non-hole
 regions
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Victor M Lira <victorm.lira@amd.com>
References: <20250516083159.61945-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250516083159.61945-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 16/05/2025 09:31, Roger Pau Monne wrote:
> For once the message printed when a BAR overlaps with a non-hole regions is
> not accurate on x86.  While the BAR won't be mapped by the vPCI logic, it
> is quite likely overlapping with a reserved region in the memory map, and
> already mapped as by default all reserved regions are identity mapped in
> the p2m.  Fix the message so it just warns about the overlap, without
> mentioning that the BAR won't be mapped, as this has caused confusion in
> the past.
> 
> Secondly, when an overlap is detected the BAR 'enabled' field is not set,
> hence other vPCI code that depends on it like vPCI MSI-X handling won't
> function properly, as it sees the BAR as disabled, even when memory
> decoding is enabled for the device and the BAR is likely mapped in the
> p2m.  Change the handling of BARs that overlap non-hole regions to instead
> remove any overlapped regions from the rangeset, so the resulting ranges to
> map just contain the hole regions.  This requires introducing a new
> pci_sanitize_bar_memory() that's implemented per-arch and sanitizes the
> address range to add to the p2m.
> 
> For x86 pci_sanitize_bar_memory() removes any regions present in the host
> memory map, for ARM this is currently left as a dummy handler to not change
> existing behavior.
> 
> Ultimately the above changes should fix the vPCI MSI-X handlers not working
> correctly when the BAR that contains the MSI-X table overlaps with a
> non-hole region, as then the 'enabled' BAR bit won't be set and the MSI-X
> traps won't handle accesses as expected.
> 
> Reported-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Fixes: 53d9133638c3 ('pci: do not disable memory decoding for devices')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Tested-by: Victor M Lira <victorm.lira@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall


