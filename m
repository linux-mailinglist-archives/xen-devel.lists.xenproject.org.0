Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB9EA93659
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 13:16:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958914.1351472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5jhJ-0002WP-83; Fri, 18 Apr 2025 11:15:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958914.1351472; Fri, 18 Apr 2025 11:15:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5jhJ-0002Uk-4p; Fri, 18 Apr 2025 11:15:53 +0000
Received: by outflank-mailman (input) for mailman id 958914;
 Fri, 18 Apr 2025 11:15:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iJE8=XE=gmail.com=ubizjak@srs-se1.protection.inumbo.net>)
 id 1u5jhH-0002UY-SY
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 11:15:51 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bd238e9-1c46-11f0-9ffb-bf95429c2676;
 Fri, 18 Apr 2025 13:15:50 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30bfc8faef9so16380201fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Apr 2025 04:15:50 -0700 (PDT)
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
X-Inumbo-ID: 7bd238e9-1c46-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744974949; x=1745579749; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuDmX7HFNNg9bdF0GsJtTxnPoXyBhXe51ZRLu7jghTc=;
        b=h2HGYIGaPi8+PUK/X5JFRDfsRtifLXS87cPzUqf/DSxN1nSMp1xu76HcYNRAtDqDEC
         LzZC7DBNsFV399e1L+U8VFjjFywyz3Iec3pvkbTT/lQmJ4nDdZpelgWvHDhIzPUi1Z4B
         K42eSebC9cdVk3YWqmLF2jzFLqhNc74BOIv1gJ7tgHDbCbbX0ry/LXYEu2NhKS9JanCj
         NEal9DeuLChCV2OMQwwfA9WSs5rwpCEmB1oxCVBp6CM9BObTtPBr4AIfviXkYnwvz4bY
         /gdQsLbjXFLP0tLRUq0h9dwg8JyYhHgvy+HcQz8jfpLALrIIvD5s6i1jHY5RFvv/QV87
         teFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744974949; x=1745579749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuDmX7HFNNg9bdF0GsJtTxnPoXyBhXe51ZRLu7jghTc=;
        b=CSxVF0DM8qiA0Zt41thOlbIGOpycKPvgIQZsKjUpMIZ3EcAvTulNB9C6e1CZrTQPHu
         f3pPZyqWbkH1Hkz3QQguAOwndmC+DVzhPJ4A1cVaHObdv9+93GdXFbXrgyunzVJvm6lI
         PX2aAEEiRqxMCkG+KtGIzS4HaMRM+LRzpJd/s2vxEhTuYJYEGG+4qzdtqNmbHSOoBCHi
         JvviO9e22NPtFnu+wMnj+oZt9BJdLcDvzvl2dz4761x9DsNqRN8z/wDem30YwLbcx5+7
         eq1SmrDv1IBlSKup/xzqxeCk/jKpkG4zoZmfoGe9NIBFomiy5ig8zg8o0Scw7nh0VNUo
         0WqA==
X-Forwarded-Encrypted: i=1; AJvYcCUeAaFihY65mFg3PygzP2b63UHnDhrVISEftufOIywTLgQnxChMvRaqlnzpJrz8+bVh4IN8j5kcU+Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwiuSdB+wr8BTDdt4vjsXzfuMY3bQUTxR2XfvwKfzq3tIQrbbl4
	SasTlqNI+9AxbSyBXY8xwEgVRUgQKIIHNazgCSc1hMiOB/1WXZYvYqvLq6TxoZrtqSyDeWezQYA
	cZjLZ9ATTwZK0PRkb53M7HHVsCS8=
X-Gm-Gg: ASbGncvbEd2vKW5sFK/bUVijMIgWlVI7TIIHufNxOypkdxj9tqe7wDzfY60r/Y+GIh1
	47eGlgYnAAZr/lzKzR9NalG50asYYiRYDxdnLlOn0hBB3LGQTTn9r9jvbEJzaYQK4UmMcCRHgk9
	BRn/XZMVk0eFzVch6xPWiHDg==
X-Google-Smtp-Source: AGHT+IGdOiTGvb/PRQMWHrpFsd0ceVhNOaLkgjWWIXX30ZaT72VDkE5XNIHWYGe7hY+aULnZ8AWGTv31L5H7QDTG2nI=
X-Received: by 2002:a2e:bc88:0:b0:30b:9813:b010 with SMTP id
 38308e7fff4ca-31090554278mr7750231fa.31.1744974949184; Fri, 18 Apr 2025
 04:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250418071437.4144391-1-ubizjak@gmail.com> <50bf962c-2c9e-46a2-bbac-cba9cf229e79@citrix.com>
In-Reply-To: <50bf962c-2c9e-46a2-bbac-cba9cf229e79@citrix.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Fri, 18 Apr 2025 13:15:37 +0200
X-Gm-Features: ATxdqUGD5hIAG3AkM2DfHRBQofsYR7B0lWB7D2bun3Tb_fWb4vOmFg3E0fDFYL4
Message-ID: <CAFULd4ZNiRdARn8O98zROQRWoL1ASQ+iPPTTmLRxjo9SGRHyRg@mail.gmail.com>
Subject: Re: [PATCH -tip v2 1/2] x86/boot: Remove semicolon from "rep" prefixes
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: x86@kernel.org, linux-video@atrey.karlin.mff.cuni.cz, 
	xen-devel@lists.xenproject.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Martin Mares <mj@ucw.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 18, 2025 at 12:24=E2=80=AFPM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 18/04/2025 8:13 am, Uros Bizjak wrote:
> > diff --git a/arch/x86/boot/video.c b/arch/x86/boot/video.c
> > index f2e96905b3fe..0641c8c46aee 100644
> > --- a/arch/x86/boot/video.c
> > +++ b/arch/x86/boot/video.c
> > @@ -292,7 +292,7 @@ static void restore_screen(void)
> >                            "shrw %%cx ; "
> >                            "jnc 1f ; "
> >                            "stosw \n\t"
> > -                          "1: rep;stosl ; "
> > +                          "1: rep stosl ; "
> >                            "popw %%es"
>
> Doesn't this one still need a separator between STOSL and POPW ?

";" is a separator as well.

Uros.

