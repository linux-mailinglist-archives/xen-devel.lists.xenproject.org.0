Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 880B11FC106
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 23:32:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlJBh-0001k9-Hr; Tue, 16 Jun 2020 21:32:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6FtR=75=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1jlJBg-0001k4-Cr
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 21:32:08 +0000
X-Inumbo-ID: d3eecb76-b018-11ea-b7bb-bc764e2007e4
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3eecb76-b018-11ea-b7bb-bc764e2007e4;
 Tue, 16 Jun 2020 21:32:07 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j10so155430wrw.8
 for <xen-devel@lists.xenproject.org>; Tue, 16 Jun 2020 14:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bbz7zOoIy337G+1SGLsqaVhTrFOdE+Yf7K/dfCuRs/Y=;
 b=ZYIi+dQC4hdwvsBnGanamlYlCuTHULL5eSdfLxA91lTgkXgQlzAF2iv6wnjRdni/MN
 blflkRTfLy80iJk9lXxBPTrnhtVNnBjwlQapePycRPsNg9mOr3A60mrToN8aJrGM3Icy
 BAr1jzmIOhLKPSYLig0WbTUwwDbDujUGGPqlEHc/vhxl/EeXjaDf2XbfuRhytQIYwpyC
 QoPS9mRC083BX4gKB7WB7i5MpPw6MksACI21PzGjAfPPpqPddCbBANy0NlSa3UreHf5H
 dz4VBB6WK+TDykGKIF8GkDrF4+Hn87uZu0Qha4L3DMEmy3UYCo+vmNqI7xjeDadchzG8
 xU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bbz7zOoIy337G+1SGLsqaVhTrFOdE+Yf7K/dfCuRs/Y=;
 b=kPWRgOV3UmMyGwR0Ce2GTHBOpcWV36fdDWBETL2uFtu9M6oihYoh9tC9Py+WTrBbpQ
 0SBdg9/6rP1mJI0oaFsKm96rEpb/cJFFeBK+ViHUmoOh49Qs/KtazZOd7hep5LzfK2pj
 uEdoFtnho6BlaIaDs8KOH6WWnn3afu2L2w9VbT02lEvZZNRCeVg2punBtATdTMhR6Fws
 9HP20sZMtZ1ab+Nc2kbzDG+eYKYegKDJIGEhmw86D8ufPNjeT8PvD98+vu54Fs6ORiqo
 c4DU3H3Vga1tqjQ7bzctWq9VARN5mLmSGfuY134ewcd8+ljfI9GnNGzbyAaYahUPE2pd
 vm9Q==
X-Gm-Message-State: AOAM531DySTWiWOc9NGlvzACJQiRCvZg/THZJXZ752CQWiesGwn7r9V9
 7pfg2B2R+0WEDgxpM68Knhib5t6kFPXjqc3c514=
X-Google-Smtp-Source: ABdhPJz31/tpJkRxBSJhdm9rc3q6KemybgUsS47j/u/6ubu7LDZmyAckJIIYRlmOAUaPYIrXlhqnUssQGf00KMdtOTI=
X-Received: by 2002:adf:f64e:: with SMTP id x14mr5213028wrp.426.1592343126573; 
 Tue, 16 Jun 2020 14:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200613184132.11880-1-julien@xen.org>
 <alpine.DEB.2.21.2006151343430.9074@sstabellini-ThinkPad-T480s>
 <35c8373f-b691-d95e-17de-021c72faf216@xen.org>
 <alpine.DEB.2.21.2006161322210.24982@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006161322210.24982@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 16 Jun 2020 22:31:55 +0100
Message-ID: <CAJ=z9a2cnMUiYBz+hA2_hjf5ShVh66tUwE9kbjqSM-H0TkTbyw@mail.gmail.com>
Subject: Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely
 the padding for all arches
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 16 Jun 2020 at 21:57, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> On Tue, 16 Jun 2020, Julien Grall wrote:
> > On 16/06/2020 02:00, Stefano Stabellini wrote:
> > > On Sat, 13 Jun 2020, Julien Grall wrote:
> > > > From: Julien Grall <jgrall@amazon.com>
> > > >
> > > > The documentation of pvcalls suggests there is padding for 32-bit x86
> > > > at the end of most the structure. However, they are not described in
> > > > in the public header.
> > > >
> > > > Because of that all the structures would be 32-bit aligned and not
> > > > 64-bit aligned for 32-bit x86.
> > > >
> > > > For all the other architectures supported (Arm and 64-bit x86), the
> > > > structure are aligned to 64-bit because they contain uint64_t field.
> > > > Therefore all the structures contain implicit padding.
> > > >
> > > > The paddings are now corrected for 32-bit x86 and written explicitly for
> > > > all the architectures.
> > > >
> > > > While the structure size between 32-bit and 64-bit x86 is different, it
> > > > shouldn't cause any incompatibility between a 32-bit and 64-bit
> > > > frontend/backend because the commands are always 56 bits and the padding
> > > > are at the end of the structure.
> > > >
> > > > As an aside, the padding sadly cannot be mandated to be 0 as they are
> > > > already present. So it is not going to be possible to use the padding
> > > > for extending a command in the future.
> > > >
> > > > Signed-off-by: Julien Grall <jgrall@amazon.com>
> > > >
> > > > ---
> > > >      Changes in v3:
> > > >          - Use __i386__ rather than CONFIG_X86_32
> > > >
> > > >      Changes in v2:
> > > >          - It is not possible to use the same padding for 32-bit x86 and
> > > >          all the other supported architectures.
> > > > ---
> > > >   docs/misc/pvcalls.pandoc        | 18 ++++++++++--------
> > > >   xen/include/public/io/pvcalls.h | 14 ++++++++++++++
> > > >   2 files changed, 24 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/docs/misc/pvcalls.pandoc b/docs/misc/pvcalls.pandoc
> > > > index 665dad556c39..caa71b36d78b 100644
> > > > --- a/docs/misc/pvcalls.pandoc
> > > > +++ b/docs/misc/pvcalls.pandoc
> > > > @@ -246,9 +246,9 @@ The format is defined as follows:
> > > >                           uint32_t domain;
> > > >                           uint32_t type;
> > > >                           uint32_t protocol;
> > > > -                         #ifdef CONFIG_X86_32
> > > > +                 #ifndef __i386__
> > > >                           uint8_t pad[4];
> > > > -                         #endif
> > > > +                 #endif
> > >
> > >
> > > Hi Julien,
> > >
> > > Thank you for doing this, and sorry for having missed v2 of this patch, I
> > > should have replied earlier.
> > >
> > > The intention of the #ifdef blocks like:
> > >
> > >    #ifdef CONFIG_X86_32
> > >      uint8_t pad[4];
> > >    #endif
> > >
> > > in pvcalls.pandoc was to make sure that these structs would be 64bit
> > > aligned on x86_32 too.
> > >
> > > I realize that the public header doesn't match, but the spec is the
> > > "master copy".
> >
> > So far, the public headers are the defacto official ABI. So did you mark the
> > pvcall header as just a reference?
>
> No, there is no document that says that the canonical copy of the
> interface is pvcalls.pandoc. However, it was clearly spelled out from
> the start on xen-devel (see below.)
> In fact, if you notice, this is the
> first document under docs/misc that goes into this level of details in
> describing a new PV protocol. Also note the title of the document which
> is "PV Calls Protocol version 1".

While I understand this may have been the original intention, you
can't expect a developer to go through the archive to check whether
he/she should trust the header of the document.

>
>
> In reply to Jan:
> > A public header can't be "fixed" if it may already be in use by
> > anyone. We can only do as Andrew and you suggest (mandate textual
> > descriptions to be "the ABI") when we do so for _new_ interfaces from
> > the very beginning, making clear that the public header (if any)
> > exists just for reference.
>
> What if somebody took the specification of the interface from
> pvcalls.pandoc and wrote their own headers and code? It is definitely
> possible.

As it is possible for someone to have picked the headers from Xen as
in the past public/ has always been the authority.

> At the time, it was clarified that the purpose of writing such
> a detailed specification document was that the document was the
> specification :-)

At the risk of being pedantic, if it is not written in xen.git it
doesn't exist ;).

Anyway, no matter the decision you take here, you are going to
potentially break one set of the users.

I am leaning towards the header as authoritative because this has
always been the case in the past and nothing in xen.git says
otherwise. However I am not a user of pvcalls, so I don't really have
any big incentive to go either way.

For the future, I would highly suggest writing down the support
decision in xen.git. This would avoid such debate on what is the
authority...

Cheers,

-- 
Julien Grall

