Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3C2CB063F
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 16:23:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181851.1504838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzXy-00008m-J0; Tue, 09 Dec 2025 15:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181851.1504838; Tue, 09 Dec 2025 15:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSzXy-00005Q-EU; Tue, 09 Dec 2025 15:22:38 +0000
Received: by outflank-mailman (input) for mailman id 1181851;
 Tue, 09 Dec 2025 15:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R9j7=6P=linaro.org=jens.wiklander@srs-se1.protection.inumbo.net>)
 id 1vSzXx-00005K-5V
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 15:22:37 +0000
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [2607:f8b0:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e37c1074-d512-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 16:22:35 +0100 (CET)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-45090ef26c6so1664352b6e.2
 for <xen-devel@lists.xenproject.org>; Tue, 09 Dec 2025 07:22:35 -0800 (PST)
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
X-Inumbo-ID: e37c1074-d512-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765293754; x=1765898554; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujd9WVCGq6lmwU+W36A6T6c65HBI1XeVyX0ybbUAKYE=;
        b=JfTy03lUw01wFWbEbXPQnaq2T7NpSYrCrqkg/QBwPhlCPIE6C4X8ks5Mxz6lnDRwje
         J8u8V5zAR3G3AtGSWn7Hk8zd/r16+2iKaWVIkrw1DOgcCmsq2z5CwSXTHN1OVVVMrIxA
         +jvQUrat7AL+h3C5NUP10zq3widn+xFLwE6GkhbOLpzU5Uc73/99a/BuECZxzLYH/ORR
         T6QsIcCswXvWWLrQuYB3HVh0GqA5iJw8vNG1b51EmJbFgLYg20ynidUc6TKeS1FPMYU2
         h6fEjQo9CF3XXQVH7r8JB4HteUNn6HUk4RPpOtz1y7CfV3u8U4vwZVl0jCGsvuR6ubjL
         cE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765293754; x=1765898554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ujd9WVCGq6lmwU+W36A6T6c65HBI1XeVyX0ybbUAKYE=;
        b=t8CSObEkhUq9cDS7f+FcNFpimLW+c5j5DTwgMsGjSVQKjzzsGo2WLh//9QgEuWgYv+
         NXQ+UjEVm3on76nCRm3NRRozYEWD/MX7meL6LekKw9qCNN9HFdDBgxjLbQkLEwvkBo4h
         8YrVKBtvwlzBE5cBFR9G+2p7G7DHzlEKfr3LyxUasmQVQVgIMMW9WqI87rIJzk7KKECW
         A0lXs0zKPtCk9GxUkqpCGl35TfadtYxct1VjgPBcJkwXq0l+uBeY2Gll6hvdYUL567GX
         7YxHy3K3MnnZjlB0lXuP3Ma/HNPNq7igUrbT/w4gkP2M3MHxjn8InlyQspvmFHQVzJz5
         eovA==
X-Gm-Message-State: AOJu0YxpGvjiudXtAaAg6b3wD7L17UBHkN4zCow/CIO3nMQzeDR0UDuo
	CPGoEINIpFVTSVMJKnk5PGWrJEEVRsWVrc3FQ/JacNk/v8f184Z5YSPO6A6G2lVT3TutTed9u4C
	zxSYym0+JUG/QCvtDSHTheGQyPPJztz9hSmk9R883MQ==
X-Gm-Gg: ASbGnctFQl5VVyF2aeJF/wokxipMhnsb2cwG00MFdPfT7yEgfX23JCysDB5uoG/xL/L
	HuxC5QNrDr7l54+uP4m4qntWWHhwQNMY+f+TIUxlOtaQf3ZBEwqiesmYRjAjN44aNYwcrPAWKD4
	3fs4l3MAu0q6RWC1LolFuh3MJx/aAUYDQyMTVoTVebqJZuh0AK7ohHAddbTjALFyeC7j4SSUfu+
	N8mV7hlo1JcNyvGhJ+3rTFW0h/TtTJGU5yIDFpoMndmvcnPOx6YdIhHQrngMl//NoDBdJWRT3kH
	WjjTgPdnVEguBJlmo7NtI5jNi9CH/d1fUXKD+PqT2h+AcjkHW9kkkWrRN/geXKocvg9hL7Ua
X-Google-Smtp-Source: AGHT+IHEWzhRh4IYErCmLYX0ClzF1H72e6SGrFqmxeL22S6Djt+UxuXsrNbtQpUn25IQ/eJP1M6r3xT1jmBu16p0Q1k=
X-Received: by 2002:a05:6808:6f87:b0:442:2ce:46cf with SMTP id
 5614622812f47-4539e08f38emr4837979b6e.34.1765293754417; Tue, 09 Dec 2025
 07:22:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764930353.git.bertrand.marquis@arm.com> <55a3df6c73581e7e77a76230cd445ccb16608269.1764930353.git.bertrand.marquis@arm.com>
In-Reply-To: <55a3df6c73581e7e77a76230cd445ccb16608269.1764930353.git.bertrand.marquis@arm.com>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Tue, 9 Dec 2025 16:22:23 +0100
X-Gm-Features: AQt7F2rb6vDZtFGhkqEM-eWWiY1imgFjI7YWo1I8B_pWDlNdlHcCklbO8MkDde4
Message-ID: <CAHUa44Ee+foLY-w7NCENzEWWJks54dpK4ijSs9SwD6OgnYtRMg@mail.gmail.com>
Subject: Re: [PATCH v1 11/12] xen/arm: ffa: add MSG_SEND_DIRECT_REQ2 support
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
> Extend the direct-request path so FF-A v1.2 guests can issue
> FFA_MSG_SEND_DIRECT_REQ2 and receive the matching RESP2.
>
> The handler now marshals registers x8=E2=80=93x17, and
> ffa_finish_direct_req_run() copies back the 17-register response used by
> FFA_MSG_SEND_DIRECT_RESP2. The new opcode is exposed via FFA_FEATURES
> and gated on guests that negotiated v1.2.
>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
> Changes in v1:
> - use ACCESS_ONCE to read guest_vers
> ---
>  xen/arch/arm/tee/ffa.c     | 20 +++++++++++++++++++
>  xen/arch/arm/tee/ffa_msg.c | 39 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 59 insertions(+)

Looks good.
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>

Cheers,
Jens

>
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 0f07efe5a7b3..2c6443a7f6a4 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -237,6 +237,8 @@ out_continue:
>  static void handle_features(struct cpu_user_regs *regs)
>  {
>      uint32_t a1 =3D get_user_reg(regs, 1);
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.tee;
>      unsigned int n;
>
>      for ( n =3D 2; n <=3D 7; n++ )
> @@ -268,6 +270,16 @@ static void handle_features(struct cpu_user_regs *re=
gs)
>      case FFA_MSG_YIELD:
>          ffa_set_regs_success(regs, 0, 0);
>          break;
> +    case FFA_MSG_SEND_DIRECT_REQ2:
> +        if ( ACCESS_ONCE(ctx->guest_vers) >=3D FFA_VERSION_1_2 )
> +        {
> +            ffa_set_regs_success(regs, 0, 0);
> +        }
> +        else
> +        {
> +            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
> +        }
> +        break;
>      case FFA_MEM_SHARE_64:
>      case FFA_MEM_SHARE_32:
>          /*
> @@ -353,6 +365,14 @@ static bool ffa_handle_call(struct cpu_user_regs *re=
gs)
>      case FFA_MSG_SEND_DIRECT_REQ_64:
>          ffa_handle_msg_send_direct_req(regs, fid);
>          return true;
> +    case FFA_MSG_SEND_DIRECT_REQ2:
> +        if ( ACCESS_ONCE(ctx->guest_vers) >=3D FFA_VERSION_1_2 )
> +        {
> +            ffa_handle_msg_send_direct_req(regs, fid);
> +            return true;
> +        }
> +        e =3D FFA_RET_NOT_SUPPORTED;
> +        break;
>      case FFA_RUN:
>          ffa_handle_run(regs, fid);
>          return true;
> diff --git a/xen/arch/arm/tee/ffa_msg.c b/xen/arch/arm/tee/ffa_msg.c
> index c3552a3ae36d..4e26596461a9 100644
> --- a/xen/arch/arm/tee/ffa_msg.c
> +++ b/xen/arch/arm/tee/ffa_msg.c
> @@ -49,6 +49,30 @@ static void ffa_finish_direct_req_run(struct cpu_user_=
regs *regs,
>      case FFA_MSG_YIELD:
>      case FFA_INTERRUPT:
>          break;
> +    case FFA_MSG_SEND_DIRECT_RESP2:
> +        /*
> +         * REQ2 / RESP2 use a 17-register payload (x1=E2=80=93x17). Copy=
 all of them
> +         * back to the guest context.
> +         */
> +        set_user_reg(regs, 0, resp.a0);
> +        set_user_reg(regs, 1, resp.a1);
> +        set_user_reg(regs, 2, resp.a2);
> +        set_user_reg(regs, 3, resp.a3);
> +        set_user_reg(regs, 4, resp.a4);
> +        set_user_reg(regs, 5, resp.a5);
> +        set_user_reg(regs, 6, resp.a6);
> +        set_user_reg(regs, 7, resp.a7);
> +        set_user_reg(regs, 8, resp.a8);
> +        set_user_reg(regs, 9, resp.a9);
> +        set_user_reg(regs, 10, resp.a10);
> +        set_user_reg(regs, 11, resp.a11);
> +        set_user_reg(regs, 12, resp.a12);
> +        set_user_reg(regs, 13, resp.a13);
> +        set_user_reg(regs, 14, resp.a14);
> +        set_user_reg(regs, 15, resp.a15);
> +        set_user_reg(regs, 16, resp.a16);
> +        set_user_reg(regs, 17, resp.a17);
> +        return;
>      default:
>          /* Bad fid, report back to the caller. */
>          ffa_set_regs_error(regs, FFA_RET_ABORTED);
> @@ -107,6 +131,21 @@ void ffa_handle_msg_send_direct_req(struct cpu_user_=
regs *regs, uint32_t fid)
>      arg.a6 =3D get_user_reg(regs, 6) & mask;
>      arg.a7 =3D get_user_reg(regs, 7) & mask;
>
> +    if ( fid =3D=3D FFA_MSG_SEND_DIRECT_REQ2 )
> +    {
> +        /* 17 registers are used for REQ2 */
> +        arg.a8 =3D get_user_reg(regs, 8);
> +        arg.a9 =3D get_user_reg(regs, 9);
> +        arg.a10 =3D get_user_reg(regs, 10);
> +        arg.a11 =3D get_user_reg(regs, 11);
> +        arg.a12 =3D get_user_reg(regs, 12);
> +        arg.a13 =3D get_user_reg(regs, 13);
> +        arg.a14 =3D get_user_reg(regs, 14);
> +        arg.a15 =3D get_user_reg(regs, 15);
> +        arg.a16 =3D get_user_reg(regs, 16);
> +        arg.a17 =3D get_user_reg(regs, 17);
> +    }
> +
>      ffa_finish_direct_req_run(regs, &arg);
>      return;
>
> --
> 2.51.2
>

