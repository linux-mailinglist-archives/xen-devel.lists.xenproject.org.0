Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC88A881064
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 12:04:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695866.1086107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtkG-0001Z8-0L; Wed, 20 Mar 2024 11:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695866.1086107; Wed, 20 Mar 2024 11:04:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmtkF-0001WS-Tz; Wed, 20 Mar 2024 11:04:31 +0000
Received: by outflank-mailman (input) for mailman id 695866;
 Wed, 20 Mar 2024 11:04:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmtkE-0001WM-FH
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 11:04:30 +0000
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [2607:f8b0:4864:20::731])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ef061ea-e6a9-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 12:04:29 +0100 (CET)
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-78a13117a3dso62792985a.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 04:04:29 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 bl41-20020a05620a1aa900b0078a2832b33esm163914qkb.13.2024.03.20.04.04.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 04:04:27 -0700 (PDT)
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
X-Inumbo-ID: 9ef061ea-e6a9-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710932668; x=1711537468; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MfEKnJvmsG0Z5JM4ZXCPg+drObOdX7VSv7S0dQe7cbo=;
        b=HoDgAWrP9X+QnlOCXS+EBHVdDMW2yWV5GexZC2D9DKGsyWAV9wolABVf5APYALQjul
         CWjim3DAeFkFSeBD4bSATvaBplKS4dINd0/KnfwEzZ26eWfxDCFCbKUuiiBRZQS+XBso
         tIbheIfjPcvz5EP725v8qY3wXusPLi+cWbgqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710932668; x=1711537468;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfEKnJvmsG0Z5JM4ZXCPg+drObOdX7VSv7S0dQe7cbo=;
        b=C6wiUDxx0JKusuI1DdTiOav09XA/M1BjpCp6pSptfq06bsBNF69a2IaZvK0o9PS6zj
         GwOPT2qJlNQ4kreOEbvh4Yu51NtkCItwV1YrZDAXRu1ttg4YNAsgrDB1stqUYiShgXS5
         0Q0kHVxJ2LtepYdyB607VJVbBHNYDgRB/scLFw5To0W6fZ+XVfOql5uO/HDux36c+gj+
         rMLZCYXZQOrMZQssrKU8b3rE5AvfCQ+Zs5MVwrxHF+brdK/BqpRviCxSMB6ZC7UXLvsx
         hCmTqjAgWrtzBuvbg4FpKKOPTFaNekJ2AYXqcFk2vHFPetaI1qIXpKxTbf/PRAlE0PtW
         F7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAmn02PwZ0dy5qfod+O9zFPrReP1l0QmQYH00LZUxFzx980f+sAW5vVPhphT2uwoKUhX28oaajjCVHpCj2tI6VTrvD5991aTxgcYj6uSc=
X-Gm-Message-State: AOJu0YwlBTwP7B/dB4zGDe6CtZxlseGuxmEg7J7oirX2zYaJS7thBh/F
	vAaJaYr2haqaRLH0x0qZ7XKgLsvAHClgtgA4Tsk1bdvWxB89ZxDszVHtPtfAlxY=
X-Google-Smtp-Source: AGHT+IFIlKIN9h7rco0tQXX02EmOOfcUIOmTWuCTm7kt53nSlam7im/4ulWw9UcIPaxQ4HW23RGT4w==
X-Received: by 2002:a05:620a:3711:b0:788:3fac:b27a with SMTP id de17-20020a05620a371100b007883facb27amr3663404qkb.39.1710932667958;
        Wed, 20 Mar 2024 04:04:27 -0700 (PDT)
Date: Wed, 20 Mar 2024 12:04:25 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: grub-devel@gnu.org, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Daniel Kiper <daniel.kiper@oracle.com>
Subject: Re: [PATCH 1/7] multiboot2: Add load type header and support for the
 PE binary type
Message-ID: <ZfrCuaUeAzbcNtYJ@macbook>
References: <20240313150748.791236-1-ross.lagerwall@citrix.com>
 <20240313150748.791236-2-ross.lagerwall@citrix.com>
 <ZfmQf03uKe5DW0L-@macbook>
 <CAG7k0EopCdrQGLVYXDejorMTe9rhjJNXxaqj21N326fhBtgVFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG7k0EopCdrQGLVYXDejorMTe9rhjJNXxaqj21N326fhBtgVFw@mail.gmail.com>

On Tue, Mar 19, 2024 at 02:46:59PM +0000, Ross Lagerwall wrote:
> On Tue, Mar 19, 2024 at 1:18 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Wed, Mar 13, 2024 at 03:07:42PM +0000, Ross Lagerwall wrote:
> > > Currently, multiboot2-compatible bootloaders can load ELF binaries and
> > > a.out binaries. The presence of the address header tag determines
> > > how the bootloader tries to interpret the binary (a.out if the address
> > > tag is present else ELF).
> > >
> > > Add a new load type header tag that explicitly states the type of the
> > > binary. Bootloaders should use the binary type specified in the load
> > > type tag. If the load type tag is not present, the bootloader should
> > > fall back to the previous heuristics.
> > >
> > > In addition to the existing address and ELF load types, specify a new
> > > optional PE binary load type. This new type is a useful addition since
> > > PE binaries can be signed and verified (i.e. used with Secure Boot).
> > >
> > > Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> > > ---
> > >  doc/multiboot.texi | 39 ++++++++++++++++++++++++++++++++++-----
> > >  doc/multiboot2.h   | 13 +++++++++++++
> > >  2 files changed, 47 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/doc/multiboot.texi b/doc/multiboot.texi
> > > index df8a0d056e76..d12719c744eb 100644
> > > --- a/doc/multiboot.texi
> > > +++ b/doc/multiboot.texi
> > > @@ -511,11 +511,12 @@ assumes that no bss segment is present.
> > >
> > >  Note: This information does not need to be provided if the kernel image
> > >  is in @sc{elf} format, but it must be provided if the image is in a.out
> > > -format or in some other format. When the address tag is present it must
> > > -be used in order to load the image, regardless of whether an @sc{elf}
> > > -header is also present. Compliant boot loaders must be able to load
> > > -images that are either in @sc{elf} format or contain the address tag
> > > -embedded in the Multiboot2 header.
> > > +format or in some other format. If the load type tag is not specified
> > > +and the address tag is present it must be used in order to load the
> > > +image, regardless of whether an @sc{elf} header is also present.
> > > +Compliant boot loaders must be able to load images that are either in
> > > +@sc{elf} format or contain the address tag embedded in the Multiboot2
> > > +header.
> > >
> > >  @subsection The entry address tag of Multiboot2 header
> > >
> > > @@ -732,6 +733,34 @@ and @samp{2} means load image at highest possible address but not
> > >  higher than max_addr.
> > >  @end table
> > >
> > > +@node Load type tag
> > > +@subsection Load type tag
> > > +
> > > +@example
> > > +@group
> > > +        +-------------------+
> > > +u16     | type = 11         |
> > > +u16     | flags             |
> > > +u32     | size = 12         |
> > > +u32     | load_type         |
> > > +        +-------------------+
> > > +@end group
> > > +@end example
> > > +
> > > +This tag indicates the type of the payload and how the boot loader
> > > +should load it.
> > > +
> > > +The meaning of each field is as follows:
> > > +
> > > +@table @code
> > > +@item load_type
> > > +Recognized load types are @samp{0} for address (i.e. load a.out using
> > > +the address tag), @samp{1} for ELF, and @samp{2} for PE. Compliant
> > > +bootloaders should implement support for a.out and ELF as a minimum.  If
> > > +this tag is not specified, the boot loader should attempt to load the
> > > +payload using the information specified in the address tag if present,
> > > +else it should load the payload as an ELF binary.  @end table
> >
> > I wonder if it would be simpler to use the following order instead:
> >
> > 1. Address tag
> > 2. Load type tag
> > 3. ELF header
> >
> > It's pointless to add a Loader type tag with load_type == 0, as that's
> > already mandated by the Address tag.  IOW: signaling the use of the
> > Address tag here is kind of pointless, if the fields in the Address
> > tag are set, that's the only signaling required for the data in the
> > Address tag to be used.
> >
> > Or are we attempting to support images that set Address tag and Load
> > type tag != 0 in order to use the Address tag when the loader doesn't
> > recognize the Load type tag, and otherwise use a different format?
> 
> No, that wasn't my intention. My intention for the load type tag was
> to have one tag that unambiguously describes the payload format and if
> that is missing, fall back to the previous logic for compatibility.
> It avoids more complicated heuristics if different payload types are
> added in the future.
> 
> >
> > Would it be sensible for multiboot2 to use PE in preference to ELF if
> > present on the image?  (without requiring any signaling).  I would
> > think this could be troublesome if kernels are so far expecting the
> > ELF header to be used with multiboot2, even if they also expose a PE
> > header.
> >
> 
> AFAIK an ELF image can't also be a valid PE/COFF image since they have
> different magic numbers at the start of the image. Perhaps it would
> be simpler to avoid introducing the load type tag and just load the
> payload based on the magic number?

I would likely be fine with just handling it like we handle ELF, if a
PE header is found use it.  As long as ELF and PE headers are mutually
exclusive.

Thanks, Roger.

