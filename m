Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA23A9A4051
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 15:46:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821943.1235925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nJ0-0001EC-78; Fri, 18 Oct 2024 13:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821943.1235925; Fri, 18 Oct 2024 13:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1nJ0-0001Bc-3m; Fri, 18 Oct 2024 13:46:14 +0000
Received: by outflank-mailman (input) for mailman id 821943;
 Fri, 18 Oct 2024 13:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SHZo=RO=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1nIz-0001BU-Cb
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 13:46:13 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55435727-8d57-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 15:46:11 +0200 (CEST)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7181b86a749so294398a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 06:46:11 -0700 (PDT)
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
X-Inumbo-ID: 55435727-8d57-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729259170; x=1729863970; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTPsjIABa3LCJZi7qTqNcr3SqKOQmVAhVEFbou9H1fA=;
        b=jOtZOy0uDVcvuCMiwahVKWGoFUhpQePVYmi+Oc/DUNUoxl8O8GdAkE5GfXnT6Klqn1
         15kS+EclboCqhRDqDJIPb0lb707yyuIhv/aQjNmQ+0LLi5nDUU9cyeRhJAu9wRCyuvJp
         AxntMLVank2n4XaMf286tQNw3QxaYvN6IChmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729259170; x=1729863970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTPsjIABa3LCJZi7qTqNcr3SqKOQmVAhVEFbou9H1fA=;
        b=hJdit/NoLsK6Fj9+2wLluV7Kg7Hy/c1E9Tda7KLxDQ6nGzUnF41XdppKKFUihOOU0h
         9ZDLkBMHwb3A8vjudqFoSqKOwvY0mE4sVZ0XXjf3OTjxnacxDvCDalMOiNBUltJOTVAw
         7C0ZhZTrRcyvDpKsqhf6nWoLlVpEesmsWesAUFcAoW20KAXmi2PP31d+a3TCNawZasE0
         iO9PqKQXl7NjVDfkBBZLzQm14BYsldbuXBAGf4rwWOKK0dZ4iD1JwGcm4Dh/Fmu8kzFz
         GhIPfNqelHQr2/7WF6x//8k6a+T9q4Tcq62d0opdsNGlcHf+0rTp3NgN+wfg/ZRf+PIF
         f8hg==
X-Gm-Message-State: AOJu0YxavG2X2EKsGgjGCNqJY3KyWltEjTMUYJqwDOhYkpvly5avnc8a
	d6HQF/o/FIgYUI7jB5amLV78s6WgswDqAlmSP0d80L24Mbwewk4nfsGAvVuoBnvCDjVIpvQC9VR
	CT4e9jiLkW/KR81GwT8dZ8BQ3ARm/UAG9NqwWtQ==
X-Google-Smtp-Source: AGHT+IHWFzmT6jYKq32x6ruud7sJfwiOF6e3UXJmGBhSQjtEj4GkO49rTsjatGiDCOBjxHJ0U/zsptelDQAYsn7nBPw=
X-Received: by 2002:a05:6830:670c:b0:710:fef4:3c92 with SMTP id
 46e09a7af769-7181a89f672mr2263847a34.21.1729259169867; Fri, 18 Oct 2024
 06:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com> <ZxJJZvOCQLzU_Q5s@macbook.local>
 <CACHz=Zif6tirzF3QSLYLOvDFuaE3o9=Cu+ybm4ns7vNkAKCROg@mail.gmail.com> <ZxJbmIU4OUmeO3xq@macbook.local>
In-Reply-To: <ZxJbmIU4OUmeO3xq@macbook.local>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 18 Oct 2024 14:45:59 +0100
Message-ID: <CACHz=ZiHp40-MkkbfnnNi2yQaB89_PA9VU_cLrTX4LHY6o7j6w@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 1:59=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com> wrote:
>
> On Fri, Oct 18, 2024 at 01:48:27PM +0100, Frediano Ziglio wrote:
> > On Fri, Oct 18, 2024 at 12:41=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pa=
u@citrix.com> wrote:
> > >
> > > On Thu, Oct 17, 2024 at 02:31:19PM +0100, Frediano Ziglio wrote:
> > > > +#define DECLARE_IMPORT(name) name =3D . + (__LINE__ * MULT)
> > > > +
> > > > +ENTRY(dummy_start)
> > > >
> > > >  SECTIONS
> > > >  {
> > > >    /* Merge code and data into one section. */
> > > > -  .text : {
> > > > +  .text TEXT_START : {
> > > > +        /* Silence linker warning, we are not going to use it */
> > > > +        dummy_start =3D .;
> > > > +
> > > > +        /* Declare below any symbol name needed.
> > > > +         * Each symbol should be on its own line.
> > > > +         * It looks like a tedious work but we make sure the thing=
s we use.
> > > > +         * Potentially they should be all variables. */
> > >
> > > The style is wrong for the opening and closing comment delimiters.
> > >
> > > I think it would be best if this was written in a more natural style.
> > >
> > > /*
> > >  * Any symbols used should be declared below, this ensures which
> > >  * symbols are visible to the 32bit C boot code.
> > >  */
> > >
> >
> > But why to remove the "Potentially they should be all variables.".
> > Surely something not written is more clear than something written, but
> > on the other way it carries no information.
>
> I'm not sure I understand why this is helpful: either they are
> mandated to be only variables, and hence the "potentially" is wrong, or
> they are not, in which case I don't see why spelling a desire for they
> to be only variables is helpful if it's not a strict requirement.
>

As normal, rules often have exceptions. Most of the functions (so
code) in Xen is 64 bit, so you don't want to use them. However, saying
you have a function in head.S written in assembly for 32 bit (or any
other functions written for 32 bit), you want the possibility to call
it. For instance you could export from head.S the function to output
to serial in the future.

About variables... are all variables fine to be accessed from these
functions? Probably yes if they have no pointers in them. If they have
pointers... that's another matter. Does the pointer have relocation?
Is it going to be used at the final defined program location or only
during initialization? To make an example, you could override a NULL
pointer (that is, without relocation) to a current symbol, if this
pointer is used after Xen is moved into its final position it will
become invalid. If, on the other hand, the pointer had relocation
potentially it will be automatically be relocated.

> Thanks, Roger.

Frediano

