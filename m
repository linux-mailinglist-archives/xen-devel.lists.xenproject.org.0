Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FED8BCE8D
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 14:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717625.1120023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xs1-0002BE-GZ; Mon, 06 May 2024 12:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717625.1120023; Mon, 06 May 2024 12:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xs1-00029i-DD; Mon, 06 May 2024 12:55:05 +0000
Received: by outflank-mailman (input) for mailman id 717625;
 Mon, 06 May 2024 12:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3cb6=MJ=gmail.com=edgar.iglesias@srs-se1.protection.inumbo.net>)
 id 1s3xs0-00029W-39
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 12:55:04 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dad0ec0f-0ba7-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 14:55:03 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59cf8140d0so185984966b.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 05:55:03 -0700 (PDT)
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
X-Inumbo-ID: dad0ec0f-0ba7-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715000102; x=1715604902; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EhH/7Q5eRDHZgsJelZf736Vi0Pan7ufpWetR5CiOK+A=;
        b=gdlvWalALhjbKJIuhGrR0QAyyAzcWD4PYhs1VYgoLNWJYmlLQaOcFOIlk9BEnLTOxq
         2TMcgKZFCGIrxiJVY65HO4TX+m9U4xIIkNIwVvLsVuYIM/I0Vbunv3PwfnlKxRpUd95l
         uvhGr4vgZhpJX5paNJ8rKjw3bNU4ccD1hfFC2Q2D14JzXjrdR3x4h6P01Sdr09GRzJXs
         KB/bQ7rZRj22T37TF6dL/BvT59WZDgIBote0J72yi3O0GR1sdubhmO4RXMs8iqNV4CVe
         yJsBnZMTq3peHRieFTzlNRU83+oqT6ScyNqdLw+NQ7W3uTdSSbgNRekQq8D+6KsxADco
         ZXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715000102; x=1715604902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EhH/7Q5eRDHZgsJelZf736Vi0Pan7ufpWetR5CiOK+A=;
        b=qz6ZJxKpUzS2QAKyob7tk5CxY0eGwsqgeqWLPk/FD18x8AtGdOKgOM4WWAyvL4R00z
         hESYHHDi7CEMKA7nDs5P83cWYWlBLPMJWClqFtNpROA64K0DQKMMYEiH/gthYDQKAwJG
         Lp7VGi9pg03tR3fbi9Xw7NqCga2EhJzRW/7kMDKtFfTg438B3bLpBlClwrxLlzoZ2MB3
         Lu9emVLRebA2ptl1HQWcGxG3IaZ7G6C8DpPqev4fy1XT6LH53XYWGipHO3Stnbrpc5T9
         K6TPEhh8xcC+spHvj3a9dAJ/raqTv9YYL7N1612i6mb3SC6W61kqqRY5SltZN0dsQV76
         0HBA==
X-Gm-Message-State: AOJu0Yw/NH6UwbdEs7P/n1Fxl/PcIcM8dS0hB44o1jV/Iam3Wbx4w0TI
	+jXwf1h1Nh9gRDzsARyMiqQEM93jwyk425QC/BJDelDMHXokp3WJjm6LXyOAoe/AXZjrp9qVsJ0
	ZYN/Hf/YnbswfAfvOCru2PkHlR00=
X-Google-Smtp-Source: AGHT+IGGY3pick5A2OFm6u0newd657HwtCQFnmrAmJ767RsGkoGB4nk/StQ01Wlb3Gn8OXFqkh3i5Vzh2taLsTduMZo=
X-Received: by 2002:a50:9b53:0:b0:572:a711:3daf with SMTP id
 a19-20020a509b53000000b00572a7113dafmr6044694edj.40.1715000102574; Mon, 06
 May 2024 05:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240501035448.964625-1-edgar.iglesias@gmail.com>
 <20240501035448.964625-7-edgar.iglesias@gmail.com> <alpine.DEB.2.22.394.2405031656490.1151289@ubuntu-linux-20-04-desktop>
In-Reply-To: <alpine.DEB.2.22.394.2405031656490.1151289@ubuntu-linux-20-04-desktop>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Mon, 6 May 2024 14:54:51 +0200
Message-ID: <CAJy5ezpgXVp838aA_E8vJDARoO5iQOh07D+Gpn0kMCLj_iXyLw@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] xen/arm64: bpi: Add missing code symbol annotations
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, bertrand.marquis@arm.com, 
	michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, jbeulich@suse.com, 
	andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 4, 2024 at 2:14=E2=80=AFAM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> On Wed, 1 May 2024, Edgar E. Iglesias wrote:
> > From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> >
> > Use the generic xen/linkage.h macros to annotate code symbols
> > and add missing annotations.
> >
> > Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> > ---
> >  xen/arch/arm/arm64/bpi.S | 20 ++++++++++++--------
> >  1 file changed, 12 insertions(+), 8 deletions(-)
> >
> > diff --git a/xen/arch/arm/arm64/bpi.S b/xen/arch/arm/arm64/bpi.S
> > index 4e63825220..b16e4d1e29 100644
> > --- a/xen/arch/arm/arm64/bpi.S
> > +++ b/xen/arch/arm/arm64/bpi.S
> > @@ -52,14 +52,15 @@
> >   * micro-architectures in a system.
> >   */
> >      .align   11
> > -ENTRY(__bp_harden_hyp_vecs_start)
> > +FUNC(__bp_harden_hyp_vecs_start)
> >      .rept 4
> >      vectors hyp_traps_vector
> >      .endr
> > -ENTRY(__bp_harden_hyp_vecs_end)
> > +GLOBAL(__bp_harden_hyp_vecs_end)
> > +END(__bp_harden_hyp_vecs_start)
>
> Shouldn't GLOBAL be changed to FUNC as well?
>

I was a bit unsure but went for GLOBAL since the _end labels point to
addresses after and outside of the code sequence.
But I don't have a strong opinion and am happy to change them to FUNC
if you feel that's better.

Cheers,
Edgar


>
> >  .macro mitigate_spectre_bhb_loop count
> > -ENTRY(__mitigate_spectre_bhb_loop_start_\count)
> > +FUNC(__mitigate_spectre_bhb_loop_start_\count)
> >      stp     x0, x1, [sp, #-16]!
> >      mov     x0, \count
> >  .Lspectre_bhb_loop\@:
> > @@ -68,11 +69,12 @@ ENTRY(__mitigate_spectre_bhb_loop_start_\count)
> >      b.ne    .Lspectre_bhb_loop\@
> >      sb
> >      ldp     x0, x1, [sp], #16
> > -ENTRY(__mitigate_spectre_bhb_loop_end_\count)
> > +GLOBAL(__mitigate_spectre_bhb_loop_end_\count)
>
> Also here?
>
>
> > +END(__mitigate_spectre_bhb_loop_start_\count)
> >  .endm
> >
> >  .macro smccc_workaround num smcc_id
> > -ENTRY(__smccc_workaround_smc_start_\num)
> > +FUNC(__smccc_workaround_smc_start_\num)
> >      sub     sp, sp, #(8 * 4)
> >      stp     x0, x1, [sp, #(8 * 2)]
> >      stp     x2, x3, [sp, #(8 * 0)]
> > @@ -81,13 +83,15 @@ ENTRY(__smccc_workaround_smc_start_\num)
> >      ldp     x2, x3, [sp, #(8 * 0)]
> >      ldp     x0, x1, [sp, #(8 * 2)]
> >      add     sp, sp, #(8 * 4)
> > -ENTRY(__smccc_workaround_smc_end_\num)
> > +GLOBAL(__smccc_workaround_smc_end_\num)
>
> And here?
>
>
> > +END(__smccc_workaround_smc_start_\num)
> >  .endm
> >
> > -ENTRY(__mitigate_spectre_bhb_clear_insn_start)
> > +FUNC(__mitigate_spectre_bhb_clear_insn_start)
> >      clearbhb
> >      isb
> > -ENTRY(__mitigate_spectre_bhb_clear_insn_end)
> > +GLOBAL(__mitigate_spectre_bhb_clear_insn_end)
>
> and here?
>
>
> > +END(__mitigate_spectre_bhb_clear_insn_start)
> >
> >  mitigate_spectre_bhb_loop 8
> >  mitigate_spectre_bhb_loop 24
> > --
> > 2.40.1
> >

