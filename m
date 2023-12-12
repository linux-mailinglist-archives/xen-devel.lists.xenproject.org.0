Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73BF80E778
	for <lists+xen-devel@lfdr.de>; Tue, 12 Dec 2023 10:23:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.652769.1018791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCyyb-0006k5-Pt; Tue, 12 Dec 2023 09:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 652769.1018791; Tue, 12 Dec 2023 09:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rCyyb-0006hG-NE; Tue, 12 Dec 2023 09:22:53 +0000
Received: by outflank-mailman (input) for mailman id 652769;
 Tue, 12 Dec 2023 09:22:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=akbp=HX=cloud.com=kelly.choi@srs-se1.protection.inumbo.net>)
 id 1rCyyZ-0006h9-EV
 for xen-devel@lists.xenproject.org; Tue, 12 Dec 2023 09:22:51 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 05686b90-98d0-11ee-98e8-6d05b1d4d9a1;
 Tue, 12 Dec 2023 10:22:50 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9fa45e75ed9so613748666b.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 Dec 2023 01:22:50 -0800 (PST)
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
X-Inumbo-ID: 05686b90-98d0-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1702372970; x=1702977770; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CDscdFVnuNGU2uiHAJ42BphMIFDRjjoXFRIPAkkmiYo=;
        b=ZmacomayAuLNMaqXPBFEY8tq84p8J75UooqU38UwG//MdbrMSKePC3vkrYCaH+ikla
         U63UMm9WxtOFmEW83sFLddU/VRr0HOP6VSBLUBgHRIAHZS9JAqGc5zHFssZEg1G/msfL
         ULjz5QSWj3f4vhFCxuiYkGN2jDg5hmwJis6DY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702372970; x=1702977770;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CDscdFVnuNGU2uiHAJ42BphMIFDRjjoXFRIPAkkmiYo=;
        b=kqM3Te/8xgfFip3TBDARp8i2vL1tnzN8Qyez8bKoD825leNbLcHiCghQ7T3nMGUJ9V
         9bpsi2Bo7/bOW+zMwW+UI5ay8cWWHuQNkZYBefkjbuSad5TTZba1Svhpsfl2QqQQoZVM
         VXgSpojvx/I4xprUtagvrQWFohKVaDQNLkSnDfEox3mDq+dPGRk+HAdHnOYATBoDHQL8
         7/zthZFnCmJchqJismivuyGY5rAWflCJIz3HoI1zCyBxba6JRKVZdrSTotEtILNYMQKx
         FeOi4nhWvXdCHbuFz3VEkT+7m4GSIJW4qU1r8bO25uPPmWt7t+5gtTodN+xh/3ePOtEv
         GC5A==
X-Gm-Message-State: AOJu0Yz8C/T5LqXszC8qM2sdNfyQzSPhcjmcF18LM99BN+uvndSI1TWt
	KD3/P78YvZTikYg2akT4gv5JepdudXPItQZ8i3oineIwX2THoscEwqs=
X-Google-Smtp-Source: AGHT+IGiXxAtVNOpZixVaJyH0pxbs41lxzKQ5lUcxUvW015bLXyVS2AF4NIF8kjassr/UgMiDEBi7EOnOtsKS7tQYV0=
X-Received: by 2002:a17:906:d6:b0:a1f:aca1:6bc with SMTP id
 22-20020a17090600d600b00a1faca106bcmr1367334eji.100.1702372970213; Tue, 12
 Dec 2023 01:22:50 -0800 (PST)
MIME-Version: 1.0
References: <CAO-mL=x3DntLhoKuaiWYjVqkQRqj=rdyZWmuH1aDjkmUbQchyA@mail.gmail.com>
 <alpine.DEB.2.22.394.2311301426210.110490@ubuntu-linux-20-04-desktop>
 <CA+zSX=ZJETPgXut62Y5RQyB8Q6Ruwqd656+iW+ark6WOXYEf+w@mail.gmail.com> <2e5395e6214a08056f112c46fdfab3eaa6f8dd45.camel@infradead.org>
In-Reply-To: <2e5395e6214a08056f112c46fdfab3eaa6f8dd45.camel@infradead.org>
From: Kelly Choi <kelly.choi@cloud.com>
Date: Tue, 12 Dec 2023 09:22:14 +0000
Message-ID: <CAO-mL=y3BXj7wSrgqQCoDrv_=8+xVgWxJ3v+XVqcyPveoOb6Wg@mail.gmail.com>
Subject: Re: INFORMAL VOTE REQUIRED - DOCUMENTATION WORDING
To: David Woodhouse <dwmw2@infradead.org>
Cc: George Dunlap <george.dunlap@cloud.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	xen-devel@lists.xenproject.org, committers@xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000002a5141060c4c98c1"

--0000000000002a5141060c4c98c1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

I appreciate your concerns, and I agree that the community like any other
open source project has room for improvement.
It's great to hear that you want to contribute and we're trying to make
this easier for all within the project. As such, we are in the process of
setting up a TAB to help address these concerns and minimise bikeshedding
where possible. I hope that once we have a full TAB, problems such as these
will be quickly resolved so that everyone can move forward. Please rest
assured that this is a top priority but will take some time to set up, as
with any other major change.

I will be speaking to the conduct team this week to fast-track this
process, and as soon as I have details to share I will let everyone know.
It's important to note that we are continuously making improvements to help
Xen become healthy, such as refreshing governance policies and implementing
informal voting procedures. These are just a snippet of a few initiatives
being run in the community and I would like to ask that you give the
community a chance to show the incremental progress we are making.

Many thanks,
Kelly Choi

Community Manager
Xen Project


On Mon, Dec 11, 2023 at 5:12=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:

> On Fri, 2023-12-01 at 10:27 +0000, George Dunlap wrote:
> >
> > FWIW I think a "five-point survey" would probably have been somewhat
> better:
> >
> > Regarding the review insisting that the word "broken" be removed from
> > the updated documentation to the old hypercall:
>
> (=E2=9C=94) I think this sort of enforcement is unreasonable and is harmi=
ng the
> community
>
> Honestly, this latest example just epitomises the reason I've dedicated
> the last two years of my life to hosting Xen guests on something
> *other* than Xen itself.
>
> I *want* to contribute, to help make Xen better. We have code we'd love
> to give back. I'd love to see Xen upstream supporting live update and
> guest transparent live migration (oops, even that term got gratuitously
> bikeshedded, didn't it?)
>
> But I cannot, and will not, subject my engineers to this.
>
> I've even got long-time Xen contributors on my team saying that they're
> done with it. I certainly can't ask junior engineers to operate in this
> environment.
>
> I don't say this to be combative. I genuinely want the Xen community to
> improve and to become as welcoming and productive as it can be.
>
> Perhaps we do need a TAB to help keep things working smoothly, and help
> stamp out the problematic behaviour? This isn't healthy.
>

--0000000000002a5141060c4c98c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi David,<div><br></div><div>I appreciate your concerns, a=
nd I agree that the community like=C2=A0any other open source project has r=
oom for=C2=A0improvement.=C2=A0</div><div>It&#39;s great to hear that you w=
ant to contribute and we&#39;re trying to make this easier for all within t=
he project. As such, we are in the process of setting up a TAB to help addr=
ess these concerns and minimise bikeshedding where possible. I hope that on=
ce we have a full TAB, problems such as these will be quickly resolved so t=
hat everyone can move forward. Please rest assured that this is a top prior=
ity but will take some time to set up,=C2=A0as with any other major change.=
=C2=A0</div><div><br></div><div>I will be speaking to the conduct team this=
 week to fast-track this process, and as soon as I have details to share I =
will let everyone know.=C2=A0</div><div>It&#39;s important to note that we =
are continuously making improvements to help Xen become healthy, such as re=
freshing governance policies and implementing informal voting procedures. T=
hese are just a snippet of a few initiatives being run in the community and=
 I would like to ask that you=C2=A0give the community a chance to show the =
incremental progress we are making.=C2=A0=C2=A0</div><div><br></div><div><d=
iv><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signa=
ture"><div dir=3D"ltr"><div>Many thanks,</div><div>Kelly Choi</div><div><br=
></div><div><div style=3D"color:rgb(136,136,136)">Community Manager</div><d=
iv style=3D"color:rgb(136,136,136)">Xen Project=C2=A0<br></div></div></div>=
</div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Mon, Dec 11, 2023 at 5:12=E2=80=AFPM David Woodhou=
se &lt;<a href=3D"mailto:dwmw2@infradead.org">dwmw2@infradead.org</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri, 20=
23-12-01 at 10:27 +0000, George Dunlap wrote:<br>
&gt; <br>
&gt; FWIW I think a &quot;five-point survey&quot; would probably have been =
somewhat better:<br>
&gt; <br>
&gt; Regarding the review insisting that the word &quot;broken&quot; be rem=
oved from<br>
&gt; the updated documentation to the old hypercall:<br>
<br>
(=E2=9C=94) I think this sort of enforcement is unreasonable and is harming=
 the<br>
community<br>
<br>
Honestly, this latest example just epitomises the reason I&#39;ve dedicated=
<br>
the last two years of my life to hosting Xen guests on something<br>
*other* than Xen itself.<br>
<br>
I *want* to contribute, to help make Xen better. We have code we&#39;d love=
<br>
to give back. I&#39;d love to see Xen upstream supporting live update and<b=
r>
guest transparent live migration (oops, even that term got gratuitously<br>
bikeshedded, didn&#39;t it?)<br>
<br>
But I cannot, and will not, subject my engineers to this.<br>
<br>
I&#39;ve even got long-time Xen contributors on my team saying that they&#3=
9;re<br>
done with it. I certainly can&#39;t ask junior engineers to operate in this=
<br>
environment.<br>
<br>
I don&#39;t say this to be combative. I genuinely want the Xen community to=
<br>
improve and to become as welcoming and productive as it can be.<br>
<br>
Perhaps we do need a TAB to help keep things working smoothly, and help<br>
stamp out the problematic behaviour? This isn&#39;t healthy.<br>
</blockquote></div>

--0000000000002a5141060c4c98c1--

