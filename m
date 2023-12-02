Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D16801CD1
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 14:02:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646125.1008618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9PcN-0007YJ-P1; Sat, 02 Dec 2023 13:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646125.1008618; Sat, 02 Dec 2023 13:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9PcN-0007Vd-MB; Sat, 02 Dec 2023 13:01:11 +0000
Received: by outflank-mailman (input) for mailman id 646125;
 Sat, 02 Dec 2023 13:01:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xKAF=HN=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1r9PcL-0007VX-UO
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 13:01:10 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da9440a9-9112-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 14:01:06 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a19ce1404e1so232307566b.3
 for <xen-devel@lists.xenproject.org>; Sat, 02 Dec 2023 05:01:06 -0800 (PST)
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
X-Inumbo-ID: da9440a9-9112-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1701522065; x=1702126865; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wiUXfQUqCo49tZPnymrLXMAuH54hmokN4Jjmax/AWv8=;
        b=c6QE8A8zaQXhVyIEpbaDrVYKnvuEg7XCL6pyi/xzIH6OyKsHWQHvwE6tHfrJi6L3xr
         8B4o0NQ22RDpmjBvVEr+8zZUyfXTP4sKDNwctOLc6pS9jLmvIQuyKfwkhIcNmc+zZCES
         8EsoPojT8QMJqvo3jYC78q4VoRot5lp2uzHhs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701522065; x=1702126865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wiUXfQUqCo49tZPnymrLXMAuH54hmokN4Jjmax/AWv8=;
        b=MWT8jqJTSohHrqdtYfE2wVkNKfIl0LIn1sT3o0k8Yfa8s0jmrAihM58PW8YYDKK0Y3
         UvkGYQkvSFpFwGpZu+qwBsGpb/3HAKiiNbxgEeWYMhCMf8fPCZhgwiLE2R/qGw0OQ8MF
         kf3tO7UecvlP9fQC7FeSr/CUXOFCeYvv2IWHB6bVbPM2t7Hkp4pK3RdEj+a+GAzj+B++
         AovEBUj+Y72Ucjutf6PKm8KgNIIMUqgtHBrtxvQ7C/dFtCOadGSRckcWs9A6aP74zZGu
         BSwaxOTQ2UDIVR8pPdE6qEb+pqtXSk0UrU28eCOD4iwmVN8wkjp6W3P0pDr5iATdZxu9
         eiOA==
X-Gm-Message-State: AOJu0YyZ1hzvirQIEVp2YACWrTrBfl5v/31On+tk91D17stvIDTzvHaH
	P1IHFs8bBwuFAPqwgzBojlUhg3uvfE/mSJSvDcud3v8edfetwngP6Pw=
X-Google-Smtp-Source: AGHT+IF7+sgGDXUcZPzWTd3TJy4P+YsklJGRSI7iNrOKFP1QrGI0nq4gpzltE1Bvz1zmfF8Brq0Odd1R7UmbkLbMSdY=
X-Received: by 2002:a17:906:2616:b0:a17:8181:4f3 with SMTP id
 h22-20020a170906261600b00a17818104f3mr1896108ejc.49.1701522065313; Sat, 02
 Dec 2023 05:01:05 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=zCpobcXHnAGeLL1tOP5dyqyThVri3a=76t_xYDMa+mrA@mail.gmail.com>
 <96df2df9-b295-6334-d45c-183d116fff88@suse.com> <alpine.DEB.2.22.394.2311131349470.160649@ubuntu-linux-20-04-desktop>
 <CAO-mL=ygwrvepWf_SqLbqXJv-nFBicpMPCJTuegJNitcr1BY2Q@mail.gmail.com>
In-Reply-To: <CAO-mL=ygwrvepWf_SqLbqXJv-nFBicpMPCJTuegJNitcr1BY2Q@mail.gmail.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Sat, 2 Dec 2023 13:00:00 +0000
Message-ID: <CAO-mL=yCb0LwPeuuiXVYAkC+iKkk3Wqm4KDgQQpweVdVm7NRTQ@mail.gmail.com>
Subject: Re: Informal voting proposal
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, 
	committers@xenproject.org
Content-Type: multipart/alternative; boundary="00000000000047f43c060b867a14"

--00000000000047f43c060b867a14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Given that there are no further comments, I will add informal voting to our
governance policies.

Many thanks,
Kelly Choi

Xen Project Community Manager
XenServer, Cloud Software Group


On Tue, Nov 14, 2023 at 11:16=E2=80=AFAM Kelly Choi <kelly.choi@cloud.com> =
wrote:

> Thanks for your feedback @Jan Beulich <jbeulich@suse.com> and @Stefano
> Stabellini <sstabellini@kernel.org>.
> Let's go ahead with your suggestion of using "component".
>
> I am sure this is a step in the right direction, and the time saved here
> will benefit from fixing other areas in the project.
>
> Many thanks,
> Kelly Choi
>
> Open Source Community Manager
> XenServer, Cloud Software Group
>
>
> On Mon, Nov 13, 2023 at 10:23=E2=80=AFPM Stefano Stabellini <
> sstabellini@kernel.org> wrote:
>
>> On Mon, 13 Nov 2023, Jan Beulich wrote:
>> > On 06.11.2023 17:40, Kelly Choi wrote:
>> > > Hi all,
>> > >
>> > > As an open-source community, there will always be differences of
>> opinion in
>> > > approaches and the way we think. It is imperative, however, that we
>> view
>> > > this diversity as a source of strength rather than a hindrance.
>> > >
>> > > Recent deliberations within our project have led to certain matters
>> being
>> > > put on hold due to an inability to reach a consensus. While formal
>> voting
>> > > procedures serve their purpose, they can be time-consuming and may n=
ot
>> > > always lead to meaningful progress.
>> > >
>> > > Having received agreement from a few maintainers already, I would
>> like to
>> > > propose the following:
>> > >
>> > > *Informal voting method:*
>> > >
>> > >    1. Each project should ideally have more than 2 maintainers to
>> > >    facilitate impartial discussions. Projects lacking this
>> configuration will
>> > >    be addressed at a later stage.
>> >
>> > Terminology question: What is "project" here? Considering how
>> ./MAINTAINERS
>> > is structured, is it perhaps more "component"?
>>
>> Yes, I think "component" is the right word
>>
>>
>> > >    2. Anyone in the community is welcome to voice their opinions,
>> ideas,
>> > >    and concerns about any patch or contribution.
>> > >    3. If members cannot agree, the majority informal vote of the
>> > >    maintainers will be the decision that stands. For instance, if,
>> after
>> > >    careful consideration of all suggestions and concerns, 2 out of 3
>> > >    maintainers endorse a solution within the x86 subsystem, it shall
>> be the
>> > >    decision we move forward with.
>> >
>> > In a later reply you make explicit what can only be guessed here: Ther=
e
>> > you suggest that out of a range of possible options, up front two are
>> > picked to then choose between. However, when there is a range options
>> > available, and when those can be viewed as points on a scale (rather
>> > than, to take Stefano's earlier example of SAF-* naming, cases where
>> > it's hard to view choices as being on a linear scale), picking two
>> > "points" up front may already pose a problem. (See also another reply
>> > mentioning how to ensure that the various possible options were even
>> > taken into consideration.)
>> >
>> > Not only in such situations, but in general, to me a prereq to even
>> > coming to the point of needing an informal vote is the willingness of
>> > everyone involved to find a compromise. When there's a range of views,
>> > and when "knowing" what's going to be best for the project would requi=
re
>> > a crystal ball, experience suggests to me that chances for an optimal
>> > choice are better when picking a "point" not at the far ends of the
>> scale.
>> > (Such a result then would also much better reflect your named goal of
>> > seeing diversity as a strength.)
>> >
>> > With such willingness I think even informal votes could be avoided mos=
t
>> > of the time, at which point it becomes questionable whether for the fe=
w
>> > remaining cases informal and formal votes really need specifying
>> > separately.
>>
>> The key difference in point of views is that you see as very common to
>> have options on a linear scale, where finding a middle ground makes
>> sense, and you see as an exception cases like SAF-* naming that are not
>> on a scale. In my view cases like SAF-* naming are the common case,
>> while it would be an exception to have options on a linear scale. If
>> it turns out there are indeed many cases where multiple options are on a
>> linear scale, we might be able to come up with another idea on how to
>> get a quick informal consensus for those issues.
>>
>>
>> > >    4. Naturally, there may be exceptional circumstances, as such, a
>> formal
>> > >    vote may be warranted but should happen only a few times a year
>> for serious
>> > >    cases only.
>> > >    5. Informal votes can be as easy as 2 out of 3 maintainers
>> providing
>> > >    their Acked-by/Reviewed-by tag. Alternatively, Maintainers can
>> call an
>> > >    informal vote by simply emailing the thread with "informal vote
>> proposed,
>> > >    option 1 and option 2."
>> >
>> > I find this difficult. Both A-b and R-b assert that the person offerin=
g
>> > the tag endorses the presented solution to the indicated degree. It do=
es
>> > not say anything on possible alternative solutions. As a result taking
>> > such tags as votes is (once again, and once again in my personal view)
>> > reasonable only when there's a black-and-white decision to be taken.
>>
>> From a practical perspective, A-b and R-b are a quick and easy way to
>> gauge informal consensus on an issue. Also, exploring alternative
>> solutions take time. Time for the reviewer, time for the contributor,
>> time for everyone else involved in the email thread. A-b and R-b have a
>> very important role: they say "this is good enough". When you have a
>> majority of people saying "this is good enough", I think we would be
>> better off spending our timing fixing other deficiencies, reviewing
>> other patches, rather than trying to further optimize that particular
>> patch.
>>
>>
>> > >    6. *All maintainers should reply with their vote within 5 working
>> days.*
>> > >
>> > >    7. Please note that with any new process, there will always be
>> room for
>> > >    improvement and we will reiterate where needed.
>> > >
>> > > Ultimately our goal here is to prevent the project coming to a
>> standstill
>> > > while deliberating decisions that we all cannot agree on. This may
>> mean
>> > > compromising in the short term but I am sure the long-term benefits
>> will
>> > > stand for themselves.
>> > >
>> > > *If you have any strong objections to the informal voting, please le=
t
>> me
>> > > know by 30th November 2023. *
>> >
>> > Just FTAOD none of the above is meant to be a "strong objection".
>> Despite
>> > being unconvinced of the proposal (including the need for one, not the
>> > least also considering what has triggered this sudden effort, when the=
re
>> > are - imo - worse problems of "standstill"), I'll try to be a good
>> citizen
>> > and play by what's going to be put in place.
>>
>> Thank you. Let's give it a try and see how it goes. As for every change,
>> we are trying to make improvements. If they don't work, or better ideas
>> come along, we can change again.
>>
>>

--00000000000047f43c060b867a14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi all,<div><br></div><div>Given that the=
re are no further comments, I will add informal voting to our governance po=
licies.=C2=A0</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gm=
ail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div=
><div><br></div><div><div style=3D"color:rgb(136,136,136)">Xen Project Comm=
unity Manager</div><div style=3D"color:rgb(136,136,136)">XenServer, Cloud S=
oftware Group</div></div></div></div></div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 14, 2023=
 at 11:16=E2=80=AFAM Kelly Choi &lt;<a href=3D"mailto:kelly.choi@cloud.com"=
>kelly.choi@cloud.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr">Thanks for your feedback=C2=A0<a clas=
s=3D"gmail_plusreply" id=3D"m_-2315369156882097211plusReplyChip-2" href=3D"=
mailto:jbeulich@suse.com" target=3D"_blank">@Jan Beulich</a>=C2=A0and=C2=A0=
<a class=3D"gmail_plusreply" id=3D"m_-2315369156882097211plusReplyChip-4" h=
ref=3D"mailto:sstabellini@kernel.org" target=3D"_blank">@Stefano Stabellini=
</a>.<div>Let&#39;s go ahead with your suggestion of using &quot;component&=
quot;.=C2=A0</div><div><br></div><div>I am sure this is a step in the=C2=A0=
right direction, and the time saved here will benefit from fixing other are=
as in the project.=C2=A0</div><div><br clear=3D"all"><div><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kell=
y Choi</div><div><br></div><div><div style=3D"color:rgb(136,136,136)">Open =
Source Community Manager</div><div style=3D"color:rgb(136,136,136)">XenServ=
er, Cloud Software Group</div></div></div></div></div><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Nov=
 13, 2023 at 10:23=E2=80=AFPM Stefano Stabellini &lt;<a href=3D"mailto:ssta=
bellini@kernel.org" target=3D"_blank">sstabellini@kernel.org</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 13 Nov =
2023, Jan Beulich wrote:<br>
&gt; On 06.11.2023 17:40, Kelly Choi wrote:<br>
&gt; &gt; Hi all,<br>
&gt; &gt; <br>
&gt; &gt; As an open-source community, there will always be differences of =
opinion in<br>
&gt; &gt; approaches and the way we think. It is imperative, however, that =
we view<br>
&gt; &gt; this diversity as a source of strength rather than a hindrance.<b=
r>
&gt; &gt; <br>
&gt; &gt; Recent deliberations within our project have led to certain matte=
rs being<br>
&gt; &gt; put on hold due to an inability to reach a consensus. While forma=
l voting<br>
&gt; &gt; procedures serve their purpose, they can be time-consuming and ma=
y not<br>
&gt; &gt; always lead to meaningful progress.<br>
&gt; &gt; <br>
&gt; &gt; Having received agreement from a few maintainers already, I would=
 like to<br>
&gt; &gt; propose the following:<br>
&gt; &gt; <br>
&gt; &gt; *Informal voting method:*<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 1. Each project should ideally have more than 2 main=
tainers to<br>
&gt; &gt;=C2=A0 =C2=A0 facilitate impartial discussions. Projects lacking t=
his configuration will<br>
&gt; &gt;=C2=A0 =C2=A0 be addressed at a later stage.<br>
&gt; <br>
&gt; Terminology question: What is &quot;project&quot; here? Considering ho=
w ./MAINTAINERS<br>
&gt; is structured, is it perhaps more &quot;component&quot;?<br>
<br>
Yes, I think &quot;component&quot; is the right word<br>
<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 2. Anyone in the community is welcome to voice their=
 opinions, ideas,<br>
&gt; &gt;=C2=A0 =C2=A0 and concerns about any patch or contribution.<br>
&gt; &gt;=C2=A0 =C2=A0 3. If members cannot agree, the majority informal vo=
te of the<br>
&gt; &gt;=C2=A0 =C2=A0 maintainers will be the decision that stands. For in=
stance, if, after<br>
&gt; &gt;=C2=A0 =C2=A0 careful consideration of all suggestions and concern=
s, 2 out of 3<br>
&gt; &gt;=C2=A0 =C2=A0 maintainers endorse a solution within the x86 subsys=
tem, it shall be the<br>
&gt; &gt;=C2=A0 =C2=A0 decision we move forward with.<br>
&gt; <br>
&gt; In a later reply you make explicit what can only be guessed here: Ther=
e<br>
&gt; you suggest that out of a range of possible options, up front two are<=
br>
&gt; picked to then choose between. However, when there is a range options<=
br>
&gt; available, and when those can be viewed as points on a scale (rather<b=
r>
&gt; than, to take Stefano&#39;s earlier example of SAF-* naming, cases whe=
re<br>
&gt; it&#39;s hard to view choices as being on a linear scale), picking two=
<br>
&gt; &quot;points&quot; up front may already pose a problem. (See also anot=
her reply<br>
&gt; mentioning how to ensure that the various possible options were even<b=
r>
&gt; taken into consideration.)<br>
&gt; <br>
&gt; Not only in such situations, but in general, to me a prereq to even<br=
>
&gt; coming to the point of needing an informal vote is the willingness of<=
br>
&gt; everyone involved to find a compromise. When there&#39;s a range of vi=
ews,<br>
&gt; and when &quot;knowing&quot; what&#39;s going to be best for the proje=
ct would require<br>
&gt; a crystal ball, experience suggests to me that chances for an optimal<=
br>
&gt; choice are better when picking a &quot;point&quot; not at the far ends=
 of the scale.<br>
&gt; (Such a result then would also much better reflect your named goal of<=
br>
&gt; seeing diversity as a strength.)<br>
&gt; <br>
&gt; With such willingness I think even informal votes could be avoided mos=
t<br>
&gt; of the time, at which point it becomes questionable whether for the fe=
w<br>
&gt; remaining cases informal and formal votes really need specifying<br>
&gt; separately.<br>
<br>
The key difference in point of views is that you see as very common to<br>
have options on a linear scale, where finding a middle ground makes<br>
sense, and you see as an exception cases like SAF-* naming that are not<br>
on a scale. In my view cases like SAF-* naming are the common case,<br>
while it would be an exception to have options on a linear scale. If<br>
it turns out there are indeed many cases where multiple options are on a<br=
>
linear scale, we might be able to come up with another idea on how to<br>
get a quick informal consensus for those issues.<br>
<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 4. Naturally, there may be exceptional circumstances=
, as such, a formal<br>
&gt; &gt;=C2=A0 =C2=A0 vote may be warranted but should happen only a few t=
imes a year for serious<br>
&gt; &gt;=C2=A0 =C2=A0 cases only.<br>
&gt; &gt;=C2=A0 =C2=A0 5. Informal votes can be as easy as 2 out of 3 maint=
ainers providing<br>
&gt; &gt;=C2=A0 =C2=A0 their Acked-by/Reviewed-by tag. Alternatively, Maint=
ainers can call an<br>
&gt; &gt;=C2=A0 =C2=A0 informal vote by simply emailing the thread with &qu=
ot;informal vote proposed,<br>
&gt; &gt;=C2=A0 =C2=A0 option 1 and option 2.&quot;<br>
&gt; <br>
&gt; I find this difficult. Both A-b and R-b assert that the person offerin=
g<br>
&gt; the tag endorses the presented solution to the indicated degree. It do=
es<br>
&gt; not say anything on possible alternative solutions. As a result taking=
<br>
&gt; such tags as votes is (once again, and once again in my personal view)=
<br>
&gt; reasonable only when there&#39;s a black-and-white decision to be take=
n.<br>
<br>
From a practical perspective, A-b and R-b are a quick and easy way to<br>
gauge informal consensus on an issue. Also, exploring alternative<br>
solutions take time. Time for the reviewer, time for the contributor,<br>
time for everyone else involved in the email thread. A-b and R-b have a<br>
very important role: they say &quot;this is good enough&quot;. When you hav=
e a<br>
majority of people saying &quot;this is good enough&quot;, I think we would=
 be<br>
better off spending our timing fixing other deficiencies, reviewing<br>
other patches, rather than trying to further optimize that particular<br>
patch.<br>
<br>
<br>
&gt; &gt;=C2=A0 =C2=A0 6. *All maintainers should reply with their vote wit=
hin 5 working days.*<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 =C2=A0 7. Please note that with any new process, there will=
 always be room for<br>
&gt; &gt;=C2=A0 =C2=A0 improvement and we will reiterate where needed.<br>
&gt; &gt; <br>
&gt; &gt; Ultimately our goal here is to prevent the project coming to a st=
andstill<br>
&gt; &gt; while deliberating decisions that we all cannot agree on. This ma=
y mean<br>
&gt; &gt; compromising in the short term but I am sure the long-term benefi=
ts will<br>
&gt; &gt; stand for themselves.<br>
&gt; &gt; <br>
&gt; &gt; *If you have any strong objections to the informal voting, please=
 let me<br>
&gt; &gt; know by 30th November 2023. *<br>
&gt; <br>
&gt; Just FTAOD none of the above is meant to be a &quot;strong objection&q=
uot;. Despite<br>
&gt; being unconvinced of the proposal (including the need for one, not the=
<br>
&gt; least also considering what has triggered this sudden effort, when the=
re<br>
&gt; are - imo - worse problems of &quot;standstill&quot;), I&#39;ll try to=
 be a good citizen<br>
&gt; and play by what&#39;s going to be put in place.<br>
<br>
Thank you. Let&#39;s give it a try and see how it goes. As for every change=
,<br>
we are trying to make improvements. If they don&#39;t work, or better ideas=
<br>
come along, we can change again.<br>
<br>
</blockquote></div>
</blockquote></div></div>

--00000000000047f43c060b867a14--

