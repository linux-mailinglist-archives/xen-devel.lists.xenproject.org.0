Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6A088DB3E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Mar 2024 11:29:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698414.1090021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpQVw-0003WP-4F; Wed, 27 Mar 2024 10:28:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698414.1090021; Wed, 27 Mar 2024 10:28:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpQVv-0003V7-WD; Wed, 27 Mar 2024 10:28:12 +0000
Received: by outflank-mailman (input) for mailman id 698414;
 Wed, 27 Mar 2024 10:28:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GZpX=LB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rpQVu-0003UG-MK
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2024 10:28:10 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b51c5643-ec24-11ee-afe3-a90da7624cb6;
 Wed, 27 Mar 2024 11:28:09 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d52e65d4a8so87187631fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Mar 2024 03:28:09 -0700 (PDT)
Received: from [192.168.206.239] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 y23-20020ac255b7000000b00513b3928e36sm1777010lfg.266.2024.03.27.03.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Mar 2024 03:28:08 -0700 (PDT)
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
X-Inumbo-ID: b51c5643-ec24-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711535289; x=1712140089; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/n+opUoNJ9wZF7yNe9XfgYKWacCATGFVOU3SeuJLRPY=;
        b=Ji2gAxAMFaLNHevRTFn2FrL8hdrRlE0H9Urjoe9wDvtKnLiXyJRDfAeIBSGmB0YKk+
         ltsKs9yjrgkxrGmtmFBeka/IIQIpmwcmZtjZV4VB0IOMDllhCOZz7KFtP7TQqXVzoNf/
         7VeqhSf9oLU4LcPHlUtxlObX7CDqU0CQGbqjyC13eBGfI/zBgCiaFRDirD4VHIvR+CXE
         wdJY4EAImCsXx8sU9aJEGKWcrrY8e5WT2E4EQwMvELW4yw+OBjsEXSbrubKfx/u+cWGP
         /DlSgdSE4C3T6k2CeM/MjPuvPGYngnuUUM1EIT2XcX9h7uh9LtehIY2Pv6EFTJ3+gLLQ
         hI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711535289; x=1712140089;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/n+opUoNJ9wZF7yNe9XfgYKWacCATGFVOU3SeuJLRPY=;
        b=XUT2ZJRbej4S2gc40wfVzcmg0hnIm4f8FPEPBlKB4+uL9WCs7rWZd7gB5pL3o6GPUH
         o2/BRz3ILMax2Kb33mNkB63dine+l/JWlZ6dX1sQiR+U/WkuP3ufmqyVX+iBh3hQCm+a
         wLQHi6o2klUcPww4cxEduyx2yReHi0pWU4KsxTXxYkvSeV9uCV1WZ0y3RkTK1gxfetra
         FI3kiHaRSAl+tP3bQB1X2nnCaZvwdZZPC45qPC+NpsD7xInPYqn1QYt0/kDdfJMurbmD
         SsGJJYHIQZiSHe0+Q+2Ge+ZU/qJshfnCu3roqlnX7NjONXTZMSv3mQo26aBW+2U8f7fD
         D1sA==
X-Forwarded-Encrypted: i=1; AJvYcCWkZBsiKFYkuFVDb+wgeb6uq30Ec/M1s+ZYlbn1G5fEbwk8PfFG7JyyjvLXU3l7pAabHu9PDzAfRSZ6nfpNnFE47EnGUwitDPPNPn6lXMU=
X-Gm-Message-State: AOJu0Yz5UWwrVPw+w8x/yU2XVSeanqIKTRsnxX8TpTdwxpp57fK1qXfS
	4Y6KTD7dPhlnnWXXdIVIERqk5rffYVt54B0RFpA0guvYw33qVePKimtl4cxzR0c=
X-Google-Smtp-Source: AGHT+IGKO7KCIyC8h7mBJ0zOngnpIfJZIs6YlC/x9l5kL+cginbq5I0dBl53iVrTNETYO1JQhA5ESQ==
X-Received: by 2002:a19:a40d:0:b0:513:cac8:743a with SMTP id q13-20020a19a40d000000b00513cac8743amr568521lfc.1.1711535288835;
        Wed, 27 Mar 2024 03:28:08 -0700 (PDT)
Message-ID: <f8647945e9d195fd4b2acd0655d7f884ce66fc3a.camel@gmail.com>
Subject: Re: [PATCH v6 10/20] xen/riscv: introduce atomic.h
From: Oleksii <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, Bob Eshleman
 <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>,  Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 xen-devel@lists.xenproject.org
Date: Wed, 27 Mar 2024 11:28:07 +0100
In-Reply-To: <2bac4852-b5f1-4424-ac1a-29e76563ab2b@suse.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
	 <22ee9c8cc62c76cfb799fed800636e7c8bf25a17.1710517542.git.oleksii.kurochko@gmail.com>
	 <78a86041-72e2-410f-b6a7-212656b0dba3@suse.com>
	 <cdcf3531a94110d73b9ec60eedf74784b923248c.camel@gmail.com>
	 <1a440fbf-f37c-41fe-b31c-0afe0fd77c8e@suse.com>
	 <38de6dd8e9555fe4b573f9c2134a618a60c224df.camel@gmail.com>
	 <2bac4852-b5f1-4424-ac1a-29e76563ab2b@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0

On Wed, 2024-03-27 at 08:40 +0100, Jan Beulich wrote:
...

> > > > > > +/* This is required to provide a full barrier on success.
> > > > > > */
> > > > > > +static inline int atomic_add_unless(atomic_t *v, int a,
> > > > > > int u)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int prev, rc;
> > > > > > +
> > > > > > +=C2=A0=C2=A0=C2=A0 asm volatile (
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0: lr.w=C2=A0=C2=
=A0=C2=A0=C2=A0 %[p],=C2=A0 %[c]\n"
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 beq=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %[p],=C2=A0 %[u], 1f\n"
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 add=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %[rc], %[p], %[a]\n"
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 sc.w.=
rl=C2=A0 %[rc], %[rc], %[c]\n"
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0 bnez=
=C2=A0=C2=A0=C2=A0=C2=A0 %[rc], 0b\n"
> > > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 RISCV_FULL_BARRIER
> > > > >=20
> > > > > With this and no .aq on the load, why the .rl on the store?
> > > > It is something that LKMM requires [1].
> > > >=20
> > > > This is not fully clear to me what is so specific in LKMM, but
> > > > accoring
> > > > to the spec:
> > > > =C2=A0=C2=A0 Ordering Annotation Fence-based Equivalent
> > > > =C2=A0=C2=A0 l{b|h|w|d|r}.aq=C2=A0=C2=A0=C2=A0=C2=A0 l{b|h|w|d|r}; =
fence r,rw
> > > > =C2=A0=C2=A0 l{b|h|w|d|r}.aqrl=C2=A0=C2=A0 fence rw,rw; l{b|h|w|d|r=
}; fence r,rw
> > > > =C2=A0=C2=A0 s{b|h|w|d|c}.rl=C2=A0=C2=A0=C2=A0=C2=A0 fence rw,w; s{=
b|h|w|d|c}
> > > > =C2=A0=C2=A0 s{b|h|w|d|c}.aqrl=C2=A0=C2=A0 fence rw,w; s{b|h|w|d|c}
> > > > =C2=A0=C2=A0 amo<op>.aq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 amo<op>; fence r,rw
> > > > =C2=A0=C2=A0 amo<op>.rl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 fence rw,w; amo<op>
> > > > =C2=A0=C2=A0 amo<op>.aqrl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 fence rw,rw; amo<op>; fence rw,rw
> > > > =C2=A0=C2=A0 Table 2.2: Mappings from .aq and/or .rl to fence-based
> > > > equivalents.
> > > > =C2=A0=C2=A0 An alternative mapping places a fence rw,rw after the
> > > > existing=20
> > > > =C2=A0=C2=A0 s{b|h|w|d|c} mapping rather than at the front of the
> > > > =C2=A0=C2=A0 l{b|h|w|d|r} mapping.
> > >=20
> > > I'm afraid I can't spot the specific case in this table. None of
> > > the
> > > stores in the right column have a .rl suffix.
> > Yes, it is expected.
> >=20
> > I am reading this table as (f.e.) amo<op>.rl is an equivalent of
> > fence
> > rw,w; amo<op>. (without .rl)=20
>=20
> In which case: How does quoting the table answer my original
> question?
Agree, it is starting to be confusing, so let me give an answer to your
question below.

>=20
> > > > =C2=A0=C2=A0 It is also safe to translate any .aq, .rl, or .aqrl
> > > > annotation
> > > > into
> > > > =C2=A0=C2=A0 the fence-based snippets of
> > > > =C2=A0=C2=A0 Table 2.2. These can also be used as a legal implement=
ation
> > > > of
> > > > =C2=A0=C2=A0 l{b|h|w|d} or s{b|h|w|d} pseu-
> > > > =C2=A0=C2=A0 doinstructions for as long as those instructions are n=
ot
> > > > added
> > > > to
> > > > =C2=A0=C2=A0 the ISA.
> > > >=20
> > > > So according to the spec, it should be:
> > > > =C2=A0sc.w ...
> > > > =C2=A0RISCV_FULL_BARRIER.
> > > >=20
> > > > Considering [1] and how this code looks before, it seems to me
> > > > that
> > > > it
> > > > is safe to use lr.w.aq/sc.w.rl here or an fence equivalent.
> > >=20
> > > Here you say "or". Then why dos the code use sc.?.rl _and_ a
> > > fence?
> > I confused this line with amo<op>.aqrl, so based on the table 2.2
> > above
> > s{b|h|w|d|c}.aqrl is transformed to "fence rw,w; s{b|h|w|d|c}", but
> > Linux kernel decided to strengthen it with full barrier:
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "0:\n\t"
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "lr.w.aqrl=C2=A0 %[p],=C2=A0 %[c]\n\t"
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "beq=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %[p],=
=C2=A0 %[u], 1f\n\t"
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "add=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %[rc],=C2=A0=
 %[p], %[a]\n\t"
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "sc.w.aqrl %[rc], %[rc], %[c]\n\t"
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "bnez=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %[rc], 0b\n\t"
> > =C2=A0=C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "1:"
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "0:=C2=A0=C2=A0=C2=A0=C2=A0 lr.w=C2=A0=C2=A0=C2=
=A0=C2=A0 %[p],=C2=A0 %[c]\n"
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 beq=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 %[p],=C2=A0 %[u], 1f\n"
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 %[rc], %[p], %[a]\n"
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sc.w.rl=
=C2=A0 %[rc], %[rc], %[c]\n"
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bnez=C2=
=A0=C2=A0=C2=A0=C2=A0 %[rc], 0b\n"
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fence=C2=
=A0=C2=A0=C2=A0 rw, rw\n"
> > =C2=A0=C2=A0 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 "1:\n"
> > As they have the following issue:
> > =C2=A0=C2=A0 implementations of atomics such as atomic_cmpxchg() and
> > =C2=A0=C2=A0 atomic_add_unless() rely on LR/SC pairs,
> > =C2=A0=C2=A0 which do not give full-ordering with .aqrl; for example, c=
urrent
> > =C2=A0=C2=A0 implementations allow the "lr-sc-aqrl-pair-vs-full-barrier=
" test
> > =C2=A0=C2=A0 below to end up with the state indicated in the "exists" c=
lause.
>=20
> Is that really "current implementations", not "the abstract model"?
> If so, the use of an explicit fence would be more like a workaround
> (and would hence want commenting to that effect).
>=20
> In neither case can I see my original question answered: Why the .rl
> on the store when there is a full fence later?
The good explanation for that was provided in the commit addressing a
similar issue for ARM64 [
https://patchwork.kernel.org/project/linux-arm-kernel/patch/1391516953-1454=
1-1-git-send-email-will.deacon@arm.com/
].
The same holds true for RISC-V since ARM also employs WMO.

I would also like to mention another point, as I indicated in another
email thread
[=C2=A0https://lists.xen.org/archives/html/xen-devel/2024-03/msg01582.html =
]
, that now this fence can be omitted and .aqrl can be used instead.

This was confirmed by Dan (the author of the RVWMO spec)
[https://lore.kernel.org/linux-riscv/41e01514-74ca-84f2-f5cc-2645c444fd8e@n=
vidia.com/
]

I hope this addresses your original question. Does it?

~ Oleksii


