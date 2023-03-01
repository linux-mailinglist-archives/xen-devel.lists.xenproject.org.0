Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB476A705C
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 16:56:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504130.776676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOp1-0004bV-C6; Wed, 01 Mar 2023 15:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504130.776676; Wed, 01 Mar 2023 15:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXOp1-0004ZE-9F; Wed, 01 Mar 2023 15:56:51 +0000
Received: by outflank-mailman (input) for mailman id 504130;
 Wed, 01 Mar 2023 15:56:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofKM=6Z=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pXOoz-0004W0-U1
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 15:56:50 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac09fd7f-b849-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 16:56:47 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id f11so1839621wrv.8
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 07:56:47 -0800 (PST)
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
X-Inumbo-ID: ac09fd7f-b849-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ynKocGdWKn4I37sj6PrHOFy+6CmSE4060NpKsK0Rdns=;
        b=x9eCHsMsNw6s3+gGHTnKpc9mT6U0Pmx7woLfzHh/4YkXmeggzQ6SWMgSATwv59ENIL
         glW0t57rzzIJ4QHdatL1k11l3Fq8qv7noCyK8mMnbjl3uQ8jIJE1vkdcXjWJ9ffHUbrc
         sxgS+dLiSF+kNIM6iadExbktsYV8QfYGLRuyoX4F0s2AZAo8K2E3DSmNwUn3jLwcMQ2s
         kVu9lkof1goNOxhy5YuRCE+6mzbAwnf5ObWqO8HMt2OBA4U5bt358ZCWfs8FzsGfqrOd
         uNQBCIE2kaktvPF8rz1fvk0Baza9G6CTFuCZDfCVwndShBC71LH0GzXbIXkzgRyQQyux
         Jocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ynKocGdWKn4I37sj6PrHOFy+6CmSE4060NpKsK0Rdns=;
        b=PILO+UO6g9IBuXT0Tblkoj//8i9VvdIpozI6pmMWKrIn0f+x8CMQmtULRuoFe2uPHP
         NtAVOFAU7McvMkhx2wIefBDViex4HJBc6vMPGxrDKgJZR2b8FTvMMfUOu2sqFQceiVMX
         BRbjmEnlga91Bnqa5eRcO3R2Uhxc4fXceH1wNxnNiI2wYmdFOsjwu7lnzVLWDStc//AB
         YWkQ/qMicwKn7r3005GxlMsc1OO2xKzjI+yPfhvKT/7oskNz13kXqve3c8T9RUGuuC5H
         dxxiKbApVL3b4UqT9Jd9l4C1g2biFIl8xfD+O/mFW3LzMUMtsPvOtkXN6ZhfzmRw56f3
         IQJg==
X-Gm-Message-State: AO0yUKX6BV+yMHbtRaNI5AfuLZa8aImZKQ9gItnZsn6ZOgNS+90LJIA3
	kcvpPHFM7Mv2nXLfP5dWFcZvjkXf8ZnzLVoe+8CR7w==
X-Google-Smtp-Source: AK7set/5qeLuASUOV/6jext81ot2xYBTSIEL3v2xAbF5j6zEDnpKRtJ+1k+CTgg4YY2jsIZ4qLOQGuXEu8oVOfA8xJM=
X-Received: by 2002:a05:6000:1088:b0:2c9:4ef5:e75f with SMTP id
 y8-20020a056000108800b002c94ef5e75fmr1452943wrw.3.1677686207217; Wed, 01 Mar
 2023 07:56:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <3332563e64568b2ffd236b1f428c27aa4cdf9790.1677079672.git.jens.wiklander@linaro.org>
 <F22A4773-94E8-4F24-A5C8-BF4E075A7698@arm.com> <CAHUa44FrC_S1Ot8-2s3=q5f7omZ+gsZhYTJUTMA0yVG5BBp6mw@mail.gmail.com>
 <3FA94B6D-79B4-453C-A9E4-631452458CBD@arm.com>
In-Reply-To: <3FA94B6D-79B4-453C-A9E4-631452458CBD@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 1 Mar 2023 16:56:35 +0100
Message-ID: <CAHUa44FT7agLn2r=ThkQATtrfhCioMSzxq9t9s-m1PT0=Qwg3w@mail.gmail.com>
Subject: Re: [XEN PATCH v7 10/20] xen/arm: ffa: add direct request support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 1, 2023 at 4:50 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 1 Mar 2023, at 11:55, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > Hi Bertrand,
> >
> > On Mon, Feb 27, 2023 at 4:28 PM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >>
> >> Hi Jens,
> >>
> >>> On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >>>
> >>> Adds support for sending a FF-A direct request. Checks that the SP also
> >>> supports handling a 32-bit direct request. 64-bit direct requests are
> >>> not used by the mediator itself so there is not need to check for that.
> >>>
> >>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>> ---
> >>> xen/arch/arm/tee/ffa.c | 119 +++++++++++++++++++++++++++++++++++++++++
> >>> 1 file changed, 119 insertions(+)
> >>>
> >>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >>> index 463fd7730573..a5d8a12635b6 100644
> >>> --- a/xen/arch/arm/tee/ffa.c
> >>> +++ b/xen/arch/arm/tee/ffa.c
> >>> @@ -142,6 +142,7 @@
> >>>
> >>> struct ffa_ctx {
> >>>    uint32_t guest_vers;
> >>> +    bool interrupted;
> >>
> >> This is added and set here for one special error code but is never used.
> >> I would suggest to introduce this when there will be an action based on it.
> >
> > I'm sorry, I forgot about completing this. I'll add code to deal with
> > FFA_INTERRUPT. This will be tricky to test though since we don't use
> > FFA_INTERRUPT like this with OP-TEE. The Hypervisor is required by the
> > FF-A standard to support it so I better add something.
> >
> >>
> >>> };
> >>>
> >>> /* Negotiated FF-A version to use with the SPMC */
> >>> @@ -167,6 +168,55 @@ static bool ffa_get_version(uint32_t *vers)
> >>>    return true;
> >>> }
> >>>
> >>> +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
> >>> +{
> >>> +    switch ( resp->a0 )
> >>> +    {
> >>> +    case FFA_ERROR:
> >>> +        if ( resp->a2 )
> >>> +            return resp->a2;
> >>> +        else
> >>> +            return FFA_RET_NOT_SUPPORTED;
> >>> +    case FFA_SUCCESS_32:
> >>> +    case FFA_SUCCESS_64:
> >>> +        return FFA_RET_OK;
> >>> +    default:
> >>> +        return FFA_RET_NOT_SUPPORTED;
> >>> +    }
> >>> +}
> >>> +
> >>> +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t a2,
> >>> +                               register_t a3, register_t a4)
> >>> +{
> >>> +    const struct arm_smccc_1_2_regs arg = {
> >>> +        .a0 = fid,
> >>> +        .a1 = a1,
> >>> +        .a2 = a2,
> >>> +        .a3 = a3,
> >>> +        .a4 = a4,
> >>> +    };
> >>> +    struct arm_smccc_1_2_regs resp;
> >>> +
> >>> +    arm_smccc_1_2_smc(&arg, &resp);
> >>> +
> >>> +    return get_ffa_ret_code(&resp);
> >>> +}
> >>> +
> >>> +static int32_t ffa_features(uint32_t id)
> >>> +{
> >>> +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
> >>> +}
> >>> +
> >>> +static bool check_mandatory_feature(uint32_t id)
> >>> +{
> >>> +    uint32_t ret = ffa_features(id);
> >>> +
> >>> +    if (ret)
> >>> +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing\n", id);
> >>
> >> It might be useful here to actually print the error code.
> >> Are we sure that all errors actually mean not supported ?
> >
> > Yes, that's what the standard says.
> >
> >>
> >>> +
> >>> +    return !ret;
> >>> +}
> >>> +
> >>> static uint16_t get_vm_id(const struct domain *d)
> >>> {
> >>>    /* +1 since 0 is reserved for the hypervisor in FF-A */
> >>> @@ -208,6 +258,66 @@ static void handle_version(struct cpu_user_regs *regs)
> >>>    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> >>> }
> >>>
> >>> +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
> >>> +{
> >>> +    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
> >>> +    struct arm_smccc_1_2_regs resp = { };
> >>> +    struct domain *d = current->domain;
> >>> +    struct ffa_ctx *ctx = d->arch.tee;
> >>> +    uint32_t src_dst;
> >>> +    uint64_t mask;
> >>> +
> >>> +    if ( smccc_is_conv_64(fid) )
> >>> +        mask = GENMASK_ULL(63, 0);
> >>> +    else
> >>> +        mask = GENMASK_ULL(31, 0);
> >>> +
> >>> +    src_dst = get_user_reg(regs, 1);
> >>> +    if ( (src_dst >> 16) != get_vm_id(d) )
> >>> +    {
> >>> +        resp.a0 = FFA_ERROR;
> >>> +        resp.a2 = FFA_RET_INVALID_PARAMETERS;
> >>> +        goto out;
> >>> +    }
> >>> +
> >>> +    arg.a1 = src_dst;
> >>> +    arg.a2 = get_user_reg(regs, 2) & mask;
> >>> +    arg.a3 = get_user_reg(regs, 3) & mask;
> >>> +    arg.a4 = get_user_reg(regs, 4) & mask;
> >>> +    arg.a5 = get_user_reg(regs, 5) & mask;
> >>> +    arg.a6 = get_user_reg(regs, 6) & mask;
> >>> +    arg.a7 = get_user_reg(regs, 7) & mask;
> >>> +
> >>> +    while ( true )
> >>> +    {
> >>> +        arm_smccc_1_2_smc(&arg, &resp);
> >>> +
> >>> +        switch ( resp.a0 )
> >>> +        {
> >>> +        case FFA_INTERRUPT:
> >>> +            ctx->interrupted = true;
> >>> +            goto out;
> >>> +        case FFA_ERROR:
> >>> +        case FFA_SUCCESS_32:
> >>> +        case FFA_SUCCESS_64:
> >>> +        case FFA_MSG_SEND_DIRECT_RESP_32:
> >>> +        case FFA_MSG_SEND_DIRECT_RESP_64:
> >>> +            goto out;
> >>> +        default:
> >>> +            /* Bad fid, report back. */
> >>> +            memset(&arg, 0, sizeof(arg));
> >>> +            arg.a0 = FFA_ERROR;
> >>> +            arg.a1 = src_dst;
> >>> +            arg.a2 = FFA_RET_NOT_SUPPORTED;
> >>> +            continue;
> >>
> >> There is a potential infinite loop here and i do not understand
> >> why this needs to be done.
> >> Here if something is returning a value that you do not understand
> >> you send back an ERROR to it. I do not find in the spec where this
> >> is supposed to be done.
> >> Can you explain a bit here ?
> >
> > This should normally not happen, but the SP/SPMC is responding with a
> > request that we don't know what to do with. The standard doesn't say
> > how to handle that as far as I understand. However, returning back to
> > the VM at this point with an error may leave the SP/SPMC in a strange
> > state. So I think it's better to report back to the SP/SPMC that the
> > request isn't understood and hopefully it can at least return back
> > with an error in a sane state.
> >
> > I'll add something to the comment.
>
> I discussed that with Achin and Marc today at Arm and if we get an invalid
> fid we do not need to report it back like you did.
> We should instead report this as an error to the requester.
>
> This is good as it will remove the :-)

Great, thanks.
/Jens

