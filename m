Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A8E1FA1E3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 22:45:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkvxx-0002Uy-4u; Mon, 15 Jun 2020 20:44:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ey7m=74=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jkvxv-0002Ut-Jk
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 20:44:23 +0000
X-Inumbo-ID: fdf8715e-af48-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdf8715e-af48-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 20:44:22 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y17so18487063wrn.11
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 13:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Bgs8LxkfaewmQhhiyMdkzV4z6XrQZitYOZ1aJydvzxk=;
 b=cXgt5bP2xSMC5+4kBz9FEnZVa87utxu21vLLthqsvpVewBP2+PtvsxYraOAijver2K
 oSjFH5uDbOXsqYc5QUWU5LyuAHF0OoSmonLoBIxg8NomHUkY0faRFd17E4GqHG/UQfcd
 brqX7q8xlkzoB63yABeW3PGsxUSmsVjAfsH74GaILGyPSKFR5dVDclzFJXnG4vu3j/FE
 of1xWPJSeaE+x1z2PCyW5mmw9wVyHi5B39kybwsZPphAGi7FdqFmtcBnAszkJzb1rjFb
 fnkwm/k0YtTopYqQz2g13hITasKv7kEBnQyXs9xi2QJBInzO3UfaPE2s6TS3mPTcWQa7
 Wd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Bgs8LxkfaewmQhhiyMdkzV4z6XrQZitYOZ1aJydvzxk=;
 b=KZsvGmlw6nlk9Fd2lJDL106Ct8V29cZHxAUxqR4sMhHL0c9jZZ+t5vhSmDTF7yHp5a
 8GWPrP5fW+2PwBKreKxjdVakLOvJR4cjOgFK9jBFNBEmKEbmY4EQr0MoyznUsCY5SPEr
 KHhl4bSqopOey/RN/bJr+Z0Y1dOQrH7OYwcM68y5AR+0p2JtdI5Vp9vPqvYjdLmaOm8K
 3k6Xm0/U4diycFEQ+OQr3CVhAEQ17kEuHKNfIMzQA6qND3BSdo1OH9AvQjXaaE+6vHEv
 W5D/AoUjJE4JoNda3xLx8+eQNnvJFhotm9cXyuG/WkFp85k8V/cT6JpzjPzVa/kbkjPU
 f63w==
X-Gm-Message-State: AOAM531/ip7tJWl2ONa9Ol0VHmA0Yi9vRikgRXEgxSO2LiuTxVNu9ckp
 nFx6j3te2Dr6hxuyKW5daWbpVe+oUlA0BA44Kgo=
X-Google-Smtp-Source: ABdhPJzA5i7TDgHqPckirQbDCiAByZc7cWVSO6aLPvVFIHz6BBps5YgkeK9nHZ24j3XFbd0nhmXwnRIGMcBySkBmwa4=
X-Received: by 2002:a5d:4ec3:: with SMTP id s3mr32732699wrv.103.1592253861661; 
 Mon, 15 Jun 2020 13:44:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
 <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
 <CAJ=z9a3u7ztgSmJbhjVATrfJEBBVkHbZei6ydBQeV8nzdDFA3Q@mail.gmail.com>
 <alpine.DEB.2.21.2006111143530.2815@sstabellini-ThinkPad-T480s>
 <74475748-e884-1e6e-633d-bf67d5ed32fe@xen.org>
 <alpine.DEB.2.21.2006111250180.2815@sstabellini-ThinkPad-T480s>
 <48F66B8F-3AEF-4E54-A572-C246F5A7C117@arm.com>
 <alpine.DEB.2.21.2006120944460.2815@sstabellini-ThinkPad-T480s>
 <0D644096-05E3-44F3-A1FD-75006C718F23@arm.com>
 <alpine.DEB.2.21.2006151322060.9074@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006151322060.9074@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Mon, 15 Jun 2020 21:44:09 +0100
Message-ID: <CAJ=z9a1ifbAeCdPHet5j76Y_9f55rKC_ExAQ0Hef+JVQuW2zKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 15 Jun 2020 at 21:30, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>
> On Mon, 15 Jun 2020, Bertrand Marquis wrote:
> > > On 13 Jun 2020, at 01:24, Stefano Stabellini <sstabellini@kernel.org>=
 wrote:
> > >
> > > On Fri, 12 Jun 2020, Bertrand Marquis wrote:
> > >>> On 12 Jun 2020, at 02:09, Stefano Stabellini <sstabellini@kernel.or=
g> wrote:
> > >>>
> > >>> On Thu, 11 Jun 2020, Julien Grall wrote:
> > >>>> Hi Stefano,
> > >>>>
> > >>>> On 11/06/2020 19:50, Stefano Stabellini wrote:
> > >>>>> On Thu, 11 Jun 2020, Julien Grall wrote:
> > >>>>>>>> +        return -EINVAL;
> > >>>>>>>>     }
> > >>>>>>>>
> > >>>>>>>> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> > >>>>>>>> +    v->arch.runstate_guest.page =3D page;
> > >>>>>>>> +    v->arch.runstate_guest.offset =3D offset;
> > >>>>>>>> +
> > >>>>>>>> +    spin_unlock(&v->arch.runstate_guest.lock);
> > >>>>>>>> +
> > >>>>>>>> +    return 0;
> > >>>>>>>> +}
> > >>>>>>>> +
> > >>>>>>>> +
> > >>>>>>>> +/* Update per-VCPU guest runstate shared memory area (if regi=
stered).
> > >>>>>>>> */
> > >>>>>>>> +static void update_runstate_area(struct vcpu *v)
> > >>>>>>>> +{
> > >>>>>>>> +    struct vcpu_runstate_info *guest_runstate;
> > >>>>>>>> +    void *p;
> > >>>>>>>> +
> > >>>>>>>> +    spin_lock(&v->arch.runstate_guest.lock);
> > >>>>>>>>
> > >>>>>>>> -    if ( guest_handle )
> > >>>>>>>> +    if ( v->arch.runstate_guest.page )
> > >>>>>>>>     {
> > >>>>>>>> -        runstate.state_entry_time &=3D ~XEN_RUNSTATE_UPDATE;
> > >>>>>>>> +        p =3D __map_domain_page(v->arch.runstate_guest.page);
> > >>>>>>>> +        guest_runstate =3D p + v->arch.runstate_guest.offset;
> > >>>>>>>> +
> > >>>>>>>> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> > >>>>>>>> +        {
> > >>>>>>>> +            v->runstate.state_entry_time |=3D XEN_RUNSTATE_UP=
DATE;
> > >>>>>>>> +            guest_runstate->state_entry_time |=3D XEN_RUNSTAT=
E_UPDATE;
> > >>>>>>>
> > >>>>>>> I think that this write to guest_runstate should use write_atom=
ic or
> > >>>>>>> another atomic write operation.
> > >>>>>>
> > >>>>>> I thought about suggesting the same, but  guest_copy_* helpers m=
ay not
> > >>>>>> do a single memory write to state_entry_time.
> > >>>>>> What are you trying to prevent with the write_atomic()?
> > >>>>>
> > >>>>> I am thinking that without using an atomic write, it would be (at=
 least
> > >>>>> theoretically) possible for a guest to see a partial write to
> > >>>>> state_entry_time, which is not good.
> > >>>>
> > >>>> It is already the case with existing implementation as Xen may wri=
te byte by
> > >>>> byte. So are you suggesting the existing code is also buggy?
> > >>>
> > >>> Writing byte by byte is a different case. That is OK. In that case,=
 the
> > >>> guest could see the state after 3 bytes written and it would be fin=
e and
> > >>> consistent. If this hadn't been the case, then yes, the existing co=
de
> > >>> would also be buggy.
> > >>>
> > >>> So if we did the write with a memcpy, it would be fine, no need for
> > >>> atomics:
> > >>>
> > >>> memcpy(&guest_runstate->state_entry_time,
> > >>>        &v->runstate.state_entry_time,
> > >>>        XXX);
> > >>>
> > >>>
> > >>> The |=3D case is different: GCC could implement it in any way it li=
kes,
> > >>> including going through a zero-write to any of the bytes in the wor=
d, or
> > >>> doing an addition then a subtraction. GCC doesn't make any guarante=
es.
> > >>> If we want guarantees we need to use atomics.
> > >>
> > >> Wouldn=E2=80=99t that require all accesses to state_entry_time to us=
e also atomic operations ?
> > >> In this case we could not propagate the changes to a guest without c=
hanging the interface itself.
> > >>
> > >> As the copy time needs to be protected, the write barriers are there=
 to make sure that during the copy the bit is set and that when we unset it=
, the copy is done.
> > >> I added for this purpose a barrier after the memcpy to make sure tha=
t when/if we unset the bit the copy has already been done.
> > >
> > > As you say, we have a flag to mark a transitiong period, the flag is
> > > XEN_RUNSTATE_UPDATE. So, I think it is OK if we don't use atomics dur=
ing
> > > the transitioning period. But we need to make sure to use atomics for=
 the
> > > update of the XEN_RUNSTATE_UPDATE flag itself.
> > >
> > > Does it make sense? Or maybe I misunderstood some of the things you
> > > wrote?
> >
> > To achieve this you would do an atomic operation on state_entry_time to=
 set/unset the XEN_RUNSTATE_UPDATE bit.
> > This field is holding a flag in the upper bit but also a value, so all =
operations on state_entry_time would need to be changed to use atomic opera=
tions.
>
> I don't think that all operations on state_entry_time need to be atomic.
> Only the bit write to XEN_RUNSTATE_UPDATE. More on this below.
>
>
> > Also this state_entry_time might also be accessed by the guest on other=
 cores at the same time (to retrieve the time part).
>
> Yes but they are all just readers, right?

This is only one part of the equation. The second part is the readers
*must not* process the rest of the content while XEN_RUNSTATE_UDPATE
is set.

>
> I was not suggesting to use an atomic_t type. I was only suggesting to
> use an atomic operation, i.e. calling write_u32_atomic directly (or
> something like that.) I would not change the type of state_entry_time.
> Also using memcpy would be acceptable due to the fact that we only need
> to update one byte.

Please don't use memcpy. This is an abuse to think it can make atomic
copy (even if it may be correct for byte).
At the same time, lets avoid to introduce more atomic bit operation on
guest memory that can be read-write (see XSA-295).

In this case a write_atomic() is sufficient as it would do a single
write for size smaller than 64-bit.

Cheers,

