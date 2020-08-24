Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 246D32501B9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 18:08:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAF0O-0000FQ-9Z; Mon, 24 Aug 2020 16:07:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAF0M-0000FJ-Qp
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 16:07:30 +0000
X-Inumbo-ID: dcb5285a-897e-433f-b82c-398b46a531b6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dcb5285a-897e-433f-b82c-398b46a531b6;
 Mon, 24 Aug 2020 16:07:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2C5F3B737;
 Mon, 24 Aug 2020 16:07:59 +0000 (UTC)
Subject: Re: [PATCH 3/5] x86/vmsi: use the newly introduced EOI callbacks
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-4-roger.pau@citrix.com>
 <0d3afbb2-a2a8-f570-6f59-fd3c3d56e6dd@suse.com>
 <20200824144440.GD1587@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f1913d9a-a0a3-3eef-5427-f10573d5385a@suse.com>
Date: Mon, 24 Aug 2020 18:07:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824144440.GD1587@Air-de-Roger>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.08.2020 16:44, Roger Pau Monné wrote:
> On Mon, Aug 24, 2020 at 04:06:31PM +0200, Jan Beulich wrote:
>> On 12.08.2020 14:47, Roger Pau Monne wrote:
>>> Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
>>> and instead use the newly introduced EOI callback mechanism in order
>>> to register a callback for MSI vectors injected from passed through
>>> devices.
>>
>> In patch 2 you merely invoke the callback when the EOI arrived,
>> but you don't clear the callback (unless I've missed something).
>> Here you register the callback once per triggering of the IRQ,
>> without clearing it from the callback itself either.
> 
> It gets cleared on the next call to vlapic_set_irq_callback, or set to
> a new callback value if the passed callback is not NULL.
> 
>> Why is it
>> correct / safe to keep the callback registered?
> 
> The next vector injected is going to clear it, so should be safe, as
> no vector can be injected without calling vlapic_set_irq_callback.

But what about duplicate EOIs, even if just by bug or erratum?
I notice, for example, that VMX'es VMEXIT handler directly
calls vlapic_handle_EOI(). I'd find it more safe if an
unexpected EOI didn't get any callback invoked.

>> What about
>> conflicting callbacks for shared vectors?
> 
> In this callback model for vlapic only the last injected vector
> callback would get executed. It's my understanding that lapic
> vectors cannot be safely shared unless there's a higher level
> interrupt controller (ie: an IO-APIC) that does the sharing.

As said on a different, but pretty recent thread: I do think
sharing is possible if devices and drivers meet certain criteria
(in particular have a way to determine which of the devices
actually require service). It's just not something one would
normally do. But iirc such a model was used in good old DOS to
overcome the 15 IRQs limit (of which quite a few had fixed
purposes, so for add-in devices there were only very few left).

Jan

