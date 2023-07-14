Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FCC75324B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jul 2023 08:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.563502.880698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKCeJ-0007XS-VF; Fri, 14 Jul 2023 06:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 563502.880698; Fri, 14 Jul 2023 06:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qKCeJ-0007V0-SM; Fri, 14 Jul 2023 06:51:31 +0000
Received: by outflank-mailman (input) for mailman id 563502;
 Fri, 14 Jul 2023 06:51:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wozw=DA=gmail.com=christopher.w.clark@srs-se1.protection.inumbo.net>)
 id 1qKCeJ-0007Uu-Bl
 for xen-devel@lists.xenproject.org; Fri, 14 Jul 2023 06:51:31 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbf9f290-2212-11ee-8611-37d641c3527e;
 Fri, 14 Jul 2023 08:51:29 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-51cff235226so3160288a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jul 2023 23:51:29 -0700 (PDT)
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
X-Inumbo-ID: dbf9f290-2212-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689317488; x=1691909488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3MCw20tAWoO5aflvCjSt/1lyaGgqvUru1X3wubOp2Xo=;
        b=IHbKWk8sIS92GhORHdC31LhE2lUpO3dlvDlSELYZm+hBXoVCE8ZiDnDopAieHFRHsz
         YSeAGFKnCSNWQ3dhIHCtN5Bmpdo3nS0KGOEX8JpsGaW0EAFEbhcSyfm3Qmo43dMI0f8d
         Vik1iEZrD/vBvpg/dQhtuEjRUqwHyig3gLYQbl/Eo2wsejWUbSfoY6cojJzloqwFsTsJ
         GUaNV2QgFQaZE1r1vznh+bYtWO8YiDgj97X9L41ZbkHTSx4TRPbgAyiQSZ0takJZ9GHn
         Icm8/rVZ/zt3Jrt9b2MMW+2aIpcpdU0AQOnNxHWm+zY3rU7tWDa14wlxZRTj3whD/+ac
         7h2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689317488; x=1691909488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MCw20tAWoO5aflvCjSt/1lyaGgqvUru1X3wubOp2Xo=;
        b=abAkAnLTvgwmcLrF5XGttJiFOH9srbFWszpjxQJxVbWtW5RZKxLeShtQjPJXd2af7H
         zjSNxmB/C+ejD/dWa4GwhodiUNfgGhFvb80dJVJ/03To/G7muAvUxetPVQfKYUH7tL/T
         QbXs6K4fqINdHYPeJqacoeLEJWzAmHK+T2n9Qbcqrz43nr0JYDau562WR3QEjJQvegbf
         f+O817UoYrJgdYhRabm0sOnRe5cdj+2gdO8zmQbVmBfX3V+u6mUCnzynOpPX2LbKuuGL
         gZ00AoJySdYjc3DDmed7cbLE6vIes7/qQBHhiZrr+GrDMns0clDWgdPNSL5OJGx/t7o2
         UKzg==
X-Gm-Message-State: ABy/qLbGyjMqshdkE01FdUGxO2G7dL2IXjXi3DTw9zuonjtqY4DSZWOy
	9Cu054tOinLWM6IOd2BJUTmLKWouPNscob5N730=
X-Google-Smtp-Source: APBJJlEDP3CU1w1GiRakphj9iwv6kHH3u5HoOsV/rH3PPimleeE+ELxI2L28013jqFdRcAu60rbSJYQQlPcM8D6mbYE=
X-Received: by 2002:aa7:d852:0:b0:521:6275:c9af with SMTP id
 f18-20020aa7d852000000b005216275c9afmr707206eds.7.1689317488393; Thu, 13 Jul
 2023 23:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-4-christopher.w.clark@gmail.com> <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2307081144340.761183@ubuntu-linux-20-04-desktop>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 13 Jul 2023 23:51:16 -0700
Message-ID: <CACMJ4GYE6PW1SY35dhs4XkXd9ru25igrvMCrh4pJMWEBNNz0YQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] x86 setup: change bootstrap map to accept new boot
 module structures
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, 
	Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Luca Fancellu <luca.fancellu@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Rich Persaud <persaur@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000cf00e506006ce04c"

--000000000000cf00e506006ce04c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 8, 2023 at 11:47=E2=80=AFAM Stefano Stabellini <sstabellini@ker=
nel.org>
wrote:

> On Sat, 1 Jul 2023, Christopher Clark wrote:
> > To convert the x86 boot logic from multiboot to boot module structures,
> > change the bootstrap map function to accept a boot module parameter.
> >
> > To allow incremental change from multiboot to boot modules across all
> > x86 setup logic, provide a temporary inline wrapper that still accepts =
a
> > multiboot module parameter and use it where necessary. The wrapper is
> > placed in a new arch/x86 header <asm/boot.h> to avoid putting a static
> > inline function into an existing header that has no such functions
> > already. This new header will be expanded with additional functions in
> > subsequent patches in this series.
> >
> > No functional change intended.
> >
> > Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> > Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> >
>
> [...]
>
> > diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h
> > index b72ae31a66..eb93cc3439 100644
> > --- a/xen/include/xen/bootinfo.h
> > +++ b/xen/include/xen/bootinfo.h
> > @@ -10,6 +10,9 @@
> >  #endif
> >
> >  struct boot_module {
> > +    paddr_t start;
> > +    size_t size;
>
> I think size should be paddr_t (instead of size_t) to make sure it is
> the right size on both 64-bit and 32-bit architectures that support
> 64-bit addresses.
>

Thanks, that explanation does make sense - ack.

Christopher


>
>
> >      struct arch_bootmodule *arch;
> >  };
>

--000000000000cf00e506006ce04c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 8, 2023 at 11:47=E2=80=AF=
AM Stefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabel=
lini@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">On Sat, 1 Jul 2023, Christopher Clark wrote:<br>
&gt; To convert the x86 boot logic from multiboot to boot module structures=
,<br>
&gt; change the bootstrap map function to accept a boot module parameter.<b=
r>
&gt; <br>
&gt; To allow incremental change from multiboot to boot modules across all<=
br>
&gt; x86 setup logic, provide a temporary inline wrapper that still accepts=
 a<br>
&gt; multiboot module parameter and use it where necessary. The wrapper is<=
br>
&gt; placed in a new arch/x86 header &lt;asm/boot.h&gt; to avoid putting a =
static<br>
&gt; inline function into an existing header that has no such functions<br>
&gt; already. This new header will be expanded with additional functions in=
<br>
&gt; subsequent patches in this series.<br>
&gt; <br>
&gt; No functional change intended.<br>
&gt; <br>
&gt; Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.c=
lark@gmail.com" target=3D"_blank">christopher.w.clark@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Daniel P. Smith &lt;<a href=3D"mailto:dpsmith@apertusso=
lutions.com" target=3D"_blank">dpsmith@apertussolutions.com</a>&gt;<br>
&gt; <br>
<br>
[...]<br>
<br>
&gt; diff --git a/xen/include/xen/bootinfo.h b/xen/include/xen/bootinfo.h<b=
r>
&gt; index b72ae31a66..eb93cc3439 100644<br>
&gt; --- a/xen/include/xen/bootinfo.h<br>
&gt; +++ b/xen/include/xen/bootinfo.h<br>
&gt; @@ -10,6 +10,9 @@<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct boot_module {<br>
&gt; +=C2=A0 =C2=A0 paddr_t start;<br>
&gt; +=C2=A0 =C2=A0 size_t size;<br>
<br>
I think size should be paddr_t (instead of size_t) to make sure it is<br>
the right size on both 64-bit and 32-bit architectures that support<br>
64-bit addresses.<br></blockquote><div><br></div><div>Thanks, that explanat=
ion does make sense - ack.</div><div><br></div><div>Christopher</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct arch_bootmodule *arch;<br>
&gt;=C2=A0 };<br>
</blockquote></div></div>

--000000000000cf00e506006ce04c--

