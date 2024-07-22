Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6A4938E0F
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:30:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761732.1171748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrEn-00021p-27; Mon, 22 Jul 2024 11:29:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761732.1171748; Mon, 22 Jul 2024 11:29:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrEm-0001zE-Uh; Mon, 22 Jul 2024 11:29:52 +0000
Received: by outflank-mailman (input) for mailman id 761732;
 Mon, 22 Jul 2024 11:29:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPk=OW=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sVrEl-0001sD-3Z
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:29:51 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b44589ca-481d-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 13:29:50 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1721647786922227.313170722608;
 Mon, 22 Jul 2024 04:29:46 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e05ed8a5526so3989729276.3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:29:46 -0700 (PDT)
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
X-Inumbo-ID: b44589ca-481d-11ef-bbfe-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; t=1721647787; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RPbaq0QGBv4pzg43N5aqrhAg6/w7FWKNA8UeaUWj5Ked4PcDn7bXnI5JnBdj04+IJN052kNnaIaoL4EFrADxRmYX4irnrdbqGGRENRkDtnxbv18kJv/gEw2GDHaP+AebL6MItiWQgw07YfiR9eh4ALsZ+CvQa0TSqRNpF+Z3AdQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721647787; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tVYh9BoBALaOeAAhFsZTQGuOLRwufhhqKEnFtZLE2u0=; 
	b=GxVCBqIlr8nNTXqHAhlPR7dywC2Jxe0rSvF1kXIkqp8OZ4lVPktJ2585Kl/VfKlCEoX7hwE+Uaiut7Lfp66w4ItFVV4iuuGFlAcMd6jRMz4UGb1UFHBT0G6Dt3MeS4fvhV2yW7fsw8Sx2ub2UoPJKAnVTimm2VjK40qZ83Voir4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721647787;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=tVYh9BoBALaOeAAhFsZTQGuOLRwufhhqKEnFtZLE2u0=;
	b=gSGtM9ReI7zdHSurKKr2DgITzWI7XcnEt0gZArwHwpxUVdGFCfhyuu6JptHAIQqr
	jLOdg3ox2CpWMT2zlTp9U/q/HokNRCOk04z3NeyE8+gV8guYZFG22eGUHpMN5cDPWq9
	iaI8B7+zldGgmozbTVCg3hYH3nKwkEDdT06vX6DE=
X-Forwarded-Encrypted: i=1; AJvYcCULQ1j/zGWVTnXGInBwlpYXDOIPyFg/QS7dNOsTx7wVUlOQ7sJLr7wtJxr9l8qEt0qsME8PJvAL5Fawo2ahy1GAzQioBr4k1RuWuwD0C0U=
X-Gm-Message-State: AOJu0YwhL9Cu5NDPefZ29BKoPQcOKe13/ndejH3YEYJ4qTqRlWDtZdac
	BoQQHfxGBBVHpXyUshcxNQNiTbJpUxnqCCXUrhMTWiJatPTWVh2tugU1BKCTcB0GshBJHljD1Cr
	RUDkLt+IfnGY2SUZGH2I0UAA9slY=
X-Google-Smtp-Source: AGHT+IHVw1mEeX2RM4oY/iUVxWCHoErDOK0m40W548ZCmrEu4iMH0Yh3KPhjXESNZUE/H/tUt8Mtib8cHkosHr95Mm8=
X-Received: by 2002:a05:6902:1b0a:b0:e02:8f64:5010 with SMTP id
 3f1490d57ef6-e087b324cc6mr5843086276.14.1721647786121; Mon, 22 Jul 2024
 04:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <9991b646-2d9e-418d-a0c0-5e357766c66c@suse.com> <CABfawhmz4hAx3JbF=XO=xuhzVrGg_+k5cdEd0Mdp0y=Cxu8v1Q@mail.gmail.com>
 <f2443c6d-895b-4d9a-b397-a5158c43a73d@suse.com>
In-Reply-To: <f2443c6d-895b-4d9a-b397-a5158c43a73d@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 22 Jul 2024 07:29:09 -0400
X-Gmail-Original-Message-ID: <CABfawhnzEZw7koBxaCVJmUT=8eLPc78id+Qnuy_x-H+e0tD7ng@mail.gmail.com>
Message-ID: <CABfawhnzEZw7koBxaCVJmUT=8eLPc78id+Qnuy_x-H+e0tD7ng@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 7:08=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.07.2024 13:03, Tamas K Lengyel wrote:
> > On Mon, Jul 22, 2024 at 5:20=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 26.06.2024 00:47, Tamas K Lengyel wrote:
> >>> This target enables integration into oss-fuzz. Changing invalid input=
 return
> >>> to -1 as values other then 0/-1 are reserved by libfuzzer. Also addin=
g the
> >>> missing __wrap_vsnprintf wrapper which is required for successful oss=
-fuzz
> >>> build.
> >>>
> >>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>
> >> I've reverted this right away, because of ...
> >>
> >>> @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers=
.o
> >>>  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) c=
puid.o wrappers.o
> >>>       $(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=3D,=
$(WRAPPED)) $^ -o $@
> >>>
> >>> +libfuzzer-harness: $(OBJS) cpuid.o wrappers.o
> >>> +     $(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=3Dfuzzer $(add=
prefix -Wl$(comma)--wrap=3D,$(WRAPPED)) $^ -o $@
> >>
> >> ... this causing
> >>
> >> gcc: error: unrecognized argument to '-fsanitize=3D' option: 'fuzzer'
> >> make[6]: *** [Makefile:62: libfuzzer-harness] Error 1
> >>
> >> with apparently a fair set of gcc-s used by distro-s we use for CI.
> >
> > Well let me see if I can hack the Makefile to only build this with clan=
g..
>
> Oh, and - please don't special case Clang. Instead please check for optio=
n
> availability (e.g. using cc-option), such that for possible future gcc,
> when support there may have been added, we'd then build it there as well.

I decided to just not include the libfuzzer harness in the default 'all' ta=
rget.

Tamas

