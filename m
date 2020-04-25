Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5A21B8680
	for <lists+xen-devel@lfdr.de>; Sat, 25 Apr 2020 14:33:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jSJyu-00077R-2O; Sat, 25 Apr 2020 12:32:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B69V=6J=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jSJys-00077M-RG
 for xen-devel@lists.xenproject.org; Sat, 25 Apr 2020 12:32:27 +0000
X-Inumbo-ID: d17c9a22-86f0-11ea-83d8-bc764e2007e4
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d17c9a22-86f0-11ea-83d8-bc764e2007e4;
 Sat, 25 Apr 2020 12:32:25 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id t12so9520644edw.3
 for <xen-devel@lists.xenproject.org>; Sat, 25 Apr 2020 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x7DGA0Y8hxTOAX6mUz79wqHjrw0aGHZMj/KL2ans5kU=;
 b=Qq+t3shK7GbYPv/jtsUcJ0KaHHlmMzcLvNx8EmqiN//TBgmBRVajhYsp4LL7hxzAiL
 Va+4028UT8qZ00ZEuJBIUyecojmmO4j+3ZF0S2FkHQYFdkkyTkqwzzDLg+n4EVZpCUJe
 mZ3indeVME4TT3kQNsVVtMvTMuW7pYLrD2PVjCO8m7AOK0V/z2c1hE+muwvR164q2Q81
 vHAs317WVhPFqWKWxa8+LZykIDxboBWKZRQa3o030/84uX1ysgVee8hYI+MbEoT9Ut+h
 LqYcRrEStmzWuiRDiJ7Fxf4MAGyrKtQRYSlxnEleJUFss4/1gYnSLTsAihUYNlgF0K4m
 9tYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x7DGA0Y8hxTOAX6mUz79wqHjrw0aGHZMj/KL2ans5kU=;
 b=pGvA/a2W3UjDMf3hn1JgwOSbkI9yxeiGz+rbOVUejLAVMyO6lVhs2iCLGDU2nT3r9o
 3NzMHzouf/ZC1nfsMRa1FvzUnB+iQ2VTAEFBwgGA8/8Eay6illrWY6y+E8KU5JRftc88
 KkdovVt6+j3mgIZX7VzsQkNrF7upTwsQsVfa0hHTDU2dOWKVkoQJpAifgZbhzL4SIjfJ
 Ts8pEjuAE5SV9uFyWkpFrGxGJscXoPxDVIUyO0Ds6/AjBCqOs/5AcDFpOhGfe05vCil0
 Ue2ZuGucEBFhihOIkjFW4uS7Xz/ZF110kpjahlk68hGIDujA6G6oA8XorempgvsW27Tn
 oFhA==
X-Gm-Message-State: AGi0PuZ6MRYCY1Iy7RWuZTXQvku2YyJQMhOXOZQXU4wvlkmChPQ9GWdB
 ZxpeYiudGKy1ucF28RpMd7vW394ZH9A=
X-Google-Smtp-Source: APiQypIogJAEVLsaRfCsJxR9hwDfHl/PYMfLc+taZB8mCk5DrA7yX8l0yFb7EkKtJA+y1nb8sx8tWw==
X-Received: by 2002:a50:bb07:: with SMTP id y7mr11351468ede.358.1587817944489; 
 Sat, 25 Apr 2020 05:32:24 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com.
 [209.85.221.42])
 by smtp.gmail.com with ESMTPSA id u18sm802506edx.27.2020.04.25.05.32.22
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Apr 2020 05:32:23 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id j2so14729556wrs.9
 for <xen-devel@lists.xenproject.org>; Sat, 25 Apr 2020 05:32:22 -0700 (PDT)
X-Received: by 2002:a05:6000:4:: with SMTP id
 h4mr17470403wrx.386.1587817942599; 
 Sat, 25 Apr 2020 05:32:22 -0700 (PDT)
MIME-Version: 1.0
References: <70ea4889e30ed35760329331ddfeb279fcd80786.1587655725.git.tamas.lengyel@intel.com>
 <20200424094343.GH28601@Air-de-Roger>
 <CABfawhnRhLJ0AKjTKBx7snEOHBX5oJ2KrwbscQk=e7qXHFD3mA@mail.gmail.com>
 <20200425090107.GK28601@Air-de-Roger>
In-Reply-To: <20200425090107.GK28601@Air-de-Roger>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Sat, 25 Apr 2020 06:31:46 -0600
X-Gmail-Original-Message-ID: <CABfawh=e-DjK2ONDV5DagMncLEvP-xA--+YsMOMuUWdM1hx0ug@mail.gmail.com>
Message-ID: <CABfawh=e-DjK2ONDV5DagMncLEvP-xA--+YsMOMuUWdM1hx0ug@mail.gmail.com>
Subject: Re: [PATCH v17 1/2] mem_sharing: fix sharability check during fork
 reset
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, Apr 25, 2020 at 3:01 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Fri, Apr 24, 2020 at 06:18:24AM -0600, Tamas K Lengyel wrote:
> > On Fri, Apr 24, 2020 at 3:44 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.=
com> wrote:
> > >
> > > On Thu, Apr 23, 2020 at 08:30:06AM -0700, Tamas K Lengyel wrote:
> > > > When resetting a VM fork we ought to only remove pages that were al=
located for
> > > > the fork during it's execution and the contents copied over from th=
e parent.
> > > > This can be determined if the page is sharable as special pages use=
d by the
> > > > fork for other purposes will not pass this test. Unfortunately duri=
ng the fork
> > > > reset loop we only partially check whether that's the case. A page'=
s type may
> > > > indicate it is sharable (pass p2m_is_sharable) but that's not a suf=
ficient
> > > > check by itself. All checks that are normally performed before a pa=
ge is
> > > > converted to the sharable type need to be performed to avoid removi=
ng pages
> > > > from the p2m that may be used for other purposes. For example, curr=
ently the
> > > > reset loop also removes the vcpu info pages from the p2m, potential=
ly putting
> > > > the guest into infinite page-fault loops.
> > > >
> > > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > >
> > > Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >
> > Thanks!
> >
> > >
> > > I've been looking however and I'm not able to spot where you copy the
> > > shared_info data, which I think it's also quite critical for the
> > > domain, as it contains the info about event channels (when using L2).
> > > Also for HVM forks the shared info should be mapped at the same gfn a=
s
> > > the parent, or else the child trying to access it will trigger an EPT
> > > fault that won't be able to populate such gfn, because the shared_inf=
o
> > > on the parent is already shared between Xen and the parent.
> >
> > Pages that cause an EPT fault but can't be made shared get a new page
> > allocated for them and copied in mem_sharing_fork_page. There are many
> > pages like that, mostly due to QEMU mapping them and thus holding an
> > extra reference. That said, shared_info is manually copied during
> > forking in copy_special_pages, at the end of the function you will
> > find:
> >
> > old_mfn =3D _mfn(virt_to_mfn(d->shared_info));
> > new_mfn =3D _mfn(virt_to_mfn(cd->shared_info));
> >
> > copy_domain_page(new_mfn, old_mfn);
>
> Yes, that's indeed fine, you need to copy the contents of the shared
> info page, but for HVM you also need to make sure the shared info page
> is mapped at the same gfn as the parent. HVM guest issue a hypercall
> to request the mapping of the shared info page to a specific gfn,
> since it's not added to the guest physmap by default.
> XENMAPSPACE_shared_info is used in order to request the shared info
> page to be mapped at a specific gfn.
>
> AFAICT during fork such shared info mapping is not replicated to the
> child, and hence the child trying to access the gfn of the shared info
> page would just result in EPT faults that won't be fixed (because the
> parent shared info page cannot be shared with the child)?
>
> You should be able to use get_gpfn_from_mfn in order to get the parent
> gfn where the shared info mfn is mapped (if any), and then replicate
> this in the child using it's own shared info.
>
> On fork reset you should check if the child shared info gfn !=3D parent
> shared info gfn and reinstate the parent state if different from the
> child.

OK, I see what you mean. In the way things set up currently the EPT
fault-loop problem doesn't happen since the page does get copied, it
just gets copied to a new mfn not the one d->shared_info points to. So
whatever issue that may bring it must be subtle because we haven't
noticed any instability.

Also, looking at the save/restore code in libxc it seems to me that
shared_info is actually a PV specific page and it doesn't get
saved/restored with an HVM domain. The hvm code paths don't process
REC_TYPE_SHARED_INFO at all. So since forks are exclusively for HVM
domains, do we really need it and if so, why doesn't HVM save/restore
need it?

Tamas

