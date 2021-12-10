Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5034708B7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 19:28:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244222.422393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkct-0000Nq-Oj; Fri, 10 Dec 2021 18:28:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244222.422393; Fri, 10 Dec 2021 18:28:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvkct-0000Ky-LN; Fri, 10 Dec 2021 18:28:11 +0000
Received: by outflank-mailman (input) for mailman id 244222;
 Fri, 10 Dec 2021 18:28:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dzg=Q3=gmail.com=rjwysocki@srs-se1.protection.inumbo.net>)
 id 1mvkcr-0000Ks-H8
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 18:28:09 +0000
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebc8ab64-59e6-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 19:28:08 +0100 (CET)
Received: by mail-ot1-f51.google.com with SMTP id
 u18-20020a9d7212000000b00560cb1dc10bso10437408otj.11
 for <xen-devel@lists.xenproject.org>; Fri, 10 Dec 2021 10:28:08 -0800 (PST)
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
X-Inumbo-ID: ebc8ab64-59e6-11ec-ad7a-b7ef48004f0a
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=O1tFpICrUp02/Rz91q5M3zJOsfP+AsepTWSxKHsDYko=;
        b=VeeXJEKiXe8B/fb4Qdz+weDWOq2P1SSQ49Il5Mdbe6nH+PIXM9mSV3zSA1LLmWZr5r
         gEsz8gmuc13Te7qwT82xw+WdXy33goHFXcSATea0KjFx+ciNGXYBCNQ+8Mts2+0kOEmS
         zQg0waEUlvv4DnENdN2WQ4VUiZ7vKiBoQt1fCOhdKnvGOsa9T6FfZuQPdY6NYjKtBSOE
         LGY6i2lva32uRR92eW6r1BEcnpMquxW+iIgJW1/fVMEuztVtAEovdAp7qhRFgybPQXb8
         CZVA1DHqfiU5ynMACqzUGnJ+vWBcXCrhdT2fizkTvjdgYeXuGfR72kGE2/O6AGgppllO
         SNLA==
X-Gm-Message-State: AOAM533FQPgAWpF2O2s5gJwsRzhJ3vFxrNv7l5kJiCkLMcJSNE3Ddac4
	QfPUIfcU+EmWciT+AQIWJlb7MA9Tx+K48dQhmEM=
X-Google-Smtp-Source: ABdhPJyYCS/8s4tkJCG4AWTeWKT+d6o4I/cnaoDS1n1/MlonZY2Ew73o7SGhiWkpQrPntkE0d8ozu+9C4WKQVKYTs8M=
X-Received: by 2002:a9d:4c10:: with SMTP id l16mr12535470otf.198.1639160886984;
 Fri, 10 Dec 2021 10:28:06 -0800 (PST)
MIME-Version: 1.0
References: <20211126180101.27818-1-digetx@gmail.com> <20211126180101.27818-6-digetx@gmail.com>
 <YaLNOJTM+lVq+YNS@qmqm.qmqm.pl> <033ddf2a-6223-1a82-ec64-30f17c891f67@gmail.com>
 <YaQeQgbW+CjEdsqG@qmqm.qmqm.pl> <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
In-Reply-To: <091321ea-4919-0579-88a8-23d05871575d@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 10 Dec 2021 19:27:55 +0100
Message-ID: <CAJZ5v0jMvdhfBqjY+V9h_Z6EH1ohuJH+KjuGiOw_Jor1Tnp7vg@mail.gmail.com>
Subject: Re: [PATCH v4 05/25] reboot: Warn if restart handler has duplicated priority
To: Dmitry Osipenko <digetx@gmail.com>
Cc: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
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
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
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

On Mon, Nov 29, 2021 at 12:34 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 29.11.2021 03:26, Micha=C5=82 Miros=C5=82aw =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
> > On Mon, Nov 29, 2021 at 12:06:19AM +0300, Dmitry Osipenko wrote:
> >> 28.11.2021 03:28, Micha=C5=82 Miros=C5=82aw =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
> >>> On Fri, Nov 26, 2021 at 09:00:41PM +0300, Dmitry Osipenko wrote:
> >>>> Add sanity check which ensures that there are no two restart handler=
s
> >>>> registered with the same priority. Normally it's a direct sign of a
> >>>> problem if two handlers use the same priority.
> >>>
> >>> The patch doesn't ensure the property that there are no duplicated-pr=
iority
> >>> entries on the chain.
> >>
> >> It's not the exact point of this patch.
> >>
> >>> I'd rather see a atomic_notifier_chain_register_unique() that returns
> >>> -EBUSY or something istead of adding an entry with duplicate priority=
.
> >>> That way it would need only one list traversal unless you want to
> >>> register the duplicate anyway (then you would call the older
> >>> atomic_notifier_chain_register() after reporting the error).
> >>
> >> The point of this patch is to warn developers about the problem that
> >> needs to be fixed. We already have such troubling drivers in mainline.
> >>
> >> It's not critical to register different handlers with a duplicated
> >> priorities, but such cases really need to be corrected. We shouldn't
> >> break users' machines during transition to the new API, meanwhile
> >> developers should take action of fixing theirs drivers.
> >>
> >>> (Or you could return > 0 when a duplicate is registered in
> >>> atomic_notifier_chain_register() if the callers are prepared
> >>> for that. I don't really like this way, though.)
> >>
> >> I had a similar thought at some point before and decided that I'm not =
in
> >> favor of this approach. It's nicer to have a dedicated function that
> >> verifies the uniqueness, IMO.
> >
> > I don't like the part that it traverses the list second time to check
> > the uniqueness. But actually you could avoid that if
> > notifier_chain_register() would always add equal-priority entries in
> > reverse order:
> >
> >  static int notifier_chain_register(struct notifier_block **nl,
> >               struct notifier_block *n)
> >  {
> >       while ((*nl) !=3D NULL) {
> >               if (unlikely((*nl) =3D=3D n)) {
> >                       WARN(1, "double register detected");
> >                       return 0;
> >               }
> > -             if (n->priority > (*nl)->priority)
> > +             if (n->priority >=3D (*nl)->priority)
> >                       break;
> >               nl =3D &((*nl)->next);
> >       }
> >       n->next =3D *nl;
> >       rcu_assign_pointer(*nl, n);
> >       return 0;
> >  }
> >
> > Then the check for uniqueness after adding would be:
> >
> >  WARN(nb->next && nb->priority =3D=3D nb->next->priority);
>
> We can't just change the registration order because invocation order of
> the call chain depends on the registration order

It doesn't if unique priorities are required and isn't that what you want?

> and some of current
> users may rely on that order. I'm pretty sure that changing the order
> will have unfortunate consequences.

Well, the WARN() doesn't help much then.

Either you can make all of the users register with unique priorities,
and then you can make the registration reject non-unique ones, or you
cannot assume them to be unique.

