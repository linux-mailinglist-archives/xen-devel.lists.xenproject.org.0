Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8565C8078A
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 13:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170525.1495588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVjF-0007pf-6i; Mon, 24 Nov 2025 12:31:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170525.1495588; Mon, 24 Nov 2025 12:31:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNVjF-0007nz-2u; Mon, 24 Nov 2025 12:31:37 +0000
Received: by outflank-mailman (input) for mailman id 1170525;
 Mon, 24 Nov 2025 12:31:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qo8f=6A=gmail.com=samaan.dehghan@srs-se1.protection.inumbo.net>)
 id 1vNVj3-0004cg-Jp
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 12:31:25 +0000
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d159e6a-c931-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 13:31:24 +0100 (CET)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-297ef378069so37867615ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 04:31:24 -0800 (PST)
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
X-Inumbo-ID: 7d159e6a-c931-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763987483; x=1764592283; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8d5FCDqF8Eyi33xLvv1HZy4mmEZ4/sGV8dAZOJVn5g=;
        b=I2WiaEtk/UyBbJ5EjMl0CwYJ7M2dWBoYd7Ret9YHvoyIcOq6vwMRUWjMjEMrQeGN1r
         OEb2p8olWwUpFnCOJr3epspCxW9eEwPt+uuODXMSHB4mQRqEy3t+xIzySWQKRBOul2Ki
         T/1PtvDW4CjZvsgWC3u/MVmQoU6Vi+2NSvGUcWElco2tljgUMnqDjZykJZg64mflXlVd
         V9YDZrVCu2qKlkjE0kdJy7EPjQVaQ9QH6FWfXAl58BDWNBpP+3bJhRSiGdbdzFUS50IT
         NqYJRMk3f8rnPldnlV81yOOAVKZw50Ba1mPRzKmNsEN9pQvRZkZ0bz5EKM7k8iVVvRqe
         uczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763987483; x=1764592283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f8d5FCDqF8Eyi33xLvv1HZy4mmEZ4/sGV8dAZOJVn5g=;
        b=QEG4Kzd3c1uOowb6ZWx2L5SVmSqAvyWo4xKz1grdew7C3YO59UB++giPlRT+S/9Vjj
         RxYww59Xvje5Bg34shYfSvKIfq7w4hOSvABtLzXQ5kW3VITzYLyMsz0KFNqY8172wuhQ
         xa22Z5WkmRFGOR3uP/XLgvszVWyYsqPQtx92KwQpa3lVpC1QjO0dJFaiP/s28Ge9/Qld
         USbG0RqCNyBpZaIctCNgYZbJwhcCNAKcVjSEgAs4sIXZoSIYPage7mX5vzv2PVG90hZL
         vQGYOzBJwuaPZgFbfDtCISpWe59w2jQ5bnmUEsmdB9W75Gtcqw1FoHdBeXMVWE9gP3qz
         IdNg==
X-Gm-Message-State: AOJu0YwkUI9s7GzRwjRyzVr3Cq7UWy6bpB6BIM0HUxJGtPyvfV9y6Vu1
	XQ8rdXJp9WFSMMR+uGQIJVF5es5eqg8dhaXiBqP3UUEXnI804a8bq/DfNl6mRmFJsek6B65wxdP
	x3EwV4U8rFO6XRa0oxu9QL7Gimwxnxw==
X-Gm-Gg: ASbGncu0ufr+iXTdJmVyx2nCfGCB8qEsiJgoTYJpAcWzdzLSIhgnR8drb4Qr72V5Ow+
	ThooYtusnTNmSx3dyjvGXZn22wEgSIEm/AHm3eXciy+P+WaTrFRFuAoCRGyVV4b6Xw9vinQimYs
	Mtb7hd/nZ+xkITcD5djKg2P98Hy/s7Y/e3Kx8DnI8BO4j7603ZhMi/3Q9tOeR9sXY6drJSo4R4D
	bLty/3Wz737eKJukCRn+afxoyLx/QC9Me96gTY3CA8HmmJHwa2pNQbUB+qFa3hAcZIoP7ZsJlD3
	HswygOmQH7BRic+itA5ARY75
X-Google-Smtp-Source: AGHT+IHQGPCuzF4kn0l3NguKNQ98NpEXDZz6EzTvD/PxRFxEpjSHQRpgj9QdIglFCYkKIVghDWgbQ1ss9MPOIPORjtc=
X-Received: by 2002:a17:90b:5183:b0:340:7b2e:64cc with SMTP id
 98e67ed59e1d1-34733e5c408mr11531925a91.15.1763987482923; Mon, 24 Nov 2025
 04:31:22 -0800 (PST)
MIME-Version: 1.0
References: <3bb418ae6a36a9ac89c697a417fa0745fa9ac702.1763949990.git.samaan.dehghan@gmail.com>
 <9c76a959-51c0-4eb7-9d05-ba4441318faa@citrix.com>
In-Reply-To: <9c76a959-51c0-4eb7-9d05-ba4441318faa@citrix.com>
From: Saman Dehghan <samaan.dehghan@gmail.com>
Date: Mon, 24 Nov 2025 06:31:11 -0600
X-Gm-Features: AWmQ_blNd91GU5pYLJJWWFKElZl5a0ofnfee-szdA3_6mqWx21xOCS1jSxl-Bk8
Message-ID: <CAHFNDNikjXNHCj2RXMoZPckqaQAy2u-xw-QyCO7nXT3pttp6Hg@mail.gmail.com>
Subject: Re: [PATCH] XEN: enable MC/DC coverage for Clang
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@vates.tech>, 
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 24, 2025 at 5:15=E2=80=AFAM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 24/11/2025 2:18 am, Saman Dehghan wrote:
> > Clang >=3D 18 supports Modified Condition/Decision Coverage (MC/DC).
> > This patch enables the detection and usage of this feature when
> > compiling Xen with Clang.
> >
> > - Update detection logic to check for '-fcoverage-mcdc' when using Clan=
g.
> > - Update llvm.c to handle the profile format changes (bitmap section)
> >   required for MC/DC.
> > - Guard -Wno-error=3Dcoverage-too-many-conditions with CONFIG_CC_IS_GCC
> >   to avoid passing a GCC-only warning option to Clang
> >
> > Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> > ---
> >  xen/Kconfig                |  2 +-
> >  xen/Rules.mk               |  1 +
> >  xen/arch/x86/Makefile      |  4 +++-
> >  xen/common/coverage/llvm.c | 24 +++++++++++++++++++++++-
> >  4 files changed, 28 insertions(+), 3 deletions(-)
> >
> > diff --git a/xen/Kconfig b/xen/Kconfig
> > index a5e5af3b76..5508993f02 100644
> > --- a/xen/Kconfig
> > +++ b/xen/Kconfig
> > @@ -53,7 +53,7 @@ config CC_HAS_ASM_GOTO_OUTPUT
> >
> >  # Compiler supports -fcondition-coverage aka MC/DC
>
> While you're improving these comments, please drop -fcondition-coverage
> (as it's no longer accurate), and expand MC/DC for the benefit of people
> who don't know what it is.
>
> >  config CC_HAS_MCDC
>
> Also, # GCC >=3D 14, or Clang >=3D 18
>
> It's important for toolchain versions to be given in comments, so we can
> figure out what to clean up when upgrading the toolchain baselines.
>
> > diff --git a/xen/common/coverage/llvm.c b/xen/common/coverage/llvm.c
> > index 532889c857..a8c7e7e8d2 100644
> > --- a/xen/common/coverage/llvm.c
> > +++ b/xen/common/coverage/llvm.c
> > @@ -120,6 +120,10 @@ extern const char __start___llvm_prf_names[];
> >  extern const char __stop___llvm_prf_names[];
> >  extern uint64_t __start___llvm_prf_cnts[];
> >  extern uint64_t __stop___llvm_prf_cnts[];
> > +#ifdef CONFIG_CONDITION_COVERAGE
> > +extern const char __start___llvm_prf_bits[];
> > +extern const char __stop___llvm_prf_bits[];
> > +#endif
>
> No need for these to be #ifdef'd.  In turn, it lets you do ...
>
> >
> >  #define START_DATA      ((const void *)__start___llvm_prf_data)
> >  #define END_DATA        ((const void *)__stop___llvm_prf_data)
> > @@ -127,16 +131,25 @@ extern uint64_t __stop___llvm_prf_cnts[];
> >  #define END_NAMES       ((const void *)__stop___llvm_prf_names)
> >  #define START_COUNTERS  ((void *)__start___llvm_prf_cnts)
> >  #define END_COUNTERS    ((void *)__stop___llvm_prf_cnts)
> > +#define START_BITMAP    ((void *)__start___llvm_prf_bits)
> > +#define END_BITMAP      ((void *)__stop___llvm_prf_bits)
> >
> >  static void cf_check reset_counters(void)
> >  {
> >      memset(START_COUNTERS, 0, END_COUNTERS - START_COUNTERS);
> > +#ifdef CONFIG_CONDITION_COVERAGE
> > +    memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);
> > +#endif
>
> ... this:
>
>     if ( IS_ENABLED(CONFIG_CONDITION_COVERAGE) )
>         memset(START_BITMAP, 0, END_BITMAP - START_BITMAP);
>
> >  }

Thanks Andrew.

IS_ENABLED(CONFIG_CONDITION_COVERAGE) is not the same as #ifdef
CONFIG_CONDITION_COVERAGE.
When the option is completely undefined, IS_ENABLED() returns 1 (enabled).
So even with no CONFIG_CONDITION_COVERAGE defined, the code takes the
"enabled" path, which is not what we want here.

> >
> >  static uint32_t cf_check get_size(void)
> >  {
> > -    return ROUNDUP(sizeof(struct llvm_profile_header) + END_DATA - STA=
RT_DATA +
> > +    uint32_t size =3D ROUNDUP(sizeof(struct llvm_profile_header) + END=
_DATA - START_DATA +
> >                     END_COUNTERS - START_COUNTERS + END_NAMES - START_N=
AMES, 8);
> > +#ifdef CONFIG_CONDITION_COVERAGE
> > +    size +=3D ROUNDUP(END_BITMAP - START_BITMAP, 8);
> > +#endif
>
> and similar here.
>
> > +    return size;
> >  }
> >
> >  static int cf_check dump(
> > @@ -147,11 +160,17 @@ static int cf_check dump(
> >          .version =3D LLVM_PROFILE_VERSION,
> >          .num_data =3D DIV_ROUND_UP(END_DATA - START_DATA, sizeof(struc=
t llvm_profile_data)),
> >          .num_counters =3D DIV_ROUND_UP(END_COUNTERS - START_COUNTERS, =
sizeof(uint64_t)),
> > +#if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >=3D 9
> > +        .num_bitmap_bytes =3D END_BITMAP - START_BITMAP,
> > +#endif
> >          .names_size =3D END_NAMES - START_NAMES,
> >  #if LLVM_PROFILE_VERSION >=3D 8
> >          .counters_delta =3D START_COUNTERS - START_DATA,
> >  #else
> >          .counters_delta =3D (uintptr_t)START_COUNTERS,
> > +#endif
> > +#if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >=3D 9
> > +        .bitmap_delta =3D START_BITMAP - START_DATA,
> >  #endif
> >          .names_delta =3D (uintptr_t)START_NAMES,
> >          .value_kind_last =3D LLVM_PROFILE_NUM_KINDS - 1,
>
> With structure initialisation, you do not need to have the fields in
> declaration order.  Therefore, you want to do something like this:
>
>          .value_kind_last =3D LLVM_PROFILE_NUM_KINDS - 1,
> +#if defined(CONFIG_CONDITION_COVERAGE) && LLVM_PROFILE_VERSION >=3D 9
> +        .num_bitmap_bytes =3D END_BITMAP - START_BITMAP,
> +        .bitmap_delta =3D START_BITMAP - START_DATA,
> +#endif
>  };
>
>
> to keep the ifdefary more simple.
>
> ~Andrew

