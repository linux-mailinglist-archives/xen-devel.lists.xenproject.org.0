Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0417B24B88D
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 13:23:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8if3-00015A-49; Thu, 20 Aug 2020 11:23:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u5Ag=B6=gmail.com=dunlapg@srs-us1.protection.inumbo.net>)
 id 1k8if1-000155-8S
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 11:23:11 +0000
X-Inumbo-ID: 1d3895ea-35bf-423c-9630-ebc3ea44eb3a
Received: from mail-ej1-x636.google.com (unknown [2a00:1450:4864:20::636])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d3895ea-35bf-423c-9630-ebc3ea44eb3a;
 Thu, 20 Aug 2020 11:23:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id t10so2035701ejs.8
 for <xen-devel@lists.xenproject.org>; Thu, 20 Aug 2020 04:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=umich.edu; s=google-2016-06-03;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O1jMGL1QdAcrlTgV/4y6r0JPAo6r253dAOIkIjH8ovg=;
 b=GRYQWckyvHHb8M+RLBBdMkqaezkiP8OjqcpVH1zj909nmuZNDDKeclQtNFS1qloBIn
 M85kIMfxUcAFnxXGyCW1VKeri6mqwLIJyAOaDEuCm933dk95H6Fuy4cObbyT0pRho427
 pKeHOhVTMP7T2i8Sh3iOtdgKDsEIikUGIghmLti/mcB5q2yGbWx0TczRvYwqzQEuAVBF
 D36FzZSfIiBx648mrMLL8mO9Qc87RmsltNEQM6qj5LLvrj3DGNvP/FmxyPOhWDfqITNK
 YZDQk+QIfQr9fGJlrNLrQ2+yP5swdl/li3l05gWdOHzToyaH6XDgqMh3dknspe1iw1M0
 RAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O1jMGL1QdAcrlTgV/4y6r0JPAo6r253dAOIkIjH8ovg=;
 b=oAyzpSC95ZuEtSSZpmHRJeHQVhynCoqu2r5SHBlcFJLKsMEkzkTiV33RisfxvBbfO7
 6D6C9HYRChfpXWBizq2pYKTuwNJ8b7vlDuGnSEWqhYy2xh3ee7Yzw4om1FIvY46e2crB
 REaXlvmFDt1zhtFzhR8lAW6FBcfEpbBhBrAegE+04FMes82mx5YALmUfEzNGheud5Oqo
 407+ir6E3+xQxW4dPT0iMPMHCl9X2GSk0+3tG9JqT7wFkfhm4yTcrJtEB6Sqzx+2wErc
 8TQS/iwoUzq0CsPMgAUL23WfOMw47c2LThnVi7li2mRdsdtvYMHUCN1Gvcy+SC72BI6t
 RDNw==
X-Gm-Message-State: AOAM5327+kTY6jyBeub+Ym2gWkcqZxgCA62rwYo7PtK+0KQzErmM5FoG
 aeepXggBKi7E6mLitxMKmF99N6NQbjHzbKtWrK0=
X-Google-Smtp-Source: ABdhPJz4D+Eutv8Qyqeun8RrtxNr6cTrKJ4e3i/wCDK1edtHYWV/UlkSsGd0Mm+ShwWPAC9Qf7sJornKTJ9fRSXBXFY=
X-Received: by 2002:a17:906:d187:: with SMTP id
 c7mr2849148ejz.196.1597922589543; 
 Thu, 20 Aug 2020 04:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
 <8b0e088c-baa9-93db-02f8-369acb008b69@suse.com>
In-Reply-To: <8b0e088c-baa9-93db-02f8-369acb008b69@suse.com>
From: George Dunlap <dunlapg@umich.edu>
Date: Thu, 20 Aug 2020 12:22:57 +0100
Message-ID: <CAFLBxZajgB9nnkwzkPaShy5Oqpa7kyDtLLKUSr3=UQbp96k3OA@mail.gmail.com>
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Jan Beulich <jbeulich@suse.com>
Cc: Roman Shaposhnik <roman@zededa.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>, 
 George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000005411aa05ad4d5816"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--0000000000005411aa05ad4d5816
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 20, 2020 at 9:35 AM Jan Beulich <jbeulich@suse.com> wrote:

>
> As far as making cases like this work by default, I'm afraid it'll
> need to be proposed to replace me as the maintainer of EFI code in
> Xen. I will remain on the position that it is not acceptable to
> apply workarounds for firmware issues by default unless they're
> entirely benign to spec-conforming systems. DMI data based enabling
> of workarounds, for example, is acceptable in the common case, as
> long as the matching pattern isn't unreasonably wide.
>

It sort of sounds like it would be useful to have a wider discussion on
this then, to hash out what exactly it is we want to do as a project.

 -George

--0000000000005411aa05ad4d5816
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Aug 20, 2020 at 9:35 AM Jan Beuli=
ch &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><br>
As far as making cases like this work by default, I&#39;m afraid it&#39;ll<=
br>
need to be proposed to replace me as the maintainer of EFI code in<br>
Xen. I will remain on the position that it is not acceptable to<br>
apply workarounds for firmware issues by default unless they&#39;re<br>
entirely benign to spec-conforming systems. DMI data based enabling<br>
of workarounds, for example, is acceptable in the common case, as<br>
long as the matching pattern isn&#39;t unreasonably wide.<br></blockquote><=
/div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">It sor=
t of sounds like it would be useful to have a wider discussion on this then=
, to hash out what exactly it is we want to do as a project.</div><div clas=
s=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=C2=A0-George<br></d=
iv></div>

--0000000000005411aa05ad4d5816--

