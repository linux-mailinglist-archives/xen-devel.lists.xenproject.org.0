Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 251C21FA8C5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 08:28:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl54e-0002Pw-Q5; Tue, 16 Jun 2020 06:27:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl54d-0002Pr-QY
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 06:27:55 +0000
X-Inumbo-ID: 82e495e0-af9a-11ea-b884-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 82e495e0-af9a-11ea-b884-12813bfff9fa;
 Tue, 16 Jun 2020 06:27:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D1878AC85;
 Tue, 16 Jun 2020 06:27:57 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for
 GSIs not requiring an EOI or unmask
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1ccfdfdf-695e-00ce-7d49-401b1f4bb015@suse.com>
Date: Tue, 16 Jun 2020 08:27:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200610142923.9074-3-roger.pau@citrix.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 10.06.2020 16:29, Roger Pau Monne wrote:
> @@ -558,6 +559,12 @@ int pt_irq_create_bind(
>                       */
>                      ASSERT(!mask);
>                      share = trigger_mode;
> +                    if ( trigger_mode == VIOAPIC_EDGE_TRIG )
> +                        /*
> +                         * Edge IO-APIC interrupt, no EOI or unmask to perform
> +                         * and hence no timer needed.
> +                         */
> +                        pirq_dpci->flags |= HVM_IRQ_DPCI_NO_EOI;

Is this really limited to edge triggered IO-APIC interrupts?
MSI ones are effectively edge triggered too, aren't they?
Along the lines of irq_acktype() maskable MSI may then also
not need any such arrangements? The pirq_guest_eoi() ->
desc_guest_eoi() path looks to confirm this.

> @@ -920,6 +923,8 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
>          if ( pirq_dpci->flags & HVM_IRQ_DPCI_IDENTITY_GSI )
>          {
>              hvm_gsi_assert(d, pirq->pirq);
> +            if ( pirq_dpci->flags & HVM_IRQ_DPCI_NO_EOI )
> +                goto out;

Immediately ahead of this there's a similar piece of code
dealing with PCI INTx. They're commonly level triggered, but
I don't think there's a strict need for this to be the case.
At least hvm_pci_intx_assert() -> assert_gsi() ->
vioapic_irq_positive_edge() also cover the edge triggered one.

Jan

