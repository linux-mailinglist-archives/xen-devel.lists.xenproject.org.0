Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17731677F7A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:20:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483016.748892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJycJ-0005vc-W8; Mon, 23 Jan 2023 15:20:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483016.748892; Mon, 23 Jan 2023 15:20:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJycJ-0005t0-Se; Mon, 23 Jan 2023 15:20:15 +0000
Received: by outflank-mailman (input) for mailman id 483016;
 Mon, 23 Jan 2023 15:20:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fd1Y=5U=tibco.com=gdunlap@srs-se1.protection.inumbo.net>)
 id 1pJycI-0005sr-Bv
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:20:14 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e90db43-9b31-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 16:20:13 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id ud5so31431952ejc.4
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:20:13 -0800 (PST)
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
X-Inumbo-ID: 6e90db43-9b31-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hCe7wNP+TKqBI+q0C50QUeVPIh9gXzDPbTeF71ad82o=;
        b=BScuW+/NLYhPGp9cIeu7wYll/Nfs2exQkGEORM7xcmdmraE1GjRv/Cm82VmMic4Elk
         9fC/T9MIj5uuja6scg5hEDvBj2MCNK6J1CuztFdFD2xLd8blMjN/KkOGPUKRQIaGLHQQ
         OBVcJleRL2fHr2H4TXtKuXwhZ1051hLYkWDZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCe7wNP+TKqBI+q0C50QUeVPIh9gXzDPbTeF71ad82o=;
        b=S7Yo1rFJhniNRaPG2+XgJUz+LuxmCWEPN5PThLvFZZ5N+Ed5KoD697qqTbJMALdv6U
         4nxF9fDEVarAcTGJuaMpbyYAgPyk+CD4/TEGezkKNqRNJTibejTKaf0/rEKLj4Er0aqO
         YbIJ8d1zw8xesOby6hceQa3FA6tNG++jlEeNncp9Zo+/PQYjCbtRTnxkpjc197km3d+Z
         iL5fra19jK91q01EJ5g/MIK1OiYGi60Odz0OquqXC13plqBDWtbqGWNVnnxgMdkFxYNp
         qSqPIgr65Cr06eW+gPXXVhZARvZdfnFCDbBXVZeb3v/ETOCYrJ8FiRKBKbGbF7FPbnD/
         OGUA==
X-Gm-Message-State: AFqh2kr7c9p9aUXpm5T1vuXqXHC7962uchd5S2hLL1Lv8uWfVVXmuIsD
	bHouLtVxVa8WS/a/MMyRtJwU9enIz8dCA+pU/ZyNjg==
X-Google-Smtp-Source: AMrXdXvvoWeHbNEKoJ4nZwFjZQb+QKm3L9CCa8WeEhuw7GMqr6XtAovcn2sUcS1g5LYLU5sMgaKKWLIL7sK7AZGr4wI=
X-Received: by 2002:a17:907:a065:b0:84d:28d4:6bb with SMTP id
 ia5-20020a170907a06500b0084d28d406bbmr1939830ejc.531.1674487212626; Mon, 23
 Jan 2023 07:20:12 -0800 (PST)
MIME-Version: 1.0
References: <f17d07b3-2558-70b8-9d1b-b599a54a2d59@suse.com>
 <d91b5315-a5bb-a6ee-c9bb-58974c733a4e@suse.com> <CA+zSX=ZVK_7xpgraJyC3__uORqXo8F9Atj9gCF+oO7OyfRrtYg@mail.gmail.com>
 <c8ca4781-13ac-add6-1ae0-558f8d0da052@suse.com>
In-Reply-To: <c8ca4781-13ac-add6-1ae0-558f8d0da052@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 23 Jan 2023 15:20:01 +0000
Message-ID: <CA+zSX=b2o_sbC+CwLUm2F5QnSKaGBSayUPgsLheLWHob8jUnrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] x86/shadow: replace sh_reset_l3_up_pointers()
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000007d7a3e05f2efef00"

--0000000000007d7a3e05f2efef00
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 23, 2023 at 8:41 AM Jan Beulich <jbeulich@suse.com> wrote:

> On 20.01.2023 18:02, George Dunlap wrote:
> > On Wed, Jan 11, 2023 at 1:52 PM Jan Beulich <jbeulich@suse.com> wrote:
> >
> >> Rather than doing a separate hash walk (and then even using the vCPU
> >> variant, which is to go away), do the up-pointer-clearing right in
> >> sh_unpin(), as an alternative to the (now further limited) enlisting on
> >> a "free floating" list fragment. This utilizes the fact that such list
> >> fragments are traversed only for multi-page shadows (in shadow_free()).
> >> Furthermore sh_terminate_list() is a safe guard only anyway, which isn't
> >> in use in the common case (it actually does anything only for BIGMEM
> >> configurations).
> >
> > One thing that seems strange about this patch is that you're essentially
> > adding a field to the domain shadow struct in lieu of adding another
> > another argument to sh_unpin() (unless the bit is referenced elsewhere in
> > subsequent patches, which I haven't reviewed, in part because about half
> of
> > them don't apply cleanly to the current tree).
>
> Well, to me adding another parameter to sh_unpin() would have looked odd;
> the new field looks slightly cleaner to me. But changing that is merely a
> matter of taste, so if you and e.g. Andrew think that approach was better,
> I could switch to that. And no, I don't foresee further uses of the field.
>

You're about to call sh_unpin(), and you want to tell that function to
change its behavior.  What's so odd about adding an argument to the
function to indicate the behavior?  Instead you're adding a bit of global
state which is carried around 100% of the time, even when that function
isn't being called.  That's not what people normally expect; it makes the
code harder to reason about.

It would certainly be ugly to have to add "false" to every other instance
of sh_unpin; but the normal way you get around that is to redefine
sh_unpin() as a wrapper which calls the other function with the 'false'
argument set.

You asked me to review this for a second opinion on the safety of clearing
the up-pointer this way, not because you need an ack; so I don't really
want to block the patch for non-functional reasons.  But I think this is
one of the "death by a thousand cuts" that makes the shadow code more
fragile and difficult for new people to approach and understand.

Re the original question: I've stared at the code for a bit now, and I
can't see anything obviously wrong or dangerous about it.

But it does make me ask, why do we need the "unpinning_l3" pseudo-argument
at all?  Is there any reason not to unconditionally zero out sp->up when we
find a head_type of SH_type_l3_64_shadow?  As far as I can tell, sp->list
doesn't require any special state.  Why do we make the effort to leave it
alone when we're not unpinning all l3s?

In fact, is there a way to unpin an l3 shadow *other* than when we're
unpinning all l3's?  If so, then this patch, as written, is broken -- the
original code clears the up-pointer for *all* L3_64 shadows, regardless of
whether they're on the pinned list; the new patch will only clear the ones
on the pinned list.  But unconditionally clearing sp->up could actually fix
that.

Thoughts?

As to half of the patches not applying: Some where already applied out of
> order, and others therefore need re-basing slightly. Till now I saw no
> reason to re-send the remaining patches just for that.
>

Sorry if that sounded like complaining; I was only being preemptively
defensive against the potential accusation that the answer would have been
obvious if I'd just continued reviewing the series. :-). (And indeed if the
whole series had applied I would have checked that the final result didn't
have any other references to it.)

 -George

--0000000000007d7a3e05f2efef00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><div dir=3D"lt=
r">=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Mon, Jan 23, 2023 at 8:41 AM Jan Beulich &lt;<a href=3D"mailto:=
jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">On 20.01.2023 18:02, =
George Dunlap wrote:<br>
&gt; On Wed, Jan 11, 2023 at 1:52 PM Jan Beulich &lt;<a href=3D"mailto:jbeu=
lich@suse.com" target=3D"_blank">jbeulich@suse.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; Rather than doing a separate hash walk (and then even using the vC=
PU<br>
&gt;&gt; variant, which is to go away), do the up-pointer-clearing right in=
<br>
&gt;&gt; sh_unpin(), as an alternative to the (now further limited) enlisti=
ng on<br>
&gt;&gt; a &quot;free floating&quot; list fragment. This utilizes the fact =
that such list<br>
&gt;&gt; fragments are traversed only for multi-page shadows (in shadow_fre=
e()).<br>
&gt;&gt; Furthermore sh_terminate_list() is a safe guard only anyway, which=
 isn&#39;t<br>
&gt;&gt; in use in the common case (it actually does anything only for BIGM=
EM<br>
&gt;&gt; configurations).<br>
&gt; <br>
&gt; One thing that seems strange about this patch is that you&#39;re essen=
tially<br>
&gt; adding a field to the domain shadow struct in lieu of adding another<b=
r>
&gt; another argument to sh_unpin() (unless the bit is referenced elsewhere=
 in<br>
&gt; subsequent patches, which I haven&#39;t reviewed, in part because abou=
t half of<br>
&gt; them don&#39;t apply cleanly to the current tree).<br>
<br>
Well, to me adding another parameter to sh_unpin() would have looked odd;<b=
r>
the new field looks slightly cleaner to me. But changing that is merely a<b=
r>
matter of taste, so if you and e.g. Andrew think that approach was better,<=
br>
I could switch to that. And no, I don&#39;t foresee further uses of the fie=
ld.<br></blockquote><div><br></div><div>You&#39;re about to call sh_unpin()=
, and you want to tell that function to change its behavior.=C2=A0 What&#39=
;s so odd about adding an argument to the function to indicate the behavior=
?=C2=A0 Instead you&#39;re adding a bit of global state which is carried ar=
ound 100% of the time, even when that function isn&#39;t being called.=C2=
=A0 That&#39;s not what people normally expect; it makes the code harder to=
 reason about.</div><div><br></div><div>It would certainly be ugly to have =
to add &quot;false&quot; to every other instance of sh_unpin; but the norma=
l way you get around that is to redefine sh_unpin() as a wrapper which call=
s the other function with the &#39;false&#39; argument set.</div><div><br><=
/div><div>You asked me to review this for a second opinion on the safety of=
 clearing the up-pointer this way, not because you need an ack; so I don&#3=
9;t really want to block the patch for non-functional reasons.=C2=A0 But I =
think this is one of the &quot;death by a thousand cuts&quot; that makes th=
e shadow code more fragile and difficult for new people to approach and und=
erstand.</div><div>=C2=A0</div><div>Re the original question: I&#39;ve star=
ed at the code for a bit now, and I can&#39;t see anything obviously wrong =
or dangerous about it.</div><div><br></div><div>But it does make me ask, wh=
y do we need the &quot;unpinning_l3&quot; pseudo-argument at all?=C2=A0 Is =
there any reason not to unconditionally zero out sp-&gt;up when we find a h=
ead_type of SH_type_l3_64_shadow?=C2=A0 As far as I can tell, sp-&gt;list d=
oesn&#39;t require any special state.=C2=A0 Why do we make the effort to le=
ave it alone when we&#39;re not unpinning all l3s?</div><div><br></div><div=
>In fact, is there a way to unpin an l3 shadow *other* than when we&#39;re =
unpinning all l3&#39;s?=C2=A0 If so, then this patch, as written, is broken=
 -- the original code clears the up-pointer for *all* L3_64 shadows, regard=
less of whether they&#39;re on the pinned list; the new patch will only cle=
ar the ones on the pinned list.=C2=A0 But unconditionally clearing sp-&gt;u=
p could actually fix that.</div><div><br></div><div>Thoughts?</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">As to half of the =
patches not applying: Some where already applied out of<br>
order, and others therefore need re-basing slightly. Till now I saw no<br>
reason to re-send the remaining patches just for that.<br></blockquote><div=
><br></div><div>Sorry if that sounded like complaining; I was only being pr=
eemptively defensive against the potential accusation that the answer would=
 have been obvious if I&#39;d just continued reviewing the series. :-). (An=
d indeed if the whole series had applied I would have checked that the fina=
l result didn&#39;t have any other references to it.)</div><div><br></div><=
div>=C2=A0-George=C2=A0</div></div></div>
</div>

--0000000000007d7a3e05f2efef00--

