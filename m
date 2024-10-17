Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F85A9A2066
	for <lists+xen-devel@lfdr.de>; Thu, 17 Oct 2024 12:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.820507.1233997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ODN-00079C-Lm; Thu, 17 Oct 2024 10:58:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 820507.1233997; Thu, 17 Oct 2024 10:58:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1ODN-00076Y-J0; Thu, 17 Oct 2024 10:58:45 +0000
Received: by outflank-mailman (input) for mailman id 820507;
 Thu, 17 Oct 2024 10:58:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZcP3=RN=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t1ODM-00076O-2J
 for xen-devel@lists.xenproject.org; Thu, 17 Oct 2024 10:58:44 +0000
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [2607:f8b0:4864:20::c2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3d1ab9b-8c76-11ef-99a3-01e77a169b0f;
 Thu, 17 Oct 2024 12:58:39 +0200 (CEST)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-5eb6af75247so543364eaf.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Oct 2024 03:58:39 -0700 (PDT)
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
X-Inumbo-ID: c3d1ab9b-8c76-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729162718; x=1729767518; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RQAYVMACj1L6HNtzZ0Ew1iP17vAqK5x4Ctpo10szQg=;
        b=SKSFIxWvhvKY5/aSaWlHUWISP5twSM9KIgc97SigTbdfmCoM8imZzxkxUvtDmrs3+P
         0zBDwjOwmVN2viczaBoMRC16WMtvuaXwqFwHg4UBcrYM4PjGJM5Mxk74keDhHlF+FTDT
         JpinZGwoFIzjsYiZU/soCfevfbbmis0QBpYG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729162718; x=1729767518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RQAYVMACj1L6HNtzZ0Ew1iP17vAqK5x4Ctpo10szQg=;
        b=un/ObdE4FaiWtb3vcRRTatu2SrRqdwzTBFKxiOQe4IbF0drhR7QKmZY1nxOzZTo5jA
         ekY3vHVyNUhbfUJr4AacYZHfHsR4kWNiRd7sk3rao/R8cC46tBTIWVpiU6G8I6xatrEn
         i6Yv3sNV55CMWcAA0lgIezhHq83cCjI/y6/eGWujFZ7cn0Bbwv+5+WOwTk+gkGeIQn67
         bbLTTPf52JUQ1Xuwz/JxEN2xpnbjWGicpTa2raNDRbjh2ktBj/jNtLc2SvRXNl8u+DD5
         wTtjKK52Zt3e5RUy3NMoTYgYU5jSHpAx3+Dv2o0q41C4KDY0KfpoFSFMQO1xgsQrU9j5
         W6cA==
X-Gm-Message-State: AOJu0Yze0trv/DpxN0frvJzzVtJe2M/hc04GkZAZ3IGZ8laRn+cMP+QT
	Xue07HR/XnnluB3cLjffeOEI4KWllPWjs/93CNoTYgGLPIU4R6ViReUkDcnLb1/yHyt57YLQtMo
	SpDP3Gzr0XXjycPN942UUqmaUbeaR1CJq3CClSA==
X-Google-Smtp-Source: AGHT+IEUfPadMPN21s2LWl6NBeoZSQEXHh7XJgpKfU800TmWqTHG9opdWeYejs2kp6tjPPaZEsnAImOV4+DcZLt6BU4=
X-Received: by 2002:a05:6820:1689:b0:5eb:827b:9bbf with SMTP id
 006d021491bc7-5eb827ba269mr16938eaf.7.1729162718601; Thu, 17 Oct 2024
 03:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241014085332.3254546-1-frediano.ziglio@cloud.com>
 <20241014085332.3254546-3-frediano.ziglio@cloud.com> <Zw05Tb8UvCQAIo+n@l14>
 <CACHz=ZiaSyr_6y=tniF6Kq7JcFjeoVse-dAX7TF3bsvL-r3jRg@mail.gmail.com>
 <Zw5zSURbpInM5oBY@l14> <CACHz=ZgN9qNygJWuWovpiU+MCGcJu9qaxaRT1VkkiHsYwbEN4A@mail.gmail.com>
 <Zw+it8oVVTrS62wx@l14> <CACHz=ZgD-Zf7_R+RWWO1o8qkZbEC0uPjmz2kMJ83qQ8jXmd2JA@mail.gmail.com>
In-Reply-To: <CACHz=ZgD-Zf7_R+RWWO1o8qkZbEC0uPjmz2kMJ83qQ8jXmd2JA@mail.gmail.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Thu, 17 Oct 2024 11:58:27 +0100
Message-ID: <CACHz=ZghYq0Mzd8=QhhD5HKMqCVm1-0bRK3FRU-vyoE6mENnOQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] x86/boot: create a C bundle for 32 bit boot code
 and use it
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 16, 2024 at 4:05=E2=80=AFPM Frediano Ziglio
<frediano.ziglio@cloud.com> wrote:
>
> On Wed, Oct 16, 2024 at 12:25=E2=80=AFPM Anthony PERARD
> <anthony.perard@vates.tech> wrote:
> >
> > On Wed, Oct 16, 2024 at 09:33:32AM +0100, Frediano Ziglio wrote:
> > > On Tue, Oct 15, 2024 at 2:51=E2=80=AFPM Anthony PERARD <anthony.perar=
d@vates.tech> wrote:
> > > > On Mon, Oct 14, 2024 at 05:32:26PM +0100, Frediano Ziglio wrote:
> > > > > On Mon, Oct 14, 2024 at 4:31=E2=80=AFPM Anthony PERARD <anthony.p=
erard@vates.tech> wrote:
> > > > > > On Mon, Oct 14, 2024 at 09:53:28AM +0100, Frediano Ziglio wrote=
:
> >
> > > > BTW, do we need the rules that generate the input of this rules
> > > > (built_in_32.tmp.o that is), or can this one takes all 32bit object=
s as
> > > > input?
> > > >
> > >
> > > Better not to do it In some conditions it can generate slightly
> > > different results (like different object alignments) making the
> > > algorithm fail.
> >
> > Ok. Thanks for the explanation.
> >
> > > > > > > +# generate final object file combining and checking above bi=
naries
> > > > > > > +$(obj)/built_in_32.S: $(obj)/built_in_32.other.bin $(obj)/bu=
ilt_in_32.final.bin
> > > > > >
> > > > > > So, "other" isn't part of "final", I don't really know what tho=
se two
> > > > > > things contains so naming wise I can't suggest anything useful.
> > > >
> > > > Instead of "other", is "control" (like in science experiment where =
you
> > > > have a control group), or "offseted" (which seems to be how this se=
cond
> > > > binary is constructed) would be better names for this *.bin? It see=
ms
> > > > the script take both input and play the game of the 7 differences, =
to
> > > > find clues about the location of some symbols, right?.
> > > >
> > >
> > > I don't know the game and I think people not familiar with it won't
> > > find new names more readable but less.
> >
> > Sorry, the "game" as nothing to do with the name I've proposed. I was
> > just asking if the script take both *.bin and was looking for
> > differences.
> >
> > (The game of 7 differences is simple: there's two similar pictures and
> > you just look for the 7 differences between them, that's it.)
> >
> > > Not saying that current names are good, they just need to be located
> > > at different addresses with some "magic" in the middle.
> >
> > Well to me "other" evoke a binary that contains functions that are not
> > in "final", but instead they both contain the sames functions with
> > slight variation of placement in the file (with added offset, gap), as =
I
> > understand. But if you don't like my proposal, so be it.
> >
>
> What about "base" and "offsetted" ? I don't know why "offsetted"
> sounds weird to me but I didn't find anything better. I hope some
> native English speaker could come with a better proposal.
>

What about "base" and "bias"/"biased" ?

Frediano

