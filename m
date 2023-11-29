Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6DF07FDE22
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 18:17:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644130.1004734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OBk-0002m4-9z; Wed, 29 Nov 2023 17:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644130.1004734; Wed, 29 Nov 2023 17:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8OBk-0002ju-6j; Wed, 29 Nov 2023 17:17:28 +0000
Received: by outflank-mailman (input) for mailman id 644130;
 Wed, 29 Nov 2023 17:17:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r8OBi-0002jn-Ku
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 17:17:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OBi-0008LN-08; Wed, 29 Nov 2023 17:17:26 +0000
Received: from 82-132-227-204.dab.02.net ([82.132.227.204] helo=[172.20.10.4])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r8OBh-0003Ml-No; Wed, 29 Nov 2023 17:17:25 +0000
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
	bh=/cKwaw2qI5kmqL0z54xgDMX/8DmmQyFuSYSVcPr+yGM=; b=MO935J1XH9xFizFzQTF4EjteS6
	k5sgSrsRxgBjBvrtOuDYo6e6Uf1y75DrinkzxLDlSb14a8TOX0mso+oheCKEf0qJeUjjjUjivp8+R
	aG3gWSeSu9tUOVD0E1cDsuZz/AmCKbWcZScTde9SR/cIfc9TVwoMGuA7VE733YTreHDI=;
Message-ID: <c51e40ed-0cd7-4562-921f-d2dc67b9e4e6@xen.org>
Date: Wed, 29 Nov 2023 18:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Move static event channel feature to a separate
 module
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231129153417.84421-1-michal.orzel@amd.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231129153417.84421-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal

On 29/11/2023 16:34, Michal Orzel wrote:
> Move static event channel feature related code to a separate module
> (static-evtchn.{c,h}) in the spirit of fine granular configuration, so
> that the feature can be disabled if not needed.
> 
> Introduce Kconfig option CONFIG_STATIC_EVTCHN, enabled by default (to
> keep the current behavior) dependent on CONFIG_DOM0LESS. While it could
> be possible to create a loopback connection for dom0 only, this use case
> does not really need this feature and all the docs and commit messages
> refer explicitly to the use in dom0less system.
> 
> The only function visible externally is alloc_static_evtchn(), so move
> the prototype to static-evtchn.h and provide a stub in case a feature
> is disabled. Guard static_evtchn_created in struct dt_device_node and
> move its helpers to static-evtchn.h.

I guess this is a matter of taste, but I think 
dt_device_set_static_evtchn_created() and 
dt_device_static_evtchn_created() are better suited in device_tree.h 
because they are touching a field in the device tree structure.

This would stay consistent with the helper dt_device_set_protected() 
which is only used by the IOMMU code yet is defined in device_tree.h.

That said, I could settle on defining the two helpers in the *.c 
directly because they are not meant to be used outside of a single *.c.

Simarly...

> diff --git a/xen/arch/arm/include/asm/static-evtchn.h b/xen/arch/arm/include/asm/static-evtchn.h
> new file mode 100644
> index 000000000000..472673fae345
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/static-evtchn.h
> @@ -0,0 +1,41 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_STATIC_EVTCHN_H_
> +#define __ASM_STATIC_EVTCHN_H_
> +
> +#ifdef CONFIG_STATIC_EVTCHN
> +
> +#include <xen/device_tree.h>
> +
> +#define STATIC_EVTCHN_NODE_SIZE_CELLS 2

... this used to be defined in domain_build.c. AFAICT the only use is 
now in static-evtchn.c. So why is it defined in the header?

If this is moved in the *.c, then the header static-evtchn.h would only 
contain alloc_static_evtchn(). This could be moved in domain_build.h or 
setup.h (I don't have any preference).

Cheers,

-- 
Julien Grall

