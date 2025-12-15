Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91443CBD714
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 12:08:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1186783.1508215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6Qj-0000rW-6O; Mon, 15 Dec 2025 11:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1186783.1508215; Mon, 15 Dec 2025 11:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV6Qj-0000q1-3C; Mon, 15 Dec 2025 11:07:53 +0000
Received: by outflank-mailman (input) for mailman id 1186783;
 Mon, 15 Dec 2025 11:07:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WtO4=6V=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vV6Qg-0000ps-P6
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 11:07:50 +0000
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [2607:f8b0:4864:20::c2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 481877be-d9a6-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 12:07:45 +0100 (CET)
Received: by mail-oo1-xc2a.google.com with SMTP id
 006d021491bc7-65727896f35so1628440eaf.2
 for <xen-devel@lists.xenproject.org>; Mon, 15 Dec 2025 03:07:45 -0800 (PST)
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
X-Inumbo-ID: 481877be-d9a6-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765796864; x=1766401664; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3ie6mkJXake+dGXC7wEuSw0D+J7MaJwU+4ZglpUrr8=;
        b=WWAljKS0pc/cjwtljgpuN7x4gaZ6JUsxgFB3KBdcvwDwn2992/H1+4R0YtpCBdHVx4
         XvMP5g0Zgp3vsPUnVUwS/FQ2AXI1s3dLr5rS2HBAuReKzJ1Z4z2RX6aAzRJh6jgIGzJp
         mZlwaoAFdDiZ2SJ4y14IvS509rdPZmKvWKOMITdHtwQGDukG1k3dGYpUdkWXjO9PTshV
         dLmgzr+YDT/1uvTFG6+MLWdHO3gYkbJYLTbMtV6U7owtMmDuloR/uTRxXZXhcQlRzw+O
         Jgg86+MCobB9AOXhfdWfN76ikxia/vCIlWzrSe3whUvDlQdyG2dU2LFxcWV6I9Bf4N6u
         VHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765796864; x=1766401664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3ie6mkJXake+dGXC7wEuSw0D+J7MaJwU+4ZglpUrr8=;
        b=r9DLPabYRlF4V/XYg+YoHf5f0OQg3wQf0hXYCZFrCqMfitQcCTDKhCaSNkLbqxEBZ4
         382QESLMWavXQgKp60yNd9P/K2K0Gp1DquSSO8t3DdsiPAlg4XWbYItm1wypyyq3HYKF
         VotCLcLb5NjsQJNNauVPBdzOnhCiThJoNU5if/KZHSPFChQzDb5QCJdO1gFhep0kSoeO
         S/FRsVh53ulV40e8vM4D9GCV2u1Ouli7vYH+cawaSTmwJVTJyt41XJAgwWaYzq0HrZGa
         ZEGbdrWWR9u9tGjPxlp4NU5PJt1ZmoKIavE0rkMxo0A8AcSV2RHb1TbOQUVmV+fna3mw
         uMMQ==
X-Gm-Message-State: AOJu0Yzi2aOJaQJJUL7JImbSx5QKyyI4AVGxs9UIHTteKuZwXHYGoeMv
	qqJIez3+XAQvl/hZv4jsMjPKuomc5hXciGLdCQ4iy8XtuRtAJfFTBkLKId52/O2bkf8F/fcRVSH
	2GSj6mm1R+etRo7d8j9GG0AkWgRYJaasplrPHgras5w==
X-Gm-Gg: AY/fxX5TX4+0rNuH1TdEUNOD4uvZx0qinW6y9IsXZr/EPg77FDeE4wmEuVhr2YivTmX
	xylbmPhPInqphXvBeI3nmNMOJWhy1pyyQVOSnHQJ347Y01u1fEqSROS6bmrT6p5kUxrPrhgg3bU
	21IZEhTPBXI4VpvCx6zGiTVxXPY2phsZBvZpcSWVpm3uin6OLRy3xxj/hH1z85tPStvEbNs/nlu
	AVg0ftmyPFUEU3Q67DXQ5gaGN4I5H4AHx/fX/qxQafjrsiQjyMDyaXWXTqDjvmhlHVuKgWcJxt7
	Q8AzJqn/O8QlqBKCTtRzxXi9jg==
X-Google-Smtp-Source: AGHT+IFNPn3XKyJlrKL84DFskB97NvCL6Dm5zMdbv78TDP5kUPwSkLIR8UiPvDpMSr4febpnksovq4dtsOHRLv8Zi90=
X-Received: by 2002:a05:6820:220e:b0:659:9a49:8fc8 with SMTP id
 006d021491bc7-65b45288874mr5298203eaf.65.1765796863968; Mon, 15 Dec 2025
 03:07:43 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764930353.git.bertrand.marquis@arm.com>
 <697ab9880767b75c9964ae900a43fd4e065fc502.1764930353.git.bertrand.marquis@arm.com>
 <CAHUa44E+Cgs6WeuSyYi=r1BCzaYN+f9MBoSudyLxkU2LeGxzXg@mail.gmail.com>
 <C518918D-1CAF-49D6-BC94-CACEF409E46A@arm.com> <CAHUa44Ff=rzsd-3MtjB4YoT4=e_Xbgy0Yss=TSe=2=X77XQcXA@mail.gmail.com>
In-Reply-To: <CAHUa44Ff=rzsd-3MtjB4YoT4=e_Xbgy0Yss=TSe=2=X77XQcXA@mail.gmail.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Mon, 15 Dec 2025 12:07:31 +0100
X-Gm-Features: AQt7F2rEkF0jluTUWzBmWuUgl6H6lmJVxHi2HsnPgcgFDDcTubgokG_QTJ8lB_c
Message-ID: <CAHUa44G4jGt=DbSV3+Z0v_g-vX2gLQX1UEReHObp28yprGptdA@mail.gmail.com>
Subject: Re: [PATCH v1 03/12] xen/arm: ffa: Fix is_64bit init
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Tue, Dec 9, 2025 at 11:41=E2=80=AFAM Jens Wiklander
<jens.wiklander@linaro.org> wrote:
>
> Hi Bertrand,
>
> On Tue, Dec 9, 2025 at 11:11=E2=80=AFAM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
> >
> > Hi Jens,
> >
> > > On 9 Dec 2025, at 10:05, Jens Wiklander <jens.wiklander@linaro.org> w=
rote:
> > >
> > > Hi Bertrand,
> > >
> > > On Fri, Dec 5, 2025 at 11:37=E2=80=AFAM Bertrand Marquis
> > > <bertrand.marquis@arm.com> wrote:
> > >>
> > >> is_64bit_domain(d) is not set during domain_init as the domain field=
 is
> > >> only set when loading the domain image which is done after executing
> > >> domain_init.
> > >>
> > >> Fix the implementation to set is_64bit when version gets negotiated.
> > >> is_64bit is only used during partition_info_get once a domain is add=
ed
> > >> in the list of domains having ffa support. It must only be accessed =
when
> > >> the rwlock is taken (which is the case).
> > >>
> > >> is_64bit must not be used without the rwlock taken and other places =
in
> > >> the code needing to test 64bit support of the current domain will ha=
ve
> > >> to use calls to is_64bit_domain instead of the field from now on.
> > >>
> > >> Fixes: 09a201605f99 ("xen/arm: ffa: Introduce VM to VM support")
> > >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> > >> ---
> > >> Changes in v1:
> > >> - patch introduced
> > >> ---
> > >> xen/arch/arm/tee/ffa.c         | 9 ++++++++-
> > >> xen/arch/arm/tee/ffa_private.h | 5 +++++
> > >> 2 files changed, 13 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > >> index aadd6c21e7f2..0f6f837378cc 100644
> > >> --- a/xen/arch/arm/tee/ffa.c
> > >> +++ b/xen/arch/arm/tee/ffa.c
> > >> @@ -180,6 +180,14 @@ static bool ffa_negotiate_version(struct cpu_us=
er_regs *regs)
> > >>             goto out_handled;
> > >>         }
> > >>
> > >> +        /*
> > >> +         * We cannot set is_64bit during domain init because the fi=
eld is not
> > >> +         * yet initialized.
> > >> +         * This field is only used during partinfo_get with the rwl=
ock taken
> > >> +         * so there is no ordering issue with guest_vers.
> > >> +         */
> > >> +        ctx->is_64bit =3D is_64bit_domain(d);
> > >
> > > This should only be assigned under the rwlock. But do we need the
> > > is_64bit field at all? Why can't we always use is_64bit_domain()
> > > instead?
> >
> > As we take it after when needed, setting it here should be ok but i can=
 move this
> > inside the rwlock section to be more coherent.

It's not needed since this field is initialized before it can be found
in the list. I'm OK with either way.

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

> >
> > The field is needed when creating the list of partitions. To use is_64b=
it_domain, I
> > would to get access to the foreign domain description which i try to pr=
event to not
> > create a way for a guest to block other guests by doing partinfo_get. T=
his is why
> > i store the information i need for foreign guests in the ctx instead of=
 using RCU
> > to get access to the domain descriptor.
>
> Got it, thanks for the explanation.
>
> Cheers,
> Jens
>
> >
> > Cheers
> > Bertrand
> >
> > >
> > > Cheers,
> > > Jens
> > >
> > >> +
> > >>         /*
> > >>          * A successful FFA_VERSION call does not freeze negotiation=
. Guests
> > >>          * are allowed to issue multiple FFA_VERSION attempts (e.g. =
probing
> > >> @@ -433,7 +441,6 @@ static int ffa_domain_init(struct domain *d)
> > >>
> > >>     ctx->ffa_id =3D ffa_get_vm_id(d);
> > >>     ctx->num_vcpus =3D d->max_vcpus;
> > >> -    ctx->is_64bit =3D is_64bit_domain(d);
> > >>
> > >>     /*
> > >>      * ffa_domain_teardown() will be called if ffa_domain_init() ret=
urns an
> > >> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_p=
rivate.h
> > >> index 4e4ac7fd7bc4..2daa4589a930 100644
> > >> --- a/xen/arch/arm/tee/ffa_private.h
> > >> +++ b/xen/arch/arm/tee/ffa_private.h
> > >> @@ -344,6 +344,11 @@ struct ffa_ctx {
> > >>     /* FF-A Endpoint ID */
> > >>     uint16_t ffa_id;
> > >>     uint16_t num_vcpus;
> > >> +    /*
> > >> +     * Must only be accessed with the ffa_ctx_list_rwlock taken as =
it set
> > >> +     * when guest_vers is set and other accesses could see a partia=
lly set
> > >> +     * value.
> > >> +     */
> > >>     bool is_64bit;
> > >>
> > >>     /*
> > >> --
> > >> 2.51.2
> >
> >

