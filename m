Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB63B13938
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jul 2025 12:51:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1061306.1426821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLRh-0007gg-Kd; Mon, 28 Jul 2025 10:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1061306.1426821; Mon, 28 Jul 2025 10:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugLRh-0007da-Hd; Mon, 28 Jul 2025 10:51:05 +0000
Received: by outflank-mailman (input) for mailman id 1061306;
 Mon, 28 Jul 2025 10:51:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WRgz=2J=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1ugLRg-0007cC-QQ
 for xen-devel@lists.xenproject.org; Mon, 28 Jul 2025 10:51:04 +0000
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [2607:f8b0:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c1371013-6ba0-11f0-a31e-13f23c93f187;
 Mon, 28 Jul 2025 12:51:03 +0200 (CEST)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-41bc2668f75so2218674b6e.0
 for <xen-devel@lists.xenproject.org>; Mon, 28 Jul 2025 03:51:03 -0700 (PDT)
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
X-Inumbo-ID: c1371013-6ba0-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753699862; x=1754304662; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIdoYdJKD64lctUHJp5QUiVV4m6KJX8hueupdGXZLc4=;
        b=gl5gsn89Bd4VsE4khW3KYb1JJhwbk5RpVZ5QIM5l2WdQzLPioHoBVEh1XsRMhgFi08
         fX7HhiFQIPvRmgx/S5FXUoLZ/EAGV3bwWRK3njxw8eeE5UrGMwu3dv8reEnbCghazeD2
         KZYCEYmCD/7zncbGbwO9H1TZkDGLj+Z1oSnwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753699862; x=1754304662;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIdoYdJKD64lctUHJp5QUiVV4m6KJX8hueupdGXZLc4=;
        b=GEjxzSMdzmeEwqRlRD2Bcra73/IcO0iR0zGetpapCgwzOVaZrJ7Jxk6a/PS4MuZI1i
         QQuU+EJUxc/PZnJhPKKQEQBZUOr9uJCUuhj5bxmG7434QQveRQrRv1mD9CEkKSoCs+GV
         sPeuhHuHTVxMl6BB9MHrhOt1lhAIc2uhwvMAbGZ3bYdfdi8tu1fmSeM9mQTPEYeZLBR+
         h0lL2MHYNz+/25kjz8civN2a+1BTxAO7cdhEJKaN47hm0KFkGThrN7RVItY7kibHi3/l
         blhJQ8jKhivYvyPSjedJbtdvybZSaX0BX91AlBsb9AwuKygUQxgc7pViH8GlVIojCAHv
         38nw==
X-Forwarded-Encrypted: i=1; AJvYcCV3C4tb7tV2ZItwpH0fM0euo78LpdUluAY79K3rSreHwtn1mGFA6b5/k2dq7CDS0xJcEIIZWkpisQY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxwejTeSIbSTsBT7ET0jRyn24JitzZBSmuk1sYij7syltJb9ILx
	b4RRCUYeSev+6QPAPL+vg6elAEG5syNQA9+F0hWuSkiDuNraTL1UPUWR4o9o34p8+REuMqwd2Dm
	xKZeE5EmuIzD/XzBuL23ZPsBZewQEZm/mWOHZFLxyFabyrwh4Ob/wHlE=
X-Gm-Gg: ASbGnctEn2dkhLPgtCAdI6kGhuCXo1dre+iHeZ0BB1mjE2AAS/FFeYEoSJSg1QV24EQ
	TMlCKOFoIYrchvyiEX2+Uy4MH4CdP+R72vt2pYvYf6cISItIePDticiyaNwd4NJgwl+en+E0XJa
	var02Rxxw2dLNQNX+JzF3QUpyeH8+ceCAJHbZwmHOeOTp/Fv3bLneDn06h4YexOvCTCIDGa5zXu
	6yN9Q==
X-Google-Smtp-Source: AGHT+IFq4S/tlwcHVItulwLKPFsBJSDDQoMFwoemiJx0djrovqLqx7M9gLTbQTayyZpI+pBeXQ3sznPYyGQdxDC1m0Y=
X-Received: by 2002:a05:6808:1409:b0:40c:f402:96f with SMTP id
 5614622812f47-42bb7eb6f70mr6070270b6e.14.1753699862181; Mon, 28 Jul 2025
 03:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250728102422.2245808-1-marmarek@invisiblethingslab.com> <b4e3c287-7847-4cdc-8fbb-bb788a6de8b5@citrix.com>
In-Reply-To: <b4e3c287-7847-4cdc-8fbb-bb788a6de8b5@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 28 Jul 2025 11:50:51 +0100
X-Gm-Features: Ac12FXxpQ9fbjdUsnbnLyIMyWgddG7Pq48ZgH0AZucvZM0CeOvmQ9MuHf3qn1cM
Message-ID: <CACHz=Zh27UTGY0G=iVKK25qkr-zVcp5cxAbxoP575m=UfgqYtw@mail.gmail.com>
Subject: Re: [PATCH] tools/xl: don't crash on NULL command line
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 28, 2025 at 11:46=E2=80=AFAM Andrew Cooper
<andrew.cooper3@citrix.com> wrote:
>
> On 28/07/2025 11:24 am, Marek Marczykowski-G=C3=B3recki wrote:
> > When running xl in a domU, it doesn't have access to the Xen command
> > line. Before the non-truncating xc_xenver_cmdline(), it was always set
> > with strdup, possibly of an empty string. Now it's NULL. Treat it the
> > same as empty cmdline, as it was before. Autoballoon isn't relevant for
> > xl devd in a domU anyway.
> >
> > Fixes: 75f91607621c ("tools: Introduce a non-truncating xc_xenver_cmdli=
ne()")
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > So, apparently the "No API/ABI change" was a lie... it changed "empty
> > string" to NULL in libxl_version_info->commandline. Quick search didn't
> > spot any other (in-tree) place that could trip on NULL there. IMO NULL
> > value in this case makes more sense. Buf maybe for the API stability
> > reasons the old behavior should be restored?
>
> Hmm, I didn't intend to change things, but I also didn't anticipate
> libxl__strdup()'s behaviour, or for something to depend on that.
>
> While this does turn out to be a marginal API change, I think your
> solution is the right one.  I do not think it's reasonable for there to
> be one magic pointer that has differing NULL-ness to the others, and
> NULL for "no information" is the better interface.
>
> That said, is the other use fully safe?  I can't see anything that
> requires sprintf()'s %s to detect a NULL pointer and not crash.
>

That's the standard behavior, usually "(null)" is printed.

> > PS I'm working on a CI test for this case (and driver domains in
> > general). I have it working with Alpine already, but it wouldn't detect
> > this issue, as musl's regexec() doesn't crash on NULL... So, I'll add a
> > test on Debian too.
>
> Excellent.
>
> ~Andrew
>

For the commit

Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Frediano

