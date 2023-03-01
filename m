Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BD76A6B23
	for <lists+xen-devel@lfdr.de>; Wed,  1 Mar 2023 11:56:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503978.776432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXK87-0002Xc-FQ; Wed, 01 Mar 2023 10:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503978.776432; Wed, 01 Mar 2023 10:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXK87-0002Ue-C3; Wed, 01 Mar 2023 10:56:15 +0000
Received: by outflank-mailman (input) for mailman id 503978;
 Wed, 01 Mar 2023 10:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ofKM=6Z=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pXK86-0002UY-2O
 for xen-devel@lists.xenproject.org; Wed, 01 Mar 2023 10:56:14 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9880553-b81f-11ed-a550-8520e6686977;
 Wed, 01 Mar 2023 11:56:04 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id q16so12779959wrw.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Mar 2023 02:56:04 -0800 (PST)
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
X-Inumbo-ID: a9880553-b81f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLPQ5ivAfU4K/+cx7QVIhcG4xpjbEVmar2z1VrlZraU=;
        b=ImzqzTbb24V/SwSnRSXi8YwqqPXYJk24QRKJH6TS+4mcdOsmMthMIidRPX3k/Rt4Q/
         98iEyadEJaNXttZDO1Y4Mnci3ZtmJ5qzCYqZQ63L77CNWZ2aHf9XUcAwcr4bGXWoMpdw
         Ss8leMQA6RysWYVhPku0TGhneu/Z0LuAzKQ8W4JmjLWD57a/UlJrIJF+if5oJS507m58
         74qdEZW10ptg+QtyzzPerluvmB96Ahr70uIY3HZfNkTvvjNhN9l9ZIGs8b7ySDPA/2Gt
         AW0DcfUgRTYkQBWkd+JV/p0DHWynmpWunRSn/O/6JuWzcgj/i9of82oVptl/n0+Ccf+b
         kpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLPQ5ivAfU4K/+cx7QVIhcG4xpjbEVmar2z1VrlZraU=;
        b=gayGo4+hb/kko0OUB0TQayKPwYcibaNij5fBeKzJr5XDRZ7akTSReHfwepkt1v8NEw
         oEYm8hhia0eeT7U0kAfhJTK1btkCPURveSwBbtm977DWoO0E2/xroXs6AuNxP2B7TzWT
         O3Q1GujaYPAGubYiTgvNfs3O0miEm+bxNCR0WzkxnBOBQZuN4+woXAu2IhTmSpsq2gCJ
         /Dut77nx8eXMwfdWfZI0hfQz0U1YNjMxz7LupGVwmYsGlTsqk4Wqci8q9XCWFETXuC16
         v8+91BXOIgUW4BlE1XHZzdmhsOGBkgpbPszk4tcI80SIyV0/prGb7XSCB7erH3OqEBkG
         3VZQ==
X-Gm-Message-State: AO0yUKU29MMOZqXCIfNXjL0PnQX+ReZvFBhTB/NZz5IAoNV3iQg5JZvW
	hoJvGfwk/wSLeZ0Dfq+6p8s/Ts4Bk3qntYvei8uJ9w==
X-Google-Smtp-Source: AK7set+yI3aActmVhzYrXXjX2cwVcWqdod7nIob+IjBZThsP81vtOYYpmBPn0nzj/16l8I1L6py+HRvZjRs25g2qXTM=
X-Received: by 2002:a5d:5a9a:0:b0:2c5:4adc:6e52 with SMTP id
 bp26-20020a5d5a9a000000b002c54adc6e52mr4113614wrb.3.1677668164186; Wed, 01
 Mar 2023 02:56:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1677079671.git.jens.wiklander@linaro.org>
 <3332563e64568b2ffd236b1f428c27aa4cdf9790.1677079672.git.jens.wiklander@linaro.org>
 <F22A4773-94E8-4F24-A5C8-BF4E075A7698@arm.com>
In-Reply-To: <F22A4773-94E8-4F24-A5C8-BF4E075A7698@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Wed, 1 Mar 2023 11:55:53 +0100
Message-ID: <CAHUa44FrC_S1Ot8-2s3=q5f7omZ+gsZhYTJUTMA0yVG5BBp6mw@mail.gmail.com>
Subject: Re: [XEN PATCH v7 10/20] xen/arm: ffa: add direct request support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Marc Bonnici <Marc.Bonnici@arm.com>, 
	Achin Gupta <Achin.Gupta@arm.com>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="UTF-8"

Hi Bertrand,

On Mon, Feb 27, 2023 at 4:28 PM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 22 Feb 2023, at 16:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > Adds support for sending a FF-A direct request. Checks that the SP also
> > supports handling a 32-bit direct request. 64-bit direct requests are
> > not used by the mediator itself so there is not need to check for that.
> >
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> > xen/arch/arm/tee/ffa.c | 119 +++++++++++++++++++++++++++++++++++++++++
> > 1 file changed, 119 insertions(+)
> >
> > diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> > index 463fd7730573..a5d8a12635b6 100644
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -142,6 +142,7 @@
> >
> > struct ffa_ctx {
> >     uint32_t guest_vers;
> > +    bool interrupted;
>
> This is added and set here for one special error code but is never used.
> I would suggest to introduce this when there will be an action based on it.

I'm sorry, I forgot about completing this. I'll add code to deal with
FFA_INTERRUPT. This will be tricky to test though since we don't use
FFA_INTERRUPT like this with OP-TEE. The Hypervisor is required by the
FF-A standard to support it so I better add something.

>
> > };
> >
> > /* Negotiated FF-A version to use with the SPMC */
> > @@ -167,6 +168,55 @@ static bool ffa_get_version(uint32_t *vers)
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
> > +static int32_t ffa_simple_call(uint32_t fid, register_t a1, register_t a2,
> > +                               register_t a3, register_t a4)
> > +{
> > +    const struct arm_smccc_1_2_regs arg = {
> > +        .a0 = fid,
> > +        .a1 = a1,
> > +        .a2 = a2,
> > +        .a3 = a3,
> > +        .a4 = a4,
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
> > +    uint32_t ret = ffa_features(id);
> > +
> > +    if (ret)
> > +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing\n", id);
>
> It might be useful here to actually print the error code.
> Are we sure that all errors actually mean not supported ?

Yes, that's what the standard says.

>
> > +
> > +    return !ret;
> > +}
> > +
> > static uint16_t get_vm_id(const struct domain *d)
> > {
> >     /* +1 since 0 is reserved for the hypervisor in FF-A */
> > @@ -208,6 +258,66 @@ static void handle_version(struct cpu_user_regs *regs)
> >     set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> > }
> >
> > +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t fid)
> > +{
> > +    struct arm_smccc_1_2_regs arg = { .a0 = fid, };
> > +    struct arm_smccc_1_2_regs resp = { };
> > +    struct domain *d = current->domain;
> > +    struct ffa_ctx *ctx = d->arch.tee;
> > +    uint32_t src_dst;
> > +    uint64_t mask;
> > +
> > +    if ( smccc_is_conv_64(fid) )
> > +        mask = GENMASK_ULL(63, 0);
> > +    else
> > +        mask = GENMASK_ULL(31, 0);
> > +
> > +    src_dst = get_user_reg(regs, 1);
> > +    if ( (src_dst >> 16) != get_vm_id(d) )
> > +    {
> > +        resp.a0 = FFA_ERROR;
> > +        resp.a2 = FFA_RET_INVALID_PARAMETERS;
> > +        goto out;
> > +    }
> > +
> > +    arg.a1 = src_dst;
> > +    arg.a2 = get_user_reg(regs, 2) & mask;
> > +    arg.a3 = get_user_reg(regs, 3) & mask;
> > +    arg.a4 = get_user_reg(regs, 4) & mask;
> > +    arg.a5 = get_user_reg(regs, 5) & mask;
> > +    arg.a6 = get_user_reg(regs, 6) & mask;
> > +    arg.a7 = get_user_reg(regs, 7) & mask;
> > +
> > +    while ( true )
> > +    {
> > +        arm_smccc_1_2_smc(&arg, &resp);
> > +
> > +        switch ( resp.a0 )
> > +        {
> > +        case FFA_INTERRUPT:
> > +            ctx->interrupted = true;
> > +            goto out;
> > +        case FFA_ERROR:
> > +        case FFA_SUCCESS_32:
> > +        case FFA_SUCCESS_64:
> > +        case FFA_MSG_SEND_DIRECT_RESP_32:
> > +        case FFA_MSG_SEND_DIRECT_RESP_64:
> > +            goto out;
> > +        default:
> > +            /* Bad fid, report back. */
> > +            memset(&arg, 0, sizeof(arg));
> > +            arg.a0 = FFA_ERROR;
> > +            arg.a1 = src_dst;
> > +            arg.a2 = FFA_RET_NOT_SUPPORTED;
> > +            continue;
>
> There is a potential infinite loop here and i do not understand
> why this needs to be done.
> Here if something is returning a value that you do not understand
> you send back an ERROR to it. I do not find in the spec where this
> is supposed to be done.
> Can you explain a bit here ?

This should normally not happen, but the SP/SPMC is responding with a
request that we don't know what to do with. The standard doesn't say
how to handle that as far as I understand. However, returning back to
the VM at this point with an error may leave the SP/SPMC in a strange
state. So I think it's better to report back to the SP/SPMC that the
request isn't understood and hopefully it can at least return back
with an error in a sane state.

I'll add something to the comment.

>
> > +        }
> > +    }
> > +
> > +out:
> > +    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 & mask,
> > +             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a7 & mask);
> > +}
> > +
> > static bool ffa_handle_call(struct cpu_user_regs *regs)
> > {
> >     uint32_t fid = get_user_reg(regs, 0);
> > @@ -225,6 +335,12 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
> >     case FFA_ID_GET:
> >         set_regs_success(regs, get_vm_id(d), 0);
> >         return true;
> > +    case FFA_MSG_SEND_DIRECT_REQ_32:
> > +#ifdef CONFIG_ARM_64
> > +    case FFA_MSG_SEND_DIRECT_REQ_64:
> > +#endif
> > +        handle_msg_send_direct_req(regs, fid);
> > +        return true;
> >
> >     default:
> >         gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> > @@ -310,6 +426,9 @@ static bool ffa_probe(void)
> >     printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> >            major_vers, minor_vers);
> >
> > +    if ( !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> > +        return false;
>
> One could not need this feature and here this will make everything unavailable instead.
> Why not just reporting back the unsupported error to clients using unsupported interfaces ?

One could perhaps argue that this check should be moved to a later
patch in this series. Perhaps there's some future configuration that
might make sense without this feature, but for now, it doesn't make
sense to initialize without it.

Thanks,
Jens

>
> Cheers
> Bertrand
>
> > +
> >     ffa_version = vers;
> >
> >     return true;
> > --
> > 2.34.1
> >
>

