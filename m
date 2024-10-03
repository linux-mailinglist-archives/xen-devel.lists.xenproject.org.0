Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DECA98F328
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 17:49:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809604.1222021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swO4K-0004aM-GV; Thu, 03 Oct 2024 15:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809604.1222021; Thu, 03 Oct 2024 15:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swO4K-0004YS-Cz; Thu, 03 Oct 2024 15:48:44 +0000
Received: by outflank-mailman (input) for mailman id 809604;
 Thu, 03 Oct 2024 15:48:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xwa6=Q7=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1swO4I-0004YM-VH
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 15:48:42 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6ccd6f4-819e-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 17:48:41 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d6ac24a3bso228687166b.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2024 08:48:41 -0700 (PDT)
Received: from localhost ([213.195.117.215]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99104d405bsm99336666b.209.2024.10.03.08.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 08:48:40 -0700 (PDT)
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
X-Inumbo-ID: f6ccd6f4-819e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727970521; x=1728575321; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jGSJdK8dZ+Zejs0OmL22LSsmE9M9fS2SaAN5fEv9f4w=;
        b=bv+EVg9E4J4Q0xfBFMtIcYIjaMgfMPN77hVnDDfRVO+Uix46LOKKEbrpfKNyt9ORDJ
         Sfg6H2UzHeVszQz0dRXap1JSXHP+knFMuhWAk0uKGSCx+/JhlgeGvn75uGiF9uvQVjoQ
         G6L8+0+aZA/jjfT43krUAkXeJLmDdxm/qdb74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727970521; x=1728575321;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGSJdK8dZ+Zejs0OmL22LSsmE9M9fS2SaAN5fEv9f4w=;
        b=T0tRKr1a/5GVZM7xM4WQfGdLcLDvS1KHabZDL7Nvm1v3CJsAZ37qG1wJqlyhaqIzNH
         TzYR/+QyTpaH1tRrf9tw7XWM+IEwAoIRQwWQDkWH8eAQ0Jks+i0hz4TYRMpLB1dMleZU
         5Hb77fba0FKEPcYvzlUbg4+qhaOvGzNp/LLW//gwZ2Q3YSbDPra7aZYQRTjMQeRokYKy
         xfKearbW8OpoCpwNJbMnnEyoyhWuDS7lCSEdIoaq3LXlbp3h+/Sp6BmG217rZhrsObRW
         0T4gFPnYN0n4BCtEhEzSvLNwDbwFtS9gVmpEL4ncrvYsPxbfwCInBhze1TD8sPbxLPzh
         Djxg==
X-Forwarded-Encrypted: i=1; AJvYcCV0sqPE2EOLzVSHfvT7L8zfYsL7StGrvln5Z9S63Ga65KQaGUOp+a8Ro/ibmEHN3F/9+FXT6LeTKKE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgEqJgzsM5lmERoBlptMQnPy3SabR4/tDsDnDPnAaHtJAf7opT
	rYVz4jt0Uq9irDliLaKNXWcWB38Mep2Oo7Xlon+gd3KLzEBJADkQA+gUzHGaol5oE8CPpxXUw52
	C
X-Google-Smtp-Source: AGHT+IF7Ecf4sw1eeyvF0gT1BkMVmqZk1aQTFk7QFGgMcD15aZWPfaix0HWa7lPp8iHG0cMS5cic3A==
X-Received: by 2002:a17:907:9488:b0:a8b:58e3:ac1f with SMTP id a640c23a62f3a-a990a053f56mr413595366b.12.1727970521161;
        Thu, 03 Oct 2024 08:48:41 -0700 (PDT)
Date: Thu, 3 Oct 2024 17:48:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH] x86/boot: Don't use INC to set defaults
Message-ID: <Zv681_sK3WQ4xYy9@macbook.local>
References: <20241003145810.2217075-1-andrew.cooper3@citrix.com>
 <CACHz=ZhDuQd5CGY+05dCciu7K1xFKwpN1NORbqHdG4wijivzMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHz=ZhDuQd5CGY+05dCciu7K1xFKwpN1NORbqHdG4wijivzMQ@mail.gmail.com>

On Thu, Oct 03, 2024 at 04:42:23PM +0100, Frediano Ziglio wrote:
> On Thu, Oct 3, 2024 at 3:58 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >
> > __efi64_mb2_start() makes some bold assumptions about the efi_platform and
> > skip_realmode booleans.  Set them to 1 explicitly, which is more robust.
> >
> > Make the comment a little more consice.
> >
> > No practical change.
> >
> > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > ---
> > CC: Jan Beulich <JBeulich@suse.com>
> > CC: Roger Pau Monné <roger.pau@citrix.com>
> > CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
> > CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> > CC: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> >  xen/arch/x86/boot/head.S | 10 ++++------
> >  1 file changed, 4 insertions(+), 6 deletions(-)
> >
> > diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> > index d1856d8012c9..af776c201a15 100644
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -279,14 +279,12 @@ __efi64_mb2_start:
> >          pop     %rbx
> >          pop     %rax
> >
> > -        /* We are on EFI platform and EFI boot services are available. */
> > -        incb    efi_platform(%rip)
> > -
> >          /*
> > -         * Disable real mode and other legacy stuff which should not
> > -         * be run on EFI platforms.
> > +         * efi_multiboot2_prelude() is happy that we're on EFI platform.  Skip
> > +         * the BIOS initialisation path.
> >           */
> > -        incb    skip_realmode(%rip)
> > +        movb    $1, efi_platform(%rip)
> > +        movb    $1, skip_realmode(%rip)
> >
> >          /* Jump to trampoline_setup after switching CPU to x86_32 mode. */
> >          lea     trampoline_setup(%rip),%r15
> >
> > base-commit: eb21ce14d709ef0c0030d0625028a4868c81126f
> 
> Reviewed-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.

