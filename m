Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FA385FB4D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 15:33:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684443.1064294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdA8f-00067S-Pg; Thu, 22 Feb 2024 14:33:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684443.1064294; Thu, 22 Feb 2024 14:33:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rdA8f-00065e-N2; Thu, 22 Feb 2024 14:33:29 +0000
Received: by outflank-mailman (input) for mailman id 684443;
 Thu, 22 Feb 2024 14:33:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aBgv=J7=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1rdA8e-00065Y-JU
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 14:33:28 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 577c7514-d18f-11ee-8a55-1f161083a0e0;
 Thu, 22 Feb 2024 15:33:27 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-512b13bf764so5827964e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 06:33:27 -0800 (PST)
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
X-Inumbo-ID: 577c7514-d18f-11ee-8a55-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1708612407; x=1709217207; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWO4O0D1YfqyoCsIR6LchQGI1Au4b7dSpCaMRlBeBaM=;
        b=KM/FROad2G20+ed4DwEcNFa9wO2vzU6LhZmU2XxoeXf8gNtKjbuN2eMGkf0MeS5XyP
         wP38yywrUwzcdoik9yO9+9rGC3RPAMTHPoZmVZoasAZUW8Bf1u8q4Lmp2a3XlxVGN6ff
         /zrhkTH2a3HjM2DcQMmsvgCXf1LHzMuRIE77A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708612407; x=1709217207;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWO4O0D1YfqyoCsIR6LchQGI1Au4b7dSpCaMRlBeBaM=;
        b=bRCTCzQQ80r0e6xDEDgFaVCixMj6TroS8DcH29gZM2Mcbm6lEWJ2vTzx2UfqEclJdH
         g8N1BQ6U1IUsMZqSXaTq+IL20HS3b5mQP3rCzkNjpacd7JyLFAubcW4DWMijJtjM355q
         arIxLaP/OV2rBtHsjtJ+zHQV+8C0J3jGqMV2+z0zrIouMUY/DI+5lgchn29PTxG+K16w
         xWLeuV1nuhYAp8zjZYXGWtuK82shJsgsV2S5ONIpw1zqIU+uTYULE9oQSsH2qPGCeqNt
         TwF+kqvA5VvJ6+z4d9aW2Q1ah4q491LjoW8z1AtQubJVEZEOdJnIbON9Or483rS6Dyfs
         qB/g==
X-Forwarded-Encrypted: i=1; AJvYcCUdEL8M5ElFJ7GArimeDHGdPCDMPAua5pzYAoE+trYi3d7fQkSoyb2sKULnV46Ev3e7lpMjQks1eWBLHk6c5rTDLnrGe5aE/dNMA6khz0g=
X-Gm-Message-State: AOJu0YzaqyuMJt9Lma7wGXI/RksBqysdrrpSTtwMZtUR9Ba/YsZ0OhTb
	lbAXLd2SyKpgBvE8c+0KgdBqco6hIV4bHAQvv8uRNiHCy6TYT0hLiMhLmwZAqi9RbOM+ie2Kw6J
	ICDxAv6HNC55+K2Bv30YrnTRKFzL5epnhPMP8sQ==
X-Google-Smtp-Source: AGHT+IFS17Htyjz+pfob5P7AjVa74GpQ4vlmDCG+qdnfsml0zv30QdGqOt+wc3EaC4FRCBsiXMoQ07G/6TPszxz8WeQ=
X-Received: by 2002:a05:6512:2313:b0:512:cb9f:b279 with SMTP id
 o19-20020a056512231300b00512cb9fb279mr6169771lfu.66.1708612406838; Thu, 22
 Feb 2024 06:33:26 -0800 (PST)
MIME-Version: 1.0
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-7-george.dunlap@cloud.com> <8ee35193-9715-4c4b-a1cb-11af04c4dab9@suse.com>
In-Reply-To: <8ee35193-9715-4c4b-a1cb-11af04c4dab9@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Thu, 22 Feb 2024 22:33:15 +0800
Message-ID: <CA+zSX=YuLmZRz=1wwV=svOrhfQ66E-CZ9TEtqNCVM++JVQ5CzQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] svm/nestedvm: Introduce nested capabilities bit
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2024 at 12:25=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 06.02.2024 02:20, George Dunlap wrote:
> > --- /dev/null
> > +++ b/docs/designs/nested-svm-cpu-features.md
> > @@ -0,0 +1,110 @@
> > +# Nested SVM (AMD) CPUID requirements
> > +
> > +The first step in making nested SVM production-ready is to make sure
> > +that all features are implemented and well-tested.  To make this
> > +tractable, we will initially be limiting the "supported" range of
> > +nested virt to a specific subset of host and guest features.  This
> > +document describes the criteria for deciding on features, and the
> > +rationale behind each feature.
> > +
> > +For AMD, all virtualization-related features can be found in CPUID
> > +leaf 8000000A:edx
> > +
> > +# Criteria
> > +
> > +- Processor support: At a minimum we want to support processors from
> > +  the last 5 years.  All things being equal, older processors are
> > +  better.
>
> Nit: Perhaps missing "covering"? Generally I hope newer processors are
> "better".

I've reworded it.

> > +  For L0 this is required for performance: There's no way to tell the
> > +  guests not to use the LBR-related registers; and if the guest does,
> > +  then you have to save and restore all LBR-related registers on
> > +  context switch, which is prohibitive.
>
> "prohibitive" is too strong imo; maybe "undesirable"?

Prohibitive sounds strong, but I don't think it really is; here's the
dictionary definition:

"(of a price or charge) so high as to prevent something being done or bough=
t."

The cost of saving the registers on every context switch is so high as
to prevent us from wanting to do it.

I could change it to "too expensive".

> > --- a/xen/arch/x86/hvm/svm/nestedhvm.h
> > +++ b/xen/arch/x86/hvm/svm/nestedhvm.h
> > @@ -35,6 +35,7 @@ enum nestedhvm_vmexits
> >  nestedsvm_check_intercepts(struct vcpu *v, struct cpu_user_regs *regs,
> >      uint64_t exitcode);
> >  void svm_nested_features_on_efer_update(struct vcpu *v);
> > +void __init start_nested_svm(struct hvm_function_table *svm_function_t=
able);
>
> No section placement attributes on declarations, please.

Ack.

> > --- a/xen/arch/x86/hvm/svm/nestedsvm.c
> > +++ b/xen/arch/x86/hvm/svm/nestedsvm.c
> > @@ -1666,3 +1666,17 @@ void svm_nested_features_on_efer_update(struct v=
cpu *v)
> >          }
> >      }
> >  }
> > +
> > +void __init start_nested_svm(struct hvm_function_table *svm_function_t=
able)
> > +{
> > +    /*
> > +     * Required host functionality to support nested virt.  See
> > +     * docs/designs/nested-svm-cpu-features.md for rationale.
> > +     */
> > +    svm_function_table->caps.nested_virt =3D
> > +        cpu_has_svm_nrips &&
> > +        cpu_has_svm_lbrv &&
> > +        cpu_has_svm_nrips &&
>
> nrips twice? Was the earlier one meant to be npt?

Er, yes exactly.



> > --- a/xen/arch/x86/hvm/vmx/vmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vmx.c
> > @@ -3021,6 +3021,9 @@ const struct hvm_function_table * __init start_vm=
x(void)
> >      if ( cpu_has_vmx_tsc_scaling )
> >          vmx_function_table.tsc_scaling.ratio_frac_bits =3D 48;
> >
> > +    /* TODO: Require hardware support before enabling nested virt */
> > +    vmx_function_table.caps.nested_virt =3D vmx_function_table.caps.ha=
p;
>
> This won't have the intended effect if hap_supported() ends up clearing
> the bit (used as input here) due to a command line option override. I
> wonder if instead this wants doing e.g. in a new hook to be called from
> nestedhvm_setup(). On the SVM side the hook function would then be the
> start_nested_svm() that you already introduce, with a caps.hap check
> added.

I take it presmp_initcall()'s are guaranteed to run before __initcall()'s?

If so that's probably a good idea.

> Since you leave the other nested-related if() in place in
> arch_sanitise_domain_config(), all ought to be well, but I think that
> other if() really wants replacing by the one you presently add.

Ack.

I'll probably check in patches 1,2,3, and 5, and resend the other two,
unless you'd like to see all the changes again...

 -George




 -George

