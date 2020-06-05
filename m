Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D411EF8EB
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 15:24:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhCKQ-0002LT-L9; Fri, 05 Jun 2020 13:24:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ATx=7S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jhCKP-0002LO-Bd
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 13:24:09 +0000
X-Inumbo-ID: d59d5fc4-a72f-11ea-9ad7-bc764e2007e4
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d59d5fc4-a72f-11ea-9ad7-bc764e2007e4;
 Fri, 05 Jun 2020 13:24:08 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y20so1387735wmi.2
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 06:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=Bbfs/rhLlMur6P/6rL8uZWFD5SdAbhUlixtrc25R3jE=;
 b=ID1GphIsNI+cdg3iyJOSme9h2G0y3+xWbw/mhQj+4wN0Fic+T4RrwVjuu1JH4tuSQa
 7tn8rqpddmUlkmH2F35w9Txs1skA04zJ8a4ds0bk8a4TlxZ0yKj2FYYE+vQpVV/LPfUn
 4kkH1nqd/QYRjQr98AAL3MWNIKETl7b3FUvxHUEkhO9r6WAcqXwqTyfPF5FSdRokNVgP
 k0Aomuz346LJCnUrhbf8sxu0xaEpoqqP2b4hTrl44VKXqk+SX4EO6qUPhmNF9yqGm95C
 RrlvPE3bCXFzyBEFmo07ONCW5us2BTM0HrVmU1b0ZMmfzodlVCR+vlDxi3ixmnA+IaDJ
 GJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=Bbfs/rhLlMur6P/6rL8uZWFD5SdAbhUlixtrc25R3jE=;
 b=HHDOYeTlm3n/WKg1fOv9wGPHa+ltYk/cPrWT2iyYrtDEPdqDnRe7IOzORnUaFAd0ru
 MMYsJMOunE5hgz7wcAhNtCWj7VXaof8gNTgkwyxT7kKf6RN68p33av9pT81ADDcc+Dj8
 2GK1urVZnW6KGXrkKj3y1fWX1ZM4RlnxIkGpb9Cj89T7DWJ9ofVL2jVob2NjcRyPjcCS
 nTQ9wEvXX3w2oCdGe1u2XrA3J1gOozPWgKy4WX24RNW5tEUjYcJsVaszm/7AyextSSGz
 4guC3EnH/KaOH0zn8bJo/TeWcCAjDYk9o5t8vWCJMWqyYGmZMqz70Cqw8vA3Es0kOSuc
 wr3w==
X-Gm-Message-State: AOAM532bK5QhoNqeYi586pqfAXDG5KOSm7QiFzQ5cScyHzG/s1owip2h
 VreoCISnb9h22SHLdQJ7rvA=
X-Google-Smtp-Source: ABdhPJwxOXwwKDoILiKrM+sJfKdDv+NTPW0aDulH+I7j5VnmZPawysucbRGQxEJIag/TDrIk6zxmaw==
X-Received: by 2002:a1c:790a:: with SMTP id l10mr2547618wme.80.1591363447413; 
 Fri, 05 Jun 2020 06:24:07 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id h7sm11204560wml.24.2020.06.05.06.24.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 06:24:06 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?UTF-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <f22ce6e0-d80b-2fc3-586a-c030fa22b3e8@suse.com>
 <20200605120137.GF98582@mail-itl> <000a01d63b36$5ca617b0$15f24710$@xen.org>
 <20200605130408.GI98582@mail-itl>
In-Reply-To: <20200605130408.GI98582@mail-itl>
Subject: RE: handle_pio looping during domain shutdown,
 with qemu 4.2.0 in stubdom
Date: Fri, 5 Jun 2020 14:24:05 +0100
Message-ID: <001f01d63b3c$96ce3020$c46a9060$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGjLdCXHS+ot6864srdbAQDyQsvoACJ30jDAXuEodcCsFgQ5AHivRJwAUZxxQABFk5KigGiA5kJAgWY+ZMB7ft0Fai7xl2w
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
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: 'Marek Marczykowski-G=C3=B3recki' =
<marmarek@invisiblethingslab.com>
> Sent: 05 June 2020 14:04
> To: paul@xen.org
> Cc: 'Jan Beulich' <jbeulich@suse.com>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'xen-devel' <xen-
> devel@lists.xenproject.org>
> Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
>=20
> On Fri, Jun 05, 2020 at 01:39:31PM +0100, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Marek Marczykowski-G=C3=B3recki =
<marmarek@invisiblethingslab.com>
> > > Sent: 05 June 2020 13:02
> > > To: Jan Beulich <jbeulich@suse.com>
> > > Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant =
<paul@xen.org>; xen-devel <xen-
> > > devel@lists.xenproject.org>
> > > Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
> > >
> > > On Fri, Jun 05, 2020 at 11:22:46AM +0200, Jan Beulich wrote:
> > > > On 05.06.2020 11:09, Jan Beulich wrote:
> > > > > On 04.06.2020 16:25, Marek Marczykowski-G=C3=B3recki wrote:
> > > > >> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> > > > >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > > > >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > > > >> (XEN) d3v0 handle_pio port 0xb004 write 0x0001
> > > > >> (XEN) d3v0 handle_pio port 0xb004 write 0x2001
> > > > >> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> > > > >> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown =
1
> > > > >> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> > > > >> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> > > > >> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> > > > >> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> > > > >> (XEN) d1v0 handle_pio port 0xb004 write 0x0001
> > > > >> (XEN) d1v0 handle_pio port 0xb004 write 0x2001
> > > > >> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> > > > >> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown =
1
> > > > >> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> > > > >> (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d =
flags 0x2 d6
> > > > >> (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e =
flags 0x2 d6
> > > > >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > > > >
> > > > > Perhaps in this message could you also log
> > > > > v->domain->is_shutting_down, v->defer_shutdown, and
> > > > > v->paused_for_shutdown?
> > > >
> > > > And v->domain->is_shut_down please.
> > >
> > > Here it is:
> > >
> > > (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> > > (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0
> paused_for_shutdown
> > > 0 is_shut_down 0
> > > (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0
> paused_for_shutdown
> > > 0 is_shut_down 0
> > > (XEN) d3v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 =
defer_shutdown 0
> paused_for_shutdown
> > > 0 is_shut_down 0
> > > (XEN) d3v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 =
defer_shutdown 0
> paused_for_shutdown
> > > 0 is_shut_down 0
> > > (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> > > (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> > > (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> > > (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> > > (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0
> paused_for_shutdown
> > > 0 is_shut_down 0
> > > (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0
> paused_for_shutdown
> > > 0 is_shut_down 0
> > > (XEN) d1v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 =
defer_shutdown 0
> paused_for_shutdown
> > > 0 is_shut_down 0
> > > (XEN) d1v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 =
defer_shutdown 0
> paused_for_shutdown
> > > 0 is_shut_down 0
> > > (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> > > (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> > > (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> > > (XEN) grant_table.c:3702:d0v1 Grant release 0x3 ref 0x125 flags =
0x2 d6
> > > (XEN) grant_table.c:3702:d0v1 Grant release 0x4 ref 0x126 flags =
0x2 d6
> > > (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 1 =
defer_shutdown 1
> paused_for_shutdown
> > > 0 is_shut_down 0
> > > (XEN) d1v0 Unexpected PIO status 1, port 0xb004 read 0xffff
> > >
> > > (and then the stacktrace saying it's from vmexit handler)
> > >
> > > Regarding BUG/WARN - do you think I could get any more info then? =
I
> > > really don't mind crashing that system, it's a virtual machine
> > > currently used only for debugging this issue.
> >
> > In your logging, is that handle_pio with is_shutting_down =3D=3D 1 =
the very last one, or is the
> 'Unexpected PIO' coming from another one issued afterwards?
>=20
> That's the same function call - handle_pio message is before =
hvmemul_do_pio_buffer() and Unexpected
> PIO is after.
>=20
> Here is the current debugging patch: =
https://gist.github.com/marmarek/da37da3722179057a6e7add4fb361e06
>=20

Ok.

> > The reason I ask is that hvmemul_do_io() can call hvm_send_ioreq() =
to start an I/O when
> is_shutting_down is set, but will write the local io_req.state back to =
NONE even when X86EMUL_RETRY is
> returned. Thus another call to handle_pio() will try to start a new =
I/O but will fail with
> X86EMUL_UNHANDLEABLE in hvm_send_ioreq() because the ioreq state in =
the shared page will not be NONE.
>=20
> Isn't it a problem that hvm_send_ioreq() can be called called if =
is_shutting_down is set?
>=20

I don't think so... as long as it is not called again a second time.

  Paul

> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?


