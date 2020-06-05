Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B591EFEB4
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 19:24:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhG4u-0002wR-RP; Fri, 05 Jun 2020 17:24:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ATx=7S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jhG4u-0002wM-5R
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 17:24:24 +0000
X-Inumbo-ID: 6590409e-a751-11ea-9b55-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6590409e-a751-11ea-9b55-bc764e2007e4;
 Fri, 05 Jun 2020 17:24:23 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id q19so10944790eja.7
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2020 10:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=8eLGDaE2XLi27z8fzgPAYcToiV0jQlX2Lg21+woM5JA=;
 b=dzlMCInXR+hsGh/KFpGe8Yj7ALi9nxpEGL/Sc6CGwu2i150JBtYSzJYdpMH2PKTZ86
 C9UWEZWflGjZL36e/LdpkGnynMtzvncxsAiCE3RqsFyftSUvmR6NEgFz7eQcAjEa9SHY
 OiG/NqGlHqSgRQMfYO1KVg3IY/ET7qNtmK6Utxc5SC+Mi2VDvzzUNg3fo3yqCUipeNLd
 OqCDzjvXrPIFFyAT03SCkgKDllRs5tKZelKztpFMY1NQ+UP0QIKeTxbNebMlgIfX9cGF
 DBufE/96DlPwgBGEkDhNDKohmAsbuhkwJ+YURcHQjsw95V5w0qp6gdpFtEgKJlkkPjbj
 OJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=8eLGDaE2XLi27z8fzgPAYcToiV0jQlX2Lg21+woM5JA=;
 b=tfVdx+ofYotFKKPmlM/kv+1Vjt0jrCfS5oTA8TyMUqSb/vVuaFHiLsgvKxiqW/UAh7
 ez/ky5gOLldSFZq2RdNbqR+g29gYyAv6f/Z+g6/HVNDYlCJZR9L+SomDJgh4W7HLqRvJ
 6zVaj4ySWiQLafjJYkoyY/Zc3b6YxrYRcJ5Imjb54Nv+lWis8r28l4Pg0tsiIytX7OZZ
 lj8Qw03CSMrDl1cq9v+X7y2tfGKO1eEgHUlMZOz0DNRCvFiRntZee7t17o4F87MuD502
 qSO86ce6dMpDrnYOn1feverHd7htzXcdu77vhv98CRAurUD9CNVORQV1+teNyYj7RAi1
 OX1Q==
X-Gm-Message-State: AOAM5317cpL+FegTx9zVboO8IDYEeTI/fY75JaI88ApNXU4nnZyLV2vh
 42WOk0mRlHocCwiRYE+DRYE=
X-Google-Smtp-Source: ABdhPJwqL3w7eV5o8Ut3HDA7zwzSzA6arN2kJ+b1XSSk4gnWzibiwxng2vQ6DYXuu+edpUEpJsxKTg==
X-Received: by 2002:a17:906:aec5:: with SMTP id
 me5mr10315505ejb.54.1591377862254; 
 Fri, 05 Jun 2020 10:24:22 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.185])
 by smtp.gmail.com with ESMTPSA id cx13sm5190752edb.20.2020.06.05.10.24.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jun 2020 10:24:21 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
References: <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
 <000701d63b2c$10536930$30fa3b90$@xen.org>
 <0296d5d6-cc7f-6e34-2403-acf34b870b5b@suse.com>
 <002101d63b3f$4e9dc830$ebd95890$@xen.org>
 <e2b8dd67-59c2-7e59-36f6-ce30b2df8b86@suse.com>
 <002201d63b40$1e135ee0$5a3a1ca0$@xen.org>
 <002f01d63b50$c8b49a70$5a1dcf50$@xen.org> <20200605171353.GG6329@mail-itl>
In-Reply-To: <20200605171353.GG6329@mail-itl>
Subject: RE: handle_pio looping during domain shutdown,
 with qemu 4.2.0 in stubdom
Date: Fri, 5 Jun 2020 18:24:20 +0100
Message-ID: <001501d63b5e$26a991a0$73fcb4e0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQKwWBDknGIax7CaUQXMyxrtt3nV1QHivRJwAUZxxQAClbGaTgD0KkheAp3cNn8CbNqNYgH2h+l1AmkAS7ICMiY5xQHIW8HVpnVMnNA=
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
> Sent: 05 June 2020 18:14
> To: paul@xen.org
> Cc: 'Jan Beulich' <jbeulich@suse.com>; 'Andrew Cooper' =
<andrew.cooper3@citrix.com>; 'xen-devel' <xen-
> devel@lists.xenproject.org>
> Subject: Re: handle_pio looping during domain shutdown, with qemu =
4.2.0 in stubdom
>=20
> On Fri, Jun 05, 2020 at 04:48:39PM +0100, Paul Durrant wrote:
> > This (untested) patch might help:
>=20
> It is different now. I don't get domain_crash because of
> X86EMUL_UNHANDLEABLE anymore, but I still see handle_pio looping for
> some time. But it eventually ends, not really sure why.

That'll be the shutdown deferral, which I realised later that I forgot =
about...

>=20
> I've tried the patch with a modification to make it build:
>=20
> > diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
> > index c55c4bc4bc..8aa8779ba2 100644
> > --- a/xen/arch/x86/hvm/ioreq.c
> > +++ b/xen/arch/x86/hvm/ioreq.c
> > @@ -109,12 +109,7 @@ static void hvm_io_assist(struct hvm_ioreq_vcpu =
*sv, uint64_t data)
> >      ioreq_t *ioreq =3D &v->arch.hvm.hvm_io.io_req;
> >
> >      if ( hvm_ioreq_needs_completion(ioreq) )
> > -    {
> > -        ioreq->state =3D STATE_IORESP_READY;
> >          ioreq->data =3D data;
> > -    }
> > -    else
> > -        ioreq->state =3D STATE_IOREQ_NONE;
> >
> >      msix_write_completion(v);
> >      vcpu_end_shutdown_deferral(v);

In fact, move both of these lines...

> > @@ -209,6 +204,9 @@ bool handle_hvm_io_completion(struct vcpu *v)
> >          }
> >      }
> >
> > +    ioreq->state =3D hvm_ioreq_needs_completion(&vio->ioreq) ?
>        vio->io_req->state ... &vio->io_req
>=20
> > +        STATE_IORESP_READY : STATE_IOREQ_NONE;
> > +

... to here too.

> >      io_completion =3D vio->io_completion;
> >      vio->io_completion =3D HVMIO_no_completion;
> >
>=20
> The full patch (together with my debug prints):
> https://gist.github.com/marmarek/da37da3722179057a6e7add4fb361e06
>=20
> Note some of those X86EMUL_UNHANDLEABLE logged below are about an
> intermediate state, not really hvmemul_do_io return value.
>=20
> And the log:
> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
> (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) emulate.c:263:d3v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from =
hvm_io_intercept req state 1
> (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d3v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) emulate.c:263:d3v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from =
hvm_io_intercept req state 1
> (XEN) d3v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) emulate.c:263:d3v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from =
hvm_io_intercept req state 1
> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
> (XEN) d4v0 hvm_destroy_ioreq_server called for 3, id 0
> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
> (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) emulate.c:263:d1v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from =
hvm_io_intercept req state 1
> (XEN) d1v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d1v0 handle_pio port 0xb004 write 0x0001 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) emulate.c:263:d1v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from =
hvm_io_intercept req state 1
> (XEN) d1v0 handle_pio port 0xb004 write 0x2001 is_shutting_down 0 =
defer_shutdown 0 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) emulate.c:263:d1v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from =
hvm_io_intercept req state 1
> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
> (XEN) grant_table.c:3702:d0v0 Grant release 0x24 ref 0x199 flags 0x2 =
d5
> (XEN) grant_table.c:3702:d0v0 Grant release 0x25 ref 0x19a flags 0x2 =
d5
> (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags 0x2 d6
> (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags 0x2 d6
> (XEN) d3v0 handle_pio port 0xb004 read 0x0000 is_shutting_down 1 =
defer_shutdown 1 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) emulate.c:263:d3v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from =
hvm_io_intercept req state 1
> (XEN) d3v0 handle_pio port 0xb004 write 0xe3f8 is_shutting_down 1 =
defer_shutdown 1 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) emulate.c:263:d3v0 hvmemul_do_io got X86EMUL_UNHANDLEABLE from =
hvm_io_intercept req state 1
> (XEN) d3v0 handle_pio port 0xb000 read 0x0000 is_shutting_down 1 =
defer_shutdown 1 paused_for_shutdown
> 0 is_shut_down 0
> (XEN) d3v0 handle_pio port 0xb000 read 0x0000 is_shutting_down 1 =
defer_shutdown 1 paused_for_shutdown
> 0 is_shut_down 0
>=20
> The last one repeats for some time, like 30s or some more (18425 =
times).
> Note the port is different than before. Is it a guest waiting for =
being
> destroyed after requesting so?
>=20

I guess it is the destroy being held off by the shutdown deferral? =
Hopefully the above tweaks should sort that out.

  Paul

> --
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?


