Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B3DC4793B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 16:37:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158476.1486829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITwr-0002EB-9k; Mon, 10 Nov 2025 15:36:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158476.1486829; Mon, 10 Nov 2025 15:36:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vITwr-0002Bc-6K; Mon, 10 Nov 2025 15:36:53 +0000
Received: by outflank-mailman (input) for mailman id 1158476;
 Mon, 10 Nov 2025 15:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=thpE=5S=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vITwp-0001x0-BV
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 15:36:51 +0000
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [2607:f8b0:4864:20::112b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 126a2ffc-be4b-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 16:36:49 +0100 (CET)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-787e7aa1631so12794817b3.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 07:36:49 -0800 (PST)
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
X-Inumbo-ID: 126a2ffc-be4b-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762789008; x=1763393808; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LOe8TgRpWBfAxvRIai6ZtiX6imJc01nwknvnRL9Z53M=;
        b=PxBoI6aM0UMjno0GnQZZ+1TggRP7eOj9GfCDBxQO+l9F0Cbhmj2EdVq0ByuG8bA+uu
         p8NlEH4w6OgjesLAwhWM0s/p1SkamlKh0tM2CLWrFhUVQaD9liWGtrQlVeprz2hxv8I2
         W0QLz4iB34OzDRmfip2HbMkAPYqoE9ZJPyVNmOz2ZLOkv1+IXidsl9zCDE/baUvKd5yQ
         /XtUCThCb/rDeAucUgvs+S3Afeo5GZhbxn3/s0UVtMWQdC0nxW4ILG1/1Aszvf0KSESg
         pOFfi2Rx/MUsnl44Tizkvble9tC1glFx/ce37nsvie8PExP372zefcXfK9QabWZP8KU+
         0AIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762789008; x=1763393808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOe8TgRpWBfAxvRIai6ZtiX6imJc01nwknvnRL9Z53M=;
        b=fqTraPZ0+4yKm0WlN/OaapkyAgAazCtWJ1IGU+ed/5G3AHtWeRKEeDGNTh2w4+hCnb
         GQsDevFp9TOIQusuwmV4FQpxncHnOUg3w9KX6gPmJk039ik+V4XRM6b4IKbIncA91hOU
         9lqQ8QLVAtgU68gN1gpRBZKnIAGiQanOTJ7+pauBxQrWV/7IAw0ccR0vWiuclv7nZKNL
         lGclZtbPN56jBaoCZOPF1rtvlVcl6KLJX+Ba6zayNRpkXvUzuHPV2snfvLiJ3DlcCGEP
         RKzJWH2o98gD+Q1L9uzQd7nFlIGvxkoxO/bkki9QzuFmx3wTk4dLnx63JJ7GqaaojZ2i
         +OHw==
X-Forwarded-Encrypted: i=1; AJvYcCU3xepJSMKFOaTVxmQ/p2/RreilyGaWxQ/6ZDt/Iyqnz3zhSahG76og50Rwa2xB6A9LhgfWLgWT+ls=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/XYJNa+O1GeGPmHel1Gi/1RA6M3wnox0YLTBJPlatXU6bBMuA
	k9lzpFqMIjFKV7576les8Q7P8DtkUVcuzVbjykkrkOnZpb2ln9WaeGxl2erx75xofL9kaFMzTXy
	yhSLPNUphIZzLWpWxd9mLqQXQpj/663g=
X-Gm-Gg: ASbGncvqMQhq90vBGXbNdMM5gSh+/nK70wyeX7av9gIM2ENqLU3mob6zC7E6OYRRkp6
	QnuvxnviicuOQBgdQwAfUU6M0D2CehPbq3qKWme/kWBwNaMt6LLondihN2PIgMzgjxyO82dNpyV
	PBuGdxLwvT/bMPDo8pN/WjoIq/0b61KFLYITE8usNVRvaMI3SaoLpKyXchhDHM6058KkkCqxccC
	MtD4cOrWAkEtGWY0pjbO+Mmx+G82MidN5FrZZWGJY6DhN1f2CRnMoIi5pLkPSfxceUTd3g=
X-Google-Smtp-Source: AGHT+IFKf/sVvsGa0qxdWATiL5+z4OSTuGLnneQ3dIkUSlbqUtDKNnwgKYKQa1KJjo50J5ZxQA/zeUBbAHR04Sx4xhY=
X-Received: by 2002:a05:690e:1697:b0:63f:a4ca:dc21 with SMTP id
 956f58d0204a3-640c9d60f05mr8902266d50.19.1762789008190; Mon, 10 Nov 2025
 07:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20251110125859.78124-1-frediano.ziglio@citrix.com> <55f0f1f2-3892-44fa-94d6-15e0e8513ef1@suse.com>
In-Reply-To: <55f0f1f2-3892-44fa-94d6-15e0e8513ef1@suse.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Mon, 10 Nov 2025 15:36:34 +0000
X-Gm-Features: AWmQ_bnZ7yUJlqdHBV99NVXmj8haUWjOKE1DEyza--C3eQq4G9FxeUrSOjeviW8
Message-ID: <CAHt6W4d3dJrmJ9DM-6Th+0YsUaJGH7Msvq_t6GpffJu7rALzbg@mail.gmail.com>
Subject: Re: [PATCH v5] xen: Strip xen.efi by default
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, Frediano Ziglio <frediano.ziglio@cloud.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Nov 2025 at 13:40, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 10.11.2025 13:58, Frediano Ziglio wrote:
> > --- a/xen/arch/x86/Makefile
> > +++ b/xen/arch/x86/Makefile
> > @@ -228,17 +228,21 @@ endif
> >       $(MAKE) $(build)=$(@D) .$(@F).1r.o .$(@F).1s.o
> >       $(LD) $(call EFI_LDFLAGS,$(VIRT_BASE)) -T $(obj)/efi.lds $< \
> >             $(dot-target).1r.o $(dot-target).1s.o $(orphan-handling-y) \
> > -           $(note_file_option) -o $@
> > -     $(NM) -pa --format=sysv $@ \
> > +           $(note_file_option) -o $(TARGET)-syms.efi
> > +     $(NM) -pa --format=sysv $(TARGET)-syms.efi \
> >               | $(objtree)/tools/symbols --all-symbols --xensyms --sysv --sort \
> >               > $@.map
>
> This part if fine with me now.
>
> > -ifeq ($(CONFIG_DEBUG_INFO),y)
> > -     $(if $(filter --strip-debug,$(EFI_LDFLAGS)),:$(space))$(OBJCOPY) -O elf64-x86-64 $@ $@.elf
> > +ifeq ($(CONFIG_DEBUG_INFO)_$(filter --strip-debug,$(EFI_LDFLAGS)),y_)
>
> This extra change looks correct to me, yet I wonder if doing it this way isn't
> fragile. If EFI_LDFLAGS wasn't set globally, but only for xen.efi, aiui this
> wouldn't work anymore.
>

Maybe, but it's not a regression of this patch, the same test was
present before, just using another syntax

> > +     $(OBJCOPY) -O elf64-x86-64 $(TARGET)-syms.efi $@.elf
> > +     $(STRIP) $(TARGET)-syms.efi -o $@.tmp
> > +else
> > +     mv -f $(TARGET)-syms.efi -o $@.tmp
>
> This, while I think I understand why you do it, looks somewhat odd. Plus the
> reason you do it is, like ...
>

Can you explain why "it looks somewhat odd" ?

> >  endif
> > -     rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> >  ifeq ($(CONFIG_XEN_IBT),y)
> > -     $(SHELL) $(srctree)/tools/check-endbr.sh $@
> > +     $(SHELL) $(srctree)/tools/check-endbr.sh $@.tmp
> >  endif
> > +     mv -f $@.tmp $@
> > +     rm -f $(dot-target).[0-9]* $(@D)/..$(@F).[0-9]*
> >  else
> >  $(TARGET).efi: FORCE
> >       rm -f $@
>
> ... (still) most of this, unrelated (and, as before, not mentioned at all in
> the description).
>

I will remove it for now.

> Jan


Frediano

