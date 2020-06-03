Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191AC1ED496
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 18:56:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgWgz-0003Mq-1E; Wed, 03 Jun 2020 16:56:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azRW=7Q=gmail.com=hydrapolic@srs-us1.protection.inumbo.net>)
 id 1jgWgx-0003Ml-9R
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 16:56:39 +0000
X-Inumbo-ID: 2dcbdb9c-a5bb-11ea-81bc-bc764e2007e4
Received: from mail-qk1-x736.google.com (unknown [2607:f8b0:4864:20::736])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2dcbdb9c-a5bb-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 16:56:33 +0000 (UTC)
Received: by mail-qk1-x736.google.com with SMTP id w1so2864338qkw.5;
 Wed, 03 Jun 2020 09:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lC+LcmDTqWh6iLD+2pjOV/lv74IVE5D+i7ERR9trLK8=;
 b=bddfWtgFvJwv9TfQtWQi1eI7fC8hIU20r42V3p/APxe332Yv8CABJZ5GPKsgH3Hyg9
 3GxnH7r4CZz4Fm5EgvwyFaQV5nqKIl/+lIxt0WHVHszSIlEUgsSGgrN2EKdO22WAv8KX
 kZx2e4ZkJO2CnX9R7hAd2ijZZ+3yGKJcy1P/XQlxlUtl3cLPkq5JcVHiFxuAX/NUEFGm
 GYlZUXS2eWnTRsA7c5AKLePKpv8Xdb/MIGbnXyoEIMUJ08vq3fsnWOi+j76nwmww3fSF
 WLwXPYeVR0Ce4B1bBziymocgrv+lOpdxAY63vqPgSP6OBhF5ps5CdmF3xGGzYXbLJXUh
 jCjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lC+LcmDTqWh6iLD+2pjOV/lv74IVE5D+i7ERR9trLK8=;
 b=qGeg2aUYtJO8iVY4VqsduobZIc5/tlh1C9yognLLM+3lw1adj9gGH/uNiBQU4ljYSd
 CvqyGkjNgkQ5obo4SBGSMrMrx5nS0e+SjTvZyNitOT51HEkYTkHYFN1bQX+GZCOoEMG8
 vB9rUjt1rSomxpZB700DIFMxjTnW8tWIz+qo4dMMNBSiqFyjoMCZgHzcHc/kgg6J7Qc1
 bHx0WXf7auG5oOL6TxWTHTfcy71Yepo7GO13kOMCEZoYJXYV+YrVb/Q4eCUVX4gNXVRF
 43p3Dk2p++mpwRIE4QdC6y2fS55ELPWKNiQKrgnt02JeHNZkLPcWIllfvcE2ilANOlG+
 QpYQ==
X-Gm-Message-State: AOAM531kNAcEV6tx0xi2g+/0AwHJeMDVLFCHijVtn7viCOraslCoLaz9
 hKqR1tybW5wb7DBRB2UqKtTCWJwKa9abX2tRtnk=
X-Google-Smtp-Source: ABdhPJxBMhu1IsrZsNhB0Ndr9iYzrI6ZmDyp1Dxt2IccgmEBTVIWdtgGHS+pkyh8YBCZ36HD62oiLGBokF9RGO4sK1o=
X-Received: by 2002:a05:620a:210e:: with SMTP id
 l14mr549263qkl.242.1591203392929; 
 Wed, 03 Jun 2020 09:56:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAG6MAzRcvUifqf=m7EE98bz0w_s2+Z=0Nx7YT0SVv75ek0Mc2Q@mail.gmail.com>
 <CAG6MAzR_bU5qnCLKpuUAt-S_dfxjnxgh12gUjnXfsfC7Fw2qMw@mail.gmail.com>
 <CAG6MAzSS0Kw2KHWZpb6O9kfoDKK2spn_WHfy9gnZcZLvES0wnQ@mail.gmail.com>
 <CAG6MAzRZsSaVdO6Qv+Xi1dpaUsrdh+kT9F-_K=8s7fHyXRbFWQ@mail.gmail.com>
 <CAAVVsFmwoopngy6U8z1vUBH5j0gzuTLcMX+NcjQRjwshNr_LDw@mail.gmail.com>
 <CAG6MAzQ4QQjre7o5iLN5gX9=mRkJzy_pDM+aRgXi999yfp0srg@mail.gmail.com>
 <CAG6MAzQfX13KuaWtmJb_3Srdt5FTV+nvKmnNVXq5j8QF44NhTw@mail.gmail.com>
 <CAAVVsFmExExdwkokB1i9=KwT8k=eHABQZruYiA9Yr2MJ7ibyWA@mail.gmail.com>
In-Reply-To: <CAAVVsFmExExdwkokB1i9=KwT8k=eHABQZruYiA9Yr2MJ7ibyWA@mail.gmail.com>
From: Tomas Mozes <hydrapolic@gmail.com>
Date: Wed, 3 Jun 2020 18:56:21 +0200
Message-ID: <CAG6MAzRG-9r-nVr9W03UzzCN0kFoQ92AvG761xD1VByPvKtTNQ@mail.gmail.com>
Subject: Re: [Xen-users] xen domU stall on 4.12.1
To: Glen <glenbarney@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000000494a05a730e992"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000000494a05a730e992
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 3, 2020 at 5:30 PM Glen <glenbarney@gmail.com> wrote:

> Tomas -
>
> On Tue, Jun 2, 2020 at 7:43 PM Tomas Mozes <hydrapolic@gmail.com> wrote:
> >> On Mon, Feb 24, 2020 at 4:55 PM Glen <glenbarney@gmail.com> wrote:
> >>> I'm now going to bring one of the previously-live guests on its own
> >>> host back to credit2 so I can crash it and try to capture debugging
> >>> output for xen-devel as requested.  But sched=credit is definitely
> >>> what we needed to solve this problem!  Thank you all for helping us
> >>> get there!
> > Just tested Xen 4.12.3, but a domU hanged again with credit2. It works
> rock solid with credit1.
>
> I have several hosts back on credit2, no problems so far.  But the
> bulk of my production hosts are still on credit1, and they do seem to
> run "better" (subjectively, looking at responsiveness and load
> averages) but of course by subjectively I mean that I have no real
> data to back this feeling.
>
> I was hoping one of my domU's on credit2 would crash so I could grab
> debugging info for the development team - I hope you are/were able to
> grab and submit data on that crash???
>
> Glen
>

Unfortunately no, it was one of my production hosts so I wanted to get it
back working as quickly as possible.

Tomas

--00000000000000494a05a730e992
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 3, 2020 at 5:30 PM Glen &=
lt;<a href=3D"mailto:glenbarney@gmail.com">glenbarney@gmail.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Tomas -<br>
<br>
On Tue, Jun 2, 2020 at 7:43 PM Tomas Mozes &lt;<a href=3D"mailto:hydrapolic=
@gmail.com" target=3D"_blank">hydrapolic@gmail.com</a>&gt; wrote:<br>
&gt;&gt; On Mon, Feb 24, 2020 at 4:55 PM Glen &lt;<a href=3D"mailto:glenbar=
ney@gmail.com" target=3D"_blank">glenbarney@gmail.com</a>&gt; wrote:<br>
&gt;&gt;&gt; I&#39;m now going to bring one of the previously-live guests o=
n its own<br>
&gt;&gt;&gt; host back to credit2 so I can crash it and try to capture debu=
gging<br>
&gt;&gt;&gt; output for xen-devel as requested.=C2=A0 But sched=3Dcredit is=
 definitely<br>
&gt;&gt;&gt; what we needed to solve this problem!=C2=A0 Thank you all for =
helping us<br>
&gt;&gt;&gt; get there!<br>
&gt; Just tested Xen 4.12.3, but a domU hanged again with credit2. It works=
 rock solid with credit1.<br>
<br>
I have several hosts back on credit2, no problems so far.=C2=A0 But the<br>
bulk of my production hosts are still on credit1, and they do seem to<br>
run &quot;better&quot; (subjectively, looking at responsiveness and load<br=
>
averages) but of course by subjectively I mean that I have no real<br>
data to back this feeling.<br>
<br>
I was hoping one of my domU&#39;s on credit2 would crash so I could grab<br=
>
debugging info for the development team - I hope you are/were able to<br>
grab and submit data on that crash???<br>
<br>
Glen<br></blockquote><div><br></div><div>Unfortunately no, it was one of my=
 production hosts so I wanted to get it back working as quickly as possible=
.</div><div><br></div><div>Tomas</div><div><br></div></div></div>

--00000000000000494a05a730e992--

