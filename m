Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D626A8C74AE
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:34:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723101.1127630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YRI-0006sG-Dl; Thu, 16 May 2024 10:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723101.1127630; Thu, 16 May 2024 10:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YRI-0006qE-Av; Thu, 16 May 2024 10:34:20 +0000
Received: by outflank-mailman (input) for mailman id 723101;
 Thu, 16 May 2024 10:34:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hAQ=MT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7YRG-0006p9-Rh
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:34:18 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d89aa13a-136f-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 12:34:16 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-52388d9ca98so1115318e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 03:34:16 -0700 (PDT)
Received: from [192.168.226.248] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-521f38d36a6sm2882529e87.164.2024.05.16.03.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 03:34:15 -0700 (PDT)
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
X-Inumbo-ID: d89aa13a-136f-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715855656; x=1716460456; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hjwzz+vFkptf2K4QAxJOv9UPNzPEVbyefBu/50UUC4Q=;
        b=dvG9tyTG93YCVz48Wl88ayEonNlzyjwB1/aP6mB7ztPlSXo2OLFFVy69yyZMfXhCwc
         eUlZ21WYbe0VsyZtE8FCrVILNkKQLvcn33oC8n2iOrRmqgC6TeqOEuj14FSAy5hqrfOJ
         8z8zddDyPpAy6Hh8CUWoG1OcJvuugZJX6UYUbVIk9TA+1ypcPV5I1ncDzRzYF+GGoMrC
         YegKi8FLmxxxk2cJVTPNDF//NMzIExNGZdXBtBabkMAfACqMEx4zWbXpIVXFfRnkDek9
         UpaEsY032N7uMla6i9wj3Yf2NMN6ZXioUffwgmMLQ74QBbsME327VwkLT2VGZGq480s1
         1mWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715855656; x=1716460456;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hjwzz+vFkptf2K4QAxJOv9UPNzPEVbyefBu/50UUC4Q=;
        b=DW2UcF8iFDbp/XQuqKZE+AkH86bYcGFH/KxQqyg0+mTPrhczZa+GcKLq8at4getHUJ
         CxdbhT3WTkKn5E+iSCJ/vzpIMYqtWwgqte1cM9AZLwzxo5I62k8j1+MV1D7PID7HpymT
         9r5ajpZVstRI1UglIUr4EECyJOjsGiHU+hwj4NrmBCaO5tzGaZ6ynwLqzrfrxc1M4Ak+
         gCvCIza+SPJSNSGw5gYWH10uJ51EoYxDy7eUOW1DlsYoX+Tix/lf1ULXVSMZHGJ6D1iD
         ZRXlUemT3ujl0HDbXGNEwo+kuvS+GOpArs5OSmUd6sgOHhJGQSCXffWRfMcWe23W8j26
         k0/w==
X-Forwarded-Encrypted: i=1; AJvYcCVct8kdIAvNWwWOyaPdKPFXchmsYaNHMyhhdcjMa9Np/X4UpGqHG3DbtJ3cdJfe7ofqIGKtZjY1SlT06CwZUnFVl9LclNrUAbCx6ZmJeAA=
X-Gm-Message-State: AOJu0YxdoUIh6/FeXLlimxdptO6IqKPDAIsajGPE0bYXbkKhJfa9u+cK
	egEJrg2l8TkvODxkjWfNggIw0TGYix8epCvqfdQ/MGphPcM0VM+d
X-Google-Smtp-Source: AGHT+IGtoLh5Go/7uW6EW6y0xCflCMhSac2wPXoh9TYPL0vfMGjEZbWe/nJr+iTYs+HeUqZlmNT26Q==
X-Received: by 2002:ac2:5f59:0:b0:521:92f6:3d34 with SMTP id 2adb3069b0e04-5220fd7c838mr14336002e87.22.1715855655878;
        Thu, 16 May 2024 03:34:15 -0700 (PDT)
Message-ID: <c8bd47e8f8558d88b4d5a4a09ea10728006fd4d3.camel@gmail.com>
Subject: Re: [PATCH v9 02/15] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Ross
 Lagerwall <ross.lagerwall@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>,  Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,  Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
Date: Thu, 16 May 2024 12:34:14 +0200
In-Reply-To: <77c6e497-631d-4f92-bd38-8ab7dba4841d@suse.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
	 <616e8be09f217a766b96c4f9060f6658636a4338.1714988096.git.oleksii.kurochko@gmail.com>
	 <2ac0ca46-6957-4d31-95cb-3016de7b11b8@suse.com>
	 <76a84e9e239e1338fc6f86d243b74fa239d8091d.camel@gmail.com>
	 <5174d73f-677d-4c5c-9d4c-e651a29e4366@suse.com>
	 <588867d6e054264551e0e27b534955fce9b6d6d5.camel@gmail.com>
	 <77c6e497-631d-4f92-bd38-8ab7dba4841d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Thu, 2024-05-16 at 09:04 +0200, Jan Beulich wrote:
> On 15.05.2024 19:03, Oleksii K. wrote:
> > On Wed, 2024-05-15 at 17:41 +0200, Jan Beulich wrote:
> > > On 15.05.2024 17:29, Oleksii K. wrote:
> > > > On Wed, 2024-05-15 at 10:52 +0200, Jan Beulich wrote:
> > > > > On 06.05.2024 12:15, Oleksii Kurochko wrote:
> > > > > > The following generic functions were introduced:
> > > > > > * test_bit
> > > > > > * generic__test_and_set_bit
> > > > > > * generic__test_and_clear_bit
> > > > > > * generic__test_and_change_bit
> > > > > >=20
> > > > > > Also, the patch introduces the following generics which are
> > > > > > used by the functions mentioned above:
> > > > > > * BITOP_BITS_PER_WORD
> > > > > > * BITOP_MASK
> > > > > > * BITOP_WORD
> > > > > > * BITOP_TYPE
> > > > > >=20
> > > > > > These functions and macros can be useful for architectures
> > > > > > that don't have corresponding arch-specific instructions.
> > > > >=20
> > > > > Logically this paragraph may better move ahead of the BITOP_*
> > > > > one.
> > > > >=20
> > > > > > Because of that x86 has the following check in the macros
> > > > > > test_bit(),
> > > > > > __test_and_set_bit(), __test_and_clear_bit(),
> > > > > > __test_and_change_bit():
> > > > > > =C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_size=
();
> > > > > > It was necessary to make bitop bad size check generic too,
> > > > > > so
> > > > > > arch_check_bitop_size() was introduced.
> > > > >=20
> > > > > Not anymore, with the most recent adjustments? There's
> > > > > nothing
> > > > > arch-
> > > > > specific anymore in the checking.
> > > > >=20
> > > > > > @@ -183,7 +180,7 @@ static inline int test_and_set_bit(int
> > > > > > nr,
> > > > > > volatile void *addr)
> > > > > > =C2=A0 * If two examples of this operation race, one can appear
> > > > > > to
> > > > > > succeed
> > > > > > =C2=A0 * but actually fail.=C2=A0 You must protect multiple acc=
esses
> > > > > > with
> > > > > > a
> > > > > > lock.
> > > > > > =C2=A0 */
> > > > > > -static inline int __test_and_set_bit(int nr, void *addr)
> > > > > > +static inline int arch__test_and_set_bit(int nr, volatile
> > > > > > void
> > > > > > *addr)
> > > > >=20
> > > > > I think I raised this point before: Why arch__ here, ...
> > > > >=20
> > > > > > @@ -232,7 +226,7 @@ static inline int
> > > > > > test_and_clear_bit(int
> > > > > > nr,
> > > > > > volatile void *addr)
> > > > > > =C2=A0 * If two examples of this operation race, one can appear
> > > > > > to
> > > > > > succeed
> > > > > > =C2=A0 * but actually fail.=C2=A0 You must protect multiple acc=
esses
> > > > > > with
> > > > > > a
> > > > > > lock.
> > > > > > =C2=A0 */
> > > > > > -static inline int __test_and_clear_bit(int nr, void *addr)
> > > > > > +static inline int arch__test_and_clear_bit(int nr,
> > > > > > volatile
> > > > > > void
> > > > > > *addr)
> > > > >=20
> > > > > ... here, ...
> > > > >=20
> > > > > > @@ -243,13 +237,10 @@ static inline int
> > > > > > __test_and_clear_bit(int
> > > > > > nr, void *addr)
> > > > > > =C2=A0
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 return oldbit;
> > > > > > =C2=A0}
> > > > > > -#define __test_and_clear_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > -=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_siz=
e();=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > -=C2=A0=C2=A0=C2=A0 __test_and_clear_bit(nr, addr);=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > -})
> > > > > > +#define arch__test_and_clear_bit arch__test_and_clear_bit
> > > > > > =C2=A0
> > > > > > =C2=A0/* WARNING: non atomic and it can be reordered! */
> > > > > > -static inline int __test_and_change_bit(int nr, void
> > > > > > *addr)
> > > > > > +static inline int arch__test_and_change_bit(int nr,
> > > > > > volatile
> > > > > > void
> > > > > > *addr)
> > > > >=20
> > > > > ... and here, while ...
> > > > >=20
> > > > > > @@ -307,8 +295,7 @@ static inline int variable_test_bit(int
> > > > > > nr,
> > > > > > const volatile void *addr)
> > > > > > =C2=A0=C2=A0=C2=A0=C2=A0 return oldbit;
> > > > > > =C2=A0}
> > > > > > =C2=A0
> > > > > > -#define test_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > -=C2=A0=C2=A0=C2=A0 if ( bitop_bad_size(addr) ) __bitop_bad_siz=
e();=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > > > +#define arch_test_bit(nr, addr) ({=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
> > > > >=20
> > > > > ... just arch_ here? I don't like the double underscore
> > > > > infixes
> > > > > very
> > > > > much, but I'm okay with them as long as they're applied
> > > > > consistently.
> > > >=20
> > > > Common code and x86 use __test_and_clear_bit(), and this patch
> > > > provides
> > > > a generic version of __test_and_clear_bit(). To emphasize that
> > > > generic__test_and_clear_bit() is a common implementation of
> > > > __test_and_clear_bit(), the double underscore was retained.
> > > > Also,
> > > > test_and_clear_bit() exists and if one day it will be needed to
> > > > provide
> > > > a generic version of it, then it will be needed to have
> > > > generic__test_and_clear_bit() and generic_test_and_clear_bit()
> > > >=20
> > > > A similar logic was chosen for test_bit.
> > >=20
> > > Right, but in all of your reply arch_ doesn't appear at all.
> > I am a little confused here. According to my logic, should it be
> > arch___test_and_set_bit() and generic___test_and_set_bit()?
>=20
> Why 3 underscores in a row? I'm clearly not following.
>=20
> > If you are asking why there is no generic implementation for
> > test_and_clear_bit() without the double underscores, the reason is
> > that
> > Arm, PPC, and x86 don't use generic code and rely on specific
> > instructions for this operation. Therefore, I didn't see much sense
> > in
> > providing a generic version of test_and_clear_bit(), at least, for
> > now.
>=20
> No, there was no question in that direction. And hence ...
>=20
> > > =C2=A0Yet the
> > > question was: Why then not arch__test_bit(), to match the other
> > > arch
> > > helpers?
> > Because no one uses __test_bit(). Everywhere is used test_bit().
>=20
> ... this seems unrelated (constrained by my earlier lack of following
> you).
>=20
> (Later) Wait, maybe I've finally figured it: You use
> arch__test_and_*()
> because those underlie __test_and_*(), but arch_test_bit() because
> there's
> solely test_bit() (same for the generic_* naming).
Yes, that what I meant.

>  I guess I can accept
> that then, despite the slight anomaly you point out, resulting in the
> question towards 3 underscores in a row. To clarify, my thinking was
> more
> towards there not possibly being generic forms of test_and_*() (i.e.
> no
> possible set of arch_test_and_*() or generic_test_and_*()), thus
> using
> double inner underscores in arch__test_*() and generic__test_*() to
> signify that those are purely internal functions, which aren't
> supposed to
> be called directly.
I understand your point regarding functions that start with "__".
For example, __test_and_clear_bit() is used not only internally (in
terms of architecture code) but also in common code, so it is not
strictly internal. I may have misunderstood what "internal function"
means in this context.

I thought that, at least for bit operations, "__bit_operation" means
that the bit operation is non-atomic and can be reordered, which
implies that it's not a good idea to use it in common code without
additional steps.

Anyway, I am not sure I understand which approach I should use in this
patch. You mentioned that possibly test_and_() can't have a generic
form, meaning it won't be a set of arch_test_and_() functions.

So, can I rename arch__test_() and generic__test_() to arch_test_() and
generic_test_(), respectively, and use the renamed functions in
_test_and*() in xen/bitops.h? Is my understanding correct?
If my understanding is correct, I am happy to apply mentioned changes
in the next patch version.

~ Oleksii


>=20
> Jan


