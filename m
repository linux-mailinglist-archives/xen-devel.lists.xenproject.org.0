Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA93B59056
	for <lists+xen-devel@lfdr.de>; Tue, 16 Sep 2025 10:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1124542.1466842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyQxa-0001d1-6d; Tue, 16 Sep 2025 08:22:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1124542.1466842; Tue, 16 Sep 2025 08:22:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uyQxa-0001aT-3Q; Tue, 16 Sep 2025 08:22:46 +0000
Received: by outflank-mailman (input) for mailman id 1124542;
 Tue, 16 Sep 2025 08:22:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gL7b=33=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uyQxX-0001Zv-TM
 for xen-devel@lists.xenproject.org; Tue, 16 Sep 2025 08:22:43 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d218b12-92d6-11f0-9809-7dc792cee155;
 Tue, 16 Sep 2025 10:22:36 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-56088927dcbso6530495e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 16 Sep 2025 01:22:36 -0700 (PDT)
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
X-Inumbo-ID: 4d218b12-92d6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758010956; x=1758615756; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imugdng3S5FK+Hm/ZoItPyp1ChMcqMTz5qfgj1SIRFw=;
        b=ZLWqxM5o1yBuI6KvSXnbp1gAT8rf4KZV6Wfhntw8Zd2nkhWJbC7mTAkEfD6aWxEMnJ
         pi8XCC6IjVJ3zndgZVdfKDF/+1ehKT5CkQ2fBPfh8WXEJjF4ZDkAGDXikbv4qFRFagce
         FVD1uS7Nu9eQbKh5jvYjIg8/kDEj8qsOnVhdAMwfnbAV+6R8ugLjTlUvU2VsPD4QDc1t
         0GUSyYoj+hkO+h3eSoftYsylSOx29yvceXIYJF4ksKvyc9QBJRq8iLX4Blx5tZM+GKZn
         bQZ6NWgNEBrRLTFhCW/LNDLaz1k2E7jMFj7hf3eq0uzl4bbm5OvRnbIJTqDx7o7HPx3D
         x9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758010956; x=1758615756;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=imugdng3S5FK+Hm/ZoItPyp1ChMcqMTz5qfgj1SIRFw=;
        b=VUvXCltn0RCVS1dyrpMq4YtNTqZ5pvf2lLQuYb3eTWz3GnEvRU5LLjiz71XRBBBRnd
         IaooE/ZxFX7WwI+WKO0gMvysHikntoWU26Zryqvi7p1ygUATPe6vAsx9sdZCm6WJ46ED
         r+CLfyA0GOIMTCwA80xvYG17K7izabe88H4+i2rvbLuv2t1aHf07gQB1V/PnGb4RJclX
         WbkVyFYHz8uxKTVCGolOpiGK1kLS/whp0vuXIPqYx/1v1XrfcTrVwNbbpRiZiz4cS4/1
         fJyKFiq/8AlR9Utes6IDhV6+5nk2eIfj35L43sOZpMwjW1fnkLTZLPuuQzzaZRiUhmwX
         a36Q==
X-Gm-Message-State: AOJu0YwxPFThdr1LnoERRpTbG9FZTH6Yct4PWMQjcJQ2W9mnfjPoIMXM
	zjCyHIJn9h6mJfo1Wzxz3Dmbwo58s7KrvL1BIShdzlLFcJDcULaDbbWkvTstghdvU+RrM+xW6Wi
	OdCTJXYKn4BvfwuPDIIaoI2RchRliSpk=
X-Gm-Gg: ASbGncsLNjgL8lYodtwioyNWdd3tvP9gdNgDQfMcpllXgLR1NjTCvnM39uwXzgaRJGK
	LEX7tdY8R1hG78VpB/4E8cTfQ8EjA2EvPazXleKfx58Dl5xqOOa46y74UgWYhaHQon/wDo+qx5t
	GHCRlkMPfk18XIlzpjFzHcaHNNgEZYeIfnlqqnktkmfD3BWO4++WUqvgCT6X4P1RfkGbStEA9py
	AJCfa4H2LEickc1
X-Google-Smtp-Source: AGHT+IFLTHm5o0mv4CGWgrUqeErZr9HrQbQ/VmFgZ0l3RsPrOLo7zFMVPFu7+ypT31Wj9MZz2Qe/ZkQz+FZSSbkyE0s=
X-Received: by 2002:ac2:4ca9:0:b0:55f:3f00:a832 with SMTP id
 2adb3069b0e04-5704aaa0544mr3746790e87.10.1758010955682; Tue, 16 Sep 2025
 01:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1756803419.git.mykola_kvach@epam.com> <53cc6a9cf7a73d12c632bf8b8eee2f7069e6b0f1.1756803419.git.mykola_kvach@epam.com>
 <86aec3a8-a4aa-40e4-9542-9d291c2c119e@xen.org>
In-Reply-To: <86aec3a8-a4aa-40e4-9542-9d291c2c119e@xen.org>
From: Mykola Kvach <xakep.amatop@gmail.com>
Date: Tue, 16 Sep 2025 11:22:24 +0300
X-Gm-Features: AS18NWAVe7RC4KzRpPhU8KOkhwSyTlHJT8npqcpWzNQkODJfUSEcgs0V2YDr5HM
Message-ID: <CAGeoDV8dA0MiP_tL9K=rqzY2opG494V=sSMhgsCmpyaXfmwYuA@mail.gmail.com>
Subject: Re: [PATCH v13 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Mykola Kvach <mykola_kvach@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, 
	Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien,

Thank you for reviewing this patch series and for your valuable feedback.

On Sat, Sep 13, 2025 at 1:38=E2=80=AFAM Julien Grall <julien@xen.org> wrote=
:
>
> Hi Mykola,
>
> On 02/09/2025 10:03, Mykola Kvach wrote:
> > @@ -880,6 +883,40 @@ void arch_domain_creation_finished(struct domain *=
d)
> >       p2m_domain_creation_finished(d);
> >   }
> >
> > +int arch_domain_resume(struct domain *d)
> > +{
> > +    int rc;
> > +    typeof(d->arch.resume_ctx) *ctx =3D &d->arch.resume_ctx;
>
> I know this is v13, but I don't think we should use typeof() is in this
> context. "struct resume_info" is much shorter and help the review (I
> don't have to grep resume_ctx to figure out the type).

Ack

>
> > +
> > +    if ( !d->is_shutting_down || d->shutdown_code !=3D SHUTDOWN_suspen=
d )
> > +    {
> > +        dprintk(XENLOG_WARNING,
> > +                "%pd: Invalid domain state for resume: is_shutting_dow=
n=3D%d, shutdown_code=3D%d\n",
> > +                d, d->is_shutting_down, d->shutdown_code);
> > +        return -EINVAL;
> > +    }
> > +
> > +    /*
> > +     * It is still possible to call domain_shutdown() with a suspend r=
eason
> > +     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote=
_shutdown.
> > +     * In these cases, the resume context will be empty.
> > +     * This is not expected to cause any issues, so we just warn about=
 the
> > +     * situation and return without error, allowing the existing logic=
 to
> > +     * proceed as expected.
>
> I think this odd to warn if something is expected. It would be best to
> use "XENLOG_INFO".

Ack.

>
> > +     */
> > +    if ( !ctx->wake_cpu )
> > +    {
> > +        dprintk(XENLOG_WARNING, "%pd: Invalid wake CPU pointer for res=
ume\n",
>
> As you wrote above, there is nothing wrong. So "Invalid" is not correct.
> I think a better wording is "Wake CPU pointer context was not provided").

Thanks for the suggestion. I'll change the message.

>
> Also note that dprintk() will be a NOP in release build. I am guessing
> this is intended?

Yep. In any case, the status is checked after the call to arch_domain_resum=
e
(see domain_resume), so we notify the user about the situation. Detailed
prints are only available in debug builds.

>
> I will answer you Jan's comment separately. The rest looks good to me.
>
> Cheers,
>
> --
> Julien Grall
>

Best regards,
Mykola

