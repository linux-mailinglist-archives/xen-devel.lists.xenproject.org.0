Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4F06E22F7
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 14:19:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521118.809442 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnIO7-0002TD-Ef; Fri, 14 Apr 2023 12:18:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521118.809442; Fri, 14 Apr 2023 12:18:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnIO7-0002Qe-Bp; Fri, 14 Apr 2023 12:18:47 +0000
Received: by outflank-mailman (input) for mailman id 521118;
 Fri, 14 Apr 2023 12:18:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM4c=AF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pnIO5-0002QU-Uv
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 12:18:45 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7fdad166-dabe-11ed-b21e-6b7b168915f2;
 Fri, 14 Apr 2023 14:18:44 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 n42-20020a05600c3baa00b003f0b12814aaso916025wms.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Apr 2023 05:18:44 -0700 (PDT)
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
X-Inumbo-ID: 7fdad166-dabe-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681474724; x=1684066724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWES7aaub1/1Y6TQPqE2JUKhfa5FJIAf7U3cNJVc0FI=;
        b=Cv3knVpGj3zGDEHS5ifStC8xmlavhUn+IYV/Rp9JMDHRRQi3i2r2Zda35WHr6RReaW
         MD17+zvXFodYhu8IT+2BiTjIS5PobJIjK/Zd0hVgY6agPnldVWLgKRMPsOvS2DcEv8q2
         zAIAsyL5Va2MJD+gRfoD7CnyQS9x9IYa5vFzIvnRwnSNPjxcZb/xUx8Xg8zR+yFyGxpE
         /o5TCvkMnN+RwRPaxjqdW/SjZLYzam8twOJIj8CJ8FqOZu1d7bmR+fk6mgxSKpEig168
         yFgCubO2mRr7UsoAYccVMSgfM8l0cULYe0RId7xJcPp2N4jjCzo/l8i8nAf8sSEb3LMw
         lemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681474724; x=1684066724;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWES7aaub1/1Y6TQPqE2JUKhfa5FJIAf7U3cNJVc0FI=;
        b=ZYE9iDuW/LgxI9ipwHaJaJJzvzdQTJtU9xkjTJVjO4AyJfuHKGMmSYAFoMI4v8scWm
         q0xIS8P6Bwv8ZiMl1ANjuzUaJiHStDtfU0D2FUPrzAN1j5B/Tc3NmD86gfmkrRETqMO+
         /b/ApHtiTyfcu6RQ/YLRB3oZmtfXOONEqgwsjf4A3QfajBS/lXWZpafUIW4zEN2VavTG
         EpY//uAky7mnlMo2er32QtT4uHMJIcvo1WRKiS2nkXp//fUDFfehm2wrYU9aUvYqUlZS
         kG5cb5ELgQexUz0FxTDzQhh2cQ7z0vH4nmViAuHZj2QZ2gauKSV72CEYg2sr9SoXR1l0
         +56Q==
X-Gm-Message-State: AAQBX9frPCSqOtebeUvEH1SY+kC9gYEbTVKbN7PHqG2Aa401scYY9h2B
	HthM4M8NtaVcS4NoLoK9ffMO4tZ3zdtAc7lZCUfJOw==
X-Google-Smtp-Source: AKy350YdNT3Cjuz8BXV3UbjRph1dX32VinWgDt6FOIiKF226mh8dcWomBkzryF8+t9QVb3VamOwmbBdm39WjBP8Mo8Y=
X-Received: by 2002:a1c:7708:0:b0:3df:97c0:1b4 with SMTP id
 t8-20020a1c7708000000b003df97c001b4mr1404928wmi.4.1681474723712; Fri, 14 Apr
 2023 05:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-12-jens.wiklander@linaro.org> <d354fee8-4d02-fe5f-1ff1-15f96efeb13f@xen.org>
 <CAHUa44FM5yQ+e=ruPhTxFttGTE1HQvruX-7XAiqVnW4b-mQgcw@mail.gmail.com> <9732C6EB-3346-408D-B267-9CCCE081B661@arm.com>
In-Reply-To: <9732C6EB-3346-408D-B267-9CCCE081B661@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Apr 2023 14:18:32 +0200
Message-ID: <CAHUa44HDv++FfxcrqH9sFUgK1UyB_HQN2xcRknMRVX5gvvnUcA@mail.gmail.com>
Subject: Re: [XEN PATCH v8 11/22] xen/arm: ffa: send guest events to Secure Partitions
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Apr 14, 2023 at 10:29=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 14 Apr 2023, at 10:19, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi,
> >
> > On Thu, Apr 13, 2023 at 3:24=E2=80=AFPM Julien Grall <julien@xen.org> w=
rote:
> >>
> >> Hi,
> >>
> >> On 13/04/2023 08:14, Jens Wiklander wrote:
> >>> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id=
,
> >>> +                                      uint8_t msg)
> >>> +{
> >>> +    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
> >>> +    int32_t res;
> >>> +
> >>> +    if ( msg =3D=3D FFA_MSG_SEND_VM_CREATED )
> >>> +        exp_resp |=3D FFA_MSG_RESP_VM_CREATED;
> >>> +    else if ( msg =3D=3D FFA_MSG_SEND_VM_DESTROYED )
> >>> +        exp_resp |=3D FFA_MSG_RESP_VM_DESTROYED;
> >>> +    else
> >>> +        return FFA_RET_INVALID_PARAMETERS;
> >>> +
> >>> +    do {
> >>> +        const struct arm_smccc_1_2_regs arg =3D {
> >>> +            .a0 =3D FFA_MSG_SEND_DIRECT_REQ_32,
> >>> +            .a1 =3D sp_id,
> >>> +            .a2 =3D FFA_MSG_FLAG_FRAMEWORK | msg,
> >>> +            .a5 =3D vm_id,
> >>> +        };
> >>> +        struct arm_smccc_1_2_regs resp;
> >>> +
> >>> +        arm_smccc_1_2_smc(&arg, &resp);
> >>> +        if ( resp.a0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 !=
=3D exp_resp )
> >>> +        {
> >>> +            /*
> >>> +             * This is an invalid response, likely due to some error=
 in the
> >>> +             * implementation of the ABI.
> >>> +             */
> >>> +            return FFA_RET_INVALID_PARAMETERS;
> >>> +        }
> >>> +        res =3D resp.a3;
> >>> +    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_R=
ETRY );
> >>
> >> This loop seems potentially unbounded to me. Can you add a comment
> >> explaining why this is fine?
> >
> > In the FF-A 1.1 specification
> > (https://developer.arm.com/documentation/den0077/e/?lang=3Den) Table
> > 18.26 at page 330 it says that FFA_RET_INTERRUPTED and FFA_RET_RETRY
> > should be handled in this way. When looking at this from the
> > hypervisor's point of view it is troublesome since there isn't any
> > guarantee that we're progressing.
> >
> > We should be able to rule out FFA_RET_INTERRUPTED since non-secure
> > interrupts should be masked at this point. I'm not sure if
> > FFA_RET_RETRY can be avoided entirely, but we should be able to put a
> > limit on how many times we're prepared to retry.
>
> The fact that interrupts are masked in Xen does not mean they will be in =
secure.
> In fact what we should do when INTERRUPTED is received is something we ha=
ve
> to clear up but we should unmask interrupt to process them in Xen before =
retrying I think.
>
> >
> > How about setting a limit of max 10 retries and treating
> > FFA_RET_INTERRUPTED as an error? Or is it better to not loop at all
> > and treat all but FFA_RET_OK as errors? What do others think?
>
> I would suggest to do a max retry for both cases and add a TODO in the co=
de.
> We will need to define a generic way to handle those cases but at this st=
age
> INTERRUPTED should be considered TODO.
> RETRY will probably stay with a limit here, in the case of a guest messag=
e both
> of those possibilities could just be returned to the guest.
>
>
> Do you agree ?

Sounds good to me, I'll do that.

Thanks,
Jens

>
> Cheers
> Bertrand
>
> >
> > Thanks,
> > Jens
> >
> >>
> >>> +
> >>> +    return res;
> >>> +}
> >>> +
> >>
> >> Cheers,
> >>
> >> --
> >> Julien Grall
>
>

