Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3166697F1B
	for <lists+xen-devel@lfdr.de>; Wed, 15 Feb 2023 16:07:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496034.766547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJN6-0002aF-4L; Wed, 15 Feb 2023 15:07:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496034.766547; Wed, 15 Feb 2023 15:07:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSJN6-0002Xr-1R; Wed, 15 Feb 2023 15:07:00 +0000
Received: by outflank-mailman (input) for mailman id 496034;
 Wed, 15 Feb 2023 15:06:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l6+G=6L=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pSJN4-0002Xl-EF
 for xen-devel@lists.xenproject.org; Wed, 15 Feb 2023 15:06:58 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63100ae7-ad42-11ed-93b5-47a8fe42b414;
 Wed, 15 Feb 2023 16:06:56 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id a2so19484583wrd.6
 for <xen-devel@lists.xenproject.org>; Wed, 15 Feb 2023 07:06:56 -0800 (PST)
Received: from [192.168.8.199] (46.204.109.85.nat.umts.dynamic.t-mobile.pl.
 [46.204.109.85]) by smtp.gmail.com with ESMTPSA id
 k1-20020adff5c1000000b002bff574a250sm15976492wrp.2.2023.02.15.07.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 07:06:55 -0800 (PST)
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
X-Inumbo-ID: 63100ae7-ad42-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AtSH9eWEOgCpl+Knmn9Kd3c6i7SdD7N3ygH83qgPUA4=;
        b=G4Oysiph0KX9V05uzym40LBdrCyvUhptxyfmUFE0kojxTw72Xhvw7cldkByRu8qJC/
         0fiSIrKp1lu2XsNfV7TGriYQygH+mLWypWu1M4rXzR9u4EUZaEeyyfJ7gkWPULsl58RD
         PLy1qlL9XbYRWrYb5mtMw1YGIv6zJhfPZc+8ADBy1y02m6klrpja2TrGPoTede5a972I
         eyoFCktvCTebIVk3lq7DoPrJ+os+1gr2Frrk0zbYw3HX+BwJipetpDp9STM7XeshFmAh
         8FsokqPWbjn6nPsts2Jxv0/2XryFjltpn8ZWIbb575KWhZAWnTa/7ButO4MeqpEUn/GF
         4Xrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AtSH9eWEOgCpl+Knmn9Kd3c6i7SdD7N3ygH83qgPUA4=;
        b=FD8LVrGC/OXIyXMpKEHAhV+JUwBdIQ7Bb0mkpUDrMMEixJ2kihAyXwLDUrjwc5j6fg
         47R33SZQbl5pGuZWf0RsFv8NEYfeOWbYSqNAHD51NnhJY8grtDVW02NlG1YCA6GMmmeo
         TblArAYdPeOSVNSWx6OHniILT12LBJJ3QXLY0WWRltXv9EaiH0TQ/ZQpWIcp6hsn5yZK
         kC3Al3g0IcFXgT/L5AHvWJCihoUehVqxNEO5lvW0SlM6Sx88/+vqT8ro7ELxuOlRKww4
         e3JKmTSFeaoBWMsKEwtlSMSAwToTq+Kt/9Vm/zbFKwgWrBJrq184Ys/gPMmEQiebUTkM
         Rr9w==
X-Gm-Message-State: AO0yUKX4juL9Le1rUclUsPgHM2wU0PcktBlOpNCnAC881qAlGBR2GNTz
	/NuKi8o48AbQBpdFK76QfI0=
X-Google-Smtp-Source: AK7set+bvrixUQuC6GMKfqD72yqrPnSSCEkknX/Kmn6B9fYcVHmi7Emft6mRw5l6binv0OIbuAg+zA==
X-Received: by 2002:adf:f48d:0:b0:2c5:6173:72ae with SMTP id l13-20020adff48d000000b002c5617372aemr1900429wro.27.1676473615431;
        Wed, 15 Feb 2023 07:06:55 -0800 (PST)
Message-ID: <94ee1afd206fb4c9808560d57a13cf59e721463c.camel@gmail.com>
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 15 Feb 2023 17:06:53 +0200
In-Reply-To: <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
	 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
	 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
	 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
	 <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0

On Tue, 2023-02-14 at 17:55 +0100, Jan Beulich wrote:
> On 14.02.2023 17:22, Oleksii wrote:
> > On Mon, 2023-02-13 at 13:24 +0100, Jan Beulich wrote:
> > > On 03.02.2023 18:05, Oleksii Kurochko wrote:
> > > > --- a/xen/common/Kconfig
> > > > +++ b/xen/common/Kconfig
> > > > @@ -92,6 +92,12 @@ config STATIC_MEMORY
> > > > =C2=A0
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If unsure, s=
ay N.
> > > > =C2=A0
> > > > +config GENERIC_DO_BUG_FRAME
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bool
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0help
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Generic do_bug_fr=
ame() function is needed to handle
> > > > the
> > > > type of bug
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 frame and print a=
n information about it.
> > >=20
> > > Generally help text for prompt-less functions is not very useful.
> > > Assuming
> > > it is put here to inform people actually reading the source file,
> > > I'm
> > > okay
> > > for it to be left here, but please at least drop the stray "an".
> > > I
> > > also
> > > think this may want moving up in the file, e.g. ahead of all the
> > > HAS_*
> > > controls (which, as you will notice, all have no help text
> > > either).
> > > Plus
> > > finally how about shorter and more applicable GENERIC_BUG_FRAME -
> > > after
> > > all what becomes generic is more than just do_bug_frame()?
> > Thanks for the comments. I will take them into account.
> > Right now only do_bug_frame() is expected to be generic.
>=20
> Hmm, do you mean to undo part of what you've done? I didn't think
> you would. Yet in what you've done so far, the struct an several
> macros are also generalized. Hence the "DO" in the name is too
> narrow from my pov.
>=20
No, I don't undo part of what I have done.
I misunderstood your initial message. So yeah, I will remove "DO" I
think it will be more correct.
> > > > --- /dev/null
> > > > +++ b/xen/include/xen/bug.h
> > > > @@ -0,0 +1,127 @@
> > > > +#ifndef __XEN_BUG_H__
> > > > +#define __XEN_BUG_H__
> > > > +
> > > > +#define BUG_DISP_WIDTH=C2=A0=C2=A0=C2=A0 24
> > > > +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
> > > > +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
> > > > +
> > > > +#define BUGFRAME_run_fn 0
> > > > +#define BUGFRAME_warn=C2=A0=C2=A0 1
> > > > +#define BUGFRAME_bug=C2=A0=C2=A0=C2=A0 2
> > > > +#define BUGFRAME_assert 3
> > > > +
> > > > +#define BUGFRAME_NR=C2=A0=C2=A0=C2=A0=C2=A0 4
> > > > +
> > > > +#ifndef __ASSEMBLY__
> > > > +
> > > > +#include <xen/errno.h>
> > > > +#include <xen/stringify.h>
> > > > +#include <xen/types.h>
> > > > +#include <xen/lib.h>
> > >=20
> > > Again - please sort headers.
> > >=20
> > > > +#include <asm/bug.h>
> > > > +
> > > > +#ifndef BUG_FRAME_STUFF
> > > > +struct bug_frame {
> > >=20
> > > Please can we have a blank line between the above two ones and
> > > then
> > > similarly
> > > ahead of the #endif?
> > Sure.
> >=20
> > >=20
> > > > +=C2=A0=C2=A0=C2=A0 signed int loc_disp;=C2=A0=C2=A0=C2=A0 /* Relat=
ive address to the bug
> > > > address
> > > > */
> > > > +=C2=A0=C2=A0=C2=A0 signed int file_disp;=C2=A0=C2=A0 /* Relative a=
ddress to the
> > > > filename */
> > > > +=C2=A0=C2=A0=C2=A0 signed int msg_disp;=C2=A0=C2=A0=C2=A0 /* Relat=
ive address to the
> > > > predicate
> > > > (for ASSERT) */
> > > > +=C2=A0=C2=A0=C2=A0 uint16_t line;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /* Line number */
> > > > +=C2=A0=C2=A0=C2=A0 uint32_t pad0:16;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 /* Padding for 8-bytes align */
> > >=20
> > > Already the original comment in Arm code is wrong: The padding
> > > doesn't
> > > guarantee 8-byte alignment; it merely guarantees a multiple of 8
> > > bytes
> > > size. Aiui there's also no need for 8-byte alignment anywhere
> > > here
> > > (in
> > > fact there's ".p2align 2" in the generator macros).
> > >=20
> > > I also wonder why this needs to be a named bitfield: Either make
> > > it
> > > plain uint16_t, or if you use a bitfield, then omit the name.
> > >=20
> > It will better to change it to 'uint16_t' as I don't see any reason
> > to
> > use 'uint32_t' with bitfield here.
> > I'll check if we need the alignment. If there=C2=A0 is '.p2align 2' we
> > really don't need it.
>=20
> See Julien's replies any my responses: FTAOD I did _not_ ask to
> remove
> the field.
I didn't see his reply so I'll read it too.
>=20
> > > > +};
> > > > +
> > > > +#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
> > > > +#define bug_file(b) ((const void *)(b) + (b)->file_disp);
> > > > +#define bug_line(b) ((b)->line)
> > > > +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
> > > > +#endif /* BUG_FRAME_STUFF */
> > > > +
> > > > +#ifndef BUG_FRAME
> > > > +/* Many versions of GCC doesn't support the asm %c parameter
> > > > which
> > > > would
> > > > + * be preferable to this unpleasantness. We use mergeable
> > > > string
> > > > + * sections to avoid multiple copies of the string appearing
> > > > in
> > > > the
> > > > + * Xen image. BUGFRAME_run_fn needs to be handled separately.
> > > > + */
> > >=20
> > > When generalizing the logic, I wonder in how far the comment
> > > doesn't
> > > want re-wording some. For example, while Arm prefixes constant
> > > insn
> > > operands with # (and x86 uses $), there's no such prefix in RISC-
> > > V.
> > > At
> > > which point there's no need to use %c in the first place. (Which
> > > in
> > > turn means x86'es more compact representation may also be usable
> > > there.
> > > And yet in turn the question arises whether RISC-V wouldn't
> > > better
> > > have
> > > its own derivation of the machinery, rather than trying to
> > > generalize
> > > things. RISC-V's would then likely be closer to x86'es, just
> > > without
> > > the use of %c on asm() operands. Which might then suggest to
> > > rather
> > > generalize x86'es variant down the road.)
> > ARM version is more portable because of the '%c' modifier which is
> > not
> > present everywhere, so I decided to use it as a generic
> > implementation.
> > Moreover I don't see any reason why we can't switch x86
> > implementation
> > to 'generic/ARM'.
>=20
> That would increase data size on x86 for no gain, from all I can
> tell.
You are right. It will increase data size.

One more point regarding portability is that x86 uses an 'i' constraint
modifier that GCC won't allow when PIE is enabled, so it doesn't look
like the best option to use as generic.

>=20
> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ".hword " __strin=
gify(line) ",
> > > > 0\n"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > >=20
> > > Hmm, .hword. How generic is support for that in assemblers? I
> > > notice
> > > even
> > > very old gas has support for it, but architectures may not
> > > consider
> > > it
> > > two bytes wide. (On x86, for example, it's bogus to be two bytes,
> > > since
> > > .word also produces 2 bytes of data. And indeed MIPS and NDS32
> > > override it
> > > in gas to produce 1 byte of data only, at least in certain
> > > cases.)
> > > I'd
> > > like to suggest to use a fourth .long here, and to drop the
> > > padding
> > > field
> > > from struct bug_frame in exchange.
> > Changing .hword to .half can make the code more portable and
> > generic,
> > as .half is a more standard and widely supported assembler
> > directive
> > for declaring 16-bit data.=20
>=20
> And how is "half" better than "hword" in the mentioned respect? Half
> a word is still a byte on x86 (due to its 16-bit history).
>=20
> That said - from all I can tell by briefly looking at gas sources,
> there's no ".half" there.
Then, it will still be an issue. So then the best solution will be to
change it to the type recommended before.

>=20
> Jan


