Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 125A3987730
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 18:04:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805682.1216846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqxn-0004bm-VR; Thu, 26 Sep 2024 16:03:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805682.1216846; Thu, 26 Sep 2024 16:03:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stqxn-0004aG-Sp; Thu, 26 Sep 2024 16:03:31 +0000
Received: by outflank-mailman (input) for mailman id 805682;
 Thu, 26 Sep 2024 16:03:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GedV=QY=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1stqxl-0004aA-Vk
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 16:03:30 +0000
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [2607:f8b0:4864:20::c31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de586d32-7c20-11ef-a0ba-8be0dac302b0;
 Thu, 26 Sep 2024 18:03:29 +0200 (CEST)
Received: by mail-oo1-xc31.google.com with SMTP id
 006d021491bc7-5e1c49f9b9aso489872eaf.2
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 09:03:29 -0700 (PDT)
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
X-Inumbo-ID: de586d32-7c20-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727366608; x=1727971408; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocI98GCQtsPEI4zgmJX4GcppYV+CQKi48fAPsGMFMgM=;
        b=l9Xw0JP4KPyA436BcycmuN9EMLz1Ju08BVnU+S4cmEMMQiSL0rdGr51E5R5YkJtDP6
         HAMcnfk8euTSIfVAkBqGbvebCEe0fvqAkegLE6qZuOIAOvkxzk224IH3r/r+DoCgciAo
         BJN++iuoZqvWNc/17xIMIx85xDUMEOXJYmrwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727366608; x=1727971408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocI98GCQtsPEI4zgmJX4GcppYV+CQKi48fAPsGMFMgM=;
        b=EKZlsk8L1uuwK2fayle1cvbD3k63R85d5wv0E9gK9bzYrnJgliGDGdrtTDpou//8DT
         3w7d+4U4VGKRICcODjb6FCXG/qTwxd0W51jQPR0bAzmatPbr3G7lvlyKczOZklipoAgC
         5w4JO4Lu7S99B3mNzl3FObmVBLBHwne/112wmJn8voZYWsEsvoa8HbpLaZzGf+e7ue0g
         18aiWSXXgfzSZZr8hCjMKjhdBcvmzWARn/HqQ7ce0k0gSZ2zYg2lCXJP4gCuXp+B00iQ
         ltxlw1z/DGZfVXPQ9gT+tzv3DI9G7LH+kACaAsE3lZpCco5sMopt3puwJG5d6Z3EeD5u
         JkaA==
X-Forwarded-Encrypted: i=1; AJvYcCULU2KSc8dRo4vK+W+uvCPdRc7pEIJPySfVmlgguarVnbGPNCcsqfjeszwL9HfrVoPeMdtrxq4pOSw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTQPnlDgWNiu1tR0JHV2Hj28U6r4ja0QAnqlgVbgAGQLzKDJ6G
	GM1UP3L+S9voym66wzeL0ue2AlHm8zJt6QTTsvMnG/U5bVHZb0kO1iijx/f39MC5H4gRObkpmjs
	VP96w2zjeXQCEM6dILyQYJz8pTMNvLsz/klLDsw==
X-Google-Smtp-Source: AGHT+IEqp+heVLAr1NxfJlzRqHpCDsBxuuOZcKatzgK8IhtbzQ7jT0sDdQKjrfoV2Czr2hVfhZeNSqjxE+rwwLq/4ng=
X-Received: by 2002:a05:6870:9613:b0:270:4219:68fe with SMTP id
 586e51a60fabf-287109f5cc7mr326641fac.1.1727366607735; Thu, 26 Sep 2024
 09:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240926134823.688372-1-frediano.ziglio@cloud.com> <63129694-ace9-4b55-92c2-7cfb8a2c1386@suse.com>
In-Reply-To: <63129694-ace9-4b55-92c2-7cfb8a2c1386@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 26 Sep 2024 17:03:16 +0100
Message-ID: <CACHz=Zj0K+uYt7h80p3Crkom-VNoLbH_4Wt04jdNDYs28tApdg@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/video: Convert source files to UTF-8
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2024 at 3:46=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 26.09.2024 15:48, Frediano Ziglio wrote:
> > --- a/xen/drivers/video/font_8x14.c
> > +++ b/xen/drivers/video/font_8x14.c
> > @@ -2059,7 +2059,7 @@ static const unsigned char fontdata_8x14[FONTDATA=
MAX] =3D {
> >      0x00, /* 00000000 */
> >      0x00, /* 00000000 */
> >
> > -    /* 128 0x80 '=C5=B8=CB=86 */
> > +    /* 128 0x80 '=C3=82=C5=B8=C3=82=CB=86 */
>
> I'm unconvinced this representation is any better. The data that follows
> right here clearly means '=C3=87', not '=C5=B8'. Which is U+00c7, not U+0=
080. I
> don't have my Unicode manual to hand, but I seem to vaguely recall that
> U+0080 doesn't really have a glyph associated with it.
>
> Of course I'm also uncertain whether my mail UI actually correctly decode=
d
> the transfer encoding (base64) that you now used. In any event I'm unsure
> of associating the upper 128 code points with any particular characters
> (glyphs). We don't render UTF-8 to the console, and what those code point=
s
> mean is unknown until code page information is provided. I see the
> following options:
> 1) The glyphs represent what the bit patterns encode, encoded as UTF-8.

That was what I was trying to do.
I wrongly thought it was latin1, in reality looking at the font (why
not?) it's code page 437, so this commit is doing the right thing
https://gitlab.com/xen-project/people/fziglio/xen/-/commit/7ca512e8ae21bb02=
339ed7a1a78409827a08aea4.
Now... I'm trying to send the patch to the mailing list, which seems
easy, but I have to find the right combination of options, tools get
very easily confused about (that's why I send the link of the commit,
at least people can take a look and see that is correct)

> 2) The glyphs are simply omitted for the upper half of the range.
> 3) We purge any encoding of particular glyphs for the upper half of the
>    range and instead expand the upper 128 entries to some placeholders
>    when rendering (like e.g. the Windows font I'm looking at, using a
>    boxed question mark).
>
> Jan

Trying to get the right email without spamming the ML.

Frediano

