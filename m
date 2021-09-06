Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FCA40179C
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 10:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179443.325711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9jH-0008Mv-1M; Mon, 06 Sep 2021 08:11:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179443.325711; Mon, 06 Sep 2021 08:11:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9jG-0008K9-Sx; Mon, 06 Sep 2021 08:11:46 +0000
Received: by outflank-mailman (input) for mailman id 179443;
 Mon, 06 Sep 2021 08:11:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tq2V=N4=gmail.com=long870912@srs-us1.protection.inumbo.net>)
 id 1mN9jF-0008K3-Lj
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 08:11:45 +0000
Received: from mail-ot1-x329.google.com (unknown [2607:f8b0:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1060a139-3710-4982-bfd4-ad1603b2a747;
 Mon, 06 Sep 2021 08:11:44 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso7884094ots.5
 for <xen-devel@lists.xenproject.org>; Mon, 06 Sep 2021 01:11:44 -0700 (PDT)
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
X-Inumbo-ID: 1060a139-3710-4982-bfd4-ad1603b2a747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jqw0MwknMj1RijM4alevMH+POuK2y8El0iNuvJ4Z7sI=;
        b=fAULSwf4Pj+E1UknxqjuJ/OdTFuiM7YxgvSqmyiVuhepLdtk8HrH3yeP++ilsATvZQ
         5uUedwNnU2hl/Gmjit3Ykk/Y3BCHR93wDqaLZ7QJCWw0rAmnccIhKnwv5CdxzmyYq8eS
         SPKhucRIXtC7Kxli/P/k2eIB8OMVbsEmbEphr3fpvHiAKzPHKETrIG6q5URdo2VIVtXg
         DWJVQF9BPsQUYDkq//AiIh5sQWLLCqnK+8b1wogRQKfZZ/8dCu6bipeYSjhCz/DtiBFR
         O59TGtBnYwHvt1PEMtpSZ4fag3sx9r3sJwVlPWzfNthiZ/dNYL4F4HfPEshQFDJcFpVR
         zsgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jqw0MwknMj1RijM4alevMH+POuK2y8El0iNuvJ4Z7sI=;
        b=iliIaYAvbLuHpIS2crv9LTzUuT0M3Ie1IayG7m+CaDwOXgv4/Hr/dfnwSKpGH3RqQp
         EwXwKtgXQ6e0qelQX498ifCc1g5FE+W5IxE+9AqIBt1mh+47rcGu6BweFI1JsbZPUUaZ
         oIb8HFx87dXfR910+LfTyilURNS+EAZP9NQfmScakMUlC3+0vnvmc984Qurp4Lc8753d
         KuxFQLDRrVfvhXvy/N3W4YU/DL7kitippxDnNm163kgpJOmcKFXAWpp4yyrJfe0ru/2t
         tmKGF6U4bJvI3DnSWbdRufWTTxcEHFlVH9Y6UysLFvvHSFpvkVRoqUNJIK3kUGV/hml+
         2Usw==
X-Gm-Message-State: AOAM533z5KL7dsQzF22UoCwEwFOXn2lVO3PNHAIp0HB2AfSrg2SclZZ/
	VQFZf+Ak96M28Vsa5VaJmPwDLDim+eCkyKWFNyg=
X-Google-Smtp-Source: ABdhPJz++uZDYjY85Lmv2nL7XDUdCXXJBPnGtWjT5ffovBGzVwDowugFqSssiyb2f7K0TOpCH2pam3qeCpee4wMP704=
X-Received: by 2002:a9d:6e0d:: with SMTP id e13mr9580893otr.304.1630915904431;
 Mon, 06 Sep 2021 01:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210906075516.15066-1-long870912@gmail.com> <af68f9f5-3b6e-162f-5624-e398b744a268@suse.com>
In-Reply-To: <af68f9f5-3b6e-162f-5624-e398b744a268@suse.com>
From: xiao zhao <long870912@gmail.com>
Date: Mon, 6 Sep 2021 16:11:33 +0800
Message-ID: <CAMw=WFQn7Zh_iJxt+KKqDjHr7HAkA9T0e9VF6N5nNvvfOpN7Ng@mail.gmail.com>
Subject: Re: [PATCH] x86: xen: platform-pci-unplug: use pr_err() and pr_warn()
 instead of raw printk()
To: Juergen Gross <jgross@suse.com>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org, 
	hpa@zytor.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, 
	boris.ostrovsky@oracle.com, sstabellini@kernel.org
Content-Type: multipart/alternative; boundary="00000000000024674305cb4f335e"

--00000000000024674305cb4f335e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, I don't know the patch has already been applied through the Xen
tree. Thanks.

Juergen Gross <jgross@suse.com> =E4=BA=8E2021=E5=B9=B49=E6=9C=886=E6=97=A5=
=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=883:58=E5=86=99=E9=81=93=EF=BC=9A

> On 06.09.21 09:55, zhaoxiao wrote:
> > Since we have the nice helpers pr_err() and pr_warn(), use them instead
> > of raw printk().
> >
> > Signed-off-by: zhaoxiao <long870912@gmail.com>
>
> Any reason you are sending this patch again? It has already been applied
> through the Xen tree.
>
>
> Juergen
>

--00000000000024674305cb4f335e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, I don&#39;t know the patch=C2=A0has already been ap=
plied through the Xen tree. Thanks.</div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Juergen Gross &lt;<a href=3D"mailto:jgro=
ss@suse.com">jgross@suse.com</a>&gt; =E4=BA=8E2021=E5=B9=B49=E6=9C=886=E6=
=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8B=E5=8D=883:58=E5=86=99=E9=81=93=EF=BC=9A<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 06.09.21 09:5=
5, zhaoxiao wrote:<br>
&gt; Since we have the nice helpers pr_err() and pr_warn(), use them instea=
d<br>
&gt; of raw printk().<br>
&gt; <br>
&gt; Signed-off-by: zhaoxiao &lt;<a href=3D"mailto:long870912@gmail.com" ta=
rget=3D"_blank">long870912@gmail.com</a>&gt;<br>
<br>
Any reason you are sending this patch again? It has already been applied<br=
>
through the Xen tree.<br>
<br>
<br>
Juergen<br>
</blockquote></div>

--00000000000024674305cb4f335e--

