Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 201259A5F76
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 10:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823241.1237205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2o9B-0004CE-Rt; Mon, 21 Oct 2024 08:52:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823241.1237205; Mon, 21 Oct 2024 08:52:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2o9B-00049g-Nx; Mon, 21 Oct 2024 08:52:17 +0000
Received: by outflank-mailman (input) for mailman id 823241;
 Mon, 21 Oct 2024 08:52:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAaI=RR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t2o9A-00049K-2k
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 08:52:16 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c43d27fa-8f89-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 10:52:13 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-37d808ae924so2884513f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 01:52:13 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f5cc921sm49291895e9.46.2024.10.21.01.52.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 01:52:12 -0700 (PDT)
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
X-Inumbo-ID: c43d27fa-8f89-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729500733; x=1730105533; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qXZGc179aRo893lr/4rYKQQ5skWwgoiP4aS1jfTyaK8=;
        b=sesiqYpojjZsNAFMXRJ7T0bYqHPl9SD3FvbukgIHyxll4bud9SCmAkQ4ZeO+8armph
         Xl7TzXGfkeOwju1mZGoRzSZ7iokiTZgk21wBDZvlRs1CSUSxs2NMoGEuu9ZY/8i39G7j
         Qrgdd2/QAsS30pz7BWX1/6lcbQq9Ow5S6Ra50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729500733; x=1730105533;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qXZGc179aRo893lr/4rYKQQ5skWwgoiP4aS1jfTyaK8=;
        b=Tx7EK5VkgaFRFUld11XRjsbcfXgyaLYL2IQD/UquAoNAyb1JvsSqSpRpf+pT9lDp1O
         k+HEaaIB8BP5FXVAdZ+nKcWDakERRLlHhaFMN38AIAKBASKKEna2/np4h0LruFQXSf43
         vNN4horf63IGMNVLSO8Ej4rfgqraUWQtnukqVBljqjRjNRtfXgTeULPtiUZTSj1GIgiF
         8rIr+4ZUeJa7L6U1hxMk72t04AwbcPySE3Nv8aVOEVSUm5hh5kMux5Jwk8vUM/8ILrZj
         GBVcz1/L4hH700snWnqZ70PkyN6JFXs5qgySMxGCLydGNyweGWDz//bANCnwBpdjyOlo
         4TRA==
X-Forwarded-Encrypted: i=1; AJvYcCU3x2h/q4hVx1aD3wxI7ebPW/fhyMMzQ4Kf7h7bR8yxLqjj0cvVL77vhgDw7x8ya/0bi6yl/dtwh4I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9KQxERKQtJg0ah0+YDC8nkWO9Do2lOr8xPxk5+N6FCPQ+COyg
	EqjxN/xUbFsco5BzI+MTPCZkUuwUzKdCH8qKrYo+AW+JClVkkd/AjZCrPQ0+wdU=
X-Google-Smtp-Source: AGHT+IFCCfi6wsXlK5MqYcdLxGN75VofwnnvYXzXGNqSm2E63Q3J+tfGmVF3wsDMthShZAH62/x0Qg==
X-Received: by 2002:a05:6000:100d:b0:37d:4f1b:359 with SMTP id ffacd0b85a97d-37eb48a0f28mr6533604f8f.53.1729500733227;
        Mon, 21 Oct 2024 01:52:13 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:52:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
Message-ID: <ZxYWPHK-rUbCwsNk@macbook.local>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com>
 <a5745a93-1d82-45f1-bb88-81a737ebcce3@citrix.com>
 <CACHz=ZhULqJpE8UK7kZQN0He5Poc85Cr6heTCKj1KLjxcPA6XQ@mail.gmail.com>
 <ZxJLUeMFyejFGCLc@macbook.local>
 <CACHz=ZhXFRG1PcCqvTUy6jQbbbFNHu7rwWP+CVtJuEeXRqQYXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHz=ZhXFRG1PcCqvTUy6jQbbbFNHu7rwWP+CVtJuEeXRqQYXA@mail.gmail.com>

On Fri, Oct 18, 2024 at 02:28:05PM +0100, Frediano Ziglio wrote:
> On Fri, Oct 18, 2024 at 12:49 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Fri, Oct 18, 2024 at 09:42:48AM +0100, Frediano Ziglio wrote:
> > > On Thu, Oct 17, 2024 at 6:13 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> > > >
> > > > On 17/10/2024 2:31 pm, Frediano Ziglio wrote:
> > > > > The current method to include 32 bit C boot code is:
> > > > > - compile each function we want to use into a separate object file;
> > > > > - each function is compiled with -fpic option;
> > > > > - convert these object files to binary files. This operation removes GOP
> > > > >   which we don't want in the executable;
> > > > > - a small assembly part in each file add the entry point;
> > > > > - code can't have external references, all possible variables are passed
> > > > >   by value or pointer;
> > > > > - include these binary files in head.S.
> > > > >
> > > > > There are currently some limitations:
> > > > > - code is compiled separately, it's not possible to share a function
> > > > >   (like memcpy) between different functions to use;
> > > > > - although code is compiled with -fpic there's no certainty there are
> > > > >   no relocations, specifically data ones. This can lead into hard to
> > > > >   find bugs;
> > > > > - it's hard to add a simple function;
> > > > > - having to pass external variables makes hard to do multiple things
> > > > >   otherwise functions would require a lot of parameters so code would
> > > > >   have to be split into multiple functions which is not easy.
> > > > >
> > > > > Current change extends the current process:
> > > > > - all object files are linked together before getting converted making
> > > > >   possible to share code between the function we want to call;
> > > > > - a single object file is generated with all functions to use and
> > > > >   exported symbols to easily call;
> > > > > - variables to use are declared in linker script and easily used inside
> > > > >   C code. Declaring them manually could be annoying but makes also
> > > > >   easier to check them. Using external pointers can be still an issue if
> > > > >   they are not fixed. If an external symbol is not declared this gives a
> > > > >   link error.
> > > > >
> > > > > Some details of the implementation:
> > > > > - C code is compiled with -fpic flags (as before);
> > > > > - object files from C code are linked together;
> > > > > - the single bundled object file is linked with 2 slightly different
> > > > >   script files to generate 2 bundled object files;
> > > > > - the 2 bundled object files are converted to binary removing the need
> > > > >   for global offset tables;
> > > > > - a Python script is used to generate assembly source from the 2
> > > > >   binaries;
> > > > > - the single assembly file is compiled to generate final bundled object
> > > > >   file;
> > > > > - to detect possible unwanted relocation in data/code code is generated
> > > > >   with different addresses. This is enforced starting .text section at
> > > > >   different positions and adding a fixed "gap" at the beginning.
> > > > >   This makes sure code and data is position independent;
> > > > > - to detect used symbols in data/code symbols are placed in .text
> > > > >   section at different offsets (based on the line in the linker script).
> > > > >   This is needed as potentially a reference to a symbol is converted to
> > > > >   a reference to the containing section so multiple symbols could be
> > > > >   converted to reference to same symbol (section name) and we need to
> > > > >   distinguish them;
> > > > > - --orphan-handling=error option to linker is used to make sure we
> > > > >   account for all possible sections from C code;
> > > > >
> > > > > Current limitations:
> > > > > - the main one is the lack of support for 64 bit code. It would make
> > > > >   sure that even the code used for 64 bit (at the moment EFI code) is
> > > > >   code and data position independent. We cannot assume that code that
> > > > >   came from code compiled for 32 bit and compiled for 64 bit is code and
> > > > >   data position independent, different compiler options lead to
> > > > >   different code/data.
> > > > >
> > > > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > >
> > > > This commit message is not particularly easy to follow.  Can I recommend
> > > > the following:
> > > >
> > > > ---%<---
> > > > x86/boot: Rework how 32bit C is linked/included for early boot
> > > >
> > > > Right now, the two functions which were really too complicated to write
> > > > in asm are compiled as 32bit PIC, linked to a blob and included
> > > > directly, using global asm() to arrange for them to have function semantics.
> > > >
> > > > This is limiting and fragile; the use of data relocations will compile
> > > > fine but malfunction when used, creating hard-to-debug bugs.
> > > >
> > > > Furthermore, we would like to increase the amount of C, to
> > > > deduplicate/unify Xen's boot logic, as well as making it easier to
> > > > follow.  Therefore, rework how the 32bit objects are included.
> > > >
> > > > Link all 32bit objects together first.  This allows for sharing of logic
> > > > between translation units.  Use differential linking and explicit
> > > > imports/exports to confirm that we only have the expected relocations,
> > > > and write the object back out as an assembly file so it can be linked
> > > > again as if it were 64bit, to integrate with the rest of Xen.
> > > >
> > > > This allows for the use of external references (e.g. access to global
> > > > variables) with reasonable assurance of doing so safely.
> > > >
> > > > No functional change.
> > > > ---%<---
> > > >
> > > > which I think is an accurate and more concise summary of what's changing?
> > > >
> > >
> > > You cut half of the explanation, replacing with nothing.
> > > Why is a script needed? Why 2 linking? How the new method detects
> > > unwanted relocations?
> >
> > TBH this is not clear to me even with your original commit message.
> >
> 
> I'm starting to think that either me or Andrew are not the right
> persons to write this, there's a lot of assumptions we assume for
> granted.
> 
> From what I see, in my message:
> ----
> - to detect possible unwanted relocation in data/code code is generated
>   with different addresses. This is enforced starting .text section at
>   different positions and adding a fixed "gap" at the beginning.
>   This makes sure code and data is position independent;
> - to detect used symbols in data/code symbols are placed in .text
>   section at different offsets (based on the line in the linker script).
>   This is needed as potentially a reference to a symbol is converted to
>   a reference to the containing section so multiple symbols could be
>   converted to reference to same symbol (section name) and we need to
>   distinguish them;
> ----
> 
> in Andrew message:
> ----
> Use differential linking and explicit imports/exports to confirm that
> we only have the expected relocations,
> ----
> 
> probably both are cryptic, but getting from "differential linking" you
> really need to know in advance what you are explaining.
> 
> > > Why wasn't possible to share functions?
> 
> mine:
> ----
> - code is compiled separately, it's not possible to share a function
>   (like memcpy) between different functions to use;
> ----
> 
> in Andrew message:
> ----
> Link all 32bit objects together first.  This allows for sharing of
> logic between translation units.
> ----
> 
> I would agree Andrew comment is clearer here.
> 
> > > Why using --orphan-handling option?
> 
> mine:
> ----
> - --orphan-handling=error option to linker is used to make sure we
>   account for all possible sections from C code;
> ---
> 
> in Andrew message:
> ----
> ----
> 
> still, Andrew more clear, but not carrying any information.

Maybe the issue is that some of the information you currently have in
the commit message would be better added as inline comments.  For
example the reasoning about why 2 linker passes are need should better
be added to xen/arch/x86/boot/Makefile IMO.

In any case the code in xen/arch/x86/boot/Makefile needs some
comments.  For example what are the seemingly random values in
text_{gap,diff}?  Could those values be different?

> 
> > >
> > > The description has been there for about 2 months without many objections.
> >
> > IMO it's fine to use lists to describe specific points, but using
> > lists exclusively to write a commit message makes the items feel
> > disconnected between them.
> >
> > The format of the commit message by Andrew is clearer to undertsand
> > for me.  Could you add what you think it's missing to the proposed
> > message by Andrew?
> >
> > Thanks, Roger.
> 
> Probably, as said above, we (me and Andrew) have too many assumptions.

Well, you are the author of the code, so it's expected from you to
provide a suitable commit message that goes together with the change,
as you ultimately knows exactly the reasoning behind the commit code
changes.

Andrew didn't think the provided message was fully suitable and as a
courtesy he suggested an adjusted wording.  He however had no
requirement to do such suggestion, neither you should feel his
verbatim wording is what should be used.

My bias is towards Andrew suggested message (or something along those
lines), because it can be read and parsed as a natural text rather
than unconnected bullet points.  It gives the reader enough context to
understand the intention of the code change.

I agree your commit message contains more details, but as said above,
it's in my opinion better for those implementation details to be added
as comments to the code.

> This commit is doing quite some magic that's not easy to grasp.
> I can try to explain, and possibly you can suggest something that
> makes sense also to people not too involved in this.
> 
> There are quite some challenges here. This code is executed during the
> boot process and the environment is pretty uncommon. Simply writing a
> message is not that easy. We are not sure if we have VGA, serial, BIOS
> or UEFI. We are not executing in the location code was compiled/linked
> to run so assuming it is wrong and causes issue; in other word the
> code/data should be position independent. This code is meant to be
> compiled and run in 32 mode, however Xen is 64 bit, so compiler output
> can't be linked to the final executable.

I've attempted to do something similar in FreeBSD for the PVH entry
point, so that the initial page-tables could be built in C rather than
asm:

https://reviews.freebsd.org/D44451

However there I didn't made the code position independent yet, and I
was using objcopy to convert the object from elf32-i386 to
elf64-x86-64 (sadly such conversion makes FreeBSD elftoolchain objcopy
explode).  I need to find some time to try and fix elftoolchain
objcopy so it can do the conversion.

The above however is much simpler, as FreeBSD PVH entry point is not
(yet) relocatable.

> And obviously you cannot call
> 64 bit code from 32 bit code. Even if code would be compiled and run
> in 64 bit mode, calling functions like printk would probably crash (it
> does, we discovered recently) as Xen code assumes some environment
> settings (in case of printk, just as example, it was missing per-cpu
> info leading to pointer to garbage). In 32 bit mode, you can get code
> position independence with -fpic, but this requires linker to generate
> GOT table but 64 bit linker would generate that table in a position
> not compatible with 32 bit code (and that's not the only issue of
> using 64 bit linker on 32 bit code). So, to solve this code/data is
> linked to a 32 bit object and converted to binary (note: this is an
> invariant, it was done like that before and after this commit). Solved
> the code with -fpic, what about data? Say we have something like
> "const char *message = "hello";"... a pointer is a pointer, which is
> the location of the data pointed. But as said before, we are in an
> uncommon environment where code/data could be run at a different
> location than compiled/linked! There's no magic option for doing that,
> so instead of hoping for the best (as we are doing at the moment) we
> check to not have pointers. How? We link code+data at different
> locations which will generate different binary in that case and we
> compare the 2 binaries to make sure there are no such differences
> (well, this is a simplification of the process).
> 
> 
> So... somebody willing to translate the above, surely poor and
> unclear, explanation is somethig digestible by people less involved in
> it?

I think it would be easier if you could attempt to convert the above
explanation as more concise inline comments.

It would also help if you could add a comment at the top of the
introduced script (xen/tools/combine_two_binaries.py) to describe it's
intended purpose.

Thanks, Roger.

