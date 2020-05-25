Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE9A1E1080
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 16:28:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdE5O-00088V-2k; Mon, 25 May 2020 14:28:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZKA=7H=tklsoftware.com=tamas@srs-us1.protection.inumbo.net>)
 id 1jdE5M-00088G-83
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 14:28:12 +0000
X-Inumbo-ID: f5e53cba-9e93-11ea-b9cf-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f5e53cba-9e93-11ea-b9cf-bc764e2007e4;
 Mon, 25 May 2020 14:28:11 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e10so15173959edq.0
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 07:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tklengyel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+tV9JRJ6FoJ6dNHFeSBVvjjvhV689iBU5DthCBbQEdI=;
 b=14XCvgWa7QBQQB2K8w1of7gvfhAB9ppLx4tOfy58dq5BECAwhw70sQvQnT6uCY1abE
 EhbKkwoa4E1iQy43Ld/IeyZYr7xQ/YNUHI/q+MsrD+wp075Po+DEFXuX+g2LkY3EM2cS
 JiV/eU+YRewOZ7C+xPbLWf3/2POZ4jbwUYtRqr1qlvyKS3OqqvggcjoJ/VDtq66qd9cf
 mmZ1GBA/O7Azw4BJdh2u1f5MUDIBEhqAZKlMN9N8g2rF/kvhzMgGeu6wiBJpZ1RlLqcp
 qeQjo2eL1EQNt8T/0xRUrJHbYZczVx2EIZJmNJUFrNGQJT6wEWtpTCkvrr9J7ylVvXke
 0SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+tV9JRJ6FoJ6dNHFeSBVvjjvhV689iBU5DthCBbQEdI=;
 b=sNny/ja3aeq97gSdeTI6rfpHHFQ4Kh/uiREnbOLGCVUThlU3XHpvWT1Lb1jxq7+A84
 rYhr87nQb1BrVkAuV757jhDkUcEgKUZ28bjdSw3ZMZ8KrjODoor3ozhYHxn1qHlq3UGD
 Y1ouGgxeIfXwmQsWS6R/A+UYrgA+Q6WnCeTrg63WRWkY7yqrsPWNHa3YQ/yvPPWpbkO0
 7Nr+7rwlA4SD16bfVsFW/eLhQm4i2/GiESbQyEv/jwdTFRe/h5rA2Co7vQlLjiBsXkf5
 P1E9iy2pGmF4JHAVR/Bf2jgl5H03KNIaVTrJZ/gh9OpgWIA53THXj8uDliKmPY/mWo9K
 VcFw==
X-Gm-Message-State: AOAM533kssbk2/SLvW8Sb1ki03SV/2ayh7GJJ7AVAGDedVTEJaa9E23J
 JVb/1zi6b98VTZBNJRkWr1kxlcUdyf4=
X-Google-Smtp-Source: ABdhPJzanoClpdWHbahWwCoZAx+AFevN6DqK2Z7lvv0fTkRrQT+24XpXjsm1hXyX/eFpLGxWLiaVGw==
X-Received: by 2002:a50:8754:: with SMTP id 20mr15980099edv.57.1590416890389; 
 Mon, 25 May 2020 07:28:10 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
 [209.85.221.43])
 by smtp.gmail.com with ESMTPSA id b16sm16030130ejg.43.2020.05.25.07.28.09
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 May 2020 07:28:09 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id r7so552954wro.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 May 2020 07:28:09 -0700 (PDT)
X-Received: by 2002:a5d:5707:: with SMTP id a7mr15227844wrv.259.1590416888945; 
 Mon, 25 May 2020 07:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <adfececa3e29a46f5347459a629aa534d61625aa.1590165055.git.tamas.lengyel@intel.com>
 <338c26dc-a78a-4519-11f1-1b89bd1cf4db@suse.com>
 <CABfawh=WPyW383QAe_JwRC2q8W1zHXcYntjYF-Vog34baQcrfw@mail.gmail.com>
 <e5a2899c-f375-55e8-fc6c-940b70929ae6@suse.com>
 <CABfawhnB4WY6U-XcigT+X=n4e8qdDMFokMWR1Sc_s-oMeyZRWg@mail.gmail.com>
 <78714288-89b0-6a53-4f74-f2306ae6e749@suse.com>
 <CABfawhkMzpekYLqXqZZZ5Mxum-eHqMAWvAguaRakFasJKtPfFQ@mail.gmail.com>
In-Reply-To: <CABfawhkMzpekYLqXqZZZ5Mxum-eHqMAWvAguaRakFasJKtPfFQ@mail.gmail.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 25 May 2020 08:27:30 -0600
X-Gmail-Original-Message-ID: <CABfawhmxMA0Tgwez_cGrTDoMtYVe5Z+sOng0QqEVMb_M6M-mQQ@mail.gmail.com>
Message-ID: <CABfawhmxMA0Tgwez_cGrTDoMtYVe5Z+sOng0QqEVMb_M6M-mQQ@mail.gmail.com>
Subject: Re: [PATCH v2 for-4.14 1/2] x86/mem_sharing: block interrupt
 injection for forks
To: Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Julien Grall <julien@xen.org>, Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, May 25, 2020 at 8:14 AM Tamas K Lengyel <tamas@tklengyel.com> wrote:
>
> On Mon, May 25, 2020 at 8:06 AM Jan Beulich <jbeulich@suse.com> wrote:
> >
> > On 25.05.2020 15:46, Tamas K Lengyel wrote:
> > > On Mon, May 25, 2020 at 7:06 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >>
> > >> On 25.05.2020 14:18, Tamas K Lengyel wrote:
> > >>> On Mon, May 25, 2020 at 12:06 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >>>>
> > >>>> On 22.05.2020 18:33, Tamas K Lengyel wrote:
> > >>>>> When running shallow forks without device models it may be undesirable for Xen
> > >>>>> to inject interrupts. With Windows forks we have observed the kernel going into
> > >>>>> infinite loops when trying to process such interrupts, likely because it attempts
> > >>>>> to interact with devices that are not responding without QEMU running. By
> > >>>>> disabling interrupt injection the fuzzer can exercise the target code without
> > >>>>> interference.
> > >>>>>
> > >>>>> Forks & memory sharing are only available on Intel CPUs so this only applies
> > >>>>> to vmx.
> > >>>>
> > >>>> Looking at e.g. mem_sharing_control() I can't seem to be able to confirm
> > >>>> this. Would you mind pointing me at where this restriction is coming from?
> > >>>
> > >>> Both mem_access and mem_sharing are only implemented for EPT:
> > >>> http://xenbits.xen.org/hg/xen-unstable.hg/file/5eadf9363c25/xen/arch/x86/mm/p2m-ept.c#l126.
> > >>
> > >> p2m-pt.c:p2m_type_to_flags() has a similar case label.
> > >
> > > It doesn't do anything though, does it? For mem_sharing to work you
> > > actively have to restrict the memory permissions on the shared entries
> > > to be read/execute only. That's only done for EPT.
> >
> > Does it not? I seems to me that it does, seeing the case sits
> > together with the p2m_ram_ro and p2m_ram_logdirty ones:
> >
> >     case p2m_ram_ro:
> >     case p2m_ram_logdirty:
> >     case p2m_ram_shared:
> >         return flags | P2M_BASE_FLAGS;
> >
> > >> And I can't
> > >> spot a respective restriction in mem_sharing_memop(), i.e. it looks
> > >> to me as if enabling mem-sharing on NPT (to satisfy hap_enabled()
> > >> in mem_sharing_control()) would be possible.
> > >
> > > If you are looking for an explicit gate like that, then you are right,
> > > there isn't one. You can ask the original authors of this subsystem
> > > why that is. If you feel like adding an extra gate, I wouldn't object.
> >
> > Well, the question here isn't about gating - that's an independent
> > bug if it's indeed missing. The question is whether SVM code also
> > needs touching, as was previously requested. You tried to address
> > this by stating an Intel-only limitation, which I couldn't find
> > proof for (so far).
>
> Well, as far as I'm concerned VM forking is for Intel hardware only.
> If mem_sharing seems to work for non-Intel hw - I was unaware of that
> - than I'll just add an extra check for the VM fork hypercall that
> gates it. It may be possible for technically be made available for
> other hw as well, but at this time that's completely out-of-scope.

Actually, I'm going to just add that gate completely for mem_sharing.
Even if it at some time worked on other architectures (doubtful) at
this time its a usecase that's completely abandoned and forgotten and
as far as I'm concerned unmaintained with no plans from my side to
ever maintain it.

Tamas

