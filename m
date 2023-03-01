Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EE36A70B3
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 17:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504145.776707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXP9V-00016I-KM; Wed, 01 Mar 2023 16:18:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504145.776707; Wed, 01 Mar 2023 16:18:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXP9V-000144-HH; Wed, 01 Mar 2023 16:18:01 +0000
Received: by outflank-mailman (input) for mailman id 504145;
 Wed, 01 Mar 2023 16:18:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofKM=6Z=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pXP9T-00013w-V1
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 16:18:00 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a1c9710c-b84c-11ed-96a6-2f268f93b82a;
 Wed, 01 Mar 2023 17:17:59 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso7615660wmq.1
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 08:17:58 -0800 (PST)
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
X-Inumbo-ID: a1c9710c-b84c-11ed-96a6-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lTBB/RNxDH/thSNqh1+tF6GTV7+xAO5ZpXvZn/HmJes=;
        b=JvfyHicKMnciQKS3n/LenPgsSQg7fg7IT+zJpyzS+XXE3kRhGfVbOOW/8MLF6V68eD
         a3K62VU8yCrcFCWM6ELIoILxv3WgP+Dhpj8l3BDH8pWgONSy4iu3HtPd63vq8UIoJbym
         K5ykIFNfov48P+d6C8wydMt8AqAnH5uYQN8ouVIchaW63YejXtZUIG5/V+m7G387WEvX
         M2dtQCZrpucoYrnLcFTSx1yXapnyzpn+SdN7Zb2dtW6YQrmYP36AcqgAx1KE6MRDxQeD
         pXvHwWS80R37IBsMvyY7O+DrCJBtumD0vOTg8WXOcdyEeKnJ7v7rbR34CotsenaCfqLa
         tG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lTBB/RNxDH/thSNqh1+tF6GTV7+xAO5ZpXvZn/HmJes=;
        b=u/9gqVbECCxcz8hmhHFHXv5VoygHyd6XglKYrnFDMfb9p8X58iB1/HF1r6pox2xiTw
         q3bR5tM7xzAWQTuDAJGOa6KF8oFRy1138puBbFe4iZU24hMGcRiIKqnDvvTKl08z2qR4
         EnnCPPQjoOPctUQo0ToCTN98qTL8s6QLsNnQS91TntP4xi1dirztIc/DO37lNXRntVTP
         P0nZ0nNCyJT3lbEUTxyHd6FvJDPE7SPZXlDxXbiIcuESQqeovJP5LMegV/FwyH0RDx3J
         rMh0+kjVBQVRrK/CUg0hq6WFupAv4JqlkzhWfrOSCB4y+u+Q9b7iU6zM10BButU7bhLw
         TJ1A==
X-Gm-Message-State: AO0yUKXDxHZ6Q7m0+Xdup+VmAWMTpFr6d7zvDj/tp7agYfCvwTxXqL2S
	QHk2ILMlQ79RbLLsS385n2qH4WJmoN4Jnuge+m9RmA==
X-Google-Smtp-Source: AK7set8Yp603sWG2LB3kD+pZaweSsKCF2TR9e5Nc0BOpe8tkTWFjMKTfIPeCTswBMu2uKwcrDmTg9P1O1dnpNX7RdrI=
X-Received: by 2002:a05:600c:444c:b0:3df:d8c9:caa7 with SMTP id
 v12-20020a05600c444c00b003dfd8c9caa7mr1994343wmn.4.1677687478081; Wed, 01 Mar
 2023 08:17:58 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <3332563e64568b2ffd236b1f428c27aa4cdf9790.1677079672.git.jens.wiklander@linaro.org>
 <F22A4773-94E8-4F24-A5C8-BF4E075A7698@arm.com> <CAHUa44FrC_S1Ot8-2s3=q5f7omZ+gsZhYTJUTMA0yVG5BBp6mw@mail.gmail.com>
 <05270146-5270-4ADE-A89A-7231D623833B@arm.com>
In-Reply-To: <05270146-5270-4ADE-A89A-7231D623833B@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 1 Mar 2023 17:17:47 +0100
Message-ID: <CAHUa44GYLex7GTpgXgfjvsbYKMkYEfyNgVW2P=CUf83HZxtD1w@mail.gmail.com>
Subject: Re: [XEN PATCH v7 10/20] xen/arm: ffa: add direct request support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, Mar 1, 2023 at 2:06 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> HI Jens,
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
>
> You can do that in a different patch then and just remove this from this patch ?

OK, I'll do that.

>
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
>
> The error code might still be useful in the print.

OK, I'll add it.

>
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
> Please also make sure that the code is not looping infinitely on this.

I'll remove the loop as agreed in the other mail.

>
> >
> >>
> >>> +        }
> >>> +    }
> >>> +
> >>> +out:
> >>> +    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & mask,
> >>> +             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & mask);
> >>> +}
> >>> +
> >>> static bool ffa_handle_call(struct cpu_user_regs *regs)
> >>> {
> >>>    uint32_t fid = get_user_reg(regs, 0);
> >>> @@ -225,6 +335,12 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
> >>>    case FFA_ID_GET:
> >>>        set_regs_success(regs, get_vm_id(d), 0);
> >>>        return true;
> >>> +    case FFA_MSG_SEND_DIRECT_REQ_32:
> >>> +#ifdef CONFIG_ARM_64
> >>> +    case FFA_MSG_SEND_DIRECT_REQ_64:
> >>> +#endif
> >>> +        handle_msg_send_direct_req(regs, fid);
> >>> +        return true;
> >>>
> >>>    default:
> >>>        gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> >>> @@ -310,6 +426,9 @@ static bool ffa_probe(void)
> >>>    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> >>>           major_vers, minor_vers);
> >>>
> >>> +    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> >>> +        return false;
> >>
> >> One could not need this feature and here this will make everything unavailable instead.
> >> Why not just reporting back the unsupported error to clients using unsupported interfaces ?
> >
> > One could perhaps argue that this check should be moved to a later
> > patch in this series. Perhaps there's some future configuration that
> > might make sense without this feature, but for now, it doesn't make
> > sense to initialize without it.
>
> I am starting to wonder if we should not at boot scan for available features, save them
> somewhere and then accept/reject calls depending on the supported features.
>
> Maybe just add a TODO here so that we remember that this is something that could be
> checked/modified one day. That would also give an insight if someone has such a usecase
> one day.

I'll add a comment.

Cheers,
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
> >> Cheers
> >> Bertrand
> >>
> >>> +
> >>>    ffa_version = vers;
> >>>
> >>>    return true;
> >>> --
> >>> 2.34.1
>
>

