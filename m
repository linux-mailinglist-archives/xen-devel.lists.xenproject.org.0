Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BA8350B7E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 03:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104091.198684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRlnE-0006c3-Tu; Thu, 01 Apr 2021 01:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104091.198684; Thu, 01 Apr 2021 01:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRlnE-0006bh-QX; Thu, 01 Apr 2021 01:06:40 +0000
Received: by outflank-mailman (input) for mailman id 104091;
 Thu, 01 Apr 2021 01:06:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0cfn=I6=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1lRlnD-0006bc-ON
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 01:06:39 +0000
Received: from mail-qt1-x82d.google.com (unknown [2607:f8b0:4864:20::82d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57233a77-0717-43da-8c2d-705c60856b16;
 Thu, 01 Apr 2021 01:06:37 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id g24so393038qts.6
 for <xen-devel@lists.xenproject.org>; Wed, 31 Mar 2021 18:06:37 -0700 (PDT)
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
X-Inumbo-ID: 57233a77-0717-43da-8c2d-705c60856b16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I4XnTBqWaNHfJM0uifctrfC1GtW1564zJxX4MuGrMVI=;
        b=j4JCaWgTgHeE9hNCyf3zLgLl3NZvmOoLiw4Ep/EC6ix7jX0/TAzMjB+byX+ZGjleg1
         tlNWElFHsnba0WSpmSvZVrmBUBLfaeYKGv3Mc8ilJN6xtyu/5Jt9XvWQbvt0PXJpvx95
         jYOogg0fpdsx6ZmBvcrEa70SERHP4L6GMG4AQZm3ejWOFjLPGEy9gTUj76prrx6RccTT
         a14OEn6o3qJwbyRWZT5BJw5TUimbm3lXCtkhpPKCKJeEGZCB9w/T8Qp+ybP9yht/6RBD
         B4DlodB28DAGjJVdFlWDy4P57Yb3RaWiE+gTVk08iOh92euQ/XYTWh8wKOGJHUsDQkId
         rBlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I4XnTBqWaNHfJM0uifctrfC1GtW1564zJxX4MuGrMVI=;
        b=FQJKh2Jo0ko1zJ1u6uFXxvNEzUni9WXk/R8JfpQOrzFcNu715evzZZGE6ZnPRHuuUB
         uBbQf/kHnmggYuhCc7ZETLYxrQrb54XtKYWHsDD0UW4sohuzNxAKC94bu7zjC7oFpk1f
         VFbdslzAot2qQmdnBflRNYPD8HRAp+WzRQrOKzOaHj2jbMzUEstPaaPBDfjDv78zhYCX
         xYA9yoSBMME2yhCcHkCPIesDEjlJDM4bo3BdVAk8OydmhfaLJ59Z4KiykwPYMljYhhlM
         LAnp0iAgl1K92eUUhaG6mBzhzOmZEhYhiBMO3+QfxaO6DaJqYkLnDtm9rZZ6YJ/4MwXN
         BJpA==
X-Gm-Message-State: AOAM532RuWtGjI4URlBunrU3fRDkwVG8NVMTQwT/M1vvGgoZdLo7/Trb
	eGCSHjVTlICmvhKbHCh+Sfp28hadt1WS4KrxWjJQhA==
X-Google-Smtp-Source: ABdhPJwGa4irE89lKL5j7+qT7fRWuH62QG8dMMrr/BtnompBjfBQ5fQ3cVmy8GlUz5hnj8n23BMFDOCaDyC0diXaLjY=
X-Received: by 2002:ac8:1093:: with SMTP id a19mr5064689qtj.365.1617239197376;
 Wed, 31 Mar 2021 18:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy8Wpwgj3V0U8OhsZCgyAxOjTeHDMt-Vw+om1koopmxTsg@mail.gmail.com>
 <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com>
In-Reply-To: <23baec07-a3ae-949a-a1fb-09100efd53e5@citrix.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Wed, 31 Mar 2021 18:06:31 -0700
Message-ID: <CAMmSBy96=FwR0zZy199e0YhFefgZj_PFOMiaB2nKjqdQvKufow@mail.gmail.com>
Subject: Re: multiboot2 and module2 boot issues via GRUB2
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, grub-devel@gnu.org
Content-Type: multipart/alternative; boundary="000000000000e0809d05beded750"

--000000000000e0809d05beded750
Content-Type: text/plain; charset="UTF-8"

Hi Andrew!

first of all -- thanks for pointing me in the right direction. So after
reading relevant sources: comments inline.

On Tue, Mar 30, 2021 at 12:08 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 30/03/2021 19:28, Roman Shaposhnik wrote:
> > Hi!
> >
> > seems like I've run into an issue with multiboot2 and module2
> > commands that I can't quite explain. Since it may be something
> > super simply and silly -- I wanted to reach out here before I do
> > a GRUB/Xen/LK source deepdive.
> >
> > So here's the deal: whenever I boot straight up Linux kernel
> > I can do the following sequence of commands:
> >    linux /kernel
> >    initrd foo.cpio.gz bar.cpio.gz
> > and have linux kernel effectively stack content of bar.cpio.gz
> > on top of foo.cpio.gz and present a unified initramfs that way.
> >
> > I'm trying to replicate it with Xen, but:
> >      multiboot2 /boot/xen.gz
> >      module2 /kernel
> >      module2 foo.cpio.gz
> >      module2 bar.cpio.gz
> > only seems to be picking up foo.cpio.gz
> >
> > Has anyone run into this issue before?
>
> I can explain why that happens.  Not sure if it counts as a feature, bug
> or mis-expectation, but CC'ing grub-devel for their input.
>
> The initrd command is presumably concatenating those two files together
> in memory, and presenting Linux a single initrd pointer.
>

It is indeed what seems to be happening.


> For the module2 example, you're putting 3 distinct files in memory, and
> giving Xen a list 3 modules.
>

And that is also correct -- nothing like that is possible with modules.
Kernel actually needs to be aware of them. So the question then
becomes...


> Xen is capable of taking various things via modules, such as an
> XSM/Flask policy, or microcode, so has logic to identify these if
> present and separate them from "other stuff".  However, there is a
> hardcoded expectation that the first module is the dom0 kernel, and the
> next unrecognised module, if present, is *the* initrd.

I expect that Xen isn't handing bar.cpio.gz on to dom0, but I'm not sure
> whether passing two distinct initrd-like-things to Linux is even possible.
>
> What you presumably want is some `initrd` side effect in Grub so you can
> write `module2 foo.cpio.gz bar.cpio.gz` and have it concatenate things
> together in memory and present one MB2 module, but I suspect that exact
> syntax might be ambiguous with command line handling.  I have no idea
> whether such a command currently exists.
>

...I guess there's no mechanism out-of-the box to achieve what I want?

And the obvious next question: is my EVE usecase esoteric enough that
I should just go ahead and do a custom GRUB patch or is there a more
general interest in this?

Thanks,
Roman.

--000000000000e0809d05beded750
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Andrew!<div><br></div=
><div>first of all -- thanks for pointing me in the right direction. So aft=
er reading relevant sources: comments inline.</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 30, 2021 at =
12:08 PM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com">and=
rew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">On 30/03/2021 19:28, Roman Shaposhnik wrote:<br>
&gt; Hi!<br>
&gt;<br>
&gt; seems like I&#39;ve run into an issue with multiboot2=C2=A0and module2=
<br>
&gt; commands that I can&#39;t quite explain. Since it may be something<br>
&gt; super simply and silly -- I wanted to reach out here before I do<br>
&gt; a GRUB/Xen/LK source deepdive.<br>
&gt;<br>
&gt; So here&#39;s the deal: whenever I boot straight up Linux kernel<br>
&gt; I can do the following sequence of commands:<br>
&gt; =C2=A0 =C2=A0linux /kernel<br>
&gt; =C2=A0 =C2=A0initrd foo.cpio.gz bar.cpio.gz<br>
&gt; and have linux kernel effectively stack content of bar.cpio.gz<br>
&gt; on top of foo.cpio.gz and present a unified initramfs that way.<br>
&gt;<br>
&gt; I&#39;m trying to replicate it with Xen, but:<br>
&gt; =C2=A0 =C2=A0 =C2=A0multiboot2 /boot/xen.gz<br>
&gt; =C2=A0 =C2=A0 =C2=A0module2 /kernel<br>
&gt; =C2=A0 =C2=A0 =C2=A0module2 foo.cpio.gz<br>
&gt; =C2=A0 =C2=A0 =C2=A0module2 bar.cpio.gz<br>
&gt; only seems to be picking up foo.cpio.gz<br>
&gt;<br>
&gt; Has anyone run into this=C2=A0issue before?<br>
<br>
I can explain why that happens.=C2=A0 Not sure if it counts as a feature, b=
ug<br>
or mis-expectation, but CC&#39;ing grub-devel for their input.<br>
<br>
The initrd command is presumably concatenating those two files together<br>
in memory, and presenting Linux a single initrd pointer.<br></blockquote><d=
iv><br></div><div>It is indeed what seems to be happening.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
For the module2 example, you&#39;re putting 3 distinct files in memory, and=
<br>
giving Xen a list 3 modules.<br></blockquote><div><br></div><div>And that i=
s also correct -- nothing like that is possible with modules.</div><div>Ker=
nel actually needs to be aware of them. So the question then</div><div>beco=
mes...</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
Xen is capable of taking various things via modules, such as an<br>
XSM/Flask policy, or microcode, so has logic to identify these if<br>
present and separate them from &quot;other stuff&quot;.=C2=A0 However, ther=
e is a<br>
hardcoded expectation that the first module is the dom0 kernel, and the<br>
next unrecognised module, if present, is *the* initrd.=C2=A0</blockquote><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">I expect that Xen isn&#39;t=
 handing bar.cpio.gz on to dom0, but I&#39;m not sure<br>
whether passing two distinct initrd-like-things to Linux is even possible.<=
br>
<br>
What you presumably want is some `initrd` side effect in Grub so you can<br=
>
write `module2 foo.cpio.gz bar.cpio.gz` and have it concatenate things<br>
together in memory and present one MB2 module, but I suspect that exact<br>
syntax might be ambiguous with command line handling.=C2=A0 I have no idea<=
br>
whether such a command currently exists.<br></blockquote><div><br></div><di=
v><div>...I guess there&#39;s no mechanism out-of-the box to achieve=C2=A0w=
hat I want?</div><div></div></div><div>=C2=A0</div><div>And the obvious nex=
t question: is my EVE usecase esoteric enough that</div><div>I should just =
go ahead and do a custom=C2=A0GRUB patch or is there a more</div><div>gener=
al interest in this?</div><div><br></div><div>Thanks,<br>Roman.</div></div>=
</div></div>

--000000000000e0809d05beded750--

