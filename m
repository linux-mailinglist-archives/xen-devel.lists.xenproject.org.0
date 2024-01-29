Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21F4840C69
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 17:53:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673050.1047208 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUsW-0000DS-Pf; Mon, 29 Jan 2024 16:53:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673050.1047208; Mon, 29 Jan 2024 16:53:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUUsW-0000BX-N4; Mon, 29 Jan 2024 16:53:00 +0000
Received: by outflank-mailman (input) for mailman id 673050;
 Mon, 29 Jan 2024 16:52:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kvg3=JH=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rUUsV-0000BQ-7C
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 16:52:59 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da2daf9c-bec6-11ee-98f5-efadbce2ee36;
 Mon, 29 Jan 2024 17:52:57 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-55eedf5a284so1755249a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 08:52:57 -0800 (PST)
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
X-Inumbo-ID: da2daf9c-bec6-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1706547176; x=1707151976; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Gbik/HL66GnscIv6B2QzSlYniR+FazWE9sptKql+PS8=;
        b=AkDxpOQe+qNCDaqPM9uLRq7/TgBdbVnun+j9UkV3UX5/zlIs4Q8Qy/ZAiN9lgNMSPX
         UbRtpPKrUSRJF/Pq5UZEv5WdTMsratrx3gwRtyMUDfLsP3wA0QQXPyGzA7X1v6XDJJsX
         hutfNWk5GvpJ9qA0uBPXBjxR4hKpqNigRlHsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706547176; x=1707151976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gbik/HL66GnscIv6B2QzSlYniR+FazWE9sptKql+PS8=;
        b=fypmhLVwlMnq9zWCUjR8wllNdWyHGejcPyDHHfdbOw5wpCh+/whzySEwpl/PVSOetS
         9mE5MKd9zp7Q5h81jWTwEW/y1qsxVIErKtnIbL2PftwTWC/QNjtWFTKy+fC/845iI8BE
         NX1kYeEDHgiGqXaqmJq2AJTeGDY2envIG8Kco6j/U6+chinGkVD/RKVb4c4jeNAs9TZQ
         IS/5MWvGNnJ8StjX3B/qku4SL4Kf8aGCM9I4j1XWHW2x1PZwHX/juwGLmG/TchZe1x5b
         qHAGLkZOCVTURmmcBTcTggIoAYIGDOihNwwi2jvFsHWx6OrmzIyBkPjBp0h5EmJUTeGY
         3GUA==
X-Gm-Message-State: AOJu0YwofGDaCIE8haeTwP915DFH98qymJQfxtWd8R4g+Old0+PvZ0t1
	YUpSoyTtBCKvqEdWPmdiCmFKj67ZDTtwlzVspTo2gfN7bVWh6ZfLQcK/I15satRJFQtxI8lLqp1
	krRMqmsu5Z1V/vKxyUvbpfcI7Gdba+xzfzDMp+Q==
X-Google-Smtp-Source: AGHT+IHYSPQMkAwERjU/DTuQ5FWA5HwA4puRsPsGBxFt1prpqm1gu2vsuTvnk4KFMYZtV1Fav+LDYrmCFJFgOFfgUEk=
X-Received: by 2002:a05:6402:164c:b0:55f:20ef:ca1c with SMTP id
 s12-20020a056402164c00b0055f20efca1cmr846918edx.38.1706547176424; Mon, 29 Jan
 2024 08:52:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org> <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
 <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
 <67bf2be7-53f4-40d0-a856-8ae631a054b0@suse.com> <955e9b02-20bd-4279-9f60-bb757cdf1a03@xen.org>
 <0f729b61-b839-48f6-89ae-b5570b1eae0b@xen.org> <26152790b0b8c3330d9cfc3c0462a1c072d6d598.camel@gmail.com>
 <87f4c67a-3902-499a-b4e3-c1429a0d9167@suse.com> <61bb0457701582f85f60f81cefb02953587deb06.camel@gmail.com>
 <cc704b38-0fd7-4155-8de9-308ab1a46740@suse.com>
In-Reply-To: <cc704b38-0fd7-4155-8de9-308ab1a46740@suse.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Mon, 29 Jan 2024 16:52:20 +0000
Message-ID: <CAO-mL=x4d38RH+G=UUy0w8iha1JdsrQRuDG32OAjbGqk2rMSew@mail.gmail.com>
Subject: Re: Xen 4.19 release schedule proposal
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii <oleksii.kurochko@gmail.com>, community.manager@xenproject.org, 
	julien@xen.org, sstabellini@kernel.org, Bertrand.Marquis@arm.com, 
	andrew.cooper3@citrix.com, roger.pau@citrix.com, anthony.perard@citrix.com, 
	george.dunlap@cloud.com, jgross@suse.com, Wei.Chen@arm.com, 
	xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000003e5d800610187af0"

--0000000000003e5d800610187af0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

I propose we raise this in the next community call (Thursday 1st Feb).
We can decide on the official cadence then and any further feedback.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Mon, Jan 8, 2024 at 2:58=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:

> On 08.01.2024 15:37, Oleksii wrote:
> > On Thu, 2024-01-04 at 13:52 +0100, Jan Beulich wrote:
> >> On 02.01.2024 17:59, Oleksii wrote:
> >>> I'd like to propose the release schedule for Xen 4.19.
> >>>
> >>> Based on the previous release schedules [1] and [2], it seems the
> >>> next
> >>> release date should be on Wednesday, July 10, 2024:
> >>>
> >>> ** Proposed option: Wed Jul 10, 2024 **
> >>> (+9 months from Xen 4.18 release)
> >>
> >> Hmm, aren't we intending to be on a 8 month cadence?
> > Considering that in July, there will be the Xen Developer Summit, we
> > can aim for an 8-month cadence.
>
> July? Iirc I read June in the announcement.
>
> > However, in the Xen release document, there was mention of a discussion
> > [1] about cadence:
> > "With 18 months of full support and 36 months of security support, the
> > number of concurrent supported releases will be the same with either 8
> > or 9 months release cycles, so I have chosen an 8-month cycle for now."
> >
> > I interpreted this as either an 8 or 9-month cycle, and it's not
> > strict. If there's a strict requirement for a specific duration, I'll
> > resend the Release Schedule Proposal.
>
> I'm not sure about "strict". Yet ...
>
> > [1] https://lists.xen.org/archives/html/xen-devel/2018-07/msg02240.html
>
> ... this very mail worked out how overlap with larger holiday ranges
> could be minimized not only for a single release, but for any as long
> as the cadence is followed. Iirc this works out better with 8 months
> (as kind of to be expected, as then there are only 3 variants, whereas
> with 9 months it would be 4 of them).
>
> Just to clarify, personally I'm fine with 9 months or even longer, but
> it seemed to me that we had settled on 8.
>
> Jan
>

--0000000000003e5d800610187af0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I propose we raise this in the =
next community call (Thursday 1st Feb).</div><div>We can decide on the offi=
cial cadence then and any further feedback.=C2=A0</div><div><br clear=3D"al=
l"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_=
signature"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><di=
v><br></div><div><div style=3D"color:rgb(136,136,136)">Community Manager</d=
iv><div style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div><=
/div></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Jan 8, 2024 at 2:58=E2=80=AFPM Jan Beuli=
ch &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 08.01.2024 =
15:37, Oleksii wrote:<br>
&gt; On Thu, 2024-01-04 at 13:52 +0100, Jan Beulich wrote:<br>
&gt;&gt; On 02.01.2024 17:59, Oleksii wrote:<br>
&gt;&gt;&gt; I&#39;d like to propose the release schedule for Xen 4.19.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Based on the previous release schedules [1] and [2], it seems =
the<br>
&gt;&gt;&gt; next<br>
&gt;&gt;&gt; release date should be on Wednesday, July 10, 2024:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ** Proposed option: Wed Jul 10, 2024 **<br>
&gt;&gt;&gt; (+9 months from Xen 4.18 release)<br>
&gt;&gt;<br>
&gt;&gt; Hmm, aren&#39;t we intending to be on a 8 month cadence?<br>
&gt; Considering that in July, there will be the Xen Developer Summit, we<b=
r>
&gt; can aim for an 8-month cadence.<br>
<br>
July? Iirc I read June in the announcement.<br>
<br>
&gt; However, in the Xen release document, there was mention of a discussio=
n<br>
&gt; [1] about cadence:<br>
&gt; &quot;With 18 months of full support and 36 months of security support=
, the<br>
&gt; number of concurrent supported releases will be the same with either 8=
<br>
&gt; or 9 months release cycles, so I have chosen an 8-month cycle for now.=
&quot;<br>
&gt; <br>
&gt; I interpreted this as either an 8 or 9-month cycle, and it&#39;s not<b=
r>
&gt; strict. If there&#39;s a strict requirement for a specific duration, I=
&#39;ll<br>
&gt; resend the Release Schedule Proposal.<br>
<br>
I&#39;m not sure about &quot;strict&quot;. Yet ...<br>
<br>
&gt; [1] <a href=3D"https://lists.xen.org/archives/html/xen-devel/2018-07/m=
sg02240.html" rel=3D"noreferrer" target=3D"_blank">https://lists.xen.org/ar=
chives/html/xen-devel/2018-07/msg02240.html</a><br>
<br>
... this very mail worked out how overlap with larger holiday ranges<br>
could be minimized not only for a single release, but for any as long<br>
as the cadence is followed. Iirc this works out better with 8 months<br>
(as kind of to be expected, as then there are only 3 variants, whereas<br>
with 9 months it would be 4 of them).<br>
<br>
Just to clarify, personally I&#39;m fine with 9 months or even longer, but<=
br>
it seemed to me that we had settled on 8.<br>
<br>
Jan<br>
</blockquote></div>

--0000000000003e5d800610187af0--

