Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0395574DAC3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 18:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.561268.877708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qItSQ-0006Aj-5f; Mon, 10 Jul 2023 16:09:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 561268.877708; Mon, 10 Jul 2023 16:09:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qItSQ-000694-2t; Mon, 10 Jul 2023 16:09:50 +0000
Received: by outflank-mailman (input) for mailman id 561268;
 Mon, 10 Jul 2023 16:09:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xd0D=C4=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qItSO-00068y-6Q
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 16:09:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2faa4689-1f3c-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 18:09:45 +0200 (CEST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 by support.bugseng.com (Postfix) with ESMTPSA id 1652F4EE0739
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 18:09:45 +0200 (CEST)
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-79470b88d88so1419505241.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jul 2023 09:09:45 -0700 (PDT)
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
X-Inumbo-ID: 2faa4689-1f3c-11ee-8611-37d641c3527e
X-Gm-Message-State: ABy/qLbRj/MaoRZ9Qm/TX3ySAxUd4iqVe2OKzan1oiH+EMDEZZSTMa7e
	SoaRgUrw6DspsRbANvKk9sj2FyaDYE0QYn1vs1I=
X-Google-Smtp-Source: APBJJlFHFi5N7AKYfgsu825M+dmLjxz6FDVJZuUgKwo4YPUmKzGt+1oZJ84Ci5Ys5WTI417Byu85FHP4DbugKAS9o40=
X-Received: by 2002:a67:eb0d:0:b0:443:6b64:aed4 with SMTP id
 a13-20020a67eb0d000000b004436b64aed4mr4920776vso.26.1689005383901; Mon, 10
 Jul 2023 09:09:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
 <a343fc97-84df-48e6-1c91-cd933c6e5210@suse.com> <CAFHJcJu=S2JtFJy_XnMhrr0gP7+sPfvrS_1940qzL9rc_j60nA@mail.gmail.com>
 <f93f0561-abea-bdae-223e-d69932e435c4@suse.com> <CAFHJcJuP7hH01ZiwNe0HHBM=JpBtsF9sDD7fushyBxDQ9UZicw@mail.gmail.com>
 <fb29cca6-454c-82ed-b6a8-ac9814f81cfa@suse.com> <CAFHJcJuCddmwMAB=26tVBfgThQWLZb5kZU3GBdC0aTTcvJ4O1w@mail.gmail.com>
 <f6c16d46-5804-a838-cf61-71fc671e394b@suse.com> <alpine.DEB.2.22.394.2307071432200.761183@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2307071432200.761183@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Mon, 10 Jul 2023 18:09:32 +0200
X-Gmail-Original-Message-ID: <CAFHJcJsBP=_Lki=JMyzS=gr3kSMZJisJZmAWYX8H1cDHtWweFA@mail.gmail.com>
Message-ID: <CAFHJcJsBP=_Lki=JMyzS=gr3kSMZJisJZmAWYX8H1cDHtWweFA@mail.gmail.com>
Subject: Re: [XEN PATCH v2 12/13] xen/x86: fix violations of MISRA C:2012 Rule 7.2
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, consulting@bugseng.com, 
	Gianluca Luparini <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Paul Durrant <paul@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000ee679806002435c1"

--000000000000ee679806002435c1
Content-Type: text/plain; charset="UTF-8"

Il giorno ven 7 lug 2023 alle ore 23:53 Stefano Stabellini <
sstabellini@kernel.org> ha scritto:

> On Fri, 7 Jul 2023, Jan Beulich wrote:
> > On 07.07.2023 10:04, Simone Ballarin wrote:
> > > Il giorno ven 7 lug 2023 alle ore 09:04 Jan Beulich <jbeulich@suse.com>
> ha
> > > scritto:
> > >
> > >> On 07.07.2023 08:50, Simone Ballarin wrote:
> > >>> Il giorno gio 6 lug 2023 alle ore 18:22 Jan Beulich <
> jbeulich@suse.com>
> > >> ha
> > >>> scritto:
> > >>>
> > >>>> On 06.07.2023 18:08, Simone Ballarin wrote:
> > >>>>> Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beulich <
> jbeulich@suse.com
> > >>>
> > >>>> ha
> > >>>>> scritto:
> > >>>>>
> > >>>>>> On 05.07.2023 17:26, Simone Ballarin wrote:
> > >>>>>>> --- a/xen/arch/x86/apic.c
> > >>>>>>> +++ b/xen/arch/x86/apic.c
> > >>>>>>> @@ -1211,7 +1211,7 @@ static void __init
> calibrate_APIC_clock(void)
> > >>>>>>>       * Setup the APIC counter to maximum. There is no way the
> lapic
> > >>>>>>>       * can underflow in the 100ms detection time frame.
> > >>>>>>>       */
> > >>>>>>> -    __setup_APIC_LVTT(0xffffffff);
> > >>>>>>> +    __setup_APIC_LVTT(0xffffffffU);
> > >>>>>>
> > >>>>>> While making the change less mechanical, we want to consider to
> switch
> > >>>>>> to ~0 in this and similar cases.
> > >>>>>>
> > >>>>>
> > >>>>> Changing ~0U is more than not mechanical: it is possibly dangerous.
> > >>>>> The resulting value could be different depending on the
> architecture,
> > >>>>> I prefer to not make such kind of changes in a MISRA-related patch.
> > >>>>
> > >>>> What do you mean by "depending on the architecture", when this is
> > >>>> x86-only code _and_ you can check what type parameter the called
> > >>>> function has?
> > >>>
> > >>> Ok, I will change these literals in ~0U in the next submission.
> > >>
> > >> Except that I specifically meant ~0, not ~0U. We mean "maximum value"
> > >> here, and at the call site it doesn't matter how wide the function
> > >> parameter's type is. If it was 64-bit, ~0U would not do what is
> wanted.
> > >
> > > ~0 is not a MISRA-compliant solution since bitwise operations on signed
> > > integers have implementation-defined behavior. This solution
> definitively
> > > violates Rule 10.1.
> >
> > So if we adopted that rule (we didn't so far), we'd have to e.g. change
> > all literal number shift counts to have U suffixes, no matter that
> > without the suffix it is still entirely obvious that the numbers are
> > unsigned? I'm afraid that'll face my opposition ...
>
> Indeed we have not adopted Rule 10.1. However, may I suggest that we
> don't make things potentially worse, just in case we end up deciding in
> favor of 10.1? We might not adopt 10.1 at all, but still... The code is
> already 0xffffffff, let's make things easier for all of us and just do
> 0xffffffffU ?
>
> Let's put Rule 10.1 and the whole of MISRA C aside for a second.
>
>
> Jan, let's say that you prefer ~0 or a different function parameter name
> or something else on any of these patches. You do realize that you don't
> need Simone or Federico or anyone else to make that change for you? You
> can make the change, submit a patch, and in your case anyone can ack
> it. Roger, Andrew, me, Bertrand, Julien, and almost anyone else could
> ack it and it would go in. As I wrote yesterday, feel free to CC me and
> I'll help you get in all the changes that you want.
>
> If you submitted that patch to switch to ~0 it might already be
> committed by now.
>
> I am trying to highlight that suggesting changes on these mechanical
> patches end up with more work for both the contributor and also the
> maintainer compared to do the change yourself.
>
> I think we should try to accept these patches as
> mechanical-changes-only. This is the only way to scale up this effort.
> If you spot something that you'd rather be done differently, do one of
> the following:
>
> a) Accept the patch as-is and submit a patch afterwards. Yes the line
>    gets changed twice but it is the easiest solution.
>
> b) Ask the contribitor to drop the single change you would rather do
>    differently, or even better drop it yourself on commit. Then submit a
>    patch with the change that you prefer.
>
> c) For trivial things, like code style changes, do the change directly
>    on commit.
>
>
> I know emails encourage English replies, but to make this work we need
> to do more code changes together and less English.
>


I agree.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--000000000000ee679806002435c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Il giorno ven 7 lug 2023 alle ore 23:53 S=
tefano Stabellini &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini=
@kernel.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Fri, 7 Jul 2023, Jan Beulich wrote:<br>
&gt; On 07.07.2023 10:04, Simone Ballarin wrote:<br>
&gt; &gt; Il giorno ven 7 lug 2023 alle ore 09:04 Jan Beulich &lt;<a href=
=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; h=
a<br>
&gt; &gt; scritto:<br>
&gt; &gt; <br>
&gt; &gt;&gt; On 07.07.2023 08:50, Simone Ballarin wrote:<br>
&gt; &gt;&gt;&gt; Il giorno gio 6 lug 2023 alle ore 18:22 Jan Beulich &lt;<=
a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>=
&gt;<br>
&gt; &gt;&gt; ha<br>
&gt; &gt;&gt;&gt; scritto:<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; On 06.07.2023 18:08, Simone Ballarin wrote:<br>
&gt; &gt;&gt;&gt;&gt;&gt; Il giorno gio 6 lug 2023 alle ore 10:26 Jan Beuli=
ch &lt;<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse=
.com</a><br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; ha<br>
&gt; &gt;&gt;&gt;&gt;&gt; scritto:<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; On 05.07.2023 17:26, Simone Ballarin wrote:<b=
r>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/xen/arch/x86/apic.c<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/xen/arch/x86/apic.c<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -1211,7 +1211,7 @@ static void __init =
calibrate_APIC_clock(void)<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Setup the API=
C counter to maximum. There is no way the lapic<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* can underflow=
 in the 100ms detection time frame.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0 __setup_APIC_LVTT(0xffffff=
ff);<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 __setup_APIC_LVTT(0xffffff=
ffU);<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; While making the change less mechanical, we w=
ant to consider to switch<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt; to ~0 in this and similar cases.<br>
&gt; &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt;&gt; Changing ~0U is more than not mechanical: it is p=
ossibly dangerous.<br>
&gt; &gt;&gt;&gt;&gt;&gt; The resulting value could be different depending =
on the architecture,<br>
&gt; &gt;&gt;&gt;&gt;&gt; I prefer to not make such kind of changes in a MI=
SRA-related patch.<br>
&gt; &gt;&gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt;&gt; What do you mean by &quot;depending on the architectu=
re&quot;, when this is<br>
&gt; &gt;&gt;&gt;&gt; x86-only code _and_ you can check what type parameter=
 the called<br>
&gt; &gt;&gt;&gt;&gt; function has?<br>
&gt; &gt;&gt;&gt;<br>
&gt; &gt;&gt;&gt; Ok, I will change these literals in ~0U in the next submi=
ssion.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Except that I specifically meant ~0, not ~0U. We mean &quot;m=
aximum value&quot;<br>
&gt; &gt;&gt; here, and at the call site it doesn&#39;t matter how wide the=
 function<br>
&gt; &gt;&gt; parameter&#39;s type is. If it was 64-bit, ~0U would not do w=
hat is wanted.<br>
&gt; &gt; <br>
&gt; &gt; ~0 is not a MISRA-compliant solution since bitwise operations on =
signed<br>
&gt; &gt; integers have implementation-defined behavior. This solution defi=
nitively<br>
&gt; &gt; violates Rule 10.1.<br>
&gt; <br>
&gt; So if we adopted that rule (we didn&#39;t so far), we&#39;d have to e.=
g. change<br>
&gt; all literal number shift counts to have U suffixes, no matter that<br>
&gt; without the suffix it is still entirely obvious that the numbers are<b=
r>
&gt; unsigned? I&#39;m afraid that&#39;ll face my opposition ...<br>
<br>
Indeed we have not adopted Rule 10.1. However, may I suggest that we<br>
don&#39;t make things potentially worse, just in case we end up deciding in=
<br>
favor of 10.1? We might not adopt 10.1 at all, but still... The code is<br>
already 0xffffffff, let&#39;s make things easier for all of us and just do<=
br>
0xffffffffU ?<br>
<br>
Let&#39;s put Rule 10.1 and the whole of MISRA C aside for a second.<br>
<br>
<br>
Jan, let&#39;s say that you prefer ~0 or a different function parameter nam=
e<br>
or something else on any of these patches. You do realize that you don&#39;=
t<br>
need Simone or Federico or anyone else to make that change for you? You<br>
can make the change, submit a patch, and in your case anyone can ack<br>
it. Roger, Andrew, me, Bertrand, Julien, and almost anyone else could<br>
ack it and it would go in. As I wrote yesterday, feel free to CC me and<br>
I&#39;ll help you get in all the changes that you want.<br>
<br>
If you submitted that patch to switch to ~0 it might already be<br>
committed by now.<br>
<br>
I am trying to highlight that suggesting changes on these mechanical<br>
patches end up with more work for both the contributor and also the<br>
maintainer compared to do the change yourself.<br>
<br>
I think we should try to accept these patches as<br>
mechanical-changes-only. This is the only way to scale up this effort.<br>
If you spot something that you&#39;d rather be done differently, do one of<=
br>
the following:<br>
<br>
a) Accept the patch as-is and submit a patch afterwards. Yes the line<br>
=C2=A0 =C2=A0gets changed twice but it is the easiest solution.<br>
<br>
b) Ask the contribitor to drop the single change you would rather do<br>
=C2=A0 =C2=A0differently, or even better drop it yourself on commit. Then s=
ubmit a<br>
=C2=A0 =C2=A0patch with the change that you prefer.<br>
<br>
c) For trivial things, like code style changes, do the change directly<br>
=C2=A0 =C2=A0on commit.<br>
<br>
<br>
I know emails encourage English replies, but to make this work we need<br>
to do more code changes together and less English.<br>
</blockquote></div><br clear=3D"all"><div><br></div><div><div>I agree.<br><=
/div></div><div><br></div><span class=3D"gmail_signature_prefix">-- </span>=
<br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Simone Ball=
arin, M.Sc.<br><br><div>Field Application Engineer, BUGSENG (<a href=3D"htt=
p://bugseng.com" target=3D"_blank">https://bugseng.com</a>)</div></div></di=
v></div>

--000000000000ee679806002435c1--

