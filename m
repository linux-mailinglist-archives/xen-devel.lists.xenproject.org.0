Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B13D230389
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 09:11:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0JlX-0005yi-TO; Tue, 28 Jul 2020 07:11:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Yh8=BH=gmail.com=jrdr.linux@srs-us1.protection.inumbo.net>)
 id 1k0JlW-0005yd-MH
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 07:11:10 +0000
X-Inumbo-ID: 829c1c98-d0a1-11ea-8b19-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 829c1c98-d0a1-11ea-8b19-bc764e2007e4;
 Tue, 28 Jul 2020 07:11:09 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id v4so10302220ljd.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Jul 2020 00:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DRjmm9UeBZr7w+ollM4mmi9tSJezjZAc4TEhn0vLBdU=;
 b=KI0fDHv19vGSEykHx1Xxf2uYI1XOVLyGfQIU2/9514vqCxwHHTuFLpmtTzjcMIpBqX
 Q4N6atO6Hv6xE+kmibPoISKeJ0N8BEwd7vDhnnrta5dig7mD+QKpIMhi2LR5In0odMxD
 v/nw+xjY3Qv9PFJ5+ftNOCgEYwYFO7UBhG2UaoeCiyFYdShW2l65MLefZvXX/TuFKjTd
 fpKWungKDmOiDVtcfDpM1ne/HrIMnuanUoAnejRD22L1Nh254yuh+FQ8NFKakM4PXwQo
 WXZL7qsvYv7QZfeTgazav5diHpXeDKzma6PRjlvDlgFL5fVjpDm/UP17EucCmH9R4gtQ
 i8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DRjmm9UeBZr7w+ollM4mmi9tSJezjZAc4TEhn0vLBdU=;
 b=oq9BKRuL2wrRWdNVlcKsjuRpam4+Qgw9I8eF9C8RkEzyvSVeZ4s4gw51R0lnpERAdv
 P3o7RGdhil2a0lxFbW3rZA89EpJivbK66XuXySTOoQvm7Pp7THxo921iAUJnSyGRRtl6
 YDKVAFa0MAHZv3qDnOU16DR+K9A8i4pShNsL0nw2IjZfqfXUlXpkhgkWskUwxRE77MOH
 8S2CD6Db/YvQi54E30sopseBLav3XxS71EYyM9hmwsXsiZZqS44hvcKAWrmBhFdjB29e
 pdSnqBTpwnCs1if44T6tnYt1BFRZl1iJsDkIYjpKMHKJvH8PlRuAYqR4dYbtsByGELXg
 r2tw==
X-Gm-Message-State: AOAM532d7VNH4xfbFX2dwEvDOJCKFd6RNkLO9AJLuT4rykjIJqOkwbKP
 SNhaC3PjuMkbUyRGZraBADnZblSetWJCl2G8jY4=
X-Google-Smtp-Source: ABdhPJyjhWJvOexjJ9Q7VOnPBUZjH1m1y72aPQWml/W5gmrJ56dELIFOcCms21hPKK+BstFoDGJXHhFoL5JEnD4D+Xc=
X-Received: by 2002:a2e:920e:: with SMTP id k14mr12349908ljg.430.1595920268329; 
 Tue, 28 Jul 2020 00:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
In-Reply-To: <1594525195-28345-1-git-send-email-jrdr.linux@gmail.com>
From: Souptick Joarder <jrdr.linux@gmail.com>
Date: Tue, 28 Jul 2020 12:40:57 +0530
Message-ID: <CAFqt6za8U04U2TQhe6DUCv7B4h9L-iqPtyE1DuALXUWOD=1M3A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Few bug fixes and Convert to pin_user_pages*()
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, sstabellini@kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Paul Durrant <xadimgnik@gmail.com>, John Hubbard <jhubbard@nvidia.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Boris,

On Sun, Jul 12, 2020 at 9:01 AM Souptick Joarder <jrdr.linux@gmail.com> wrote:
>
> This series contains few clean up, minor bug fixes and
> Convert get_user_pages() to pin_user_pages().
>
> I'm compile tested this, but unable to run-time test,
> so any testing help is much appriciated.
>
> v2:
>         Addressed few review comments and compile issue.
>         Patch[1/2] from v1 split into 2 in v2.
> v3:
>         Address review comment. Add review tag.
>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: Paul Durrant <xadimgnik@gmail.com>
>
> Souptick Joarder (3):
>   xen/privcmd: Corrected error handling path
>   xen/privcmd: Mark pages as dirty
>   xen/privcmd: Convert get_user_pages*() to pin_user_pages*()

Does this series looks good to go for 5.9 ?

>
>  drivers/xen/privcmd.c | 32 ++++++++++++++------------------
>  1 file changed, 14 insertions(+), 18 deletions(-)
>
> --
> 1.9.1
>

