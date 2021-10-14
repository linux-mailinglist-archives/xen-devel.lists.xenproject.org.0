Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2046042D91D
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 14:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.209314.365733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mazbj-0001CW-La; Thu, 14 Oct 2021 12:13:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 209314.365733; Thu, 14 Oct 2021 12:13:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mazbj-0001AB-ID; Thu, 14 Oct 2021 12:13:11 +0000
Received: by outflank-mailman (input) for mailman id 209314;
 Thu, 14 Oct 2021 12:13:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mazbh-0001A5-5v
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 12:13:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mazbf-00083J-Bm; Thu, 14 Oct 2021 12:13:07 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.16.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mazbf-0003FM-4x; Thu, 14 Oct 2021 12:13:07 +0000
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
	bh=6FZd1SsUlYA1pGxoaK+DECh8ID1duzmB2zRLjp+5SBw=; b=ulbELcr3DXKdfDi5p7TgWYTbVj
	3/i8c3qVr+JYR18uvRLxDTFHalRj80DTYjVTXYWIvDamCbC4Kg4DF7qX1e3VGnDwdRRIL5ijPS5Kz
	ZpyYQRkrPmolxqQICk5BWH2iS3XJi3maT1asVgn3QWLsH4lU9KNGTGPRVPlZUwAoPme0=;
Message-ID: <321a7bc4-f39e-bead-3837-c2ec640741b6@xen.org>
Date: Thu, 14 Oct 2021 13:13:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH V7 2/2] libxl/arm: Add handling of extended regions for
 DomU
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1634211645-26912-1-git-send-email-olekstysh@gmail.com>
 <1634211645-26912-3-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1634211645-26912-3-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 14/10/2021 12:40, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> The extended region (safe range) is a region of guest physical
> address space which is unused and could be safely used to create
> grant/foreign mappings instead of wasting real RAM pages from
> the domain memory for establishing these mappings.
> 
> The extended regions are chosen at the domain creation time and
> advertised to it via "reg" property under hypervisor node in
> the guest device-tree. As region 0 is reserved for grant table
> space (always present), the indexes for extended regions are 1...N.
> If extended regions could not be allocated for some reason,
> Xen doesn't fail and behaves as usual, so only inserts region 0.
> 
> Please note the following limitations:
> - The extended region feature is only supported for 64-bit domain
>    currently.
> - The ACPI case is not covered.
> 
> ***
> 
> The algorithm to choose extended regions for non-direct mapped
> DomU is simpler in comparison with the algorithm for direct mapped
> Dom0. We usually have a lot of unused space above 4GB, and might
> have some unused space below 4GB (depends on guest memory size).
> Try to allocate separate 2MB-aligned extended regions from the first
> (below 4GB) and second (above 4GB) RAM banks taking into the account
> the maximum supported guest physical address space size and the amount
> of memory assigned to the guest. The minimum size of extended region
> the same as for Dom0 (64MB).
> 
> Please note, we introduce fdt_property_reg_placeholder helper which
> purpose is to create N ranges that are zeroed. The interesting fact
> is that libfdt already has fdt_property_placeholder(). But this was
> introduced only in 2017, so there is a risk that some distros may not
> ship the last libfdt version. This is why we implement our own light
> variant for now.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

