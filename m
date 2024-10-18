Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4E19A3D81
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 13:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821783.1235733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1lUD-0004z0-In; Fri, 18 Oct 2024 11:49:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821783.1235733; Fri, 18 Oct 2024 11:49:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1lUD-0004x1-FX; Fri, 18 Oct 2024 11:49:41 +0000
Received: by outflank-mailman (input) for mailman id 821783;
 Fri, 18 Oct 2024 11:49:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7i1V=RO=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t1lUC-0004wv-9K
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 11:49:40 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e295180-8d47-11ef-a0be-8be0dac302b0;
 Fri, 18 Oct 2024 13:49:39 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c942815197so1003077a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 18 Oct 2024 04:49:39 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ca0b0ff773sm637081a12.92.2024.10.18.04.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 04:49:38 -0700 (PDT)
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
X-Inumbo-ID: 0e295180-8d47-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729252179; x=1729856979; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gq7a76mJRy4Sh7L0EL4cqmiClIrsIleECH6kmYmxGSU=;
        b=It27yHuf+wLdXgAcvpr7nfUNiWXgNowgaJXby2byt/l63Ipd6rsHr4VAK4b+nl3fXQ
         Wjz0TtbjhBqH70PrfDFuV3VAUYh82QBjmmmq+DKO5nA9Z+8A2TsXBteOJdMkXhsDW64M
         Or2stEpTWBkNaUSEUNv5GwesEXuaxvYme1UE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729252179; x=1729856979;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gq7a76mJRy4Sh7L0EL4cqmiClIrsIleECH6kmYmxGSU=;
        b=dt636yQQ0naBa2bxqhZlHI6P11jHgU7gRPJ8CsvK7wSKPcc5q4uun2pe7gYJSdjEzV
         3MIxGH55YOjOPlsu56I6FvYAEeHGkefqb6iKNFwCCKv+1DuNlj/w6OuwzkxJsi9ZPVIl
         vccg0u3ZKaFPjBdzNkDAFEkwA1ytrwiqBWGbjPDKnu+S3IOhd2H5aHl7hfgY/DhAjrsI
         3iRQQgZCieGUecsumS5jx1i9sm3N5S4Loqjsq9w5cA5Je/GOUDeT0/XByL1tX50VHiGY
         bCyr8DytW8rPNxnTxzJv9lnytxo1IAbHgfnRWLBOGovJ+/UABcwY8c3jUqaQamwKQsOu
         3jVA==
X-Forwarded-Encrypted: i=1; AJvYcCXT4YWLRfUCbziJozKQxepkDRgvVKCMzij6jVuQxLVG/pcCAk+unaKo7KbU14zRQEwaT1fWCLqaUqE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxREqf9ZiskbdwPaUmko5Ac+4F+9Z1ONaMFBGeptDN7ebVBgxSB
	8l+zNtwR1O0KKrGWGpGYJjW0MGFn8KYe1jlAAHBwil5f2VdtmhzgGZrAaUQ5MiU=
X-Google-Smtp-Source: AGHT+IG6muZ4MT9RnZWm0rXxCBeoAavDjEndwGDBfAXMOQW1gDG+m09UHaV83ncnfprPeQ0S0vHkLg==
X-Received: by 2002:a05:6402:234f:b0:5c5:da5e:68e with SMTP id 4fb4d7f45d1cf-5ca0ac43b6bmr2135421a12.3.1729252178597;
        Fri, 18 Oct 2024 04:49:38 -0700 (PDT)
Date: Fri, 18 Oct 2024 13:49:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
Message-ID: <ZxJLUeMFyejFGCLc@macbook.local>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com>
 <a5745a93-1d82-45f1-bb88-81a737ebcce3@citrix.com>
 <CACHz=ZhULqJpE8UK7kZQN0He5Poc85Cr6heTCKj1KLjxcPA6XQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHz=ZhULqJpE8UK7kZQN0He5Poc85Cr6heTCKj1KLjxcPA6XQ@mail.gmail.com>

On Fri, Oct 18, 2024 at 09:42:48AM +0100, Frediano Ziglio wrote:
> On Thu, Oct 17, 2024 at 6:13 PM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> >
> > On 17/10/2024 2:31 pm, Frediano Ziglio wrote:
> > > The current method to include 32 bit C boot code is:
> > > - compile each function we want to use into a separate object file;
> > > - each function is compiled with -fpic option;
> > > - convert these object files to binary files. This operation removes GOP
> > >   which we don't want in the executable;
> > > - a small assembly part in each file add the entry point;
> > > - code can't have external references, all possible variables are passed
> > >   by value or pointer;
> > > - include these binary files in head.S.
> > >
> > > There are currently some limitations:
> > > - code is compiled separately, it's not possible to share a function
> > >   (like memcpy) between different functions to use;
> > > - although code is compiled with -fpic there's no certainty there are
> > >   no relocations, specifically data ones. This can lead into hard to
> > >   find bugs;
> > > - it's hard to add a simple function;
> > > - having to pass external variables makes hard to do multiple things
> > >   otherwise functions would require a lot of parameters so code would
> > >   have to be split into multiple functions which is not easy.
> > >
> > > Current change extends the current process:
> > > - all object files are linked together before getting converted making
> > >   possible to share code between the function we want to call;
> > > - a single object file is generated with all functions to use and
> > >   exported symbols to easily call;
> > > - variables to use are declared in linker script and easily used inside
> > >   C code. Declaring them manually could be annoying but makes also
> > >   easier to check them. Using external pointers can be still an issue if
> > >   they are not fixed. If an external symbol is not declared this gives a
> > >   link error.
> > >
> > > Some details of the implementation:
> > > - C code is compiled with -fpic flags (as before);
> > > - object files from C code are linked together;
> > > - the single bundled object file is linked with 2 slightly different
> > >   script files to generate 2 bundled object files;
> > > - the 2 bundled object files are converted to binary removing the need
> > >   for global offset tables;
> > > - a Python script is used to generate assembly source from the 2
> > >   binaries;
> > > - the single assembly file is compiled to generate final bundled object
> > >   file;
> > > - to detect possible unwanted relocation in data/code code is generated
> > >   with different addresses. This is enforced starting .text section at
> > >   different positions and adding a fixed "gap" at the beginning.
> > >   This makes sure code and data is position independent;
> > > - to detect used symbols in data/code symbols are placed in .text
> > >   section at different offsets (based on the line in the linker script).
> > >   This is needed as potentially a reference to a symbol is converted to
> > >   a reference to the containing section so multiple symbols could be
> > >   converted to reference to same symbol (section name) and we need to
> > >   distinguish them;
> > > - --orphan-handling=error option to linker is used to make sure we
> > >   account for all possible sections from C code;
> > >
> > > Current limitations:
> > > - the main one is the lack of support for 64 bit code. It would make
> > >   sure that even the code used for 64 bit (at the moment EFI code) is
> > >   code and data position independent. We cannot assume that code that
> > >   came from code compiled for 32 bit and compiled for 64 bit is code and
> > >   data position independent, different compiler options lead to
> > >   different code/data.
> > >
> > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> >
> > This commit message is not particularly easy to follow.  Can I recommend
> > the following:
> >
> > ---%<---
> > x86/boot: Rework how 32bit C is linked/included for early boot
> >
> > Right now, the two functions which were really too complicated to write
> > in asm are compiled as 32bit PIC, linked to a blob and included
> > directly, using global asm() to arrange for them to have function semantics.
> >
> > This is limiting and fragile; the use of data relocations will compile
> > fine but malfunction when used, creating hard-to-debug bugs.
> >
> > Furthermore, we would like to increase the amount of C, to
> > deduplicate/unify Xen's boot logic, as well as making it easier to
> > follow.  Therefore, rework how the 32bit objects are included.
> >
> > Link all 32bit objects together first.  This allows for sharing of logic
> > between translation units.  Use differential linking and explicit
> > imports/exports to confirm that we only have the expected relocations,
> > and write the object back out as an assembly file so it can be linked
> > again as if it were 64bit, to integrate with the rest of Xen.
> >
> > This allows for the use of external references (e.g. access to global
> > variables) with reasonable assurance of doing so safely.
> >
> > No functional change.
> > ---%<---
> >
> > which I think is an accurate and more concise summary of what's changing?
> >
> 
> You cut half of the explanation, replacing with nothing.
> Why is a script needed? Why 2 linking? How the new method detects
> unwanted relocations?

TBH this is not clear to me even with your original commit message.

> Why wasn't possible to share functions?
> Why using --orphan-handling option?
> 
> The description has been there for about 2 months without many objections.

IMO it's fine to use lists to describe specific points, but using
lists exclusively to write a commit message makes the items feel
disconnected between them.

The format of the commit message by Andrew is clearer to undertsand
for me.  Could you add what you think it's missing to the proposed
message by Andrew?

Thanks, Roger.

