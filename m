Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D301B203B02
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 17:36:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnOUX-0003p5-3a; Mon, 22 Jun 2020 15:36:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ahnO=AD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jnOUV-0003oZ-MU
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 15:36:11 +0000
X-Inumbo-ID: 15868a2c-b49e-11ea-bea5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 15868a2c-b49e-11ea-bea5-12813bfff9fa;
 Mon, 22 Jun 2020 15:36:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE694C1D3;
 Mon, 22 Jun 2020 15:36:03 +0000 (UTC)
Subject: Re: Event delivery and "domain blocking" on PVHv2
To: Martin Lucina <martin@lucina.net>
References: <62479d08f7650c22678d7a86851eafc4@lucina.net>
 <5865159c-4190-e841-8020-7a4f3cf0fc24@citrix.com>
 <20200618101330.GB10330@nodbug.lucina.net>
 <20200618114617.GJ735@Air-de-Roger>
 <17deb17cec442f96cc7aba98ef4c047c@lucina.net>
 <20200619112119.GY735@Air-de-Roger>
 <ab26d419909c1fb038b32024d457871c@lucina.net>
 <20200619165426.GD735@Air-de-Roger> <20200619174143.GE735@Air-de-Roger>
 <7ed4a5f98b3002f3233e02d5ce803ef0@lucina.net>
 <20200622135853.GK735@Air-de-Roger>
 <745e4ac251b146480b2c6d6afbf5f34a@lucina.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7667cd25-238f-9822-f560-9f507baab5c3@suse.com>
Date: Mon, 22 Jun 2020 17:36:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <745e4ac251b146480b2c6d6afbf5f34a@lucina.net>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 mirageos-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.06.2020 17:31, Martin Lucina wrote:
> On 2020-06-22 15:58, Roger Pau Monné wrote:
>> On Mon, Jun 22, 2020 at 12:58:37PM +0200, Martin Lucina wrote:
>>> How about this arrangement, which appears to work for me; no hangs I 
>>> can see
>>> so far and domU survives ping -f fine with no packet loss:
>>>
>>> CAMLprim value
>>> mirage_xen_evtchn_block_domain(value v_deadline)
>>> {
>>>     struct vcpu_info *vi = VCPU0_INFO();
>>>     solo5_time_t deadline = Int64_val(v_deadline);
>>>
>>>     if (solo5_clock_monotonic() < deadline) {
>>>         __asm__ __volatile__ ("cli" : : : "memory");
>>>         if (vi->evtchn_upcall_pending) {
>>>             __asm__ __volatile__ ("sti");
>>>         }
>>>         else {
>>>             hypercall_set_timer_op(deadline);
>>
>> What if you set a deadline so close that evtchn_upcall_pending gets
>> set by Xen here and the interrupt is injected? You would execute the
>> noop handler and just hlt, and could likely end up in the same blocked
>> situation as before?
> 
> Why would an interrupt be injected here? Doesn't the immediately 
> preceding
> "cli" disable that?
> 
> Or perhaps I need to do a PV/HVM hybrid and set vi->evtchn_upcall_mask 
> just
> before the cli, and clear it after the sti?

evtchn_upcall_mask is a strictly PV-only thing. See e.g. the code
comment in hvm_set_callback_irq_level().

Jan

