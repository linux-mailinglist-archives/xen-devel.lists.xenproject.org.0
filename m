Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D845698B8A7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 11:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807913.1219640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZV7-0006WD-Jn; Tue, 01 Oct 2024 09:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807913.1219640; Tue, 01 Oct 2024 09:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svZV7-0006U4-Fu; Tue, 01 Oct 2024 09:49:01 +0000
Received: by outflank-mailman (input) for mailman id 807913;
 Tue, 01 Oct 2024 09:49:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i7H1=Q5=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1svZV6-0006Ty-V2
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 09:49:00 +0000
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [2607:f8b0:4864:20::c2c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 613b992a-7fda-11ef-99a2-01e77a169b0f;
 Tue, 01 Oct 2024 11:48:59 +0200 (CEST)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-5e5568f1baaso2977111eaf.2
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2024 02:48:59 -0700 (PDT)
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
X-Inumbo-ID: 613b992a-7fda-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1727776138; x=1728380938; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2OPky1tKXNS30zPjRBLklo1lhvYkAIlQSZFkaFbs0k=;
        b=M4MGkS+R4tQzTjPtH+SQNZeIcpyzrYuZueO76dq+fQtmnmYP3v6ihqGLAL4PZDhmmr
         N2Hi94xxl/sT1ox5wfOUIMEv5vI5giP7BJiZdkaH4yJ1R9L8auzW0KPa7HrRB+baCeic
         F3OodTo7WubOKVGuSDW14+efz/o1BbIFr+Rxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727776138; x=1728380938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2OPky1tKXNS30zPjRBLklo1lhvYkAIlQSZFkaFbs0k=;
        b=uQ941F3pyuY184cOcPrYKG2IyC1rrOWLck1OaJGzjtGvbeLoHngwR1vQQgme0SFbe6
         TrzOfmc6EuMCdWPe3HmrrKzJIIaQ9V9CX/i6PMr7EkPtIPYsN+ru7EKcFZRPQrGdTTGs
         FY0jtY5kmjHEHDRQfKESoe9KCzzN8S2FOtfV4hNsjixmFt9wuzAqc4vI5WKZLQX8bcJo
         V+nXMySeGmTIkeeTqyor65K+KvoA1qHK0b+y+2HPtm8fOpSJ0LQnhRFkgfgbt5vgHP6D
         dwL6wlGbQH6XoeD30yiNv2Z8pESnpHQpTGk9mI1uiJTtqxbymfMUg4okfqx7oWmjMt3Z
         +zZA==
X-Forwarded-Encrypted: i=1; AJvYcCXFmxgPSZ3Ikg2b+vph7nTOKoi8VqkvTAI8uZBD0GN7P+g/nBD5Y7Yo/JOlLSOkPPYMU0GqFhjw0Jk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxAReZjFV8l+gAMGawH2ZRtdeP4YS+5KO0ACVHwFGahV5a5HULU
	lthEscZdB7lAjgAfA82Ok0OMgg59jxujLlTcBwzGBfcTLslaJ4eJZKa139LFwzLul5kpy1qjxHj
	PW4QP+nIqsEUdP3mOw7xJbs8lqykH/xNSOoewhQ==
X-Google-Smtp-Source: AGHT+IEC8eyPCTOfETpac4uXI7wfoo5x9sd7eq8Ty8BPQ4QQRkX4oR2aBgriHj3kLZO69nRZrZ9K0tHj5OplVHxsJew=
X-Received: by 2002:a05:6820:829:b0:5e1:d741:6f04 with SMTP id
 006d021491bc7-5e7727a2584mr9625645eaf.3.1727776137724; Tue, 01 Oct 2024
 02:48:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240926092109.475271-1-frediano.ziglio@cloud.com>
 <20240926092109.475271-3-frediano.ziglio@cloud.com> <e17b2afc-3647-4472-9d37-1510b40ff23d@suse.com>
 <CACHz=ZhtYik3p4z2mc1PYG9M68Mwap68_DdoE7MWksW0VW+BTw@mail.gmail.com> <b2a8b468-5745-4f58-bb86-721ea055c1b1@suse.com>
In-Reply-To: <b2a8b468-5745-4f58-bb86-721ea055c1b1@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 1 Oct 2024 10:48:46 +0100
Message-ID: <CACHz=ZhhpU2S1Nt2EW-LL=r8fZSbCLMhFMWD2SWvPP094gc1rQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/3] x86/boot: Rewrite EFI/MBI2 code partly in C
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	"Daniel P. Smith" <dpsmith@apertussolutions.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 1, 2024 at 9:52=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wrot=
e:
>
> On 01.10.2024 10:35, Frediano Ziglio wrote:
> > On Mon, Sep 30, 2024 at 4:51=E2=80=AFPM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >> On 26.09.2024 11:21, Frediano Ziglio wrote:
> >>> @@ -243,7 +234,7 @@ __efi64_mb2_start:
> >>>          /*
> >>>           * Initialize BSS (no nasty surprises!).
> >>>           * It must be done earlier than in BIOS case
> >>> -         * because efi_multiboot2() touches it.
> >>> +         * because efi_multiboot2_prelude() touches it.
> >>>           */
> >>>          mov     %eax, %edx
> >>
> >> I think this MOV wants to gain a comment, now that ...
> >>
> >>>          lea     __bss_start(%rip), %edi
> >>> @@ -252,36 +243,30 @@ __efi64_mb2_start:
> >>>          shr     $3, %ecx
> >>>          xor     %eax, %eax
> >>>          rep stosq
> >>> -        mov     %edx, %eax
> >>
> >> ... this one's going away.
> >>
> >
> > What about
> >
> > diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> > index 89b5e2af88..6fa6ea93e5 100644
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -231,12 +231,14 @@ __efi64_mb2_start:
> >          */
> >         and     $~15, %rsp
> >
> > +       /* Move away magic number, we need it later but we need to use =
%eax */
> > +        mov     %eax, %edx
> > +
> >         /*
> >          * Initialize BSS (no nasty surprises!).
> >          * It must be done earlier than in BIOS case
> >          * because efi_multiboot2_prelude() touches it.
> >          */
> > -        mov     %eax, %edx
> >         lea     __bss_start(%rip), %edi
> >         lea     __bss_end(%rip), %ecx
> >         sub     %edi, %ecx
> >
> > ??
>
> Fine with me. Maybe s/Move away/Save"?
>
> Jan

Done.

One last though. Do you think I should now rename
xen/arch/x86/efi/parse-mbi2.c file ?

Frediano

