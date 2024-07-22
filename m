Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A73E938E23
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:39:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761766.1171794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrNf-0005sS-KB; Mon, 22 Jul 2024 11:39:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761766.1171794; Mon, 22 Jul 2024 11:39:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrNf-0005qo-GZ; Mon, 22 Jul 2024 11:39:03 +0000
Received: by outflank-mailman (input) for mailman id 761766;
 Mon, 22 Jul 2024 11:39:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPk=OW=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sVrNe-0005qi-C3
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:39:02 +0000
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc1027a3-481e-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 13:39:00 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1721648334696708.7680710724628;
 Mon, 22 Jul 2024 04:38:54 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-6678a45eaa3so38316347b3.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:38:54 -0700 (PDT)
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
X-Inumbo-ID: fc1027a3-481e-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1721648336; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ef4bLp8AhEaiZcR91kZ2q4Njc0cpu6zwDr/+v6QxKbDuX3UupLOxnu6Yh4vJuWDp3rZd2vDb1OwJG8Ja8+4yQTyRYXFn12FoFOpOI/VK9FpXrsAxqo2XEMByjls7R15TGGJp6WM9h8Ksvhdw7wqLmK7z+pnqNnwDScL4C17jbdE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721648336; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LJvo75+KH1x9+taQW6ikfbio8PDB7eM1uhwOlvxIMCI=; 
	b=cL5etDm3X4CvAWc0YDNM8cLhX1s+rlHNeyoBaU4FVOufFLrWg1uwik8INEjZnIvOyWeDXIL2T9cKGVu+5pAA3YauDsTlWb+VncSckOPWHXDxI7YwBVicbEkxbHYAyEYMAA6q+0n+wSSWgKHPYJpRWtLisfEzAz80AaMHd8scPPA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721648336;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=MIME-Version:References:In-Reply-To:From:From:Date:Date:Message-ID:Subject:Subject:To:To:Cc:Cc:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=LJvo75+KH1x9+taQW6ikfbio8PDB7eM1uhwOlvxIMCI=;
	b=PV0ut8yW+Uf//PghtI6448ToIFzOCByAIftQNv8itr5+35GPqv3kmY+kJOKjMZ5M
	okedjPypg++KYzuIfW/hfsJDpwEOZnrWCUX0iHkccdDl6iu59D76W7ZhaBlZpCVQ8wD
	/fviOTCapGQJ2idOKx7pkLfDkjy16L/iOVkRwMv8=
X-Forwarded-Encrypted: i=1; AJvYcCWE8xycZ4ubI5+/Lg610I8VJHE3J26jq8a7og1lls+LEuRlU487ppRFIBIeESXgk+cTVNfWmpVuChRU+1sOWzMdM2Zq+fiH9OqnVqqpV8s=
X-Gm-Message-State: AOJu0YyprtdZHE5m8h4xXVC0laj0ROQ+xCY9elKCIpbmmVOFD8Ncr9Mv
	copkBMwWo+l6l/vKY1iRLHE0xRRi65U2IfPxei9bhnhpRFnZzBDnr9HipEUuahL4OyCj+YMcJLg
	MOJ6DzVbNGiIoRrcyeG3sTPDhYiY=
X-Google-Smtp-Source: AGHT+IFbH3nGOTYgQA/lle4X2gwm+0GcUKTS9CD9xIS1KUnUQuYIzx64105V+7oK79EQz2oaJupfs7R8wM0lpEaQrU0=
X-Received: by 2002:a05:690c:d8f:b0:643:92a8:ba00 with SMTP id
 00721157ae682-66ad5717b8dmr89135107b3.0.1721648333826; Mon, 22 Jul 2024
 04:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
 <9991b646-2d9e-418d-a0c0-5e357766c66c@suse.com> <CABfawhmz4hAx3JbF=XO=xuhzVrGg_+k5cdEd0Mdp0y=Cxu8v1Q@mail.gmail.com>
 <f2443c6d-895b-4d9a-b397-a5158c43a73d@suse.com> <CABfawhnzEZw7koBxaCVJmUT=8eLPc78id+Qnuy_x-H+e0tD7ng@mail.gmail.com>
 <249a0d05-68dd-4bf7-9196-6f6253e358c9@suse.com>
In-Reply-To: <249a0d05-68dd-4bf7-9196-6f6253e358c9@suse.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 22 Jul 2024 07:38:17 -0400
X-Gmail-Original-Message-ID: <CABfawhmTweva=uKsgBYUozvx_t7NHjj+RHy-eJ0_r1JiQqexEQ@mail.gmail.com>
Message-ID: <CABfawhmTweva=uKsgBYUozvx_t7NHjj+RHy-eJ0_r1JiQqexEQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony@xenproject.org>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 7:34=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.07.2024 13:29, Tamas K Lengyel wrote:
> > On Mon, Jul 22, 2024 at 7:08=E2=80=AFAM Jan Beulich <jbeulich@suse.com>=
 wrote:
> >>
> >> On 22.07.2024 13:03, Tamas K Lengyel wrote:
> >>> On Mon, Jul 22, 2024 at 5:20=E2=80=AFAM Jan Beulich <jbeulich@suse.co=
m> wrote:
> >>>>
> >>>> On 26.06.2024 00:47, Tamas K Lengyel wrote:
> >>>>> This target enables integration into oss-fuzz. Changing invalid inp=
ut return
> >>>>> to -1 as values other then 0/-1 are reserved by libfuzzer. Also add=
ing the
> >>>>> missing __wrap_vsnprintf wrapper which is required for successful o=
ss-fuzz
> >>>>> build.
> >>>>>
> >>>>> Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
> >>>>
> >>>> I've reverted this right away, because of ...
> >>>>
> >>>>> @@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappe=
rs.o
> >>>>>  afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS))=
 cpuid.o wrappers.o
> >>>>>       $(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=
=3D,$(WRAPPED)) $^ -o $@
> >>>>>
> >>>>> +libfuzzer-harness: $(OBJS) cpuid.o wrappers.o
> >>>>> +     $(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=3Dfuzzer $(a=
ddprefix -Wl$(comma)--wrap=3D,$(WRAPPED)) $^ -o $@
> >>>>
> >>>> ... this causing
> >>>>
> >>>> gcc: error: unrecognized argument to '-fsanitize=3D' option: 'fuzzer=
'
> >>>> make[6]: *** [Makefile:62: libfuzzer-harness] Error 1
> >>>>
> >>>> with apparently a fair set of gcc-s used by distro-s we use for CI.
> >>>
> >>> Well let me see if I can hack the Makefile to only build this with cl=
ang..
> >>
> >> Oh, and - please don't special case Clang. Instead please check for op=
tion
> >> availability (e.g. using cc-option), such that for possible future gcc=
,
> >> when support there may have been added, we'd then build it there as we=
ll.
> >
> > I decided to just not include the libfuzzer harness in the default 'all=
' target.
>
> Hmm. I'll look (and comment) there, but I'm not sure that's a route we wa=
nt to
> take. Goals generally ought to work or be unavailable, I'm inclined to sa=
y.

That Makefile already has targets that are not part of all so I don't
think it's a big deal.

Tamas

