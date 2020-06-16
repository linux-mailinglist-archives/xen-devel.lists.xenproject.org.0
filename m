Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 490C61FAB8D
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 10:46:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl7EE-00077p-Fy; Tue, 16 Jun 2020 08:45:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jl7ED-00077k-DW
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 08:45:57 +0000
X-Inumbo-ID: c9951718-afad-11ea-bb8b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9951718-afad-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 08:45:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B5E03AD7B;
 Tue, 16 Jun 2020 08:45:56 +0000 (UTC)
Subject: Re: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for
 GSIs not requiring an EOI or unmask
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200610142923.9074-1-roger.pau@citrix.com>
 <20200610142923.9074-3-roger.pau@citrix.com>
 <1ccfdfdf-695e-00ce-7d49-401b1f4bb015@suse.com>
 <20200616083701.GL735@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f982b10e-360b-cd58-54ca-a0a527173891@suse.com>
Date: Tue, 16 Jun 2020 10:45:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200616083701.GL735@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 16.06.2020 10:37, Roger Pau Monné wrote:
> On Tue, Jun 16, 2020 at 08:27:54AM +0200, Jan Beulich wrote:
>> On 10.06.2020 16:29, Roger Pau Monne wrote:
>>> @@ -920,6 +923,8 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
>>>          if ( pirq_dpci->flags & HVM_IRQ_DPCI_IDENTITY_GSI )
>>>          {
>>>              hvm_gsi_assert(d, pirq->pirq);
>>> +            if ( pirq_dpci->flags & HVM_IRQ_DPCI_NO_EOI )
>>> +                goto out;
>>
>> Immediately ahead of this there's a similar piece of code
>> dealing with PCI INTx. They're commonly level triggered, but
>> I don't think there's a strict need for this to be the case.
>> At least hvm_pci_intx_assert() -> assert_gsi() ->
>> vioapic_irq_positive_edge() also cover the edge triggered one.
> 
> Hm, I'm not sure it's safe to passthrough edge triggered IO-APIC
> interrupts, as Xen will mark those as 'shared' always, and sharing
> edge interrupts cannot reliably work. In any case the EOI timer is
> definitely set for those, and needs to be disabled before exiting
> hvm_dirq_assist.

That's the

                if ( !is_hardware_domain(d) )
                    share = BIND_PIRQ__WILL_SHARE;

in pt_irq_create_bind() aiui? I wonder why we have that ... At a
guess it's to accommodate pciback in Dom0 also registering a handler.
But wasn't it XenoLinux'es pciback only that does so, and upstream's
doesn't?

Jan

