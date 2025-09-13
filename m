Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21960B56279
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 20:10:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123464.1466473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxUgs-0000Q1-PN; Sat, 13 Sep 2025 18:09:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123464.1466473; Sat, 13 Sep 2025 18:09:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxUgs-0000OW-MM; Sat, 13 Sep 2025 18:09:38 +0000
Received: by outflank-mailman (input) for mailman id 1123464;
 Sat, 13 Sep 2025 18:09:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uxUgr-0000OQ-Gs
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 18:09:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxUgq-0089RO-11;
 Sat, 13 Sep 2025 18:09:36 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxUgq-007VHd-0k;
 Sat, 13 Sep 2025 18:09:36 +0000
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
	s=20200302mail; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From;
	bh=F3WkMxo0QuWWcnZ3fFw0tI3XNr0b24EUPuuABcpHFuM=; b=prjZjvsI2g7U2ZvdrrdDWMMIUX
	BFgKJ5HtF+R4RK0qx05cOrCGbT7HSqnmGITHH4DoawQcynmZ9fT1rRNVLv5pdFou31IvSFMecepYm
	f66sThnBCZCX6JAHCv5C501AlznbLLJZe8zVitUYVBu3S272Nw5vm6OwPCCx1c19oQck=;
From: dmukhin@xen.org
Date: Sat, 13 Sep 2025 11:09:35 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v7 01/16] emul/vuart: introduce framework for UART
 emulators
Message-ID: <aMWzXzL3bhSkKNEp@kraken>
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-2-dmukhin@ford.com>
 <CAGeoDV92gvzfF4fEo2KBPhvYba2ULK5yW2LGBBQ2e8z2FU2yyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV92gvzfF4fEo2KBPhvYba2ULK5yW2LGBBQ2e8z2FU2yyQ@mail.gmail.com>

On Wed, Sep 10, 2025 at 10:57:14AM +0300, Mykola Kvach wrote:
> > +int vuart_init(struct domain *d, const struct vuart_info *info)
> > +{
> > +    const struct vuart_emulator *emulator;
> > +    struct vuart *vuart;
> > +    int rc;
> > +
> > +    if ( d->console.vuart )
> > +        return -EBUSY;
> > +
> > +    emulator = vuart_match_by_compatible(d, info->compatible);
> > +    if ( !emulator )
> > +        return -ENODEV;
> > +
> > +    vuart = xzalloc(typeof(*vuart));
> > +    if ( !vuart )
> > +        return -ENOMEM;
> > +
> > +    vuart->info = xvzalloc(typeof(*vuart->info));
> > +    if ( !vuart->info )
> > +    {
> > +        rc = -ENOMEM;
> > +        goto err_out1;
> > +    }
> > +    memcpy(vuart->info, info, sizeof(*info));
> > +
> > +    vuart->vdev = emulator->alloc(d, vuart->info);
> > +    if ( IS_ERR(vuart->vdev) )
> > +    {
> > +        rc = PTR_ERR(vuart->vdev);
> > +        goto err_out2;
> > +    }
> > +
> > +    vuart->emulator = emulator;
> > +    vuart->owner = d;
> > +    vuart->flags |= VUART_CONSOLE_INPUT;
> > +
> > +    d->console.input_allowed = true;
> 
> I'm not a specialist in the area of consoles, but I'm wondering:
> Does the input_allowed flag serve the same purpose as
> VUART_CONSOLE_INPUT? If so, do we need both, or
> could one be removed to simplify the code?

At this point these two flags must be in sync.

`console.input_allowed` is a permission for a domain to take the physical
console input.

`VUART_CONSOLE_INPUT` in `vuart->flags` is a permission for vUART to take
the physical console input.

pvshim does not have vUART, but can have console focus.

And not every vUART can be configured to have a console input (e.g. Arm's
"hwdom vuart").

> > +/*
> > + * Put character to the first emulated UART's FIFO with the physical console
> > + * forwarding enabled.
> > + *
> > + * Must be called under rcu_lock_domain().
> > + */
> > +int vuart_put_rx(struct domain *d, char c)
> > +{
> > +    const struct vuart *vuart = vuart_find_by_flags(d, VUART_CONSOLE_INPUT);
> 
> The call to vuart_find_by_flags() with VUART_CONSOLE_INPUT in
> vuart_put_rx() appears unnecessary. Every vUART console is always
> initialized with VUART_CONSOLE_INPUT, so even if multiple consoles
> exist, the search will always return the first console. It would be
> simpler and clearer to use d->console.vuart directly.

There's no certain order in which multiple vUARTs are initialized, so there
should be something which scans the vUART list and selects the vUART with
console input permission. Follow on Arm's change will add multiple vUARTs
and I decided to generalize logic in this patch, so that there will be 
minimal update in vuart_find_by_flags() only.

> 
> Consider updating the function to remove the flag-based search and add a
> short comment explaining why checking the flag isn’t needed. This will
> help avoid confusion for future maintainers. Alternatively, we could
> pass flags to the init functions instead of hardcoding
> VUART_CONSOLE_INPUT for every console.

That will work, thanks for suggestion.

