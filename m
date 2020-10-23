Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1481296FB0
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 14:48:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.10958.29110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVwTx-00087z-HZ; Fri, 23 Oct 2020 12:47:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 10958.29110; Fri, 23 Oct 2020 12:47:45 +0000
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
	id 1kVwTx-00087a-EK; Fri, 23 Oct 2020 12:47:45 +0000
Received: by outflank-mailman (input) for mailman id 10958;
 Fri, 23 Oct 2020 12:47:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVwTv-00087V-HN
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 12:47:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4e752b6-d737-40ce-8a0b-13ade3d34d38;
 Fri, 23 Oct 2020 12:47:42 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C00C2ABBE;
 Fri, 23 Oct 2020 12:47:41 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVwTv-00087V-HN
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 12:47:43 +0000
X-Inumbo-ID: a4e752b6-d737-40ce-8a0b-13ade3d34d38
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a4e752b6-d737-40ce-8a0b-13ade3d34d38;
	Fri, 23 Oct 2020 12:47:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603457261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y0WX4FA6Hy6b6OwtZDzIwH6drk/1fu8vfXyC+x29rBQ=;
	b=BST/sUpQxoBpS7P4aaSO9XB0jbU+qQuIO3d3NOWVN/ffV4D56j0284de5JDXq6YM+hrfYB
	2bU1ROiU9l57WghWe/cwQHDW0hUJ/ENhqZJ4KbmF90LKQG1b7OWa92aFR5rvMf7X+OAj05
	iLSPjQ08t3HQWfsD7weqAOF21VIf/Zs=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C00C2ABBE;
	Fri, 23 Oct 2020 12:47:41 +0000 (UTC)
Subject: Re: [PATCH v2 08/11] x86/dpci: switch to use a GSI EOI callback
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-9-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4b37f6f4-3dbd-46c9-890b-f3b0205fd661@suse.com>
Date: Fri, 23 Oct 2020 14:47:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20200930104108.35969-9-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 12:41, Roger Pau Monne wrote:
> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/io.c
> @@ -327,9 +327,10 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi,
>      hvm_pirq_eoi(pirq, ent);
>  }
>  
> -void hvm_dpci_eoi(unsigned int guest_gsi, const union vioapic_redir_entry *ent)
> +static void dpci_eoi(unsigned int guest_gsi, void *data)
>  {
>      struct domain *d = current->domain;
> +    const union vioapic_redir_entry *ent = data;
>      const struct hvm_irq_dpci *hvm_irq_dpci;
>      const struct hvm_girq_dpci_mapping *girq;
>  
> @@ -565,7 +566,7 @@ int pt_irq_create_bind(
>              unsigned int link;
>  
>              digl = xmalloc(struct dev_intx_gsi_link);
> -            girq = xmalloc(struct hvm_girq_dpci_mapping);
> +            girq = xzalloc(struct hvm_girq_dpci_mapping);
>  
>              if ( !digl || !girq )
>              {
> @@ -578,11 +579,22 @@ int pt_irq_create_bind(
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

So this is where my question on the earlier patch gets answered:
You utilize passing NULL data to the callback to actually get
passed the IO-APIC redir entry pointer into the callback. This is
perhaps okay in principle if it was half way visible. May I ask
that at the very least instead of switching to xzalloc above you
set ->data to NULL here explicitly, accompanied by a comment on
the effect?

However, I wonder whether it wouldn't be better to have the
callback be passed const union vioapic_redir_entry * right away.
Albeit I haven't looked at the later patches yes, where it may
well be I'd find arguments against.

> @@ -590,8 +602,17 @@ int pt_irq_create_bind(
>          }
>          else
>          {
> +            struct hvm_gsi_eoi_callback *cb =
> +                xzalloc(struct hvm_gsi_eoi_callback);

I can't seem to be able to spot anywhere that this would get freed
(except on an error path in this function).

>              ASSERT(is_hardware_domain(d));
>  
> +            if ( !cb )
> +            {
> +                spin_unlock(&d->event_lock);
> +                return -ENOMEM;
> +            }
> +
>              /* MSI_TRANSLATE is not supported for the hardware domain. */
>              if ( pt_irq_bind->irq_type != PT_IRQ_TYPE_PCI ||
>                   pirq >= hvm_domain_irq(d)->nr_gsis )
> @@ -601,6 +622,19 @@ int pt_irq_create_bind(
>                  return -EINVAL;
>              }

There's an error path here where you don't free cb, and I think
one or two more further down (where you then also may need to
unregister it first).

Jan

