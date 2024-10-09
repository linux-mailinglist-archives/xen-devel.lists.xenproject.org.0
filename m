Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17D2996E4A
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:40:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814654.1228263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXqx-00055W-70; Wed, 09 Oct 2024 14:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814654.1228263; Wed, 09 Oct 2024 14:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXqx-00053b-4U; Wed, 09 Oct 2024 14:39:51 +0000
Received: by outflank-mailman (input) for mailman id 814654;
 Wed, 09 Oct 2024 14:39:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BLvJ=RF=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1syXqv-00051H-KN
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:39:49 +0000
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [2001:4860:4864:20::2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55378417-864c-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 16:39:48 +0200 (CEST)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-2872134c806so2239799fac.3
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 07:39:48 -0700 (PDT)
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
X-Inumbo-ID: 55378417-864c-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728484787; x=1729089587; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A5VYZzA33/X7lo1locmMNQ9zjdbZ5WoZT3Ls76hGZ8c=;
        b=lZPw1q8U6fLJMPtu2c6eBEx5qpVWIvMggqxqKhKIuSi6TCdR5N+rBClTtgabWAUD8U
         YUen/yK9Rx62uQG2g12tt1EeZD2Trlswbu9wL2JCqFo281EPwNRn5S6MRz9tIX6u7Y/8
         fMjmE/9n5hIxvoAGB4KrpUJf6OTSAVgikhEK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728484787; x=1729089587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A5VYZzA33/X7lo1locmMNQ9zjdbZ5WoZT3Ls76hGZ8c=;
        b=G1XN7Q6Wg4JOddRQ/xdq+tMdoYncp9Qr5U0gS7sKzts6v7DzyHY6cnIkFN949WMIyP
         Zgn1dBGdQEiQjQSa2T6zGUI+VajsjKf6I1rsSdBgRQfyoOSsJ4JF2DPq5XFc1OeQJi30
         w5XrKeu9n9iuC+M2weVJ2H2+2I4GR7pVFo4fPl//ql7JqEvIQF6sF9GI9hR58KS+kndb
         hL90fDMplgCz1IXKDUxElXJ7IUw1D1xpbpleukgHXhzMmk5O7nvwZ1exS5rmDZbcXGpe
         12fT/3FThjQalxfOd7Q+eo7TyJjGO0pRMHqlZvBNdzN37nOhObxy5mmiZi2jE7//3NvO
         9g/g==
X-Forwarded-Encrypted: i=1; AJvYcCVqI0gFlOwy0evEWBh8WFU63+Ab5TbtRcWnrlK7VaOQvT8oaxOyIetzJJpZc7aO+5OG3MgzhHn9RN0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yya9N11asTkuqH/S7K+UAq8qTQ4Bp1QDTF0Okg20AY9Lx7ikxgj
	yZ1S1ycP31+JGLSTYva30vdGoPfYaVtpPydmwhR23Cpjw+2MFC32YSib25luGf4t8jnFg7yIYcc
	n3l0qet/IhOaqjEaobiAyUhvkllg4sah407efQw==
X-Google-Smtp-Source: AGHT+IH6qejYFYzLFfLVD6k3oEhDOGZlO74HgLGZyOngpOwrm5/fMzkWfKnBiQDZb2i4WDXQH7yEcWFfcykF3xLlKzo=
X-Received: by 2002:a05:6870:2113:b0:277:e457:6057 with SMTP id
 586e51a60fabf-2883450e7bbmr1812527fac.44.1728484787192; Wed, 09 Oct 2024
 07:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <17b6b894-9b41-4e8c-a3a9-ce837797eac3@suse.com>
 <dee82fce-ffc8-493e-8d99-f5c3b321e5b3@suse.com> <a7b6fc68-a568-4b61-895d-c295ba3d3095@citrix.com>
 <b5b20a0c-7584-4885-b7b0-c4b1cba8c0bd@suse.com>
In-Reply-To: <b5b20a0c-7584-4885-b7b0-c4b1cba8c0bd@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 9 Oct 2024 15:39:36 +0100
Message-ID: <CACHz=ZjXdcBdPFwP4vNEgNMqaXfyJN1Ur_KVLfp4Y3zMs-J-VA@mail.gmail.com>
Subject: Re: [PATCH 1/7] byteorder: replace __u16
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2024 at 2:34=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 09.10.2024 15:20, Andrew Cooper wrote:
> > On 09/10/2024 10:21 am, Jan Beulich wrote:
> >> In {big,little}_endian.h the changes are entirely mechanical, except f=
or
> >> dealing with casting away of const from pointers-to-const on lines
> >> touched anyway.
> >>
> >> In swab.h the casting of constants is done away with as well - I simpl=
y
> >> don't see what the respective comment is concerned about in our
> >> environment (sizeof(int) >=3D 4, sizeof(long) >=3D {4,8} depending on
> >> architecture, sizeof(long long) >=3D 8). The comment is certainly rele=
vant
> >> in more general cases. Excess parentheses are dropped as well,
> >> ___swab16()'s local variable is renamed, and __arch__swab16()'s is
> >> dropped as being redundant with ___swab16()'s.
> >>
> >> With that no uses of the type remain, so it moves to linux-compat.h.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I'm unconvinced of the need of the separate ___constant_swab16(). I'm
> >> also unconvinced of the need for said constants (that even had casts o=
n
> >> them).
> >
> > There is a still-good series deleting the whole of byteorder/ and
> > replacing it with a few-hundred line single header.
> >
> > It is the second thing stalled on a governance change (prohibited
> > reasons to object to a change) which clearly no-one gives a damn about
> > fixing.  In fact double spite because it denied a good engineer his
> > first changes in Xen.
> >
> >
> > I don't particularly feel like trying to polish byteorder.  I'm incline=
d
> > to rebase+repost Lin's patches, at which point the majority of this
> > series simply disappears.
>
> I wouldn't mind you doing so, as long as that other series then progresse=
s.
> What I don't want to get into is the other series being stuck rendering t=
his
> one stuck, too. Then it would imo be better to take this one first, rebas=
e
> the other on top, and work towards it becoming unstuck (whatever that tak=
es;
> I have no recollection of what the issue was back at the time, all I reca=
ll
> is that, yes, there was such work at some point).
>
> Jan
>

I usually don't like stopping a series waiting for another series too.

In these mostly automated large changes instead of a manual rebase I
extract patches with "git format-patch", do the same automated replace
with sed/perl (like "s/\<u32\>/uint32_t/" and so on) and apply with
"git am".

My 2 cents.

Frediano

