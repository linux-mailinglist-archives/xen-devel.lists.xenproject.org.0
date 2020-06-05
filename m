Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A6D1EF816
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 14:40:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhBdI-0005i6-Q4; Fri, 05 Jun 2020 12:39:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ATx=7S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jhBdH-0005i1-4g
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 12:39:35 +0000
X-Inumbo-ID: 9b956dea-a729-11ea-96fb-bc764e2007e4
Received: from mail-ej1-x631.google.com (unknown [2a00:1450:4864:20::631])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b956dea-a729-11ea-96fb-bc764e2007e4;
 Fri, 05 Jun 2020 12:39:34 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id x1so9912624ejd.8
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 05:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=y7ZbTDjEZID7JxufTackG+ISWZQimmY0w3U+s6CBkyE=;
 b=EWfydwxVB/wul9AW4p/QELCnc2/P3WDDLQuUvMu7AfbRwLgSoxluX5UIKcnf4Y0PZ9
 ETEc1lJqnB3oNZBBlbBW+QB9+FN9oAdyaDk7q2yUgszcn6K8IX3g6zJ+7ld6Ar5qc4uv
 7kFKuKNelRcONh0XExIwWC+l9xZdaTbVBopJ9KrmhmkwOegJG27OliSiCeEfuNQctdnl
 5vZ2g8/6J4J6Mq9YDOWQs803UzqrKb+TInyqmF55XGF4UfN2x0HjbzGoGgMjsTN6wQu5
 QeU68hUSipAzB7qqD3+W29euCcXbbXXUJiyO/3F5n0dsq8vbak97h+j6VGkAWEC40oZo
 KBdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=y7ZbTDjEZID7JxufTackG+ISWZQimmY0w3U+s6CBkyE=;
 b=Lb1DpF7U+B39H69yUR+113f/03+1oj+qHkS7u2kCwEEObjjPaxGgBSgZr/jfbmB7eZ
 7v0PR/jM2ot68QMkAgEqcqclnIxk3g6Oa0HTDUJTAmkpIeKR1yoTCZq597xEfCmG7PPY
 K0vAzhKmNtObvUGRUY1duuW+JLMWx+PRth+iqwBWXPvXVxMi/gwSmwohxgy4pxv81kfF
 XHqku155I0Bao9bm0kV0oxGPhcjZ5DjomoMT3w9T9FfkyS/5UCmW5wlt6BQKsKypHLoe
 iOh+/vw1tsKGGEE9oXVZLjM29AUqxjhOsxhBM5WYKID1l6LenYw0E81RDhtg1rewaSba
 3poA==
X-Gm-Message-State: AOAM5325QJgWFEYYLHLzSQ5fIjwtwcHMSiISGKy0XSMnfXoKocmYD+B/
 S0oYPLQWhYjWcz7z1wTrq4Q=
X-Google-Smtp-Source: ABdhPJyTBVepzEaY8my0WQ673//qu/a4aJneftnfwoNtAPln1tJetBBmH4zhrMK8FCL31hifokXQtQ==
X-Received: by 2002:a17:907:9486:: with SMTP id
 dm6mr8860641ejc.248.1591360773031; 
 Fri, 05 Jun 2020 05:39:33 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id f13sm4741774edk.36.2020.06.05.05.39.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 05:39:32 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?UTF-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>, "'Jan Beulich'" <jbeulich@suse.com>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <f22ce6e0-d80b-2fc3-586a-c030fa22b3e8@suse.com>
 <20200605120137.GF98582@mail-itl>
In-Reply-To: <20200605120137.GF98582@mail-itl>
Subject: RE: handle_pio looping during domain shutdown,
 with qemu 4.2.0 in stubdom
Date: Fri, 5 Jun 2020 13:39:31 +0100
Message-ID: <000a01d63b36$5ca617b0$15f24710$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQGjLdCXHS+ot6864srdbAQDyQsvoACJ30jDAXuEodcCsFgQ5AHivRJwAUZxxQABFk5KigGiA5kJqNtVkMA=
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
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Marek Marczykowski-G=C3=B3recki =
<marmarek@invisiblethingslab.com>
> Sent: 05 June 2020 13:02
> To: Jan Beulich <jbeulich@suse.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; Paul Durrant =
<paul@xen.org>; xen-devel <xen-
> devel@lists.xenproject.org>
> Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
>=20
> On Fri, Jun 05, 2020 at 11:22:46AM +0200, Jan Beulich wrote:
> > On 05.06.2020 11:09, Jan Beulich wrote:
> > > On 04.06.2020 16:25, Marek Marczykowski-G=C3=B3recki wrote:
> > >> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> > >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > >> (XEN) d3v0 handle_pio port 0xb004 write 0x0001
> > >> (XEN) d3v0 handle_pio port 0xb004 write 0x2001
> > >> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> > >> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> > >> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> > >> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> > >> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> > >> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
> > >> (XEN) d1v0 handle_pio port 0xb004 write 0x0001
> > >> (XEN) d1v0 handle_pio port 0xb004 write 0x2001
> > >> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> > >> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> > >> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> > >> (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags =
0x2 d6
> > >> (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags =
0x2 d6
> > >> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> > >
> > > Perhaps in this message could you also log
> > > v->domain->is_shutting_down, v->defer_shutdown, and
> > > v->paused_for_shutdown?
> >
> > And v->domain->is_shut_down please.
>=20
> Here it is:
>=20
> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d3v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d3v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d1v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d1v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> (XEN) grant_table.c:3702:d0v1 Grant release 0x3 ref 0x125 flags 0x2 d6
> (XEN) grant_table.c:3702:d0v1 Grant release 0x4 ref 0x126 flags 0x2 d6
> (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 1 =
defer_shutdown 1 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d1v0 Unexpected PIO status 1, port 0xb004 read 0xffff
>=20
> (and then the stacktrace saying it's from vmexit handler)
>=20
> Regarding BUG/WARN - do you think I could get any more info then? I
> really don't mind crashing that system, it's a virtual machine
> currently used only for debugging this issue.

In your logging, is that handle_pio with is_shutting_down =3D=3D 1 the =
very last one, or is the 'Unexpected PIO' coming from another one issued =
afterwards?

The reason I ask is that hvmemul_do_io() can call hvm_send_ioreq() to =
start an I/O when is_shutting_down is set, but will write the local =
io_req.state back to NONE even when X86EMUL_RETRY is returned. Thus =
another call to handle_pio() will try to start a new I/O but will fail =
with X86EMUL_UNHANDLEABLE in hvm_send_ioreq() because the ioreq state in =
the shared page will not be NONE.

  Paul

>=20
> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?


