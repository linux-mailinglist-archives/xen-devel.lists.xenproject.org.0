Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8B0758FC6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 09:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565626.883942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM25P-0005Xm-TE; Wed, 19 Jul 2023 07:59:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565626.883942; Wed, 19 Jul 2023 07:59:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM25P-0005UZ-PV; Wed, 19 Jul 2023 07:59:03 +0000
Received: by outflank-mailman (input) for mailman id 565626;
 Wed, 19 Jul 2023 07:59:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K8L3=DF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1qM25N-0005UT-DX
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 07:59:01 +0000
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [2607:f8b0:4864:20::f33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e345f23-260a-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 09:59:00 +0200 (CEST)
Received: by mail-qv1-xf33.google.com with SMTP id
 6a1803df08f44-634a3682c25so44474006d6.3
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jul 2023 00:59:00 -0700 (PDT)
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
X-Inumbo-ID: 1e345f23-260a-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689753539; x=1690358339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxClSREVUOwSDRQCQTviMuwSJTtZa3GSEpjzvaG5qsE=;
        b=aVlhdFFjLbVqt7fVMape7n5e0qfPwtwuh6FWk4xPOU/yBFa3AsoSXX2cpRpSr+H8E/
         yLEenfK8YoCvizIB/OJ5bbiBqK/nPL+Eaagoo3Nu8ThCCzym0NSCC2PtGrXDNmH/Sydy
         h3jRLpRBYko3noyT+2q8+9wedH7ENCgEqbJUP79dYl2bu141D7WfmkhJwLIQsPS2uFnC
         v3uSfHc2eS5pAel8P1LBL9xR1CX1Zlukz/hN7UtSZrvMwl+AfKQe/pRHFQBZnjAs2DyW
         tq1kvELR9GrqJ3Yd2b7GV1n7EfXzKvmsHrvLotdapb/0TtblA58PQ0DzqgPRa2gNwXBs
         mQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689753539; x=1690358339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JxClSREVUOwSDRQCQTviMuwSJTtZa3GSEpjzvaG5qsE=;
        b=eZO6Y22ATHmT+1hixvTIStHHHjVHMln3AyaTijqkbo0nA9b6PWi/jIeXUPt4i4804e
         mqglIY/jMjzJ01WA1cwr8LW7RiS1jzcq/dJ9aGQ1bkNJHoDWRwXjTsar4tN9krsLpBH7
         N7OsHtf7Tvw68608FgvBV/fcwUCsxkMMUWPrAuoJZxt4gnxeQH5PllIB444hSKWpiBjh
         5JYd+2t1GMCHIfLuldfh/G3vV2AG5EhaAAwSzGsFKFEII/oUNzp8o0dNVEWUjqolzPEW
         hPCt/nbzDJMkAUGBsHQl2M9rtg2a8Asook78E7gCtuMSt+4ezNYsNxuaBG9NZm0BMTuS
         D86A==
X-Gm-Message-State: ABy/qLa6Ir1w/M7FHvGboFLdpPCgYHTZJBJ9eiZ/MVPQPZuHNc7YhG64
	vGJiAddox5+yuRgNfJ/680HUygzyZt5c+cGL2Xyo0A==
X-Google-Smtp-Source: APBJJlHUcOAcpILeJ5Y6/fuEzAP55ymFUhWdKNalIEqCm58rZC0/9pj99aZfQCY08gKLXbgX0P1dedZTT99EtsTmdHc=
X-Received: by 2002:a0c:b20f:0:b0:635:dd30:8181 with SMTP id
 x15-20020a0cb20f000000b00635dd308181mr2012848qvd.56.1689753538842; Wed, 19
 Jul 2023 00:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230717072107.753304-1-jens.wiklander@linaro.org>
 <20230717072107.753304-11-jens.wiklander@linaro.org> <BA9E08C6-6379-4B21-A254-E68C8E71917A@arm.com>
In-Reply-To: <BA9E08C6-6379-4B21-A254-E68C8E71917A@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 19 Jul 2023 09:58:47 +0200
Message-ID: <CAHUa44EpLHAL9MB-K3=eu6O78bDz3ppRaVfUs_X63VXqR618Ng@mail.gmail.com>
Subject: Re: [XEN PATCH v10 10/24] xen/arm: ffa: add direct request support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Anthony PERARD <anthony.perard@citrix.com>, 
	Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Henry Wang <Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Tue, Jul 18, 2023 at 11:41=E2=80=AFAM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 17 Jul 2023, at 09:20, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Adds support for sending a FF-A direct request. Checks that the SP also
> > supports handling a 32-bit direct request. 64-bit direct requests are
> > not used by the mediator itself so there is not need to check for that.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > Reviewed-by: Henry Wang <Henry.Wang@arm.com>
> > ---
> > xen/arch/arm/tee/ffa.c | 113 +++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 113 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index e157ed20ad8b..e05d58cf7755 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -181,6 +181,56 @@ static bool ffa_get_version(uint32_t *vers)
> >     return true;
> > }
> >
> > +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
> > +{
> > +    switch ( resp->a0 )
> > +    {
> > +    case FFA_ERROR:
> > +        if ( resp->a2 )
> > +            return resp->a2;
> > +        else
> > +            return FFA_RET_NOT_SUPPORTED;
> > +    case FFA_SUCCESS_32:
> > +    case FFA_SUCCESS_64:
> > +        return FFA_RET_OK;
> > +    default:
> > +        return FFA_RET_NOT_SUPPORTED;
> > +    }
> > +}
> > +
> > +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t=
 a2,
> > +                               register_t a3, register_t a4)
> > +{
> > +    const struct arm_smccc_1_2_regs arg =3D {
> > +        .a0 =3D fid,
> > +        .a1 =3D a1,
> > +        .a2 =3D a2,
> > +        .a3 =3D a3,
> > +        .a4 =3D a4,
> > +    };
> > +    struct arm_smccc_1_2_regs resp;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +    return get_ffa_ret_code(&resp);
> > +}
> > +
> > +static int32_t ffa_features(uint32_t id)
> > +{
> > +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
> > +}
> > +
> > +static bool check_mandatory_feature(uint32_t id)
> > +{
> > +    int32_t ret =3D ffa_features(id);
> > +
> > +    if ( ret )
> > +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: erro=
r %d\n",
> > +               id, ret);
> > +
> > +    return !ret;
> > +}
> > +
> > static uint16_t get_vm_id(const struct domain *d)
> > {
> >     /* +1 since 0 is reserved for the hypervisor in FF-A */
> > @@ -222,6 +272,57 @@ static void handle_version(struct cpu_user_regs *r=
egs)
> >     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> > }
> >
> > +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uin=
t32_t fid)
> > +{
> > +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> > +    struct arm_smccc_1_2_regs resp =3D { };
> > +    struct domain *d =3D current->domain;
> > +    uint32_t src_dst;
> > +    uint64_t mask;
> > +
> > +    if ( smccc_is_conv_64(fid) )
> > +        mask =3D GENMASK_ULL(63, 0);
> > +    else
> > +        mask =3D GENMASK_ULL(31, 0);
> > +
> > +    src_dst =3D get_user_reg(regs, 1);
> > +    if ( (src_dst >> 16) !=3D get_vm_id(d) )
> > +    {
> > +        resp.a0 =3D FFA_ERROR;
> > +        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
> > +        goto out;
> > +    }
> > +
> > +    arg.a1 =3D src_dst;
> > +    arg.a2 =3D get_user_reg(regs, 2) & mask;
> > +    arg.a3 =3D get_user_reg(regs, 3) & mask;
> > +    arg.a4 =3D get_user_reg(regs, 4) & mask;
> > +    arg.a5 =3D get_user_reg(regs, 5) & mask;
> > +    arg.a6 =3D get_user_reg(regs, 6) & mask;
> > +    arg.a7 =3D get_user_reg(regs, 7) & mask;
> > +
> > +    arm_smccc_1_2_smc(&arg, &resp);
> > +    switch ( resp.a0 )
> > +    {
> > +    case FFA_ERROR:
> > +    case FFA_SUCCESS_32:
> > +    case FFA_SUCCESS_64:
> > +    case FFA_MSG_SEND_DIRECT_RESP_32:
> > +    case FFA_MSG_SEND_DIRECT_RESP_64:
> > +        break;
> > +    default:
> > +        /* Bad fid, report back. */
> > +        memset(&arg, 0, sizeof(arg));
> > +        arg.a0 =3D FFA_ERROR;
> > +        arg.a1 =3D src_dst;
> > +        arg.a2 =3D FFA_RET_ABORTED;
>
> Those instructions setting arg have no consequence as arg is not used
> after. This is probably a left over from the previous loop.
>
> You can either send this back using arm_smcc but I would rather return
> a proper error back to the caller by setting properly resp regs.
>
> What do you think ?

Yeah, it looks like a mistake was introduced in the v8 patch set when
the loop was removed. The intent was to return this error back to the
caller. I'll fix it by replacing "arg" with "resp".

Thanks,
Jens

>
> Regards
> Bertrand
>
>
> > +    }
> > +
> > +out:
> > +    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & =
mask,
> > +             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 &=
 mask);
> > +}
> > +
> > static bool ffa_handle_call(struct cpu_user_regs *regs)
> > {
> >     uint32_t fid =3D get_user_reg(regs, 0);
> > @@ -239,6 +340,10 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
> >     case FFA_ID_GET:
> >         set_regs_success(regs, get_vm_id(d), 0);
> >         return true;
> > +    case FFA_MSG_SEND_DIRECT_REQ_32:
> > +    case FFA_MSG_SEND_DIRECT_REQ_64:
> > +        handle_msg_send_direct_req(regs, fid);
> > +        return true;
> >
> >     default:
> >         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> > @@ -331,6 +436,14 @@ static bool ffa_probe(void)
> >     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> >            major_vers, minor_vers);
> >
> > +    /*
> > +     * At the moment domains must support the same features used by Xe=
n.
> > +     * TODO: Rework the code to allow domain to use a subset of the
> > +     * features supported.
> > +     */
> > +    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> > +        return false;
> > +
> >     ffa_version =3D vers;
> >
> >     return true;
> > --
> > 2.34.1
> >
>

