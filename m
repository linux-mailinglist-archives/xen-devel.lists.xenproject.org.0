Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 291649A5DE3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 10:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823232.1237195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2nMQ-0005mm-6O; Mon, 21 Oct 2024 08:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823232.1237195; Mon, 21 Oct 2024 08:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2nMQ-0005kq-2j; Mon, 21 Oct 2024 08:01:54 +0000
Received: by outflank-mailman (input) for mailman id 823232;
 Mon, 21 Oct 2024 08:01:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAaI=RR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t2nMO-0005kk-OA
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 08:01:52 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba3a2219-8f82-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 10:01:50 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-431481433bdso43865935e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 01:01:50 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4316f57e66asm47939415e9.13.2024.10.21.01.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 01:01:49 -0700 (PDT)
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
X-Inumbo-ID: ba3a2219-8f82-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729497710; x=1730102510; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b5CztZD253iwPne0j5dpy1DVfOcw8GxwGQPFHqNnCTQ=;
        b=pm47wQwj/D6wgSa85/1gBy15nclUHvwYAFVUt8Y/7hWTXhOp+h6c1wmdAJ535VXO8a
         bNehK30982Ljnmz2p7j43AEZwN9CrbFVim6piqK0qVQig9Et8/NJDUj0Lf0rnpjZrkSp
         4QwrHtaDKpGrGa6J4Cw1QRPirJUTn9W4xvrfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729497710; x=1730102510;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b5CztZD253iwPne0j5dpy1DVfOcw8GxwGQPFHqNnCTQ=;
        b=W0m1SLyK5N8URhqGnMgR3zERw/79j+u+yW+YegOTIKGpAYIJLOQSV2LHUD4+v3YhZR
         Z+B032UuyXw6mUnsrgJ6Qt1hR/zlLZjLA+sUZHXWFTs1kN2V+dFXlmW6eam+ExSAOgBZ
         i80/NVnMbM4NdNFEn+IKbo1RipBPZURfWsi3kbZEbFhqVbBQLW8oeGyXZhFoIR8CL93p
         ig+Algb7r6KAiQ/1fOttGhQQXbXgQzGHV+4ODH1RNkIyypKL5ngAX+WmocVxOCpx6hfN
         cqsM2O6rv5+hBVCkvcO6x1ohv8c3dGcwRh997gXV/5JoGlg/gsLz2Cfn/zxHoA1wo5SX
         2AuQ==
X-Gm-Message-State: AOJu0YxnwuYQU4Jv1mTlg/9sd+YfTyXfUp3ZWnzwpzF6J7MzWWcdyN2p
	tlRSM9qDVwA+EfStLTMyRr9q7xOVrhQJdpoMCmi6VihsHB7cacXgCYU70nRRWgA=
X-Google-Smtp-Source: AGHT+IGyZcU3xWApCGtJ7eHgJq8TR0dl3Zs2cELwEwn4QQUtGojLfNmGD9cLUlGBXydg05H+xhFnNw==
X-Received: by 2002:a05:600c:474e:b0:42c:b52b:4335 with SMTP id 5b1f17b1804b1-4316162875bmr83229645e9.10.1729497710059;
        Mon, 21 Oct 2024 01:01:50 -0700 (PDT)
Date: Mon, 21 Oct 2024 10:01:48 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v6 1/5] x86/boot: create a C bundle for 32 bit boot code
 and use it
Message-ID: <ZxYKbMzsjtcKlTdR@macbook.local>
References: <20241017133123.1946204-1-frediano.ziglio@cloud.com>
 <20241017133123.1946204-2-frediano.ziglio@cloud.com>
 <ZxJJZvOCQLzU_Q5s@macbook.local>
 <CACHz=Zif6tirzF3QSLYLOvDFuaE3o9=Cu+ybm4ns7vNkAKCROg@mail.gmail.com>
 <ZxJbmIU4OUmeO3xq@macbook.local>
 <CACHz=ZiHp40-MkkbfnnNi2yQaB89_PA9VU_cLrTX4LHY6o7j6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACHz=ZiHp40-MkkbfnnNi2yQaB89_PA9VU_cLrTX4LHY6o7j6w@mail.gmail.com>

On Fri, Oct 18, 2024 at 02:45:59PM +0100, Frediano Ziglio wrote:
> On Fri, Oct 18, 2024 at 1:59 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Fri, Oct 18, 2024 at 01:48:27PM +0100, Frediano Ziglio wrote:
> > > On Fri, Oct 18, 2024 at 12:41 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> > > >
> > > > On Thu, Oct 17, 2024 at 02:31:19PM +0100, Frediano Ziglio wrote:
> > > > > +#define DECLARE_IMPORT(name) name = . + (__LINE__ * MULT)
> > > > > +
> > > > > +ENTRY(dummy_start)
> > > > >
> > > > >  SECTIONS
> > > > >  {
> > > > >    /* Merge code and data into one section. */
> > > > > -  .text : {
> > > > > +  .text TEXT_START : {
> > > > > +        /* Silence linker warning, we are not going to use it */
> > > > > +        dummy_start = .;
> > > > > +
> > > > > +        /* Declare below any symbol name needed.
> > > > > +         * Each symbol should be on its own line.
> > > > > +         * It looks like a tedious work but we make sure the things we use.
> > > > > +         * Potentially they should be all variables. */
> > > >
> > > > The style is wrong for the opening and closing comment delimiters.
> > > >
> > > > I think it would be best if this was written in a more natural style.
> > > >
> > > > /*
> > > >  * Any symbols used should be declared below, this ensures which
> > > >  * symbols are visible to the 32bit C boot code.
> > > >  */
> > > >
> > >
> > > But why to remove the "Potentially they should be all variables.".
> > > Surely something not written is more clear than something written, but
> > > on the other way it carries no information.
> >
> > I'm not sure I understand why this is helpful: either they are
> > mandated to be only variables, and hence the "potentially" is wrong, or
> > they are not, in which case I don't see why spelling a desire for they
> > to be only variables is helpful if it's not a strict requirement.
> >
> 
> As normal, rules often have exceptions. Most of the functions (so
> code) in Xen is 64 bit, so you don't want to use them. However, saying
> you have a function in head.S written in assembly for 32 bit (or any
> other functions written for 32 bit), you want the possibility to call
> it. For instance you could export from head.S the function to output
> to serial in the future.
> 
> About variables... are all variables fine to be accessed from these
> functions? Probably yes if they have no pointers in them. If they have
> pointers... that's another matter. Does the pointer have relocation?
> Is it going to be used at the final defined program location or only
> during initialization? To make an example, you could override a NULL
> pointer (that is, without relocation) to a current symbol, if this
> pointer is used after Xen is moved into its final position it will
> become invalid. If, on the other hand, the pointer had relocation
> potentially it will be automatically be relocated.

IMO comments are meant to clarify parts of the code.  A comment that
uses a conditional like "Potentially" introduces more ambiguity than
it removes, unless the restriction is stated in the comment itself.

I think you either you expand the comment to mention exactly which
kind of symbols can be declared, or you make the comment a more
restrictive one to avoid the ambiguity: "Symbols declared below should
all be variables."

Thanks, Roger.

