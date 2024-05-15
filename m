Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9678C6760
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:28:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722352.1126202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Eg5-0007rm-AP; Wed, 15 May 2024 13:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722352.1126202; Wed, 15 May 2024 13:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Eg5-0007pB-7a; Wed, 15 May 2024 13:28:17 +0000
Received: by outflank-mailman (input) for mailman id 722352;
 Wed, 15 May 2024 13:28:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=733o=MS=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1s7Eg3-0007p5-8s
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:28:15 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb279952-12be-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 15:28:14 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso1956875a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:28:14 -0700 (PDT)
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
X-Inumbo-ID: fb279952-12be-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715779693; x=1716384493; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=o2yFgV5wbekf3+V9EnlkTrKV7kIXvg0Qz2m+9CZK1zc=;
        b=KwjdA1qpfoBu3xRrqUvPjwN2k4PEMsJPvQ8LFjtuKCopXpZ8oUKT5JmjyaIlRWO1jB
         W0IhC4cqw1JY+Fgi9lgilnxvJ9SA/AVCFfNnDV8ARRbMPwO3XMPlJdFaLf+saqaGUWwb
         3Z+2/eIKnRR1m1Vt92unYoT8hTWOPaqzf5kYE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715779693; x=1716384493;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2yFgV5wbekf3+V9EnlkTrKV7kIXvg0Qz2m+9CZK1zc=;
        b=Zzu1pQ8glXfkBDOfxHOGYilmeMihEeN96noHjF7ebMlG/lkPBQX69m6I9TNQpFDXKW
         th2aSx3vUHMHB0c8HYa3nWMQe0WIU4h32fk/4N09ertBx2KwgtSdBmCtIuGL0brTfqx2
         zH2a9JxFbSl00OgK0mVnl+N8hmQ6GhvnT72FNUF7mSCNe7PK7W9aiirQNoIwq//x8N93
         7uav9O4xipQrB7QB+mD8qY0Y/t2udZbCf2Fo/1qarDFWwhqYKbjFsVs/SY1R5uQ958dp
         QphYzglHLmX6i6/x5YfwxSTtGrd4sQK5olvU+QS5jojVWvodfKvDA85uqUggat0iKvYI
         anww==
X-Forwarded-Encrypted: i=1; AJvYcCUOuuiM6DHVwmKDkcE0nQBReUF6NWaTCvbCmsY5J3efI2ulLFXMb+xS5PyW/pavP8XctLTxlFZWX0nwbPLGB5Fyf7MnLhViLVqeVcQyVpY=
X-Gm-Message-State: AOJu0Yy5DaEUEQNGy8ueQenWT69EbvZr9W3kBF03CPDZbAidtwztcrmB
	Kc0seGLCmDZjeN3ocuBf5BSSofW+UAHxJhp6m6q8pBX1h3psJXmleI9wZjmGc8XQow1zSHkcelC
	1upiv3XDES3vtbZ6bh81rFjyhExM2MLVT9nFBHg==
X-Google-Smtp-Source: AGHT+IEIf2sUaKa4QiGoA8ai9I+590BRFLEmJMLzXLk6bwOEZ5PUhFwasICKPOn86nchDbr/pfD7thrwOZkCR5RkgOE=
X-Received: by 2002:a17:906:2b48:b0:a59:c9ce:338b with SMTP id
 a640c23a62f3a-a5a2d5f1479mr1162978166b.35.1715779693256; Wed, 15 May 2024
 06:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <a72f75b9edc4255761ff676d6a09a966290a24df.camel@gmail.com>
 <bba91b8b-b1cc-4054-96e8-80a63a3b808a@citrix.com> <32f16048-c1ba-4ebb-a752-a77ed529a99c@amd.com>
In-Reply-To: <32f16048-c1ba-4ebb-a752-a77ed529a99c@amd.com>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Wed, 15 May 2024 14:27:37 +0100
Message-ID: <CAO-mL=x0=oyOY_ZVcECz2ZrVf8Mtz7pYk8XXWfjM2Ww08W=jbA@mail.gmail.com>
Subject: Re: Proposal to Extend Feature Freeze Deadline
To: Henry Wang <xin.wang2@amd.com>
Cc: "Oleksii K." <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org, 
	committers@xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000002150db06187e179a"

--0000000000002150db06187e179a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksii,

If there are no objections by tomorrow, let's assume by lazy consensus that
we will extend the timeline by a week.
If anyone objects to this, please reply to this email.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Wed, May 15, 2024 at 4:13=E2=80=AFAM Henry Wang <xin.wang2@amd.com> wrot=
e:

> Hi Oleksii,
>
> On 5/14/2024 11:43 PM, Andrew Cooper wrote:
> > On 14/05/2024 4:40 pm, Oleksii K. wrote:
> >> Hello everyone,
> >>
> >> We're observing fewer merged patches/series across several
> >> architectures for the current 4.19 release in comparison to previous
> >> release.
> >>
> >> For example:
> >> 1. For Arm, significant features like Cache Coloring and PCI
> >> Passthrough won't be fully merged. Thus, it would be beneficial to
> >> commit at least the following two patch series:
> >> [1]
> https://lore.kernel.org/xen-devel/20240511005611.83125-1-xin.wang2@amd.co=
m/
> >>
> >> [2]
> https://lore.kernel.org/xen-devel/20240424033449.168398-1-xin.wang2@amd.c=
om/
> >>
> >> 2. For RISC-V, having the following patch series [3], mostly reviewed
> >> with only one blocker [4], would be advantageous (As far as I know,
> >> Andrew is planning to update his patch series):
> >> [3]
> https://lore.kernel.org/xen-devel/cover.1713347222.git.oleksii.kurochko@g=
mail.com/
> >> [4]
> >>
> https://patchew.org/Xen/20240313172716.2325427-1-andrew.cooper3@citrix.co=
m/
> >>
> >> 3. For PPC, it would be beneficial to have [5] merged:
> >> [5]
> >>
> https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptore=
ngineering.com/
> >>
> >> Extending the feature freeze deadline by one week, until May 24th,
> >> would provide additional time for merges mentioned above. This, in
> >> turn, would create space for more features and fixes for x86 and other
> >> common elements. If we agree to extend the feature freeze deadline,
> >> please feel free to outline what you would like to see in the 4.19
> >> release. This will make it easier to track our final goals and
> >> determine if they are realistically achievable.
> >>
> >> I'd like to open the floor for discussion on this proposal. Does it
> >> make sense, and would it be useful?
> > Considering how many people are blocked on me, I'd welcome a little bit
> > longer to get the outstanding series/fixes to land.
>
> It would be great if we can extend the deadline for a week, thank you! I
> will try my best to make progress of the two above-mentioned Arm series.
>
> Kind regards,
> Henry
>

--0000000000002150db06187e179a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Oleksii,<div><br></div><div>If there are no objections =
by tomorrow, let&#39;s assume by lazy consensus=C2=A0that we will extend th=
e timeline by a week.=C2=A0</div><div>If anyone=C2=A0objects to this, pleas=
e reply to this=C2=A0email.</div><div><br clear=3D"all"><div><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><div><div =
style=3D"color:rgb(136,136,136)">Community Manager</div><div style=3D"color=
:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div></div></div><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, May 15, 2024 at 4:13=E2=80=AFAM Henry Wang &lt;<a href=3D"mail=
to:xin.wang2@amd.com">xin.wang2@amd.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">Hi Oleksii,<br>
<br>
On 5/14/2024 11:43 PM, Andrew Cooper wrote:<br>
&gt; On 14/05/2024 4:40 pm, Oleksii K. wrote:<br>
&gt;&gt; Hello everyone,<br>
&gt;&gt;<br>
&gt;&gt; We&#39;re observing fewer merged patches/series across several<br>
&gt;&gt; architectures for the current 4.19 release in comparison to previo=
us<br>
&gt;&gt; release.<br>
&gt;&gt;<br>
&gt;&gt; For example:<br>
&gt;&gt; 1. For Arm, significant features like Cache Coloring and PCI<br>
&gt;&gt; Passthrough won&#39;t be fully merged. Thus, it would be beneficia=
l to<br>
&gt;&gt; commit at least the following two patch series:<br>
&gt;&gt; [1]<a href=3D"https://lore.kernel.org/xen-devel/20240511005611.831=
25-1-xin.wang2@amd.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.=
kernel.org/xen-devel/20240511005611.83125-1-xin.wang2@amd.com/</a><br>
&gt;&gt;=C2=A0 =C2=A0 <br>
&gt;&gt; [2]<a href=3D"https://lore.kernel.org/xen-devel/20240424033449.168=
398-1-xin.wang2@amd.com/" rel=3D"noreferrer" target=3D"_blank">https://lore=
.kernel.org/xen-devel/20240424033449.168398-1-xin.wang2@amd.com/</a><br>
&gt;&gt;<br>
&gt;&gt; 2. For RISC-V, having the following patch series [3], mostly revie=
wed<br>
&gt;&gt; with only one blocker [4], would be advantageous (As far as I know=
,<br>
&gt;&gt; Andrew is planning to update his patch series):<br>
&gt;&gt; [3]<a href=3D"https://lore.kernel.org/xen-devel/cover.1713347222.g=
it.oleksii.kurochko@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https:=
//lore.kernel.org/xen-devel/cover.1713347222.git.oleksii.kurochko@gmail.com=
/</a><br>
&gt;&gt; [4]<br>
&gt;&gt; <a href=3D"https://patchew.org/Xen/20240313172716.2325427-1-andrew=
.cooper3@citrix.com/" rel=3D"noreferrer" target=3D"_blank">https://patchew.=
org/Xen/20240313172716.2325427-1-andrew.cooper3@citrix.com/</a><br>
&gt;&gt;<br>
&gt;&gt; 3. For PPC, it would be beneficial to have [5] merged:<br>
&gt;&gt; [5]<br>
&gt;&gt; <a href=3D"https://lore.kernel.org/xen-devel/cover.1712893887.git.=
sanastasio@raptorengineering.com/" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@raptorengine=
ering.com/</a><br>
&gt;&gt;<br>
&gt;&gt; Extending the feature freeze deadline by one week, until May 24th,=
<br>
&gt;&gt; would provide additional time for merges mentioned above. This, in=
<br>
&gt;&gt; turn, would create space for more features and fixes for x86 and o=
ther<br>
&gt;&gt; common elements. If we agree to extend the feature freeze deadline=
,<br>
&gt;&gt; please feel free to outline what you would like to see in the 4.19=
<br>
&gt;&gt; release. This will make it easier to track our final goals and<br>
&gt;&gt; determine if they are realistically achievable.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;d like to open the floor for discussion on this proposal. Do=
es it<br>
&gt;&gt; make sense, and would it be useful?<br>
&gt; Considering how many people are blocked on me, I&#39;d welcome a littl=
e bit<br>
&gt; longer to get the outstanding series/fixes to land.<br>
<br>
It would be great if we can extend the deadline for a week, thank you! I <b=
r>
will try my best to make progress of the two above-mentioned Arm series.<br=
>
<br>
Kind regards,<br>
Henry<br>
</blockquote></div>

--0000000000002150db06187e179a--

