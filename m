Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE08322AD9D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 13:23:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyZK0-0004UE-Tm; Thu, 23 Jul 2020 11:23:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jyZJz-0004Sx-3A
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 11:23:31 +0000
X-Inumbo-ID: eb0046b6-ccd6-11ea-a27f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb0046b6-ccd6-11ea-a27f-12813bfff9fa;
 Thu, 23 Jul 2020 11:23:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2CCDDABCF;
 Thu, 23 Jul 2020 11:23:30 +0000 (UTC)
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200722165300.22655-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
Date: Thu, 23 Jul 2020 13:23:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722165300.22655-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.07.2020 18:53, Julien Grall wrote:
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
>  
>      for ( ; ; )
>      {
> -        int irq = pirq->arch.irq;
> +        int irq = read_atomic(&pirq->arch.irq);

There we go - I'd be fine this way, but I'm pretty sure Andrew
would want this to be ACCESS_ONCE(). So I guess now is the time
to settle which one to prefer in new code (or which criteria
there are to prefer one over the other).

And this is of course besides the fact that I think we have many
more instances where guaranteeing a single access would be
needed, if we're afraid of the described permitted compiler
behavior. Which then makes me wonder if this is really something
we should fix one by one, rather than by at least larger scope
audits (in order to not suggest "throughout the code base").

As a minor remark, unless you've observed problematic behavior,
would you mind adding "potential" or "theoretical" to the title?

Jan

