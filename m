Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FF46E738B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 08:58:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523160.812953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1lA-0007rO-6j; Wed, 19 Apr 2023 06:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523160.812953; Wed, 19 Apr 2023 06:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1lA-0007ou-3a; Wed, 19 Apr 2023 06:57:44 +0000
Received: by outflank-mailman (input) for mailman id 523160;
 Wed, 19 Apr 2023 06:57:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=APhf=AK=gmail.com=oleshiiwood@srs-se1.protection.inumbo.net>)
 id 1pp1l9-0007oo-0X
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 06:57:43 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 782ed5dd-de7f-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 08:57:38 +0200 (CEST)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1a920d484bdso654515ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Apr 2023 23:57:39 -0700 (PDT)
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
X-Inumbo-ID: 782ed5dd-de7f-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681887458; x=1684479458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pNpECdtaAli+4MRrq43TxkkMjq4pU1Ea7BhTbv50bzM=;
        b=P91l2YfrHSWpd/1Xtmo+ygNkws1/NftsrF3zzykxepxcs7YRhf/nh2qLhj2qJyArfv
         4sHukWyvs0bMuJQmUGPYWOduFyZR/hYNs+CW4sSfGD43NxKByrwW43Z7TC22j2RYbQ3L
         N1xVXTZ7b1wBx6Pa28SFNdfHD0HKLSTCDFiqIyHkc4rNQw/wtg71w+m+8ddiUZwRkXYI
         nlKfU0iW6jSHk1PmOwYao05OBUrl+uXXlJyYbf3+n32KsTDLdgFcnxW0RVpkynprvziH
         kjzMh7YhklECc+90qgM3N0xjTuZdKUXlwPRTkJDNxoIP/sGZ137gCU5MWQHCXnL3tyOi
         td8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681887458; x=1684479458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pNpECdtaAli+4MRrq43TxkkMjq4pU1Ea7BhTbv50bzM=;
        b=IWucvvYK5ulXL6vr3x2DWdVdaeBY4705xva+3hBn5fFdvaCGNXBdvSjF441Y5YEEBo
         KBeWAmbBYSSVAc/5Wf4gnDp9k4mW73kEqjFyGxInYEXqLhncHxtmxbKd3pf5YF1/v6f7
         ZJ2AhlKYm/A5qWhT9OD7xtr2v/YdEKIotmoRKKX4+wVTL1Ei6KlTxj+822XQuB9B6geM
         lljNNjay/5C6NW7JXWPoWFq5jB0kA7XJ9bsfwy81SrORU4QijOdqD48AIHxuT2aJx5Ie
         z0GD3I3CpLWmzXExbfSfIMoZD+/vQdaeQn0fAp6AoRxdG/jo+pN+fpYXNrVEOCtlRdhC
         mMKg==
X-Gm-Message-State: AAQBX9c+1J54xJQlKiMnQhChoDyyqqXt79KsxlkzM9wHCjMwRLXkwCTB
	1JhUGv9/SwatBLYW49q6fknxFhChmpdxIdHZONY=
X-Google-Smtp-Source: AKy350YlEH6YgI7pzbT/f8s7mN/LPa1OZoALb+r7bOuaUqylheGtb9Wk7BhEDdRbVkQuLxuOYl8kG/vNHSAGhpy7SEE=
X-Received: by 2002:a17:903:294c:b0:1a6:ebc1:c54d with SMTP id
 li12-20020a170903294c00b001a6ebc1c54dmr4072785plb.30.1681887457650; Tue, 18
 Apr 2023 23:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com>
 <bad09a6f-d41e-ab8e-2291-7fde3b646710@xen.org> <CA+SAi2uPZ=Dq1GxF9Kj1zCO=nbb55ruVG31kH-TgdpR6bLznvA@mail.gmail.com>
 <CA+SAi2s4WLiMEVa3u8rJRNZDpCpLTvnDygpObSUKxau-Q8dfyA@mail.gmail.com>
 <64326e46-096e-0f86-2aa9-31a72d3cd004@xen.org> <CA+SAi2u2=7h=Lo=bTC8YzmzidOErYaQGi=hpoG3w7tdM4LUzFw@mail.gmail.com>
 <alpine.DEB.2.22.394.2304181044080.15580@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2304181044080.15580@ubuntu-linux-20-04-desktop>
From: Oleg Nikitenko <oleshiiwood@gmail.com>
Date: Wed, 19 Apr 2023 10:03:42 +0300
Message-ID: <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com>
Subject: Re: xen cache colors in ARM
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Carlo Nonato <carlo.nonato@minervasys.tech>, 
	michal.orzel@amd.com
Content-Type: multipart/alternative; boundary="000000000000772bad05f9aaf025"

--000000000000772bad05f9aaf025
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Stefano,

Thanks for the clarification.
My company uses yocto for image generation.
What kind of information do you need to consult me in this case ?

Maybe modules sizes/addresses which were mentioned by @Julien Grall
<julien@xen.org> ?

Regards,
Oleg

=D0=B2=D1=82, 18 =D0=B0=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 20:44, Ste=
fano Stabellini <sstabellini@kernel.org>:

> On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
> > Hi Julien,
> >
> > >> This feature has not been merged in Xen upstream yet
> >
> > > would assume that upstream + the series on the ML [1] work
> >
> > Please clarify this point.
> > Because the two thoughts are controversial.
>
> Hi Oleg,
>
> As Julien wrote, there is nothing controversial. As you are aware,
> Xilinx maintains a separate Xen tree specific for Xilinx here:
> https://github.com/xilinx/xen
>
> and the branch you are using (xlnx_rebase_4.16) comes from there.
>
>
> Instead, the upstream Xen tree lives here:
> https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary
>
>
> The Cache Coloring feature that you are trying to configure is present
> in xlnx_rebase_4.16, but not yet present upstream (there is an
> outstanding patch series to add cache coloring to Xen upstream but it
> hasn't been merged yet.)
>
>
> Anyway, if you are using xlnx_rebase_4.16 it doesn't matter too much for
> you as you already have Cache Coloring as a feature there.
>
>
> I take you are using ImageBuilder to generate the boot configuration? If
> so, please post the ImageBuilder config file that you are using.
>
> But from the boot message, it looks like the colors configuration for
> Dom0 is incorrect.
>

--000000000000772bad05f9aaf025
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Stefano,</div><div><br></div><div>Thanks for th=
e clarification.<br></div><div>My company uses yocto for image generation.<=
/div><div>What kind of information do you need to consult me in this case ?=
</div><div></div><div><br></div><div>Maybe modules sizes/addresses which we=
re mentioned by <a class=3D"gmail_plusreply" id=3D"plusReplyChip-0" href=3D=
"mailto:julien@xen.org" tabindex=3D"-1">@Julien Grall</a> ?<br></div><div><=
br></div><div>Regards,<br></div><div>Oleg<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">=D0=B2=D1=82, 18 =D0=B0=
=D0=BF=D1=80. 2023=E2=80=AF=D0=B3. =D0=B2 20:44, Stefano Stabellini &lt;<a =
href=3D"mailto:sstabellini@kernel.org">sstabellini@kernel.org</a>&gt;:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 18 Apr 2023,=
 Oleg Nikitenko wrote:<br>
&gt; Hi Julien,<br>
&gt; <br>
&gt; &gt;&gt; This feature has not been merged in Xen upstream yet<br>
&gt; <br>
&gt; &gt; would assume that upstream + the series on the ML [1] work<br>
&gt; <br>
&gt; Please clarify this point.<br>
&gt; Because the two thoughts are controversial.<br>
<br>
Hi Oleg,<br>
<br>
As Julien wrote, there is nothing controversial. As you are aware,<br>
Xilinx maintains a separate Xen tree specific for Xilinx here:<br>
<a href=3D"https://github.com/xilinx/xen" rel=3D"noreferrer" target=3D"_bla=
nk">https://github.com/xilinx/xen</a><br>
<br>
and the branch you are using (xlnx_rebase_4.16) comes from there.<br>
<br>
<br>
Instead, the upstream Xen tree lives here:<br>
<a href=3D"https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dsummary" rel=3D"=
noreferrer" target=3D"_blank">https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=
=3Dsummary</a><br>
<br>
<br>
The Cache Coloring feature that you are trying to configure is present<br>
in xlnx_rebase_4.16, but not yet present upstream (there is an<br>
outstanding patch series to add cache coloring to Xen upstream but it<br>
hasn&#39;t been merged yet.)<br>
<br>
<br>
Anyway, if you are using xlnx_rebase_4.16 it doesn&#39;t matter too much fo=
r<br>
you as you already have Cache Coloring as a feature there.<br>
<br>
<br>
I take you are using ImageBuilder to generate the boot configuration? If<br=
>
so, please post the ImageBuilder config file that you are using.<br>
<br>
But from the boot message, it looks like the colors configuration for<br>
Dom0 is incorrect.<br>
</blockquote></div>

--000000000000772bad05f9aaf025--

