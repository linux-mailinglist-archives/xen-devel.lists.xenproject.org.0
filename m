Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E319E8D1662
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 10:37:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731039.1136347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBsKy-0008HR-Si; Tue, 28 May 2024 08:37:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731039.1136347; Tue, 28 May 2024 08:37:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBsKy-0008F3-P4; Tue, 28 May 2024 08:37:40 +0000
Received: by outflank-mailman (input) for mailman id 731039;
 Tue, 28 May 2024 08:37:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GfFg=M7=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sBsKy-0008Ex-4x
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 08:37:40 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89f56926-1ccd-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 10:37:38 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52449b7aa2bso680608e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 01:37:38 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066b067sm912136e87.168.2024.05.28.01.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 01:37:36 -0700 (PDT)
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
X-Inumbo-ID: 89f56926-1ccd-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716885457; x=1717490257; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=outSS5upUI878TOs8kNbB+Im+t4Am+q/COUWrTdKTfA=;
        b=as+zuYYOclSleembN3m1+KLSKU4zNpZtdU7IG1jBgUtMJZD7EzgRcdHByCCLUbQsx2
         BgIcjLl8+Wyp2H8SUVABAZuS39P8IKao6i/LlG5mV8UZm2s6yDc3WDrtubRwR7IJLakG
         WxFWJ3AFkuhUt4dXlLysupoxw83Vg1xV/EC9H847FqWtTxNaukzp9C97/rZjPZP1zah/
         CUTZ/vKsISBQ9SrVTubJRXSJVGmTBv8yBJ93UPmN1UiSZLaDy6PflPGDFQBf5h8Kh3ae
         wf8jmhF0A9DTtKu8N0qOhVHC2HZ6QmwRow1Qk/binFH2gN4kngDPEwHrtdBZD/SyfBdc
         yteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716885457; x=1717490257;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=outSS5upUI878TOs8kNbB+Im+t4Am+q/COUWrTdKTfA=;
        b=pQUzI2ej9/aqUuRm7rfClwpICnv7089W7zJBF91CJ8fVmPBp03hQ8tTccqNcEzPEGq
         zY22BttAaP71+jkaPgLuxbqFYVPu03teH5nzdlCV93uTuPg9yJaT+N+PxhEnB7I/ube4
         e+O1lV6Wfip3FZpYReFXsAJhzrawoRY+O0Or02MRYpcVAQgWq2OvaEG96635p2zP18OR
         6b1IXeB0OId1ObwNqFkmQZjaysHhm2OqQ7HsSzuyVYhZPtNEYzl6leMgDC1tg0Xw+iqP
         1/OR3LdWob4ajUF1M5GTWABThHIjvg1oMkKnvxghdwXbuIlAXRek1v+06WmiFVxCg9F6
         n06A==
X-Forwarded-Encrypted: i=1; AJvYcCXyw9tKBrjoL/n55pG+1LUuKD5kdTxy4D5vFz0PlI1Sgry3ojO+ryQa+UP21T9tYJ6IcEolFgf9lVLpNcNDegspBQT4Vf18CAUbte6MCXs=
X-Gm-Message-State: AOJu0YzMp2dGfqmvxrlO+yGbDvx75HYRgxN8ktt4eZkreu1WsYU85Dop
	Dt+Et8iVsaVMPnyHELEPUvjLjJuMXTdjOUkGhDyMYPVNx3GT9OGi
X-Google-Smtp-Source: AGHT+IGReejBsf7WTkkUV1AcHCYWdewmnQ1dOFtfjT8JwugYhXBwYgtsl0jpB5U8RMh8RG/1witM/g==
X-Received: by 2002:a05:6512:2208:b0:522:4062:6e79 with SMTP id 2adb3069b0e04-5296519a4f5mr6920445e87.31.1716885457067;
        Tue, 28 May 2024 01:37:37 -0700 (PDT)
Message-ID: <d8fd70469a1ac8d8cc291dddd0496f6bfabf6720.camel@gmail.com>
Subject: Re: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>,  Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Shawn Anastasio
 <sanastasio@raptorengineering.com>, Roger Pau =?ISO-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Date: Tue, 28 May 2024 10:37:35 +0200
In-Reply-To: <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
	 <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
	 <ab275ed4-29c3-4473-b1ee-2a9cda63eeaf@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Tue, 2024-05-28 at 08:20 +0200, Jan Beulich wrote:
> On 24.05.2024 13:08, Oleksii Kurochko wrote:
> > The following generic functions were introduced:
> > * test_bit
> > * generic__test_and_set_bit
> > * generic__test_and_clear_bit
> > * generic__test_and_change_bit
> >=20
> > These functions and macros can be useful for architectures
> > that don't have corresponding arch-specific instructions.
> >=20
> > Also, the patch introduces the following generics which are
> > used by the functions mentioned above:
> > * BITOP_BITS_PER_WORD
> > * BITOP_MASK
> > * BITOP_WORD
> > * BITOP_TYPE
> >=20
> > BITS_PER_BYTE was moved to xen/bitops.h as BITS_PER_BYTE is the
> > same
> > across architectures.
> >=20
> > The following approach was chosen for generic*() and arch*() bit
> > operation functions:
> > If the bit operation function that is going to be generic starts
> > with the prefix "__", then the corresponding generic/arch function
> > will also contain the "__" prefix. For example:
> > =C2=A0* test_bit() will be defined using arch_test_bit() and
> > =C2=A0=C2=A0 generic_test_bit().
> > =C2=A0* __test_and_set_bit() will be defined using
> > =C2=A0=C2=A0 arch__test_and_set_bit() and generic__test_and_set_bit().
> >=20
> > Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> > ---
> > =C2=A0Reviewed-by: Jan Beulich jbeulich@suse.com? Jan gave his R-by for
> > the previous
> > =C2=A0version of the patch, but some changes were done, so I wasn't sur=
e
> > if I could
> > =C2=A0use the R-by in this patch version.
>=20
> That really depends on the nature of the changes. Seeing the pretty
> long list below, I think it was appropriate to drop the R-b.
>=20
> > ---
> > Changes in V11:
> > =C2=A0- fix identation in generic_test_bit() function.
> > =C2=A0- move definition of BITS_PER_BYTE from <arch>/bitops.h to
> > xen/bitops.h
>=20
> I realize you were asked to do this, but I'm not overly happy with
> it.
> BITS_PER_BYTE is far more similar to BITS_PER_LONG than to
> BITOP_BITS_PER_WORD. Plus in any event that change is entirely
> unrelated
> here.
So where then it should be introduced? x86 introduces that in config.h,
Arm in asm/bitops.h.
I am okay to revert this change and make a separate patch.

>=20
> > =C2=A0- drop the changes in arm64/livepatch.c.
> > =C2=A0- update the the comments on top of functions:
> > generic__test_and_set_bit(),
> > =C2=A0=C2=A0 generic__test_and_clear_bit(),=C2=A0 generic__test_and_cha=
nge_bit(),
> > =C2=A0=C2=A0 generic_test_bit().
> > =C2=A0- Update footer after Signed-off section.
> > =C2=A0- Rebase the patch on top of staging branch, so it can be merged
> > when necessary
> > =C2=A0=C2=A0 approves will be given.
> > =C2=A0- Update the commit message.
> > ---
> > =C2=A0xen/arch/arm/include/asm/bitops.h |=C2=A0 69 -----------
> > =C2=A0xen/arch/ppc/include/asm/bitops.h |=C2=A0 54 ---------
> > =C2=A0xen/arch/ppc/include/asm/page.h=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0xen/arch/ppc/mm-radix.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0xen/arch/x86/include/asm/bitops.h |=C2=A0 31 ++---
> > =C2=A0xen/include/xen/bitops.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 185
> > ++++++++++++++++++++++++++++++
> > =C2=A06 files changed, 196 insertions(+), 147 deletions(-)
> >=20
> > --- a/xen/include/xen/bitops.h
> > +++ b/xen/include/xen/bitops.h
> > @@ -103,8 +103,193 @@ static inline int generic_flsl(unsigned long
> > x)
> > =C2=A0 * Include this here because some architectures need
> > generic_ffs/fls in
> > =C2=A0 * scope
> > =C2=A0 */
> > +
> > +#define BITOP_BITS_PER_WORD 32
> > +typedef uint32_t bitop_uint_t;
> > +
> > +#define BITOP_MASK(nr)=C2=A0 ((bitop_uint_t)1 << ((nr) %
> > BITOP_BITS_PER_WORD))
> > +
> > +#define BITOP_WORD(nr)=C2=A0 ((nr) / BITOP_BITS_PER_WORD)
> > +
> > +#define BITS_PER_BYTE 8
>=20
> This, if to be moved at all, very clearly doesn't belong here. As
> much
> as it's unrelated to this change, it's also unrelated to bitops as a
> whole.
>=20
> > +extern void __bitop_bad_size(void);
> > +
> > +#define bitop_bad_size(addr) (sizeof(*(addr)) <
> > sizeof(bitop_uint_t))
> > +
> > +/* --------------------- Please tidy above here ------------------
> > --- */
> > +
> > =C2=A0#include <asm/bitops.h>
> > =C2=A0
> > +/**
> > + * generic__test_and_set_bit - Set a bit and return its old value
> > + * @nr: Bit to set
> > + * @addr: Address to count from
> > + *
> > + * This operation is non-atomic and can be reordered.
> > + * If two examples of this operation race, one can appear to
> > succeed
>=20
> Why "examples"? Do you mean "instances"? It's further unclear what
> "succeed" and "fail" here mean. The function after all has two
> purposes: Checking and setting the specified bit. Therefore I think
> you mean "succeed in updating the bit in memory", yet then it's
> still unclear what the "appear" here means: The caller has no
> indication of success/failure. Therefore I think "appear to" also
> wants dropping.
>=20
> > + * but actually fail.=C2=A0 You must protect multiple accesses with a
> > lock.
>=20
> That's not "must". An often better alternative is to use the atomic
> forms instead. "Multiple" is imprecise, too: "Potentially racy" or
> some such would come closer.
I think we can go only with:
 " This operation is non-atomic and can be reordered."
and drop:
 " If two examples of this operation race, one can appear to ... "

>=20
> Also did Julien(?) really ask that these comments be reproduced on
> both the functions supposed to be used throughout the codebase _and_
> the generic_*() ones (being merely internal helpers/fallbacks)?
At least, I understood that in this way.

>=20
> > +/**
> > + * generic_test_bit - Determine whether a bit is set
> > + * @nr: bit number to test
> > + * @addr: Address to start counting from
> > + *
> > + * This operation is non-atomic and can be reordered.
> > + * If two examples of this operation race, one can appear to
> > succeed
> > + * but actually fail.=C2=A0 You must protect multiple accesses with a
> > lock.
> > + */
>=20
> You got carried away updating comments - there's no raciness for
> simple test_bit(). As is also expressed by its name not having those
> double underscores that the others have.
Then it is true for every function in this header. Based on the naming
the conclusion can be done if it is atomic/npn-atomic and can/can't be
reordered. So the comments aren't seem very useful.

~ Oleksii

>=20
> > +static always_inline bool generic_test_bit(int nr, const volatile
> > void *addr)
> > +{
> > +=C2=A0=C2=A0=C2=A0 bitop_uint_t mask =3D BITOP_MASK(nr);
> > +=C2=A0=C2=A0=C2=A0 const volatile bitop_uint_t *p =3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (const volatile bitop_uint_=
t *)addr + BITOP_WORD(nr);
> > +
> > +=C2=A0=C2=A0=C2=A0 return (*p & mask);
> > +}
> > +
> > +/**
> > + * __test_and_set_bit - Set a bit and return its old value
> > + * @nr: Bit to set
> > + * @addr: Address to count from
> > + *
> > + * This operation is non-atomic and can be reordered.
> > + * If two examples of this operation race, one can appear to
> > succeed
> > + * but actually fail.=C2=A0 You must protect multiple accesses with a
> > lock.
> > + */
> > +static always_inline bool
> > +__test_and_set_bit(int nr, volatile void *addr)
> > +{
> > +#ifndef arch__test_and_set_bit
> > +#define arch__test_and_set_bit generic__test_and_set_bit
> > +#endif
> > +
> > +=C2=A0=C2=A0=C2=A0 return arch__test_and_set_bit(nr, addr);
> > +}
>=20
> See Julien's comments on the earlier version as well as what Andrew
> has
> now done for ffs()/fls(), avoiding the largely pointless fallback
> #define.
>=20
> Jan


