Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A1A31EE310
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 13:14:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgnoD-0004WY-Nn; Thu, 04 Jun 2020 11:13:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NfFn=7R=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jgnoC-0004WT-FG
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 11:13:16 +0000
X-Inumbo-ID: 6234bd4c-a654-11ea-8993-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6234bd4c-a654-11ea-8993-bc764e2007e4;
 Thu, 04 Jun 2020 11:13:14 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: oDor9dntqjX/CZq4EOWuvzz9MMJkD1I0M0gt1qCcqHU8OYVP/SXpQfJUsnrYO80Au6Z92f+w7x
 QGsytnEB2UhRDZmMNQO1Y68PX/sPqhaAnkKn51Kb6NxsQ1Mb8wsSZe8HkZOoVtRyEfUug/RxsX
 /tjKRvMNCQHdi5gRfSjXcKcl05ZzxHdtE/N7ThPYcvnejsDuLLHAxlsUNHZD1vb0bR8cr0X96b
 J56Rr4V4xod7gtciHGhqDVDpwdZgJNaTxMS20JoCSuJLKu8kDP0OR8dGgK0e48n/w01py8m+C5
 ng4=
X-SBRS: 2.7
X-MesageID: 19460865
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,472,1583211600"; d="scan'208,217";a="19460865"
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
Date: Thu, 4 Jun 2020 12:13:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
Content-Type: multipart/alternative;
 boundary="------------DCC7A6CAB5EFD944658332FB"
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

--------------DCC7A6CAB5EFD944658332FB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On 04/06/2020 08:08, Jan Beulich wrote:
> On 04.06.2020 03:46, Marek Marczykowski-Górecki wrote:
>> Then, we get the main issue:
>>
>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
>>     (XEN) domain_crash called from io.c:178
>>
>> Note, there was no XEN_DOMCTL_destroydomain for domain 3 nor its stubdom
>> yet. But XEN_DMOP_remote_shutdown for domain 3 was called already.
> I'd guess an issue with the shutdown deferral logic. Did you / can
> you check whether XEN_DMOP_remote_shutdown managed to pause all
> CPUs (I assume it didn't, since once they're paused there shouldn't
> be any I/O there anymore, and hence no I/O emulation)?

The vcpu in question is talking to Qemu, so will have v->defer_shutdown
intermittently set, and skip the pause in domain_shutdown()

I presume this lack of pause is to allow the vcpu in question to still
be scheduled to consume the IOREQ reply?  (Its fairly opaque logic with
0 clarifying details).

What *should* happen is that, after consuming the reply, the vcpu should
notice and pause itself, at which point it would yield to the
scheduler.  This is the purpose of vcpu_{start,end}_shutdown_deferral().

Evidentially, this is not happening.

Marek: can you add a BUG() after the weird PIO printing?  That should
confirm whether we're getting into handle_pio() via the
handle_hvm_io_completion() path, or via the vmexit path (at which case,
we're fully re-entering the guest).

I suspect you can drop the debugging of XEN_DOMCTL_destroydomain - I
think its just noise atm.

However, it would be very helpful to see the vcpus which fall into
domain_shutdown()'s "else if ( v->defer_shutdown ) continue;" path.

> Another question though: In 4.13 the log message next to the
> domain_crash() I assume you're hitting is "Weird HVM ioemulation
> status", not "Weird PIO status", and the debugging patch you
> referenced doesn't have any change there. Andrew's recent
> change to master, otoh, doesn't use the word "weird" anymore. I
> can therefore only guess that the value logged is still
> hvmemul_do_pio_buffer()'s return value, i.e. X86EMUL_UNHANDLEABLE.
> Please confirm.

It's the first draft of the patch which I did, before submitting to
xen-devel.  We do have X86EMUL_UNHANDLEABLE at this point, but its not
terribly helpful - there are loads of paths which fail silently with
this error.

~Andrew

--------------DCC7A6CAB5EFD944658332FB
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 04/06/2020 08:08, Jan Beulich wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com">
      <pre class="moz-quote-pre" wrap="">On 04.06.2020 03:46, Marek Marczykowski-Górecki wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Then, we get the main issue:

    (XEN) d3v0 handle_pio port 0xb004 read 0x0000
    (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
    (XEN) domain_crash called from io.c:178

Note, there was no XEN_DOMCTL_destroydomain for domain 3 nor its stubdom
yet. But XEN_DMOP_remote_shutdown for domain 3 was called already.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I'd guess an issue with the shutdown deferral logic. Did you / can
you check whether XEN_DMOP_remote_shutdown managed to pause all
CPUs (I assume it didn't, since once they're paused there shouldn't
be any I/O there anymore, and hence no I/O emulation)?</pre>
    </blockquote>
    <br>
    The vcpu in question is talking to Qemu, so will have
    v-&gt;defer_shutdown intermittently set, and skip the pause in
    domain_shutdown()<br>
    <br>
    I presume this lack of pause is to allow the vcpu in question to
    still be scheduled to consume the IOREQ reply?  (Its fairly opaque
    logic with 0 clarifying details).<br>
    <br>
    What *should* happen is that, after consuming the reply, the vcpu
    should notice and pause itself, at which point it would yield to the
    scheduler.  This is the purpose of
    vcpu_{start,end}_shutdown_deferral().<br>
    <br>
    Evidentially, this is not happening.<br>
    <br>
    Marek: can you add a BUG() after the weird PIO printing?  That
    should confirm whether we're getting into handle_pio() via the
    handle_hvm_io_completion() path, or via the vmexit path (at which
    case, we're fully re-entering the guest).<br>
    <br>
    I suspect you can drop the debugging of <span class="pl-mi1">XEN_DOMCTL_destroydomain
      - I think its just noise atm.<br>
      <br>
      However, it would be very helpful to see the vcpus which fall into
      domain_shutdown()'s "else if ( v-&gt;defer_shutdown ) continue;"
      path.<br>
    </span><br>
    <blockquote type="cite"
      cite="mid:4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com">
      <pre class="moz-quote-pre" wrap="">Another question though: In 4.13 the log message next to the
domain_crash() I assume you're hitting is "Weird HVM ioemulation
status", not "Weird PIO status", and the debugging patch you
referenced doesn't have any change there. Andrew's recent
change to master, otoh, doesn't use the word "weird" anymore. I
can therefore only guess that the value logged is still
hvmemul_do_pio_buffer()'s return value, i.e. X86EMUL_UNHANDLEABLE.
Please confirm.</pre>
    </blockquote>
    <br>
    It's the first draft of the patch which I did, before submitting to
    xen-devel.  We do have X86EMUL_UNHANDLEABLE at this point, but its
    not terribly helpful - there are loads of paths which fail silently
    with this error.<br>
    <br>
    ~Andrew<br>
  </body>
</html>

--------------DCC7A6CAB5EFD944658332FB--

