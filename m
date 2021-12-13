Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C15754723BA
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 10:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245898.424167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwhYZ-0002Iq-MA; Mon, 13 Dec 2021 09:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245898.424167; Mon, 13 Dec 2021 09:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwhYZ-0002H6-Db; Mon, 13 Dec 2021 09:23:39 +0000
Received: by outflank-mailman (input) for mailman id 245898;
 Mon, 13 Dec 2021 09:23:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7HxJ=Q6=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1mwhYY-0002Gy-Ou
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 09:23:38 +0000
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 593aa127-5bf6-11ec-bf02-3911bdbc85ab;
 Mon, 13 Dec 2021 10:23:36 +0100 (CET)
Received: by mail-ua1-f50.google.com with SMTP id w23so28024565uao.5
 for <xen-devel@lists.xenproject.org>; Mon, 13 Dec 2021 01:23:36 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id p46sm4070497uad.16.2021.12.13.01.23.34
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 01:23:34 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id n6so28071736uak.1
 for <xen-devel@lists.xenproject.org>; Mon, 13 Dec 2021 01:23:34 -0800 (PST)
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
X-Inumbo-ID: 593aa127-5bf6-11ec-bf02-3911bdbc85ab
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7JQ6xhDuC8UGs/jm3YR6x8QoCCs8KyehtdxluDCRZKo=;
        b=z3dP0ilTwwNTFIG2zDDB+21srqDYIITV8Xs3OaZSyqIOvGl+EP6vDsiGysk/piDgcC
         2PzZHjLe+2RpQ1+xBRmW9cirXAA7fg/34BXhnwOu/Xe4M0aUMzic2Eh5dA/3vFN+9+/S
         luafk+cA6C25+xupGUSSmpHWnN8Avxfvu7Zzge15TJUl2uB/Yc4Ykibwcc8CfESbllsB
         QcV2SK9RoqodbCSz/+aZOG3WLdvamKlxW3CMdDTjnJ3Nu/fZK+DmMHDGhF///V/3Ksu+
         LZlXFxrqymzSXmLtL/eoNHLd8NqtZst1Tq0lisCVpLbg/7lRtAExiFWZBP3p8WnBw3fM
         X5/w==
X-Gm-Message-State: AOAM533mAiKDx85c2UPzk8dRQIIa/YdspHYK06gsaYEj/VDPx9WnChRZ
	WGNoHG3A0QR3kzO+0LZBtLknA1iUXQ1vxA==
X-Google-Smtp-Source: ABdhPJycpHNND4n/wrsHreJDjBldsE0W9MUNVpaASuXxMopzz2eaxZxHWqASrFhWeEHZZd2Ku6CPMA==
X-Received: by 2002:a67:b917:: with SMTP id q23mr27480169vsn.80.1639387415315;
        Mon, 13 Dec 2021 01:23:35 -0800 (PST)
X-Received: by 2002:a67:c106:: with SMTP id d6mr26074577vsj.77.1639387403608;
 Mon, 13 Dec 2021 01:23:23 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com> <20211126180101.27818-6-digetx@gmail.com>
 <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl> <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl> <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
 <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
 <45025b2d-4be1-f694-be61-31903795cf5d@gmail.com> <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
In-Reply-To: <CAJZ5v0ieTwnBVjW8R_VTdPFH3yr5AwLc+ZEG5N3KrpTH+j8qZw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Dec 2021 10:23:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXW1bCLkJhC1Jnf2rkS1rBnXsMX=4LMVdXDvMV5HOzrLw@mail.gmail.com>
Message-ID: <CAMuHMdXW1bCLkJhC1Jnf2rkS1rBnXsMX=4LMVdXDvMV5HOzrLw@mail.gmail.com>
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated priority
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Dmitry Osipenko <digetx@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, 
	Joshua Thompson <funaho@jurai.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
	Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	"H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Len Brown <lenb@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	alankao@andestech.com, "K . C . Kuen-Chern Lin" <kclin@andestech.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-csky@vger.kernel.org, 
	linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-riscv@lists.infradead.org, 
	Linux-sh list <linux-sh@vger.kernel.org>, xen-devel@lists.xenproject.org, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 10, 2021 at 8:14 PM Rafael J. Wysocki <rafael@kernel.org> wrote=
:
> On Fri, Dec 10, 2021 at 8:04 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> > 10.12.2021 21:27, Rafael J. Wysocki =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > > On Mon, Nov 29, 2021 at 12:34 PM Dmitry Osipenko <digetx@gmail.com> w=
rote:
> > >> 29.11.2021 03:26, Micha=C5=82 Miros=C5=82aw =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
> > >>> On Mon, Nov 29, 2021 at 12:06:19AM +0300, Dmitry Osipenko wrote:
> > >>>> 28.11.2021 03:28, Micha=C5=82 Miros=C5=82aw =D0=BF=D0=B8=D1=88=D0=
=B5=D1=82:
> > >>>>> On Fri, Nov 26, 2021 at 09:00:41PM +0300, Dmitry Osipenko wrote:
> > >>>>>> Add sanity check which ensures that there are no two restart han=
dlers
> > >>>>>> registered with the same priority. Normally it's a direct sign o=
f a
> > >>>>>> problem if two handlers use the same priority.
> > >>>>>
> > >>>>> The patch doesn't ensure the property that there are no duplicate=
d-priority
> > >>>>> entries on the chain.
> > >>>>
> > >>>> It's not the exact point of this patch.
> > >>>>
> > >>>>> I'd rather see a atomic_notifier_chain_register_unique() that ret=
urns
> > >>>>> -EBUSY or something istead of adding an entry with duplicate prio=
rity.
> > >>>>> That way it would need only one list traversal unless you want to
> > >>>>> register the duplicate anyway (then you would call the older
> > >>>>> atomic_notifier_chain_register() after reporting the error).
> > >>>>
> > >>>> The point of this patch is to warn developers about the problem th=
at
> > >>>> needs to be fixed. We already have such troubling drivers in mainl=
ine.
> > >>>>
> > >>>> It's not critical to register different handlers with a duplicated
> > >>>> priorities, but such cases really need to be corrected. We shouldn=
't
> > >>>> break users' machines during transition to the new API, meanwhile
> > >>>> developers should take action of fixing theirs drivers.
> > >>>>
> > >>>>> (Or you could return > 0 when a duplicate is registered in
> > >>>>> atomic_notifier_chain_register() if the callers are prepared
> > >>>>> for that. I don't really like this way, though.)
> > >>>>
> > >>>> I had a similar thought at some point before and decided that I'm =
not in
> > >>>> favor of this approach. It's nicer to have a dedicated function th=
at
> > >>>> verifies the uniqueness, IMO.
> > >>>
> > >>> I don't like the part that it traverses the list second time to che=
ck
> > >>> the uniqueness. But actually you could avoid that if
> > >>> notifier_chain_register() would always add equal-priority entries i=
n
> > >>> reverse order:
> > >>>
> > >>>  static int notifier_chain_register(struct notifier_block **nl,
> > >>>               struct notifier_block *n)
> > >>>  {
> > >>>       while ((*nl) !=3D NULL) {
> > >>>               if (unlikely((*nl) =3D=3D n)) {
> > >>>                       WARN(1, "double register detected");
> > >>>                       return 0;
> > >>>               }
> > >>> -             if (n->priority > (*nl)->priority)
> > >>> +             if (n->priority >=3D (*nl)->priority)
> > >>>                       break;
> > >>>               nl =3D &((*nl)->next);
> > >>>       }
> > >>>       n->next =3D *nl;
> > >>>       rcu_assign_pointer(*nl, n);
> > >>>       return 0;
> > >>>  }
> > >>>
> > >>> Then the check for uniqueness after adding would be:
> > >>>
> > >>>  WARN(nb->next && nb->priority =3D=3D nb->next->priority);
> > >>
> > >> We can't just change the registration order because invocation order=
 of
> > >> the call chain depends on the registration order
> > >
> > > It doesn't if unique priorities are required and isn't that what you =
want?
> > >
> > >> and some of current
> > >> users may rely on that order. I'm pretty sure that changing the orde=
r
> > >> will have unfortunate consequences.
> > >
> > > Well, the WARN() doesn't help much then.
> > >
> > > Either you can make all of the users register with unique priorities,
> > > and then you can make the registration reject non-unique ones, or you
> > > cannot assume them to be unique.
> >
> > There is no strong requirement for priorities to be unique, the reboot.=
c
> > code will work properly.
>
> In which case adding the WARN() is not appropriate IMV.
>
> Also I've looked at the existing code and at least in some cases the
> order in which the notifiers run doesn't matter.  I'm not sure what
> the purpose of this patch is TBH.
>
> > The potential problem is on the user's side and the warning is intended
> > to aid the user.
>
> Unless somebody has the panic_on_warn mentioned previously set and
> really the user need not understand what the WARN() is about.  IOW,
> WARN() helps developers, not users.

Do panic_on_warn and reboot_on_panic play well with having a WARN()
in the reboot notifier handling?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

