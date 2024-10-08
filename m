Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E010A994482
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2024 11:42:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812955.1225708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6j3-0003Lw-FR; Tue, 08 Oct 2024 09:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812955.1225708; Tue, 08 Oct 2024 09:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sy6j3-0003JW-CL; Tue, 08 Oct 2024 09:41:53 +0000
Received: by outflank-mailman (input) for mailman id 812955;
 Tue, 08 Oct 2024 09:41:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r5fn=RE=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sy6j1-0003JO-JH
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2024 09:41:51 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b3cce37-8559-11ef-a0bc-8be0dac302b0;
 Tue, 08 Oct 2024 11:41:50 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c8a2579d94so6359635a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 08 Oct 2024 02:41:50 -0700 (PDT)
Received: from localhost ([52.166.251.127]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e0597824sm4100676a12.15.2024.10.08.02.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 02:41:49 -0700 (PDT)
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
X-Inumbo-ID: 8b3cce37-8559-11ef-a0bc-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728380510; x=1728985310; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0GvKrZlY5f5H03b8MI4AuWciNIlH5iRRgXM7eyGylA=;
        b=B2nqKaf53vPrdC+eT3n78GKxvzip8mcSsX1ZzFB8ZYdsjpsEvdtUb6E8e4qU0jEKDy
         7PKTIKqQjMxVccJlTryDjMsER7QDXpqiwRRAWQnjjuRhBlGbUat/o6jzWIbwzITLjSiQ
         PYTgWTPbTM5aXch9qv0xLZO/l9PX5ssI83hCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728380510; x=1728985310;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r0GvKrZlY5f5H03b8MI4AuWciNIlH5iRRgXM7eyGylA=;
        b=mr9JwgSEqKSq+IaN5zr7UZnBB0RM1Em1ldVXj0jFtmlyEZ/oGUbbNtwaF8fgVnrlbk
         j/GP62wQsrK3anPUKfCaQ6BxB+7eMheGb8XjCH9ubxR2G6LxuPpIQjZdKQNPNcjburEM
         41YjG4T2WJpNl/oH47UWtpMXMoN7Ai/2JvFJS6CZC+s0+zP5qpmr2VooTiYBj8dU8l6X
         HoAOjEEgIhe43kfX9sTbs5l+Pq+XI0zrq2iMp71UlwNkk37ksjpKfOdfa/uM6SS6Uir1
         QUCTZviA+IvX7AI3fu+Op2DiC07TYIcpyoivT3rvEeBE0wAeT9kCp2vmKO2EbVsH/0GD
         J0qQ==
X-Gm-Message-State: AOJu0YywD03j2JHrxSMlO4UgESIgEol/yA+fr0Io8L76dcFcGjifpK9a
	rpu8mGr3wNJNapEvFWxog0cI7A73pBMJ929V7trnMc4AdCs3c5lofxgTGIKJ20c=
X-Google-Smtp-Source: AGHT+IGYPm2+WwJi4qMjy1LjvdVuA8778kZtUKRf7RblPML10DTazPvGtm4ahrSoAmdfoDIv1620bQ==
X-Received: by 2002:a05:6402:3811:b0:5c8:9f44:8145 with SMTP id 4fb4d7f45d1cf-5c8d2e8769dmr12600073a12.26.1728380510074;
        Tue, 08 Oct 2024 02:41:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Oct 2024 10:41:49 +0100
Message-Id: <D4QBR8J2LHN2.CY0Y57DBOKZC@cloud.com>
Cc: "Xen-devel" <xen-devel@lists.xenproject.org>, "Jan Beulich"
 <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>,
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v4 1/2] x86/fpu: Combine fpu_ctxt and xsave_area in
 arch_vcpu
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Frediano Ziglio" <frediano.ziglio@cloud.com>
X-Mailer: aerc 0.18.2
References: <20241007155240.17186-1-alejandro.vallejo@cloud.com>
 <20241007155240.17186-2-alejandro.vallejo@cloud.com>
 <CACHz=ZhGt7Lw5vHY-Ykc0_ouutMnurhWg2AQTkUF1MYXyp=fRw@mail.gmail.com>
In-Reply-To: <CACHz=ZhGt7Lw5vHY-Ykc0_ouutMnurhWg2AQTkUF1MYXyp=fRw@mail.gmail.com>

On Tue Oct 8, 2024 at 8:47 AM BST, Frediano Ziglio wrote:
> On Mon, Oct 7, 2024 at 4:52=E2=80=AFPM Alejandro Vallejo
> <alejandro.vallejo@cloud.com> wrote:
> >
> > fpu_ctxt is either a pointer to the legacy x87/SSE save area (used by F=
XSAVE) or
> > a pointer aliased with xsave_area that points to its fpu_sse subfield. =
Such
> > subfield is at the base and is identical in size and layout to the lega=
cy
> > buffer.
> >
> > This patch merges the 2 pointers in the arch_vcpu into a single XSAVE a=
rea. In
> > the very rare case in which the host doesn't support XSAVE all we're do=
ing is
> > wasting a tiny amount of memory and trading those for a lot more simpli=
city in
> > the code.
> >
> > While at it, dedup the setup logic in vcpu_init_fpu() and integrate it
> > into xstate_alloc_save_area().
> >
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > --
> > v4:
> >   * Amend commit message with extra note about deduping vcpu_init_fpu()
> >   * Remove comment on top of cpu_user_regs (though I really think there
> >     ought to be a credible one, in one form or another).
> >   * Remove cast from blk.c so FXSAVE_AREA is "void *"
> >   * Simplify comment in xstate_alloc_save_area() for the "host has no
> >     XSAVE" case.
> > ---
> >  xen/arch/x86/domctl.c             |  6 ++++-
> >  xen/arch/x86/hvm/emulate.c        |  4 +--
> >  xen/arch/x86/hvm/hvm.c            |  6 ++++-
> >  xen/arch/x86/i387.c               | 45 +++++--------------------------
> >  xen/arch/x86/include/asm/domain.h |  6 -----
> >  xen/arch/x86/x86_emulate/blk.c    |  2 +-
> >  xen/arch/x86/xstate.c             | 12 ++++++---
> >  7 files changed, 28 insertions(+), 53 deletions(-)
> >
> > diff --git a/xen/arch/x86/x86_emulate/blk.c b/xen/arch/x86/x86_emulate/=
blk.c
> > index e790f4f90056..08a05f8453f7 100644
> > --- a/xen/arch/x86/x86_emulate/blk.c
> > +++ b/xen/arch/x86/x86_emulate/blk.c
> > @@ -11,7 +11,7 @@
> >      !defined(X86EMUL_NO_SIMD)
> >  # ifdef __XEN__
> >  #  include <asm/xstate.h>
> > -#  define FXSAVE_AREA current->arch.fpu_ctxt
> > +#  define FXSAVE_AREA ((void *)&current->arch.xsave_area->fpu_sse)
>
> Could you use "struct x86_fxsr *" instead of "void*" ?
> Maybe adding another "struct x86_fxsr fxsr" inside the anonymous
> fpu_sse union would help here.
>

I did in v3, and Andrew suggested to keep the (void *). See:

  https://lore.kernel.org/xen-devel/2b42323a-961a-4dd8-8cde-f4b19eac0dc5@ci=
trix.com/

Cheers,
Alejandro

