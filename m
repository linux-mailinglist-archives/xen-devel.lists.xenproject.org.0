Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3521B84AE81
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 07:51:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676661.1052875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXFHI-0000HY-Gd; Tue, 06 Feb 2024 06:49:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676661.1052875; Tue, 06 Feb 2024 06:49:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXFHI-0000FO-Dc; Tue, 06 Feb 2024 06:49:56 +0000
Received: by outflank-mailman (input) for mailman id 676661;
 Tue, 06 Feb 2024 06:49:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rluy=JP=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1rXFHH-0000FI-DC
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 06:49:55 +0000
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [2001:4860:4864:20::2e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ede8bc22-c4bb-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 07:49:53 +0100 (CET)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-2143a96d185so2559181fac.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 22:49:53 -0800 (PST)
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
X-Inumbo-ID: ede8bc22-c4bb-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707202192; x=1707806992; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOvz1DCTpUYpJz6Ibk0AJZpg+ObusQM8DdGve4UWe+Q=;
        b=Ua3132LkHhBx3QYIzVFLOPq/+N/6OxAeU4w9MFzmfAYKlqda6zm4Ykslh9eeMNFPhO
         1JtMg4ma8MfhkMh0ANZgMnyK/NuJH+WlRP/erQDsdJ4sPjoyX12rtMam3cmMU49Y0hya
         pa3JGvIIrqy/UhRzp4NXelOgl9QKrXBE+vKmF1E59jX4fYlbGDWBwtZYDnV+XSCTESbV
         mm+necLjbB+lE1cZJIrbT2iwoBNLGx7wsxyTcFtBNjsJMOqHAuUN9G9c1Cyyz6c+PfW1
         tXkKvtVm8/IKW4BmjIimrbEGS9u7FYgrM7RakPKmBAzAkDAqtmCoftK2xyR3mN42rvaT
         qSTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707202192; x=1707806992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOvz1DCTpUYpJz6Ibk0AJZpg+ObusQM8DdGve4UWe+Q=;
        b=nRUUqjhIT2rdmc5haYrAgMbpfSBfVjil9xEjckqB1wSI71KcDbzfK9V8NNFihkgZ+Z
         mITe4JXv84vycC230w7dtZm0gFFoWYOqEWSNn/ynDHitpXHDhC/hY0WGJLjgUxSGgm5c
         gAUL63edtoMQMFaVgzw/sGZixUXQAN8oE7vasxYmfl369oSsRCh9t4zsDA1igMR5hJqV
         dtjLrPU5R10cZ1adQM5oKGN2BOLKTuWTDKZ7P6WOFh4xZLzPIauOb6e50k9RSgsIo1D7
         /07q6RLEyP4KaNoezNGBdtS4K7pxx3IGAF2o9ctbIsGgCbYltYE77tLpyOOwnJB4e8Zj
         zJlA==
X-Gm-Message-State: AOJu0YzWSM8/jcOXIKTucK92IJQ/zNY37ExPTUM+oymdS5f0dxcA45JT
	c8uPZY6ntRRU+3rYbb7lt6+K0JgUcoSybhlDffnNm6CyhtI/yGXYGlWT4C93iTcj31w7C/T61Lm
	vk1CBsNNV5XNmvn0iSh2ij0ob+JcII2j9TUD2Xw==
X-Google-Smtp-Source: AGHT+IFhA+k/0YdehkkgmfWfFUJBLTeL4MQ+0VSgoDstsz0fnx5E6uziXZoRs6LVndL1aYjjIBC4nu0TEecRiwvDrME=
X-Received: by 2002:a05:6870:9689:b0:219:6eeb:c724 with SMTP id
 o9-20020a056870968900b002196eebc724mr2175629oaq.20.1707202191896; Mon, 05 Feb
 2024 22:49:51 -0800 (PST)
MIME-Version: 1.0
References: <20240205154909.2392231-1-jens.wiklander@linaro.org> <3fc56b77-9b8c-402f-a338-5f415e5ab603@citrix.com>
In-Reply-To: <3fc56b77-9b8c-402f-a338-5f415e5ab603@citrix.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 6 Feb 2024 07:49:40 +0100
Message-ID: <CAHUa44GK6XKLcjB0NkQS3uqr9Fp+Z0CrOKWJDMivfJLju_FsEg@mail.gmail.com>
Subject: Re: [XEN PATCH v4] xen/arm: ffa: reclaim shared memory on guest destroy
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, patches@linaro.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 5:54=E2=80=AFPM Andrew Cooper <andrew.cooper3@citrix=
.com> wrote:
>
> On 05/02/2024 3:49 pm, Jens Wiklander wrote:
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 0793c1c7585d..bbb6b819ee2b 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -992,53 +1008,75 @@ static void put_shm_pages(struct ffa_shm_mem *sh=
m)
> >      }
> >  }
> >
> > -static bool inc_ctx_shm_count(struct ffa_ctx *ctx)
> > +static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> >  {
> >      bool ret =3D true;
> >
> >      spin_lock(&ctx->lock);
> > +
> > +    /*
> > +     * If this is the first shm added, increase the domain reference
> > +     * counter as we need to keep domain around a bit longer to reclai=
m the
> > +     * shared memory in the teardown path.
> > +     */
> > +    if ( !ctx->shm_count )
> > +        get_knownalive_domain(d);
> > +
> >      if (ctx->shm_count >=3D FFA_MAX_SHM_COUNT)
> >          ret =3D false;
> >      else
> >          ctx->shm_count++;
> > +
> >      spin_unlock(&ctx->lock);
>
> This is subtle.  It reads as if there is a reference leak.  There really
> will be one if FFA_MAX_SHM_COUNT happens to be 0.
>
> You could add a BUILD_BUG_ON(), but IMO it would be far clearer to
> follow if you moved the get_knownalive_domain() into the else clause.

I see your point, I'll fix it in the next version.

>
> >
> >      return ret;
> >  }
> >
> > -static void dec_ctx_shm_count(struct ffa_ctx *ctx)
> > +static void dec_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
> >  {
> >      spin_lock(&ctx->lock);
> > +
> >      ASSERT(ctx->shm_count > 0);
> >      ctx->shm_count--;
> > +
> > +    /*
> > +     * If this was the last shm removed, let go of the domain referenc=
e we
> > +     * took in inc_ctx_shm_count() above.
> > +     */
> > +    if ( !ctx->shm_count )
> > +        put_domain(d);
> > +
> >      spin_unlock(&ctx->lock);
>
> You want a local bool called drop_ref, set within the lock, and move the
> put_domain() down here.  put_domain() is potentially a large operation.

OK, I'll fix it in the next version.

Thanks,
Jens

