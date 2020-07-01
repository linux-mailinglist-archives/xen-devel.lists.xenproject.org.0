Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B742F2112E2
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 20:40:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqheG-0005Yk-7u; Wed, 01 Jul 2020 18:39:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8lOf=AM=kernel.org=luto@srs-us1.protection.inumbo.net>)
 id 1jqheF-0005Yf-6J
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 18:39:55 +0000
X-Inumbo-ID: 415c60bc-bbca-11ea-875d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 415c60bc-bbca-11ea-875d-12813bfff9fa;
 Wed, 01 Jul 2020 18:39:54 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9FEE0208C7
 for <xen-devel@lists.xenproject.org>; Wed,  1 Jul 2020 18:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593628793;
 bh=BzgN9CdkNj8KsNJpO6Dp3dgk25B6SZxEFrbbFo9+dlk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=EekpatgCfXAY5PVIXJOXKjXre1Wyt5kLnk69xj79naKsliUjFBna4Am1jKxDJ1RUB
 YwgGo3BT2S3Rx2ybuQVvOdWWxVpkyGDwgeTCGh2QZeVh0VyaK5E3Db8ddZOCtW/e4V
 jqfSmiN8gcKG4aikDeyjscuKc7uS8UTF14Y94hyM=
Received: by mail-wr1-f51.google.com with SMTP id z15so13904765wrl.8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2020 11:39:53 -0700 (PDT)
X-Gm-Message-State: AOAM530IQzHyoF1amt2qVa00BdyyzlBu6JWNtYNh5Pi21kRglHvKux42
 1sblMrkSrXt+AWtMR9X7cA6nChgsOfWVWZzNlQcHMA==
X-Google-Smtp-Source: ABdhPJxL9r2ocTMGAnClzir8rROoW17dgBhZ2sKyXqCKyH9ofutXZA7VisI5aNG7X5iBtvuS5HHHhEDpobjJAmSLQgA=
X-Received: by 2002:a5d:458a:: with SMTP id p10mr27429972wrq.184.1593628792155; 
 Wed, 01 Jul 2020 11:39:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593191971.git.luto@kernel.org>
 <947880c41ade688ff4836f665d0c9fcaa9bd1201.1593191971.git.luto@kernel.org>
 <CAMzpN2iW4XD1Gsgq0ZeeH2eewLO+9Mk6eyk0LnbF-kP3v=smLg@mail.gmail.com>
In-Reply-To: <CAMzpN2iW4XD1Gsgq0ZeeH2eewLO+9Mk6eyk0LnbF-kP3v=smLg@mail.gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Wed, 1 Jul 2020 11:39:40 -0700
X-Gmail-Original-Message-ID: <CALCETrVy-Q4K04wmEPe5VeU=at2BL4b-bSFkoSU-BPbTaTB2Yg@mail.gmail.com>
Message-ID: <CALCETrVy-Q4K04wmEPe5VeU=at2BL4b-bSFkoSU-BPbTaTB2Yg@mail.gmail.com>
Subject: Re: [PATCH 3/6] x86/entry/64/compat: Fix Xen PV SYSENTER frame setup
To: Brian Gerst <brgerst@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>, xen-devel <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 1, 2020 at 8:42 AM Brian Gerst <brgerst@gmail.com> wrote:
>
> On Fri, Jun 26, 2020 at 1:30 PM Andy Lutomirski <luto@kernel.org> wrote:
> >
> > The SYSENTER frame setup was nonsense.  It worked by accident
> > because the normal code into which the Xen asm jumped
> > (entry_SYSENTER_32/compat) threw away SP without touching the stack.
> > entry_SYSENTER_compat was recently modified such that it relied on
> > having a valid stack pointer, so now the Xen asm needs to invoke it
> > with a valid stack.
> >
> > Fix it up like SYSCALL: use the Xen-provided frame and skip the bare
> > metal prologue.
> >
> > Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> > Cc: Juergen Gross <jgross@suse.com>
> > Cc: Stefano Stabellini <sstabellini@kernel.org>
> > Cc: xen-devel@lists.xenproject.org
> > Fixes: 1c3e5d3f60e2 ("x86/entry: Make entry_64_compat.S objtool clean")
> > Signed-off-by: Andy Lutomirski <luto@kernel.org>
> > ---
> >  arch/x86/entry/entry_64_compat.S |  1 +
> >  arch/x86/xen/xen-asm_64.S        | 20 ++++++++++++++++----
> >  2 files changed, 17 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/x86/entry/entry_64_compat.S b/arch/x86/entry/entry_64_compat.S
> > index 7b9d8150f652..381a6de7de9c 100644
> > --- a/arch/x86/entry/entry_64_compat.S
> > +++ b/arch/x86/entry/entry_64_compat.S
> > @@ -79,6 +79,7 @@ SYM_CODE_START(entry_SYSENTER_compat)
> >         pushfq                          /* pt_regs->flags (except IF = 0) */
> >         pushq   $__USER32_CS            /* pt_regs->cs */
> >         pushq   $0                      /* pt_regs->ip = 0 (placeholder) */
> > +SYM_INNER_LABEL(entry_SYSENTER_compat_after_hwframe, SYM_L_GLOBAL)
>
> This skips over the section that truncates the syscall number to
> 32-bits.  The comments present some doubt that it is actually
> necessary, but the Xen path shouldn't differ from native.  That code
> should be moved after this new label.

Whoops.  I thought I caught that myself, but apparently not.  I'll fix it.

>
> --
> Brian Gerst

