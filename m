Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71486CB056E
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 15:54:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181807.1504797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSz6R-0002qx-LH; Tue, 09 Dec 2025 14:54:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181807.1504797; Tue, 09 Dec 2025 14:54:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSz6R-0002oQ-IP; Tue, 09 Dec 2025 14:54:11 +0000
Received: by outflank-mailman (input) for mailman id 1181807;
 Tue, 09 Dec 2025 14:54:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9j7=6P=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vSz6Q-0002oK-EA
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 14:54:10 +0000
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [2607:f8b0:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e90d5c4d-d50e-11f0-9cce-f158ae23cfc8;
 Tue, 09 Dec 2025 15:54:07 +0100 (CET)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-455749af2e1so477199b6e.1
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 06:54:07 -0800 (PST)
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
X-Inumbo-ID: e90d5c4d-d50e-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765292046; x=1765896846; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PtSKYdKsLvC0BkL/KUR7bFmUpaoVxk4mksRVHtUImPU=;
        b=ewsVtqh8zkRtpaDiKI9yj6BtenWi8Gx8Ck9LQLzwQkHhxQ5ues+hK0J4Ihxwx9iH2v
         VHJ6YhGCVh5c2014AwATPyXpTqSZ+bVNLFLdfYFj7Xx+vz65Geo9yN3jpuKr//AQGj/K
         2GEUJVYwoqzMe6RQu9lMOBx+yEQcE/0LYOvySP4T6BJ+paGZybycd6r1PlRK/6msjLpA
         hn4uqSovg3r5HSuV/X2w6CdfKp4Dcp0VovovSbY2VIJSY9BQC4W3zJ4ojkGgaXVcy+gG
         ulZrhiLd4eCMJQTYk+vlHW6usW9P/q1Bc1ZQ1ftBKO5QJdderQbU0nVH+UVNwhfUjg0C
         SW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765292046; x=1765896846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PtSKYdKsLvC0BkL/KUR7bFmUpaoVxk4mksRVHtUImPU=;
        b=d4QsTPmG8LnV2vAkuQ8kW2xBjCx7svy8duC47i/1Cmn2YX2g/uitQOxqt8nU6tw3zV
         vNs2OQ5pA1L8BC3Sh9GppuzxCAbZD26zxqawtV8q0/7GEurcyNQF4okM7GnCTT6DJ8cm
         9lZBGU9BpmXuW5yTLURPR3YTdiV7fIzTOtbva1hE/YiHjX90lAmF3sSpUmTF9Wdb1tA+
         7gz2z3CEW2Uq26yKcUKhwqBKqWIEGmDHfzBsF/E65rGv1Bxynz+hpsKhk/lDZk2QlZ4w
         2bkjU2HzU1n5MBFHWUPlZJQEHfGJijUVOCW6bkVGSbVw5cnLbalBxFkLXM5xGYkeonvU
         0X0A==
X-Gm-Message-State: AOJu0YzJnGQbFx3nFXGMYeSI8Gs+PwoiejrNP/4bOi6X9LfLHYfDdRix
	96pqK/P7xV5O8LmcNUIZkQKaBi4Ac7vMbzbRJ3AMIR1RxT90kH9zMA862yLc6hwzUkuXjqLGwXK
	9Xrb1QYyug0fZF3+Yk1guIP31H3v8vJ3j8SGpxN+jfg==
X-Gm-Gg: ASbGncu+dA5WEyNVCfnygUALsSbC+fywuaF/jx2tCX5rTkZMOgFuobNjqTPrk8bytzo
	aMvw8+261BB4FlxEl1++SocuV3cwrkzJLLthAQsld+eFU07Zq4nZe+SExdgGRp0zco5hDm8fW+1
	iilmTO6++jqRBBD3dUKuFK15U3YCV3CoK4uIjxQP145MdxAXHkUHCMJsGYSA9n3kLnDN32BJfGf
	tX58WVWC6lwcaUp7NTFcP6a8hKY9JzHBdQncZl8BBjQLMs7ilwdgMMU1MDvsZDSA760v6dB1a/w
	e81b3N2zuisKEbU0P/GokgJNxexj33reJhqM9R0+G5bYjtJ0wYoZBKnyv2P46w==
X-Google-Smtp-Source: AGHT+IGfo3a/ekLdUp4NC7ukgegFSt1yR8iQZkZbRYXsgd/vqcXJgZpXrnyyMQqmi/yVZmvGWoAMq/0aPfL1Fvi9YcE=
X-Received: by 2002:a05:6808:4fde:b0:450:89ee:922b with SMTP id
 5614622812f47-4557a989082mr590084b6e.22.1765292045745; Tue, 09 Dec 2025
 06:54:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764930353.git.bertrand.marquis@arm.com> <9e205ba6bdd6d053dfbf8cf7892d347512acdb2e.1764930353.git.bertrand.marquis@arm.com>
In-Reply-To: <9e205ba6bdd6d053dfbf8cf7892d347512acdb2e.1764930353.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 9 Dec 2025 15:53:54 +0100
X-Gm-Features: AQt7F2pI5IAj8CdnEAD1FrOZgEr0CvWaEscKc-EPkWcheQkN3ha5RjQ1w1CrxqY
Message-ID: <CAHUa44Gb3MCbyTmoqC6KN6GF5qBPJg3zXr2w3dojtVOV8deScQ@mail.gmail.com>
Subject: Re: [PATCH v1 09/12] xen/arm: ffa: Add FFA_RUN support
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: xen-devel@lists.xenproject.org, 
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bertrand,

On Fri, Dec 5, 2025 at 11:37=E2=80=AFAM Bertrand Marquis
<bertrand.marquis@arm.com> wrote:
>
> Add FFA_RUN support and remove mention that YIELD and INTERRUPT are not
> supported in the comment as we will now return them.
>
> Make FFA_FEATURE answer supported for RUN, YIELD and INTERRUPT.
>
> Share the SMCCC plumbing used by SEND_DIRECT and RUN via a common
> ffa_finish_direct_req_run() helper so canonical success and error cases
> are handled in one place.
>
> The dispatcher now routes FFA_RUN through ffa_handle_run(), and direct
> requests bail out early if a guest targets itself or a non-secure
> endpoint. This simplifies the direct path while adding support for
> INTERRUPT or YIELD answers from secure world.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v1:
> - Rework commit message to clearly mention that we add FFA_RUN support
> - Remove mentions of FFA_MSG_YIELD/INTERRUPT/RUN not being supported
> - Report YIELD, INTERRUPT an RUN as supported in ffa_features handling
> ---
>  xen/arch/arm/tee/ffa.c         |   9 ++-
>  xen/arch/arm/tee/ffa_msg.c     | 111 ++++++++++++++++++++++++---------
>  xen/arch/arm/tee/ffa_private.h |   1 +
>  3 files changed, 87 insertions(+), 34 deletions(-)

Looks good
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 2c09d10ae6a1..0f07efe5a7b3 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -24,9 +24,6 @@
>   * o FFA_MEM_DONATE_* and FFA_MEM_LEND_* - Used when tranferring ownersh=
ip
>   *   or access of a memory region
>   * o FFA_MSG_SEND2 and FFA_MSG_WAIT - Used for indirect messaging
> - * o FFA_MSG_YIELD
> - * o FFA_INTERRUPT - Used to report preemption
> - * o FFA_RUN
>   *
>   * Limitations in the implemented FF-A interfaces:
>   * o FFA_RXTX_MAP_*:
> @@ -266,6 +263,9 @@ static void handle_features(struct cpu_user_regs *reg=
s)
>      case FFA_MSG_SEND_DIRECT_REQ_32:
>      case FFA_MSG_SEND_DIRECT_REQ_64:
>      case FFA_MSG_SEND2:
> +    case FFA_RUN:
> +    case FFA_INTERRUPT:
> +    case FFA_MSG_YIELD:
>          ffa_set_regs_success(regs, 0, 0);
>          break;
>      case FFA_MEM_SHARE_64:
> @@ -353,6 +353,9 @@ static bool ffa_handle_call(struct cpu_user_regs *reg=
s)
>      case FFA_MSG_SEND_DIRECT_REQ_64:
>          ffa_handle_msg_send_direct_req(regs, fid);
>          return true;
> +    case FFA_RUN:
> +        ffa_handle_run(regs, fid);
> +        return true;
>      case FFA_MSG_SEND2:
>          e =3D ffa_handle_msg_send2(regs);
>          break;
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index d60eed6d8811..5a4cb1bb8295 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -21,42 +21,74 @@ struct ffa_part_msg_rxtx {
>      uint32_t msg_size;
>  };
>
> -void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t=
 fid)
> +static void ffa_finish_direct_req_run(struct cpu_user_regs *regs,
> +                                      struct arm_smccc_1_2_regs *req)
>  {
> -    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
>      struct arm_smccc_1_2_regs resp =3D { };
> -    struct domain *d =3D current->domain;
> -    uint32_t src_dst;
>      uint64_t mask;
>
> -    if ( smccc_is_conv_64(fid) )
> +    arm_smccc_1_2_smc(req, &resp);
> +
> +    switch ( resp.a0 )
> +    {
> +    case FFA_ERROR:
> +    case FFA_SUCCESS_32:
> +    case FFA_SUCCESS_64:
> +    case FFA_MSG_SEND_DIRECT_RESP_32:
> +    case FFA_MSG_SEND_DIRECT_RESP_64:
> +    case FFA_MSG_YIELD:
> +    case FFA_INTERRUPT:
> +        break;
> +    default:
> +        /* Bad fid, report back to the caller. */
> +        ffa_set_regs_error(regs, FFA_RET_ABORTED);
> +        return;
> +    }
> +
> +    if ( smccc_is_conv_64(resp.a0) )
>          mask =3D GENMASK_ULL(63, 0);
>      else
>          mask =3D GENMASK_ULL(31, 0);
>
> +    ffa_set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 =
& mask,
> +                 resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
> +                 resp.a7 & mask);
> +}
> +
> +void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t=
 fid)
> +{
> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> +    struct domain *d =3D current->domain;
> +    uint32_t src_dst;
> +    uint64_t mask;
> +    int32_t ret;
> +
>      if ( !ffa_fw_supports_fid(fid) )
>      {
> -        resp.a0 =3D FFA_ERROR;
> -        resp.a2 =3D FFA_RET_NOT_SUPPORTED;
> +        ret =3D FFA_RET_NOT_SUPPORTED;
>          goto out;
>      }
>
>      src_dst =3D get_user_reg(regs, 1);
> -    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) )
> +    if ( (src_dst >> 16) !=3D ffa_get_vm_id(d) ||
> +         (src_dst & GENMASK(15,0)) =3D=3D ffa_get_vm_id(d) )
>      {
> -        resp.a0 =3D FFA_ERROR;
> -        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
>          goto out;
>      }
>
>      /* we do not support direct messages to VMs */
>      if ( !FFA_ID_IS_SECURE(src_dst & GENMASK(15,0)) )
>      {
> -        resp.a0 =3D FFA_ERROR;
> -        resp.a2 =3D FFA_RET_NOT_SUPPORTED;
> +        ret =3D FFA_RET_NOT_SUPPORTED;
>          goto out;
>      }
>
> +    if ( smccc_is_conv_64(fid) )
> +        mask =3D GENMASK_ULL(63, 0);
> +    else
> +        mask =3D GENMASK_ULL(31, 0);
> +
>      arg.a1 =3D src_dst;
>      arg.a2 =3D get_user_reg(regs, 2) & mask;
>      arg.a3 =3D get_user_reg(regs, 3) & mask;
> @@ -65,27 +97,11 @@ void ffa_handle_msg_send_direct_req(struct cpu_user_r=
egs *regs, uint32_t fid)
>      arg.a6 =3D get_user_reg(regs, 6) & mask;
>      arg.a7 =3D get_user_reg(regs, 7) & mask;
>
> -    arm_smccc_1_2_smc(&arg, &resp);
> -    switch ( resp.a0 )
> -    {
> -    case FFA_ERROR:
> -    case FFA_SUCCESS_32:
> -    case FFA_SUCCESS_64:
> -    case FFA_MSG_SEND_DIRECT_RESP_32:
> -    case FFA_MSG_SEND_DIRECT_RESP_64:
> -        break;
> -    default:
> -        /* Bad fid, report back to the caller. */
> -        memset(&resp, 0, sizeof(resp));
> -        resp.a0 =3D FFA_ERROR;
> -        resp.a1 =3D src_dst;
> -        resp.a2 =3D FFA_RET_ABORTED;
> -    }
> +    ffa_finish_direct_req_run(regs, &arg);
> +    return;
>
>  out:
> -    ffa_set_regs(regs, resp.a0, resp.a1 & mask, resp.a2 & mask, resp.a3 =
& mask,
> -                 resp.a4 & mask, resp.a5 & mask, resp.a6 & mask,
> -                 resp.a7 & mask);
> +    ffa_set_regs_error(regs, ret);
>  }
>
>  static int32_t ffa_msg_send2_vm(uint16_t dst_id, const void *src_buf,
> @@ -217,3 +233,36 @@ out:
>      ffa_tx_release(src_ctx);
>      return ret;
>  }
> +
> +void ffa_handle_run(struct cpu_user_regs *regs, uint32_t fid)
> +{
> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> +    uint32_t dst =3D get_user_reg(regs, 1);
> +    int32_t ret;
> +
> +    if ( !ffa_fw_supports_fid(fid) )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
> +
> +    /*
> +     * We do not support FFA_RUN to VMs.
> +     * Destination endpoint ID is in bits [31:16], bits[15:0] contain th=
e
> +     * vCPU ID.
> +     */
> +    if ( !FFA_ID_IS_SECURE(dst >> 16) )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
> +
> +    arg.a1 =3D dst;
> +
> +    ffa_finish_direct_req_run(regs, &arg);
> +
> +    return;
> +
> +out:
> +    ffa_set_regs_error(regs, ret);
> +}
> diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_privat=
e.h
> index d883114948b1..030e6724743c 100644
> --- a/xen/arch/arm/tee/ffa_private.h
> +++ b/xen/arch/arm/tee/ffa_private.h
> @@ -474,6 +474,7 @@ static inline void ffa_raise_rx_buffer_full(struct do=
main *d)
>
>  void ffa_handle_msg_send_direct_req(struct cpu_user_regs *regs, uint32_t=
 fid);
>  int32_t ffa_handle_msg_send2(struct cpu_user_regs *regs);
> +void ffa_handle_run(struct cpu_user_regs *regs, uint32_t fid);
>
>  #ifdef CONFIG_FFA_VM_TO_VM
>  static inline uint16_t get_ffa_vm_count(void)
> --
> 2.51.2
>

