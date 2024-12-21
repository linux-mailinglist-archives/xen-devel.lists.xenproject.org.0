Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3CC9FA028
	for <lists+xen-devel@lfdr.de>; Sat, 21 Dec 2024 11:46:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862330.1274091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOwzD-0007kG-9Z; Sat, 21 Dec 2024 10:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862330.1274091; Sat, 21 Dec 2024 10:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOwzD-0007hB-4d; Sat, 21 Dec 2024 10:45:31 +0000
Received: by outflank-mailman (input) for mailman id 862330;
 Sat, 21 Dec 2024 09:59:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/Wq=TO=gmail.com=guoweikang.kernel@srs-se1.protection.inumbo.net>)
 id 1tOwH7-0002K8-1e
 for xen-devel@lists.xenproject.org; Sat, 21 Dec 2024 09:59:57 +0000
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [2607:f8b0:4864:20::b2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 53dc8297-bf82-11ef-99a3-01e77a169b0f;
 Sat, 21 Dec 2024 10:59:55 +0100 (CET)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e3983426f80so2194042276.1
 for <xen-devel@lists.xenproject.org>; Sat, 21 Dec 2024 01:59:55 -0800 (PST)
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
X-Inumbo-ID: 53dc8297-bf82-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734775194; x=1735379994; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egHprya5wIN6bGofZtv4dfpbBXKQe0iUzhyvNvr/kt4=;
        b=fm9GSEqxDaRkxv/jpFp3CwPuhBUW9yE0neW4OCm4kQMVA8qkxLqqdmnLnI59LBnouL
         MhSefT23twmYIihd0I1ENiTnpqznJcFs7RLuyagE1MVDtiW7xbJ52wLWg3X//p80V5o7
         tsfeH0dC07a4M3ujeSaHiv13AevRKF67k8iv7dzzs/KguGCrPg6xoqImGiTBSRrn6cHY
         vKmmct1UINXKAzYv1Ee3NU+sEbCVmhHHYrOuBdecCN31wS/z1Rtobsmzd6Io4lnTRQER
         zVfczuTmml3EFmU3yF7QRd8Oeq8vDkpf4pnj52XpNvrHiCX41jvyUZhpVGBQJt3Dhw9d
         gYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734775194; x=1735379994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egHprya5wIN6bGofZtv4dfpbBXKQe0iUzhyvNvr/kt4=;
        b=na8iB697bJnRJB1yfrWddyJsRd4LsUS8mQQN6siO96rCeeWsgRXgs5LZI85yfpKArk
         XqZpmnMxTj7Vw1uIY6cVHhZRyRTRDehOXV+6YQOd/bb/DurehumQUl5F8ckc6klyQz4z
         fZ3aPM11oFu6zcMasUihewhEZt4zyg0kFxXH26qp/xXHHn+09VgzUPZFjCr5PsiufvGE
         OAP0nPCoHGLoc5j+vXMYRla3Nj1CZpVLXn7tjnbGlr0XBGPglDL9LbEV39hTgi4Dz4UZ
         hy9W/BbEYkI3GoUVBs0U05VXCmAJTd1JO1CeQZKQJ0wel0gdgQHZf/OODyUduZhznHvX
         rSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoW9gujuz2tKV1o0318w7562PoHg5cJxRmW6i3PFRhr2gnvmUP99joBmEmtDy4kkbo9Wt/tHGMkjw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHTLyFF7sO24qKro/IctPhMhvKGBjlPvbvNgJTzu8Ogb+9YTex
	yE3rivAooJf9D/6aHOZ7fxg7siBZN8kOti+G5h0EIIBmhoflypjIASVCCZIgwhOsUsYQbwry/AL
	QL9FOq+xo92kH41bDpwgAW1i2Hmk=
X-Gm-Gg: ASbGnct77yC4Iu0jeRob9d79VHTBoM/K2l4lMqAmL6E87W90RyY+Mgzrfn8cy1lrZXQ
	4QntiTVz0uZlMhFOD8/LhaR9GTRtwRP18k2LpplA=
X-Google-Smtp-Source: AGHT+IG9hgHXPNsbBNiOuY+6OAJ+D2q82bPj4v1OfjOz7h337kMTVjsW2qLUpiuBZXc33tZc49lNKi5hOGaIXzFbkh0=
X-Received: by 2002:a05:690c:4b13:b0:6ef:7036:3b25 with SMTP id
 00721157ae682-6f3f8216b3cmr49229327b3.31.1734775193934; Sat, 21 Dec 2024
 01:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20241220092638.2611414-1-guoweikang.kernel@gmail.com> <20241220150623.278e8fa9f073b66dc81edfe6@linux-foundation.org>
In-Reply-To: <20241220150623.278e8fa9f073b66dc81edfe6@linux-foundation.org>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sat, 21 Dec 2024 17:59:43 +0800
Message-ID: <CAOm6qnnFDjyiQvUmyVA4iq5aJAO8NC=wcAvpKscvfRZKPnzkYw@mail.gmail.com>
Subject: Re: [PATCH] mm/memblock: Add memblock_alloc_or_panic interface
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>, rafael.j.wysocki@intel.com, 
	Palmer Dabbelt <palmer@rivosinc.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, Johannes Berg <johannes.berg@intel.com>, 
	Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Christian Brauner <brauner@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff Levand <geoff@infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Len Brown <lenb@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Tero Kristo <kristo@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Pavel Machek <pavel@ucw.cz>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Marco Elver <elver@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	kasan-dev@googlegroups.com, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-acpi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-omap@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Morton <akpm@linux-foundation.org> wrote on Saturday, 21
December 2024 07:06:
>
> On Fri, 20 Dec 2024 17:26:38 +0800 Guo Weikang <guoweikang.kernel@gmail.c=
om> wrote:
>
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immedi=
ate
> > panic is required. To simplify this behavior and reduce repetitive chec=
ks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavio=
r.
> >
>
> Seems nice.
>
> > ...
> >
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -417,6 +417,19 @@ static __always_inline void *memblock_alloc(phys_a=
ddr_t size, phys_addr_t align)
> >                                     MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_=
NODE);
> >  }
> >
> > +static __always_inline void *memblock_alloc_or_panic(phys_addr_t size,=
 phys_addr_t align)
>
> We lost the printing of the function name, but it's easy to retain with
> something like
>
> #define memblock_alloc_or_panic(size, align)    \
>                 __memblock_alloc_or_panic(size, align, __func__)
>
You're absolutely right, this was an oversight on my part. I=E2=80=99ll mak=
e
sure to update it with the correct function name.
> > +{
> > +     void *addr =3D memblock_alloc(size, align);
> > +
> > +     if (unlikely(!addr))
> > +#ifdef CONFIG_PHYS_ADDR_T_64BIT
> > +             panic("%s: Failed to allocate %llu bytes\n", __func__, si=
ze);
>
> Won't this always print "memblock_alloc_or_panic: Failed ..."?  Not
> very useful.
>
As mentioned above.
> > +#else
> > +             panic("%s: Failed to allocate %u bytes\n", __func__, size=
);
> > +#endif
>
> We can avoid the ifdef with printk's "%pap"?
>
I appreciate you pointing this out. I wasn=E2=80=99t aware of this approach=
,
but it=E2=80=99s a great idea. It definitely simplifies things, and I=E2=80=
=99ve
learned something new in the process. I'll incorporate this into the
code.
> > +     return addr;
> > +}
>

