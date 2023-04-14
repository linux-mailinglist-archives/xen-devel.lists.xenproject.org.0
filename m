Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E93B6E1EFB
	for <lists+xen-devel@lfdr.de>; Fri, 14 Apr 2023 11:05:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521076.809365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnFMr-0005N4-RZ; Fri, 14 Apr 2023 09:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521076.809365; Fri, 14 Apr 2023 09:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pnFMr-0005LI-On; Fri, 14 Apr 2023 09:05:17 +0000
Received: by outflank-mailman (input) for mailman id 521076;
 Fri, 14 Apr 2023 09:05:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZM4c=AF=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1pnFMp-0005LC-Mg
 for xen-devel@lists.xenproject.org; Fri, 14 Apr 2023 09:05:15 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 772846a3-daa3-11ed-8611-37d641c3527e;
 Fri, 14 Apr 2023 11:05:13 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id w24so7165558wra.10
 for <xen-devel@lists.xenproject.org>; Fri, 14 Apr 2023 02:05:13 -0700 (PDT)
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
X-Inumbo-ID: 772846a3-daa3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681463113; x=1684055113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1NtzKB2dYRlHM4v+m7fmPEZevPOYyQOjqzKBr2cZNc=;
        b=MWjWLVNsR9nF6e/Jinh5Pe6+jUSYad4kMBt0Er533MN9PQ48cIp67Qty5vYXGIYZBR
         9KU8dG6d8NXtYhefvQxkAl5vcORqDk6+Tx60D/Ws//6u+UHJG1lDo/tpHrueT/2MmA1v
         CSorithRHr8LKOxwB/jSloLIK6uwbxdKRSoNZYCj3xxtP8eDjGIbEZQKpabiMyKNu4zy
         TLWXgwQv3Ohy6f495dWvAF+uVInDO6NXGaUY6DmzGivOynK2YFsmXR/Ks5ZEDtTxTfyK
         0tQ88jLk0mQc4OdI8jvuN/OY+um+7gUOOtxEXQ/YXWVx/4fSLbFDwo4DBJioWJ1kzFrl
         l6PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681463113; x=1684055113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d1NtzKB2dYRlHM4v+m7fmPEZevPOYyQOjqzKBr2cZNc=;
        b=F2Gs6oYr8r5BL8VQcmbDQ3qph7XJ+XSdUJwPhvNbkDIg9Dx0Flbl57RnbpMxrgfuRS
         89/R2bQ0B3Ka8JRs9Oui8IR2qOlEKQIw/D4q7dbSX3Wj4OaRXthx5EiIZ2WSFbMpftBd
         JFqIXvPVLykwitjyirUWtFXAOsSYVWHAkV0lvt17Yn2A74hJTnZCXXcSW3jmX7Y5m9p2
         9rxoKa+7a2FoLr+VUPSDhDLNv57Ul7a05nBVFHiNlf2UsM+BklOId47shNIXvbwH1lkE
         3yuWo94ZifCKlOuRxOjVT/voDYuaneCB1pYV77vGn3t73fyA+T4iiA7i/rga6sZiyTJN
         SB/A==
X-Gm-Message-State: AAQBX9dIImUIVMr9k//2YyQ3pHtJQ9e9iwaidFOcuVA6i1xb2Pjk4fPB
	nFWCVhh3I9BLlNG3WErmB/0c1i9w+TQsv4McDHVnrd9Qh7/G1YPY
X-Google-Smtp-Source: AKy350YoO09EabljTMkZJPCnVZy+a6Up4B8ihxRxUzUZg5OQ94doL5DgUB4CMxbdHjlgyhbwDz45pLGCfvQGglWn1OA=
X-Received: by 2002:a5d:4441:0:b0:2c7:17b8:5759 with SMTP id
 x1-20020a5d4441000000b002c717b85759mr902302wrr.3.1681463112669; Fri, 14 Apr
 2023 02:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230413071424.3273490-1-jens.wiklander@linaro.org>
 <20230413071424.3273490-10-jens.wiklander@linaro.org> <2359695e-f8f8-cf51-27f9-5f0c776feca5@xen.org>
 <916BB708-3028-4AAB-BD6A-BCABAFBD7C45@arm.com> <2dba6372-330d-a068-241f-59e19b837150@xen.org>
 <0B0212E8-BAC7-4557-B21B-B49EB14F1D09@arm.com>
In-Reply-To: <0B0212E8-BAC7-4557-B21B-B49EB14F1D09@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 14 Apr 2023 11:05:01 +0200
Message-ID: <CAHUa44H4+83WqT8PTqWfUFv7bj1ZX5DHmTc=ZLTB47dBBzkD3Q@mail.gmail.com>
Subject: Re: [XEN PATCH v8 09/22] xen/arm: ffa: add direct request support
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>, 
	Marc Bonnici <Marc.Bonnici@arm.com>, Achin Gupta <Achin.Gupta@arm.com>, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 13, 2023 at 3:44=E2=80=AFPM Bertrand Marquis
<Bertrand.Marquis@arm.com> wrote:
>
> Hi,
>
> > On 13 Apr 2023, at 15:27, Julien Grall <julien@xen.org> wrote:
> >
> >
> >
> > On 13/04/2023 14:20, Bertrand Marquis wrote:
> >> Hi Julien,
> >>> On 13 Apr 2023, at 15:15, Julien Grall <julien@xen.org> wrote:
> >>>
> >>> Hi,
> >>>
> >>> On 13/04/2023 08:14, Jens Wiklander wrote:
> >>>> Adds support for sending a FF-A direct request. Checks that the SP a=
lso
> >>>> supports handling a 32-bit direct request. 64-bit direct requests ar=
e
> >>>> not used by the mediator itself so there is not need to check for th=
at.
> >>>> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> >>>> ---
> >>>>  xen/arch/arm/tee/ffa.c | 112 ++++++++++++++++++++++++++++++++++++++=
+++
> >>>>  1 file changed, 112 insertions(+)
> >>>> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> >>>> index f129879c5b81..f2cce955d981 100644
> >>>> --- a/xen/arch/arm/tee/ffa.c
> >>>> +++ b/xen/arch/arm/tee/ffa.c
> >>>> @@ -181,6 +181,56 @@ static bool ffa_get_version(uint32_t *vers)
> >>>>      return true;
> >>>>  }
> >>>>  +static int32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *r=
esp)
> >>>> +{
> >>>> +    switch ( resp->a0 )
> >>>> +    {
> >>>> +    case FFA_ERROR:
> >>>> +        if ( resp->a2 )
> >>>> +            return resp->a2;
> >>>> +        else
> >>>> +            return FFA_RET_NOT_SUPPORTED;
> >>>> +    case FFA_SUCCESS_32:
> >>>> +    case FFA_SUCCESS_64:
> >>>> +        return FFA_RET_OK;
> >>>> +    default:
> >>>> +        return FFA_RET_NOT_SUPPORTED;
> >>>> +    }
> >>>> +}
> >>>> +
> >>>> +static int32_t ffa_simple_call(uint32_t fid, register_t a1, registe=
r_t a2,
> >>>> +                               register_t a3, register_t a4)
> >>>> +{
> >>>> +    const struct arm_smccc_1_2_regs arg =3D {
> >>>> +        .a0 =3D fid,
> >>>> +        .a1 =3D a1,
> >>>> +        .a2 =3D a2,
> >>>> +        .a3 =3D a3,
> >>>> +        .a4 =3D a4,
> >>>> +    };
> >>>> +    struct arm_smccc_1_2_regs resp;
> >>>> +
> >>>> +    arm_smccc_1_2_smc(&arg, &resp);
> >>>> +
> >>>> +    return get_ffa_ret_code(&resp);
> >>>> +}
> >>>> +
> >>>> +static int32_t ffa_features(uint32_t id)
> >>>> +{
> >>>> +    return ffa_simple_call(FFA_FEATURES, id, 0, 0, 0);
> >>>> +}
> >>>> +
> >>>> +static bool check_mandatory_feature(uint32_t id)
> >>>> +{
> >>>> +    int32_t ret =3D ffa_features(id);
> >>>> +
> >>>> +    if (ret)
> >>>> +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing: e=
rror %d\n",
> >>>> +               id, ret);
> >>>> +
> >>>> +    return !ret;
> >>>> +}
> >>>> +
> >>>>  static uint16_t get_vm_id(const struct domain *d)
> >>>>  {
> >>>>      /* +1 since 0 is reserved for the hypervisor in FF-A */
> >>>> @@ -222,6 +272,57 @@ static void handle_version(struct cpu_user_regs=
 *regs)
> >>>>      set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> >>>>  }
> >>>>  +static void handle_msg_send_direct_req(struct cpu_user_regs *regs,=
 uint32_t fid)
> >>>> +{
> >>>> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> >>>> +    struct arm_smccc_1_2_regs resp =3D { };
> >>>> +    struct domain *d =3D current->domain;
> >>>> +    uint32_t src_dst;
> >>>> +    uint64_t mask;
> >>>> +
> >>>> +    if ( smccc_is_conv_64(fid) )
> >>>> +        mask =3D GENMASK_ULL(63, 0);
> >>>> +    else
> >>>> +        mask =3D GENMASK_ULL(31, 0);
> >>>> +
> >>>> +    src_dst =3D get_user_reg(regs, 1);
> >>>> +    if ( (src_dst >> 16) !=3D get_vm_id(d) )
> >>>> +    {
> >>>> +        resp.a0 =3D FFA_ERROR;
> >>>> +        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
> >>>> +        goto out;
> >>>> +    }
> >>>> +
> >>>> +    arg.a1 =3D src_dst;
> >>>> +    arg.a2 =3D get_user_reg(regs, 2) & mask;
> >>>> +    arg.a3 =3D get_user_reg(regs, 3) & mask;
> >>>> +    arg.a4 =3D get_user_reg(regs, 4) & mask;
> >>>> +    arg.a5 =3D get_user_reg(regs, 5) & mask;
> >>>> +    arg.a6 =3D get_user_reg(regs, 6) & mask;
> >>>> +    arg.a7 =3D get_user_reg(regs, 7) & mask;
> >>>> +
> >>>> +    arm_smccc_1_2_smc(&arg, &resp);
> >>>> +    switch ( resp.a0 )
> >>>> +    {
> >>>> +    case FFA_ERROR:
> >>>> +    case FFA_SUCCESS_32:
> >>>> +    case FFA_SUCCESS_64:
> >>>> +    case FFA_MSG_SEND_DIRECT_RESP_32:
> >>>> +    case FFA_MSG_SEND_DIRECT_RESP_64:
> >>>> +        break;
> >>>> +    default:
> >>>> +        /* Bad fid, report back. */
> >>>> +        memset(&arg, 0, sizeof(arg));
> >>>> +        arg.a0 =3D FFA_ERROR;
> >>>> +        arg.a1 =3D src_dst;
> >>>> +        arg.a2 =3D FFA_RET_ABORTED;
> >>>> +    }
> >>>> +
> >>>> +out:
> >>>> +    set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3=
 & mask,
> >>>> +             resp.a4 & mask, resp.a5 & mask, resp.a6 & mask, resp.a=
7 & mask);
> >>>> +}
> >>>> +
> >>>>  static bool ffa_handle_call(struct cpu_user_regs *regs)
> >>>>  {
> >>>>      uint32_t fid =3D get_user_reg(regs, 0);
> >>>> @@ -239,6 +340,10 @@ static bool ffa_handle_call(struct cpu_user_reg=
s *regs)
> >>>>      case FFA_ID_GET:
> >>>>          set_regs_success(regs, get_vm_id(d), 0);
> >>>>          return true;
> >>>> +    case FFA_MSG_SEND_DIRECT_REQ_32:
> >>>> +    case FFA_MSG_SEND_DIRECT_REQ_64:
> >>>> +        handle_msg_send_direct_req(regs, fid);
> >>>> +        return true;
> >>>>        default:
> >>>>          gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
> >>>> @@ -326,6 +431,13 @@ static bool ffa_probe(void)
> >>>>      printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> >>>>             major_vers, minor_vers);
> >>>>  +    /*
> >>>> +     * TODO save result of checked features and use that informatio=
n to
> >>>> +     * accept or reject requests from guests.
> >>>> +     */
> >>>
> >>> I am not entirely sure I understand this TODO. Does it mean a guest c=
an currently use a request that is not supported by FFA?
> >> In fact this is a bit the opposite: in the following patch we check th=
at all features we could need are supported but if a guest is only using a =
subset we might not need to have all of them.
> >> Idea of this TODO would be to save the features supported and refuse g=
uest requests depending on the features needed for them.
> >
> > Thanks. I would suggest the following comment:
> >
> > /*
> > * At the moment domains must supports the same features used by Xen.
> > * TODO: Rework the code to allow domain to use a subset of the features
> > * supported.
> > */
> >
> > Note that I am using "domains" rather than "guests" because the latter =
doesn't include dom0.
>
> Makes sense and new comment is nice.

That's better, I'll update it.

Thanks,
Jens

>
> Up to Jens to say if he is ok with it.
>
> Cheers
> Bertrand
>
> >
> > Cheers,
> >
> > --
> > Julien Grall
>
>

