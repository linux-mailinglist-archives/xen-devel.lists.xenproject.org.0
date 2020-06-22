Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B33203C8B
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2020 18:26:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnPHT-000155-Ub; Mon, 22 Jun 2020 16:26:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m+g9=AD=lucina.net=martin@srs-us1.protection.inumbo.net>)
 id 1jnPHS-00014w-Ko
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2020 16:26:46 +0000
X-Inumbo-ID: 29cbd8a0-b4a5-11ea-bb8b-bc764e2007e4
Received: from smtp.lucina.net (unknown [62.176.169.44])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 29cbd8a0-b4a5-11ea-bb8b-bc764e2007e4;
 Mon, 22 Jun 2020 16:26:45 +0000 (UTC)
Received: from webmail.moloch.sk (w3-s.a.lucina.net [62.176.169.73])
 by smtp.lucina.net (Postfix) with ESMTPSA id DC2A0122804;
 Mon, 22 Jun 2020 18:26:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucina.net;
 s=dkim-201811; t=1592843204;
 bh=mQQXPxHXOMJnHmwl/M96HjVCwVd2JTdxTuAjUdi23H8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=S4ACGWs+Kz/7HOI8guY2BTY+7HMQp7b4VKVLow5o4N2MPfwD6hy7J3EGLdOTG/Nv8
 DtqY1StSPlGWGG+Ir9ntH8NyUt5FdfyOE7b6gRZdz0qnulOVH8N1pods77LEdJ5qZU
 ACSg+YEXiuchewfwx5g+8kesVQbzYoRC0oiY4YryqtwpM2sppkf71euzhQOBFPpEpr
 O3lhwhaqrS9bfpEGw/RdYjlQQDV3CqaReZwqn3XDdSXRFuMNTUUNUHfQRBm2pO9xfk
 7Ibi8QD5HRhLKRcV+qxadw+0DZdWWiNEv5/QE/8IsxV8UeCmW434xtCxELL0QdtZY2
 pN2A936vVhByA==
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Mon, 22 Jun 2020 18:26:44 +0200
From: Martin Lucina <martin@lucina.net>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: Event delivery and "domain blocking" on PVHv2
In-Reply-To: <c1f1a722-49fe-257c-2033-76f3efe0d60c@suse.com>
References: <20200618101330.GB10330@nodbug.lucina.net>
 <20200618114617.GJ735@Air-de-Roger>
 <17deb17cec442f96cc7aba98ef4c047c@lucina.net>
 <20200619112119.GY735@Air-de-Roger>
 <ab26d419909c1fb038b32024d457871c@lucina.net>
 <20200619165426.GD735@Air-de-Roger> <20200619174143.GE735@Air-de-Roger>
 <7ed4a5f98b3002f3233e02d5ce803ef0@lucina.net>
 <20200622135853.GK735@Air-de-Roger>
 <745e4ac251b146480b2c6d6afbf5f34a@lucina.net>
 <20200622160916.GM735@Air-de-Roger>
 <c1f1a722-49fe-257c-2033-76f3efe0d60c@suse.com>
Message-ID: <7db6ae6c0270fde4d417e3c6134f3dbc@lucina.net>
X-Sender: martin@lucina.net
User-Agent: Roundcube Webmail/1.3.3
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
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-06-22 18:20, Jan Beulich wrote:
> On 22.06.2020 18:09, Roger Pau Monné wrote:
>> On Mon, Jun 22, 2020 at 05:31:00PM +0200, Martin Lucina wrote:
>>> On 2020-06-22 15:58, Roger Pau Monné wrote:
>>>> On Mon, Jun 22, 2020 at 12:58:37PM +0200, Martin Lucina wrote:
>>>>> Aha! Thank you for pointing this out. I think you may be right, but
>>>>> this
>>>>> should be possible without doing the demuxing in interrupt context.
>>>> 
>>>> If you don't do the demuxing in the interrupt context (ie: making 
>>>> the
>>>> interrupt handler a noop), then you don't likely need such interrupt
>>>> anyway?
>>> 
>>> I need the/an interrupt to wake the VCPU from HLT state if we went to 
>>> sleep.
>>> 
>>>> 
>>>>> How about this arrangement, which appears to work for me; no hangs 
>>>>> I
>>>>> can see
>>>>> so far and domU survives ping -f fine with no packet loss:
>>>>> 
>>>>> CAMLprim value
>>>>> mirage_xen_evtchn_block_domain(value v_deadline)
>>>>> {
>>>>>     struct vcpu_info *vi = VCPU0_INFO();
>>>>>     solo5_time_t deadline = Int64_val(v_deadline);
>>>>> 
>>>>>     if (solo5_clock_monotonic() < deadline) {
>>>>>         __asm__ __volatile__ ("cli" : : : "memory");
>>>>>         if (vi->evtchn_upcall_pending) {
>>>>>             __asm__ __volatile__ ("sti");
>>>>>         }
>>>>>         else {
>>>>>             hypercall_set_timer_op(deadline);
>>>> 
>>>> What if you set a deadline so close that evtchn_upcall_pending gets
>>>> set by Xen here and the interrupt is injected? You would execute the
>>>> noop handler and just hlt, and could likely end up in the same 
>>>> blocked
>>>> situation as before?
>>> 
>>> Why would an interrupt be injected here? Doesn't the immediately 
>>> preceding
>>> "cli" disable that?
>> 
>> Well, I mean between the sti and the hlt instruction.
> 
> When EFLAGS.IF was clear before STI, then the first point at which
> an interrupt can get injected is when HLT is already executed (i.e.
> to wake from this HLT). That's the so called "STI shadow".

Indeed, that's what the Intel SDM says, and Andrew already mentioned 
earlier in this thread in a different context, here: 
https://lists.xenproject.org/archives/html/mirageos-devel/2020-06/msg00021.html
.

So it would seem that my latest approach is race-free?

Martin

