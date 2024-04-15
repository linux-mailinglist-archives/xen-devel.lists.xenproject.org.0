Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA67D8A5A0B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Apr 2024 20:42:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706447.1103591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwRGc-0000Hf-BI; Mon, 15 Apr 2024 18:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706447.1103591; Mon, 15 Apr 2024 18:41:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwRGc-0000F1-88; Mon, 15 Apr 2024 18:41:22 +0000
Received: by outflank-mailman (input) for mailman id 706447;
 Mon, 15 Apr 2024 18:41:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rwRGb-0000Eu-3U
 for xen-devel@lists.xenproject.org; Mon, 15 Apr 2024 18:41:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwRGa-00037z-R6; Mon, 15 Apr 2024 18:41:20 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rwRGa-000765-Jg; Mon, 15 Apr 2024 18:41:20 +0000
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
	bh=NCz1C1pHO0cfKbu0iKdelHTspWoc8/NEQhmqUiod8TA=; b=GS93VtD8O3YqMR8+ekWSOSsFBb
	MmR88pXarLPJ3+VzPyBF0bQj/O6tJ2+agE419uHzTZ+wrUc1zY94Z++qvLmc0Ay+Ol8QSXSYfRAqD
	9pL4xhTKSKFaG3QPwnVyEyBmEORy40ZS07DCUWEfQ80RUAr9KdgiCOgaqAC/Mg0IWw4o=;
Message-ID: <7b09184a-111d-4a38-baec-53f01ec6ed03@xen.org>
Date: Mon, 15 Apr 2024 19:41:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] xen/arm: List static shared memory regions as
 /memory nodes
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240409114543.3332150-1-luca.fancellu@arm.com>
 <20240409114543.3332150-14-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240409114543.3332150-14-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 09/04/2024 12:45, Luca Fancellu wrote:
> Currently Xen is not exporting the static shared memory regions
> to the device tree as /memory node, this commit is fixing this
> issue.
> 
> The static shared memory banks can be part of the memory range
> available for the domain, so if they are overlapping with the
> normal memory banks, they need to be merged together in order
> to produce a /memory node with non overlapping ranges in 'reg'.

Before reviewing the code in more details, I would like to understand a 
bit more the use case and whether it should be valid.

 From my understanding, the case you are trying to prevent is the 
following setup:
   1. The Guest Physical region 0x0000 to 0x8000 is used for RAM
   2. The Guest Physical region 0x0000 to 0x4000 is used for static memory

The underlying Host Physical regions may be different. Xen doesn't 
guarantee in which order the regions will be mapped, So whether the 
overlapped region will point to the memory or the shared region is 
unknown (we don't guarantee the order of the mapping). So nothing good 
will happen to the guest.

Did I understand correctly? If so, shouldn't this be a configuration we 
should forbid?

Cheers,

-- 
Julien Grall

