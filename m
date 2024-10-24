Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DE99AE6EC
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 15:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825315.1239518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3y87-0004Ym-4U; Thu, 24 Oct 2024 13:43:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825315.1239518; Thu, 24 Oct 2024 13:43:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3y87-0004Wf-1q; Thu, 24 Oct 2024 13:43:59 +0000
Received: by outflank-mailman (input) for mailman id 825315;
 Thu, 24 Oct 2024 13:43:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fqEU=RU=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1t3y84-0004WX-W6
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 13:43:57 +0000
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [2001:4860:4864:20::35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 01aaab59-920e-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 15:43:53 +0200 (CEST)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-2890f273296so444202fac.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 06:43:53 -0700 (PDT)
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
X-Inumbo-ID: 01aaab59-920e-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729777432; x=1730382232; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9fy8r7KYr8yxhD2HttBnWpxy8mdNYxFzDinnO6yq6c=;
        b=LQGmgBl9gmwYjrtSYCHEMTRi6mE/HbDpTH7VaXfp5u7W51jh1ceeOJ3IIgAVW+ZxEW
         D1pbtZIcTzjfwS9Y7qPWyVqraxK3XvUI845qtrzqvVpzdDrrjEaxCrDIContqVnwfwwC
         X/aN2Sv+EChQoUOxfVCo54+HuYypOlH7xoN5+dxuCQj/vQOshOdntyf0o+GPA94yF9V/
         3FBv3IidhvnmjlgcXQZ9WNQJa/Or67Fw/w/96TLlxKPyPMK4dGdxXkm69xQJZAKKNMMl
         y6f4X50XBVwEs2JnE2ouMbwJzplJQ0u03BzpIA7qwSaVWk5U0mydDoZ2nzrqi0lrsWiH
         tMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729777432; x=1730382232;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E9fy8r7KYr8yxhD2HttBnWpxy8mdNYxFzDinnO6yq6c=;
        b=PSMUNdDubriIDtd634/KkQmgY/h4W9d7NmFu0BUaj40S4gSPPzFtGGGz/Qz0Q06kKk
         bGtfAyDGzpdje5+Ai0Y0VrUDnOkTM2L2jr4XaLuWtH29z/bY0tTmIii9iMObHxvCPhdL
         UOepVyIlvCYXnPOC4DBzsDKa/bsrLynMsaz7IaBsc5H/mhg5+P5Fu12ffrrgnFYtCAmV
         IsMYUcxczupqeRCprGB9OcRDDTvUahDKkG3um2YKLf1PzxUhUL2+EBVnWvOItGeAMNaN
         TBlRa1dm07mNMGCCmcMzo/9Rq7tCWAC7xS4F3cDhuMTKWV3gdpGgTO0pMhYBUyvf5zGw
         zrFw==
X-Gm-Message-State: AOJu0YzAmBWcBFol/Xe7Oy/l0R9/QD32CXdUe1He5IpFjXK/0zBu1GS1
	vF0r7HOspRWXi4DWvZokJAcE5Ev7QcB5fPwi0tvSgbv9XzsgMTWU5iXBWT6tagu11posUv33uFL
	IP3KDBz/cv/Z0vN+M/1SQA948EWjl2tTHXNWwJA==
X-Google-Smtp-Source: AGHT+IG7qlGjdLzXUKnCLzuVQWtRJL5EIcswOHGfQeb/QSL96xyWeXOlEP5Xhl/GsPYyUoENUjHbqgExyhCLoM6FrRA=
X-Received: by 2002:a05:6870:5686:b0:260:ee13:e665 with SMTP id
 586e51a60fabf-28ced44b3fdmr1894595fac.37.1729777432069; Thu, 24 Oct 2024
 06:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <9464941b06e82763ebe79e3f2adb4ca2497cf298.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44H+EipP-F_12tWidOxfFPf-jVcSs4XjLjBv5t05-Kw59g@mail.gmail.com> <5497A12A-B077-44B4-AB66-1D22D62681D0@arm.com>
In-Reply-To: <5497A12A-B077-44B4-AB66-1D22D62681D0@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Thu, 24 Oct 2024 15:43:40 +0200
Message-ID: <CAHUa44Fca04p-L7K_OkZm2CVMFgWZxAmryOrU=GwwCHL+N4-3g@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] xen/arm: ffa: Add indirect message support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Thu, Oct 24, 2024 at 12:05=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi Jens,
>
> > On 24 Oct 2024, at 10:50, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
> >
> > Hi Bertrand,
> >
> > On Wed, Oct 16, 2024 at 10:32=E2=80=AFAM Bertrand Marquis
> > <bertrand.marquis@arm.com> wrote:
> >>
> >> Add support for FFA_MSG_SEND2 to send indirect messages from a VM to a
> >> secure partition.
> >>
> >> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> >> ---
> >> Changes in v2:
> >> - rebase
> >> ---
> >> xen/arch/arm/tee/ffa.c         |  5 ++++
> >> xen/arch/arm/tee/ffa_msg.c     | 49 ++++++++++++++++++++++++++++++++++
> >> xen/arch/arm/tee/ffa_private.h |  1 +
> >> 3 files changed, 55 insertions(+)
> >>
> >> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >> index 3a9525aa4598..21d41b452dc9 100644
> >> --- a/xen/arch/arm/tee/ffa.c
> >> +++ b/xen/arch/arm/tee/ffa.c
> >> @@ -101,6 +101,7 @@ static const struct ffa_fw_abi ffa_fw_abi_needed[]=
 =3D {
> >>     FW_ABI(FFA_MEM_RECLAIM),
> >>     FW_ABI(FFA_MSG_SEND_DIRECT_REQ_32),
> >>     FW_ABI(FFA_MSG_SEND_DIRECT_REQ_64),
> >> +    FW_ABI(FFA_MSG_SEND2),
> >> };
> >>
> >> /*
> >> @@ -195,6 +196,7 @@ static void handle_features(struct cpu_user_regs *=
regs)
> >>     case FFA_PARTITION_INFO_GET:
> >>     case FFA_MSG_SEND_DIRECT_REQ_32:
> >>     case FFA_MSG_SEND_DIRECT_REQ_64:
> >> +    case FFA_MSG_SEND2:
> >>         ffa_set_regs_success(regs, 0, 0);
> >>         break;
> >>     case FFA_MEM_SHARE_64:
> >> @@ -275,6 +277,9 @@ static bool ffa_handle_call(struct cpu_user_regs *=
regs)
> >>     case FFA_MSG_SEND_DIRECT_REQ_64:
> >>         ffa_handle_msg_send_direct_req(regs, fid);
> >>         return true;
> >> +    case FFA_MSG_SEND2:
> >> +        e =3D ffa_handle_msg_send2(regs);
> >> +        break;
> >>     case FFA_MEM_SHARE_32:
> >>     case FFA_MEM_SHARE_64:
> >>         ffa_handle_mem_share(regs);
> >> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> >> index ae263e54890e..335f246ba657 100644
> >> --- a/xen/arch/arm/tee/ffa_msg.c
> >> +++ b/xen/arch/arm/tee/ffa_msg.c
> >> @@ -12,6 +12,15 @@
> >>
> >> #include "ffa_private.h"
> >>
> >> +/* Encoding of partition message in RX/TX buffer */
> >> +struct ffa_part_msg_rxtx {
> >> +    uint32_t flags;
> >> +    uint32_t reserved;
> >> +    uint32_t msg_offset;
> >> +    uint32_t send_recv_id;
> >> +    uint32_t msg_size;
> >> +};
> >> +
> >> void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32=
_t fid)
> >> {
> >>     struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> >> @@ -78,3 +87,43 @@ out:
> >>                  resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
> >>                  resp.a7 & mask);
> >> }
> >> +
> >> +int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs)
> >> +{
> >> +    struct domain *src_d =3D current->domain;
> >> +    struct ffa_ctx *src_ctx =3D src_d->arch.tee;
> >> +    const struct ffa_part_msg_rxtx *src_msg;
> >> +    uint16_t dst_id, src_id;
> >> +    int32_t ret;
> >> +
> >> +    if ( !ffa_fw_supports_fid(FFA_MSG_SEND2) )
> >> +        return FFA_RET_NOT_SUPPORTED;
> >> +
> >> +    if ( !spin_trylock(&src_ctx->tx_lock) )
> >> +        return FFA_RET_BUSY;
> >> +
> >> +    src_msg =3D src_ctx->tx;
> >> +    src_id =3D src_msg->send_recv_id >> 16;
> >> +    dst_id =3D src_msg->send_recv_id & GENMASK(15,0);
> >> +
> >> +    if ( src_id !=3D ffa_get_vm_id(src_d) || !FFA_ID_IS_SECURE(dst_id=
) )
> >> +    {
> >> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        goto out_unlock_tx;
> >> +    }
> >> +
> >> +    /* check source message fits in buffer */
> >> +    if ( src_ctx->page_count * FFA_PAGE_SIZE <
> >> +         src_msg->msg_offset + src_msg->msg_size ||
> >> +         src_msg->msg_offset < sizeof(struct ffa_part_msg_rxtx) )
> >> +    {
> >> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> >> +        goto out_unlock_tx;
> >> +    }
> >
> > The guest can change src_mst at any moment with another CPU so these
> > tests are only sanity checks. The SPMC will also have to lock and do
> > the same tests again. So the tests here will only in the best case (in
> > case the guest is misbehaving) save us from entering the SPMC only to
> > get an error back. The lock makes sense since we could have concurrent
> > calls to FFA_MEM_SHARE. How about removing the tests?
>
> I think we should still prevent to forward invalid requests to the SPMC a=
s
> much as we can to prevent a malicious guest from stilling CPU cycles by
> doing invalid calls to the secure world.
>
> I could put a comment in there saying that this is just protection but to=
 be
> fare the SPMC in secure will have the same issues: this can be changed
> at any time by the caller on another core.

Fair enough.

>
> >
> >> +
> >> +    ret =3D ffa_simple_call(FFA_MSG_SEND2, ((uint32_t)src_id) << 16, =
0, 0, 0);
> >
> > I'd rather use ffa_get_vm_id(src_d) instead of src_id.
>
> src_id is a local variable and was checked to be equal to  ffa_get_vm_id(=
src_d)
> upper so those 2 values are the same.
> Why would you rather recall ffa_get_vm_id here ?

I don't think that check is enough to prevent the compiler from
loading that value from memory again, potentially opening a
time-of-check to time-of-use window. Using ACCESS_ONCE() when reading
send_recv_id above should also take care of that, but it seems more
direct to use ffa_get_vm_id().

Cheers,
Jens

>
> Cheers
> Bertrand
>
> >
> > Cheers,
> > Jens
> >
> >> +
> >> +out_unlock_tx:
> >> +    spin_unlock(&src_ctx->tx_lock);
> >> +    return ret;
> >> +}
> >> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_pri=
vate.h
> >> index 973ee55be09b..d441c0ca5598 100644
> >> --- a/xen/arch/arm/tee/ffa_private.h
> >> +++ b/xen/arch/arm/tee/ffa_private.h
> >> @@ -359,6 +359,7 @@ void ffa_handle_notification_get(struct cpu_user_r=
egs *regs);
> >> int ffa_handle_notification_set(struct cpu_user_regs *regs);
> >>
> >> void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32=
_t fid);
> >> +int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
> >>
> >> static inline uint16_t ffa_get_vm_id(const struct domain *d)
> >> {
> >> --
> >> 2.47.0
>
>

