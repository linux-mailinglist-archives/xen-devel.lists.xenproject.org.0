Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F216588FD98
	for <lists+xen-devel@lfdr.de>; Thu, 28 Mar 2024 11:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698898.1091144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpnS7-0005dS-IX; Thu, 28 Mar 2024 10:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698898.1091144; Thu, 28 Mar 2024 10:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpnS7-0005aF-Fw; Thu, 28 Mar 2024 10:57:47 +0000
Received: by outflank-mailman (input) for mailman id 698898;
 Thu, 28 Mar 2024 10:57:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hucl=LC=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rpnS5-0005a8-LI
 for xen-devel@lists.xenproject.org; Thu, 28 Mar 2024 10:57:45 +0000
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [2607:f8b0:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01128f8a-ecf2-11ee-afe3-a90da7624cb6;
 Thu, 28 Mar 2024 11:57:44 +0100 (CET)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6e6a9e2e2b6so424753a34.1
 for <xen-devel@lists.xenproject.org>; Thu, 28 Mar 2024 03:57:44 -0700 (PDT)
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
X-Inumbo-ID: 01128f8a-ecf2-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1711623463; x=1712228263; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhtDKIuK2M8Bo9W+lzZdZiI3O9xoxqV6+wkF/KfzFoA=;
        b=NgT8BKiUbQzKanHMu/+moj929ISUUE4D/NDMHUFH8rK0UxptkDeiV69Pm1h1wZBaut
         QtYSdz1ef+vA4Z1T13cHrjQVy3hCZAwfQmKl9YBLqZJHQhjZX32WTbJf04MkuIcEWH6i
         MZO6f+fmedqsHCt3pyiF1BPG4hEESBweTeHn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711623463; x=1712228263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhtDKIuK2M8Bo9W+lzZdZiI3O9xoxqV6+wkF/KfzFoA=;
        b=mlaqHW6xgnFm/3LJFgk83DTXxVj+0VbCsmKOjQ/8X0Te/fAYY4HFGIFqQh4Zs63vdq
         b0taUkuqqVsbrIPZuQTIaRWUFU5mm2YDLc6ZxlytG7gxoTj1J7qylNkNrJyx91IpBat8
         UPIjSnMS54z/XmL2Q5EDzGKns5j7Sj1zr5fqoPWcKttzGtYeAN6wy1WLgfuOEhjEWCGo
         3wqJow63nOyb0v4Gx/AHh+EyTJkXz7xnBIJZyHAONOmSOm+W//cszEsbUPmOc2D2ayw3
         uFs1bubTBtU23k2FKYKslE7XiciX+5I6GHNnOOUENJlJgGdHZ7KJG+GDCnxt1c6wZshS
         gaaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgJ7cwp3O5AlcwvbvOp3317ArMG61h6xr7Bjx7T+Bh084tfVEhh+xAnvGWNFarWJjshZpEb19dc1dKIpJMkzkAAng7uIUjrL0fZ4U0GAE=
X-Gm-Message-State: AOJu0Yzn0fRWiCOGdQkRpGr7eU6UY65MkC62bXz7KoPtgA5jWtgZ+ge2
	IiZBvPc21HEyX5hKCL4YJmhXngvIDMkDNXD9ccsxmPVjiTe5Dcf1S11ap3FDwLP9wohumQ7AcSW
	SiwMxjJG6AR0dXXePHp7Jnq+m+ylHJ+GcN8o1HA==
X-Google-Smtp-Source: AGHT+IFX2CPh4cCr3o9H1bDrJgbL6bJQAjkK76rczyRNo/qKvUZ7Oz2i82gtFGelIEHHFhv+sEpdNW628zrt/SJlTd8=
X-Received: by 2002:a05:6871:7813:b0:229:f31d:8c3 with SMTP id
 oy19-20020a056871781300b00229f31d08c3mr1524451oac.50.1711623463250; Thu, 28
 Mar 2024 03:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240313122454.965566-1-george.dunlap@cloud.com>
 <20240313122454.965566-4-george.dunlap@cloud.com> <7a5b3ec3-c122-479a-b714-529e150bf4c0@suse.com>
 <CA+zSX=ZE6uLf12o3WDUpNuZ6Kost=JEfWH0HugGqD43QGPsJ1A@mail.gmail.com> <f4f33db5-a49d-4706-8b55-cfcad916e8cb@suse.com>
In-Reply-To: <f4f33db5-a49d-4706-8b55-cfcad916e8cb@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 28 Mar 2024 10:57:29 +0000
Message-ID: <CA+zSX=ZUfcL-HA_ygLxHkuvmWUu4hdk36Cc+CZPwfsK5akNUSA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] svm/nestedsvm: Introduce nested capabilities bit
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 28, 2024 at 6:44=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
> > As to why to have each vendor independent code check for HAP -- there
> > are in fact two implementations of the code; it's nice to be able to
> > look in one place for each implementation to determine the
> > requirements.  Additionally, it would be possible, in the future, for
> > one of the nested virt implementations to enable shadow mode, while
> > the other one didn't.  The current arrangement makes that easy.
>
> Well, first - how likely is this, when instead we've been considering
> whether we could get rid of shadow mode? And then this is balancing
> between ease of future changes vs avoiding redundancy where it can be
> avoided. I'm not going to insist on centralizing the HAP check, but I
> certainly wanted the option to be considered.

I considered it before replying to you; so consider it considered. :-)

> >>> --- a/xen/arch/x86/hvm/nestedhvm.c
> >>> +++ b/xen/arch/x86/hvm/nestedhvm.c
> >>> @@ -150,6 +150,16 @@ static int __init cf_check nestedhvm_setup(void)
> >>>      __clear_bit(0x80, shadow_io_bitmap[0]);
> >>>      __clear_bit(0xed, shadow_io_bitmap[1]);
> >>>
> >>> +    /*
> >>> +     * NB this must be called after all command-line processing has =
been
> >>> +     * done, so that if (for example) HAP is disabled, nested virt i=
s
> >>> +     * disabled as well.
> >>> +     */
> >>> +    if ( cpu_has_vmx )
> >>> +        start_nested_vmx(&hvm_funcs);
> >>> +    else if ( cpu_has_svm )
> >>> +        start_nested_svm(&hvm_funcs);
> >>
> >> Instead of passing the pointer, couldn't you have the functions return
> >> bool, and then set hvm_funcs.caps.nested_virt from that? Passing that
> >> pointer looks somewhat odd to me.
> >
> > For one, it makes start_nested_XXX symmetric to start_XXX, which also
> > has access to the full hvm_funcs structure (albeit in the former case
> > because it's creating the structure).
>
> This last aspect is the crucial aspect: start{svm,vmx}() are indeed quite
> special because of this. Everywhere else we have accessor helpers when
> hvm_funcs needs consulting, e.g. ...
>
> >  For two, both of them need to read caps.hap.
>
> ... caps _reads_ would want using (an) accessor(s), too.
>
> >  For three, it's just more flexible -- there may be
> > future things that we want to modify in the start_nested_*()
> > functions.  If we did as you suggest, and then added (say)
> > caps.nested_virt_needs_hap, then we'd either need to add a second
> > function, or refactor it to look like this.
>
> Right, I can see this as an argument when taking, as you do, speculation
> on future needs into account. Albeit I'm then inclined to say that even
> such modifications may better be done through accessor helpers.

Why access it through accessor helpers?

I consider that it's the SVM and VMX "construction/setup" code
respectively which "own" hvm_funcs (as evidenced by the fact that they
create the structures and then return them); and I consider the
start_nested_{vmx/svm} to be a part of the same code; so I consider it
valid for them to have direct access to the structure.

> >> Is there a reason to use direct calls here rather than a true hook
> >> (seeing that hvm_funcs must have been populated by the time we make it
> >> here)? I understand we're (remotely) considering to switch away from
> >> using hooks at some point, but right now this feels somewhat
> >> inconsistent if not further justified.
> >
> > Again it mimics the calls to start_vmx/svm in hvm_enable.  But I could
> > look at adding a function pointer to see if it works.
>
> Andrew - do you have any input here towards those somewhat vague plans
> of getting rid of the hook functions? I guess they're more relevant in
> places where we can't easily use the altcall machinery (i.e. not here).

Rather than do all that work collecting information, why don't we just
check it in as it is?  Obviously if we're thinking about getting rid
of hook functions at some point anyway, it can't be all that bad.
There is an aesthetic justification for the lack of hook, in that it's
similar to the start_vmx/svm() functions.

So far I really don't think the remaining "open" changes we're
discussing are worth either of our efforts.  I don't plan to make any
of these changes unless another x86 maintainer seconds your request
(or you can convince me they're worth making).

(The other two changes -- correcting the function name in the commit
message, and removing the extra blank line -- I've already changed
locally, so could check in with your ack.)

 -George

