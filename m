Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 534E155B7FB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 08:45:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356237.584335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iUu-00071m-3u; Mon, 27 Jun 2022 06:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356237.584335; Mon, 27 Jun 2022 06:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5iUu-0006zE-10; Mon, 27 Jun 2022 06:45:24 +0000
Received: by outflank-mailman (input) for mailman id 356237;
 Mon, 27 Jun 2022 06:45:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vXPS=XC=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1o5iUs-0006z8-Dr
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 06:45:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b6969071-f5e4-11ec-bd2d-47488cf2e6aa;
 Mon, 27 Jun 2022 08:45:20 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AD701758;
 Sun, 26 Jun 2022 23:45:20 -0700 (PDT)
Received: from [10.57.42.186] (unknown [10.57.42.186])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C279A3F5A1;
 Sun, 26 Jun 2022 23:45:18 -0700 (PDT)
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
X-Inumbo-ID: b6969071-f5e4-11ec-bd2d-47488cf2e6aa
Message-ID: <1dad1b91-beb2-e09b-1417-c59f059765c2@arm.com>
Date: Mon, 27 Jun 2022 08:45:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/7] xen/arm: mm: Add more ASSERT() in {destroy,
 modify}_xen_mappings()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-5-julien@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <20220624091146.35716-5-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Julien,

On 24.06.2022 11:11, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Both destroy_xen_mappings() and modify_xen_mappings() will take in
> parameter a range [start, end[. Both end should be page aligned.
> 
> Add extra ASSERT() to ensure start and end are page aligned. Take the
> opportunity to rename 'v' to 's' to be consistent with the other helper.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>  xen/arch/arm/mm.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 0607c65f95cd..20733afebce4 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1371,14 +1371,18 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>      return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
>  }
>  
> -int destroy_xen_mappings(unsigned long v, unsigned long e)
> +int destroy_xen_mappings(unsigned long s, unsigned long e)
I think the prototype wants to be updated as well in include/xen/mm.h.
x86 mm.c already uses s instead of v so it is a good opportunity to fix the prototype.

Cheers,
Michal

