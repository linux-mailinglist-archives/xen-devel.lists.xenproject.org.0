Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D72695AF700
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:39:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400138.641783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHr-00084H-5a; Tue, 06 Sep 2022 21:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400138.641783; Tue, 06 Sep 2022 21:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgHq-00081N-T3; Tue, 06 Sep 2022 21:39:14 +0000
Received: by outflank-mailman (input) for mailman id 400138;
 Tue, 06 Sep 2022 21:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y6pK=ZJ=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1oVgHG-0000Cs-5N
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:38:38 +0000
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a9f8d7d-2df7-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 17:19:26 +0200 (CEST)
Received: by mail-pf1-x435.google.com with SMTP id o126so2695771pfb.6
 for <xen-devel@lists.xenproject.org>; Tue, 06 Sep 2022 08:19:25 -0700 (PDT)
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
X-Inumbo-ID: 4a9f8d7d-2df7-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XWFZ4vpQXZV3nrlkQj2xV+OEMAM0JTmWSZ9iqG0RFzM=;
        b=tuEY+cBXOGTWnnKi0v2V50lRBvidObSqy8a28X+SQ5zwCK8JJEFavk/Z/NcWwMRAUt
         tZKhO07uOtxBe8QQo9q8R6pfgtZFSikbotcz9pr1LufvWVUcAy9HmDypTZA0TblKCXe1
         knDMC8P4/KKlhMBiz4khWgZKQaQfPoE+SSSsGaj8uQzbSKFM7TOPWofZbuPM0BTyxsPu
         Udrk+mXataxHYELqkPvnLzj06d3cRR8NsfbF3T2SuOIabvPA6oz+j/q8lLU1drBFkeo3
         ttUw3+x8DePE9kPXgP/9XVXA2pbcTNhT/ub6DrLVweRIuXsI8l60v+kyEwFki93bDyLU
         xgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XWFZ4vpQXZV3nrlkQj2xV+OEMAM0JTmWSZ9iqG0RFzM=;
        b=qWTDMhfOS7QF+FRvD6eAGhBp7ghbeL4wDkvJnzxANnZYJbKb8Sxf93p8UMF0AyRv9l
         w+FTdI2eczMgcIMQYJ/eJN7LeMJIuZN8hmUuZoQjtu+6qw4szJ2SXrC93JxYpe/CjIrd
         pKodkbqlaZzr0wctkZKcDZO3tETJeKkT6zIwRPn5HYbjaLGzMUO1RjC2LPZ9XIuCpfa0
         RvnBON23aMp2qcMV0MZ6nDIW8Rd19OFMaS3AGvh80zJurh4WUAlaJqAKsHcIx8kp3qjT
         q5BOQ3L0NGQYKo8KmT/CJWbRVj3ixpuKsNoffvCv6uGYxlBo0VYeWnR0iZLa1mk0tFPP
         fqlQ==
X-Gm-Message-State: ACgBeo2UV8zFuCJKyF40Gev9BCrFb8ACP9o5gG678ysGrtvdMtjhNP5w
	/7PcfG9dctQ1cvmQ8H+fPJqa82Z57A+mTeWrZwra4A==
X-Google-Smtp-Source: AA6agR5giouvQtvY8QQNPBjopg3XanTewoWbTfcX4JBOo1MdYfK6cJRXpBDlqkeJeMFaQso6UIk48fKNDA4zrFNmR+A=
X-Received: by 2002:a63:1a23:0:b0:434:4395:8b5a with SMTP id
 a35-20020a631a23000000b0043443958b5amr9763601pga.428.1662477564378; Tue, 06
 Sep 2022 08:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220818105601.1896082-1-jens.wiklander@linaro.org>
 <20220818105601.1896082-4-jens.wiklander@linaro.org> <057e2a04-545f-0de8-1d42-8b19ae19f009@xen.org>
In-Reply-To: <057e2a04-545f-0de8-1d42-8b19ae19f009@xen.org>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 6 Sep 2022 17:19:13 +0200
Message-ID: <CAHUa44HjjwYJfFdUUkcE9J+DVKisEevWwubE+hRHnw9514HFQw@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] xen/arm: add a primitive FF-A mediator
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand.Marquis@arm.com, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Julien,

On Tue, Sep 6, 2022 at 12:25 AM Julien Grall <julien@xen.org> wrote:
>
> Hi Jens,
>
> More remarks.
>
> On 18/08/2022 11:55, Jens Wiklander wrote:
> > +/* Negotiated FF-A version to use with the SPMC */
> > +static uint32_t ffa_version __read_mostly;
>
> NIT: if this is not meant to be modified after boot, then I would
> suggest to use __ro_after_init. This was introduced recently and will
> prevent the variable to be modified after boot.

Thanks, I'll update

> > +
> > +static bool ffa_get_version(uint32_t *vers)
>
> This is not __init. Is this going to be called at runtime by a domain?
> If yes...

Correct.

>
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +        .a0 = FFA_VERSION,
> > +        .a1 = FFA_MY_VERSION,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +    if ( resp.a0 == FFA_RET_NOT_SUPPORTED )
> > +    {
> > +        printk(XENLOG_ERR "ffa: FFA_VERSION returned not supported\n");
>
> ... this wants to be a XENLOG_G_ERR to rate limited it. XENLOG_ERR is
> not by default and will allow a domain to spam Xen console.
>
> A rule of thumb is any code reachable for a domain (other than dom0)
> should use XENLOG_G_* when printing or gprintk(XENLOG_*, ) if you want
> to print the domain ID and ratelimit. Note that the latter doesn't
> require the G_* becauce it will add it automatically.

Thanks for the explanation, I'll update accordingly.

>
> > +        return false;
> > +    }
> > +
> > +    *vers = resp.a0;
> > +
> > +    return true;
> > +}
> > +
> > +static u16 get_vm_id(const struct domain *d)
> > +{
> > +    /* +1 since 0 is reserved for the hypervisor in FF-A */
> > +    return d->domain_id + 1;
> > +}
> > +
> > +static void set_regs(struct cpu_user_regs *regs, register_t v0, register_t v1,
> > +                     register_t v2, register_t v3, register_t v4, register_t v5,
> > +                     register_t v6, register_t v7)
> > +{
> > +        set_user_reg(regs, 0, v0);
> > +        set_user_reg(regs, 1, v1);
> > +        set_user_reg(regs, 2, v2);
> > +        set_user_reg(regs, 3, v3);
> > +        set_user_reg(regs, 4, v4);
> > +        set_user_reg(regs, 5, v5);
> > +        set_user_reg(regs, 6, v6);
> > +        set_user_reg(regs, 7, v7);
> > +}
> > +
> > +static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> > +                             uint32_t w3)
> > +{
> > +    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> > +}
> > +
> > +static void handle_version(struct cpu_user_regs *regs)
> > +{
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +    uint32_t vers = get_user_reg(regs, 1);
> > +
> > +    if ( vers < FFA_VERSION_1_1 )
> > +        vers = FFA_VERSION_1_0;
> > +    else
> > +        vers = FFA_VERSION_1_1;
> > +
> > +    ctx->guest_vers = vers;
> > +    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> > +}
> > +
> > +bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
> > +{
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.ffa;
> > +
> > +    if ( !ctx )
> > +        return false;
> > +
> > +    switch ( fid )
> > +    {
> > +    case FFA_VERSION:
> > +        handle_version(regs);
> > +        return true;
> > +    case FFA_ID_GET:
> > +        set_regs_success(regs, get_vm_id(d), 0);
> > +        return true;
> > +
> > +    default:
> > +        printk(XENLOG_ERR "ffa: unhandled fid 0x%x\n", fid);
>
> This one definitely want to be a XENLOG_G_ERR. But I would use
> gprintk(XENLOG_ERR, ).

I'll update.

Again, thanks for the review.

Cheers,
Jens

>
> Cheers,
>
> --
> Julien Grall

