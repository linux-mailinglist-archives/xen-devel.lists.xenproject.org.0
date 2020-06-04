Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6023D1EDDA7
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 09:09:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgjzm-0005Bk-4u; Thu, 04 Jun 2020 07:08:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jgjzk-0005Be-SE
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 07:08:56 +0000
X-Inumbo-ID: 40ecd56a-a632-11ea-ae22-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 40ecd56a-a632-11ea-ae22-12813bfff9fa;
 Thu, 04 Jun 2020 07:08:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A0B66AD4A;
 Thu,  4 Jun 2020 07:08:58 +0000 (UTC)
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20200604014621.GA203658@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
Date: Thu, 4 Jun 2020 09:08:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200604014621.GA203658@mail-itl>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.06.2020 03:46, Marek Marczykowski-Górecki wrote:
> During system shutdown quite often I hit infinite stream of errors like
> this:
> 
>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
>     (XEN) domain_crash called from io.c:178
> 
> This is all running on Xen 4.13.0 (I think I've got this with 4.13.1
> too), nested within KVM. The KVM part means everything is very slow, so
> various race conditions are much more likely to happen.
> 
> It started happening not long ago, and I'm pretty sure it's about
> updating to qemu 4.2.0 (in linux stubdom), previous one was 3.0.0.
> 
> Thanks to Andrew and Roger, I've managed to collect more info.
> 
> Context:
>     dom0: pv
>     dom1: hvm
>     dom2: stubdom for dom1
>     dom3: hvm
>     dom4: stubdom for dom3
>     dom5: pvh
>     dom6: pvh
> 
> It starts I think ok:
> 
>     (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>     (XEN) d3v0 handle_pio port 0xb004 write 0x0001
>     (XEN) d3v0 handle_pio port 0xb004 write 0x2001
>     (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
>     (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
>     (XEN) d1v0 handle_pio port 0xb004 read 0x0000
>     (XEN) d1v0 handle_pio port 0xb004 read 0x0000
>     (XEN) d1v0 handle_pio port 0xb004 write 0x0001
>     (XEN) d1v0 handle_pio port 0xb004 write 0x2001
>     (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> 
> But then (after a second or so) when the toolstack tries to clean it up,
> things go sideways:
> 
>     (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6
>     (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6 got domain_lock
>     (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6 ret -85
>     (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6
>     (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6 got domain_lock
>     (XEN) d0v0 XEN_DOMCTL_destroydomain domain 6 ret -85
>     (... long stream of domain destroy that can't really finish ...)
>     
> And then, similar also for dom1:
> 
>     (XEN) d0v1 XEN_DOMCTL_destroydomain domain 1
>     (XEN) d0v1 XEN_DOMCTL_destroydomain domain 1 got domain_lock
>     (XEN) d0v1 XEN_DOMCTL_destroydomain domain 1 ret -85
>     (... now a stream of this for dom1 and dom6 interleaved ...)
> 
> At some point, domain 2 (stubdom for domain 1) and domain 5 join too. 

What makes you think this is an indication of things going sideways?
-85 is -ERESTART, which is quite normal to see for a period of time
while cleaning up a domain.

> Then, we get the main issue:
> 
>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
>     (XEN) domain_crash called from io.c:178
> 
> Note, there was no XEN_DOMCTL_destroydomain for domain 3 nor its stubdom
> yet. But XEN_DMOP_remote_shutdown for domain 3 was called already.

I'd guess an issue with the shutdown deferral logic. Did you / can
you check whether XEN_DMOP_remote_shutdown managed to pause all
CPUs (I assume it didn't, since once they're paused there shouldn't
be any I/O there anymore, and hence no I/O emulation)?

Another question though: In 4.13 the log message next to the
domain_crash() I assume you're hitting is "Weird HVM ioemulation
status", not "Weird PIO status", and the debugging patch you
referenced doesn't have any change there. Andrew's recent
change to master, otoh, doesn't use the word "weird" anymore. I
can therefore only guess that the value logged is still
hvmemul_do_pio_buffer()'s return value, i.e. X86EMUL_UNHANDLEABLE.
Please confirm.

Jan

