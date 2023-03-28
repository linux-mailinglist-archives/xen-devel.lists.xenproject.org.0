Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B45D6CC6B8
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 17:38:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515957.799373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBP6-0008Jy-7X; Tue, 28 Mar 2023 15:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515957.799373; Tue, 28 Mar 2023 15:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phBP6-0008Hp-3c; Tue, 28 Mar 2023 15:38:32 +0000
Received: by outflank-mailman (input) for mailman id 515957;
 Tue, 28 Mar 2023 15:38:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ba0k=7U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1phBP3-0008Hj-Sl
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 15:38:29 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 957a882f-cd7e-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 17:38:27 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id s20so13028626ljp.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 Mar 2023 08:38:27 -0700 (PDT)
Received: from [192.168.202.197] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a2e880a000000b00298a81f3184sm4944474ljh.100.2023.03.28.08.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 08:38:26 -0700 (PDT)
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
X-Inumbo-ID: 957a882f-cd7e-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680017907;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Od1F/QFWvgDRnM3OxYDT1Y8Rvi2BogXT66QhtX9GRPY=;
        b=RwSSqyOWUu+v7t2PiBA4toyHjqw88e/xEJ/6Jt2wDIhqib3AbA0Sgd6/QEJk91P0pS
         wGUcuPGclu9JiAtBGtxlNoclTXdfRd59fxsTv7CjL9k4u7dcHmlPEZkNnnVZ6BQp4t9H
         HHqLXLSVuSn5fe5MIeNByodjdEQN9j/SD+7G4t0glPmMeqnESYAo9Y6d4YnN0kR3Lrcu
         sXFrwGNpOwYa8zotAohWn/H53IcjMFskwtHuAOCRXRmq1h81Zlixy+6QQBZJH63wYuTn
         hPQBaNS2JgkiiMmgZg0UOdgnAXLtb+HHO+te5Zr9ISoYPyLiA+NTzBbw8cIpbkovwicH
         AEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680017907;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Od1F/QFWvgDRnM3OxYDT1Y8Rvi2BogXT66QhtX9GRPY=;
        b=woGiEFbK6kXyYawrzvRLik1vHp28ECn2m/6jOqK+vaHb62KpfzZGZqFLxYMfLfQvkA
         aQmIQZ6mcHLD70k01eGz8tS3znpJWftcYfpBABGbabrbTVgmN9RdBM0IReZwV00IiE3c
         8jmAaDI/yFTbR0hft84W//d7XuHfv7CRzyl2nTZFL/VqLL2evULD9NefOurmi8lpuiku
         Vp+ORY0EiC1DQ/5cjGQFefqYgiiLEW22xngMoqvDqN2+yjHneAVv3JJgcVQgggZdHwAQ
         iAXGsGAbW+7NcKmQ5yEJrnW5qLC3fId3yLc+5yBWbmjB/CH8T03VmpUG/SDeQoHvDTBt
         YphA==
X-Gm-Message-State: AAQBX9d8dRXCuwGYLF4PCh7bnorrdMKVpfOdcgylwqfun2Zq79coUDT3
	t0L07x5nollgqMnOZJs46mRGZEWFn2g=
X-Google-Smtp-Source: AKy350bnrATPuIO2IbENUU6A3XAVJnGrpd9LVJeCxlx7WPyahbRZz2ElGNZVqJUFHi4aEzrTirFxCQ==
X-Received: by 2002:a2e:9594:0:b0:29b:3050:4e85 with SMTP id w20-20020a2e9594000000b0029b30504e85mr4626975ljh.25.1680017906872;
        Tue, 28 Mar 2023 08:38:26 -0700 (PDT)
Message-ID: <883d29a6bc888b4f78d5f20af4c2cf4b1b64e7c7.camel@gmail.com>
Subject: Re: [PATCH v8 5/5] xen/x86: switch x86 to use generic implemetation
 of bug.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>,  Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Tue, 28 Mar 2023 18:38:25 +0300
In-Reply-To: <9af94e49-ff66-5e7f-bf5f-ba4095cfed13@suse.com>
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
	 <5e252e8dacea5c4f2fdbb4f7970e34a862987639.1678900513.git.oleksii.kurochko@gmail.com>
	 <9af94e49-ff66-5e7f-bf5f-ba4095cfed13@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0

On Thu, 2023-03-16 at 10:52 +0100, Jan Beulich wrote:
> On 15.03.2023 18:21, Oleksii Kurochko wrote:
> > The following changes were made:
> > * Make GENERIC_BUG_FRAME mandatory for X86
> > * Update asm/bug.h using generic implementation in <xen/bug.h>
> > * Update do_invalid_op using generic do_bug_frame()
> > * Define BUG_DEBUGGER_TRAP_FATAL to
> > debugger_trap_fatal(X86_EXC_GP,regs)
> > * type of eip variable was changed to 'const void *'
> > * add '#include <xen/debugger.h>'
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
> > ---
> > Changes in V8:
> > =C2=A0* move <xen/debuger.h> from <asm/bug.h> to <common/bug.c> to fix
> > compilation issue.
> > =C2=A0=C2=A0 The following compilation issue occurs:
> > =C2=A0=C2=A0=C2=A0=C2=A0 In file included from ./arch/x86/include/asm/s=
mp.h:10,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/xen/smp.h:4,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ./arch/x86/include/asm/processor.h:10,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ./arch/x86/include/asm/system.h:6,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ./arch/x86/include/asm/atomic.h:5,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/xen/gdbstub.h:24,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ./arch/x86/include/asm/debugger.h:10,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/xen/debugger.h:24,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ./arch/x86/include/asm/bug.h:7,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/xen/bug.h:15,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/xen/lib.h:27,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from ./include/xen/perfc.h:6,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 from arch/x86/x86_64/asm-offsets.c:9:
> > =C2=A0=C2=A0=C2=A0=C2=A0 ./include/xen/cpumask.h: In function 'cpumask_=
check':
> > =C2=A0=C2=A0=C2=A0=C2=A0 ./include/xen/cpumask.h:84:9: error: implicit =
declaration of
> > function 'ASSERT' [-Werror=3Dimplicit-function-declaration]
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 84 |=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT(cpu < nr_cpu_ids);
>=20
> I'm going to post a patch to address this specific failure. But
> something
> similar may then surface elsewhere.
>=20
> > =C2=A0=C2=A0 It happens in case when CONFIG_CRASH_DEBUG is enabled
>=20
> I have to admit that I don't see the connection to CRASH_DEBUG: It's
> the
> asm/atomic.h inclusion that's problematic afaics, yet that
> (needlessly)
> happens outside the respective #ifdef in xen/gdbstub.h.
>=20
> If another instance of this header interaction issue would surface
> despite
> my to-be-posted patch, I'd be okay with going this route for the
> moment.
> But I think the real issue here is xen/lib.h including xen/bug.h.
> Instead
> of that, some stuff that's presently in xen/lib.h should instead move
> to
> xen/bug.h, and the inclusion there be dropped. Any parties actually
> using
> stuff from xen/bug.h (xen/lib.h then won't anymore) should then
> include
> that header themselves.
I tried to remove dependency between xen/lib.h and xen/bug.h but it is
still the same issue but for different compilation unit:

mmanual-endbr -fno-jump-tables '-D__OBJECT_LABEL__=3Dasm-offsets.s' -
mpreferred-stack-boundary=3D3 -S -g0 -o asm-offsets.s.new -MQ asm-
offsets.s arch/x86/x86_64/asm-offsets.c
In file included from ./include/public/domctl.h:21,
                 from ./include/public/sysctl.h:18,
                 from ./arch/x86/include/asm/cpuid.h:14,
                 from ./arch/x86/include/asm/cpufeature.h:10,
                 from ./arch/x86/include/asm/system.h:7,
                 from ./arch/x86/include/asm/atomic.h:5,
                 from ./include/xen/gdbstub.h:24,
                 from ./arch/x86/include/asm/debugger.h:10,
                 from ./include/xen/debugger.h:24,
                 from ./arch/x86/include/asm/bug.h:6,
                 from ./include/xen/bug.h:15,
                 from ./arch/x86/include/asm/alternative.h:7,
                 from ./arch/x86/include/asm/bitops.h:8,
                 from ./include/xen/bitops.h:106,
                 from ./arch/x86/include/asm/smp.h:8,
                 from ./include/xen/smp.h:4,
                 from ./include/xen/perfc.h:7,
                 from arch/x86/x86_64/asm-offsets.c:9:
~ Oleksii

