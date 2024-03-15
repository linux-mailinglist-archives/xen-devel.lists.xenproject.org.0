Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E350687CA32
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 09:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693693.1082069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3Bl-0008Hh-L0; Fri, 15 Mar 2024 08:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693693.1082069; Fri, 15 Mar 2024 08:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl3Bl-0008GA-Hq; Fri, 15 Mar 2024 08:45:17 +0000
Received: by outflank-mailman (input) for mailman id 693693;
 Fri, 15 Mar 2024 08:45:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BtVl=KV=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rl3Bk-0008G4-Kd
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 08:45:16 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 576e740b-e2a8-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 09:45:15 +0100 (CET)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-789e6f7f748so15110985a.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 01:45:15 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 j4-20020a05620a0a4400b007883687ef00sm1806420qka.69.2024.03.15.01.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 01:45:13 -0700 (PDT)
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
X-Inumbo-ID: 576e740b-e2a8-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710492314; x=1711097114; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IwCFGTOnknvM9jgq2jeOOeQwSk3SwCmaIKVHNl4pJmg=;
        b=qK6kmYa5dXPS6JfVNp7IOCsY12JjIuZjJqzbhYngEnOh6ajZ2VFOUdayJxd/7uSaSL
         a0CSXadczt7yFOuhvvqEfN+nPRmD7zK1aFOdXLVdLGNRYZnVFTpIHgIjoSY4Vzb1lLEP
         zybbK5Yyvr9/8G+9C975S32Kr2Ef1Gy541Jac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710492314; x=1711097114;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IwCFGTOnknvM9jgq2jeOOeQwSk3SwCmaIKVHNl4pJmg=;
        b=mKK+A7LX6MzHkwgICJkEL3jbyF/wMURzhcF0tleYhgvFFSRd44+i6ehWDSaUH/0eNC
         cwdSFDkHgVbPrBIntaVDQRdSr4M8ODBLKcVAgGBkXnbE0J+hyk07YThVZBlwD37S21dw
         /tQmRwg+ZOyxbdF1te2bTidTBGcbnMsOEjmZaKrvM5DaNOa5AmeL9+QDWBHuEp7h4xrW
         DQ5Yajape6QU3JlfhP9dAnz9e9e4uBbcWlxqiqOLdrteQzso8WpLf+8cxJt5lzTQaCar
         1EIt5hXbqO2LDLOLz8rzhKNCDPw7e1s5ZY3DFHKtpmRzPxLs8fweTv24053hq7FsSs3a
         9KSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVq8x5uCti0sobOvtf6HvymcZoVPyjNhOmJSEPFx1PGmSYv5kANVd/gM94d6stx8tGfbehXWqG9f1Xmkesl83y4BJc7yDjjA4zwEy5RDKQ=
X-Gm-Message-State: AOJu0Yy6ZycUtc4O5dzScv8TiMASCKiohRBdI8F9+H78QDo4b6rhiI+w
	2nrXVosXPexm8BnYqsBsP0Jpqmva4l6qcT0TpWj1CWddeD6NtfBjtNEq41a/xnY=
X-Google-Smtp-Source: AGHT+IGRj/RLAu0w+ktkOvQ08pDl+wZFAzl0dJZyyDzBy5d6+jDDvcgLzLXCQmT2juLtxtia/gPoMg==
X-Received: by 2002:a05:620a:1790:b0:789:c643:d086 with SMTP id ay16-20020a05620a179000b00789c643d086mr5444119qkb.73.1710492313978;
        Fri, 15 Mar 2024 01:45:13 -0700 (PDT)
Date: Fri, 15 Mar 2024 09:45:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Message-ID: <ZfQKl-JAIS02nL4a@macbook>
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
 <ZfLIBHTbcbGqFAhY@macbook>
 <afb3aa21-cd8b-425d-a4fa-b9ca57367d28@amd.com>
 <ZfMKuUqopaj-Gubu@macbook>
 <a531578e-ade0-45bb-b916-e195e51e97cf@suse.com>
 <ae43789c-37e9-42a9-b570-d073c4fd4cf5@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae43789c-37e9-42a9-b570-d073c4fd4cf5@amd.com>

On Thu, Mar 14, 2024 at 12:59:19PM -0400, Jason Andryuk wrote:
> On 2024-03-14 11:30, Jan Beulich wrote:
> > On 14.03.2024 15:33, Roger Pau Monné wrote:
> > > On Thu, Mar 14, 2024 at 09:51:22AM -0400, Jason Andryuk wrote:
> > > > On 2024-03-14 05:48, Roger Pau Monné wrote:
> > > > > On Wed, Mar 13, 2024 at 03:30:21PM -0400, Jason Andryuk wrote:
> > > > > > @@ -234,6 +235,17 @@ elf_errorstatus elf_xen_parse_note(struct elf_binary *elf,
> > > > > >                    elf_note_numeric_array(elf, note, 8, 0),
> > > > > >                    elf_note_numeric_array(elf, note, 8, 1));
> > > > > >            break;
> > > > > > +
> > > > > > +    case XEN_ELFNOTE_PVH_RELOCATION:
> > > > > > +        if ( elf_uval(elf, note, descsz) != 3 * sizeof(uint64_t) )
> > > > > > +            return -1;
> > > > > > +
> > > > > > +        parms->phys_min = elf_note_numeric_array(elf, note, 8, 0);
> > > > > > +        parms->phys_max = elf_note_numeric_array(elf, note, 8, 1);
> > > > > > +        parms->phys_align = elf_note_numeric_array(elf, note, 8, 2);
> > > > > 
> > > > > Size for those needs to be 4 (32bits) as the entry point is in 32bit
> > > > > mode?  I don't see how we can start past the 4GB boundary.
> > > > 
> > > > I specified the note as 3x 64bit values.  It seemed simpler than trying to
> > > > support both 32bit and 64bit depending on the kernel arch.  Also, just using
> > > > 64bit provides room in case it is needed in the future.
> > > 
> > > Why do you say depending on the kernel arch?
> > > 
> > > PVH doesn't know the bitness of the kernel, as the kernel entry point
> > > is always started in protected 32bit mode.  We should just support
> > > 32bit values, regardless of the kernel bitness, because that's the
> > > only range that's suitable in order to jump into the entry point.
> > > 
> > > Note how XEN_ELFNOTE_PHYS32_ENTRY is also unconditionally a 32bit
> > > integer.
> 
> Linux defines PHYS32_ENTRY with _ASM_PTR, so it's 32 or 64 bit to match how
> the kernel is compiled.  The Xen code parses the integer according to the
> size of the note.

I think that's wrong, PHYS32_ENTRY should strictly be a 32bit integer,
in fact the field in struct elf_dom_parms is an uint32_t, so Linux
using _ASM_PTR seems bogus, it should unconditionally use .long
regardless of the kernel bitness.

> > > > Do you want the note to be changed to 3x 32bit values?
> > > 
> > > Unless anyone objects, yes, that's would be my preference.
> > 
> > As mentioned elsewhere, unless the entire note is meant to be x86-specific,
> > this fixed-32-bit property then would want limiting to x86.
> 
> PVH is only implemented for x86 today.  Are you saying that the comment
> should just specify the values are 32bit for x86?  If the note is reused for
> other arches, then they can specify their usage?
> 
> If this note is to be a variably sized array of values, then the elements
> should be of fixed size.  Otherwise parsing is ambiguous without, say,
> another field specifying element size.
> 
> Maybe XEN_ELFNOTE_PHYS32_RELOC would be a better name to complement the
> PHYS32_ENTRY?

IMO the '32' part of PHYS32_ENTRY is kind of redundant, given the CPU
state when using such entry point it's impossible to use 64bit
addresses.  I would be fine with using XEN_ELFNOTE_PHYS_RELOC or some
such.  Anyway, this is just a name so I'm not going to opposed if Jan
and yourself prefer to keep using PHYS32.

Thanks, Roger.

