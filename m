Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6944141A9AE
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197666.350843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7XJ-00019i-7N; Tue, 28 Sep 2021 07:28:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197666.350843; Tue, 28 Sep 2021 07:28:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7XJ-00017b-3i; Tue, 28 Sep 2021 07:28:21 +0000
Received: by outflank-mailman (input) for mailman id 197666;
 Tue, 28 Sep 2021 07:28:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s6b1=OS=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mV7XH-00017V-4e
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:28:19 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id a697ae46-202d-11ec-bc6f-12813bfff9fa;
 Tue, 28 Sep 2021 07:28:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0813D6E;
 Tue, 28 Sep 2021 00:28:17 -0700 (PDT)
Received: from [10.57.20.114] (unknown [10.57.20.114])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 264E33F7B4;
 Tue, 28 Sep 2021 00:28:14 -0700 (PDT)
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
X-Inumbo-ID: a697ae46-202d-11ec-bc6f-12813bfff9fa
Subject: Re: [PATCH V3 3/3] libxl/arm: Add handling of extended regions for
 DomU
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1632437334-12015-1-git-send-email-olekstysh@gmail.com>
 <1632437334-12015-4-git-send-email-olekstysh@gmail.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <bcb45e81-6df6-4aa9-e190-d69bff040bba@arm.com>
Date: Tue, 28 Sep 2021 09:28:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1632437334-12015-4-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 24.09.2021 00:48, Oleksandr Tyshchenko wrote:
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
>   currently.
> - The ACPI case is not covered.
> 
> ***
> 
> The algorithm to choose extended regions for non-direct mapped
> DomU is simpler in comparison with the algorithm for direct mapped
> Dom0. As we have a lot of unused space above 4GB, provide single
> 2MB-aligned region from the second RAM bank taking into the account
> the maximum supported guest address space size and the amount of
> memory assigned to the guest. The maximum size of the region is 128GB.
> The minimum size is 64MB.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> ---
> Changes RFC -> V2:
>    - update patch description
>    - drop uneeded "extended-region" DT property
>    - clear reg array in finalise_ext_region() and add a TODO
> 
> Changes V2 -> V3:
>    - update patch description, comments in code
>    - only pick up regions with size >= 64MB
>    - move the region calculation to make_hypervisor_node() and drop
>      finalise_ext_region()
>    - extend the list of arguments for make_hypervisor_node()
>    - do not show warning for 32-bit domain
>    - change the region alignment from 1GB to 2MB
>    - move EXT_REGION_SIZE to public/arch-arm.h
> ---
>  tools/libs/light/libxl_arm.c  | 70 +++++++++++++++++++++++++++++++++++++++----
>  xen/include/public/arch-arm.h |  3 ++
>  2 files changed, 68 insertions(+), 5 deletions(-)
> 
Reviewed-by: Michal Orzel <michal.orzel@arm.com>
Tested-by: Michal Orzel <michal.orzel@arm.com>

Cheers

