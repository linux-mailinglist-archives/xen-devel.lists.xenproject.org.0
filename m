Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9473E1ED4C3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 19:14:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgWxh-0005oc-6o; Wed, 03 Jun 2020 17:13:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UXpq=7Q=gmail.com=codewiz2280@srs-us1.protection.inumbo.net>)
 id 1jgWxf-0005oX-KV
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 17:13:55 +0000
X-Inumbo-ID: 9a16d52a-a5bd-11ea-8993-bc764e2007e4
Received: from mail-ej1-x62a.google.com (unknown [2a00:1450:4864:20::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9a16d52a-a5bd-11ea-8993-bc764e2007e4;
 Wed, 03 Jun 2020 17:13:54 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id y13so3001980eju.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jun 2020 10:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jOW/QelkbErSI7Qz7IIvYJZTZKsKByoXf52FyLHxkbw=;
 b=e/4+BpLo3RSLv2gE3vHbF3cYIyOmx8SA1nOdiw0u5zOXkRQUtJQJSwifjhUbAhT+yG
 LNVXrwOqnkLm9f06g4eqbF28lI7ameyBQM+jfrfPr5mS3PG1Y4REcgkvbpC6Q/FKWhuU
 +t1TPN7m2y7wzdXvSO5Zyqj41s1FN54gqHwupMLlDwj8TZ4WLqnEzMCwHR8MNMV8cnk1
 28GAOXFEWXy37Lp751PqFGQw24wubbYklbrE8Ez9G5x3bTF4J1SHDPS/tYQ/+N3V14AR
 ct8hCXPyFAzYlTQVapnAYkUGupRXTPXslNvTCQSM5vROBQ2ngcDkvMQZc2nAvF+bkBWi
 4Y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jOW/QelkbErSI7Qz7IIvYJZTZKsKByoXf52FyLHxkbw=;
 b=IM6pmPqR+nypGZmFT96z66hfrUq9iVcI5BF9x7jVtaqi6UDjYAxQZugGYsYJM2e01S
 tTgwe+8SdrHwrzrao+Br8Uj173nhVUStBALUTh5MRA/QaIRe9nPy0pZdxFKyMo+8Xb9/
 AGinwT/TUZrnYsMrGrF93bKjuI+OThKdWjE8MQszIfWj0UFNBOTcAiATCpZv6Di++swq
 uPGBCG/d3lQLEZa/Zyk+Ra9N+Z/NROUTvxuiA/KEvX37CGz+SYrPVx5ph9cXTo28XX+f
 NVBVOobv0t5QerQFgCmu4BOYcfE4INYShlvVdqjpi8Fe3HfJFPM4kG3gwSvouSPzDOmN
 4/XQ==
X-Gm-Message-State: AOAM532OL2/46dZ34IzC+W3icZz/3j7UlxP0ZCvjQrdA7UPPXBgoMB1T
 tB5YP0QbTcq4OtfLqVsLmaP6FgjNw6PYXwoI0JU=
X-Google-Smtp-Source: ABdhPJzIxljgPURkW5qbY10abuUMcG6YbuPHmq/ME+PmhaGwYmoklx0eFYFN5GVdRk9wTfKCzjG4/y0ipwN304YZ/oU=
X-Received: by 2002:a17:906:11d9:: with SMTP id
 o25mr248561eja.377.1591204433742; 
 Wed, 03 Jun 2020 10:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
In-Reply-To: <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
From: CodeWiz2280 <codewiz2280@gmail.com>
Date: Wed, 3 Jun 2020 13:13:39 -0400
Message-ID: <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
Subject: Re: Keystone Issue
To: Julien Grall <julien@xen.org>
Content-Type: multipart/alternative; boundary="00000000000009cde605a7312762"
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000009cde605a7312762
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

The offset is already applied to the memory nodes in the device tree,
meaning a direct Linux boot from uboot would have only the 36-bit addresses
in the device tree (0x8_0000_0000 and 0x8_8000_0000).  Linux would start
executing from a 32-bit address space however and then switch over to the
aliased 36-bit addresses in the device tree as discussed below by
early_paging_init().

I had to add the 32-bit memory node 0x8000_0000 in uboot in place of the
0x8_0000_0000 node otherwise Xen would detect the 32-bit processor and
panic on "Unable to detect the first memory bank" in domain_build.c.  If I
leave only the 36-bit addresses in the device tree and skip past the panic
check in domain_build.c, then I could not get the dom0 kernel to boot at
all.  I believe I would only see "Serial input to DOM0" and nothing else at
that point.

Yes, leaving LPAE support on for the kernel is preferred.

Thank you for your help in this matter.

Respectfully,
Dave

On Wed, Jun 3, 2020 at 7:32 AM Julien Grall <julien@xen.org> wrote:

> (+Bertrand and Stefano)
>
> On 01/06/2020 18:38, CodeWiz2280 wrote:
> > Hi Julien,
>
> Hi Dave,
>
> >
> > As requested please see log below from the eval board booting dom0, some
> > notes are as follows:
>
> Thanks for the logs and the notes. They are useful to understand your
> issue.
>
> > 1. The offset that gets applied to the 32-bit address to translate it
> > to 36-bits is 0x7_8000_0000
>
> Is this offset present in the Device-Tree?
>
> > 2. Uboot has been setup to not change the address of the memory in the
> > device tree prior to launching xen, otherwise it would
> > automatically offset it and replace it with a 36-bit address and xen
> > would immediately panic at the 36-bit address for a 32-bit processor.
>
> What is the list of the memory banks Xen will see?
>
> Xen is able to support 36-bit address, can you point to the panic() you
> are hitting?
>
> > 3. The RAM starting address placed in the device tree is 0x8000_0000,
> > which gets carved up by xen and replaced with 0xA000_0000 prior to
> > booting dom0..  I had to put in test code to have the kernel offset the
> > 0xA000_0000 32-bit starting address to the 36-bit address needed before
> > the kernel will attempt to switch.  If it stays 32-bit then it will not
> > switch over the address space.  Note that without xen in play uboot
> > would normally replace the address in the device tree with the 36-bit
> one.
>
> IIUC, in the case of Linux boot directly, the Device-Tree will not
> describe the low memory range. Is that correct?
>
> > 4. The dom0 kernel will boot from xen if the early_paging_init switch
> > step is skipped, and the low mem stays in 32-bit....but there is a
> > problem with the peripherals so this is not an acceptable solution.
>
> Can you details a bit more the problem with the peripherals?
>
> >
> > It seems that either the kernel would need some API to tell xen that
> > there is going to be a change in the memory its using prior to call
> > early_paging_init(),
>
>  From my understanding, the problem is very specific to the KeyStone. So
> I would rather avoid to introduce an hypercall specific to your
> platform. But...
>
> > or Xen would need to add the additional 36-bit
> > addresses during the memory bank allocation step....but recognize that
> > they are not actually different physical memory but just aliased to a
> > different address.
>
> ... I think it is possible to fix it entirely in Xen without any
> modification in the device-tree.
>
> It is seems better that Xen treats the low memory region as "not usable"
> and only use the high memory region internally. When allocating a Dom0
> memory banks, it would need to ensure that there is a corresponding
> alias in low memory.
>
> Xen will also need to do two mappings in the Dom0 stage-2 page-tables.
> The extra one is for the alias.
>
> This approach will prevent to use hypercall buffer from low memory and
> therefore require your guest to support LPAE. Is it going to be an issue
> for you?
>
> Cheers,
>
> --
> Julien Grall
>

--00000000000009cde605a7312762
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Julien,<div><br></div><div>The offset is already applie=
d to the memory nodes in the device tree, meaning a direct Linux boot from =
uboot would have only the 36-bit addresses in the device tree (0x8_0000_000=
0 and 0x8_8000_0000).=C2=A0 Linux would start executing from a 32-bit addre=
ss space however and then switch over to the aliased 36-bit addresses in th=
e device tree as discussed below by early_paging_init().</div><div><br></di=
v><div>I had to add the 32-bit memory node 0x8000_0000 in uboot in place of=
 the 0x8_0000_0000 node otherwise Xen would detect the 32-bit processor and=
 panic on &quot;Unable to detect the first memory bank&quot; in domain_buil=
d.c.=C2=A0 If I leave only the 36-bit addresses in the device tree and skip=
 past the panic check in domain_build.c, then I could not get the dom0 kern=
el to boot at all.=C2=A0 I believe I would only see &quot;Serial input to D=
OM0&quot; and nothing else at that point.=C2=A0=C2=A0</div><div><br></div><=
div>Yes, leaving LPAE support on for the kernel is preferred.</div><div><br=
></div><div>Thank you for your help in this matter.</div><div><br></div><di=
v>Respectfully,</div><div>Dave=C2=A0</div></div><br><div class=3D"gmail_quo=
te"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 3, 2020 at 7:32 AM Ju=
lien Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(+Bertrand a=
nd Stefano)<br>
<br>
On 01/06/2020 18:38, CodeWiz2280 wrote:<br>
&gt; Hi Julien,<br>
<br>
Hi Dave,<br>
<br>
&gt; <br>
&gt; As requested please see log below from the eval board booting dom0, so=
me <br>
&gt; notes are as follows:<br>
<br>
Thanks for the logs and the notes. They are useful to understand your issue=
.<br>
<br>
&gt; 1. The offset that gets applied to the 32-bit address to translate it =
<br>
&gt; to=C2=A036-bits is 0x7_8000_0000<br>
<br>
Is this offset present in the Device-Tree?<br>
<br>
&gt; 2. Uboot has been setup to not change the address of the memory in the=
 <br>
&gt; device tree prior to launching xen, otherwise it would <br>
&gt; automatically=C2=A0offset it and=C2=A0replace it with a=C2=A036-bit ad=
dress=C2=A0and xen <br>
&gt; would immediately panic at the 36-bit address for a 32-bit processor.<=
br>
<br>
What is the list of the memory banks Xen will see?<br>
<br>
Xen is able to support 36-bit address, can you point to the panic() you <br=
>
are hitting?<br>
<br>
&gt; 3. The RAM starting address placed in the device tree is 0x8000_0000, =
<br>
&gt; which gets carved up by=C2=A0xen and replaced with 0xA000_0000 prior t=
o <br>
&gt; booting dom0..=C2=A0 I had to put in test code to have the kernel offs=
et the <br>
&gt; 0xA000_0000 32-bit starting address to the 36-bit address needed befor=
e <br>
&gt; the kernel will attempt to switch.=C2=A0 If it stays 32-bit then it wi=
ll not <br>
&gt; switch over the address space.=C2=A0 Note that without xen in play ubo=
ot <br>
&gt; would normally replace the address in the device tree with the 36-bit =
one.<br>
<br>
IIUC, in the case of Linux boot directly, the Device-Tree will not <br>
describe the low memory range. Is that correct?<br>
<br>
&gt; 4.=C2=A0The dom0 kernel will boot from xen=C2=A0if the early_paging_in=
it switch <br>
&gt; step is skipped, and the low mem stays in 32-bit....but there is a <br=
>
&gt; problem with the peripherals so this is not an acceptable solution.<br=
>
<br>
Can you details a bit more the problem with the peripherals?<br>
<br>
&gt; <br>
&gt; It seems that either the kernel would need some API to tell xen that <=
br>
&gt; there is going to be a change in the memory its using prior to call <b=
r>
&gt; early_paging_init(), <br>
<br>
=C2=A0From my understanding, the problem is very specific to the KeyStone. =
So <br>
I would rather avoid to introduce an hypercall specific to your <br>
platform. But...<br>
<br>
&gt; or Xen would need to add the additional 36-bit <br>
&gt; addresses during the memory bank allocation step....but recognize that=
 <br>
&gt; they are not actually different physical memory but just aliased to a =
<br>
&gt; different address.<br>
<br>
... I think it is possible to fix it entirely in Xen without any <br>
modification in the device-tree.<br>
<br>
It is seems better that Xen treats the low memory region as &quot;not usabl=
e&quot; <br>
and only use the high memory region internally. When allocating a Dom0 <br>
memory banks, it would need to ensure that there is a corresponding <br>
alias in low memory.<br>
<br>
Xen will also need to do two mappings in the Dom0 stage-2 page-tables. <br>
The extra one is for the alias.<br>
<br>
This approach will prevent to use hypercall buffer from low memory and <br>
therefore require your guest to support LPAE. Is it going to be an issue <b=
r>
for you?<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div>

--00000000000009cde605a7312762--

