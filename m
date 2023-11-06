Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB4B7E207A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 12:54:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627946.978887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzyB7-0003NT-Ad; Mon, 06 Nov 2023 11:54:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627946.978887; Mon, 06 Nov 2023 11:54:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzyB7-0003Kg-79; Mon, 06 Nov 2023 11:54:01 +0000
Received: by outflank-mailman (input) for mailman id 627946;
 Mon, 06 Nov 2023 11:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wfGl=GT=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qzyB5-0003Hr-Qu
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 11:53:59 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2afbcf1b-7c9b-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 12:53:57 +0100 (CET)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-50930f126b1so5356199e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 03:53:57 -0800 (PST)
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
X-Inumbo-ID: 2afbcf1b-7c9b-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699271637; x=1699876437; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXchnVxI+7x50nS0csdX/GoCFitfXphCFKOOVO3T9fQ=;
        b=g4GmVBDxH9TDluIGkyNnNcabLvP+K+mx45b3dHxfwLxeu8b89ut+lN+5ZBDH52sceL
         lEWToiJ3QimUoml+IFpR0FK2yxYilSX1pMSNobDKMtocjsB5ttGgmUKaRiVBxSw0SPRk
         5ew3p2aK/1FDDtNKtaVJUoPKbms09Y4Uf/oiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699271637; x=1699876437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jXchnVxI+7x50nS0csdX/GoCFitfXphCFKOOVO3T9fQ=;
        b=YjK6hclMbHyjH5aGgTKMKzidJvO1Y6FibzcSzNt+5/KEm2kcsgjdP01aR29Ml7A5Pk
         pUilm3VFi97qxldT5GTe+mNam3NtWbKaP+7JiJHyN5s6pdTkBe4qenqPAMoXvyV8GskV
         gv9bh92LbXMJnl84/AL4S49zOyLAurbUd9F3LliRKDdKk0PqU7Thep+64H13Ho0MKPnn
         n+Sghho4GCGXYK8S+0Zi70QErMX/+1i8MPfWaG8QQfqTcfviXTOALxB2PMFrW0T20QHR
         m2aA5o80aqV/JqiCK+I/8FoDorrd4lc0zjEFJvfSJCtRJGLYJIkpyv+ZSTvTXAj+zoLB
         Sejg==
X-Gm-Message-State: AOJu0Yw8vl0v+a0X2UnZAX8nPoH7aV3UEhchSFqyxtPKJesBfXljqn4i
	1IF+wpjZwFiZqgW5whygkd+Wmoi8R9MfniIC+gS/CA==
X-Google-Smtp-Source: AGHT+IFJW6aJwRVZw4/rjLwxYAmS8jAAXA2jkFPmyjDhQ9DZ5r+ROk1uocKOUgLeZRq4VK3+zqlPU12402507jx3cZo=
X-Received: by 2002:a05:6512:3582:b0:505:9872:7a16 with SMTP id
 m2-20020a056512358200b0050598727a16mr19605495lfr.49.1699271637382; Mon, 06
 Nov 2023 03:53:57 -0800 (PST)
MIME-Version: 1.0
References: <20231103194551.64448-1-jandryuk@gmail.com> <20231103194551.64448-3-jandryuk@gmail.com>
 <CA+zSX=YUkiwkNV_p1SsAYbyd2q76VfwWqi_mBoCwaVpca-GfXQ@mail.gmail.com>
In-Reply-To: <CA+zSX=YUkiwkNV_p1SsAYbyd2q76VfwWqi_mBoCwaVpca-GfXQ@mail.gmail.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Mon, 6 Nov 2023 11:53:46 +0000
Message-ID: <CA+zSX=ZkswegH0n0k25-0nKXonGiLei-bA2TS=rqXWpNtOVtHw@mail.gmail.com>
Subject: Re: [PATCH for-4.18 2/2] golang: Fix bindings after XSA-443
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Henry Wang <Henry.Wang@arm.com>, 
	Nick Rosbrook <rosbrookn@gmail.com>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 6, 2023 at 11:41=E2=80=AFAM George Dunlap <george.dunlap@cloud.=
com> wrote:
>
> On Fri, Nov 3, 2023 at 7:46=E2=80=AFPM Jason Andryuk <jandryuk@gmail.com>=
 wrote:
> >
> > The new bootloader_restrict and bootloader_user fields in the libxl idl
> > change the bindings.  Update them.
> >
> > Fixes: 1f762642d2ca ("libxl: add support for running bootloader in rest=
ricted mode")
> > Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
>
> Acked-by: George Dunlap <george.dunlap@cloud.com>

Also, as Jason pointed out in the cover letter, we probably want to
backport this patch; I'm not sure exactly who's in charge of that for
tools.

 -George

