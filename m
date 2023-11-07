Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF77E41A7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Nov 2023 15:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628830.980696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Mrk-0000O8-0z; Tue, 07 Nov 2023 14:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628830.980696; Tue, 07 Nov 2023 14:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0Mrj-0000Lv-Sv; Tue, 07 Nov 2023 14:15:39 +0000
Received: by outflank-mailman (input) for mailman id 628830;
 Tue, 07 Nov 2023 14:15:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhat=GU=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r0Mrh-0000Iv-Jn
 for xen-devel@lists.xenproject.org; Tue, 07 Nov 2023 14:15:37 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e103e8d-7d78-11ee-9b0e-b553b5be7939;
 Tue, 07 Nov 2023 15:15:35 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so301186166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Nov 2023 06:15:35 -0800 (PST)
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
X-Inumbo-ID: 1e103e8d-7d78-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699366534; x=1699971334; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SPBMuYgYrUmDpajKbsD+s1sswMWIm1yV81XrPA5v1KA=;
        b=GHXDtBuqurAK3WPF4xf6Wzq6GxuIRgZiWkc7SF4B9NLFPocPAYuZpF2ZyhlRAh5AE3
         jHGR7KG/WZIUUnrRC5EpPseWYFAP88i90g6s4OAARzD7bccWJJlsnEeXruZTN2IYYysI
         rj4v1eaV2XzZD3iCAxRTf7uivzdHmFUDhf8WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699366534; x=1699971334;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SPBMuYgYrUmDpajKbsD+s1sswMWIm1yV81XrPA5v1KA=;
        b=dtfg+InG25Vuuy/pl9wgEyYvpBFsk+keHUvZ9gNQ1pkUmDlpvoTg7msmBVc60GEbSF
         GR4jKlgdvDIJMVDylDvrxQ6PtolBsteIvC7qbnLZbG8O/GbuUhbNlY9XxRa1UxDLKNnD
         mCSAvQabsBPZDHSpBCPJyPZ47rEZBMu+TqxG9noA1vxJ01MsbmUvKkCLG2J7EQTIkoRZ
         cnJnUf+UolTn1sBM+5NUYbLwsuoWfiQjsdRTd1/U9pQZm2DjOcH7zgQ67Ej9WVQAmJmV
         QgRdAcxc9CbUO9QzubgAWOWLTXAmkboIrJluM4YWmk2XDsmNANVniv+d6R6CtUE8Dfme
         7xCA==
X-Gm-Message-State: AOJu0Yx8QMaMFASKvCpOuBN885CEIcZ4vUdJfluW6DxpPfIsSOcibvwN
	6KRPnHroyCC1jtuAOxNQzEBr0B/VOWVtFBBWAthwog==
X-Google-Smtp-Source: AGHT+IG1rU+lNzAFnidEb3fYAVPVGg4ZtIB1oWdfemGJnzWwQXNRsK++UGD+lNGr6+ilHXas3UFkCIkPlL0oY1DTO/g=
X-Received: by 2002:a17:907:1c21:b0:9d3:85b9:afcf with SMTP id
 nc33-20020a1709071c2100b009d385b9afcfmr17165650ejc.12.1699366534475; Tue, 07
 Nov 2023 06:15:34 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=zCpobcXHnAGeLL1tOP5dyqyThVri3a=76t_xYDMa+mrA@mail.gmail.com>
 <39e6d4b3-5468-4b91-a030-f36bcce3583d@xen.org> <alpine.DEB.2.22.394.2311061254560.3478774@ubuntu-linux-20-04-desktop>
 <3ca89630-1625-46cc-b78b-9b9c073ccea3@xen.org>
In-Reply-To: <3ca89630-1625-46cc-b78b-9b9c073ccea3@xen.org>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 7 Nov 2023 14:14:58 +0000
Message-ID: <CAO-mL=ygRFf1cARyb4wOUVWn=toBPHr=2RAW31z6i=yHeXo6Pg@mail.gmail.com>
Subject: Re: Informal voting proposal
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org, 
	committers@xenproject.org
Content-Type: multipart/alternative; boundary="000000000000a18abb0609909a8a"

--000000000000a18abb0609909a8a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback Julien, see my reply below.

Many thanks,
Kelly Choi

Open Source Community Manager
XenServer, Cloud Software Group


On Tue, Nov 7, 2023 at 8:23=E2=80=AFAM Julien Grall <julien@xen.org> wrote:

> Hi Stefano,
>
> On 07/11/2023 04:18, Stefano Stabellini wrote:
> > On Mon, 6 Nov 2023, Julien Grall wrote:
> >> Hi Kelly,
> >>
> >> On 06/11/2023 16:40, Kelly Choi wrote:
> >>> Hi all,
> >>>
> >>> As an open-source community, there will always be differences of
> opinion in
> >>> approaches and the way we think. It is imperative, however, that we
> view
> >>> this diversity as a source of strength rather than a hindrance.
> >>>
> >>> Recent deliberations within our project have led to certain matters
> being
> >>> put on hold due to an inability to reach a consensus. While formal
> voting
> >>> procedures serve their purpose, they can be time-consuming and may no=
t
> >>> always lead to meaningful progress.
> >>>
> >>> Having received agreement from a few maintainers already, I would lik=
e
> to
> >>> propose the following:
> >>
> >> Thanks for the sending the proposal. While I like the idea of informal
> vote to
> >> move faster, I would like to ask some clarifications.
> >>
> >>> *Informal voting method:*
> >>>
> >>>      1. Each project should ideally have more than 2 maintainers to
> >>>      facilitate impartial discussions. Projects lacking this
> configuration
> >>> will
> >>>      be addressed at a later stage.
> >>>      2. Anyone in the community is welcome to voice their opinions,
> ideas,
> >>>      and concerns about any patch or contribution.
> >>>      3. If members cannot agree, the majority informal vote of the
> >>>      maintainers will be the decision that stands. For instance, if,
> after
> >>>      careful consideration of all suggestions and concerns, 2 out of =
3
> >>>      maintainers endorse a solution within the x86 subsystem, it shal=
l
> be the
> >>>      decision we move forward with.
> >>
> >> How do you know that all the options have been carefully considered?
> >
> > I don't think there is a hard rule on this. We follow the discussion on
> > the list the same way as we do today.
>
> To me the fact we need to write down the informal rules means that
> something already gone wrong before. So I feel that rules should be
> unambiguous to avoid any problem afterwards.
>

In this case 'all options' would mean the different choices that
maintainers have discussed and considered, before calling an informal vote.
The reason for the informal vote is that 'all options' have been
considered, but a decision can not be made. Whilst there can be many
options, the informal voting method aims to reduce this by enabling
maintainers to call a vote and propose two options, so the project can move
forward. Again there will be times for that call for flexibility, but we
should always aim to have a vote for two of the best solutions to avoid the
project coming to another standstill.


>
> >
> > While I like the informal vote proposal and effectively we have already
> > been following it in many areas of the project, I don't think we should
> > change the current processes from that point of view.
>
> I am confused. Are you suggesting that we should not write down how
> informal votes works?
>

I cannot speak for Stefano, but the informal vote process should be written
down as an 'aspirational guideline' meaning it's a process we ought to
follow in the best interest of the project. The formal voting process will
still be in place.

>
> >
> >
> >>>      4. Naturally, there may be exceptional circumstances, as such, a
> formal
> >>>      vote may be warranted but should happen only a few times a year
> for
> >>> serious
> >>>      cases only.
> >> Similarly here, you are suggesting that a formal vote can be called.
> But it is
> >> not super clear what would be the condition it could be used and how i=
t
> can be
> >> called.
> >
> > The formal vote is basically the same we already have today. It would
> > follow the existing voting rules and guidelines already part of the
> > governance.
>
> Reading through the governance, I couldn't find anywhere indicating in
> which condition the formal votes can be triggered. Hence my question here=
.
>

There's a difficulty here in the sense that there isn't a specific
guideline around what condition a formal vote can be triggered. Until that
guideline is implemented, reviewed, and updated, I would suggest that a
formal vote is called only in cases where serious damage would come to the
project and the community. Again, this would be down to reasonable
judgement so I would trust committers/maintainers on this, and should
happen less than a few times a year.

>
> >> For instance, per the informal rule, if 2 out of 3 maintainers accept.
> Then it
> >> would be sensible for the patch to be merged as soon as the 5 days
> windows is
> >> closed. Yet the 3rd maintainer technically object it. So could that
> maintainer
> >> request a formal vote? If so, how long do they have?
> >
> > It is difficult to write down a process that works in all cases, and if
> > we did it would probably end up being slower rather than faster.
> >
> > In my view if someone doesn't agree with his other co-maintainers and h=
e
> > is outvoted (e.g. 2/3 of the maintainers prefer a different option), th=
e
> > individual is entitled to raise a request for a vote with the
> > committers, which is the same as we already have today.
> >
> > Ideally a formal vote would be rare, maybe once or twice a year, so I
> > hope we won't need to optimize the formal vote.
>
> Ok. So the expectation is that all the maintainers will accept the
> informal votes in the majority of the cases. If this is not the case,
> then we will revise the rules. Is that correct?
>

Having spoken to a few maintainers already, this is the agreed view. There
will be times when we have to accept the best solution even if we don't
personally agree. The best interest of the community and project should
come first, hence why an informal vote is seen as the consensus.

>
> >>>      5. Informal votes can be as easy as 2 out of 3 maintainers
> providing
> >>>      their Acked-by/Reviewed-by tag. Alternatively, Maintainers can
> call an
> >>>      informal vote by simply emailing the thread with "informal vote
> >>> proposed,
> >>>      option 1 and option 2."
> >>>      6. *All maintainers should reply with their vote within 5 workin=
g
> days.*
> >>
> >> While I understand we want to move fast, this means that a maintainer
> that is
> >> away for PTO would not have the opportunity to answer.
> >
> > PTO is a bit of a special case because we typically know when one of th=
e
> > maintainers is on PTO. If it is a short PTO and if the vacationing
> > maintainer could have a strong opinion on the subject then it would mak=
e
> > sense to wait. If it is a long leave of absence (several weeks or
> > months) then I don't think we can wait.
> >
> > So I think the 5 working days is OK as a rule of thumb, but of course i=
t
> > shouldn't be used to work around objections of a maintainer by waiting
> > for him to go on holiday :-)
>
> Well... It has been done before ;). That's why I think it is important
> to write down because at least it is not left to interpretation.
>

Adding to this rule, if a maintainer is on holiday for 2 weeks or less, we
should wait. If the time is 2 weeks+ and is not deemed as causing major
issues then we should proceed. This hopefully gives you a rough
guideline/time frame. We can reiterate if needed here.

>
> Cheers,
>
> --
> Julien Grall
>

--000000000000a18abb0609909a8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Thanks for the feedback Julien, see my re=
ply below.=C2=A0</div><div dir=3D"ltr"><br clear=3D"all"><div><div dir=3D"l=
tr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>=
Kelly Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">O=
pen Source Community Manager</div><div style=3D"color:rgb(136,136,136)">Xen=
Server, Cloud Software Group</div></div></div></div></div><br></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 7=
, 2023 at 8:23=E2=80=AFAM Julien Grall &lt;<a href=3D"mailto:julien@xen.org=
">julien@xen.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi Stefano,<br>
<br>
On 07/11/2023 04:18, Stefano Stabellini wrote:<br>
&gt; On Mon, 6 Nov 2023, Julien Grall wrote:<br>
&gt;&gt; Hi Kelly,<br>
&gt;&gt;<br>
&gt;&gt; On 06/11/2023 16:40, Kelly Choi wrote:<br>
&gt;&gt;&gt; Hi all,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; As an open-source community, there will always be differences =
of opinion in<br>
&gt;&gt;&gt; approaches and the way we think. It is imperative, however, th=
at we view<br>
&gt;&gt;&gt; this diversity as a source of strength rather than a hindrance=
.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Recent deliberations within our project have led to certain ma=
tters being<br>
&gt;&gt;&gt; put on hold due to an inability to reach a consensus. While fo=
rmal voting<br>
&gt;&gt;&gt; procedures serve their purpose, they can be time-consuming and=
 may not<br>
&gt;&gt;&gt; always lead to meaningful progress.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Having received agreement from a few maintainers already, I wo=
uld like to<br>
&gt;&gt;&gt; propose the following:<br>
&gt;&gt;<br>
&gt;&gt; Thanks for the sending the proposal. While I like the idea of info=
rmal vote to<br>
&gt;&gt; move faster, I would like to ask some clarifications.<br>
&gt;&gt;<br>
&gt;&gt;&gt; *Informal voting method:*<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 1. Each project should ideally have more t=
han 2 maintainers to<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 facilitate impartial discussions. Projects=
 lacking this configuration<br>
&gt;&gt;&gt; will<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 be addressed at a later stage.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 2. Anyone in the community is welcome to v=
oice their opinions, ideas,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 and concerns about any patch or contributi=
on.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 3. If members cannot agree, the majority i=
nformal vote of the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 maintainers will be the decision that stan=
ds. For instance, if, after<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 careful consideration of all suggestions a=
nd concerns, 2 out of 3<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 maintainers endorse a solution within the =
x86 subsystem, it shall be the<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 decision we move forward with.<br>
&gt;&gt;<br>
&gt;&gt; How do you know that all the options have been carefully considere=
d?<br>
&gt; <br>
&gt; I don&#39;t think there is a hard rule on this. We follow the discussi=
on on &gt; the list the same way as we do today.<br>
<br>
To me the fact we need to write down the informal rules means that <br>
something already gone wrong before. So I feel that rules should be <br>
unambiguous to avoid any problem afterwards.<br></blockquote><div><br></div=
><div><font color=3D"#ff0000">In this case &#39;all options&#39; would mean=
 the different choices that maintainers have discussed and considered, befo=
re calling an informal vote.=C2=A0</font></div><div><font color=3D"#ff0000"=
>The reason for the informal vote is that &#39;all options&#39; have been c=
onsidered, but a decision can not be made. Whilst there can be many options=
, the informal voting method aims to reduce this by enabling maintainers to=
 call a vote and propose two options, so the project can move forward. Agai=
n there will be times for that call for flexibility, but we should always a=
im to have a vote for two of the best solutions to avoid the project coming=
 to another standstill.=C2=A0</font></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; While I like the informal vote proposal and effectively we have alread=
y<br>
&gt; been following it in many areas of the project, I don&#39;t think we s=
hould<br>
&gt; change the current processes from that point of view.<br>
<br>
I am confused. Are you suggesting that we should not write down how <br>
informal votes works?<br></blockquote><div><br></div><div><font color=3D"#f=
f0000">I cannot speak for Stefano, but the informal vote process should be =
written down as an &#39;aspirational guideline&#39; meaning it&#39;s a proc=
ess we ought to follow in the best interest of the project. The formal voti=
ng process will still be in place.=C2=A0</font></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; <br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 4. Naturally, there may be exceptional cir=
cumstances, as such, a formal<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 vote may be warranted but should happen on=
ly a few times a year for<br>
&gt;&gt;&gt; serious<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 cases only.<br>
&gt;&gt; Similarly here, you are suggesting that a formal vote can be calle=
d. But it is<br>
&gt;&gt; not super clear what would be the condition it could be used and h=
ow it can be<br>
&gt;&gt; called.<br>
&gt; <br>
&gt; The formal vote is basically the same we already have today. It would<=
br>
&gt; follow the existing voting rules and guidelines already part of the<br=
>
&gt; governance.<br>
<br>
Reading through the governance, I couldn&#39;t find anywhere indicating in =
<br>
which condition the formal votes can be triggered. Hence my question here.<=
br></blockquote><div><br></div><div><font color=3D"#ff0000">There&#39;s a d=
ifficulty here in the sense that there isn&#39;t a specific guideline aroun=
d what condition a formal vote can be triggered. Until that guideline is im=
plemented, reviewed, and updated, I would suggest that a formal vote is cal=
led only in cases where serious damage would come to the project and the co=
mmunity. Again, this would be down to reasonable judgement so I would trust=
 committers/maintainers on this, and should happen less than a few times a =
year.=C2=A0=C2=A0</font>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
&gt;&gt; For instance, per the informal rule, if 2 out of 3 maintainers acc=
ept. Then it<br>
&gt;&gt; would be sensible for the patch to be merged as soon as the 5 days=
 windows is<br>
&gt;&gt; closed. Yet the 3rd maintainer technically object it. So could tha=
t maintainer<br>
&gt;&gt; request a formal vote? If so, how long do they have?<br>
&gt; <br>
&gt; It is difficult to write down a process that works in all cases, and i=
f<br>
&gt; we did it would probably end up being slower rather than faster.<br>
&gt; <br>
&gt; In my view if someone doesn&#39;t agree with his other co-maintainers =
and he<br>
&gt; is outvoted (e.g. 2/3 of the maintainers prefer a different option), t=
he<br>
&gt; individual is entitled to raise a request for a vote with the<br>
&gt; committers, which is the same as we already have today.<br>
&gt; <br>
&gt; Ideally a formal vote would be rare, maybe once or twice a year, so I<=
br>
&gt; hope we won&#39;t need to optimize the formal vote.<br>
<br>
Ok. So the expectation is that all the maintainers will accept the <br>
informal votes in the majority of the cases. If this is not the case, <br>
then we will revise the rules. Is that correct?<br></blockquote><div><br></=
div><div><font color=3D"#ff0000">Having spoken to a few maintainers already=
, this is the agreed view. There will be times when we have to accept the b=
est solution even if we don&#39;t personally agree. The best interest of th=
e community and project should come first, hence why an informal vote is se=
en as the consensus.=C2=A0</font>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 5. Informal votes can be as easy as 2 out =
of 3 maintainers providing<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 their Acked-by/Reviewed-by tag. Alternativ=
ely, Maintainers can call an<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 informal vote by simply emailing the threa=
d with &quot;informal vote<br>
&gt;&gt;&gt; proposed,<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 option 1 and option 2.&quot;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 6. *All maintainers should reply with thei=
r vote within 5 working days.*<br>
&gt;&gt;<br>
&gt;&gt; While I understand we want to move fast, this means that a maintai=
ner that is<br>
&gt;&gt; away for PTO would not have the opportunity to answer.<br>
&gt; <br>
&gt; PTO is a bit of a special case because we typically know when one of t=
he<br>
&gt; maintainers is on PTO. If it is a short PTO and if the vacationing<br>
&gt; maintainer could have a strong opinion on the subject then it would ma=
ke<br>
&gt; sense to wait. If it is a long leave of absence (several weeks or<br>
&gt; months) then I don&#39;t think we can wait.<br>
&gt; <br>
&gt; So I think the 5 working days is OK as a rule of thumb, but of course =
it<br>
&gt; shouldn&#39;t be used to work around objections of a maintainer by wai=
ting<br>
&gt; for him to go on holiday :-)<br>
<br>
Well... It has been done before ;). That&#39;s why I think it is important =
<br>
to write down because at least it is not left to interpretation.<br></block=
quote><div><br></div><div><font color=3D"#ff0000">Adding to this rule, if a=
 maintainer is on holiday for 2 weeks or less, we should wait. If the time =
is 2 weeks+ and is not deemed as causing major issues then we should procee=
d. This hopefully gives you a rough guideline/time frame. We can reiterate =
if needed here.=C2=A0=C2=A0</font>=C2=A0</div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div></div>

--000000000000a18abb0609909a8a--

