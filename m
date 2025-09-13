Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A8CB56253
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 19:30:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1123420.1466453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxU4L-0003Gx-JQ; Sat, 13 Sep 2025 17:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1123420.1466453; Sat, 13 Sep 2025 17:29:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxU4L-0003FU-G4; Sat, 13 Sep 2025 17:29:49 +0000
Received: by outflank-mailman (input) for mailman id 1123420;
 Sat, 13 Sep 2025 17:29:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <dmukhin@xen.org>) id 1uxU4J-0003FO-I5
 for xen-devel@lists.xenproject.org; Sat, 13 Sep 2025 17:29:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxU4I-0088gY-18;
 Sat, 13 Sep 2025 17:29:46 +0000
Received: from [19.12.91.86] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <dmukhin@xen.org>) id 1uxU4I-007Rop-00;
 Sat, 13 Sep 2025 17:29:45 +0000
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
	s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
	:Subject:Cc:To:Date:From; bh=OzsW1yzoLTy+K+CunPLCOmn64If/Y4aeaubQAog79Xw=; b=
	xsU50lrDkk/cYqkCNJISuiubMMUg62bQs0oUmnvouiwUvNaPMZc7Hw6OlsHJAMnwoYaDlOir+dI4K
	s/ZbR5FcuQgVM7sQ+gK9HMl6hTeLiFWEZxFKHk6lwLfZAJPVV8+w+9fRDOf145o1KxOov4k5LYYdH
	uzmiQ2TxfO+pkmNyc=;
From: dmukhin@xen.org
Date: Sat, 13 Sep 2025 10:29:44 -0700
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
	anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org,
	michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
	dmukhin@ford.com
Subject: Re: [PATCH v7 03/16] emul/ns16x50: implement emulator stub
Message-ID: <aMWqCBn6igm1+zi0@kraken>
References: <20250908211149.279143-1-dmukhin@ford.com>
 <20250908211149.279143-4-dmukhin@ford.com>
 <CAGeoDV_-AOeN=_kNK8wo-X8ZBq8DTxwGoi=wBd1ScN9j0XohmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGeoDV_-AOeN=_kNK8wo-X8ZBq8DTxwGoi=wBd1ScN9j0XohmA@mail.gmail.com>

On Wed, Sep 10, 2025 at 01:05:13PM +0300, Mykola Kvach wrote:
[..]
> >
> > +/* Enable NS16550 emulator for certain domain only. */
> > +static int __read_mostly opt_vuart_domid = -1;
> 
> Should opt_vuart_domid be initialized to DOMID_INVALID instead of -1?
> Using the standard DOMID_INVALID constant would make the intent clearer
> and avoid potential confusion with valid domain IDs.
> ---
> Should the variable type be domid_t or at least unsigned?

Yes, absolutely; thanks.

> 
> > +
> > +#ifdef CONFIG_VUART_NS16X50
> > +static int __read_mostly opt_vuart_id;
> > +static int __init cf_check parse_vuart_param(const char *s)
> > +{
> > +    if ( !isdigit(*s) )
> > +        return -EINVAL;
> > +
> > +    opt_vuart_domid = simple_strtoul(s, &s, 0);
> 
> Should we check the resulting value against DOMID_MASK to ensure it
> is a valid domain ID?

Good point, will hook the check.

> 
> > +
> > +    if ( *s != ':' )
> > +        return 0;
> 
> It seems that if the COM ID is not provided on the command line, the
> default value will come from the static variable, which is 0 (treated
> as COM1). Is this intended behavior?

Correct, the idea was using COM1 by default.

> 
> If this is by design, it would be helpful to add a comment explaining
> why we allow a valid domain ID with a default COM ID. Otherwise, maybe
> opt_vuart_id should be set to an invalid value or opt_vuart_domid
> reset here to avoid ambiguity.

I will add a comment.

> 
> > +
> > +    if ( strncmp(s, "com", 3) )
> > +        return -EINVAL;
> > +
> > +    opt_vuart_id = *(s + 3) - '1';
> > +    if ( opt_vuart_id < 0 || opt_vuart_id > 3 )
> 
> Would it be better to define the pc_uarts array outside the function
> and then use ARRAY_SIZE(pc_uarts) here for the bounds check? This
> would make the code more maintainable in case the number of UARTs
> changes in the future.

Makes sense.
Let me see how that can be improved.

> ---
> Do we really need the search function below at all? Instead of
> storing an opt_vuart_id, we could store a pointer to the chosen
> vUART directly here and eliminate the search, simplifying the code.
> 
> > +        return -EINVAL;
> > +
> > +    return 0;
> > +}
> > +custom_param("vuart", parse_vuart_param);
> > +
> > +static const struct vuart_info *get_vuart_info(struct domain *d)
> > +{
> > +#define PC_UART(n,p,i) { \
> > +    .name = n, \
> > +    .compatible = "ns16550", \
> > +    .base_addr = p, \
> > +    .size = 8, \
> > +    .irq = i, \
> > +}
> > +    static const struct vuart_info pc_uarts[4] =
> > +    {
> > +        PC_UART("com1", 0x3f8, 4),
> > +        PC_UART("com2", 0x2f8, 3),
> > +        PC_UART("com3", 0x3fe, 4),
> > +        PC_UART("com4", 0x2fe, 3),
> > +    };
> > +    unsigned i;
> > +
> > +    for ( i = 0; i < ARRAY_SIZE(pc_uarts); i++ )
> > +        if ( i == opt_vuart_id )
> > +            break;
> 
> Instead of breaking from the loop, why not return the pointer directly
> when a match is found? For example:
> 
> for ( i = 0; i < ARRAY_SIZE(pc_uarts); i++ )
>     if ( i == opt_vuart_id )
>         return &pc_uarts[i];
> 
> return NULL;
> 
> This eliminates the need for a separate break and makes the code
> clearer.

Yep, will do.

> ---
> 
> Actually, we can simplify this further: since the array is indexed by
> opt_vuart_id, we can directly check the bounds and return the entry:
> 
> if ( opt_vuart_id > -1 && opt_vuart_id < ARRAY_SIZE(pc_uarts) )
>     return &pc_uarts[opt_vuart_id];
> 
> return NULL;
> 
> If opt_vuart_id were defined as unsigned, the lower-bound check could be
> dropped entirely, leaving only the upper-bound check, which would make
> the code even cleaner.

Ack.

> 
> > +
> > +    if ( i != ARRAY_SIZE(pc_uarts) )
> > +        return &pc_uarts[i];
> > +
> > +    return NULL;
> > +#undef PC_UART
> > +}
> > +#else
> > +static const struct vuart_info *get_vuart_info(struct domain *d)
> 
> inline ?

Yes, thanks.

> 
> > +{
> > +    return NULL;
> > +}
> > +#endif /* CONFIG_VUART_NS16X50 */
> 
> Should all of the code above be made common? If in the future other
> architectures also use this vUART mechanism, it would be better to
> make it generic from the start. In that case, vuart_info would
> probably need a "compatible" property to support different hardware
> types.
> 
> Then the search procedure through the vuart array would make
> much more sense.

My plan is have DT-binding for dom0less and xl config for legacy
configuration. Let me see, looks like dom0 vUART configuration
should be supplied via command line anyway in non-dom0less case.

