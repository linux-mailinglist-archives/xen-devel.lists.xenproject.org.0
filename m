Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A32BA251455
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 10:37:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAUQi-0001ki-NB; Tue, 25 Aug 2020 08:35:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAUQh-0001kd-HI
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 08:35:43 +0000
X-Inumbo-ID: a3e13ad0-0a37-4ccf-8c2f-bacef622aaf8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a3e13ad0-0a37-4ccf-8c2f-bacef622aaf8;
 Tue, 25 Aug 2020 08:35:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A462ACA0;
 Tue, 25 Aug 2020 08:36:12 +0000 (UTC)
Subject: Re: [PATCH 5/5] x86/vioapic: switch to use the EOI callback mechanism
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bf217ef5-3a0c-e806-671d-96bafb3c359b@suse.com>
Date: Tue, 25 Aug 2020 10:35:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200812124709.4165-6-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.08.2020 14:47, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -375,6 +375,50 @@ static const struct hvm_mmio_ops vioapic_mmio_ops = {
>      .write = vioapic_write
>  };
>  
> +static void eoi_callback(struct vcpu *v, unsigned int vector, void *data)
> +{
> +    struct domain *d = v->domain;
> +    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
> +    union vioapic_redir_entry *ent;

While you move the code, could you restrict this variable's scope?

> +    unsigned int i;
> +
> +    ASSERT(has_vioapic(d));
> +
> +    spin_lock(&d->arch.hvm.irq_lock);
> +
> +    for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> +    {
> +        struct hvm_vioapic *vioapic = domain_vioapic(d, i);
> +        unsigned int pin;
> +
> +        for ( pin = 0; pin < vioapic->nr_pins; pin++ )
> +        {
> +            ent = &vioapic->redirtbl[pin];
> +            if ( ent->fields.vector != vector )
> +                continue;
> +
> +            ent->fields.remote_irr = 0;
> +
> +            if ( is_iommu_enabled(d) )
> +            {
> +                spin_unlock(&d->arch.hvm.irq_lock);
> +                hvm_dpci_eoi(d, vioapic->base_gsi + pin, ent);
> +                spin_lock(&d->arch.hvm.irq_lock);
> +            }

Just as a remark (simply because of it catching my attention) -
this intermediate dropping of the lock can't really be good. We
may want (need?) to think about ways to avoid this.

Jan

