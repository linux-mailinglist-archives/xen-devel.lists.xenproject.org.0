Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40371890392
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 16:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698994.1091339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprtC-0003sZ-2h; Thu, 28 Mar 2024 15:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698994.1091339; Thu, 28 Mar 2024 15:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rprtB-0003q5-WE; Thu, 28 Mar 2024 15:42:02 +0000
Received: by outflank-mailman (input) for mailman id 698994;
 Thu, 28 Mar 2024 15:42:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idZb=LC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rprtA-0003pY-LJ
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 15:42:00 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6eb6144-ed19-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 16:42:00 +0100 (CET)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-690c1747c3cso8191736d6.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 08:42:00 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 mw5-20020a05621433c500b00696abfe8e3csm736444qvb.63.2024.03.28.08.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 08:41:58 -0700 (PDT)
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
X-Inumbo-ID: b6eb6144-ed19-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1711640519; x=1712245319; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C/b9EW8sje77PTTNIGYtPc1axX0bFt5Eme1G5thvfvc=;
        b=moS+hFDAsOCb6MmaDF0RJbdH70wN+QRQpdEBwLxEor1SqpHP0wcG9tArWqG1I5ivQs
         RCGcg+5Kbqvg8SUm633eRSZmtFvLqi9Gd7aXKS7LRa8ot/Mf4dDtCtc32H26NTnkn0cK
         LJcmcG3i+3Fa7MLB8jOeTWWVu5KDETQVC70G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711640519; x=1712245319;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C/b9EW8sje77PTTNIGYtPc1axX0bFt5Eme1G5thvfvc=;
        b=f8/STLS+Mct0JsHcSkxd252Lll7DQXMPGyfD9iJz6pQ0Wv+9CRwbxPtsmGK+KjBO3k
         uqIyTq+504IsEE2WHyI7aolEbtBm3axGQ4RDBt5to8FYewyXwlwdUrT74P0SJP5JVH+Z
         hpjb4nG0rsLgg+x2XPvhs+X+7RZStbag+sgPs4iSlIbYlr6GmGXM8ARmnixStWKYVuXm
         1fjafEBHs8r/QRUV/jugChHAxnPWfbuhE5njC4be1PjtPXU3dbxVRcGPMxLZ83q/Mfg9
         JWTji2uK1HktOxScZQEhpzQG/KCjNrei+RHcgChwHRHigFn2qD0/fn6BOcYekT9t8HpC
         FgXw==
X-Forwarded-Encrypted: i=1; AJvYcCWZpNVyyWZABCqppteAiUHnWZv4f4++9BlchCyhWfI6Pp+Tu/CmtHLvRfF5aLVkIPeuUYv1Qyy+9xunUH6lJOuyFG9eJg8dYhHEQrVRSFk=
X-Gm-Message-State: AOJu0Yy90BDd7G4i1/eCeWTeVJhuDYcDB7GAjqnQpKtf+9EOChTpBjs0
	L61fGqnzXYdceomgcZaxiYzh9GOJpmwDU9HUfWLOsH3zqo+ZL+J7kWlmxDbLWZs=
X-Google-Smtp-Source: AGHT+IGoOhykmiav7iQ36Wyyjj+EkVpThIxLqz+L20QQI6eklHcF4NTteDPIG4hXB4pfvyH+RnqUqw==
X-Received: by 2002:a0c:eb87:0:b0:692:494f:f0aa with SMTP id x7-20020a0ceb87000000b00692494ff0aamr4344811qvo.9.1711640518870;
        Thu, 28 Mar 2024 08:41:58 -0700 (PDT)
Date: Thu, 28 Mar 2024 16:41:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 2/7] multiboot2: Allow 64-bit entry tags
Message-ID: <ZgWPxHAfINmiPAJG@macbook>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-3-ross.lagerwall@citrix.com>
 <Zflj1gEwdeAU45US@macbook>
 <CAG7k0Eq8WFSysMLsg-=FA1GtSR82afXEfHP+cv6gZ_NGn8LrAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0Eq8WFSysMLsg-=FA1GtSR82afXEfHP+cv6gZ_NGn8LrAg@mail.gmail.com>

On Thu, Mar 28, 2024 at 03:05:47PM +0000, Ross Lagerwall wrote:
> On Tue, Mar 19, 2024 at 10:07 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Wed, Mar 13, 2024 at 03:07:43PM +0000, Ross Lagerwall wrote:
> > > Binaries may be built with entry points above 4G. While bootloaders may
> > > relocate them below 4G, it should be possible for the binary to specify
> > > those entry points. Therefore, extend the multiboot2 protocol such that
> > > 64 bit addresses are allowed for entry points. The extension is done in
> > > a backwards-compatible way.
> > >
> > > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > > ---
> > >  doc/multiboot.texi | 32 +++++++++++++++++++-------------
> > >  doc/multiboot2.h   |  6 +++++-
> > >  2 files changed, 24 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/doc/multiboot.texi b/doc/multiboot.texi
> > > index d12719c744eb..049afab53c1f 100644
> > > --- a/doc/multiboot.texi
> > > +++ b/doc/multiboot.texi
> > > @@ -522,12 +522,12 @@ header.
> > >
> > >  @example
> > >  @group
> > > -        +-------------------+
> > > -u16     | type = 3          |
> > > -u16     | flags             |
> > > -u32     | size              |
> > > -u32     | entry_addr        |
> > > -        +-------------------+
> > > +          +-------------------+
> > > +u16       | type = 3          |
> > > +u16       | flags             |
> > > +u32       | size              |
> > > +u32 / u64 | entry_addr        |
> > > +          +-------------------+
> >
> > I might be confused, but this entry point is used in 32bit protected
> > mode, and hence a 64bit value is simply impossible to use according to
> > the protocol in "3.3 I386 machine state".
> >
> > Unless that section is expanded to describe other protocols that use
> > the entry address in a way where 64bits could be meaningful it seems
> > pointless to expand the field.
> 
> I changed this because the same binary is being used for both BIOS boot
> and UEFI boot, therefore it may have a base address above 4 GiB.
> Despite that, it is expected that GRUB would relocate the binary below
> 4 GiB so BIOS boot would still work.

Right, for UEFI boot it's possible to have entry addresses above 4GB,
because the entry point is called in long mode with identity page
tables (and hence you can put addresses in %rip past the 4GB
boundary).

However the multiboot entry point puts the CPU in 32bit protected
mode, and hence %eip can only hold a value below the 4GB boundary.

It's technically impossible to use an entry point above 4GB, unless
there's something that I'm missing that changes the initial CPU state
for the multiboot2 entry point.

Thanks, Roger.

