Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73476281684
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 17:25:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2224.6566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOMwB-00056H-Ug; Fri, 02 Oct 2020 15:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2224.6566; Fri, 02 Oct 2020 15:25:35 +0000
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
	id 1kOMwB-00055R-RY; Fri, 02 Oct 2020 15:25:35 +0000
Received: by outflank-mailman (input) for mailman id 2224;
 Fri, 02 Oct 2020 15:25:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kOMwA-00055M-Qo
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:25:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 066b3f6d-5c1b-4e3a-b620-15ee2e4fa3a7;
 Fri, 02 Oct 2020 15:25:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 059D8ACB8;
 Fri,  2 Oct 2020 15:25:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=5pZ8=DJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kOMwA-00055M-Qo
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 15:25:34 +0000
X-Inumbo-ID: 066b3f6d-5c1b-4e3a-b620-15ee2e4fa3a7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 066b3f6d-5c1b-4e3a-b620-15ee2e4fa3a7;
	Fri, 02 Oct 2020 15:25:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1601652333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mtFxudx+iYl41OTBQnvwHpaaaMKl9kzkEWSgv2PKrMo=;
	b=U5EnO3aySqa76DL5dWAjrLe4r16g/SXS3R0mnfssxuX5dTPaGDTjyNicXapRASNd6OotFw
	l4m76j+K0QzYlBpVUT81lveARCOxadfYJn/7TbUIU76KS/5Kcjr2F/SrciEjT88/WBJezR
	eGyJssAWvN7R5pXHukv9RSkpg+2Svj8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 059D8ACB8;
	Fri,  2 Oct 2020 15:25:33 +0000 (UTC)
Subject: Re: [PATCH v2 04/11] x86/vmsi: use the newly introduced EOI callbacks
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <785f80d6-3a0a-6a58-fd9a-05d8ff87f6fe@suse.com>
Date: Fri, 2 Oct 2020 17:25:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930104108.35969-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 12:41, Roger Pau Monne wrote:
> Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
> and instead use the newly introduced EOI callback mechanism in order
> to register a callback for MSI vectors injected from passed through
> devices.

What I'm kind of missing here is a word on why this is an improvement:
After all ...

> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -496,8 +496,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
>      if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
>          vioapic_update_EOI(vector);
>  
> -    hvm_dpci_msi_eoi(vector);

... you're exchanging this direct call for a more complex model with
an indirect one (to the same function).

> @@ -119,7 +126,8 @@ void vmsi_deliver_pirq(struct domain *d, const struct hvm_pirq_dpci *pirq_dpci)
>  
>      ASSERT(pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI);
>  
> -    vmsi_deliver(d, vector, dest, dest_mode, delivery_mode, trig_mode);
> +    vmsi_deliver_callback(d, vector, dest, dest_mode, delivery_mode, trig_mode,
> +                          hvm_dpci_msi_eoi, NULL);
>  }

While I agree with your reply to Paul regarding Dom0, I still think
the entire if() in hvm_dpci_msi_eoi() should be converted into a
conditional here. There's no point registering the callback if it's
not going to do anything.

However, looking further, the "!hvm_domain_irq(d)->dpci &&
!is_hardware_domain(d)" can be simply dropped altogether, right away.
It's now fulfilled by the identical check at the top of
hvm_dirq_assist(), thus guarding the sole call site of this function.

The !is_iommu_enabled(d) is slightly more involved to prove, but it
should also be possible to simply drop. What might help here is a
separate change to suppress opening of HVM_DPCI_SOFTIRQ when there's
no IOMMU in the system, as then it becomes obvious that this part of
the condition is guaranteed by hvm_do_IRQ_dpci(), being the only
site where the softirq can get raised (apart from the softirq
handler itself).

To sum up - the call above can probably stay as is, but the callback
can be simplified as a result of the change.

> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/io.c
> @@ -874,7 +874,7 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
>      return 0;
>  }
>  
> -void hvm_dpci_msi_eoi(unsigned int vector)
> +void hvm_dpci_msi_eoi(unsigned int vector, void *data)
>  {
>      struct domain *d = current->domain;

Instead of passing NULL for data and latching d from current, how
about you make the registration pass d to more easily use here?

Jan

