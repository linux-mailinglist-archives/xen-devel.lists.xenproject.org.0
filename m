Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7522B9EAA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 00:50:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31474.61869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfthC-0004Rv-CH; Thu, 19 Nov 2020 23:50:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31474.61869; Thu, 19 Nov 2020 23:50:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfthC-0004RX-7j; Thu, 19 Nov 2020 23:50:34 +0000
Received: by outflank-mailman (input) for mailman id 31474;
 Thu, 19 Nov 2020 23:50:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsEV=EZ=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1kfthB-0004RQ-6B
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 23:50:33 +0000
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dc716463-d5a1-41e8-841b-32580124494d;
 Thu, 19 Nov 2020 23:50:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a3so8260574wmb.5
 for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 15:50:31 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=BsEV=EZ=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
	id 1kfthB-0004RQ-6B
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 23:50:33 +0000
X-Inumbo-ID: dc716463-d5a1-41e8-841b-32580124494d
Received: from mail-wm1-x342.google.com (unknown [2a00:1450:4864:20::342])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id dc716463-d5a1-41e8-841b-32580124494d;
	Thu, 19 Nov 2020 23:50:31 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id a3so8260574wmb.5
        for <xen-devel@lists.xenproject.org>; Thu, 19 Nov 2020 15:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4FWCyd3ccPYRmK2YYFztu4XdLvsi8+owiJPDmOdZvQ4=;
        b=JrKnPcY1/seX2F7juMKFPjxc6Azbp4s+w7psIumGmFTWSOe5Wvf2ECrJSE2WEN5TZE
         ZOBAkqqJd0aiTjck3rGyUsaNzYwZT0Mdyu6/R1ZMYBOEkL2n1VwGSqaU7UO6doe2tHUW
         notR5lp70c/d98Q/GHxqUADu1SBUO9TFSZtdBrcv2eS7F6VDIDk9qpNc4jwRaCSc6B89
         VKfCI3ywbbGcQ8sDWZ2zTxooe81NyHwitaLajGqHpovCj60afxLGJH1qvhHqPHT/XRjv
         IC5cLzUuatsJfdNW0v/RR0mkqzqRvml/hbyqJaO7S64+MTg2DNQvZG0onTeU6dIDNvN8
         ugXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4FWCyd3ccPYRmK2YYFztu4XdLvsi8+owiJPDmOdZvQ4=;
        b=mW6BGTk1ZCvoXEr9dnsxvOfACjOvOhsndWr2QNt+ubXNXGXWMgwwE301zSm/p353ft
         T/DJGnBt0Zh2n7Nb16RCJRHpb5/MjHXTtBbsyZYY//At+Nw0dLTskGvMpRr6SU8k7YaE
         CKYlC+Xy6RzvXC8tXJ3sW94Sgl+xoxnIKUMqonxUoq9anqDpgeNm1TZ3AEgOKKmu1gMZ
         AKiefjEBG+A/zal6KpMx+zzoBsgw9EIe6vzzWbxHKNtcGhsK/XnCOLIw6vWF3lu7d6+7
         LhWYrybxGKxCYhJfsfvW4qWV7Sruw3jlt6vFk6J00pvKnIOY5TDdflrgZh08Q6gQnMZ9
         xiLQ==
X-Gm-Message-State: AOAM533tvO81Z8saFDtfq4dhxFgi3qPo+0PUcToMygkJNhXEUyZtVwfZ
	lamzWQ7xR8Cwa1OXUfthMrfO6pt4ArxZvKeXB6Y=
X-Google-Smtp-Source: ABdhPJzI3g+FgivQaqXhoNN0gXFhCiwql+RPd1td7iWR9u3foX9Bu+rubegU7SAKM4CarnUbPSSfUUXSaj/iLOXHRIs=
X-Received: by 2002:a1c:98c7:: with SMTP id a190mr6582103wme.7.1605829830721;
 Thu, 19 Nov 2020 15:50:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605527997.git.rahul.singh@arm.com> <955996aa8cd7f17f9f39c60bd3b9b74ffaa5c5f7.1605527997.git.rahul.singh@arm.com>
 <3740e147-719a-4e97-bb0e-fe9bd2ec2aa5@xen.org> <aa256a44-8f8f-d4f1-f5f4-12529f45d8c8@suse.com>
 <9007e08f-6d90-88ed-ba64-2f0b3c21cb50@xen.org> <8531a99d-3c54-36c7-0cd4-2e4838f96eb0@suse.com>
 <ba26fdfb-34f8-c4d3-e082-f1f49c768981@xen.org> <89F35B3F-FAAD-4C58-B3FD-F93CA3290A49@arm.com>
 <alpine.DEB.2.21.2011191534060.7979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2011191534060.7979@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Thu, 19 Nov 2020 23:50:19 +0000
Message-ID: <CAJ=z9a0aS1G0F1jAtKNEe4r3tyBoxy1xJ9AV7pYgifsL62iqww@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] xen/ns16550: Make ns16550 driver usable on ARM
 with HAS_PCI enabled.
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <Rahul.Singh@arm.com>, Jan Beulich <jbeulich@suse.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000a143cd05b47e6441"

--000000000000a143cd05b47e6441
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 19 Nov 2020, 23:38 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Thu, 19 Nov 2020, Rahul Singh wrote:
> > > On 19/11/2020 09:53, Jan Beulich wrote:
> > >> On 19.11.2020 10:21, Julien Grall wrote:
> > >>> Hi Jan,
> > >>>
> > >>> On 19/11/2020 09:05, Jan Beulich wrote:
> > >>>> On 18.11.2020 16:50, Julien Grall wrote:
> > >>>>> On 16/11/2020 12:25, Rahul Singh wrote:
> > >>>>>> NS16550 driver has PCI support that is under HAS_PCI flag. When
> HAS_PCI
> > >>>>>> is enabled for ARM, compilation error is observed for ARM
> architecture
> > >>>>>> because ARM platforms do not have full PCI support available.
> > >>>>>   >
> > >>>>>> Introducing new kconfig option CONFIG_HAS_NS16550_PCI to support
> > >>>>>> ns16550 PCI for X86.
> > >>>>>>
> > >>>>>> For X86 platforms it is enabled by default. For ARM platforms it
> is
> > >>>>>> disabled by default, once we have proper support for NS16550 PCI
> for
> > >>>>>> ARM we can enable it.
> > >>>>>>
> > >>>>>> No functional change.
> > >>>>>
> > >>>>> NIT: I would say "No functional change intended" to make clear
> this is
> > >>>>> an expectation and hopefully will be correct :).
> > >>>>>
> > >>>>> Regarding the commit message itself, I would suggest the followin=
g
> to
> > >>>>> address Jan's concern:
> > >>>>
> > >>>> While indeed this is a much better description, I continue to thin=
k
> > >>>> that the proposed Kconfig option is undesirable to have.
> > >>>
> > >>> I am yet to see an argument into why we should keep the PCI code
> > >>> compiled on Arm when there will be no-use....
> > >> Well, see my patch suppressing building of quite a part of it.
> > >
> > > I will let Rahul figuring out whether your patch series is sufficient
> to fix compilation issues (this is what matters right now).
> >
> > I just checked the compilation error for ARM after enabling the HAS_PCI
> on ARM. I am observing the same compilation error what I observed
> previously.
> > There are two new errors related to struct uart_config and struct
> part_param as those struct defined globally but used under X86 flags.
> >
> > At top level:
> > ns16550.c:179:48: error: =E2=80=98uart_config=E2=80=99 defined but not =
used
> [-Werror=3Dunused-const-variable=3D]
> >  static const struct ns16550_config __initconst uart_config[] =3D
> >                                                 ^~~~~~~~~~~
> > ns16550.c:104:54: error: =E2=80=98uart_param=E2=80=99 defined but not u=
sed
> [-Werror=3Dunused-const-variable=3D]
> >  static const struct ns16550_config_param __initconst uart_param[] =3D =
{
> >
> >
> > >
> > >>>> Either,
> > >>>> following the patch I've just sent, truly x86-specific things (at
> > >>>> least as far as current state goes - if any of this was to be
> > >>>> re-used by a future port, suitable further abstraction may be
> > >>>> needed) should be guarded by CONFIG_X86 (or abstracted into arch
> > >>>> hooks), or the HAS_PCI_MSI proposal would at least want further
> > >>>> investigating as to its feasibility to address the issues at hand.
> > >>>
> > >>> I would be happy with CONFIG_X86, despite the fact that this is onl=
y
> > >>> deferring the problem.
> > >>>
> > >>> Regarding HAS_PCI_MSI, I don't really see the point of introducing
> given
> > >>> that we are not going to use NS16550 PCI on Arm in the forseeable
> > >>> future.
> > >> And I continue to fail to see what would guarantee this: As soon
> > >> as you can plug in such a card into an Arm system, people will
> > >> want to be able use it. That's why we had to add support for it
> > >> on x86, after all.
> > >
> > > Well, plug-in PCI cards on Arm has been available for quite a while..=
.
> Yet I haven't heard anyone asking for NS16550 PCI support.
> > >
> > > This is probably because SBSA compliant server should always provide
> an SBSA UART (a cut-down version of the PL011). So why would bother to lo=
se
> a PCI slot for yet another UART?
> > >
> > >> >> So why do we need a finer graine Kconfig?
> > >> Because most of the involved code is indeed MSI-related?
> > >
> > > Possibly, yet it would not be necessary if we don't want NS16550 PCI
> support...
> >
> > To fix compilation error on ARM as per the discussion there are below
> options please suggest which one to use to proceed further.
> >
> > 1. Use the newly introduced CONFIG_HAS_NS16550_PCI config options. This
> helps also non-x86 architecture in the future not to have compilation err=
or
> > what we are observing now when HAS_PCI is enabled.
> >
> > 2. Guard the remaining x86 specific code with CONFIG_X86 and introduce
> the new CONFIG_HAS_PCI_MSI options to fix the MSI related compilation
> error.
> > Once we have proper support for MSI and PCI for ARM  (HAS_PCI_MSI and
> HAS_PCI enabled for ARM in Kconfig ) I am not sure if NS16550 PCI will wo=
rk
> out of the box on ARM .In that case, we might need to come back again to
> fix NS16550 driver.
>
>
> It doesn't matter too much to me, let's just choose one option so that yo=
u
> get unblocked soon.
>
> It looks like Jan prefers option 2) and both Julien and I are OK with
> it. So let's do 2). Jan, please confirm too :-)


Please don't put words in my mouth... I think introducing HAS_PCI_MSI is
short sighted.

There are no clear benefits of it when NS16550 PCI support is not going to
be enable in the foreseeable future.

I would be ok with moving everything under CONFIG_X86. IHMO this is still
shortsighted but at least we don't introduce a config that's not going to
help Arm or other any architecture to disable completely PCI support in
NS16550.

Cheers,

--000000000000a143cd05b47e6441
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, 19 Nov 2020, 23:38 Stefano Stabellini, &lt;<a =
href=3D"mailto:sstabellini@kernel.org" rel=3D"noreferrer noreferrer norefer=
rer" target=3D"_blank">sstabellini@kernel.org</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">On Thu, 19 Nov 2020, Rahul Singh wrote:<br>
&gt; &gt; On 19/11/2020 09:53, Jan Beulich wrote:<br>
&gt; &gt;&gt; On 19.11.2020 10:21, Julien Grall wrote:<br>
&gt; &gt;&gt;&gt; Hi Jan,<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; On 19/11/2020 09:05, Jan Beulich wrote:<br>
&gt; &gt;&gt;&gt;&gt; On 18.11.2020 16:50, Julien Grall wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; On 16/11/2020 12:25, Rahul Singh wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; NS16550 driver has PCI support that is under =
HAS_PCI flag. When HAS_PCI<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; is enabled for ARM, compilation error is obse=
rved for ARM architecture<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; because ARM platforms do not have full PCI su=
pport available.<br>
&gt; &gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; Introducing new kconfig option CONFIG_HAS_NS1=
6550_PCI to support<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; ns16550 PCI for X86.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; For X86 platforms it is enabled by default. F=
or ARM platforms it is<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; disabled by default, once we have proper supp=
ort for NS16550 PCI for<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; ARM we can enable it.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; No functional change.<br>
&gt; &gt;&gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt;&gt; NIT: I would say &quot;No functional change inten=
ded&quot; to make clear this is<br>
&gt; &gt;&gt;&gt;&gt;&gt; an expectation and hopefully will be correct :).<=
br>
&gt; &gt;&gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt;&gt; Regarding the commit message itself, I would sugg=
est the following to<br>
&gt; &gt;&gt;&gt;&gt;&gt; address Jan&#39;s concern:<br>
&gt; &gt;&gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt;&gt; While indeed this is a much better description, I con=
tinue to think<br>
&gt; &gt;&gt;&gt;&gt; that the proposed Kconfig option is undesirable to ha=
ve.<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; I am yet to see an argument into why we should keep the P=
CI code<br>
&gt; &gt;&gt;&gt; compiled on Arm when there will be no-use....<br>
&gt; &gt;&gt; Well, see my patch suppressing building of quite a part of it=
.<br>
&gt; &gt; <br>
&gt; &gt; I will let Rahul figuring out whether your patch series is suffic=
ient to fix compilation issues (this is what matters right now).<br>
&gt; <br>
&gt; I just checked the compilation error for ARM after enabling the HAS_PC=
I on ARM. I am observing the same compilation error what I observed previou=
sly. <br>
&gt; There are two new errors related to struct uart_config and struct part=
_param as those struct defined globally but used under X86 flags.<br>
&gt; <br>
&gt; At top level:<br>
&gt; ns16550.c:179:48: error: =E2=80=98uart_config=E2=80=99 defined but not=
 used [-Werror=3Dunused-const-variable=3D]<br>
&gt;=C2=A0 static const struct ns16550_config __initconst uart_config[] =3D=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~<br>
&gt; ns16550.c:104:54: error: =E2=80=98uart_param=E2=80=99 defined but not =
used [-Werror=3Dunused-const-variable=3D]<br>
&gt;=C2=A0 static const struct ns16550_config_param __initconst uart_param[=
] =3D { <br>
&gt; <br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt;&gt;&gt;&gt; Either,<br>
&gt; &gt;&gt;&gt;&gt; following the patch I&#39;ve just sent, truly x86-spe=
cific things (at<br>
&gt; &gt;&gt;&gt;&gt; least as far as current state goes - if any of this w=
as to be<br>
&gt; &gt;&gt;&gt;&gt; re-used by a future port, suitable further abstractio=
n may be<br>
&gt; &gt;&gt;&gt;&gt; needed) should be guarded by CONFIG_X86 (or abstracte=
d into arch<br>
&gt; &gt;&gt;&gt;&gt; hooks), or the HAS_PCI_MSI proposal would at least wa=
nt further<br>
&gt; &gt;&gt;&gt;&gt; investigating as to its feasibility to address the is=
sues at hand.<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; I would be happy with CONFIG_X86, despite the fact that t=
his is only<br>
&gt; &gt;&gt;&gt; deferring the problem.<br>
&gt; &gt;&gt;&gt; <br>
&gt; &gt;&gt;&gt; Regarding HAS_PCI_MSI, I don&#39;t really see the point o=
f introducing given<br>
&gt; &gt;&gt;&gt; that we are not going to use NS16550 PCI on Arm in the fo=
rseeable<br>
&gt; &gt;&gt;&gt; future.<br>
&gt; &gt;&gt; And I continue to fail to see what would guarantee this: As s=
oon<br>
&gt; &gt;&gt; as you can plug in such a card into an Arm system, people wil=
l<br>
&gt; &gt;&gt; want to be able use it. That&#39;s why we had to add support =
for it<br>
&gt; &gt;&gt; on x86, after all.<br>
&gt; &gt; <br>
&gt; &gt; Well, plug-in PCI cards on Arm has been available for quite a whi=
le... Yet I haven&#39;t heard anyone asking for NS16550 PCI support.<br>
&gt; &gt; <br>
&gt; &gt; This is probably because SBSA compliant server should always prov=
ide an SBSA UART (a cut-down version of the PL011). So why would bother to =
lose a PCI slot for yet another UART?<br>
&gt; &gt; <br>
&gt; &gt;&gt; &gt;&gt; So why do we need a finer graine Kconfig?<br>
&gt; &gt;&gt; Because most of the involved code is indeed MSI-related?<br>
&gt; &gt; <br>
&gt; &gt; Possibly, yet it would not be necessary if we don&#39;t want NS16=
550 PCI support...<br>
&gt; <br>
&gt; To fix compilation error on ARM as per the discussion there are below =
options please suggest which one to use to proceed further.<br>
&gt; <br>
&gt; 1. Use the newly introduced CONFIG_HAS_NS16550_PCI config options. Thi=
s helps also non-x86 architecture in the future not to have compilation err=
or <br>
&gt; what we are observing now when HAS_PCI is enabled.<br>
&gt; <br>
&gt; 2. Guard the remaining x86 specific code with CONFIG_X86 and introduce=
 the new CONFIG_HAS_PCI_MSI options to fix the MSI related compilation erro=
r. <br>
&gt; Once we have proper support for MSI and PCI for ARM=C2=A0 (HAS_PCI_MSI=
 and HAS_PCI enabled for ARM in Kconfig ) I am not sure if NS16550 PCI will=
 work out of the box on ARM .In that case, we might need to come back again=
 to fix NS16550 driver.=C2=A0 <br>
<br>
<br>
It doesn&#39;t matter too much to me, let&#39;s just choose one option so t=
hat you<br>
get unblocked soon.<br>
<br>
It looks like Jan prefers option 2) and both Julien and I are OK with<br>
it. So let&#39;s do 2). Jan, please confirm too :-)</blockquote></div></div=
><div dir=3D"auto"><br></div><div dir=3D"auto">Please don&#39;t put words i=
n my mouth... I think introducing HAS_PCI_MSI is short sighted.</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">There are no clear benefits of it w=
hen NS16550 PCI support is not going to be enable in the foreseeable future=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I would be ok with mov=
ing everything under CONFIG_X86. IHMO this is still shortsighted but at lea=
st we don&#39;t introduce a config that&#39;s not going to help Arm or othe=
r any architecture to disable completely PCI support in NS16550.</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><br></div><div dir=3D"auto"></div></div>

--000000000000a143cd05b47e6441--

