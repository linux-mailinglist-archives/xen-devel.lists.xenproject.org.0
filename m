Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E58E62138F9
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 12:53:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrJJK-0006gs-TL; Fri, 03 Jul 2020 10:52:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bw0N=AO=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jrJJJ-0006gn-R9
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 10:52:49 +0000
X-Inumbo-ID: 557656a0-bd1b-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 557656a0-bd1b-11ea-bb8b-bc764e2007e4;
 Fri, 03 Jul 2020 10:52:48 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id o11so32185459wrv.9
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2020 03:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=YRp1E5N2b9fcgKZLzvgbn7oU+J1uNarEF7+xE3/CSD4=;
 b=BsF77UDO6I/IVj8ZsItBsDuMQHJ/EQDAoXYaysu9iIarSxMYy/zLzR1JXrcUzbxmVu
 6JHQ1FkAXaup77oD6zbxmHAk9DuWfhCGDGQ9SRbJ+mUrSFggS/AT6Zzal86WLkd7VC9s
 4CeYaOWPDa8hQOsS8P6dec1keqvNr8d52ii69LosdpaXXwAjbxZFrVMw0KjUb1te7J7I
 2QTqd8Zbvw86T58pbMuF9bzAxoY2QEcjviQz99fJQrdvaRFBSEM8fIt+B2jrQOK3yYtX
 cRo6lMbqtr5Pt2On+ngI1amSmeRWau9qlsugbaDeKRLa1XuPN8pQLw2WqAwMyVMOvAys
 CiYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=YRp1E5N2b9fcgKZLzvgbn7oU+J1uNarEF7+xE3/CSD4=;
 b=lscodplzqjwh4ylNRcHmTJSOi6yq/fCjyT1XeXss+UM0+iC56FmyjADiPabRAPXPNg
 wX3HdHWcUlbml93vCvWsaZpk3iGivPhjmAZ6v8wfEf1jPhiIElIVpRAhbScNLt28Xlrv
 d0lTrZVgNrDanO/S/O2uOS5YkrBDQgOpa8IhVmgVdgE8W6uNtpFeYzmNK9NH3IXikku0
 kBT/SjufxMCUl2bP37j1cSgvFA7TLV8XXpGgeGVtYkGadRgHDmt7mHw1sPgocgoy2LKN
 dkMhHyKPZdKtfDVualmGAhhObUuAyZpuiP8ZtAfIlw7EXAsdaw3AkrvztVqPeZ33N8wc
 bonQ==
X-Gm-Message-State: AOAM532CySGrPrL12nSmvhxVEg0o/BLanliru0IQ9pm/L1IrTTVofRRP
 gdEvyMUqvpKz6uhE+Cseb/o=
X-Google-Smtp-Source: ABdhPJy7s1D6ykSnCB7ioFDMgy/inGyzKLNuiGTpgGyhXK4x4Y/a7NCVu20vU3AOosuasyx2K2Kd+w==
X-Received: by 2002:adf:e850:: with SMTP id d16mr37667320wrn.426.1593773567952; 
 Fri, 03 Jul 2020 03:52:47 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-235.amazon.com. [54.240.197.235])
 by smtp.gmail.com with ESMTPSA id b18sm4540781wrs.46.2020.07.03.03.52.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 Jul 2020 03:52:47 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: "'Julien Grall'" <julien@xen.org>,
 =?utf-8?Q?'Micha=C5=82_Leszczy=C5=84ski'?= <michal.leszczynski@cert.pl>,
 <xen-devel@lists.xenproject.org>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <a317b169e3710a481bb4be066d9b878f27b3e66c.1593519420.git.michal.leszczynski@cert.pl>
 <5be6cb58-82d0-0a78-a9b2-5c078b5d3587@xen.org>
In-Reply-To: <5be6cb58-82d0-0a78-a9b2-5c078b5d3587@xen.org>
Subject: RE: [PATCH v4 06/10] memory: batch processing in acquire_resource()
Date: Fri, 3 Jul 2020 11:52:46 +0100
Message-ID: <004901d65128$16a6f330$43f4d990$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQFzyG1KjeOu8uNiQeFGxRZBsBXsYgGYFxRdAaoW8QOpoKwZQA==
Content-Language: en-gb
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
Cc: 'Stefano Stabellini' <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 'Wei Liu' <wl@xen.org>, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich' <jbeulich@suse.com>,
 luwei.kang@intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Julien Grall <julien@xen.org>
> Sent: 03 July 2020 11:36
> To: Micha=C5=82 Leszczy=C5=84ski <michal.leszczynski@cert.pl>; =
xen-devel@lists.xenproject.org
> Cc: luwei.kang@intel.com; tamas.lengyel@intel.com; Andrew Cooper =
<andrew.cooper3@citrix.com>; George
> Dunlap <george.dunlap@citrix.com>; Ian Jackson =
<ian.jackson@eu.citrix.com>; Jan Beulich
> <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei =
Liu <wl@xen.org>; paul@xen.org
> Subject: Re: [PATCH v4 06/10] memory: batch processing in =
acquire_resource()
>=20
> (+ Paul as the author XENMEM_acquire_resource)
>=20
> Hi,
>=20
> On 30/06/2020 13:33, Micha=C5=82 Leszczy=C5=84ski wrote:
> > From: Michal Leszczynski <michal.leszczynski@cert.pl>
> >
> > Allow to acquire large resources by allowing acquire_resource()
> > to process items in batches, using hypercall continuation.
> >
> > Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> > ---
> >   xen/common/memory.c | 32 +++++++++++++++++++++++++++++---
> >   1 file changed, 29 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/common/memory.c b/xen/common/memory.c
> > index 714077c1e5..3ab06581a2 100644
> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -1046,10 +1046,12 @@ static int acquire_grant_table(struct domain =
*d, unsigned int id,
> >   }
> >
> >   static int acquire_resource(
> > -    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
> > +    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg,
> > +    unsigned long *start_extent)
> >   {
> >       struct domain *d, *currd =3D current->domain;
> >       xen_mem_acquire_resource_t xmar;
> > +    uint32_t total_frames;
> >       /*
> >        * The mfn_list and gfn_list (below) arrays are ok on stack =
for the
> >        * moment since they are small, but if they need to grow in =
future
> > @@ -1077,8 +1079,17 @@ static int acquire_resource(
> >           return 0;
> >       }
> >
> > +    total_frames =3D xmar.nr_frames;
>=20
> On 32-bit, the start_extent would be 26-bits wide which is not enough =
to
> cover all the xmar.nr_frames. Therefore, you want that check that it =
is
> possible to encode a continuation. Something like:
>=20
> /* Is the size too large for us to encode a continuation? */
> if ( unlikely(xmar.nr_frames > (UINT_MAX >> MEMOP_EXTENT_SHIFT)) )
>=20
> > +
> > +    if ( *start_extent ) > +    {
> > +        xmar.frame +=3D *start_extent;
> > +        xmar.nr_frames -=3D *start_extent;
>=20
> As start_extent is exposed to the guest, you want to check if it is =
not
> bigger than xmar.nr_frames.
>=20
> > +        guest_handle_add_offset(xmar.frame_list, *start_extent);
> > +    }
> > +
> >       if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
> > -        return -E2BIG;
> > +        xmar.nr_frames =3D ARRAY_SIZE(mfn_list);
>=20
> The documentation of the hypercall suggests that if you pass NULL, =
then
> it will return the maximum number value for nr_frames supported by the
> implementation. So technically a domain cannot use more than
> ARRAY_SIZE(mfn_list).
>=20
> However, you new addition conflict with the documentation. Can you
> clarify how a domain will know that it can use more than
> ARRAY_SIZE(mfn_list)?

The domain should not need to know. It should be told the maximum number =
of frames of the type it wants. If we have to carve that up into batches =
inside Xen then the caller should not need to care, right?

>=20
> >
> >       rc =3D rcu_lock_remote_domain_by_id(xmar.domid, &d);
> >       if ( rc )
> > @@ -1135,6 +1146,14 @@ static int acquire_resource(
> >           }
> >       }
> >
> > +    if ( !rc )
> > +    {
> > +        *start_extent +=3D xmar.nr_frames;
> > +
> > +        if ( *start_extent !=3D total_frames )
> > +            rc =3D -ERESTART;
> > +    }
> > +
> >    out:
> >       rcu_unlock_domain(d);
> >
> > @@ -1600,7 +1619,14 @@ long do_memory_op(unsigned long cmd, =
XEN_GUEST_HANDLE_PARAM(void) arg)
> >
> >       case XENMEM_acquire_resource:
> >           rc =3D acquire_resource(
> > -            guest_handle_cast(arg, xen_mem_acquire_resource_t));
> > +            guest_handle_cast(arg, xen_mem_acquire_resource_t),
> > +            &start_extent);
>=20
> Hmmm... it looks like we forgot to check that start_extent is always 0
> when the hypercall was added.
>=20
> As this is exposed to the guest, it technically means that there no
> guarantee that start_extent will always be 0.
>=20

I don't follow. A start extent !=3D 0 means you are in a continuation. =
How can you check for 0 without breaking continuations?

  Paul

> However, in practice, this was likely the intention and should be the
> case. So it may just be enough to mention the potential breakage in =
the
> commit message.
>=20
> @All: what do you think?
>=20
> > +
> > +        if ( rc =3D=3D -ERESTART )
> > +            return hypercall_create_continuation(
> > +                __HYPERVISOR_memory_op, "lh",
> > +                op | (start_extent << MEMOP_EXTENT_SHIFT), arg);
> > +
> >           break;
> >
> >       default:
> >
>=20
> Cheers,
>=20
> --
> Julien Grall


