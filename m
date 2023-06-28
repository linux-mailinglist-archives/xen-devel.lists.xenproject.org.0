Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D9741803
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 20:29:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556551.869161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEZuC-00033d-95; Wed, 28 Jun 2023 18:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556551.869161; Wed, 28 Jun 2023 18:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEZuC-00030n-5i; Wed, 28 Jun 2023 18:28:40 +0000
Received: by outflank-mailman (input) for mailman id 556551;
 Wed, 28 Jun 2023 18:28:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHv2=CQ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qEZuA-00030R-WE
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 18:28:39 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97f7dfc9-15e1-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 20:28:38 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f766777605so8675494e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Jun 2023 11:28:35 -0700 (PDT)
Received: from [192.168.203.175] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 r4-20020ac25a44000000b004fb86662871sm715047lfn.233.2023.06.28.11.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 11:28:34 -0700 (PDT)
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
X-Inumbo-ID: 97f7dfc9-15e1-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687976915; x=1690568915;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zWVZTP9gogT+Pci8qVD/lZisHNgTQ0LkHWBj3W8Ggvw=;
        b=qAPH4CNkHA/brLCzjwyCOAiW8qANo1okfoyiFBbXG12uqBdHhVmHPjrf2VRIlV8zjG
         /uVYelPfgwSbUYVQ7qtEUNVQKW6lmm/K4QZqhsMLhP3XDuNsrnQ8qTgfwa7n+AVle9b8
         pcneFTVxuhIlypHFOcYbEKdw4Cu1JfLQtp0370eFaRFX3Dtxd+MZrlXhcMjZheRmxZvw
         HGsbNGNuLUa0DJ1Bb78F2AEOgqfG+MwAnl4VKNIl4qRdHdTW3CtHgMDrekOrlw9DoLDd
         mQps3v/SXUAmdoR/ha/WYiW0zUWHWRuwkLhi3UeRYlEVHziiQeYdDFL8xLHbbn4majE0
         FkKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687976915; x=1690568915;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zWVZTP9gogT+Pci8qVD/lZisHNgTQ0LkHWBj3W8Ggvw=;
        b=jEIjdLTluIeqZBqz6g3GSsSW5pFnmc3qplKcnnjzgNTBZk6+VOdv1ZHpYvCh5BbY6O
         CfEuJ+0mwRa9GVy8wreoxXF8JDeiPZuK4e/9oyd2tLkIeDMMKSEUnIo38Twj7tYvplsb
         BInn2rpvZBH33S/zKpYMLBZI3FmKRneMK4RfTjBuhW+tpfbJoEpTpSPFUUo3YVWTHYGH
         DLtdqyzBG1j01C1myaJStdMVcxUNkdkSelp3DWAgtAGhsrF9mm1BZbyLpwjdqJu+IHYg
         GkduaqDXPv93PWJ/GUe1yUd2U5cpysi0PcXbkKzwIxnn9RaE9NocgeYRoZYsD8gM0T19
         mk1Q==
X-Gm-Message-State: AC+VfDyAmXb+jMATCpsZIsrk/Gt5ee7Wiotopp6D/f0GTu37shanxqBZ
	MTB/Nn9bB4T2ZcZcEpnxu0w=
X-Google-Smtp-Source: ACHHUZ4AyOXoxYKbRYOwUk9e80pcMfnVyQgt36u5ftnRMgPEmg6sA5carxOiM5hWmAHcivSMwxQ1AQ==
X-Received: by 2002:a19:5e47:0:b0:4f3:b708:f554 with SMTP id z7-20020a195e47000000b004f3b708f554mr19683248lfi.47.1687976914828;
        Wed, 28 Jun 2023 11:28:34 -0700 (PDT)
Message-ID: <e3404d23b873f42e41b8f832ed81cdb097a7ba06.camel@gmail.com>
Subject: Re: XenSummit: Empty per-arch files
From: Oleksii <oleksii.kurochko@gmail.com>
To: Juergen Gross <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bobby Eshleman <bobbyeshleman@gmail.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Connor Davis
 <connojdavis@gmail.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Timothy Pearson
 <tpearson@raptorengineering.com>
Date: Wed, 28 Jun 2023 21:28:33 +0300
In-Reply-To: <bc49c9cd-0ff1-2f8b-6a0b-53c3f194e39b@suse.com>
References: <2aabfb63-1a2f-bb02-488a-ea79136bc6c0@citrix.com>
	 <58622fcf-0939-95c5-7318-60c93307f991@suse.com>
	 <2a195157-fe59-3bfd-f5cb-c377d883cef4@citrix.com>
	 <bc49c9cd-0ff1-2f8b-6a0b-53c3f194e39b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0

Hello,

On Wed, 2023-06-28 at 15:54 +0200, Juergen Gross wrote:
> On 28.06.23 15:46, Andrew Cooper wrote:
> > On 28/06/2023 2:26 pm, Juergen Gross wrote:
> > > On 28.06.23 13:32, Andrew Cooper wrote:
> > > > Hello,
> > > >=20
> > > > This wasn't a formal discussion point at XenSummit, but Oleksii
> > > > pointed
> > > > out that it was still a problem, hence this thread.
> > > >=20
> > > > As we take on more architectures, it becomes more and more
> > > > important for
> > > > things to be handled in a mostly-common way.=C2=A0 With that comes
> > > > quite a
> > > > lot of <xen/foo.h> including <asm/foo.h>, and the arch one
> > > > being a stub
> > > > in simple cases.
> > > >=20
> > > > It would be nice to get rid of the stub files; they're
> > > > irritating to
> > > > deal with, both when refactoring and simply for the file bloat
> > > > they
> > > > create.
> > > >=20
> > > > There are two options which come to mind.
> > > >=20
> > > > 1) Use __has_include().=C2=A0 This would be ideal, but would requir=
e
> > > > us
> > > > bumping the minimum GCC version to 4.9.2 as a prerequisite.=C2=A0
> > > > I'm not
> > > > aware of any way to emulate the necessary behaviour on older
> > > > toolchains.
> > > >=20
> > > > 2) Have a stub "architecture" which is always last on the
> > > > include path.
> > > > This would reduce the number of stub files from one set per
> > > > arch, to
> > > > only one set.
> > > >=20
> > > > Anything else that I've missed?
> > >=20
> > > What about a make rule creating an empty include file if it is
> > > missing?
> >=20
> > Wouldn't that cause a typo'd header file name to spring into
> > existence ?
> >=20
> > And it would cause a build to leave the working tree dirty.
>=20
> Depends how it is done.
>=20
> There could be a file containing the allowed header names to be
> generated.
>=20
> And the files wouldn't need to be generated in
> arch/<arch>/include/asm, but
> could be generated in e.g. include/generated/asm which would be used
> after
> the arch include path.
>=20
> This would basically be the central stub variant you were mentioning,
> but
> building it dynamically.

I started to analyze how many headers right now are empty, and it looks
not too many for ARM and x86.

For RISC-V, when the building of common code is enabled, the number of
empty headers will be around 4-5. But at the end ( when will be enough
functionality to run dom0 ), the amount of empty headers is 2 (probably
a little bit bigger, I don't remember and don't have access to my
source code )

However, at least between ARM and RISC-V, many headers are the same (
or they can be the same after some refactoring, f.e cache.h ).

So, it would be better to use stubs instead of dynamically generated
empty headers, as it looks like overkill only for a few empty headers.
But who knows what will be in the future, and possible it makes sense
to have a combination of stubs and dynamically created empty headers.

If no one is fine with me, I can implement that as common code will be
enabled for RISC-V soon.

It may be helpful for PPC too soon.

~ Oleksii

