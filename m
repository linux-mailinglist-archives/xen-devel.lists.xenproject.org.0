Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A141D9B59
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2020 17:34:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jb4Fi-0001R4-Jk; Tue, 19 May 2020 15:33:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ytr=7B=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1jb4Fg-0001Qq-MQ
 for xen-devel@lists.xenproject.org; Tue, 19 May 2020 15:33:56 +0000
X-Inumbo-ID: 2675279e-99e6-11ea-ae69-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2675279e-99e6-11ea-ae69-bc764e2007e4;
 Tue, 19 May 2020 15:33:56 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id w15so4257911lfe.11
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2020 08:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8sLs83mH2h+oYBjYFuHYn1fthSV/529dzyPGDzaPuLo=;
 b=Aig9h+DA8PVgu4kajsyQpjHbvnMicsUx4cz5HMrzD9uS+bt7A30WU7SAA+Iz4WnLow
 wG6KBr9wWu3P9e5dxAW3VcWmM5eUMT8X7dLtdgJa06R7bSwke0QmOVjQiE4m5EUyAtHW
 Clid9HFS26vsHuaCJkkWL7NVNleOjgHvpjXKmmydBUEZuyO+Z7hW4yinp8KyRzgfu8Q0
 hQ+0OuiT9dEXYiDyC6Z3aMi3/AMiADktnctntEhb34wxkx3rkdcPsgkVStd9F3Hy445y
 bnXjw33I7eSIqQOt9VikcZBOObpRs0iAb+4AZcVlXi0FG2hzIXDNDh8UgEAcS5+m/80l
 C9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8sLs83mH2h+oYBjYFuHYn1fthSV/529dzyPGDzaPuLo=;
 b=s6ARqYY7m6LG4ICllgfF08WsmKPC6xHtyEDUPaK0l4Cd639tCk1arToVo067usfJLV
 gZXW8QiOrw48dddqpHQmME/uMNtipjGxf7dIhWs0axUjkqZEg8GVJWaVtop6jjXyVY7P
 DRWPN++LitFTkS4Db8BKFg7U5q93s3qxESrHcULDPYEp0TKWpwI7p+xpkYPE7l9M0Jc5
 A+7jBm7YjQ1Ub34a9aMjCNpED2TVDS37AaV66UM1HbjBMmH3hDkOUadjFnEJrHXLi2cp
 V+IAQl9XAe2+fSie49h1FNrefpfq/6AEfsKr+gibrJL6ihtHruhsJ675tj2YlEdWGZAu
 lJug==
X-Gm-Message-State: AOAM5330wODfkWHycSqvCAjMbRXVlQrsuL4fTNGUq13fiozni8+F7HuL
 Kk3EwFdOBkLCqxRIdZHao7CmIMcwtP1zekrSFf0=
X-Google-Smtp-Source: ABdhPJwfRyShlC9luUCjTtLsftL5qLA4CApmlpLFWIIclalY9/Ou3dMwYfhZGgbo/HOwpAxnLkvYfWE2XpxXFJOgsxs=
X-Received: by 2002:a05:6512:3049:: with SMTP id
 b9mr5397233lfb.44.1589902434988; 
 Tue, 19 May 2020 08:33:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200519015503.115236-1-jandryuk@gmail.com>
 <20200519015503.115236-8-jandryuk@gmail.com>
 <24259.63185.474995.498745@mariner.uk.xensource.com>
 <20200519152132.3ivs6gpembnjai3o@debian>
In-Reply-To: <20200519152132.3ivs6gpembnjai3o@debian>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 19 May 2020 11:33:43 -0400
Message-ID: <CAKf6xpuD2761=9WvY3zryAMEE4XS2vfM-ds=c=FrRbVm-iHH7g@mail.gmail.com>
Subject: Re: [PATCH v7 07/19] libxl: write qemu arguments into separate
 xenstore keys
To: Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?=
 <marmarek@invisiblethingslab.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, May 19, 2020 at 11:21 AM Wei Liu <wl@xen.org> wrote:
>
> On Tue, May 19, 2020 at 04:10:09PM +0100, Ian Jackson wrote:
> > Jason Andryuk writes ("[PATCH v7 07/19] libxl: write qemu arguments int=
o separate xenstore keys"):
> > > From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.co=
m>
> > >
> > > This allows using arguments with spaces, like -append, without
> > > nominating any special "separator" character.
> > >
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > > Reviewed-by: Jason Andryuk <jandryuk@gmail.com>
> > >
> > > Write arguments in dm-argv directory instead of overloading mini-os's
> > > dmargs string.
> > >
> > > Make libxl__write_stub_dmargs vary behaviour based on the
> > > is_linux_stubdom flag.
> >
> > Thank you, I like this.

Since I was touching the code, I might as well make the change. :)

> > Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
>
> Cool. Now this series is all acked. I will commit all the patches today.

Thanks,
Jason

