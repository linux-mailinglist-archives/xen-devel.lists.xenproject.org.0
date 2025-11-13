Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB6FC57BF6
	for <lists+xen-devel@lfdr.de>; Thu, 13 Nov 2025 14:43:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1161585.1489505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXc6-0000Zt-Ls; Thu, 13 Nov 2025 13:43:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1161585.1489505; Thu, 13 Nov 2025 13:43:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJXc6-0000VH-Im; Thu, 13 Nov 2025 13:43:50 +0000
Received: by outflank-mailman (input) for mailman id 1161585;
 Thu, 13 Nov 2025 13:43:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FQDN=5V=gmail.com=freddy77@srs-se1.protection.inumbo.net>)
 id 1vJXc5-0008Bv-Gr
 for xen-devel@lists.xenproject.org; Thu, 13 Nov 2025 13:43:49 +0000
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [2607:f8b0:4864:20::1130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c778324f-c096-11f0-980a-7dc792cee155;
 Thu, 13 Nov 2025 14:43:47 +0100 (CET)
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-787e7aa1631so19927537b3.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Nov 2025 05:43:47 -0800 (PST)
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
X-Inumbo-ID: c778324f-c096-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763041427; x=1763646227; darn=lists.xenproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=m7KWZqcrPxz5V7yvNwf+MCx9P5yDv1CMsFtbysJ/WHE=;
        b=jkpgoc8dnvyXnXckyNeCsBZSru9iYhmQY6YGUklVOK06lkIn0B6usZ0mqzKKeqw6Uh
         BxhKdkqwdAvlamzRhu/ud/m8ToQR0Z4QRx2rvXia3DUyi8sWEec2+xqQ7zJbE2e9eTce
         CmnINZMLV5rraqHG9r7wAjDRuGMcoJ9JPotAo3lwcC0LdaQe0c4MFcXO4wJRMGjgj/Bb
         43hetWbgQsSt+AtPgOqyjDw/VwQmq82lxKHMSLlflgbD4oIA1opV3U4xG4oYPLbeT1jt
         ZT41NRTlHGt0WvjO6uj5JQQb5S8hJ9GisUhw5mluglHhridlsLi+ck3/nD3vRaUQHl8b
         7h6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763041427; x=1763646227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m7KWZqcrPxz5V7yvNwf+MCx9P5yDv1CMsFtbysJ/WHE=;
        b=UW4v6ToGVktHvsI4GHkFdzjNV04Fj30NLpW+vW65DiwGyUtGlC1WAg0tuxKQyKOg81
         cTUgDSglR10fP/r3lzFnVVKVXdwC8KWOVBY8wUnxtXjWbhezNwycO14873rETHcpYcCE
         dZlGMLGgOqxeknDZZLqUnDOnyGhWlNpVOeMy6Q83zeoMcSkYewkpSGG77/zX1Nj1ILS1
         XA5uO5q9r5OzLC/cNiPKu1mxZKwoRzTN9L8zV9ciMLCmNAt3a7mIIKE6M3W0iA5RM1B4
         2z9Hr+A5wKItcnA9OLVg1LaMSDktSh6v9yF4K/ozYwCei5wcwIBrLdQHpoyrBk/v/2wO
         8oGg==
X-Forwarded-Encrypted: i=1; AJvYcCXvs/e0nJomEan+v95xy7pSEH5RW0oVPMTKenNYjzITwzu35CnlYGmD2ipLFy63Adr+thlMTl5n2qw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwJkPGDviMqx97i6IV8pNANs0/NrxSM9VCus80Gp8zwbH59wQtx
	1AENIAq9c2cxAI+laG4Nn1OHRUomTU1qRrfAy6hy1wY2pMNQvBcpgret7RdPV0Fc5oEPdOCCyFO
	rswAZBHnxPzeEug+IqjdZGSs4JWxkUsJHMRHT
X-Gm-Gg: ASbGncuA/Ij1KWrYxnYoau4S5D3BeakJ6ruIzZPva1XZkEho3txTPf5U6iwptuKze22
	xDdD2vtu3j+y7vRirEvY98L6mtC2v2KRNpTFc/OdD7AFt3Nn/srcbT/D1bmsjmrL/fLJ8br2l7q
	7XCxI+OZmxGVyaYKAEWsWaHS5cNjh2j5DFu3LDAJSupxPZ2vCbRvijYJjkt5kdH24LWFLNV7bvZ
	k41IfsVd3dSKxRcOf/BHMNZtj1Rg/0CpZVRMcrgU/3FdF7FG1vZv6f4y4NtL0j6aahrw80=
X-Google-Smtp-Source: AGHT+IFb543cyZ2fv56wukwqjJcqjPpPv57L7zHXAyBM1zW6CnfNbfHWgKPesrooiUdtZCUB2aIRWifQ+yNTFCXBiAQ=
X-Received: by 2002:a05:690e:1289:b0:63f:b988:4a91 with SMTP id
 956f58d0204a3-6410d1387f1mr2357693d50.24.1763041426660; Thu, 13 Nov 2025
 05:43:46 -0800 (PST)
MIME-Version: 1.0
References: <20251113124945.25343-1-frediano.ziglio@citrix.com> <5c14f58d-c8bf-4c63-b48a-9af5af88c8f2@citrix.com>
In-Reply-To: <5c14f58d-c8bf-4c63-b48a-9af5af88c8f2@citrix.com>
From: Frediano Ziglio <freddy77@gmail.com>
Date: Thu, 13 Nov 2025 13:43:34 +0000
X-Gm-Features: AWmQ_bm4XTPmiv-DuFRxOgOUcUTZ6wiYadcZiq78O5UQTmK-2wO-LwHb8SkwTvI
Message-ID: <CAHt6W4fGe1rYh_J_97dnkYHaaSqXRy6Y96OGtsgKj5YJOzuoDA@mail.gmail.com>
Subject: Re: [PATCH for-4.21 v7] xen: Strip xen.efi by default
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Frediano Ziglio <frediano.ziglio@citrix.com>, xen-devel@lists.xenproject.org, 
	Frediano Ziglio <frediano.ziglio@cloud.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Nov 2025 at 13:17, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 13/11/2025 12:49 pm, Frediano Ziglio wrote:
> > From: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > For xen.gz file we strip all symbols and have an additional
> > xen-syms.efi file version with all symbols.
> > Make xen.efi more coherent stripping all symbols too.
> > xen-syms.efi can be used for debugging.
> >
> > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > ---
> > Changes since v1:
> > - avoid leaving target if some command fails.
> >
> > Changes since v2:
> > - do not convert type but retain PE format;
> > - use xen-syms.efi for new file name, more consistent with ELF.
> >
> > Changes since v3:
> > - update documentation;
> > - do not remove xen.efi.elf;
> > - check endbr instruction before generating final target.
> >
> > Changes since v4:
> > - simplify condition check;
> > - avoid reuse of $@.tmp file.
> >
> > Changes since v5:
> > - avoid creation of temporary file.
> >
> > Changes since v6:
> > - install xen-syms.efi;
> > - always strip xen.efi;
> > - restore EFI_LDFLAGS check during rule execution;
> > - update CHANGELOG.md;
> > - added xen-syms.efi to .gitignore.
> > ---
> >  .gitignore            |  1 +
> >  CHANGELOG.md          |  3 +++
> >  docs/misc/efi.pandoc  |  8 +-------
> >  xen/Kconfig.debug     |  9 ++-------
> >  xen/Makefile          | 25 +++----------------------
> >  xen/arch/x86/Makefile | 11 ++++++++---
> >  6 files changed, 18 insertions(+), 39 deletions(-)
> >
> > diff --git a/.gitignore b/.gitignore
> > index d83427aba8..213972b65c 100644
> > --- a/.gitignore
> > +++ b/.gitignore
> > @@ -222,6 +222,7 @@ tools/flask/policy/xenpolicy-*
> >  xen/xen
> >  xen/suppression-list.txt
> >  xen/xen-syms
> > +xen/xen-syms.efi
> >  xen/xen-syms.map
> >  xen/xen.*
> >
> > diff --git a/CHANGELOG.md b/CHANGELOG.md
> > index c9932a2af0..3bdcc3b47a 100644
> > --- a/CHANGELOG.md
> > +++ b/CHANGELOG.md
> > @@ -65,6 +65,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
> >        for hypervisor mode.
> >
> >  ### Removed
> > + - The install-time environment variable INSTALL_EFI_STRIP is no longer
> > +   supported, xen.efi will is now always being stripped.
>
> I'd rephrase this a little.  "... INSTALL_EFI_STRIP no longer exists.
> xen.efi is always stripped, while the symbols remain available in
> xen-syms.efi."
>

Done

> Personally, I'd have put this in the Changed section rather than
> Removed, but both can be adjusted together.
>

Done

> This bug is on the 4.21 tracking list.  CC'ing Oleksii.
>

So.. should I leave the CHANGELOG.md change in 4.21 or should I move
it to 4.22 ??

> ~Andrew

Frediano

