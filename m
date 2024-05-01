Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1478B88CB
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 12:51:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715287.1116821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s27Yj-0005mE-QI; Wed, 01 May 2024 10:51:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715287.1116821; Wed, 01 May 2024 10:51:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s27Yj-0005kd-NO; Wed, 01 May 2024 10:51:33 +0000
Received: by outflank-mailman (input) for mailman id 715287;
 Wed, 01 May 2024 10:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ji+M=ME=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1s27Yj-0005kX-1s
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 10:51:33 +0000
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4e7f3fb-07a8-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 12:51:31 +0200 (CEST)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-23d23a6123eso535361fac.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 May 2024 03:51:31 -0700 (PDT)
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
X-Inumbo-ID: c4e7f3fb-07a8-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714560690; x=1715165490; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tA0zl5xuECP+2FZlON78Z8DHZiCEpbBPmvXhYGexKI=;
        b=C8Iai2J9Vkxi31j9kzqH6dDSN19TfWg/a4NHCZ/PN3TIi9lZGfZw4N/QFO19vhBLXw
         oiGwGKSX97R7ZFKd8O5DT6n0u2XWNhq3ie/lvRg9Yk9kATLJvpp5U+jv/1Ey6rRsm21z
         3q7fne2ZLkCfmA4JdIOwZrlOdpapWDesGkCQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714560690; x=1715165490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tA0zl5xuECP+2FZlON78Z8DHZiCEpbBPmvXhYGexKI=;
        b=HrrMbKeuFSRXC0nTLCXqB5+o+rlXU7uZZIk03zL/ITMf3sZBhSl/Dth8NO8dVe1EnZ
         8b/voH2ytrlxZAM2bvjKUIYt/Cipr8+hwmrur9Ms44VjI/tNfXZGISKhIGcxcjY3bc14
         IMFNLwYK/QnAtpoM4T2MQSRWHupb/VyqUiv/i1cEBDVLn/pthr6xbBqBAudO/mimWKPw
         AAiuMSD+cMJPhLh8ICIpGObSG2Gs3KP1fN0qdGG9qn6TzjBNBqQeDFEfMzDvedG2pu9F
         nf2WKEhRBXT0REgDUhIbv7gdYrg70GkPqmw9N3zJAn9mpxN2ZcWM/M/bZV0Po7bS8jPy
         Zw2A==
X-Gm-Message-State: AOJu0YwVpirUsRxJTsZC68wAxNYM79FlXk6uElbnQ/wDDS/dQvUN4Z2m
	tBjw0K/r4WhtqE3sTJdEsZwwLJYFDCuZUS8nMaCWZRcwo0eQZykjTDsxyOywhd3HKkLw7FKSjUQ
	pqwfr+KVlg3wtdtVmxbJFQkKItXDH8Ajuq1/cqQ==
X-Google-Smtp-Source: AGHT+IHnvid0r7b+lj7dBLs1TJun5tYlzTQASrYzxqlIeOFAxZICtgD+5ZtFMh7qCSeAKaRbJoIa1I+YXjLGn2/2khg=
X-Received: by 2002:a05:6870:6128:b0:229:f988:4305 with SMTP id
 s40-20020a056870612800b00229f9884305mr2321194oae.10.1714560690585; Wed, 01
 May 2024 03:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240429151625.977884-1-andrew.cooper3@citrix.com>
 <20240429151625.977884-3-andrew.cooper3@citrix.com> <CA+zSX=Y_fcDLonuRZZCaaKjK87tXEnnvJGjJHrKy5wzvaC2rzA@mail.gmail.com>
 <c5efd98f-da49-414c-8427-8e4b2311f9bc@citrix.com>
In-Reply-To: <c5efd98f-da49-414c-8427-8e4b2311f9bc@citrix.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Wed, 1 May 2024 11:51:19 +0100
Message-ID: <CA+zSX=aVb2znDf5XZ+04_vTD2aRPF8t4XoO9ZicYeU0_A2hsMQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] x86/cpu-policy: Add SVM features already used by Xen
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>, 
	Sergiy Kibrik <Sergiy_Kibrik@epam.com>, Andrei Semenov <andrei.semenov@vates.fr>, 
	Vaishali Thakkar <vaishali.thakkar@vates.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 1, 2024 at 11:39=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 01/05/2024 11:00 am, George Dunlap wrote:
> > On Mon, Apr 29, 2024 at 4:16=E2=80=AFPM Andrew Cooper <andrew.cooper3@c=
itrix.com> wrote:
> >> These will replace svm_feature_flags and the SVM_FEATURE_* constants o=
ver the
> >> next few changes.  Take the opportunity to rationalise some names.
> >>
> >> Drop the opencoded "inherit from host" logic in calculate_hvm_max_poli=
cy() and
> >> use 'h'/'!' annotations.  The logic needs to operate on fs, not the po=
licy
> >> object, given its position within the function.
> >>
> >> Drop some trailing whitespace introduced when this block of code was l=
ast
> >> moved.
> >>
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >> CC: Stefano Stabellini <sstabellini@kernel.org>
> >> CC: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> >> CC: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
> >> CC: George Dunlap <george.dunlap@citrix.com>
> >> CC: Andrei Semenov <andrei.semenov@vates.fr>
> >> CC: Vaishali Thakkar <vaishali.thakkar@vates.tech>
> >> ---
> >>  tools/misc/xen-cpuid.c                      | 11 +++++++++++
> >>  xen/arch/x86/cpu-policy.c                   | 17 +++++------------
> >>  xen/include/public/arch-x86/cpufeatureset.h | 14 ++++++++++++++
> >>  xen/tools/gen-cpuid.py                      |  3 +++
> >>  4 files changed, 33 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> >> index ab09410a05d6..0d01b0e797f1 100644
> >> --- a/tools/misc/xen-cpuid.c
> >> +++ b/tools/misc/xen-cpuid.c
> >> @@ -266,6 +266,17 @@ static const char *const str_m10Ah[32] =3D
> >>
> >>  static const char *const str_eAd[32] =3D
> >>  {
> >> +    [ 0] =3D "npt",                 [ 1] =3D "v-lbr",
> >> +    [ 2] =3D "svm-lock",            [ 3] =3D "nrips",
> >> +    [ 4] =3D "v-tsc-rate",          [ 5] =3D "vmcb-cleanbits",
> >> +    [ 6] =3D "flush-by-asid",       [ 7] =3D "decode-assist",
> >> +
> >> +    [10] =3D "pause-filter",
> >> +    [12] =3D "pause-thresh",
> >> +    /* 14 */                      [15] =3D "v-loadsave",
> >> +    [16] =3D "v-gif",
> >> +    /* 18 */                      [19] =3D "npt-sss",
> >> +    [20] =3D "v-spec-ctrl",
> >>  };
> >>
> >>  static const char *const str_e1Fa[32] =3D
> >> diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
> >> index 4b6d96276399..da4401047e89 100644
> >> --- a/xen/arch/x86/cpu-policy.c
> >> +++ b/xen/arch/x86/cpu-policy.c
> >> @@ -9,7 +9,6 @@
> >>  #include <asm/amd.h>
> >>  #include <asm/cpu-policy.h>
> >>  #include <asm/hvm/nestedhvm.h>
> >> -#include <asm/hvm/svm/svm.h>
> >>  #include <asm/intel-family.h>
> >>  #include <asm/msr-index.h>
> >>  #include <asm/paging.h>
> >> @@ -748,22 +747,16 @@ static void __init calculate_hvm_max_policy(void=
)
> >>      if ( !cpu_has_vmx )
> >>          __clear_bit(X86_FEATURE_PKS, fs);
> >>
> >> -    /*
> >> +    /*
> >>       * Make adjustments to possible (nested) virtualization features =
exposed
> >>       * to the guest
> >>       */
> >> -    if ( p->extd.svm )
> >> +    if ( test_bit(X86_FEATURE_SVM, fs) )
> >>      {
> >> -        /* Clamp to implemented features which require hardware suppo=
rt. */
> >> -        p->extd.raw[0xa].d &=3D ((1u << SVM_FEATURE_NPT) |
> >> -                               (1u << SVM_FEATURE_LBRV) |
> >> -                               (1u << SVM_FEATURE_NRIPS) |
> >> -                               (1u << SVM_FEATURE_PAUSEFILTER) |
> >> -                               (1u << SVM_FEATURE_DECODEASSISTS));
> >> -        /* Enable features which are always emulated. */
> >> -        p->extd.raw[0xa].d |=3D (1u << SVM_FEATURE_VMCBCLEAN);
> >> +        /* Xen always emulates cleanbits. */
> >> +        __set_bit(X86_FEATURE_VMCB_CLEANBITS, fs);
> >>      }
> > What about this line, at the end of recalculate_cpuid_policy()?
> >
> >   if ( !p->extd.svm )
> >         p->extd.raw[0xa] =3D EMPTY_LEAF;
> >
> > Is there a reason to continue to operate directly on the policy here,
> > or would it be better to do this up in the featureset section?
>
> That's still needed.
>
> Otherwise in a !SVM VM you still see svm_rev and nr_asids in a leaf that
> should be all zeroes.

...Uh, yes of course we still need to clear the non-existent CPUID
bits.  I was asking if we should change *how* we should clear them.

In the hunk I responded to, when enabling VMCBCLEAN, we switch from
setting bits in the policy, to setting bits in the featureset.  I was
asking whether it would make sense to do something like

    if !test_bit(X86_FEATURE_SVM, fs)
        fs[FEATURESET_eAd]  =3D 0;

before the x86_cpu_featureset_to_policy() instead.

 -George

