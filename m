Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 755A69BE666
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 12:59:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830832.1245922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8egH-00053x-5V; Wed, 06 Nov 2024 11:58:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830832.1245922; Wed, 06 Nov 2024 11:58:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8egH-00052L-2M; Wed, 06 Nov 2024 11:58:37 +0000
Received: by outflank-mailman (input) for mailman id 830832;
 Wed, 06 Nov 2024 11:58:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nbp=SB=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1t8egF-00052F-H7
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 11:58:35 +0000
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [2607:f8b0:4864:20::c29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 715578a0-9c36-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 12:58:32 +0100 (CET)
Received: by mail-oo1-xc29.google.com with SMTP id
 006d021491bc7-5eb70a779baso2796474eaf.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 03:58:32 -0800 (PST)
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
X-Inumbo-ID: 715578a0-9c36-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDc6ZjhiMDo0ODY0OjIwOjpjMjkiLCJoZWxvIjoibWFpbC1vbzEteGMyOS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjcxNTU3OGEwLTljMzYtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk0MzEyLjQxMjMzLCJzZW5kZXIiOiJmcmVkaWFuby56aWdsaW9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730894311; x=1731499111; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AImfJ9vw+EpHoODJ/X7mQ+EHHBfmUsTZk3zCFVQxZjc=;
        b=l3+Hx1FLw1SHhpRWl/ptWKiof+7FMBufIFTQoQPpPYJmfyNa/lsYUpbff+uTxeNFWl
         yyhD7xDg05mBKfRnFu6u3soVIrnYGSQpf2/9JSJaK79/yMdFAuM7tsnO+a1g5giUaDWa
         9poY6D45J2+9gNYWYeadhMCWEPK2nkyl8lbEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730894311; x=1731499111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AImfJ9vw+EpHoODJ/X7mQ+EHHBfmUsTZk3zCFVQxZjc=;
        b=nhZNPgdjE2YxX4MEX9kE9bQ7oZFk6YrD0bFA8meb866vM4WX6E7PsJE+M3Epp1s83I
         K0BmsnUc+sZtkiKOTqMSU0ul6Ekdgyhew+7NVXbAXXq1aky03kYQVAW7f5iRH5lesn8f
         0zGHcGqClwjONUF0wOKsNxwjMtfRrNR+RVqiU14nOT24SxAIQYSKaL1tGbWwzzb12OA3
         2VsCe+aFJ0uUSbJ2UpufdmS8/EuOCV1e9OIcP8xsrwdgpnK5oroNsE/GN1cV/nKZxQj7
         q3ekdeWGYOQd9Nkuw4LlgFks85qO9F1DoE0sCYnUwktIRKi2zcTXdoL0+7nJVCfV8JzM
         vVwA==
X-Forwarded-Encrypted: i=1; AJvYcCUMu9m++kYO/jyOkgym+4EvXusm1H+97B1Z/MxckiyJGkUVkAZyWZrlsmmZuTVQCMKKM8ZH/dUtNLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFVPD0d1rzi7KykG6btZktLrHGgSjWD4dt9x/QElnhjLtf/QmW
	TsWBrwgDtEiKtTxFphQE/E3PL2OU0hKhF0m49xxwimP2/CTrBiPTiuySYWA4j3/WU6W68LLzB5p
	gcNQQ3WH1dg6tN/aFBbCE6W25pCzuZcuCjhpgTg==
X-Google-Smtp-Source: AGHT+IEbIMvPNBlo02cPSSvXnTKssW9Y+JabkjAAzMfh6S7zY/P4yryBVoIvsWv0iyySEGKmiBfQPGOJa3f83U1LGYg=
X-Received: by 2002:a4a:a547:0:b0:5ec:c22c:72db with SMTP id
 006d021491bc7-5ecc22c749bmr11350015eaf.2.1730894310998; Wed, 06 Nov 2024
 03:58:30 -0800 (PST)
MIME-Version: 1.0
References: <20241105145507.613981-1-frediano.ziglio@cloud.com>
 <48a22295-f3ac-496b-bdfb-ee17b0ada994@suse.com> <CACHz=ZhrxTSYGyWMQSE0Xi6sW2BZiLDuKkP2508CBRELD-USgQ@mail.gmail.com>
 <816ae079-378b-4bfd-93f2-83c5a281eb01@suse.com> <CACHz=ZhzrZO5o8EarXewC6BzrX4acSyAFsAO2hHBvm9xYRecqg@mail.gmail.com>
 <80296824-760a-48c4-9dce-4875fca0ed31@suse.com> <CACHz=ZgY_O7siQUQZjxGe=gfiB-C9jw1UQqwK9ffuHUUQmRgiQ@mail.gmail.com>
 <cc7802cc-8591-4356-bf7e-3daa912c751c@suse.com>
In-Reply-To: <cc7802cc-8591-4356-bf7e-3daa912c751c@suse.com>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Wed, 6 Nov 2024 11:58:19 +0000
Message-ID: <CACHz=ZjZVPSueWjxfWBjbjg8_UhZc7hMwM49BFT0bipqeBOsSA@mail.gmail.com>
Subject: Re: [PATCH] x86/boot: Fix build with LLVM toolchain
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 11:45=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 06.11.2024 12:34, Frediano Ziglio wrote:
> > On Wed, Nov 6, 2024 at 10:59=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 06.11.2024 07:56, Frediano Ziglio wrote:
> >>> On Tue, Nov 5, 2024 at 5:06=E2=80=AFPM Jan Beulich <jbeulich@suse.com=
> wrote:
> >>>>
> >>>> On 05.11.2024 17:35, Frediano Ziglio wrote:
> >>>>> On Tue, Nov 5, 2024 at 3:32=E2=80=AFPM Jan Beulich <jbeulich@suse.c=
om> wrote:
> >>>>>>
> >>>>>> On 05.11.2024 15:55, Frediano Ziglio wrote:
> >>>>>>> This toolchain generates different object and map files.
> >>>>>>> Account for these changes.
> >>>>>>
> >>>>>> At least briefly mentioning what exactly the differences are would=
 be
> >>>>>> quite nice, imo.
> >>>>>>
> >>>>>
> >>>>> What about.
> >>>>>
> >>>>> Object have 3 additional sections which must be handled by the link=
er script.
> >>>>
> >>>> I expect these sections are there in both cases. The difference, I a=
ssume,
> >>>> is that for the GNU linker they don't need mentioning in the linker =
script.
> >>>> Maybe that's what you mean to say, but to me at least the sentence c=
an also
> >>>> be interpreted differently.
> >>>
> >>> Why do you expect such sections? They are used for dynamic symbols in
> >>> shared objects, we don't use shared objects here. Normal object
> >>> symbols are not handled by these sections. GNU compiler+linker (we
> >>> link multiple objects together) do not generate these sections. So th=
e
> >>> comment looks correct to me.
> >>
> >> About every ELF object will have .symtab and .strtab, and many also a
> >> separate .shstrtab. There's nothing "dynamic" about them. IOW - I'm
> >> confused by your reply.
> >
> > I checked the object files and there are no such sections using GNU too=
lchain.
>
> I think I checked every *.o that's under boot/, and they all have these t=
hree
> sections. Can you clarify which one(s) specifically you checked?
>
> Jan

$ gcc --version
gcc (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

$ ld --version
GNU ld (GNU Binutils for Ubuntu) 2.38
Copyright (C) 2022 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public Licence version 3 or (at your option) a later versio=
n.
This program has absolutely no warranty.

$ find xen/normal/ xen/pvh/ -name \*.o | xargs -ifilename sh -c
'objdump -x filename' | grep -e \\.
shstrtab -e \\.strtab -e \\.symtab

(xen/normal and xen/pvh are the build directory, with different configurati=
ons)

I'm saying that's possibly why the linker scripts didn't need to
specify these sections.

Frediano

