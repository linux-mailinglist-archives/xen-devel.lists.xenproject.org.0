Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE2CB484E4
	for <lists+xen-devel@lfdr.de>; Mon,  8 Sep 2025 09:16:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1114593.1461435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvW6w-00087A-LP; Mon, 08 Sep 2025 07:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1114593.1461435; Mon, 08 Sep 2025 07:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uvW6w-00085Y-IS; Mon, 08 Sep 2025 07:16:22 +0000
Received: by outflank-mailman (input) for mailman id 1114593;
 Mon, 08 Sep 2025 07:16:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uvW6v-00085S-Ey
 for xen-devel@lists.xenproject.org; Mon, 08 Sep 2025 07:16:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvW6t-00D9Ti-2d;
 Mon, 08 Sep 2025 07:16:20 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uvW6t-003JRU-2L;
 Mon, 08 Sep 2025 07:16:19 +0000
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
	bh=R4a1KEWzdUb7m/MZk5nH0esNuTV5ImuyIj7AA2rSAYY=; b=u6vv2y4qqMg/K8rdRt0Zrjowzp
	9IKmj0QzLYFjm08w5lWXfDvNxfrGc5JEUPakGbYPhX+a3D5taSshcXiQO8W+rVyVvG9cBIJiTciC5
	qXxtudCFMbvUucr0UgA2dp9s+HnQhVhXkFYsLz2XfUrkU+DSO2j4IfJuar8iYJ/fFbFQ=;
From: dmukhin@xen.org
Date: Mon, 8 Sep 2025 00:16:18 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v6 01/15] emul/vuart: introduce framework for UART
 emulators
Message-ID: <aL6CwuSme+yyOY0e@kraken>
References: <20250905232715.440758-1-dmukhin@ford.com>
 <20250905232715.440758-2-dmukhin@ford.com>
 <CAGeoDV8T8UN7uNXZ9Co0he=B1Bt_gXBWAFDPtiE0jvCGb=MA-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGeoDV8T8UN7uNXZ9Co0he=B1Bt_gXBWAFDPtiE0jvCGb=MA-g@mail.gmail.com>

On Sat, Sep 06, 2025 at 12:43:01PM +0300, Mykola Kvach wrote:
> Hi Denis,
> 
> On Sat, Sep 6, 2025 at 2:27 AM <dmukhin@xen.org> wrote:
[..]
> > +
> > +const static struct vuart *
> > +vuart_find_by_console_permission(const struct domain *d)
> 
> Other functions that search for a console (e.g., by compatible string or IO
> range) take an argument to specify what to search by. Here,
> vuart_find_by_console_permission takes no argument and just checks a single
> flag. It might be clearer to either add a flags argument to make it general,
> or rename the function to reflect that it checks only this one permission flag.

Agreed, will update.
Thanks for the suggestion.

> 
> > +{
> > +    const struct vuart *vuart = d->console.vuart;
> > +
> > +    if ( !vuart || !vuart->emulator || !vuart->emulator->put_rx ||
> 
> Looking at vuart_init, vuart->emulator is always set when vuart is valid.
> So the vuart->emulator check seems redundant.

Ack.

> 
> If it is truly needed, the same check should also appear in
> vuart_dump_state and vuart_deinit. Otherwise, for consistency we
> could safely assume vuart->emulator is non-NULL after vuart_init.

Agreed, will update.

> 
> > +         !(vuart->flags & VUART_CONSOLE_INPUT))
> > +        return NULL;
> > +
> > +    return vuart;
> > +}
> > +
> > +struct vuart *vuart_find_by_io_range(struct domain *d, unsigned long addr,
> > +                                     unsigned long size)
> > +{
> > +    struct vuart *vuart = d->console.vuart;
> > +
> > +    if ( !vuart || !vuart->info )
> 
> Is it possible to have a valid vuart pointer without a valid info pointer?

Yes, the vuart->info check is redundant, will drop.

> 
> > +        return NULL;
> > +
> > +    if ( addr >= vuart->info->base_addr &&
> > +         addr + size - 1 <= vuart->info->base_addr + vuart->info->size - 1 )
> > +        return vuart;
> > +
> > +    return NULL;
> > +}
> > +
> > +int vuart_init(struct domain *d, struct vuart_info *info)
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
> > +    vuart->info = xvzalloc(typeof(*info));
> > +    if ( !vuart->info )
> > +    {
> > +        rc = -ENOMEM;
> > +        goto err_out;
> > +    }
> > +    memcpy(vuart->info, info, sizeof(*info));
> > +
> > +    vuart->vdev = emulator->alloc(d, vuart->info);
> > +    if ( IS_ERR(vuart->vdev) )
> > +    {
> > +        rc = PTR_ERR(vuart->vdev);
> > +        goto err_out;
> > +    }
> > +
> > +    vuart->emulator = emulator;
> > +    vuart->owner = d;
> > +    vuart->flags |= VUART_CONSOLE_INPUT;
> > +
> > +    d->console.input_allowed = true;
> > +    d->console.vuart = vuart;
> > +
> > +    return 0;
> > +
> > + err_out:
> > +    if ( vuart )
> 
> As far as I can see, it isn’t possible to reach this point when vuart
> is NULL. The err_out label is only jumped to after vuart has been
> successfully allocated, so the check if (vuart) is redundant.

Right, thanks.

> 
> > +        xvfree(vuart->info);
> > +    xvfree(vuart);
> > +
> > +    return rc;
> > +}
> > +
> > +/*
> > + * Release any resources taken by UART emulators.
> > + *
> > + * NB: no flags are cleared, since currently exit() is called only during
> > + * domain destroy.
> > + */
> > +void vuart_deinit(struct domain *d)
> > +{
> > +    struct vuart *vuart = d->console.vuart;
> > +
> > +    if ( vuart )
> > +    {
> > +        vuart->emulator->free(vuart->vdev);
> > +        xvfree(vuart->info);
> > +    }
> > +    XVFREE(d->console.vuart);
> > +}
> > +
> > +void vuart_dump_state(const struct domain *d)
> > +{
> > +    struct vuart *vuart = d->console.vuart;
> > +
> > +    if ( vuart )
> > +        vuart->emulator->dump_state(vuart->vdev);
> > +}
> > +
> > +/*
> > + * Put character to the *first* suitable emulated UART's FIFO.
> > + */
> 
> This comment could be a single line since it doesn’t exceed 80 characters.

I will update the comment.

> 
> > +int vuart_put_rx(struct domain *d, char c)
> > +{
> > +    const struct vuart *vuart = vuart_find_by_console_permission(d);
> 
> If vuart_deinit has already been called, is it possible that vuart
> points to freed memory here or in other places?
> 
> Should we add reference counting or locks to protect against such
> use-after-free, or are we relying on higher-level mechanisms to
> guarantee that these structs aren’t freed while vuart is accessed?

That should be covered with rcu_{un,}lock_domain() calls.

But a dedicated vUART lock will be needed in the future series (vpl011 and
hwdom vuart plumbing into the new framework).

> 
> Should we also check whether the domain is currently being
> destroyed and avoid putting new characters into the emulated UART
> in that case?

There's only one callsite currently (in the console driver) and it is
guaranteed that domain will not be destroyed during the call.

> 
> If we are relying on some upper-level mechanism, I think it deserves a
> comment somewhere to make that guarantee explicit.

Agree, will add some explanations.

Thanks!

