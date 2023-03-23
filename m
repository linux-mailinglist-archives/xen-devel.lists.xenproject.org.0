Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5F6C6DCB
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 17:37:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513968.795782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNvg-0005wm-3m; Thu, 23 Mar 2023 16:36:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513968.795782; Thu, 23 Mar 2023 16:36:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfNvg-0005u5-0X; Thu, 23 Mar 2023 16:36:44 +0000
Received: by outflank-mailman (input) for mailman id 513968;
 Thu, 23 Mar 2023 16:36:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jT86=7P=gmail.com=geert.uytterhoeven@srs-se1.protection.inumbo.net>)
 id 1pfNve-0005tz-NJ
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 16:36:42 +0000
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e345e231-c998-11ed-85db-49a42c6b2330;
 Thu, 23 Mar 2023 17:36:41 +0100 (CET)
Received: by mail-qv1-f54.google.com with SMTP id t13so14463146qvn.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 Mar 2023 09:36:41 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 m64-20020a375843000000b0073b8512d2dbsm13332051qkb.72.2023.03.23.09.36.38
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 09:36:39 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id n14so884596qta.10
 for <xen-devel@lists.xenproject.org>; Thu, 23 Mar 2023 09:36:38 -0700 (PDT)
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
X-Inumbo-ID: e345e231-c998-11ed-85db-49a42c6b2330
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679589399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UL3/4GqvmmUqfCC6k4K5nIi6sLrnnlUEco09johNyxg=;
        b=8Feh+SDUNT7jMFLzXwkR9OhFrzhWcjBqedlchEyWrWc3zZycsPhihhGZcIyKu+lg48
         PnQhba4NPEsMooxOyyxpwfFd9h8O4syoDPL0iypNBdRC3urhGCdpmglxe/xQB+VhH3f2
         7w2vWbxe8MCeR8PmAMpmMaO6AmnNqzAxZvQe8DprgcfOB12Y49lCKBl4ZC92ekkcKZzb
         Xiurh8kEIoc7aKLo9N/y2AIHbUZN/xcmFju522sk/W61tQ22lsbrKxUcfnHj5av9f+sH
         cPq3qbRWBUDwfhSLnhmhG64LlYpjzO5iHb+HYA+yrBhAAlV6Xh42v92YR5wtj/p4iF0C
         X3cA==
X-Gm-Message-State: AO0yUKW0/USUmFR0ZI0UsyS0gQuyrv8LP2AKnuOmDxT1XsvH/euo8bLg
	Nydvf4NgG0Q9jJiM1eFLo0mEL9fc7qk+iA==
X-Google-Smtp-Source: AK7set9T36xF7y8OT7404FnW+eu7NK6HT/RB/8jWqsmpnmJXwkp89zrzNVJ5Zjer+Lbrw9xWLH0meQ==
X-Received: by 2002:a05:6214:130f:b0:5ad:2a05:ddd1 with SMTP id pn15-20020a056214130f00b005ad2a05ddd1mr12951301qvb.34.1679589399232;
        Thu, 23 Mar 2023 09:36:39 -0700 (PDT)
X-Received: by 2002:a05:6902:728:b0:a09:314f:a3ef with SMTP id
 l8-20020a056902072800b00a09314fa3efmr2603297ybt.12.1679588947338; Thu, 23 Mar
 2023 09:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <ZBxiaflGTeK8Jlgx@smile.fi.intel.com> <20230323150238.GA2550157@bhelgaas>
 <ZBxrfy83MRjnReAs@smile.fi.intel.com>
In-Reply-To: <ZBxrfy83MRjnReAs@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Mar 2023 17:28:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkavUwZrfuJ5YSsb2kkHVZ0TCzcme5o6CkYGcSDVt+jw@mail.gmail.com>
Message-ID: <CAMuHMdWkavUwZrfuJ5YSsb2kkHVZ0TCzcme5o6CkYGcSDVt+jw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] PCI: Introduce pci_dev_for_each_resource()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Randy Dunlap <rdunlap@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Juergen Gross <jgross@suse.com>, 
	Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Anatolij Gustschin <agust@denx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Bjorn Helgaas <bhelgaas@google.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Thu, Mar 23, 2023 at 4:15=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Mar 23, 2023 at 10:02:38AM -0500, Bjorn Helgaas wrote:
> > I poked around looking for similar patterns elsewhere with:
> >   git grep "#define.*for_each_.*_p("
> >   git grep "#define.*for_each_.*_idx("
> >
> > I didn't find any other "_p" iterators and just a few "_idx" ones, so
> > my hope is to follow what little precedent there is, as well as
> > converge on the basic "*_for_each_resource()" iterators and remove the
> > "_idx()" versions over time by doing things like the
> > pci_claim_resource() change.
>
> The p is heavily used in the byte order conversion helpers.

I can't seem to find them. Example?

Or do you mean cpu_to_be32p()? There "p" means pointer,
which is something completely different.

> > What do you think?  If it seems like excessive churn, we can do it
> > as-is and still try to reduce the use of the index variable over time.
>
> I think _p has a precedent as well. But I can think about it a bit, maybe
> we can come up with something smarter.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

