Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F86280FFE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 11:40:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1767.5421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHXc-0006pb-Ei; Fri, 02 Oct 2020 09:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1767.5421; Fri, 02 Oct 2020 09:39:52 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOHXc-0006pE-Aw; Fri, 02 Oct 2020 09:39:52 +0000
Received: by outflank-mailman (input) for mailman id 1767;
 Fri, 02 Oct 2020 09:39:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOHXa-0006p9-KD
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:39:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7669fb16-605d-4029-89d3-dbd7f3dff688;
 Fri, 02 Oct 2020 09:39:49 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E8A0AC54;
 Fri,  2 Oct 2020 09:39:48 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOHXa-0006p9-KD
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 09:39:50 +0000
X-Inumbo-ID: 7669fb16-605d-4029-89d3-dbd7f3dff688
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7669fb16-605d-4029-89d3-dbd7f3dff688;
	Fri, 02 Oct 2020 09:39:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601631588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjOM2wsX9un7MyyNRT0QnyhHaldtAv+oXZi3z52RjaY=;
	b=I79Gb8FNHptVGe26fFZc5ZF09u2kas+Cwm8g8XupsS4mA0cZr8yk+mGG71/Wr5A6m5O7mE
	KafoG6XKXoLXw6nUMWm9BRGr79POqhA8YdPSL8d2g10CY39AyCxPvuIRaeADJ5pOSV4oSg
	3kWLe9Y+NHm4JvDwVljsKXf4dWaC0ZM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8E8A0AC54;
	Fri,  2 Oct 2020 09:39:48 +0000 (UTC)
Subject: Re: [PATCH v2 03/11] x86/vlapic: introduce an EOI callback mechanism
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6863a90-584a-af21-4a0a-1b104b750978@suse.com>
Date: Fri, 2 Oct 2020 11:39:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930104108.35969-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 12:41, Roger Pau Monne wrote:
> Add a new vlapic_set_irq_callback helper in order to inject a vector
> and set a callback to be executed when the guest performs the end of
> interrupt acknowledgment.

On v1 I did ask

"One thing I don't understand at all for now is how these
 callbacks are going to be re-instated after migration for
 not-yet-EOIed interrupts."

Afaics I didn't get an answer on this.

> ---
> RFC: should callbacks also be executed in vlapic_do_init (which is
> called by vlapic_reset). We would need to make sure ISR and IRR
> are cleared using some kind of test and clear atomic functionality to
> make this race free.

I guess this can't be decided at this point of the series, as it
may depend on what exactly the callbacks mean to do. It may even
be that whether a callback wants to do something depends on
whether it gets called "normally" or from vlapic_do_init().

> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -144,7 +144,32 @@ bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
>      return vlapic_test_vector(vec, &vlapic->regs->data[APIC_IRR]);
>  }
>  
> -void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
> +void vlapic_set_callback(struct vlapic *vlapic, unsigned int vec,
> +                         vlapic_eoi_callback_t *callback, void *data)
> +{
> +    unsigned long flags;
> +    unsigned int index = vec - 16;
> +
> +    if ( !callback || vec < 16 || vec >= X86_NR_VECTORS )
> +    {
> +        ASSERT_UNREACHABLE();
> +        return;
> +    }
> +
> +    spin_lock_irqsave(&vlapic->callback_lock, flags);
> +    if ( vlapic->callbacks[index].callback &&
> +         vlapic->callbacks[index].callback != callback )
> +        printk(XENLOG_G_WARNING
> +               "%pv overriding vector %#x callback %ps (%p) with %ps (%p)\n",
> +               vlapic_vcpu(vlapic), vec, vlapic->callbacks[index].callback,
> +               vlapic->callbacks[index].callback, callback, callback);
> +    vlapic->callbacks[index].callback = callback;
> +    vlapic->callbacks[index].data = data;

Should "data" perhaps also be compared in the override check above?

> @@ -1629,9 +1672,23 @@ int vlapic_init(struct vcpu *v)
>      }
>      clear_page(vlapic->regs);
>  
> +    if ( !vlapic->callbacks )
> +    {
> +        vlapic->callbacks = xmalloc_array(typeof(*vlapic->callbacks),
> +                                          X86_NR_VECTORS - 16);
> +        if ( !vlapic->callbacks )
> +        {
> +            dprintk(XENLOG_ERR, "%pv: alloc vlapic callbacks error\n", v);
> +            return -ENOMEM;
> +        }
> +    }
> +    memset(vlapic->callbacks, 0, sizeof(*vlapic->callbacks) *
> +                                 (X86_NR_VECTORS - 16));

While it resembles code earlier in this function, it widens an
existing memory leak (I'll make a patch for that one) and also
makes it appear as if this function could be called more than
once for a vCPU (maybe I'll also make a patch for this).

Jan

