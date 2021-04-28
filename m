Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6822736D73B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Apr 2021 14:26:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119292.225718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjH2-0001Hx-0l; Wed, 28 Apr 2021 12:26:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119292.225718; Wed, 28 Apr 2021 12:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbjH1-0001HY-TP; Wed, 28 Apr 2021 12:26:35 +0000
Received: by outflank-mailman (input) for mailman id 119292;
 Wed, 28 Apr 2021 12:26:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IcpV=JZ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lbjH0-0001HR-8p
 for xen-devel@lists.xenproject.org; Wed, 28 Apr 2021 12:26:34 +0000
Received: from mail-lj1-x22a.google.com (unknown [2a00:1450:4864:20::22a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3987e45e-254f-4eb9-9628-3c957a7cc58d;
 Wed, 28 Apr 2021 12:26:33 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a5so35023280ljk.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Apr 2021 05:26:33 -0700 (PDT)
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
X-Inumbo-ID: 3987e45e-254f-4eb9-9628-3c957a7cc58d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cH1z0ZO0vxP1AJOT84VOmLj8IDaNqDd7p72bPEP7AIE=;
        b=qPoJ0us1yds5P3sKJsPmCd8Nsge7eoctespdJx62HnbD/3chtGa+mJsbagqejI6Gx4
         r1nLyeb+k3dSP2AiwBI+dF+AIDeHEqv5ItLRZ9/3HuvdJRBnBzj3Z2VvjpOBABnvh8Zf
         JpFmww8B3FXSKhxTtyndayb+aST3LQre9pnuPsQv512+owjU1cQgrNqwCE9oaCiwIVAh
         m2zTbRzHbXiLRjm+3akuKyHjmPdAL9V0gtyC5E+x62nRf0LZvpI5VuyTujPrAbGx1zSa
         mHDIXeaEX4/K/dHGyOddINyAzKxU25ryugyff2tC7KJujJLm5dR7ioyrT35rBmvExnOu
         n42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cH1z0ZO0vxP1AJOT84VOmLj8IDaNqDd7p72bPEP7AIE=;
        b=DYUJ7YiXIEGMlP/bxBtL0P0MzXP5qMytMO26jlgfzM4pG1DMe/z+I+5CYJQzO973Zg
         7lU8oCLGNO9dGmEkA135xOvZ/jWSbaJaB+QMUUuvx9ObVMWgzVDjVSPsJeIQg35tHGaY
         1slSxBn7dYVWvLe91RI2y6ZJocghufHd3CTOGsVDEyDqtv4B0UCcGqWQRBmNU/pg6AC6
         GCWCcDjWLIE7N8b6pNiSJ1PPF6fVe5+QOwBxXgkoFlPN5DrRXV3LEU3kyTNmQ8fn6LNE
         ADQjj68z3stls3zly63car51OFkbTjBLmmIiW4q2Y/u3gJS1mxQ8n70XT31BCYKnh8M/
         KxKg==
X-Gm-Message-State: AOAM5336o3SmNx+PaC0KP1+d0QYSmCBSI3r9orfKXG+A8notX/lEk22E
	6uUdSrzzJzwP326McV3OA3LktWGYMStzFxsENTQ=
X-Google-Smtp-Source: ABdhPJwEK31p2B5ntSQQROnQStfJ7NR5qcVMx4353F4fpnWsYEu+v3jB5fYHVNTPEAVrmXAHJo6xsh9QsoBtH1ZE7e8=
X-Received: by 2002:a2e:a309:: with SMTP id l9mr20077243lje.77.1619612792416;
 Wed, 28 Apr 2021 05:26:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.3a5d506462133586bd805b72a226916af6a33799.1619482896.git-series.marmarek@invisiblethingslab.com>
 <41538969-c59d-acc5-9eee-0dffca50d6ac@invisiblethingslab.com>
In-Reply-To: <41538969-c59d-acc5-9eee-0dffca50d6ac@invisiblethingslab.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 28 Apr 2021 08:26:20 -0400
Message-ID: <CAKf6xpvKFP6COEP+LBDHRe+MWy6rg=4YYO70rd7SU_96-FFY-Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] libxl: support common cases without block script
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczycowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
	Anthony PERARD <anthony.perard@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 28, 2021 at 3:00 AM Demi Marie Obenour
<demi@invisiblethingslab.com> wrote:
>
> When it comes to file-based block devices, the major difficulty is
> the extremely bad kernel API.  The only fully safe way to use loop
> devices is to use LOOP_CONFIGURE with LO_FLAGS_AUTOCLEAR and hold a
> file descriptor open to the device until another piece of code (either
> another userspace program or the kernel) has grabbed a reference to it.
> Everything else risks either using a freed loop device (that might now
> be attached to a different file) or risks leaking them on unclean exit.
> The only exception is if one can make certain assumptions, such as no
> other program freeing loop devices for the file in question.  This is
> a reasonable assumption for Qubes dom0, but neither for Qubes domU nor
> for Xen dom0 in general.  Nevertheless, this is effectively what the
> current block script does: if I understand the code correctly, there
> is a race where badly timed calls to losetup by another process could
> result in the block script freeing the wrong loop device.

I posted this a while ago, but didn't get any response:

https://lore.kernel.org/xen-devel/CAKf6xpv-U91nF2Fik7GRN3SFeOWWcdR5R+ZcK5fgojE+-D43sg@mail.gmail.com/

tl;dr: AFAICT, the block script check_sharing function doesn't work
for loop devices

Regards,
Jason

