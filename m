Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF53A8C67AD
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:45:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722371.1126252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Ewk-0005cT-Ir; Wed, 15 May 2024 13:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722371.1126252; Wed, 15 May 2024 13:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Ewk-0005au-Fh; Wed, 15 May 2024 13:45:30 +0000
Received: by outflank-mailman (input) for mailman id 722371;
 Wed, 15 May 2024 13:45:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ly6O=MS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7Ewi-0005ZN-Ax
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:45:28 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62f28f27-12c1-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 15:45:27 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so1668659a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:45:27 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574f6b8b9d7sm1179292a12.82.2024.05.15.06.45.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 06:45:25 -0700 (PDT)
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
X-Inumbo-ID: 62f28f27-12c1-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715780726; x=1716385526; darn=lists.xenproject.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y67gsmKBYcde4btQwZ+FO2JNODx48qfwNGD5Nx/qsAw=;
        b=YBwgEHNyzSH6wTL61tttRSkpKOL+CYTFzLeRYw4CTLCaVJmAQRp7s2gfzewd3RF4Bw
         XbTU96TP7m6OO7dQed2icMbV2mQj9jU/HlxmbazX9oytAGhmAGjNiAP4Fbl4fP6frjtW
         +f+I+4ZHW146phlCF1lyYaADMiujSoZ9dnkiIqqjW6RLYhyeZyFQnDzKcqYGlKikO5iw
         uASRcONTdTBj/Gomi4wJFWP2/JaVPZ60NTBjWaN0DC3ehcfptSdypGbJzN6xfc4Fwgiz
         02cuy6w5I8D5S1vyizScuTo05mYXYx8mvPRUh87YfIr/hvGyq28TvND04mFWvgMjmF7D
         XjIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715780726; x=1716385526;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y67gsmKBYcde4btQwZ+FO2JNODx48qfwNGD5Nx/qsAw=;
        b=Eab8xHeu0BPpeUPoenW1cmzAd2++kCVdx4WZ3Un6btLqsyTeiaQS187ttvGD6qeUur
         NR/aO/qx1SxUv56gRGhX96Z02PKpcv7GoiMpfh9dnzXuae/jXfpMKjRPdXSx5IwFSOrU
         b+6Vp/HIznC62n+8MAqDTjIADpTbSUYde0+FghuFoPW0lC1x67LyBII3Z/aS5hUraE1r
         Fmqk71mL3a0/au9+TXPX8a7dssAw01mbje938326xlTnAMkaiTHRohqPPLuBCVjcFCmu
         E6cryYhnpA+9QkFbkbCdV73jqCdHEe9aVwgFYfmRdrmWVaAM0QrOmcuteK/DMsy76SCp
         QVlQ==
X-Gm-Message-State: AOJu0YwSTknWOcpbYeERklnzE4fWtN92vMA7my2GErRWrywseRedW0Cv
	WTM/87Y07dAXPpW4wNswNxUtwcaRmTz8dyzCjKWv/VSk2CXJP9ES
X-Google-Smtp-Source: AGHT+IHEvTO9Mp+c3PNHe5Ig08X3Pq1tWxbWS4/XISTL0dj0ozo76nzrVrwkgW/OaKEK5zhrySZ6Lg==
X-Received: by 2002:a50:c358:0:b0:574:ebfb:6d97 with SMTP id 4fb4d7f45d1cf-574ebfb6e33mr2657636a12.36.1715780726070;
        Wed, 15 May 2024 06:45:26 -0700 (PDT)
Message-ID: <b07f608f1ede847bfc4ac4d75ad7d3e97bca67d0.camel@gmail.com>
Subject: Re: Proposal to Extend Feature Freeze Deadline
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Kelly Choi <kelly.choi@cloud.com>, Henry Wang <xin.wang2@amd.com>
Cc: xen-devel@lists.xenproject.org, committers@xenproject.org, Andrew Cooper
	 <andrew.cooper3@citrix.com>
Date: Wed, 15 May 2024 15:45:24 +0200
In-Reply-To: <CAO-mL=x0=oyOY_ZVcECz2ZrVf8Mtz7pYk8XXWfjM2Ww08W=jbA@mail.gmail.com>
References: <a72f75b9edc4255761ff676d6a09a966290a24df.camel@gmail.com>
	 <bba91b8b-b1cc-4054-96e8-80a63a3b808a@citrix.com>
	 <32f16048-c1ba-4ebb-a752-a77ed529a99c@amd.com>
	 <CAO-mL=x0=oyOY_ZVcECz2ZrVf8Mtz7pYk8XXWfjM2Ww08W=jbA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="=-xZCGicTfQJQ2gos0fqvV"
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

--=-xZCGicTfQJQ2gos0fqvV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kelly,

On Wed, 2024-05-15 at 14:27 +0100, Kelly Choi wrote:
> Hi Oleksii,
>=20
> If there are no objections by tomorrow, let's assume by lazy
> consensus=C2=A0that we will extend the timeline by a week.=C2=A0
> If anyone=C2=A0objects to this, please reply to this=C2=A0email.
I will send a separate email tomorrow if no one objects.

~ Oleksii
>=20
> Many thanks,
> Kelly Choi
>=20
> Community Manager
> Xen Project=C2=A0
>=20
>=20
> On Wed, May 15, 2024 at 4:13=E2=80=AFAM Henry Wang <xin.wang2@amd.com> wr=
ote:
> > Hi Oleksii,
> >=20
> > On 5/14/2024 11:43 PM, Andrew Cooper wrote:
> > > On 14/05/2024 4:40 pm, Oleksii K. wrote:
> > >> Hello everyone,
> > >>
> > >> We're observing fewer merged patches/series across several
> > >> architectures for the current 4.19 release in comparison to
> > previous
> > >> release.
> > >>
> > >> For example:
> > >> 1. For Arm, significant features like Cache Coloring and PCI
> > >> Passthrough won't be fully merged. Thus, it would be beneficial
> > to
> > >> commit at least the following two patch series:
> > >>
> > [1]https://lore.kernel.org/xen-devel/20240511005611.83125-1-xin.wang2@a=
md.com/
> > >>=C2=A0 =C2=A0=20
> > >>
> > [2]https://lore.kernel.org/xen-devel/20240424033449.168398-1-xin.wang2@=
amd.com/
> > >>
> > >> 2. For RISC-V, having the following patch series [3], mostly
> > reviewed
> > >> with only one blocker [4], would be advantageous (As far as I
> > know,
> > >> Andrew is planning to update his patch series):
> > >>
> > [3]https://lore.kernel.org/xen-devel/cover.1713347222.git.oleksii.kuroc=
hko@gmail.com/
> > >> [4]
> > >>
> > https://patchew.org/Xen/20240313172716.2325427-1-andrew.cooper3@citrix.=
com/
> > >>
> > >> 3. For PPC, it would be beneficial to have [5] merged:
> > >> [5]
> > >>
> > https://lore.kernel.org/xen-devel/cover.1712893887.git.sanastasio@rapto=
rengineering.com/
> > >>
> > >> Extending the feature freeze deadline by one week, until May
> > 24th,
> > >> would provide additional time for merges mentioned above. This,
> > in
> > >> turn, would create space for more features and fixes for x86 and
> > other
> > >> common elements. If we agree to extend the feature freeze
> > deadline,
> > >> please feel free to outline what you would like to see in the
> > 4.19
> > >> release. This will make it easier to track our final goals and
> > >> determine if they are realistically achievable.
> > >>
> > >> I'd like to open the floor for discussion on this proposal. Does
> > it
> > >> make sense, and would it be useful?
> > > Considering how many people are blocked on me, I'd welcome a
> > little bit
> > > longer to get the outstanding series/fixes to land.
> >=20
> > It would be great if we can extend the deadline for a week, thank
> > you! I=20
> > will try my best to make progress of the two above-mentioned Arm
> > series.
> >=20
> > Kind regards,
> > Henry


--=-xZCGicTfQJQ2gos0fqvV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head><body><div>Hi Kelly,</div><div><br></div><div>On Wed, 2024-0=
5-15 at 14:27 +0100, Kelly Choi wrote:</div><blockquote type=3D"cite" style=
=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div=
 dir=3D"ltr">Hi Oleksii,<div><br></div><div>If there are no objections by t=
omorrow, let's assume by lazy consensus&nbsp;that we will extend the timeli=
ne by a week.&nbsp;</div><div>If anyone&nbsp;objects to this, please reply =
to this&nbsp;email.</div></div></blockquote><div>I will send a separate ema=
il tomorrow if no one objects.</div><div><br></div><div>~ Oleksii</div><blo=
ckquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf s=
olid;padding-left:1ex"><div dir=3D"ltr"><div><br clear=3D"all"><div><div di=
r=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br></div><di=
v><div style=3D"color:rgb(136,136,136)">Community Manager</div><div style=
=3D"color:rgb(136,136,136)">Xen Project&nbsp;<br></div></div></div></div></=
div><br></div></div><div><br></div><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, May 15, 2024 at 4:13=E2=80=AFAM Henry Wang=
 &lt;<a href=3D"mailto:xin.wang2@amd.com">xin.wang2@amd.com</a>&gt; wrote:<=
br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:=
2px #729fcf solid;padding-left:1ex"><div>Hi Oleksii,<br></div><div><br>On 5=
/14/2024 11:43 PM, Andrew Cooper wrote:<br>&gt; On 14/05/2024 4:40 pm, Olek=
sii K. wrote:<br>&gt;&gt; Hello everyone,<br>&gt;&gt;<br>&gt;&gt; We're obs=
erving fewer merged patches/series across several<br>&gt;&gt; architectures=
 for the current 4.19 release in comparison to previous<br>&gt;&gt; release=
.<br>&gt;&gt;<br>&gt;&gt; For example:<br>&gt;&gt; 1. For Arm, significant =
features like Cache Coloring and PCI<br>&gt;&gt; Passthrough won't be fully=
 merged. Thus, it would be beneficial to<br>&gt;&gt; commit at least the fo=
llowing two patch series:<br>&gt;&gt; [1]<a href=3D"https://lore.kernel.org=
/xen-devel/20240511005611.83125-1-xin.wang2@amd.com/" rel=3D"noreferrer" ta=
rget=3D"_blank">https://lore.kernel.org/xen-devel/20240511005611.83125-1-xi=
n.wang2@amd.com/</a><br>&gt;&gt;&nbsp; &nbsp; <br>&gt;&gt; [2]<a href=3D"ht=
tps://lore.kernel.org/xen-devel/20240424033449.168398-1-xin.wang2@amd.com/"=
 rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/xen-devel/202=
40424033449.168398-1-xin.wang2@amd.com/</a><br>&gt;&gt;<br>&gt;&gt; 2. For =
RISC-V, having the following patch series [3], mostly reviewed<br>&gt;&gt; =
with only one blocker [4], would be advantageous (As far as I know,<br>&gt;=
&gt; Andrew is planning to update his patch series):<br>&gt;&gt; [3]<a href=
=3D"https://lore.kernel.org/xen-devel/cover.1713347222.git.oleksii.kurochko=
@gmail.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.kernel.org/x=
en-devel/cover.1713347222.git.oleksii.kurochko@gmail.com/</a><br>&gt;&gt; [=
4]<br>&gt;&gt; <a href=3D"https://patchew.org/Xen/20240313172716.2325427-1-=
andrew.cooper3@citrix.com/" rel=3D"noreferrer" target=3D"_blank">https://pa=
tchew.org/Xen/20240313172716.2325427-1-andrew.cooper3@citrix.com/</a><br>&g=
t;&gt;<br>&gt;&gt; 3. For PPC, it would be beneficial to have [5] merged:<b=
r>&gt;&gt; [5]<br>&gt;&gt; <a href=3D"https://lore.kernel.org/xen-devel/cov=
er.1712893887.git.sanastasio@raptorengineering.com/" rel=3D"noreferrer" tar=
get=3D"_blank">https://lore.kernel.org/xen-devel/cover.1712893887.git.sanas=
tasio@raptorengineering.com/</a><br>&gt;&gt;<br>&gt;&gt; Extending the feat=
ure freeze deadline by one week, until May 24th,<br>&gt;&gt; would provide =
additional time for merges mentioned above. This, in<br>&gt;&gt; turn, woul=
d create space for more features and fixes for x86 and other<br>&gt;&gt; co=
mmon elements. If we agree to extend the feature freeze deadline,<br>&gt;&g=
t; please feel free to outline what you would like to see in the 4.19<br>&g=
t;&gt; release. This will make it easier to track our final goals and<br>&g=
t;&gt; determine if they are realistically achievable.<br>&gt;&gt;<br>&gt;&=
gt; I'd like to open the floor for discussion on this proposal. Does it<br>=
&gt;&gt; make sense, and would it be useful?<br>&gt; Considering how many p=
eople are blocked on me, I'd welcome a little bit<br>&gt; longer to get the=
 outstanding series/fixes to land.<br></div><div><br>It would be great if w=
e can extend the deadline for a week, thank you! I <br>will try my best to =
make progress of the two above-mentioned Arm series.<br></div><div><br>Kind=
 regards,<br>Henry<br></div></blockquote></div></blockquote><div><br></div>=
<div><span></span></div></body></html>

--=-xZCGicTfQJQ2gos0fqvV--

