Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD667796E8
	for <lists+xen-devel@lfdr.de>; Fri, 11 Aug 2023 20:15:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582608.912457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUWeW-00020q-Jn; Fri, 11 Aug 2023 18:14:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582608.912457; Fri, 11 Aug 2023 18:14:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUWeW-0001xw-Gf; Fri, 11 Aug 2023 18:14:24 +0000
Received: by outflank-mailman (input) for mailman id 582608;
 Fri, 11 Aug 2023 18:14:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qUWeV-0001xq-Ig
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 18:14:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUWeV-00023h-2x; Fri, 11 Aug 2023 18:14:23 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.207.66]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qUWeU-00024h-SQ; Fri, 11 Aug 2023 18:14:23 +0000
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
	bh=THcUlor1x4efb0tQrsXF3FRMU2twhbO/VW7ysnKjILk=; b=jokulA/GFMpxjYd01FhldTUETm
	V7kHYtTaSeyoQu2K9mdYap56AgQIE8Kq5w9MsIRdCjfPOumYVajVIuJIMz6QElwp6KI+3lak1Nm39
	Gnon0tX9gdVTHkFD6cR7cWegbWogRHVVepy3ceUP/PmXWYABbbf6GxwhTR9LDsGsUneY=;
Message-ID: <27ef6978-ce23-45ba-b136-4ad9c8913751@xen.org>
Date: Fri, 11 Aug 2023 19:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] xen/arm: Move static memory build code in separate
 modules
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, rahul.singh@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
 <20230808080010.3858575-5-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230808080010.3858575-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On IRC, you suggest to skip the review for the patches moving out some 
code. However, I still have one remark.

On 08/08/2023 09:00, Luca Fancellu wrote:
> Move static memory and static shared memory code in separate modules
> so that they are included only when the corresponding feature is
> enabled, doing that we modularise the features and we remove some
> ifdefs from the code to improve readability.
> 
> Move process_shm_node function from bootfdt module and make it
> externally visible.
> 
> The visibility of the functions allocate_static_memory and
> assign_static_memory_11 is changed during the move from the
> dom0less-build module to the static-memory module, now they are
> externally visible.
> 
> A static inline helper called process_shm_chosen is introduced, it
> will call the process_shm function for the '/chosen' node, and will
> be used by the funciton construct_dom0 instead of using directly
> process_shm, allowing some #ifdef to be removed.
> 
> No functional changes are intended.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/Makefile                     |   2 +
>   xen/arch/arm/bootfdt.c                    | 161 +-----
>   xen/arch/arm/dom0less-build.c             | 646 +---------------------

This file was created in the previous patch but now you are moving out 
the code again. Please try to move the code only once within the series 
to ease the review.

Cheers,

-- 
Julien Grall

