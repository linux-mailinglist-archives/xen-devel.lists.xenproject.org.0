Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E244DC475
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 12:07:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291494.494745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUny3-0006t5-B8; Thu, 17 Mar 2022 11:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291494.494745; Thu, 17 Mar 2022 11:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUny3-0006qp-77; Thu, 17 Mar 2022 11:06:55 +0000
Received: by outflank-mailman (input) for mailman id 291494;
 Thu, 17 Mar 2022 11:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gtxi=T4=gmail.com=tamas.k.lengyel@srs-se1.protection.inumbo.net>)
 id 1nUny1-0006qj-SW
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 11:06:54 +0000
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [2607:f8b0:4864:20::d29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58573864-a5e2-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 12:06:51 +0100 (CET)
Received: by mail-io1-xd29.google.com with SMTP id d62so5401149iog.13
 for <xen-devel@lists.xenproject.org>; Thu, 17 Mar 2022 04:06:51 -0700 (PDT)
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
X-Inumbo-ID: 58573864-a5e2-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FM5PSJrta5YOnjGaWKJnnwtFGFaRfbjBKgIsqQtH0og=;
        b=d1iWrsSaq14iiTN0mclTy7jUmnMlskdcJqHCrxSGSBOkghuMTYsiGVT0gVmiPZ0KTU
         PzyRkCii0Fhg31Ft25wdG20hJNOxY7ilyrPQn1NcyT0eP6Di72C5sfIc5PW+0q0zdX7a
         +0H3TItzUSS6FOTJRq8SuaUZ5pFwd4lBqO4Bc+7HjNYB1tp9qEHWtYzLI/nR3aIju1EE
         FfAJ6fJ3fVp/p9Wvzxj536v14Abk3Z0RgUVcY+Cc9Nm89ncYw60PtV0P0DJOuvJKtZy6
         ECNTfxj+Mq5K9p80A+VkYgze+5+c64HwUR3ldd8Y+TIxCiSJ/J2lmdAaBJp+Q7JjAxzb
         Cg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FM5PSJrta5YOnjGaWKJnnwtFGFaRfbjBKgIsqQtH0og=;
        b=XtRMWFWrvvN0IKFcvKbprQSb2kfJw3A7veHksR+5bj8lfoAgg7ZTrWttZUV6c8p3dk
         RbHiMJQXG3TxF5bkBejlr4Fm8eKxoe+A/oDjmtsavHA+XKUtWvL4x4giiM+l6NKHDKdm
         +PsstT8/wzYAEJuR4viLO/ry3jSHNYz1fbjo9IiN1A0G8nUmF1SEiCbzoxTGx8CwYLhV
         ebRLAIBKL6bGUaz+dRC/NflCiuSrTw56QJS3JTkuWsA0JvUDACqsAxfkwetFO4oE0Ql5
         Fw/HzTGg2LtEHE1/YL+2ei7oznENhplz+QPk3uKNRuWrYHju+bJIUC4snjE/bdTnlpSE
         tENQ==
X-Gm-Message-State: AOAM5312xFWrkadFodvaQPm7hH49UAbhHbhrIRy1dn6vogAdAtNlpF6i
	JVZjqKrqJV4DJaRDNNvPAH+uDVZIvrbnEqsdhXwN3plV
X-Google-Smtp-Source: ABdhPJy0TlZshtgp4vykGST0ZeKUeqJqsOxWVUeAYZM7aRWdEjTGsdTUqmMSxtWmR1+AYR95iZQF1vciHV7dH03u40E=
X-Received: by 2002:a6b:b503:0:b0:641:808b:4046 with SMTP id
 e3-20020a6bb503000000b00641808b4046mr1828882iof.100.1647515209946; Thu, 17
 Mar 2022 04:06:49 -0700 (PDT)
MIME-Version: 1.0
References: <05d0a5b5c18d667a5527e6f834347f54a10309da.1646937728.git.tamas.lengyel@intel.com>
 <BN9PR11MB5276E96E39209EDCCED5E9198C0F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CABfawhmZLyZdSbK0sr4t_WoYx6uYOV2bH89bX4ET0kzeQiY0-A@mail.gmail.com> <BN9PR11MB527623CD66F0F606BD0CF5F98C129@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB527623CD66F0F606BD0CF5F98C129@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 17 Mar 2022 07:06:37 -0400
Message-ID: <CABfawhnucaqR_RQd_XDKBUP=E_uRG7A6Xbo7dN8qj5wzAjyMZg@mail.gmail.com>
Subject: Re: [PATCH] x86/hvm: Include interruptibility state in hvm_hw_cpu
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Lengyel, Tamas" <tamas.lengyel@intel.com>, Xen-devel <xen-devel@lists.xenproject.org>, 
	"Beulich, Jan" <JBeulich@suse.com>, "Cooper, Andrew" <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Pau_Monn=C3=A9=2C_Roger?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>
Content-Type: multipart/alternative; boundary="000000000000d9dc0705da68061f"

--000000000000d9dc0705da68061f
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 17, 2022, 2:09 AM Tian, Kevin <kevin.tian@intel.com> wrote:

> > From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
> > Sent: Monday, March 14, 2022 8:14 PM
> >
> > On Mon, Mar 14, 2022 at 3:22 AM Tian, Kevin <kevin.tian@intel.com>
> wrote:
> > >
> > > > From: Lengyel, Tamas <tamas.lengyel@intel.com>
> > > > Sent: Friday, March 11, 2022 2:45 AM
> > > >
> > > > During VM fork resetting a failed vmentry has been observed when the
> > reset
> > > > is performed immediately after a STI instruction executed. This is
> due to
> > > > the guest interruptibility state in the VMCS being modified by STI
> but the
> > > > subsequent reset removes the IF bit from FLAGS, causing the failed
> > vmentry.
> > >
> > > I didn't get the rationale here. Before this patch the
> interruptibility state is
> > > not saved/restored thus I suppose after reset it will be cleared thus
> aligned
> > > with RFLAGS.IF=0. Can you elaborate a bit how exactly above problem is
> > > caused?
> >
> > The problem is that the interruptibility state is not cleared and thus
> > isn't aligned with RFLAGS.IF=0 after RFLAGS is reset. They go out of
> > sync leading to the failed vmentry. The interruptibility state needs
> > to be included in the hvm hw cpu struct for it to get re-aligned
> > during reset to avoid the failed vmentry.
>
> I'm still confused here. The interruptibility state should have bit 0 as 1
> after a STI instruction is executed (RFLAGS.IF=1). Saving/restoring it
> still doesn't match RFLAGS.IF=0 after vm fork reset. So I didn't understand
> how this patch actually fixes the problem.
>

I think I see where the confusion is. We are saving the context of the
parent vm and restoring it in the fork during a reset. That's what a reset
is. So by including the field in the struct means it will be reset to be in
sync with RFLAGS of the parent vm. Right now only the RFLAGS is copied from
the parent and interruptibility state isn't touched at all.


Also if there is a real problem shouldn't we just reset the interruptbility
> state to match RFLAGS.IF=0?
>

Yes, exactly what this patch achieves. Looking at it more I think the rest
of the non-register cpu state should similarly be included so those would
get reset too (activity & pending dbg).


> >
> > >
> > > >
> > > > Include the interruptibility state information in the public
> hvm_hw_cpu
> > struct
> > > > so that the CPU can be safely saved/restored.
> > > >
> > > > Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> > > > ---
> > > >  xen/arch/x86/hvm/hvm.c                 |  9 +++++----
> > > >  xen/arch/x86/hvm/vmx/vmx.c             |  4 ++++
> > > >  xen/arch/x86/include/asm/hvm/hvm.h     | 26
> > >
> > > Why is this change only applied to vmx instead of svm?
> >
> > VM forking is implemented only for vmx, thus this change is only
> > relevant where a VM would be immediately reset after a STI
>
> but the ops is generic and SVM already has the related callbacks.
>
> > instruction. Normal VM save/restore/migration doesn't attempt to
> > capture a VM state immediately after STI thus it's not relevant for
> > SVM.
> >
>
> Can you elaborate why save/restore/migration won't happen
> right after STI while it does for vm fork?
>

This is just based on my observation that noone has encountered this issue
in the long life of Xen. If I'm wrong and this cornercase could be
encountered during normal routes I can wire in SVM too. I ran into this
with vm forks because we are resetting the forks very very often (thousands
of times per second) under various execution paths with the fuzzer and one
happened to hit reset just after STI.

Another question I would be interested to hear from the maintainers is in
regards to the hvm context compat macros. Right now they differentiate
between hvm hw cpu struct versions based on size. So since this patch
doesn't change the size how is that supposed to work? Or if there are more
then two versions of the struct? The compat version never changes?

Tamas

>

--000000000000d9dc0705da68061f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Mar 17, 2022, 2:09 AM Tian, Kevin &lt;<a href=
=3D"mailto:kevin.tian@intel.com">kevin.tian@intel.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">&gt; From: Tamas K Lengyel &lt;<a href=3D=
"mailto:tamas.k.lengyel@gmail.com" target=3D"_blank" rel=3D"noreferrer">tam=
as.k.lengyel@gmail.com</a>&gt;<br>
&gt; Sent: Monday, March 14, 2022 8:14 PM<br>
&gt; <br>
&gt; On Mon, Mar 14, 2022 at 3:22 AM Tian, Kevin &lt;<a href=3D"mailto:kevi=
n.tian@intel.com" target=3D"_blank" rel=3D"noreferrer">kevin.tian@intel.com=
</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; &gt; From: Lengyel, Tamas &lt;<a href=3D"mailto:tamas.lengyel@int=
el.com" target=3D"_blank" rel=3D"noreferrer">tamas.lengyel@intel.com</a>&gt=
;<br>
&gt; &gt; &gt; Sent: Friday, March 11, 2022 2:45 AM<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; During VM fork resetting a failed vmentry has been observed =
when the<br>
&gt; reset<br>
&gt; &gt; &gt; is performed immediately after a STI instruction executed. T=
his is due to<br>
&gt; &gt; &gt; the guest interruptibility state in the VMCS being modified =
by STI but the<br>
&gt; &gt; &gt; subsequent reset removes the IF bit from FLAGS, causing the =
failed<br>
&gt; vmentry.<br>
&gt; &gt;<br>
&gt; &gt; I didn&#39;t get the rationale here. Before this patch the interr=
uptibility state is<br>
&gt; &gt; not saved/restored thus I suppose after reset it will be cleared =
thus aligned<br>
&gt; &gt; with RFLAGS.IF=3D0. Can you elaborate a bit how exactly above pro=
blem is<br>
&gt; &gt; caused?<br>
&gt; <br>
&gt; The problem is that the interruptibility state is not cleared and thus=
<br>
&gt; isn&#39;t aligned with RFLAGS.IF=3D0 after RFLAGS is reset. They go ou=
t of<br>
&gt; sync leading to the failed vmentry. The interruptibility state needs<b=
r>
&gt; to be included in the hvm hw cpu struct for it to get re-aligned<br>
&gt; during reset to avoid the failed vmentry.<br>
<br>
I&#39;m still confused here. The interruptibility state should have bit 0 a=
s 1<br>
after a STI instruction is executed (RFLAGS.IF=3D1). Saving/restoring it<br=
>
still doesn&#39;t match RFLAGS.IF=3D0 after vm fork reset. So I didn&#39;t =
understand<br>
how this patch actually fixes the problem.<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">I think I see where the confusion=
 is. We are saving the context of the parent vm and restoring it in the for=
k during a reset. That&#39;s what a reset is. So by including the field in =
the struct means it will be reset to be in sync with RFLAGS of the parent v=
m. Right now only the RFLAGS is copied from the parent and interruptibility=
 state isn&#39;t touched at all.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
Also if there is a real problem shouldn&#39;t we just reset the interruptbi=
lity<br>
state to match RFLAGS.IF=3D0?<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Yes, exactly what this patch achieves. Looking=
 at it more I think the rest of the non-register cpu state should similarly=
 be included so those would get reset too (activity &amp; pending dbg).</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Include the interruptibility state information in the public=
 hvm_hw_cpu<br>
&gt; struct<br>
&gt; &gt; &gt; so that the CPU can be safely saved/restored.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Signed-off-by: Tamas K Lengyel &lt;<a href=3D"mailto:tamas.l=
engyel@intel.com" target=3D"_blank" rel=3D"noreferrer">tamas.lengyel@intel.=
com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt;=C2=A0 xen/arch/x86/hvm/hvm.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 9 +++++----<br>
&gt; &gt; &gt;=C2=A0 xen/arch/x86/hvm/vmx/vmx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++++<br>
&gt; &gt; &gt;=C2=A0 xen/arch/x86/include/asm/hvm/hvm.h=C2=A0 =C2=A0 =C2=A0=
| 26<br>
&gt; &gt;<br>
&gt; &gt; Why is this change only applied to vmx instead of svm?<br>
&gt; <br>
&gt; VM forking is implemented only for vmx, thus this change is only<br>
&gt; relevant where a VM would be immediately reset after a STI<br>
<br>
but the ops is generic and SVM already has the related callbacks.<br>
<br>
&gt; instruction. Normal VM save/restore/migration doesn&#39;t attempt to<b=
r>
&gt; capture a VM state immediately after STI thus it&#39;s not relevant fo=
r<br>
&gt; SVM.<br>
&gt; <br>
<br>
Can you elaborate why save/restore/migration won&#39;t happen<br>
right after STI while it does for vm fork?<br></blockquote></div></div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">This is just based on my observat=
ion that noone has encountered this issue in the long life of Xen. If I&#39=
;m wrong and this cornercase could be encountered during normal routes I ca=
n wire in SVM too. I ran into this with vm forks because we are resetting t=
he forks very very often (thousands of times per second) under various exec=
ution paths with the fuzzer and one happened to hit reset just after STI.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Another question I would =
be interested to hear from the maintainers is in regards to the hvm context=
 compat macros. Right now they differentiate between hvm hw cpu struct vers=
ions based on size. So since this patch doesn&#39;t change the size how is =
that supposed to work? Or if there are more then two versions of the struct=
? The compat version never changes?</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Tamas</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
</blockquote></div></div></div>

--000000000000d9dc0705da68061f--

