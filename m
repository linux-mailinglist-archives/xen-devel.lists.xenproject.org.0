Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44959979C36
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 09:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799256.1209199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6Pk-0006Vq-GR; Mon, 16 Sep 2024 07:44:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799256.1209199; Mon, 16 Sep 2024 07:44:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sq6Pk-0006Su-Cq; Mon, 16 Sep 2024 07:44:52 +0000
Received: by outflank-mailman (input) for mailman id 799256;
 Mon, 16 Sep 2024 07:44:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wse+=QO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1sq6Pi-0006Ru-O6
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 07:44:50 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b2cd330-73ff-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 09:44:46 +0200 (CEST)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3e049185cfeso797159b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 16 Sep 2024 00:44:48 -0700 (PDT)
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
X-Inumbo-ID: 8b2cd330-73ff-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1726472687; x=1727077487; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmPqedV33wqJokiBOh7sauXbuqC6rA9+6TXEyLMFPx8=;
        b=JXmsvC2bqNDHQPfK9XGLSWTBOxZuACW2ty8N39Hzps4Zrmr1py+HjZg7Tm7/u/FT4s
         QL52skT6CInhcdEYxE4HJ7x7yL8sz/g57rOnzH6l2iYYlz/M04JAnri4KoRWEWtXTVYo
         0kiZpC0PN2yhPa1HShoLwIu+pIG+iBF3Kbims=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726472687; x=1727077487;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmPqedV33wqJokiBOh7sauXbuqC6rA9+6TXEyLMFPx8=;
        b=Rtlwcufn/KFDjh/zet7g7trXBSDVQOn4b821CtRwncz4FDtP0ebXFtH+627SuJqH88
         UQ8iL/r+zt46lrLMNtOF4eH8GWrqATSvCiytRW7YAcZuVIfUSbYyHeXbnbzbW3joF0un
         h5VvTfc0tt6xVrJ8qgagXOhRCEgCiB8Sol0yUfiNSrLDqSc2mNUZXDHnK7LZonwGICPQ
         Ivd7DBp/rjg6wXmha4luzOgfkeUl1wfzxwwEuKrAtc9dmUj18/M0zMyrL/lh2gho0iuG
         0IS7ucqDIXW9FqFytMyEiqj8hnJ9dkanf2C/GUgjCS2PALi8rt2YsRAfjZoEBHPWYk//
         rqTA==
X-Forwarded-Encrypted: i=1; AJvYcCWP4KFfMXuHczEnDcHOUFQy7WGRtOg6g1fGhFjdrd3XND6KYsRlRoPYhczf6gJMMwEiPlLz4koORS8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzDsWOFC0Mca7ifIKG1GJ59f8tmpufrwpKLqzMsxqOKCSYKxSuB
	dv6T8fo5W1JEucNILSVw7rbAduh6JCGCUyxIKopC0kldd2CGBIJ33+m0Bw8OPiY3xItOOXVd1S9
	fUyppMmExFaZi2w/ufEVHRfxRbf2vba1SnPfVQw==
X-Google-Smtp-Source: AGHT+IEQkg9sh/L04m8D5eAcLhRaGUJpAC+YGj0A9FLe3Rtuf2xagWbd2NRkD2kBkE0cqC8tITw0+uHuFTioq9Yb6oA=
X-Received: by 2002:a05:6808:14cf:b0:3dd:cc7:957c with SMTP id
 5614622812f47-3e07a0eee2bmr5814287b6e.8.1726472687356; Mon, 16 Sep 2024
 00:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240910161612.242702-1-frediano.ziglio@cloud.com>
 <20240910161612.242702-2-frediano.ziglio@cloud.com> <76d6d359-d856-4c31-b7ef-30084d7a735c@suse.com>
In-Reply-To: <76d6d359-d856-4c31-b7ef-30084d7a735c@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 16 Sep 2024 08:44:36 +0100
Message-ID: <CACHz=ZhLNc4xUcLxbvZ+1G_+Y1peYsOpQAgcihWuV7wZ8u=T9A@mail.gmail.com>
Subject: Re: [PATCH 1/3] x86/boot: Initialise BSS as soon as possible
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 15, 2024 at 7:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 10.09.2024 18:16, Frediano Ziglio wrote:
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -231,6 +231,27 @@ __efi64_mb2_start:
> >          /* VGA is not available on EFI platforms. */
> >          movl   $0,vga_text_buffer(%rip)
> >
> > +        /*
> > +         * Align the stack as UEFI spec requires. Keep it aligned
> > +         * before efi_multiboot2() call by pushing/popping even
> > +         * numbers of items on it.
> > +         */
> > +        and     $~15,%rsp
>
> You don't use the stack below, so it's not clear if/why this needs
> moving. If it does, please add the missing blank after the comma
> (like you nicely do everywhere else).
>

Fixed the blank. The reason is more clear if you look at the last
commit in the series, at least for the EFI part. For the BIOS/PVH part
is less clear, but the rationale is the same. The commit came from a
larger series where BIOS/PVH is mainly written in C so there is more
clear.

> Apart from this there's the question on the precise placement of
> the calls - see respective comment on patch 2 (which I needed to
> look at first to have an opinion here).
>

I think you removed too much context, not clear what code you are
referring to, last hunk above is an "and" instruction.

> Jan

Frediano

