Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB1717CFF
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 12:16:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541709.844722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Is1-00052G-N8; Wed, 31 May 2023 10:15:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541709.844722; Wed, 31 May 2023 10:15:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4Is1-0004zR-Jr; Wed, 31 May 2023 10:15:57 +0000
Received: by outflank-mailman (input) for mailman id 541709;
 Wed, 31 May 2023 10:15:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X43w=BU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1q4Irz-0004zL-VN
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 10:15:56 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 202efdb9-ff9c-11ed-8611-37d641c3527e;
 Wed, 31 May 2023 12:15:53 +0200 (CEST)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2af30a12e84so60066441fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 03:15:53 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x8-20020a2e8808000000b002a9f022e8bcsm3163798ljh.65.2023.05.31.03.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 03:15:52 -0700 (PDT)
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
X-Inumbo-ID: 202efdb9-ff9c-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685528153; x=1688120153;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yEGi2e5xZC0+UnMTftABv8dWt3TREaq1MMTHsonbF2c=;
        b=bu21Y4KLu0PE07UKpLyopbkfRpqLHOU4JfqUjHQ0KD9EeW2onKP/xHudW+FusxNMit
         pBRs4/mBD1r4dvjUHaxkpQ+bPQifuCPUfdzCW9RD5iK79BzWPtOpk/T1uJCKgzrYJXNn
         QEH8PnBT2lbTWzu7K66QkTlrx5lZaK3Z4CFRxPRtFQptm7QfXuaF38ZoZx5WZEIhp3wC
         revtv175ywg+G02YooTDz0RSfkny69NoMqGkMUI/iVgxuOBZyD/HPzQzVyuCHCiz/10D
         vuH9t+mHvIAUQRTzshxehHoIA2W5yti3+tznqGMuTvG/fB6u+TvtWhr4jYpYKPwhssTJ
         bWew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685528153; x=1688120153;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yEGi2e5xZC0+UnMTftABv8dWt3TREaq1MMTHsonbF2c=;
        b=kghPtzHB6Fl8GCxDtF1lDCg5DFtRA9Ab7RH4Y1MPYvDj6CPS+oAfvvHAKE6au6ys/E
         6+TQFd5/feT9Ua0b3t91LPXYHmvGoWPFa8OWUrzSTpJN6KtV7w+5DHZrkJ10pbfsKwS8
         dAKVLbmQ6QF3tOZw3VbPxMDut3h8qihactpn7HqGmhSLpne4y377B9nMhHBAUDvNI3R/
         59GuzvJzByNBy/QlWWWuetZzHYOHwz9hrRJxbs1USL8D7qtEzE+kB5bUhvJvYWj2A61Q
         70OzG1GXDFLyiFgrV8vat4NS/EwOQIXCgIuuhIUKAqDJppyjejFOexkBhkl1DTlbQB3+
         6l3g==
X-Gm-Message-State: AC+VfDwvD05uz26sSVzrF6+JdMLByQyvJr5IBfNDp2fBBG01QT41/rZF
	UgnbOzBxbYL57LhaDCw9xHg=
X-Google-Smtp-Source: ACHHUZ6ayb9I12LWn4FFY0stVngGqku4LfZItIQLrsnKo+VrEaiGPynitSyJFAuxQgVVUnDIHl22oQ==
X-Received: by 2002:a2e:8245:0:b0:2ab:365b:dc7d with SMTP id j5-20020a2e8245000000b002ab365bdc7dmr2488048ljh.27.1685528153075;
        Wed, 31 May 2023 03:15:53 -0700 (PDT)
Message-ID: <0816b0790f85652ec688a21476bbb4bba05b5735.camel@gmail.com>
Subject: Re: [PATCH v6 4/6] xen/riscv: introduce trap_init()
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, Connor Davis <connojdavis@gmail.com>, 
 xen-devel@lists.xenproject.org
Date: Wed, 31 May 2023 13:15:51 +0300
In-Reply-To: <86dc868a-eda9-9de6-0430-26da6f5ad465@suse.com>
References: <cover.1685359848.git.oleksii.kurochko@gmail.com>
	 <f4c4b711106283e26536105105892b93bb39ea3e.1685359848.git.oleksii.kurochko@gmail.com>
	 <86dc868a-eda9-9de6-0430-26da6f5ad465@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 (3.48.2-1.fc38) 
MIME-Version: 1.0

On Tue, 2023-05-30 at 17:44 +0200, Jan Beulich wrote:
> On 29.05.2023 14:13, Oleksii Kurochko wrote:
> > --- a/xen/arch/riscv/traps.c
> > +++ b/xen/arch/riscv/traps.c
> > @@ -12,6 +12,31 @@
> > =C2=A0#include <asm/processor.h>
> > =C2=A0#include <asm/traps.h>
> > =C2=A0
> > +#define cast_to_bug_frame(addr) \
> > +=C2=A0=C2=A0=C2=A0 (const struct bug_frame *)(addr)
>=20
> I can't find a use for this; should it be dropped or moved to some
> later patch? In any event, if ti's intended to survive, it needs yet
> another pair of parentheses.
You are right. It should be a part of the next patch.
Thanks.

>=20
> > +/*
> > + * Initialize the trap handling.
> > + *
> > + * The function is called after MMU is enabled.
> > + */
> > +void trap_init(void)
>=20
> Is this going to be used for secondary processors as well? If not,
> it will want to be __init.
I think I'll use it for secondary processors.

>=20
> > +{
> > +=C2=A0=C2=A0=C2=A0 /*
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * When the MMU is off, addr varialbe will be =
a physical
> > address otherwise
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * it would be a virtual address.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *
> > +=C2=A0=C2=A0=C2=A0=C2=A0 * It will work fine as:
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 - access to addr is PC-relative.
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0 - -nopie is used. -nopie really suppr=
esses the compiler
> > emitting
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 code going through .got (=
which then indeed would mean
> > using absolute
> > +=C2=A0=C2=A0=C2=A0=C2=A0 *=C2=A0=C2=A0=C2=A0 addresses).
> > +=C2=A0=C2=A0=C2=A0=C2=A0 */
>=20
> Is all of this comment still relevant not that you're running with
> the MMU already enabled.
Not really. I think comment above trap_init() function will be enough.
I'll remove this comment.

~ Oleksii

