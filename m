Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6266D1EFA28
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 16:13:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhD5x-00081G-Vi; Fri, 05 Jun 2020 14:13:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jhD5w-00081A-31
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 14:13:16 +0000
X-Inumbo-ID: b19f33ca-a736-11ea-afc4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b19f33ca-a736-11ea-afc4-12813bfff9fa;
 Fri, 05 Jun 2020 14:13:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8B515AE7B;
 Fri,  5 Jun 2020 14:13:16 +0000 (UTC)
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <f22ce6e0-d80b-2fc3-586a-c030fa22b3e8@suse.com>
 <20200605120137.GF98582@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2525364-bc82-de7c-0345-d32603574ce6@suse.com>
Date: Fri, 5 Jun 2020 16:13:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605120137.GF98582@mail-itl>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.06.2020 14:01, Marek Marczykowski-Górecki wrote:
> On Fri, Jun 05, 2020 at 11:22:46AM +0200, Jan Beulich wrote:
>> On 05.06.2020 11:09, Jan Beulich wrote:
>>> On 04.06.2020 16:25, Marek Marczykowski-Górecki wrote:
>>>> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>> (XEN) d3v0 handle_pio port 0xb004 write 0x0001
>>>> (XEN) d3v0 handle_pio port 0xb004 write 0x2001
>>>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
>>>> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
>>>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
>>>> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
>>>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
>>>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
>>>> (XEN) d1v0 handle_pio port 0xb004 write 0x0001
>>>> (XEN) d1v0 handle_pio port 0xb004 write 0x2001
>>>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
>>>> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
>>>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
>>>> (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags 0x2 d6
>>>> (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags 0x2 d6
>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>
>>> Perhaps in this message could you also log
>>> v->domain->is_shutting_down, v->defer_shutdown, and
>>> v->paused_for_shutdown?
>>
>> And v->domain->is_shut_down please.
> 
> Here it is:
> 
> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d3v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 defer_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d3v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 defer_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 defer_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d1v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 defer_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d1v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 defer_shutdown 0 paused_for_shutdown 0 is_shut_down 0
> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> (XEN) grant_table.c:3702:d0v1 Grant release 0x3 ref 0x125 flags 0x2 d6
> (XEN) grant_table.c:3702:d0v1 Grant release 0x4 ref 0x126 flags 0x2 d6
> (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 1 defer_shutdown 1 paused_for_shutdown 0 is_shut_down 0

To me this is a clear indication that we did exit to guest context
with ->defer_shutdown set.

What I'm missing from your debugging patch is logging when the
default case of the first switch() in hvmemul_do_io() gets hit. I
think I said yesterday that I consider this a fair candidate of
where the X86EMUL_UNHANDLEABLE is coming from.

On top of that, with what we've sort of learned today, could you
log (or worse) any instances of handle_pio() getting called with
->defer_shutdown set? Afaict this should never happen, but you
may hit this case earlier than for the call out of the VMEXIT
handler, which would then move us closer to the root of the issue.

With "(or worse)" I mean it could also be as heavy as BUG(), ...

> Regarding BUG/WARN - do you think I could get any more info then? I
> really don't mind crashing that system, it's a virtual machine
> currently used only for debugging this issue.

... and the selection here really depends on what overall impact
you expect. I.e. I'm with Andrew that BUG() may be the construct
of choice if otherwise you get overly much output. In other cases
it may allow you to hit the same case again, with perhaps
slightly changed other state, giving further hints on where the
issue starts.

One thing that's not clear to me here: In the title you say
handle_pio() loops, but with the domain getting crashed I can't
seem to see that happening. Of course it may be a wrong
understanding /interpretation of mine that it is the guest doing
repeated I/O from/to port 0xb004.

Jan

