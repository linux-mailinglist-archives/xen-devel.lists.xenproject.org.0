Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CEE372816
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 11:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122033.230158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldrLu-000217-0T; Tue, 04 May 2021 09:28:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122033.230158; Tue, 04 May 2021 09:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldrLt-00020i-Tj; Tue, 04 May 2021 09:28:25 +0000
Received: by outflank-mailman (input) for mailman id 122033;
 Tue, 04 May 2021 09:28:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldrLs-00020d-9E
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 09:28:24 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd8c3e9b-3621-4132-8b93-1ccd57c16418;
 Tue, 04 May 2021 09:28:23 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AC59B19A;
 Tue,  4 May 2021 09:28:22 +0000 (UTC)
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
X-Inumbo-ID: cd8c3e9b-3621-4132-8b93-1ccd57c16418
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620120502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QMnsycFkZceMuPLrD5lDxoO8Cdg8Uoi8uLnpunYETIU=;
	b=iQb0RVdCPYd8Q/yz5NwysuwfazjiJcOfDqkVJPrfcj0Y3OsZYVm3muJwy7f4vv7H8un2HN
	C9P/wMCxoqCX/6a7jWNAY2z+Yjq+AocjwysRPhp67eaQ19SqQEm2IrRfSAragUVz2rbg7L
	uJDV/PFF4disRv8i86qW8yy/nodss1I=
Subject: Re: [PATCH v4 07/12] x86/dpci: switch to use a GSI EOI callback
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-8-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <00e220bc-eb45-800b-b266-1b94e69d44c3@suse.com>
Date: Tue, 4 May 2021 11:28:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210420140723.65321-8-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.04.2021 16:07, Roger Pau Monne wrote:
> @@ -476,6 +476,7 @@ int pt_irq_create_bind(
>      {
>          struct dev_intx_gsi_link *digl = NULL;
>          struct hvm_girq_dpci_mapping *girq = NULL;
> +        struct hvm_gsi_eoi_callback *cb = NULL;

I wonder if this wouldn't benefit from a brief "hwdom only" comment.

> @@ -502,11 +503,22 @@ int pt_irq_create_bind(
>              girq->bus = digl->bus = pt_irq_bind->u.pci.bus;
>              girq->device = digl->device = pt_irq_bind->u.pci.device;
>              girq->intx = digl->intx = pt_irq_bind->u.pci.intx;
> -            list_add_tail(&digl->list, &pirq_dpci->digl_list);
> +            girq->cb.callback = dpci_eoi;
>  
>              guest_gsi = hvm_pci_intx_gsi(digl->device, digl->intx);
>              link = hvm_pci_intx_link(digl->device, digl->intx);
>  
> +            rc = hvm_gsi_register_callback(d, guest_gsi, &girq->cb);
> +            if ( rc )
> +            {
> +                spin_unlock(&d->event_lock);
> +                xfree(girq);
> +                xfree(digl);
> +                return rc;
> +            }
> +
> +            list_add_tail(&digl->list, &pirq_dpci->digl_list);
> +
>              hvm_irq_dpci->link_cnt[link]++;

Could we keep calculation and use of "link" together, please, so the
compiler can avoid spilling the value to the stack or allocating a
callee-saved register for it?

> @@ -514,17 +526,43 @@ int pt_irq_create_bind(
>          }
>          else
>          {
> +            /*
> +             * NB: the callback structure allocated below will never be freed
> +             * once setup because it's used by the hardware domain and will
> +             * never be unregistered.
> +             */
> +            cb = xzalloc(struct hvm_gsi_eoi_callback);
> +
>              ASSERT(is_hardware_domain(d));
>  
> +            if ( !cb )
> +            {
> +                spin_unlock(&d->event_lock);
> +                return -ENOMEM;
> +            }

I'm inclined to ask that the ASSERT() remain first in this "else" block.
In fact, you could ...

>              /* MSI_TRANSLATE is not supported for the hardware domain. */
>              if ( pt_irq_bind->irq_type != PT_IRQ_TYPE_PCI ||
>                   pirq >= hvm_domain_irq(d)->nr_gsis )
>              {
>                  spin_unlock(&d->event_lock);
> -
> +                xfree(cb);

... avoid this extra cleanup by ...

>                  return -EINVAL;
>              }

... putting the allocation here.

>              guest_gsi = pirq;
> +
> +            cb->callback = dpci_eoi;
> +            /*
> +             * IRQ binds created for the hardware domain are never destroyed,
> +             * so it's fine to not keep a reference to cb here.
> +             */
> +            rc = hvm_gsi_register_callback(d, guest_gsi, cb);

In reply to a v3 comment of mine you said "I should replace IRQ with
GSI in the comment above to make it clearer." And while the question
of the comment being (and going to remain) true in the first place
was discussed, I would have hoped for the commit message to say a
word on this. If this ever changed, chances are the place here would
go unnoticed and unchanged, leading to a memory leak.

> @@ -596,12 +634,17 @@ int pt_irq_create_bind(
>                      list_del(&digl->list);
>                      link = hvm_pci_intx_link(digl->device, digl->intx);
>                      hvm_irq_dpci->link_cnt[link]--;
> +                    hvm_gsi_unregister_callback(d, guest_gsi, &girq->cb);
>                  }
> +                else
> +                    hvm_gsi_unregister_callback(d, guest_gsi, cb);
> +
>                  pirq_dpci->flags = 0;
>                  pirq_cleanup_check(info, d);
>                  spin_unlock(&d->event_lock);
>                  xfree(girq);
>                  xfree(digl);
> +                xfree(cb);

May I suggest that you move the xfree() into the "else" you add, and
perhaps even make it conditional upon the un-register being successful?

> @@ -708,6 +752,11 @@ int pt_irq_destroy_bind(
>                   girq->machine_gsi == machine_gsi )
>              {
>                  list_del(&girq->list);
> +                rc = hvm_gsi_unregister_callback(d, guest_gsi, &girq->cb);
> +                if ( rc )
> +                    printk(XENLOG_G_WARNING
> +                           "%pd: unable to remove callback for GSI %u: %d\n",
> +                           d, guest_gsi, rc);
>                  xfree(girq);

If the un-registration really failed (here as well as further up),
is it safe to free girq?

Jan

