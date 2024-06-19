Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115A890F496
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 18:57:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743942.1150945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyc8-0002Wn-8S; Wed, 19 Jun 2024 16:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743942.1150945; Wed, 19 Jun 2024 16:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJyc8-0002Uj-4h; Wed, 19 Jun 2024 16:56:52 +0000
Received: by outflank-mailman (input) for mailman id 743942;
 Wed, 19 Jun 2024 16:56:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i/NX=NV=gmail.com=alexdeucher@srs-se1.protection.inumbo.net>)
 id 1sJyc6-0002Ud-8n
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 16:56:50 +0000
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [2607:f8b0:4864:20::1035])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eab655e0-2e5c-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 18:56:49 +0200 (CEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2c7dbdc83bfso43288a91.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2024 09:56:49 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: eab655e0-2e5c-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718816207; x=1719421007; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2pOiKZCM6AEv9fRPfAqr24dsxT32FXEwY2yo/xeCPU=;
        b=e/H5QM9FmpfOOeg60BIutvS/SwmPC537/DjWIt+yOliJmrNrKIcqwRudCjN9ihiFk8
         64hNcUFejn/avhlbYuqRQs1PZeKzohmKXxA7MG0Yuo6UMf6IgN663/tSD5FxEDWdenvl
         zz4aBK4/nIBjhJta1xCdAs8eQxYqNxnHYyIREgr1hdLSasM+WOfbv6XJFaKZzDSpzHu1
         ASZW26lhqKQMSj0fzOCqROuEuwcyrvXwhBO4XWEvhL7+butvlNyqscxlf/Ysi/V0NL/r
         6oI3S/Mg0gle1KnpapHkqArrV/FTmrOodFoNCP8GjllArtapTXoRbLBP3gFeR/Jypnd5
         mN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718816207; x=1719421007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2pOiKZCM6AEv9fRPfAqr24dsxT32FXEwY2yo/xeCPU=;
        b=lhhulAum42kjr+6o606rN3KLBUP5FamxfLVsqPROjnPzinuLS7h+WUl1UiS17Csuoy
         haOku5xRH04oX+3Ch9gq/ohZhduEqULuIpfesH7tiPWOwxgBpb8SaU6myU0qf8LviSuU
         17oN3wGb2GZUP5Es0M0EPAEmaNsi9ovmjpPPLP0sgOBONqmRadZ4LPc4lrSpGF1g/y24
         oi8lW3+dxWnclEdlb/R/VDUmv9FNhaxdWPwhsDxbnSSln1ztb7OfbzNfNdXuzdPmJKtC
         CggGynQSxtsgiACrmVv7mgKxMjww+ncWjkXDvxCPzs0RRV0SPxf/rYXehvZ4LeGoCLJu
         wTww==
X-Forwarded-Encrypted: i=1; AJvYcCXbmaD9Wz/ydQ6eN+pcp2FxBjF8D6IEgOI49JuaUOo69zhZXiTsTiVGrL5rOXQJTXGylbS34bl7sZ/2Aj4RQSBaVsrfN/ebVibCKFoSBcg=
X-Gm-Message-State: AOJu0YxjKiXKAfZp/yrQ1qdg2xK9X/TYuI8W3uvyB+llJuCw0Q+lzUDX
	eWcqiAO3AAQbe7s4HSI77OXBBTel+y7Z9RiBKZCdinLMpaw/Amwa69KAUAz8/NOFYFD9gcvdbdF
	6cWISbBQ+wrMFzeWQlLHULhehH6Y=
X-Google-Smtp-Source: AGHT+IERyacgj62eO2mHHlRd0wPullKaaMd7l6eTgV3VKINVH5yxaU0nlHl6jCJTt+Z3UyH6vlmBZQUH4XKAyUIMX9A=
X-Received: by 2002:a17:90a:fd0a:b0:2c4:e5f4:a20e with SMTP id
 98e67ed59e1d1-2c7b5d8ac46mr2856698a91.44.1718816207374; Wed, 19 Jun 2024
 09:56:47 -0700 (PDT)
MIME-Version: 1.0
References: <Zms9tjtg06kKtI_8@itl-email> <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook> <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <ZmwByZnn5vKcVLKI@macbook> <Zm-FidjSK3mOieSC@itl-email> <Zm_p1QvoZcjQ4gBa@macbook>
 <ZnCglhYlXmRPBZXE@mail-itl> <ZnDbaply6KaBUKJb@itl-email> <0b00c8f9-fb79-4b11-ae22-931205653203@amd.com>
 <ZnGVu9TjHKiEqxsu@itl-email> <13ee25a3-91ef-48da-a58d-f4b972fe0c4f@amd.com>
In-Reply-To: <13ee25a3-91ef-48da-a58d-f4b972fe0c4f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 19 Jun 2024 12:56:35 -0400
Message-ID: <CADnq5_N9-Db3+=JB1UrcZZho9psU-mnXz0xnatYJ+oDL24_A7g@mail.gmail.com>
Subject: Re: Design session notes: GPU acceleration in Xen
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>, Jan Beulich <jbeulich@suse.com>, 
	Xenia Ragiadakou <burzalodowa@gmail.com>, Ray Huang <ray.huang@amd.com>, 
	Xen developer discussion <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Direct Rendering Infrastructure development <dri-devel@lists.freedesktop.org>, 
	Qubes OS Development Mailing List <qubes-devel@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 12:27=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 18.06.24 um 16:12 schrieb Demi Marie Obenour:
> > On Tue, Jun 18, 2024 at 08:33:38AM +0200, Christian K=C3=B6nig wrote:
> > > Am 18.06.24 um 02:57 schrieb Demi Marie Obenour:
> > >> On Mon, Jun 17, 2024 at 10:46:13PM +0200, Marek Marczykowski-G=C3=B3=
recki
> > >> wrote:
> > >>> On Mon, Jun 17, 2024 at 09:46:29AM +0200, Roger Pau Monn=C3=A9 wrot=
e:
> > >>>> On Sun, Jun 16, 2024 at 08:38:19PM -0400, Demi Marie Obenour wrote=
:
> > >>>>> In both cases, the device physical
> > >>>>> addresses are identical to dom0=E2=80=99s physical addresses.
> > >>>>
> > >>>> Yes, but a PV dom0 physical address space can be very scattered.
> > >>>>
> > >>>> IIRC there's an hypercall to request physically contiguous memory =
for
> > >>>> PV, but you don't want to be using that every time you allocate a
> > >>>> buffer (not sure it would support the sizes needed by the GPU
> > >>>> anyway).
> > >>
> > >>> Indeed that isn't going to fly. In older Qubes versions we had PV
> > >>> sys-net with PCI passthrough for a network card. After some uptime =
it
> > >>> was basically impossible to restart and still have enough contagiou=
s
> > >>> memory for a network driver, and there it was about _much_ smaller
> > >>> buffers, like 2M or 4M. At least not without shutting down a lot mo=
re
> > >>> things to free some more memory.
> > >>
> > >> Ouch!  That makes me wonder if all GPU drivers actually need physica=
lly
> > >> contiguous buffers, or if it is (as I suspect) driver-specific. CCin=
g
> > >> Christian K=C3=B6nig who has mentioned issues in this area.
> >
> > > Well GPUs don't need physical contiguous memory to function, but if t=
hey
> > > only get 4k pages to work with it means a quite large (up to 30%)
> > > performance penalty.
> >
> > The status quo is "no GPU acceleration at all", so 70% of bare metal
> > performance would be amazing right now.
>
> Well AMD uses native context approach in XEN which which delivers over
> 90% of bare metal performance.
>
> Pierre-Eric can tell you more, but we certainly have GPU solutions in
> productions with XEN which would suffer greatly if we see the underlying
> memory fragmented like this.
>
> >   However, the implementation
> > should not preclude eliminating this performance penalty in the future.
> >
> > What size pages do GPUs need for good performance?  Is it the same as
> > CPU huge pages?
>
> 2MiB are usually sufficient.

Larger pages are helpful for both system memory and VRAM, but it's
more important for VRAM.

Alex

>
> Regards,
> Christian.
>
> >   PV dom0 doesn't get huge pages at all, but PVH and HVM
> > guests do, and the goal is to move away from PV guests as they have lot=
s
> > of unrelated problems.
> >
> > > So scattering memory like you described is probably a very bad idea
> > if you
> > > want any halve way decent performance.
> >
> > For an initial prototype a 30% performance penalty is acceptable, but
> > it's good to know that memory fragmentation needs to be avoided.
> >
> > > Regards,
> > > Christian
> >
> > Thanks for the prompt response!
>

