Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCAEC08544
	for <lists+xen-devel@lfdr.de>; Sat, 25 Oct 2025 01:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150951.1481867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCRNB-0005kG-86; Fri, 24 Oct 2025 23:39:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150951.1481867; Fri, 24 Oct 2025 23:39:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCRNB-0005he-5C; Fri, 24 Oct 2025 23:39:05 +0000
Received: by outflank-mailman (input) for mailman id 1150951;
 Fri, 24 Oct 2025 23:39:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EH92=5B=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vCRN9-0005hY-0t
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 23:39:03 +0000
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [2607:f8b0:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dde1073-b132-11f0-9d16-b5c5bf9af7f9;
 Sat, 25 Oct 2025 01:39:01 +0200 (CEST)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7811a02316bso1967686b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Oct 2025 16:39:01 -0700 (PDT)
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
X-Inumbo-ID: 9dde1073-b132-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761349140; x=1761953940; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BzBb5BmwK5xm3uHZKtiITHLjGhguS3/7go288IiswA=;
        b=fnpWe8vT6HipPqad8d0U0tBF7WkQBvmm0rKCgZmtLRvEHTwnkmz9v3nmytFGNXgEkl
         wSvxGS/YNfBsCNuajtXk3g1w/PKmJSyP5gmo0xRJXz7/bunVDl4A6hSLOZy2wgDmhX1Q
         50JtYl1sRUcZZyvM0sJC4SgwE+96sZoCDPXH9Zzz1FhRdD/41e31MnsWM2QVahdKmYuR
         8GkUO13fC1Gl9bcJPTsi1d0ackBM1BwNf5Xn+MlNrsGvILjHIettjB/EHaQNjh5cn1Dr
         RLbO8z3EY81Dv/j0vVzXoui78WsTD+HqOh+cICc8fEO5XqZPXFN1n8TRNffm4ICnme3/
         v7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761349140; x=1761953940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BzBb5BmwK5xm3uHZKtiITHLjGhguS3/7go288IiswA=;
        b=PQnbaCGa8QHVBSaShhy+REpgQ4iqda4xc3B4iQfD0kqHa5Bw8pm+/cTvDY2Tii7rma
         L1MB/jm2KR/YkyWXxHQNwVi+0r8D883MIwKslZJM9/8ajPvGyr4tBTnDVSBW708d5q4e
         t10KYWn80IQZN7VKsdSHG6nqf+j3tLv4BI3M3IofZuN0ZO1OeO5kp0HxwAmeujkIp1A/
         E5gMHrR+5I3vnvid8S5RNwp53W8LsHY1pkD+3rdKQW9b1dQO1slpfYxe6NGVeZUVNd5o
         4Gfu7Lo4cf8ihVVhWpCpyGH3+HW6pyaEuoUy9E1fq+88YUl2mWJyEr5zjsXVWQVz0tIs
         ZjvA==
X-Gm-Message-State: AOJu0YzRUcsSU6vp2gTQcp53D08ytYJ9CvWbFvBdts0mu4egBJZzTNEc
	MsXpkFxvmtT55xLhHutcc845Occxj3LbC4ROClZUb8wE6Hy0hkNTE9Gz/UY8ktR4wC9aCK709ho
	APO8JxQwtTkr0WzAMAnClNcmjCbw8Dw==
X-Gm-Gg: ASbGnctRu14LRIWB2PpPD4ZWQbbaWTt4q5L/xaXw5YNP87RZjivojuFk8uSCMbwuEq9
	0okXuG2oMxx1v4MO+Tyey9CGRWqXQWiCG4tgBtr+87mpT71wIABaxWgYKq+E0q8Ota1WX6Sz/aG
	l38JLlSwZ07UWbTgQEdIlmTjSHXikotvV4ncn/667RDvlp1StOPB70P5bJIekCErghFWi6eVcGE
	s//45FNLCusf9E6E9LtoBvEM1NHSimTn3a5izyYG5j41vHIJ9fwaarV5w==
X-Google-Smtp-Source: AGHT+IETFcs6e7jVZ8dcgrjXaY3Cbsx5t0PRZZZY52X7+Fsw0EI9//i8csZbQZRCnb/FXapCYAusRN/z7qDzYKd+6qA=
X-Received: by 2002:a05:6a21:999e:b0:340:ecf3:5fc1 with SMTP id
 adf61e73a8af0-340ecf361dfmr1374818637.43.1761349139999; Fri, 24 Oct 2025
 16:38:59 -0700 (PDT)
MIME-Version: 1.0
References: <3dc1fe6ee55d973a25a0441d0f6b41e00a58227b.1759355762.git.samaan.dehghan@gmail.com>
 <06646f747f21c3f388cf6e9d59a20238a4a91170.1761263588.git.samaan.dehghan@gmail.com>
 <c7397bc5-574d-444a-a8cf-e76e95ec20fd@citrix.com>
In-Reply-To: <c7397bc5-574d-444a-a8cf-e76e95ec20fd@citrix.com>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Fri, 24 Oct 2025 18:38:49 -0500
X-Gm-Features: AS18NWA1O0HP1cPKqOZAJGQZp4TD6m0fkHgd09cHpk4Ws7evkSQpfa2tkM2JOjA
Message-ID: <CAHFNDNhMCe--4z9CL49Yk8Rf4FA+G7-7VozJfhLcVESaByU7qg@mail.gmail.com>
Subject: Re: [PATCH v3] Support LLVM raw profile versions 5, 6, 7, 8, 9, and 10
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Anthony PERARD <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, 
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksii Kurochko <oleksii.kurochko@gmail.com>, Wentao Zhang <wentaoz5@illinois.edu>, 
	Matthew L Weber <matthew.l.weber3@boeing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 4:33=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> The subject should have a "xen: " prefix, as this applies to the
> hypervisor and not other
>
> On 24/10/2025 1:16 am, Saman Dehghan wrote:
> > This change enables compatibility for measuring code coverage
> > with Clang versions 14 through 20 by supporting their
>
> Stale 14?  It looks to be 11 now.

Sorry for the mistake. I meant "with Clang versions 11 through 20 by
supporting their...".

>
> > respective raw profile formats.
> >
> > 1- Added support for LLVM raw profile versions 5, 6, 7, 8, 9, and 10.
> > 2- Initialized llvm_profile_header for all versions based on llvm sourc=
e code in
> >    compiler-rt/include/profile/InstrProfData.inc for each version.
> > 3- We tested this patch for all Clang versions from 11 through 20 on x8=
6 platform.
> > 4- Fixed linking warnings related to coverage code in x86.
> >
> > Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> > ---
>
> When sending multiple revisions, it's customary to put a short list here
> if what you've changed from the previous revision.

Changes since version 2:
  1- Additionally support raw profile version 5, 6, 7 in clang 11, 12, 13.
  2- Fix coverage related linking warnings in x86.
  3- Revert unnecessary type changes, casting, etc.

>
> Also, you didn't accumulate your release ack from v2.
>
> Release-Acked-By: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Sorry we missed this. Thanks for reminding us.

>
> >  xen/arch/x86/xen.lds.S     |  6 ++++
> >  xen/common/coverage/llvm.c | 73 ++++++++++++++++++++++++++++++++++----
> >  xen/include/xen/xen.lds.h  | 18 ++++++++++
> >  3 files changed, 91 insertions(+), 6 deletions(-)
> >
> > diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
> > index 517b2aa8c2..e3272a546f 100644
> > --- a/xen/common/coverage/llvm.c
> > +++ b/xen/common/coverage/llvm.c
> > @@ -107,11 +145,34 @@ static int cf_check dump(
> >      struct llvm_profile_header header =3D {
> >          .magic =3D LLVM_PROFILE_MAGIC,
> >          .version =3D LLVM_PROFILE_VERSION,
> > -        .data_size =3D (END_DATA - START_DATA) / sizeof(struct llvm_pr=
ofile_data),
> > -        .counters_size =3D (END_COUNTERS - START_COUNTERS) / sizeof(ui=
nt64_t),
> > +#if __clang_major__ >=3D 13
> > +        .binary_ids_size =3D 0,
> > +#endif
> > +        .num_data =3D ((END_DATA + sizeof(struct llvm_profile_data) - =
1)
> > +                - START_DATA) / sizeof(struct llvm_profile_data),
>
> There's a helper for this expression.
>
> DIV_ROUND_UP(END_DATA - START_DATA, sizeof(llvm_profile_data))
>
> > +        .padding_bytes_before_counters =3D 0,
> > +        .num_counters =3D ((END_COUNTERS + sizeof(uint64_t) - 1)
> > +                - START_COUNTERS) / sizeof(uint64_t),
>
> DIV_ROUND_UP(END_COUNTERS - START_COUNTERS, sizeof(uint64_t))
>
>
> > +        .padding_bytes_after_counters =3D 0,
> > +#if __clang_major__ >=3D 18
> > +        .num_bitmap_bytes =3D 0,
> > +        .padding_bytes_after_bitmap_bytes =3D 0,
> > +#endif
> >          .names_size =3D END_NAMES - START_NAMES,
> > +#if __clang_major__ >=3D 14
> > +        .counters_delta =3D START_COUNTERS - START_DATA,
> > +#else
> >          .counters_delta =3D (uintptr_t)START_COUNTERS,
> > +#endif
> > +
> > +#if __clang_major__ >=3D 18
> > +        .bitmap_delta =3D 0,
> > +#endif
> >          .names_delta =3D (uintptr_t)START_NAMES,
> > +#if __clang_major__ >=3D 19 && __clang_major__ <=3D 20
> > +        .num_vtables =3D 0,
> > +        .vnames_size =3D 0,
> > +#endif
>
> Because this is a structure initialiser, everything set explicitly to 0
> can be omitted.  This removes all #ifdef-ary except the .counters_delta
> I believe, as well as the .padding_byte_* fields.
>

Is it undefined behaviour to leave struct members uninitialized for
local variables?

> The resulting diff is far smaller.
>
> >          .value_kind_last =3D LLVM_PROFILE_NUM_KINDS - 1,
> >      };
> >      unsigned int off =3D 0;
> > diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
> > index b126dfe887..42550a85a2 100644
> > --- a/xen/include/xen/xen.lds.h
> > +++ b/xen/include/xen/xen.lds.h
> > @@ -81,6 +81,24 @@
> >    .stab.index 0 : { *(.stab.index) }         \
> >    .stab.indexstr 0 : { *(.stab.indexstr) }
> >
> > +#if defined(CONFIG_COVERAGE) && defined(CONFIG_CC_IS_CLANG)
> > +
> > +#define LLVM_COV_RW_DATA                                   \
> > +    DECL_SECTION(__llvm_prf_cnts) { *(__llvm_prf_cnts) }   \
> > +    DECL_SECTION(__llvm_prf_data) { *(__llvm_prf_data) }   \
> > +    DECL_SECTION(__llvm_prf_bits) { *(__llvm_prf_bits) }
> > +
> > +#define LLVM_COV_RO_DATA                                   \
> > +    DECL_SECTION(__llvm_prf_names) { *(__llvm_prf_names) }
> > +
> > +#define LLVM_COV_DEBUG                                     \
> > +    DECL_DEBUG(__llvm_covfun, 8)                           \
> > +    DECL_DEBUG(__llvm_covmap, 8)
> > +#else
> > +#define LLVM_COV_RW_DATA
> > +#define LLVM_COV_RO_DATA
> > +#define LLVM_COV_DEBUG
> > +#endif
>
> Newline here.
>
> But, there's no problem stating sections which are unused.  I think the
> outer #if/#else can be dropped.
>
> Otherwise, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>
> I can fix these all up on commit, seeing as it's release acked for 4.21

Thank you for offering to fix them up. Let me know how I can help or
if I need to send another version.

Thanks,
Saman

>
> ~Andrew

