Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0967C31FB11
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 15:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86900.163437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD6wE-0003B2-7w; Fri, 19 Feb 2021 14:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86900.163437; Fri, 19 Feb 2021 14:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD6wE-0003Ad-4k; Fri, 19 Feb 2021 14:39:22 +0000
Received: by outflank-mailman (input) for mailman id 86900;
 Fri, 19 Feb 2021 14:39:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOKe=HV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lD6wC-0003AY-2M
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 14:39:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 955d387b-96eb-448a-900d-52fc9ab7259e;
 Fri, 19 Feb 2021 14:39:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2AFBAB10B;
 Fri, 19 Feb 2021 14:39:17 +0000 (UTC)
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
X-Inumbo-ID: 955d387b-96eb-448a-900d-52fc9ab7259e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613745557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lBZOODJxUXudV3lFWoXDl/wMzTDy0bjvGE3IRHW8zu4=;
	b=TtExeoZCT8EEi4bDTgzP87iroJMMZZZH/l2BxWK7Cj2n5gT882IY2JnEVE4fuYvI+Rj4L9
	Mq09qQ6eD55C1RJ6UpfNJLjwtJvg69lW0+Jq94TRn5uhVMdf83ua925nJVU3YetKvkEJ4M
	PcWIZcFR2rjvFvsrdSo3/yuQBdBL81U=
Subject: Re: [PATCH] x86/irq: simplify loop in unmap_domain_pirq
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210210092211.53359-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f80e0026-9a0b-d25d-a0a4-81774da8cba8@suse.com>
Date: Fri, 19 Feb 2021 15:39:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210210092211.53359-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.02.2021 10:22, Roger Pau Monne wrote:
> The for loop in unmap_domain_pirq is unnecessary complicated, with
> several places where the index is incremented, and also different
> exit conditions spread between the loop body.
> 
> Simplify it by looping over each possible PIRQ using the for loop
> syntax, and remove all possible in-loop exit points.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Quite a bit better indeed. Just one nit below (can be taken care of
while committing, once the tree will re-open).

> @@ -2356,11 +2355,23 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>      if ( msi_desc != NULL )
>          pci_disable_msi(msi_desc);
>  
> -    spin_lock_irqsave(&desc->lock, flags);
> -
> -    for ( i = 0; ; )
> +    for ( i = 0; i < nr; i++, info = pirq_info(d, pirq + i) )
>      {
> +        unsigned long flags;
> +
> +        if ( !info || info->arch.irq <= 0 )
> +        {
> +            printk(XENLOG_G_ERR "dom%d: MSI pirq %d not mapped\n",
> +                   d->domain_id, pirq + i);

%pd please as you touch/move this anyway.

> @@ -2378,45 +2389,6 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>              desc->msi_desc = NULL;
>          }
>  
> -        if ( ++i == nr )
> -            break;
> -
> -        spin_unlock_irqrestore(&desc->lock, flags);
> -
> -        if ( !forced_unbind )
> -           cleanup_domain_irq_pirq(d, irq, info);
> -
> -        rc = irq_deny_access(d, irq);
> -        if ( rc )
> -        {
> -            printk(XENLOG_G_ERR
> -                   "dom%d: could not deny access to IRQ%d (pirq %d)\n",
> -                   d->domain_id, irq, pirq + i);

Looks like the pirq number logged here also was off by one, which
the re-arrangement takes care of.

Jan

