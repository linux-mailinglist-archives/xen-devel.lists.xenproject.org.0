Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 838FC85CE60
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 03:56:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683779.1063383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rccm1-0004g0-Oj; Wed, 21 Feb 2024 02:55:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683779.1063383; Wed, 21 Feb 2024 02:55:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rccm1-0004do-Lf; Wed, 21 Feb 2024 02:55:53 +0000
Received: by outflank-mailman (input) for mailman id 683779;
 Wed, 21 Feb 2024 02:55:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CeSM=J6=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rccm0-0004di-LW
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 02:55:52 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b881c6b3-d064-11ee-98f5-efadbce2ee36;
 Wed, 21 Feb 2024 03:55:50 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d2505352e6so12046151fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 18:55:50 -0800 (PST)
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
X-Inumbo-ID: b881c6b3-d064-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708484150; x=1709088950; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYzFasVS6k5md+txoN4+vxSF9iSmkvpQ0PJpRJ5AdxA=;
        b=FKUj2xN2Orh6l3+qfWaw0A37tlnrHtI/00fOA/e4XJhmtSYajb1KiA71M2+rbDgmKj
         w7IqdkaSejNz1xNydhOi5jgoTEkNEARvG6KPnBxF+zRJMgcz9jgU/OEpAAG40M2grqka
         F5hXMFXY0EqnWtDIHHHWkuhCQzsD5ZQnfm5Go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708484150; x=1709088950;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYzFasVS6k5md+txoN4+vxSF9iSmkvpQ0PJpRJ5AdxA=;
        b=ajdz8rLlEPWYVD4xljfzUT8bFS1ABddrvsyiO2zxycqEtRWLIVLqajyHXexW9oCBUu
         NcCNH0+/Kkcupjn0791y0zE2zA1ojOgtyS+09t0CoFMcOBMMssPx73zkoLUKvWPL+ukB
         kmbFiXMSWLhd3YyyMiEDLhvqJhCK2s3VZ4KRMgNLlzXn5Um1SNWLF018IoLecjrExMf4
         eGveWvkFmnksSKLk5q+FvaCKAf2QdFrnkoVjBaE40aqXMZ+KeWgrVBQr24ySN9b5Tblt
         UV8UJ1vxCJw2LPa5qFTkZVh3Th0pUzgD4OCU/nv99j+l218N6/2G5gGC24rvSQGWXhmq
         9SdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnimyPf5CufIdJBNmN/RkP8Vtwb4zlCLUg2pF3c9AmIyhKXRkobmZhDUi/DbFa1k4uXLcFegWfAOFzdCx71SysS3E/679cZ6li7/n9bwE=
X-Gm-Message-State: AOJu0YxIWWFPnwwD/3WLJFXy7kZdiFC+HcyfPvES/usHJIc39719GIpY
	SgeC1zkLMkEhn9p1s+nGiom03e87OyxLq9WuOKPcpewrDrSWzXhtoame0XYZrHGJAkQLSXsxnSk
	igROzz2RA4dkna0ywaauwqWxsVasWUyCF+m3RzQ==
X-Google-Smtp-Source: AGHT+IFeOG94QipeGLYIa1c1ry3/xlDVG7VRvY5SOqbG4yKwY47QErdnvEz7QgW3uPmQIbfrQImhvRkHh06J0IaKBSE=
X-Received: by 2002:a2e:9dda:0:b0:2d2:4fa4:f4b2 with SMTP id
 x26-20020a2e9dda000000b002d24fa4f4b2mr1538664ljj.28.1708484150236; Tue, 20
 Feb 2024 18:55:50 -0800 (PST)
MIME-Version: 1.0
References: <CA+zSX=aEdcF-D3PUQN=1V2puz0AEMiLn4-uQFGrLWf7EYSZ7WA@mail.gmail.com>
 <ZdMt88BSNMYtq39n@macbook> <36229344-e2e2-46e1-839b-b7b3b0843f23@suse.com>
In-Reply-To: <36229344-e2e2-46e1-839b-b7b3b0843f23@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 21 Feb 2024 10:55:39 +0800
Message-ID: <CA+zSX=YvTgEMC0S5OqSFvxfVDeruiO=FphyVx5fv75oT-QW01A@mail.gmail.com>
Subject: Re: Stats on Xen tarball downloads
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, committers@xenproject.org, 
	Kelly Choi <kelly.choi@cloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 19, 2024 at 6:38=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 19.02.2024 11:31, Roger Pau Monn=C3=A9 wrote:
> > On Mon, Feb 19, 2024 at 06:01:54PM +0800, George Dunlap wrote:
> >> One of the questions we had with respect to changing our release
> >> practice (for instance, making the process more light-weight so that
> >> we could do a point release after every XSA) was, "How many people are
> >> actually using the tarballs?"
> >
> > What would this more lightweight process involve from a downstream
> > PoV?  IOW: in what would the contents of the tarball change compared
> > to the current releases?
>
> From all prior discussion my conclusion was "no tarball at all".

Or at very least, the tarball would be a simple `git archive` of a
release tag.   Right now the tarball creation has a number of
annoyingly manual parts about it.


 -George

