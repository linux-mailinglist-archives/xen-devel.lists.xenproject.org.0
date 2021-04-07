Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0B235700C
	for <lists+xen-devel@lfdr.de>; Wed,  7 Apr 2021 17:19:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106757.204126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9xW-0004ZV-Rt; Wed, 07 Apr 2021 15:19:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106757.204126; Wed, 07 Apr 2021 15:19:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lU9xW-0004Z6-OS; Wed, 07 Apr 2021 15:19:10 +0000
Received: by outflank-mailman (input) for mailman id 106757;
 Wed, 07 Apr 2021 15:19:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjXx=JE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lU9xV-0004Z1-Ev
 for xen-devel@lists.xenproject.org; Wed, 07 Apr 2021 15:19:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 087ffc5a-fb8d-4dda-b637-5da2f28a23cb;
 Wed, 07 Apr 2021 15:19:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54740B166;
 Wed,  7 Apr 2021 15:19:07 +0000 (UTC)
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
X-Inumbo-ID: 087ffc5a-fb8d-4dda-b637-5da2f28a23cb
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617808747; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=smC/S1KIKYAb/PZDexjTRT4X2DWdjUvdDeqpVkTO6kI=;
	b=fViEUPZbM6QgII2QIOfrEogKaUJ49q5AiFD80Y+ewT7u7SqB46Ye/n7EjQYVy1SjPM6Y1X
	QoMpxsicaIqRAN1FwEqNLf2Y1rmf+iJY/GRieJIAb3hYJvStVDRMRB2xANU9CNzwzUkZvx
	BGy71IhFNyOJ79pr8+qEZs1FBvQBxmQ=
Subject: Re: [PATCH v3 05/11] x86/vioapic: switch to use the EOI callback
 mechanism
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f8d9c37f-8896-36af-712a-ac0765567409@suse.com>
Date: Wed, 7 Apr 2021 17:19:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331103303.79705-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.03.2021 12:32, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -394,6 +394,50 @@ static const struct hvm_mmio_ops vioapic_mmio_ops = {
>      .write = vioapic_write
>  };
>  
> +static void eoi_callback(unsigned int vector, void *data)
> +{
> +    struct domain *d = current->domain;
> +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> +    unsigned int i;
> +
> +    ASSERT(has_vioapic(d));

On the same grounds on which you dropped checks from hvm_dpci_msi_eoi()
in the previous patch you could imo now drop this assertion.

> @@ -621,7 +624,43 @@ static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
>           d->arch.hvm.nr_vioapics != 1 )
>          return -EOPNOTSUPP;
>  
> -    return hvm_load_entry(IOAPIC, h, &s->domU);
> +    rc = hvm_load_entry(IOAPIC, h, &s->domU);
> +    if ( rc )
> +        return rc;
> +
> +    for ( i = 0; i < ARRAY_SIZE(s->domU.redirtbl); i++ )
> +    {
> +        const union vioapic_redir_entry *ent = &s->domU.redirtbl[i];
> +        unsigned int vector = ent->fields.vector;
> +        unsigned int delivery_mode = ent->fields.delivery_mode;
> +        struct vcpu *v;
> +
> +        /*
> +         * Add a callback for each possible vector injected by a redirection
> +         * entry.
> +         */
> +        if ( vector < 16 || !ent->fields.remote_irr ||
> +             (delivery_mode != dest_LowestPrio && delivery_mode != dest_Fixed) )
> +            continue;
> +
> +        for_each_vcpu ( d, v )
> +        {
> +            struct vlapic *vlapic = vcpu_vlapic(v);
> +
> +            /*
> +             * NB: if the vlapic registers were restored before the vio-apic
> +             * ones we could test whether the vector is set in the vlapic IRR
> +             * or ISR registers before unconditionally setting the callback.
> +             * This is harmless as eoi_callback is capable of dealing with
> +             * spurious callbacks.
> +             */
> +            if ( vlapic_match_dest(vlapic, NULL, 0, ent->fields.dest_id,
> +                                   ent->fields.dest_mode) )
> +                vlapic_set_callback(vlapic, vector, eoi_callback, NULL);

eoi_callback()'s behavior is only one of the aspects to consider here.
The other is vlapic_set_callback()'s complaining if it finds a
callback already set. What guarantees that a mistakenly set callback
here won't get in conflict with some future use of the same vector by
the guest?

And btw - like in the earlier patch you could again pass d instead of
NULL here, avoiding the need to establish it from current in the
callback.

> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -192,7 +192,13 @@ void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
>  
>      if ( hvm_funcs.update_eoi_exit_bitmap )
>          alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
> -                          trig || callback);
> +                          /*
> +                           * NB: need to explicitly convert to boolean to avoid
> +                           * truncation wrongly result in false begin reported
> +                           * for example when the pointer sits on a page
> +                           * boundary.
> +                           */
> +                          !!callback);

I've had quite a bit of difficulty with the comment. Once I realized
that you likely mean "being" instead of "begin" it got a bit better.
I'd like to suggest also s/result/resulting/, a comma after "reported",
and maybe then s/being reported/getting passed/.

As to explicitly converting to bool, wouldn't a cast to bool do? That's
more explicitly an "explicit conversion" than using !!.

Jan

