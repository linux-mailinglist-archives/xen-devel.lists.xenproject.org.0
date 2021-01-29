Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F98308289
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 01:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77552.140499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Hoo-0007fR-7S; Fri, 29 Jan 2021 00:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77552.140499; Fri, 29 Jan 2021 00:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Hoo-0007f2-3o; Fri, 29 Jan 2021 00:39:22 +0000
Received: by outflank-mailman (input) for mailman id 77552;
 Fri, 29 Jan 2021 00:39:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rA00=HA=gmail.com=michael.d.labriola@srs-us1.protection.inumbo.net>)
 id 1l5Hon-0007ex-4o
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 00:39:21 +0000
Received: from mail-oi1-x22f.google.com (unknown [2607:f8b0:4864:20::22f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54deab9f-8364-4ad9-8498-d8de8aba23b8;
 Fri, 29 Jan 2021 00:39:19 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id n7so8100654oic.11
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 16:39:19 -0800 (PST)
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
X-Inumbo-ID: 54deab9f-8364-4ad9-8498-d8de8aba23b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jukk9ug596/8oaymt9jnz0ohX/k6g1hZOmyfE6uDoEg=;
        b=unACxiuWGGp8BAhRfEOchDgTG+qixVQ4ldPXC+mCTlihhw95KGVvk6EV10/xYRwLbi
         cayIzz9H7yYuso9p6HLIZ1RsxRuZONNj9lWiqZ2x84zjXWYCjuDhEzLczbPoNrSxiEow
         a29PGo92V8oNefwKwFAeP6OMWlWLMbImTbmGaSuX0T/ngVJnMM5+Cd/LHN+VIvpEfjNl
         EWab49aIDtUwTjRkvICcV0DbWSZZbgdpNFjl8MvTja9e5JDpKKZqXfSu49zXYYIGBzKt
         FAR2NJ83uwUz34U+koTVqMm0pS4cqxOO4VdVbLzlIfTWIHwqQaZ2gpZuYay8WtFBrr9j
         UqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jukk9ug596/8oaymt9jnz0ohX/k6g1hZOmyfE6uDoEg=;
        b=WQHJ/n/P4nYc8IMbAFrh3Hj20jHMKqnfszItHAiTncEATXp7IMNR0G6zj1i8W6vt2/
         OBX9RZHCOmwG7pYOyZlBwOImaOM8nA8s7nZm6ITfX2ZGUddsy58T9CkXwGsH6kJ1NMF9
         jI4rSKb0Wvern7nd1Luomc6/dG6sNGb/gVWkvAKIjaIKqaVLcmRHo3SEdLAS+CCsAi0B
         05sqJwG4zjzQa2n6PeBdMTc6PaVlzltcokckO1gptXl9pzrrSPvDFavVZLllmAV3b+NP
         ZLkNyVJjmRDIZ9KTC/+jj8mNJTVMsBpEFrgZUxDwuToO7Oh0Z6/4IV1uUIg7b2egVEr/
         AaUQ==
X-Gm-Message-State: AOAM531ZVmSi4R+uJ0kEyYQgfxw92ZarQHWuLVWgUk0VZniuWD4RJY8m
	XzsAayTOcT2cM57RSK1LcCQJ/GqM/GmXmsXhG3A=
X-Google-Smtp-Source: ABdhPJx424NkUncAgPeTJ3zdeF39P+c1I/zagH2BUt7XDVRUz1VDkmMGt2R2ga7rK+uvdYWcNI7NF7mLo2hWu52e354=
X-Received: by 2002:a05:6808:8ec:: with SMTP id d12mr1182764oic.34.1611880759168;
 Thu, 28 Jan 2021 16:39:19 -0800 (PST)
MIME-Version: 1.0
References: <2nft2kipqg.fsf@aragorn.infrastructure.cah> <983b87d6-edb8-21ea-7d6f-f653f5c0d048@oracle.com>
In-Reply-To: <983b87d6-edb8-21ea-7d6f-f653f5c0d048@oracle.com>
From: Michael Labriola <michael.d.labriola@gmail.com>
Date: Thu, 28 Jan 2021 19:39:08 -0500
Message-ID: <CAOQxz3ybREqE0s11g3sghFba2NUTxUEkKTKGgjwrgrT+uBZt-A@mail.gmail.com>
Subject: Re: Problems starting Xen domU after latest stable update
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: David Woodhouse <dwmw@amazon.co.uk>, Juergen Gross <jgross@suse.com>, Sasha Levin <sashal@kernel.org>, 
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 28, 2021 at 7:03 PM Boris Ostrovsky
<boris.ostrovsky@oracle.com> wrote:
>
>
> On 1/28/21 6:52 PM, Michael D Labriola wrote:
> > Hey, everyone.  I've run into problems starting up my Xen domUs as of
> > the latest batch of stable updates.  Whenever I try to create one, I
> > get a bunch of block device errors like this:
> >
> > libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51712
> > libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51728
> > libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51744
> > libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51760
> > libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to add device with path /local/domain/0/backend/vbd/4/51776
> > libxl: error: libxl_create.c:1452:domcreate_launch_dm: Domain 4:unable to add disk devices
> > libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51712
> > libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51728
> > libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51744
> > libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51760
> > libxl: error: libxl_device.c:1105:device_backend_callback: Domain 4:unable to remove device with path /local/domain/0/backend/vbd/4/51776
> > libxl: error: libxl_domain.c:1290:devices_destroy_cb: Domain 4:libxl__devices_destroy failed
> > libxl: error: libxl_domain.c:1177:libxl__destroy_domid: Domain 4:Non-existant domain
> > libxl: error: libxl_domain.c:1131:domain_destroy_callback: Domain 4:Unable to destroy guest
> > libxl: error: libxl_domain.c:1058:domain_destroy_cb: Domain 4:Destruction of domain failed
> >
> > I'm using Xen 4.13.1 on the box I've been testing with.
> >
> > I bisected down to this commit, and reverting it does indeed fix my
> > problem.  Well, this commit upstream and it's cherry-picked variants
> > on linux-5.4.y and linux-5.10.y.
>
>
> You most likely need 5f46400f7a6a4fad635d5a79e2aa5a04a30ffea1. It hit Linus tree a few hours ago.

Indeed!  That commit fixes my problem when cherry-picked onto master
and the 5.4 and 5.10 stable branches.

Is that commit already headed to the stable/longterm branches or do we
have to make a bit more noise?

Thanks!

-Mike

