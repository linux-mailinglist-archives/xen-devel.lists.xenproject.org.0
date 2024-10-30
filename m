Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26F29B6132
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 12:16:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828098.1242920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66gO-00029B-Nu; Wed, 30 Oct 2024 11:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828098.1242920; Wed, 30 Oct 2024 11:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t66gO-00026y-LC; Wed, 30 Oct 2024 11:16:12 +0000
Received: by outflank-mailman (input) for mailman id 828098;
 Wed, 30 Oct 2024 11:16:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PXHf=R2=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t66gM-00026s-F0
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 11:16:10 +0000
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [2607:f8b0:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b1a5781-96b0-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 12:16:06 +0100 (CET)
Received: by mail-ot1-x335.google.com with SMTP id
 46e09a7af769-7181285c7c4so3447861a34.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 04:16:06 -0700 (PDT)
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
X-Inumbo-ID: 5b1a5781-96b0-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjozMzUiLCJoZWxvIjoibWFpbC1vdDEteDMzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjViMWE1NzgxLTk2YjAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjg2OTY2LjcxMDEyMSwic2VuZGVyIjoiZnJlZGlhbm8uemlnbGlvQGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730286965; x=1730891765; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K9Y79gcAUcYKBc3ZfshkScL+lq0Ehfv9KuuKW2ZFlN0=;
        b=MMnroGZYjdLFNphCIr+9gjbfkJ+UhBpiiJ1tboX3ucwv5CELL2AfXqLHc4OWEBE3ZB
         Sc6MHZE2KIG8g2SjA73RqhKFzkxb3cW5VPQBLnqyGpC2+0gdby82bjaq5PlMVqJ7t9Wo
         AK2kWM6XfTkJ98XdprGUN/eCiNqOUJFFbVRC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730286965; x=1730891765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K9Y79gcAUcYKBc3ZfshkScL+lq0Ehfv9KuuKW2ZFlN0=;
        b=xQK8Waj+VDpuG0jVy/vxhNWqeMCkX3koRxbLJn7/hwu3tROWMVU7WlOhitbK2mLjA+
         9+a3c4LsE5Q2Bi7negZwkTWAagNJzsooA9R51FFiJnFfDBCnWLvf37l2b3q/tyTGBabX
         ZbEEpDvQVFefJKCt3hsCJ4pXeG7vkjap8/6+SWXw+8Zbc6w0Y3Af0M4/jXcNo0AE5q8Y
         1f30nkFXUEa6p9uO/kZB1PnJGwugaJi7STZyC2HWckSfcqgNi+jGRt5HdvOuPJfYu7oR
         rs1st/enO4Mly8sqYO4ScypOYFykvA36TfduVihHjsnkrlGImg6YI7ydzfM5jbEFDg2K
         /3NA==
X-Forwarded-Encrypted: i=1; AJvYcCWxkbCRaxSEBa7gaAZBvTPmVaKL3mznv4GTAidey63dhjpxG20ey/7TpISo55r9GJhDcTs7CWkQKQA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqSjDE1WXKGQJ1jrONMviTaHISZzQ6bqxZNQ34Jg3ItIIekDbz
	GOJOkg26VCTSkwSHSIn1Ni0Lx+Dd/FV91J48MuJDt9SnJfQ0ORVXaOQIi1piw/a+NclndmGanxe
	v0YxSCqvfwJVwilWPKggRd5R7lxfxIeOLPQvSfg==
X-Google-Smtp-Source: AGHT+IFL/uG9aoX3Fw99wBeKlrXTB6yz0+oT2vuvxW6oi+Z2kOiYV05ui/prx15U99TPSXjqo+2SIrOMWtENuaKTayE=
X-Received: by 2002:a05:6830:3806:b0:717:fbc7:e3b3 with SMTP id
 46e09a7af769-71868326382mr12739206a34.20.1730286965273; Wed, 30 Oct 2024
 04:16:05 -0700 (PDT)
MIME-Version: 1.0
References: <20241030104406.2173357-1-frediano.ziglio@cloud.com> <1fa03cb0-ded1-4904-8830-f3feefecc404@suse.com>
In-Reply-To: <1fa03cb0-ded1-4904-8830-f3feefecc404@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 30 Oct 2024 11:15:54 +0000
Message-ID: <CACHz=Zh04AhAwdhYY=i4DecvJbPMF770PE6SkLG+LzQLxueOMQ@mail.gmail.com>
Subject: Re: [PATCH] x86/setup: Make setup.h header self contained
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 10:59=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 30.10.2024 11:44, Frediano Ziglio wrote:
> > The header uses rangeset structure typedef which definition
> > is not included.
>
> And it doesn't need to be. For
>
> int remove_xen_ranges(struct rangeset *r);
>
> we don't need ...
>
> > --- a/xen/arch/x86/include/asm/setup.h
> > +++ b/xen/arch/x86/include/asm/setup.h
> > @@ -2,6 +2,7 @@
> >  #define __X86_SETUP_H_
> >
> >  #include <xen/multiboot.h>
> > +#include <xen/rangeset.h>
> >  #include <asm/numa.h>
> >
> >  extern const char __2M_text_start[], __2M_text_end[];
>
> ... this, a mere
>
> struct rangeset;
>
> forward decl will suffice.
>
> Jan
>

It's true, but for the same reason, we could avoid including
"xen/multiboot.h" and use "struct module" instead of "module_t".

Frediano

