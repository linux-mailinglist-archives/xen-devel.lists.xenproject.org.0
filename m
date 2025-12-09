Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6A2CAFAB8
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 11:41:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181405.1504463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSv9r-000426-DG; Tue, 09 Dec 2025 10:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181405.1504463; Tue, 09 Dec 2025 10:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSv9r-0003z5-AF; Tue, 09 Dec 2025 10:41:27 +0000
Received: by outflank-mailman (input) for mailman id 1181405;
 Tue, 09 Dec 2025 10:41:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9j7=6P=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vSv9p-0003wy-BJ
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 10:41:25 +0000
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a989242-d4eb-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 11:41:23 +0100 (CET)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7c78d30649aso4421443a34.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 02:41:23 -0800 (PST)
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
X-Inumbo-ID: 9a989242-d4eb-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765276882; x=1765881682; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdXqyy49oz3rk7QbCRY2t0YGhzNQSWy67ibz8KTvI/I=;
        b=NNsS0eIXiDC93WJILRcHXS2ADpaqhSTaZnp5pBJ5/fuMjKf1TAfXmkMXSmCmgxYI3N
         Dc79bdP0sT2CG2MzuIQUS+DqlBPvrc+r32WNO06v/POfxfFZSVc1BejTXTnM7BuuJiVK
         VfvTcwSPhkSG/rxxak6vbZo0+i53YtmmSQD/yEwQl2G9KPVaPtLjPaB2jas0mH0kfv4t
         fkT394jUF+unB1MJCulEHKD4fUO4Qfz5tdi1anKedY2lea71ASLBrjqJgqZBbzykQ0p6
         DBT8mAMxq1HV8CgcetpllZefwQMDMxtE2Kflh3LS3Vo6wRVWKbL/aLA0+cs//09jdOts
         gDyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765276882; x=1765881682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdXqyy49oz3rk7QbCRY2t0YGhzNQSWy67ibz8KTvI/I=;
        b=oNE+l3WLG1AX81515pVCdo79Ox//L4fkflmuTS0CZ/5rLT7JnCKbpFDriStj7wj1Zf
         Jn0eCB2NpNizvIVQNiFhhOAyjqqLepiFzTncASi5vJ1FXTFv+6Di9nLkEvHi7qR6jQIK
         IFY1u7PUpLgb3B/5vOL1JCkyFAgwfZTQgcnEBVXaxPyj6O0VPB5cTinmI6vaVh2TrtK+
         3RBi5kEoFBgnu+rM/cTY/9BAD/FEuXWKSKtSeBO2arJKBhUinVJ5zJeFRZp2890U3ft/
         Wioxyy8U9aWilPt2p8JcYGCG5LuGSB5ZnCoVUDZySP8iXx1UF/seLo8/xQWqhVsBewWz
         DUoA==
X-Gm-Message-State: AOJu0YzCAH6qk1A0YF+jl2CYsC0n/P0uUl6jwt3am0THCHJ857/T206a
	fKn89vmKjy81MblElnp658sLxPDEyWXWztMJtOFmSQNke0PFQvUNPyZ9dMhLE/7FGDeiMphrkWc
	daK1SBbbomAlFPXmXk5uvBxh0yVRtB31UBhp+1uPDoQ==
X-Gm-Gg: ASbGncuGPLqYfjLs3ZnXB20euejcN5nff8OaJv93lz3c6lirC0cqPcOQkifI4vZibKI
	f+cQ/tJ5Dtr1+xF6bGNPDHDyEgStWO++cjj5qcRqICjY7K96UYurmGJ7s4S7iJaVbLs15MQe5zn
	1ND8F4HUhX2XGLHjsUD4knHJUdTsOlohaoXxRsE4qZ/GGawANq4xJ/ie5xxR9+dAWeFtOE2MUDg
	czSHBROvQY9wP3kxFsdLamVmuEA/F/O3V0rBgDhHMDP8oYoJk8QitTEfLF3rP7u20iZSb7wEPk0
	ivC3fYskf+xZyAsqsiuJDh4fhpiifrVduzIzmkchJ3kREwjOWFtvqMkGQDvspw==
X-Google-Smtp-Source: AGHT+IFtGRG3NrgzrDF0ifHcXfRJun3MqGJpzbe4JIUgWnLWfJBNSK1HxyAxdGz9PwDkPYins3BAPdg+RRg60Tlf4Zo=
X-Received: by 2002:a05:6820:99c:b0:659:9a49:8fc5 with SMTP id
 006d021491bc7-6599a97371cmr4754793eaf.62.1765276881829; Tue, 09 Dec 2025
 02:41:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764930353.git.bertrand.marquis@arm.com>
 <697ab9880767b75c9964ae900a43fd4e065fc502.1764930353.git.bertrand.marquis@arm.com>
 <CAHUa44E+Cgs6WeuSyYi=r1BCzaYN+f9MBoSudyLxkU2LeGxzXg@mail.gmail.com> <C518918D-1CAF-49D6-BC94-CACEF409E46A@arm.com>
In-Reply-To: <C518918D-1CAF-49D6-BC94-CACEF409E46A@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 9 Dec 2025 11:41:09 +0100
X-Gm-Features: AQt7F2rcFXQLuxol20sQQtEDvbGTVH7VVvTYzYZRdKRRXHRzHEmthEWJhwA6pkc
Message-ID: <CAHUa44Ff=rzsd-3MtjB4YoT4=e_Xbgy0Yss=TSe=2=X77XQcXA@mail.gmail.com>
Subject: Re: [PATCH v1 03/12] xen/arm: ffa: Fix is_64bit init
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Tue, Dec 9, 2025 at 11:11=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 9 Dec 2025, at 10:05, Jens Wiklander <jens.wiklander@linaro.org> wro=
te:
> >
> > Hi Bertrand,
> >
> > On Fri, Dec 5, 2025 at 11:37=E2=80=AFAM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> is_64bit_domain(d) is not set during domain_init as the domain field i=
s
> >> only set when loading the domain image which is done after executing
> >> domain_init.
> >>
> >> Fix the implementation to set is_64bit when version gets negotiated.
> >> is_64bit is only used during partition_info_get once a domain is added
> >> in the list of domains having ffa support. It must only be accessed wh=
en
> >> the rwlock is taken (which is the case).
> >>
> >> is_64bit must not be used without the rwlock taken and other places in
> >> the code needing to test 64bit support of the current domain will have
> >> to use calls to is_64bit_domain instead of the field from now on.
> >>
> >> Fixes: 09a201605f99 ("xen/arm: ffa: Introduce VM to VM support")
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in v1:
> >> - patch introduced
> >> ---
> >> xen/arch/arm/tee/ffa.c         | 9 ++++++++-
> >> xen/arch/arm/tee/ffa_private.h | 5 +++++
> >> 2 files changed, 13 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index aadd6c21e7f2..0f6f837378cc 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -180,6 +180,14 @@ static bool ffa_negotiate_version(struct cpu_user=
_regs *regs)
> >>             goto out_handled;
> >>         }
> >>
> >> +        /*
> >> +         * We cannot set is_64bit during domain init because the fiel=
d is not
> >> +         * yet initialized.
> >> +         * This field is only used during partinfo_get with the rwloc=
k taken
> >> +         * so there is no ordering issue with guest_vers.
> >> +         */
> >> +        ctx->is_64bit =3D is_64bit_domain(d);
> >
> > This should only be assigned under the rwlock. But do we need the
> > is_64bit field at all? Why can't we always use is_64bit_domain()
> > instead?
>
> As we take it after when needed, setting it here should be ok but i can m=
ove this
> inside the rwlock section to be more coherent.
>
> The field is needed when creating the list of partitions. To use is_64bit=
_domain, I
> would to get access to the foreign domain description which i try to prev=
ent to not
> create a way for a guest to block other guests by doing partinfo_get. Thi=
s is why
> i store the information i need for foreign guests in the ctx instead of u=
sing RCU
> to get access to the domain descriptor.

Got it, thanks for the explanation.

Cheers,
Jens

>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >> +
> >>         /*
> >>          * A successful FFA_VERSION call does not freeze negotiation. =
Guests
> >>          * are allowed to issue multiple FFA_VERSION attempts (e.g. pr=
obing
> >> @@ -433,7 +441,6 @@ static int ffa_domain_init(struct domain *d)
> >>
> >>     ctx->ffa_id =3D ffa_get_vm_id(d);
> >>     ctx->num_vcpus =3D d->max_vcpus;
> >> -    ctx->is_64bit =3D is_64bit_domain(d);
> >>
> >>     /*
> >>      * ffa_domain_teardown() will be called if ffa_domain_init() retur=
ns an
> >> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_pri=
vate.h
> >> index 4e4ac7fd7bc4..2daa4589a930 100644
> >> --- a/xen/arch/arm/tee/ffa_private.h
> >> +++ b/xen/arch/arm/tee/ffa_private.h
> >> @@ -344,6 +344,11 @@ struct ffa_ctx {
> >>     /* FF-A Endpoint ID */
> >>     uint16_t ffa_id;
> >>     uint16_t num_vcpus;
> >> +    /*
> >> +     * Must only be accessed with the ffa_ctx_list_rwlock taken as it=
 set
> >> +     * when guest_vers is set and other accesses could see a partiall=
y set
> >> +     * value.
> >> +     */
> >>     bool is_64bit;
> >>
> >>     /*
> >> --
> >> 2.51.2
>
>

