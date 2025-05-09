Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AAAAB18C6
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 17:34:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980121.1366594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDPk6-0003Sb-IS; Fri, 09 May 2025 15:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980121.1366594; Fri, 09 May 2025 15:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDPk6-0003QF-F7; Fri, 09 May 2025 15:34:30 +0000
Received: by outflank-mailman (input) for mailman id 980121;
 Fri, 09 May 2025 15:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ndpn=XZ=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1uDPk4-0003Q9-UG
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 15:34:28 +0000
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16198178-2ceb-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 17:34:25 +0200 (CEST)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-72c13802133so683860a34.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 08:34:25 -0700 (PDT)
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
X-Inumbo-ID: 16198178-2ceb-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1746804864; x=1747409664; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEb3n+AnLRJh3/D+uWgQdzBFV3lozOyknEcM+qmfC40=;
        b=OJm7RC80qdB57+oaAytogKEuiywPbsiJgvF7CjCdhqQoPOQfxIJn0hDd2zf87cej3n
         UA4NDf7BuYW2/NnbBNSanEIIlZaAaSwuD1f+0QLEweb3M1pr4eAwydZyrIKkH1OT/F4F
         giC4jAoSk1+/sI37odG+v033bCWhGAA5pkSLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804864; x=1747409664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEb3n+AnLRJh3/D+uWgQdzBFV3lozOyknEcM+qmfC40=;
        b=HigCbx0CY6tcWe0HLqxvEWZakjUNWzAwj2l7nTNCdBWNr32UKiUP0OkoWFI7pppUgQ
         C5Y9AsfIXYMyjrxPZkmWCmhST9rdJ38liQOfnQXgvHvxQ0ufO3cMw00qCTqCE7N12UzJ
         Ad1ioZKXRi6U2f7pMFP85YyMZ18cKogjek/TbUAGbW87FWMI/adP4WUjXrwRjYAfGFRW
         8iky7ngsvubLoZuqGso5ivaQxNDqANmNwmIKpfw/1+WAlbGdFaIxih0qhc/lboDhDj6l
         rCKupS06+adkK3MXqeCFgJqcOXihPAcbTjhvWvy/01X8GmTo1Albl0rX4ySsK+v3cNMi
         LUnA==
X-Forwarded-Encrypted: i=1; AJvYcCWKAQOFWuiL/DOfZozV6a73415E85lHRjgtGZDJy99RJnRpG/36A1oLD4msbE57FGizkCk4vwbbHnU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGTIXH3KAe6tJwsL7yFxHZ0Ztqs01QQuFI++jmJOCSrSZ32oLr
	rm8JQyMTbM1xm3d/9BlVIanUkbpFCNNcw6GED1GdnrZVDk7t/4QS/bCBtOxL6X6QTVlP5h0rYfQ
	N8eA+a4UFZODjG3+nR0Hq5vRZrqYrPHyose6LHw==
X-Gm-Gg: ASbGncuGUvq24BlJ/d/3nybcpxDRcz6DhPNUff6RKoZAA3IxmUDKTgcU2uoeP0p5JfG
	n9yQunYc/9UDg1ab/2a8Njtx45ORTUX3c4PSdD7TGfbgNuNdCtUXQ0FWqf81hwEwhrafaO5wHfb
	wtOv9m8m35c2y3VbmUPFHghEi/MtC/iwGI
X-Google-Smtp-Source: AGHT+IHeQdLtNOQ0e3W+KHtAC5pD03nl+BrpjpMv+Jn/hPZuJcZw/cgVDJsYeblGE/Af41IItKci5svVHx6fFvAGsEA=
X-Received: by 2002:a05:6830:4127:b0:72b:9316:d593 with SMTP id
 46e09a7af769-732269cc9c1mr2411873a34.7.1746804864009; Fri, 09 May 2025
 08:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250507094253.10395-1-freddy77@gmail.com> <a197c145-1fc5-4482-bce9-12511a816a63@citrix.com>
In-Reply-To: <a197c145-1fc5-4482-bce9-12511a816a63@citrix.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Fri, 9 May 2025 16:34:01 +0100
X-Gm-Features: AX0GCFtNpHaCMt2EMxl8gFIe31mfkGmwbhLO0tBPSs-4fwLOly57VNo-8dD-y2U
Message-ID: <CACHz=ZjuJoWCH7Dr4oXSXsFqKHcW3meRGrnPA0zBqZ89Y=DtSA@mail.gmail.com>
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

On Fri, May 9, 2025 at 4:04=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 07/05/2025 10:42 am, Frediano Ziglio wrote:
> > Ross Lagerwall (4):
> >   xen/lib: Export additional sha256 functions
> >   kexec: Include purgatory in Xen
> >   kexec: Implement new EFI load types
> >   kexec: Support non-page-aligned kexec segments
>
> I realise a lot of this is coming from kexec-tools and/or Linux, but it
> looks very very mad.
>
> From patch 1, we're embedding this in Xen:
>
> xen.git/xen/arch/x86/purgatory$ ls -lah purgatory.ro
> -rw-r--r-- 1 andrew andrew 30K May  9 15:24 purgatory.ro
>
> yet -Wa,--strip-local-absolute alone halves the size:
>
> xen.git/xen/arch/x86/purgatory$ ls -lah purgatory.ro
> -rw-r--r-- 1 andrew andrew 17K May  9 15:25 purgatory.ro
>
> Looking at purgatory itself, we enter at purgatory_start, load a local
> GDT, set up a local stack, call into C for the hashing (and nothing
> else), then jmp to entry64...
>
> ... which loads a (different) local GDT, (different) local stack, loads
> the GPRs and then jumps into the new kernel.
>
> Combined with kexec_reloc(), that's 3x we change GDT and stack in
> several hundred instructions.
>
>
> Looking further at patch 2, we only set up 3 GPRs; %rip, %rsp and %rdi
> pointing the parameter block.
>
> Patch 2 also contains an a large amount of EFI-editing logic (all
> vulnerable to XSA-25), which AFAICT exists only because purgatory is
> built non-PIC and wants relocating.  I can't see any external
> references, or anything that couldn't be resolved at link time for a PIC
> build.
>
>
> There are two things which purgatory does which Xen doesn't currently
> cater for:
>
> 1) Setting up the GPRs in that manner
> 2) The digest checks
>
> #1 is very easy to fix and can probably even be done on the current ABI
> (older Kexecs using purgatory won't care), and #2 ought to be easy too
> by extending machine_kexec().  We can do the digest checks
> unconditionally (it's a sensible check irrespective).
>

I think the problem of #2 is that doing in the purgatory avoids
problems like possible memory corruptions. For instance if the host is
crashing due to some corruption it could not always be possible to
boot the saved kernel.

> I think that removes the majority of this series, with no loss in
> functionality?
>
> Given that we're leaving the signature check to the dom0 kernel (which
> is TCB and therefore can in the UEFI-SB model), we just might be able to
> get away without any hypercall changes at all?
>

Yes and no. The user space could not provide the purgatory. But if the
kernel is providing it, preventing the user space to send it, I
suppose it can be done. At this point however the question is how to
change the interface provided to userspace for doing it. It could make
sense to have the changes in xen/include/public/kexec.h and let the
kernel do the rest.

> Thoughts?
>
> ~Andrew

Frediano

