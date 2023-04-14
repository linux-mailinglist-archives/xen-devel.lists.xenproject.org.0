Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0293D6E1EDF
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 10:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521065.809343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnFGc-0003G0-Pw; Fri, 14 Apr 2023 08:58:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521065.809343; Fri, 14 Apr 2023 08:58:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnFGc-0003Da-Mu; Fri, 14 Apr 2023 08:58:50 +0000
Received: by outflank-mailman (input) for mailman id 521065;
 Fri, 14 Apr 2023 08:58:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM4c=AF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pnFGb-0003DU-NM
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 08:58:49 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91bb34ff-daa2-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 10:58:48 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id i3so7436687wrc.4
 for <xen-devel@lists.xenproject.org>; Fri, 14 Apr 2023 01:58:48 -0700 (PDT)
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
X-Inumbo-ID: 91bb34ff-daa2-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681462728; x=1684054728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bYJqD/lritzgdgYVeCcBDk4S3KIqAcSAF9n6O03bTM=;
        b=F1QhtALQROLvvngu6FysJm43XIyPpeA8KPqJw74kx67WBcWqoy2fBwKLYCHrAAjUUN
         dRNJ/5oHnNNnu3TZNpZKidLGEzRi0OZmQ/rHhSa+RCaXu3STu3q6iXCXsI2rhT5fGQ56
         oRv1bD5DqQ1WpXS7Rzuz9xMan6wZDobvBQ2klB92MXXJw7pptmDq7SeRJX4qfINxBX+K
         /boPNqkmd6yVFbPHk86AAF/hENHBGEEqsX3A9k1V417u7vH4srBHohiGf55BAHRSAl5S
         O38T2eOgmr5OfdtChbDsANzNT+K6QcV3JfP9LIhuGl8BlaDl1x4AZhQnjEvRqzOiXrb5
         kJ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681462728; x=1684054728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2bYJqD/lritzgdgYVeCcBDk4S3KIqAcSAF9n6O03bTM=;
        b=jZbwAWYMm6SgMF/Y9f6jrJJECUFWbjHq/gmiCQ9RBXfniTwpWOKD0LupbIVps/oC0W
         ZClOqt6K3R1DGq9UVIdLFwnD3Pyexq5LKli3iO/Sgc9sguGHBNhJjU2THBSc4UQGXcMf
         nNEKn0gBGmia2BmIkkb6h5RajBuX4u2OOkJk0WZUMkmAZMs2gNhJeFGOim6sNdqhyV8z
         oqTlBJrTS9fK74WgDygC6EMw1+R1zq2Lsdyoz/jbcaPGKuQW4eDs3yXRqY0PNdbpPY7l
         ejA1DBWxxART5i2VeHFPLJyKTWhsFwn3vz3dqbF6QlHvmPUaKq8ttui6OCemA7tm6nEr
         doRQ==
X-Gm-Message-State: AAQBX9cEYRdqXBbkVo7r0Imii4JJQlJQx4fiQA6uCrTNbF0c+3gPI+Uc
	vknRq00Kj3WlyFiX5y0S3APiBeMtbi6PPrdeMF+PTQ==
X-Google-Smtp-Source: AKy350atbqUjXHkQy5yQKv9rcJiaNVpf2SH4v1dIDy4x+Y7UPgU3NueaIUJzrzgaOcfU5KwWDuMlFsOxw1rUoBLG1TY=
X-Received: by 2002:a05:6000:1e02:b0:2f4:2e72:5bf7 with SMTP id
 bj2-20020a0560001e0200b002f42e725bf7mr2813000wrb.0.1681462727910; Fri, 14 Apr
 2023 01:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-3-jens.wiklander@linaro.org> <ad1d5ebd-38e5-bab9-24ac-6facc8ccb95c@xen.org>
 <d7f18393-262b-f2b1-9af3-a371dae75994@citrix.com>
In-Reply-To: <d7f18393-262b-f2b1-9af3-a371dae75994@citrix.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Apr 2023 10:58:37 +0200
Message-ID: <CAHUa44FYGeA-knf2HMR6t4B_q3JZ_WuEq9fpTmD2_sJLMwPoQw@mail.gmail.com>
Subject: Re: [XEN PATCH v8 02/22] xen/arm: tee: add a primitive FF-A mediator
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, 
	Bertrand.Marquis@arm.com, Marc Bonnici <marc.bonnici@arm.com>, 
	Achin Gupta <achin.gupta@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 13, 2023 at 3:27=E2=80=AFPM Andrew Cooper <andrew.cooper3@citri=
x.com> wrote:
>
> On 13/04/2023 1:26 pm, Julien Grall wrote:
> >> +static int ffa_domain_init(struct domain *d)
> >> +{
> >> +    struct ffa_ctx *ctx;
> >> +
> >> +    if ( !ffa_version )
> >> +        return -ENODEV;
> >> +
> >> +    ctx =3D xzalloc(struct ffa_ctx);
> >> +    if ( !ctx )
> >> +        return -ENOMEM;
> >> +
> >> +    d->arch.tee =3D ctx;
> >> +
> >> +    return 0;
> >> +}
> >> +
> >> +/* This function is supposed to undo what ffa_domain_init() has done =
*/
> >
> > I think there is a problem in the TEE framework. The callback
> > .relinquish_resources() will not be called if domain_create() failed.
> > So this will result to a memory leak.
> >
> > We also can't call .relinquish_resources() on early domain creation
> > failure because relinquishing resources can take time and therefore
> > needs to be preemptible.
> >
> > So I think we need to introduce a new callback domain_free() that will
> > be called arch_domain_destroy(). Is this something you can look at?
>
>
> Cleanup of an early domain creation failure, however you do it, is at
> most "the same amount of time again".  It cannot (absent of development
> errors) take the same indefinite time periods of time that a full
> domain_destroy() can.
>
> The error path in domain_create() explicitly does call domain_teardown()
> so we can (eventually) purge these duplicate cleanup paths.  There are
> far too many easy errors to be made which occur from having split
> cleanup, and we have had to issue XSAs in the past to address some of
> them.  (Hence the effort to try and specifically change things, and
> remove the ability to introduce the errors in the first place.)
>
>
> Right now, it is specifically awkward to do this nicely because
> domain_teardown() doesn't call into a suitable arch hook.
>
> IMO the best option here is extend domain_teardown() with an
> arch_domain_teardown() state/hook, and wire in the TEE cleanup path into
> this too.
>
> Anything else is explicitly adding to technical debt that I (or someone
> else) is going to have to revert further down the line.
>
> If you want, I am happy to prototype the arch_domain_teardown() bit of
> the fix, but I will have to defer wiring in the TEE part to someone
> capable of testing it.

You're more than welcome to prototype the fix, I can test it and add
it to the next version of the patch set when we're happy with the
result.

Thanks,
Jens

>
> ~Andrew

