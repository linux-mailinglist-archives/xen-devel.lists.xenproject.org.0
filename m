Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0BD4BFAE5
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 15:27:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276806.473104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMW7Z-0005kh-SE; Tue, 22 Feb 2022 14:26:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276806.473104; Tue, 22 Feb 2022 14:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMW7Z-0005iu-PI; Tue, 22 Feb 2022 14:26:29 +0000
Received: by outflank-mailman (input) for mailman id 276806;
 Tue, 22 Feb 2022 14:26:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IN1Y=TF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nMW7Y-0005il-FD
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 14:26:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6b3b78ab-93eb-11ec-8539-5f4723681683;
 Tue, 22 Feb 2022 15:26:27 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59839106F;
 Tue, 22 Feb 2022 06:26:26 -0800 (PST)
Received: from [10.57.3.116] (unknown [10.57.3.116])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4046E3F5A1;
 Tue, 22 Feb 2022 06:26:25 -0800 (PST)
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
X-Inumbo-ID: 6b3b78ab-93eb-11ec-8539-5f4723681683
Subject: Re: [PATCH v3 02/19] xen/arm: lpae: Use the generic helpers to
 defined the Xen PT helpers
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-3-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <d7f1bf5e-db03-7ca2-41c3-9738fe4f2bce@arm.com>
Date: Tue, 22 Feb 2022 15:26:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20220221102218.33785-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Julien,

On 21.02.2022 11:22, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Currently, Xen PT helpers are only working with 4KB page granularity
> and open-code the generic helpers. To allow more flexibility, we can
> re-use the generic helpers and pass Xen's page granularity
> (PAGE_SHIFT).
> 
> As Xen PT helpers are used in both C and assembly, we need to move
> the generic helpers definition outside of the !__ASSEMBLY__ section.
> 
> Take the opportunity to prefix LPAE_ENTRIES, LPAE_ENTRIES and
> LPAE_ENTRIES_MASK with XEN_PT_.
> 
> Note the aliases for each level are still kept for the time being so we
> can avoid a massive patch to change all the callers.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ---
>     Changes in v3:
>       - Prefix the new define with XEN_PT_
> 
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/arm32/head.S       | 14 +++----
>  xen/arch/arm/arm64/head.S       | 14 +++----
>  xen/arch/arm/include/asm/lpae.h | 73 ++++++++++++++++++---------------
>  xen/arch/arm/mm.c               | 33 ++++++++-------
>  xen/arch/arm/p2m.c              | 13 +++---
>  5 files changed, 80 insertions(+), 67 deletions(-)
> 

Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Cheers,
Michal

