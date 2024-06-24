Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A259158DF
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 23:25:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746932.1154163 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLrAa-0001j6-9X; Mon, 24 Jun 2024 21:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746932.1154163; Mon, 24 Jun 2024 21:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLrAa-0001fx-5g; Mon, 24 Jun 2024 21:24:12 +0000
Received: by outflank-mailman (input) for mailman id 746932;
 Mon, 24 Jun 2024 21:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q2Am=N2=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sLrAY-0001fr-Bu
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 21:24:10 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 164a10b5-3270-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 23:24:07 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1719264243678432.7074087375636;
 Mon, 24 Jun 2024 14:24:03 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id
 00721157ae682-6439f6cf79dso16159977b3.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 14:24:03 -0700 (PDT)
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
X-Inumbo-ID: 164a10b5-3270-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1719264244; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S8N1nc2JxCc9xDI+M24vohX4DXa+jUOMMcB4+IvJc7MvckQbHdDWz0kWh3FwcFzkzFOUwKt1oxlVBVpScUNyuhOs0ub35U5/Y1d7kau37GsBFjVKucWAzNL5I4QBugMi70Gp+hzLN8xWZxCbbhP4nDlwWxFnUBBaXxWHsr63IJU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719264244; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rDR0CtGnRUytB9puns+4maTSy3KDvr3FXJ0+K8eJa14=; 
	b=F3znArzuKrWC/177cHrQWQC0RLofCC+3V3nPBctPU2MD382E5syVTiTUAaZtI/dEVqgMrX0aqJyYm/O3eqTJO5kd2dWomVDe8a+DH7M54KIAYTi2tslycDIdrAwPzuaVb9nx60BStLspFuedN1NlaUsaXSCu19B+nvY2jLntXZY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719264244;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rDR0CtGnRUytB9puns+4maTSy3KDvr3FXJ0+K8eJa14=;
	b=NgCFqfOxK9C60Fdx0OoqpaUqK7Sj4bMun46o2YfZh1C7t5Hzjh4BqxFfU98CsqEx
	OcRES8VbQRuqaWLLTEfUTXSqAxL3kVbXFiTlhEbZ3fA1WTsdYdAYPPwLaT9OIWyyuvS
	uNvwVfjK7C1aI8nME/9W9xwD0FXEkK/du5VGOxlc=
X-Forwarded-Encrypted: i=1; AJvYcCX5z2def9JCDSjbzXmMgNcEtkq/l0qAnI3mz+KUZyHYH+yzhuIC0c3r806AIXUOSJik19ZQc1N2fFjk0kZhVFxwtT84/NWBj2aNL7dKAmw=
X-Gm-Message-State: AOJu0YxyLUKM0ljziTPYZ6tZz6q+APDldQ/k5tYZEPIsX2hefCl3iYka
	nfcweVP7sQ9TMXBA5yLfTtOlAVpJLYoWfv9w9+tOdipRM//obZx1WYgRx1Ha4oMmG5XsuCiyiJ0
	7OCFV6C7fIstgSY/dAflBOApyKyk=
X-Google-Smtp-Source: AGHT+IHkR4Ur8MU9QFQh2fgIosSIUBWqVJ/0HkteNZrqbG9qKxW4jR7v5kyLqJ26Yi5L6b9Vz5LOITsv3cKGg2Ocrjc=
X-Received: by 2002:a25:a347:0:b0:dff:2cc6:c470 with SMTP id
 3f1490d57ef6-e0303ed5693mr4861971276.1.1719264242795; Mon, 24 Jun 2024
 14:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240621191434.5046-1-tamas@tklengyel.com> <45c69745-b060-4697-9f6e-b3d2a8860946@suse.com>
In-Reply-To: <45c69745-b060-4697-9f6e-b3d2a8860946@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 24 Jun 2024 17:23:26 -0400
X-Gmail-Original-Message-ID: <CABfawhkyDVw-=nR2d6KiXGYYv=coDgHUr1oXC+BmUxH_ita+iQ@mail.gmail.com>
Message-ID: <CABfawhkyDVw-=nR2d6KiXGYYv=coDgHUr1oXC+BmUxH_ita+iQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 11:55=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 21.06.2024 21:14, Tamas K Lengyel wrote:
> > @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
> >  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpu=
id.o wrappers.o
> >       $(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=3D,$(=
WRAPPED)) $^ -o $@
> >
> > +libfuzzer-harness: $(OBJS) cpuid.o
> > +     $(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=3Dfuzzer $^ -o $=
@
>
> What is LIB_FUZZING_ENGINE? I don't think we have any use of that in the
> tree anywhere.

It's used by oss-fuzz, otherwise it's not doing anything.

>
> I'm further surprised you get away here without wrappers.o.

Wrappers.o was actually breaking the build for oss-fuzz at the linking
stage. It works just fine without it.

>
> Finally, despite its base name the lack of an extension suggest to me
> this isn't actually a library. Can you help me bring both aspects togethe=
r?

Libfuzzer is the the name of the fuzzing engine, like afl:
https://llvm.org/docs/LibFuzzer.html

>
> > @@ -67,7 +70,7 @@ distclean: clean
> >
> >  .PHONY: clean
> >  clean:
> > -     rm -f *.a *.o $(DEPS_RM) afl-harness afl-harness-cov *.gcda *.gcn=
o *.gcov
> > +     rm -f *.a *.o $(DEPS_RM) afl-harness afl-harness-cov *.gcda *.gcn=
o *.gcov libfuzzer-harness
>
> I'm inclined to suggest it's time to split this line (e.g. keeping all th=
e
> wildcard patterns together and moving the rest to a new rm invocation).

Sure.

>
> > --- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> > +++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
> > @@ -906,14 +906,12 @@ int LLVMFuzzerTestOneInput(const uint8_t *data_p,=
 size_t size)
> >
> >      if ( size <=3D DATA_OFFSET )
> >      {
> > -        printf("Input too small\n");
> > -        return 1;
> > +        return -1;
> >      }
> >
> >      if ( size > FUZZ_CORPUS_SIZE )
> >      {
> > -        printf("Input too large\n");
> > -        return 1;
> > +        return -1;
> >      }
> >
> >      memcpy(&input, data_p, size);
>
> This part of the change clearly needs explaining in the description.
> It's not even clear to me in how far this is related to the purpose
> of the patch here (iow it may want to be a separate change, depending
> on why the change is needed).

The printf simply produces a ton of unnecessary output while the
fuzzer is running, slowing it down. It's also not useful at all, even
for debugging. Switching the return -1 is necessary because beside
0/-1 values are reserved by libfuzzer for "future use". No issue about
putting this info into the commit message.

Tamas

