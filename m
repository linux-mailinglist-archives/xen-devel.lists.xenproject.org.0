Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4D51F1733
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 13:05:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiFaA-0007tR-Bl; Mon, 08 Jun 2020 11:04:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9p0X=7V=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jiFa8-0007tF-2O
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 11:04:44 +0000
X-Inumbo-ID: db054478-a977-11ea-ba62-bc764e2007e4
Received: from mail-ej1-x634.google.com (unknown [2a00:1450:4864:20::634])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id db054478-a977-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 11:04:43 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id o15so17759715ejm.12
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2020 04:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=oe+Kg0COLUqXFiNWFWGG0EXTH5E4ua+SFmXiIQISts8=;
 b=JKs5NYY2s+6bFNILOdZ2s3n6SimQB4olCnbElvgHpFHvq+dwHgLZbOADrjyPJV369q
 cRjlH/djIpNVY3pkuvLC1ihVXBk2YN+wENJa+yLx7zfByByWlojlWus6jqnpv6eGvkKO
 WX9qu2K6Si4tWIpYeEBWY4aDQHHSDMr0+afrPiO7uyCkxKh8THMFNh20IW5CZaiTUz1L
 pyTq/sznJK6sEKkOLBArTpKGLDkZKdu69NCxjuabjbbAHl14IvOncN2lxlJY5z9KLgAZ
 5Fpt4SnLwKtbWyNj3AcMJGmGNOY3NiVVAs4mNBIj23wr6ms6+h4LEg6mj1Vm4JUyBubp
 kuNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=oe+Kg0COLUqXFiNWFWGG0EXTH5E4ua+SFmXiIQISts8=;
 b=IJn/i1jI7RDa0HRWSSdONqdP/D71vTMy9Gb93qV530XP7BEfph0MrDogrw42lHsdxn
 e7EMrA5A2aj9H+rPZdsvThufh5cEMp3884E+j4uYJonVJulL97Zpj9gX/A03ObfKLv9g
 p8PC54SzKQMIWLfqkYlhzzBDwf7VLfytgPFD0e1md0tvPJoSC5CrZYebU2Bq5tleBNe+
 w46cu8NpqJd8+VRdjp33CUWanZS65/Dcha4f37TDmkUcvvquNqP7AtH37SUmhSJQvoBq
 8EbqEypEXbJhZd64sFO0NFGjJp0pUHAFmoQiSJw6wMVnXliDAoEi5wgKtDSaYH1cwUhV
 FCkg==
X-Gm-Message-State: AOAM531+wFTxEpGkLCH81VVuon/OSaqVIczuJY7Io9Kvgsel51ZJiaDn
 8eke/yCvaAMtt2+X/aoC3Qk=
X-Google-Smtp-Source: ABdhPJyj+owR/BlOqaoUjGJi9cIQfH9TfxaActgh5dD9eKQM4FeyIH0U9SPF7vh756LA21MmuYMIZQ==
X-Received: by 2002:a17:906:198d:: with SMTP id
 g13mr19850681ejd.281.1591614282569; 
 Mon, 08 Jun 2020 04:04:42 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.187])
 by smtp.gmail.com with ESMTPSA id cx13sm12224104edb.20.2020.06.08.04.04.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 04:04:42 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Jan Beulich'" <jbeulich@suse.com>
References: <20200608094619.28336-1-paul@xen.org>
 <4d63c9c7-f4e8-4c56-7778-df17b3c5254b@suse.com>
In-Reply-To: <4d63c9c7-f4e8-4c56-7778-df17b3c5254b@suse.com>
Subject: RE: [PATCH-for-4.14] ioreq: handle pending emulation racing with
 ioreq server destruction
Date: Mon, 8 Jun 2020 12:04:40 +0100
Message-ID: <002a01d63d84$9c351430$d49f3c90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQG4RzFDVM83uzCFIZn1YivdDmazZAHQan7RqPv2BqA=
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
Cc: xen-devel@lists.xenproject.org, 'Paul Durrant' <pdurrant@amazon.com>,
 =?utf-8?Q?'Marek_Marczykowski-G=C3=B3recki'?=
 <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Jan Beulich <jbeulich@suse.com>
> Sent: 08 June 2020 11:58
> To: Paul Durrant <paul@xen.org>
> Cc: xen-devel@lists.xenproject.org; Paul Durrant =
<pdurrant@amazon.com>; Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com>
> Subject: Re: [PATCH-for-4.14] ioreq: handle pending emulation racing =
with ioreq server destruction
>=20
> On 08.06.2020 11:46, Paul Durrant wrote:
> > From: Paul Durrant <pdurrant@amazon.com>
> >
> > When an emulation request is initiated in hvm_send_ioreq() the guest =
vcpu is
> > blocked on an event channel until that request is completed. If, =
however,
> > the emulator is killed whilst that emulation is pending then the =
ioreq
> > server may be destroyed. Thus when the vcpu is awoken the code in
> > handle_hvm_io_completion() will find no pending request to wait for, =
but will
> > leave the internal vcpu io_req.state set to IOREQ_READY and the vcpu =
shutdown
> > deferall flag in place (because hvm_io_assist() will never be =
called). The
> > emulation request is then completed anyway. This means that any =
subsequent call
> > to hvmemul_do_io() will find an unexpected value in io_req.state and =
will
> > return X86EMUL_UNHANDLEABLE, which in some cases will result in =
continuous
> > re-tries.
> >
> > This patch fixes the issue by moving the setting of io_req.state and =
clearing
> > of shutdown deferral (as will as MSI-X write completion) out of =
hvm_io_assist()
> > and directly into handle_hvm_io_completion().
> >
> > Reported-by: Marek Marczykowski-G=C3=B3recki =
<marmarek@invisiblethingslab.com>
> > Signed-off-by: Paul Durrant <pdurrant@amazon.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with a question:
>=20
> > --- a/xen/arch/x86/hvm/ioreq.c
> > +++ b/xen/arch/x86/hvm/ioreq.c
> > @@ -109,15 +109,7 @@ static void hvm_io_assist(struct hvm_ioreq_vcpu =
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
> > -
> > -    msix_write_completion(v);
> > -    vcpu_end_shutdown_deferral(v);
> >
> >      sv->pending =3D false;
> >  }
>=20
> With this, is the function worth keeping at all?

I did think about that, but it is called in more than one place. So, in =
the interest of trying to make back-porting straightforward, I thought =
it best to keep it simple.

>=20
> Also I assume the patch has your implied R-a-b?
>=20

Since it has your R-b now, yes :-)

  Paul



