Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84581AB34E2
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:28:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981175.1367569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQOw-0003qj-N2; Mon, 12 May 2025 10:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981175.1367569; Mon, 12 May 2025 10:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQOw-0003o5-Jy; Mon, 12 May 2025 10:28:50 +0000
Received: by outflank-mailman (input) for mailman id 981175;
 Mon, 12 May 2025 10:28:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XwtN=X4=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uEQOv-0003nz-87
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:28:49 +0000
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [2607:f8b0:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2a94fb6-2f1b-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 12:28:47 +0200 (CEST)
Received: by mail-oi1-x233.google.com with SMTP id
 5614622812f47-400fa6eafa9so2966800b6e.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:28:47 -0700 (PDT)
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
X-Inumbo-ID: e2a94fb6-2f1b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1747045725; x=1747650525; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XtbFrKz68AqwrIR8yQqRG98LYiZ3G4Jd1hdWbauKbU=;
        b=abtTiI+2oegqdqak22zF/kmuwq2WntyQh9GfMytWYU26bE71vM4Vu/6aM7K6ktaAVr
         kvXY/f/13VBGpTD6G1HcDIW7ziCb478G3sqRCkjYeKuIdf/psD1r2zAI8QZFuepw6h2O
         cDYmxsXg4KtvBBzCVo/5Mt/ic7vKjBrFYcru0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747045725; x=1747650525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XtbFrKz68AqwrIR8yQqRG98LYiZ3G4Jd1hdWbauKbU=;
        b=eI3PVN1KNFII9hjUwPNpI0Z+HNzsL0F/PmCrV4iLw7aflCpAqmAvknlJ4anv/oz46m
         ea/F+6Dl0GV4MSItU8GTlh+sEXaXuWRWIJd34vtF/16x+vSPQIw0anBoMuHITy5q5JgW
         a2aFMjkt7XtbCxcemdFeGyLh8yNGcxT6nh+Fk+Cot7Fg2tyWchhbrskmN/UBOCriab3V
         d5WP2IOxHl5f4i50rELEnoNTcGniJdHhMvrkZcIIXLNeeht/x6AIwBv+7He7ihOmVOZ9
         uLFKiqVBUTJBo9Vd34+7V62EWrVVSoO+/LYsnuyo1ufu8Djoci3lvYi1dHAArflg1XTc
         ZAYA==
X-Forwarded-Encrypted: i=1; AJvYcCXF62ajW3nv4k+cry56D/nfQ1zKpyBbiaLb/Z9WJAMKAcTRMgAX00v7QRaNn7t4pO2Os8uSzG6RYSE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5I1I0ZCFSlJmQqYOYLmR5Z7UC+zfZ3OK2BCCFCFca00WJQibn
	zreWeGcmjronh+JtCpUwHDmdx6nat8pmlBbV1LAvDw43xb0Y8Ub3QNsHrTV0thwSQD2R25eZmxa
	+PVSebu6PnEgdgPoYze9x462raC6qjtOhYp2JaQ==
X-Gm-Gg: ASbGnctLqnYkUS7BK9z1hBf38hmWshZpkYEQTFW6D6DjRkdzR3SgQctV6tNkPe/dRW5
	UTesgKYOPlh7Zh/4nnLKxb9zd8qbHSuGnN4joZlj1s72taaY2J/5dJ3Pf8IEo2Rczmyt7OXLfPa
	4BKv04mSEiuU6bLaf0gvDT8Zw/b+5yB8FF
X-Google-Smtp-Source: AGHT+IFFzu1ORYqSIozHZ3xuVTtZI83Oufch5vo7KWoUfwttPKBfoUPsyBxHX8RQgDTU0T4feH2qmc0i8QigLnnaRHM=
X-Received: by 2002:a05:6808:f14:b0:403:34b3:c986 with SMTP id
 5614622812f47-4037fe51d2emr8017117b6e.17.1747045725561; Mon, 12 May 2025
 03:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250507094253.10395-1-freddy77@gmail.com> <a197c145-1fc5-4482-bce9-12511a816a63@citrix.com>
 <CACHz=ZjuJoWCH7Dr4oXSXsFqKHcW3meRGrnPA0zBqZ89Y=DtSA@mail.gmail.com> <16fa3d79-7963-4334-a587-5cc289cfd693@citrix.com>
In-Reply-To: <16fa3d79-7963-4334-a587-5cc289cfd693@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Mon, 12 May 2025 11:28:34 +0100
X-Gm-Features: AX0GCFuWJfs8umPHia4GQaYwbcR7v0ED4R-F_frzpnSe2DqAv59YCt6K2LAZYaQ
Message-ID: <CACHz=Zgu1CVZqZO8O8gc2=0YQbGpzpiZGuCGoa=WfViQDbc_Rg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Allows Secure Boot for Kexec
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <freddy77@gmail.com>, xen-devel@lists.xenproject.org, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 6:40=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 09/05/2025 4:34 pm, Frediano Ziglio wrote:
> > On Fri, May 9, 2025 at 4:04=E2=80=AFPM Andrew Cooper <andrew.cooper3@ci=
trix.com> wrote:
> >> On 07/05/2025 10:42 am, Frediano Ziglio wrote:
> >>> Ross Lagerwall (4):
> >>>   xen/lib: Export additional sha256 functions
> >>>   kexec: Include purgatory in Xen
> >>>   kexec: Implement new EFI load types
> >>>   kexec: Support non-page-aligned kexec segments
> >> I realise a lot of this is coming from kexec-tools and/or Linux, but i=
t
> >> looks very very mad.
> >>
> >> From patch 1, we're embedding this in Xen:
> >>
> >> xen.git/xen/arch/x86/purgatory$ ls -lah purgatory.ro
> >> -rw-r--r-- 1 andrew andrew 30K May  9 15:24 purgatory.ro
> >>
> >> yet -Wa,--strip-local-absolute alone halves the size:
> >>
> >> xen.git/xen/arch/x86/purgatory$ ls -lah purgatory.ro
> >> -rw-r--r-- 1 andrew andrew 17K May  9 15:25 purgatory.ro
> >>
> >> Looking at purgatory itself, we enter at purgatory_start, load a local
> >> GDT, set up a local stack, call into C for the hashing (and nothing
> >> else), then jmp to entry64...
> >>
> >> ... which loads a (different) local GDT, (different) local stack, load=
s
> >> the GPRs and then jumps into the new kernel.
> >>
> >> Combined with kexec_reloc(), that's 3x we change GDT and stack in
> >> several hundred instructions.
> >>
> >>
> >> Looking further at patch 2, we only set up 3 GPRs; %rip, %rsp and %rdi
> >> pointing the parameter block.
> >>
> >> Patch 2 also contains an a large amount of EFI-editing logic (all
> >> vulnerable to XSA-25), which AFAICT exists only because purgatory is
> >> built non-PIC and wants relocating.  I can't see any external
> >> references, or anything that couldn't be resolved at link time for a P=
IC
> >> build.
> >>
> >>
> >> There are two things which purgatory does which Xen doesn't currently
> >> cater for:
> >>
> >> 1) Setting up the GPRs in that manner
> >> 2) The digest checks
> >>
> >> #1 is very easy to fix and can probably even be done on the current AB=
I
> >> (older Kexecs using purgatory won't care), and #2 ought to be easy too
> >> by extending machine_kexec().  We can do the digest checks
> >> unconditionally (it's a sensible check irrespective).
> >>
> > I think the problem of #2 is that doing in the purgatory avoids
> > problems like possible memory corruptions. For instance if the host is
> > crashing due to some corruption it could not always be possible to
> > boot the saved kernel.
>
> It doesn't really matter if Xen does the digest check right at the point
> of exiting, or purgatory does it moments later.
>
> If there's memory corruption anywhere on this path, we're not making it
> into the crash kernel whomever does the digest check.
>
> Crashing is a best-effort exercise; it's never guaranteed to be successfu=
l.
> >> I think that removes the majority of this series, with no loss in
> >> functionality?
> >>
> >> Given that we're leaving the signature check to the dom0 kernel (which
> >> is TCB and therefore can in the UEFI-SB model), we just might be able =
to
> >> get away without any hypercall changes at all?
> >>
> > Yes and no. The user space could not provide the purgatory. But if the
> > kernel is providing it, preventing the user space to send it, I
> > suppose it can be done. At this point however the question is how to
> > change the interface provided to userspace for doing it. It could make
> > sense to have the changes in xen/include/public/kexec.h and let the
> > kernel do the rest.
>
> I'm not really suggesting any change in userpsace/dom0 kernel.  I'm
> suggesting "we don't need a purgatory blob at all given two simple
> changes in Xen."
>

Maybe it was not clear from my previous comment. A change to the
userspace interface is needed. One reason is the mentioned purgatory,
it cannot be provided by userspace. The other reason is checking the
signature, the kernel should be passed verbatim in order to check it.

Which specific 2 changes are you referring to?

Given that the kernel already does the signature, having the kernel
providing the purgatory too would be sensible.

> This in turn means (I think) we can drop all the ELF relocation logic.
>
> I'm unsure whether we need new hypercall subopts or not.  Even if we do,
> I think the result can still be more simple than currently presented.
>
> ~Andrew

Possibly the Xen interface could stay the same. Still, as explained
above, a userspace change is needed.

Frediano

