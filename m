Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B8B9BE44F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 11:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830682.1245755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8dKo-0001rZ-H4; Wed, 06 Nov 2024 10:32:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830682.1245755; Wed, 06 Nov 2024 10:32:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8dKo-0001pg-EP; Wed, 06 Nov 2024 10:32:22 +0000
Received: by outflank-mailman (input) for mailman id 830682;
 Wed, 06 Nov 2024 10:32:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bDCL=SB=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1t8dKn-0001pa-2Z
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 10:32:21 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6536dcf6-9c2a-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 11:32:17 +0100 (CET)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-6cc1b20ce54so49144276d6.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 02:32:17 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b2f3a7045bsm613005285a.73.2024.11.06.02.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Nov 2024 02:32:16 -0800 (PST)
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
X-Inumbo-ID: 6536dcf6-9c2a-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpmMmMiLCJoZWxvIjoibWFpbC1xdjEteGYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjY1MzZkY2Y2LTljMmEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODg5MTM3Ljk4MjAxNywic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730889137; x=1731493937; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5ug+8yUmUz/riJemywkNroUYH8TsAcAXvogRYtfb1Y=;
        b=AdA8JHYOpjIGxPtcvWyzTNt0FGWAUf0MwJFCICCQ+rrVO2LJEv1kPhwEoqAmzq0unw
         i//FdFraVa7nrz11Q3vnQeiHF4vMvvYpGrCjHTDrL0DVCxVRZGGwwd04+dh4WAdKH/uq
         BhL2nVuOOzevcIt8hYnQgAWKH5KE7NaH0e1Dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730889137; x=1731493937;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t5ug+8yUmUz/riJemywkNroUYH8TsAcAXvogRYtfb1Y=;
        b=ASrJTzaBrYk3IoFDdKNPK7yfx/GG5qH7xCNRuYR6pgQesss13jrcuQqFXgOIxaKT8W
         g0AGo6gJ3pGs6ReoYhOwdItURJPUCc7orM9AgsByFBPQilZeKzjFNZDzMPE4wx5Em58O
         o3KxS32U5Ovq2T3fXD7rtS4rOUDeKeoyCz82sncsqKBlwPkzFT3LSSUAXKJ0f1YnaApG
         SatKpgYttPdU3IYIvI6IItCOHjAzZjEoFZ0ZqWRhdmpSU6YIkUbvEqherMOMkYDLlmAX
         WLXRzO4hfhezLbj4CkebGbUtUMfpGoKU+RAiI/F0MkF+BJdMggnNwUQxZOExx/rOoyCt
         Wn7A==
X-Forwarded-Encrypted: i=1; AJvYcCVv2FkZzgR6cyW6gQ43zPfCQOr36jSKerezycRPDqQQ2bftdws2qInW8ykGFlCKFcV08KpeRniBh/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzAX6cSqckxOQuDCZgM7k+pvoXhmtE5XM8SSk0WIAF1GJoeqsSl
	IcRtFaHtUSJ1wX2Qo+FcXlBhLzQyurbCHzDfh6+OYLS7HbJNIxFZrAHM9Hi+zT8=
X-Google-Smtp-Source: AGHT+IH4HxPmCSR5RMLQFZAp5Zi7SQkRBzzbfIDjiPQ6eRplk0s0VJvHNCY1BuHJjZ2sw16Z744rpQ==
X-Received: by 2002:a05:6214:540d:b0:6cc:1f0:d38a with SMTP id 6a1803df08f44-6d35c0f9e90mr275414016d6.14.1730889136775;
        Wed, 06 Nov 2024 02:32:16 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Nov 2024 10:32:14 +0000
Message-Id: <D5F0ZMVQEIKF.2I3XTFQGPPA3M@cloud.com>
Cc: "Jan Beulich" <jbeulich@suse.com>, =?utf-8?q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Julien Grall" <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/boot: Fix build with LLVM toolchain
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Frediano Ziglio"
 <frediano.ziglio@cloud.com>, <xen-devel@lists.xenproject.org>
X-Mailer: aerc 0.18.2
References: <20241105145507.613981-1-frediano.ziglio@cloud.com>
 <89022703-f814-4d81-87ec-5651f5e950c4@citrix.com>
In-Reply-To: <89022703-f814-4d81-87ec-5651f5e950c4@citrix.com>

On Tue Nov 5, 2024 at 7:23 PM GMT, Andrew Cooper wrote:
> On 05/11/2024 2:55 pm, Frediano Ziglio wrote:
> > diff --git a/xen/tools/combine_two_binaries.py b/xen/tools/combine_two_=
binaries.py
> > index 447c0d3bdb..79ae8900b1 100755
> > --- a/xen/tools/combine_two_binaries.py
> > +++ b/xen/tools/combine_two_binaries.py
> > @@ -67,13 +67,22 @@ if args.exports is not None:
> > =20
> >  # Parse mapfile, look for ther symbols we want to export.
> >  if args.mapfile is not None:
> > -    symbol_re =3D re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
> > +    symbol_re_clang =3D \
> > +        re.compile(r'\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-9a-f]+)\s+([0-=
9a-f]+)\s{15,}(\S+)\n')
> > +    symbol_re_gnu =3D re.compile(r'\s{15,}0x([0-9a-f]+)\s+(\S+)\n')
>
> These are specific to the linker, not the compiler, so really should be
> _ld and _lld rather than _gnu and _clang.

GNU binutils ships not one, but two linkers. _ld does not reflect the fact =
that
it's not the map format of a linker, but a family of them. Probably shared =
by
mold too. That's a good reason for _gnu to stay _gnu (or if changing, to
_binutils; but that's hardly relevant in this patch).

Otherwise _clang could become either _llvm or _lld. Given there's a single
linker shipped by LLVM the difference is less than cosmetic.

>
> The build environment does have CONFIG_LD_IS_GNU which is used for one
> LD vs LLD distinction.=C2=A0 It seems reasonable to re-use it here (so yo=
u're
> not trying both regexes in the hope that one works), although you'll
> need to plumb it into the script somehow because it's not exported into
> the environment currently.
>
>
> But, regexes are utterly opaque, and given that neither Binutils nor
> LLVM document their map format, you really need to provide at least one
> example of what a relevant mapfile looks like in a comment.
>
> Looking at built-in-32.offset.map in it's gnu form, it's presumably
> looking for the lines that are just a hex address and a name with no
> other punctuation.
>
> But the lld form is clearly different.
>
> ~Andrew

Cheers,
Alejandro

